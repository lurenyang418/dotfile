#!/bin/bash
set -e

info() { 
    echo -e "\033[34m[INFO] $1\033[0m"; 
}
success() { 
    echo -e "\033[32m[SUCCESS] $1\033[0m"; 
}
error() { 
    echo -e "\033[31m[ERROR] $1\033[0m"; exit 1; 
}

# ============================
# 第一步：强校验系统（仅 Ubuntu）
# ============================
info "===== 校验系统 ====="
if ! grep -qi "ubuntu" /etc/os-release; then
  error "当前系统不是 Ubuntu，本脚本仅支持 Ubuntu"
fi
info "✅ 系统校验通过（Ubuntu）"

# ============================
# 第二步：更新 apt 源（确保安装成功）
# ============================
info "===== 更新 apt 源 ====="
sudo apt update -y

# ============================
# 第三步：安装 Bash 核心依赖
# ============================
info "===== 安装 Bash 核心依赖 ====="
# bash-completion：Bash 原生补全（历史/命令补全）
# vim：确保 Vi Mode 依赖完整
sudo apt install -y bash-completion vim
success "Bash 依赖安装完成"

# ============================
# 第四步：安装 Starship（跨平台提示符）
# ============================
info "===== 安装 Starship ====="
if ! command -v starship &> /dev/null; then
  # Starship 官方一键安装（适配 Ubuntu，无冗余）
  curl -sS https://starship.rs/install.sh | sh -s -- -y
else
  info "Starship 已安装，跳过"
fi

# ============================
# 第五步：备份原有 .bashrc
# ============================
info "===== 备份原有 .bashrc ====="
CONFIG_FILE=~/.bashrc
BACKUP_FILE=${CONFIG_FILE}.backup.$(date +%Y%m%d%H%M%S)
if [ -f "$CONFIG_FILE" ]; then
  cp "$CONFIG_FILE" "$BACKUP_FILE"
  info "原有 .bashrc 已备份到：$BACKUP_FILE"
fi

# ============================
# 第六步：写入 Bash 极简配置（仅 Vi Mode + Starship + 补全）
# ============================
info "===== 写入 Bash 专属配置 ====="
cat > "$CONFIG_FILE" << 'EOF'
# vi-mode 
set -o vi 
export KEYTIMEOUT=1 

# bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
fi

# starship 
eval "$(starship init bash)"
EOF

# ============================
# 第七步：生效配置
# ============================
info "===== 生效配置 ====="
source "$CONFIG_FILE"

success "===== 全部配置完成！====="
success "\n请重启终端，或执行 source ~/.bashrc 体验效果～"