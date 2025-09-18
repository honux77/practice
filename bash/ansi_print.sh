#!/usr/bin/env bash

RESET="\033[0m"
BLUE="\033[1;34m"   # Info
YELLOW="\033[1;33m" # Warn
RED="\033[1;31m"    # Error
CYAN="\033[1;36m"   # Debug

log_info() {
  printf "${BLUE}[INFO]${RESET} %s\n" "$*"
}

log_warn() {
  printf "${YELLOW}[WARN]${RESET} %s\n" "$*"
}

log_error() {
  printf "${RED}[ERROR]${RESET} %s\n" "$*"
}

log_debug() {
  printf "${CYAN}[DEBUG]${RESET} %s\n" "$*"
}

# 사용 예시
log_info  "서버가 시작되었습니다."
log_warn  "메모리 사용량이 높습니다."
log_error "데이터베이스 연결 실패!"
log_debug "쿼리 실행 시간: 123ms"
