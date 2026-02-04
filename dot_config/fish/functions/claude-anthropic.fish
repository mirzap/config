function claude-anthropic -d "Switch to Anthropic Claude (default) and launch"
    set -e ANTHROPIC_BASE_URL
    set -e ANTHROPIC_AUTH_TOKEN
    set -e ANTHROPIC_DEFAULT_OPUS_MODEL
    set -e ANTHROPIC_DEFAULT_SONNET_MODEL
    set -e ANTHROPIC_DEFAULT_HAIKU_MODEL
    set -e API_TIMEOUT_MS
    echo "Switched to Anthropic Claude (default)"
    claude $argv
end
