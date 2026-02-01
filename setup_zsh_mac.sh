#!/bin/bash
set -e  # 出错立即停止执行

# ============================
# M系列芯片(macOS)专属 Zsh 配置脚本 极简配置
# ============================

# 颜色输出函数
info() {
  echo -e "\033[34m[INFO] $1\033[0m"
}
success() {
  echo -e "\033[32m[SUCCESS] $1\033[0m"
}
error() {
  echo -e "\033[31m[ERROR] $1\033[0m"
  exit 1
}

info "===== 校验操作系统 ====="
OS_NAME=$(uname -s)
if [[ "$OS_NAME" != "Darwin" ]]; then
  error "当前系统是 $OS_NAME，本脚本仅支持 macOS 系统！"
fi
info "✅ 操作系统校验通过（macOS）"

info "===== 校验芯片架构 ====="
CPU_ARCH=$(uname -m)
if [[ "$CPU_ARCH" != "arm64" ]]; then
  error "当前芯片架构是 $CPU_ARCH，本脚本仅支持 M 系列芯片（arm64）的 Mac！"
fi
info "✅ 芯片架构校验通过（M 系列芯片）"

# 第三步：检测并安装 Homebrew（无硬编码路径）
info "===== 检测 Homebrew ====="
if ! command -v brew &> /dev/null; then
  info "Homebrew 未安装，开始自动安装..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # 加载 brew 环境（动态路径，无需硬编码）
  eval "$(brew shellenv)"
  success "Homebrew 安装完成（动态路径：$(brew --prefix)）"
else
  # 确保 brew 环境已加载
  eval "$(brew shellenv)"
  info "Homebrew 已安装（路径：$(brew --prefix)），跳过"
fi

# 第四步：用 brew 安装 Starship（动态路径）
info "===== 检测 Starship ====="
if ! brew list starship &> /dev/null; then
  info "Starship 未安装，开始用 brew 安装..."
  brew install starship
  success "Starship 安装完成"
else
  info "Starship 已安装，跳过"
fi

# 第五步：用 brew 安装 zsh-autosuggestions（动态路径）
info "===== 检测 zsh-autosuggestions ====="
if ! brew list zsh-autosuggestions &> /dev/null; then
  info "zsh-autosuggestions 未安装，开始用 brew 安装..."
  brew install zsh-autosuggestions
  success "zsh-autosuggestions 安装完成"
else
  info "zsh-autosuggestions 已安装，跳过"
fi

# 第六步：备份原有 .zshrc
info "===== 备份原有 .zshrc ====="
BACKUP_FILE=~/.zshrc.backup.$(date +%Y%m%d%H%M%S)
if [[ -f ~/.zshrc ]]; then
  cp ~/.zshrc $BACKUP_FILE
  info "原有 .zshrc 已备份到：$BACKUP_FILE"
fi

# 第七步：写入无硬编码的核心配置到 .zshrc
info "===== 写入 M 芯片专属配置到 .zshrc ====="
cat > ~/.zshrc << EOF
# 1. vi-mode 
bindkey -v
export KEYTIMEOUT=1

# 2. brew config 
eval "\$(brew shellenv)"

# 3. zsh-autosuggestions 
source \$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 4. starship
eval "\$(starship init zsh)"
EOF

# 第八步：生效配置
info "===== 生效配置 ====="
source ~/.zshrc

success "===== 全部配置完成！====="
success "\n请重启终端，或执行 source ~/.zshrc 体验配置效果～"