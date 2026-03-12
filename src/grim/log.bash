

# Color codes
_GRIM_LOG_COLOR_RESET=$'\033[0m'
_GRIM_LOG_COLOR_BLUE=$'\033[34m'
_GRIM_LOG_COLOR_YELLOW=$'\033[33m'
_GRIM_LOG_COLOR_RED=$'\033[31m'

_grim_log_timestamp() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')]"
}

_grim_log_info() {
    echo "${_GRIM_LOG_COLOR_BLUE}$(_grim_log_timestamp) [INFO]${_GRIM_LOG_COLOR_RESET} $1"
}

_grim_log_warn() {
    echo "${_GRIM_LOG_COLOR_YELLOW}$(_grim_log_timestamp) [WARN]${_GRIM_LOG_COLOR_RESET} $1" >&2
}

_grim_log_error() {
    echo "${_GRIM_LOG_COLOR_RED}$(_grim_log_timestamp) [ERROR]${_GRIM_LOG_COLOR_RESET} $1" >&2
}

_grim_log_die() {
    _grim_log_error "$1"
    # If running as a script, exit. If sourced, just return.
    if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
        exit 1
    else
        return 1
    fi
}