PATCHED=false

# Single Take fix (pre-API 35)
if [ "$TARGET_PLATFORM_SDK_VERSION" -lt "35" ]; then
    if [ ! -d "$WORK_DIR/vendor/etc/singletake/ClarityScorer" ]; then
        PATCHED=true
        if [ -d "$WORK_DIR/vendor/etc/singletake/aifilter" ]; then
            DELETE_FROM_WORK_DIR "vendor" "etc/singletake/aifilter"
        fi
        if [ -d "$WORK_DIR/vendor/etc/singletake/bestmoment" ]; then
            DELETE_FROM_WORK_DIR "vendor" "etc/singletake/bestmoment"
        fi
        ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" \
            "etc/singletake/ClarityScorer" 0 2000 755 "u:object_r:vendor_configs_file:s0"
    fi
fi

if ! $PATCHED; then
    LOG "\033[0;33m! Nothing to do\033[0m"
fi

unset PATCHED
