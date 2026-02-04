function claude-status -d "Check current Claude Code configuration"
    echo "Current Claude Code Configuration:"
    if set -q ANTHROPIC_BASE_URL
        echo "  BASE_URL: $ANTHROPIC_BASE_URL"
    else
        echo "  BASE_URL: [default Anthropic]"
    end
    if set -q ANTHROPIC_AUTH_TOKEN
        echo "  AUTH_TOKEN: [set]"
    else
        echo "  AUTH_TOKEN: [unset]"
    end
    if set -q ANTHROPIC_DEFAULT_OPUS_MODEL
        echo "  OPUS: $ANTHROPIC_DEFAULT_OPUS_MODEL"
    else
        echo "  OPUS: [default]"
    end
    if set -q ANTHROPIC_DEFAULT_SONNET_MODEL
        echo "  SONNET: $ANTHROPIC_DEFAULT_SONNET_MODEL"
    else
        echo "  SONNET: [default]"
    end
    if set -q ANTHROPIC_DEFAULT_HAIKU_MODEL
        echo "  HAIKU: $ANTHROPIC_DEFAULT_HAIKU_MODEL"
    else
        echo "  HAIKU: [default]"
    end
end
