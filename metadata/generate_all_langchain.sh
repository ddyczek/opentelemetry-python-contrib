#!/bin/bash


INSTRUMENTATION_DIR="./instrumentation"
SCRIPT_PATH=".metadata/metadata_generator.py"


for dir in "$INSTRUMENTATION_DIR"/opentelemetry-instrumentation-*/; do
    if [ -d "$dir" ]; then
        instrumentation_name=$(basename "$dir")
        
        if python3 "$SCRIPT_PATH" "$dir"; then
            echo "   ✅ $instrumentation_name"
        else
            echo "   ❌ $instrumentation_name"
        fi
        
        # RATE LIMITING: Wait 15 seconds between requests
        sleep 15
    fi
done
