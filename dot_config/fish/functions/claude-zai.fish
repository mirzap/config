function claude-zai -d "Switch to Z.ai provider and launch"
    set -gx ANTHROPIC_BASE_URL "https://api.z.ai/api/anthropic"
    set -gx ANTHROPIC_AUTH_TOKEN $CLAUDE_ZAI_TOKEN
    set -gx ANTHROPIC_DEFAULT_OPUS_MODEL "GLM-4.6"
    set -gx ANTHROPIC_DEFAULT_SONNET_MODEL "GLM-4.6"
    set -gx ANTHROPIC_DEFAULT_HAIKU_MODEL "GLM-4.5-Air"
    set -gx API_TIMEOUT_MS "3000000"
    echo "Switched to Z.ai provider"
    claude $argv
end
