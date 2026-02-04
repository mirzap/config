function claude-kimi -d "Switch to Kimi provider and launch"
    set -gx ANTHROPIC_BASE_URL "https://api.kimi.com/coding/"
    set -gx ANTHROPIC_AUTH_TOKEN $CLAUDE_KIMI_TOKEN
    # Adjust model names based on Kimi's available models if needed
    # set -gx ANTHROPIC_DEFAULT_OPUS_MODEL "kimi-k2-thinking"
    # set -gx ANTHROPIC_DEFAULT_SONNET_MODEL "claude-sonnet-4-20250514"
    # set -gx ANTHROPIC_DEFAULT_HAIKU_MODEL "claude-3-5-haiku-20241022"
    echo "Switched to Kimi provider"
    claude $argv
end
