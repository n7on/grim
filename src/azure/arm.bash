
_azure_arm_get_subscriptions() {
    _grim_command_complete_filter "${AZURE_SUBSCRIPTIONS}" "$1"
}

# Register parameter with completer for subscriptions
_grim_command_complete_params "azure_arm_subscription" "subscription" "_azure_arm_get_subscriptions"

azure_arm_subscription() {
    _grim_command_param_init subscription
    _grim_command_param_parse "$@"
    
    _grim_command_param_validate subscription --required --regex "[^0-9]" || return 1
    
    az account set --subscription "$subscription"
}
