#!/bin/sh
# -----------------------------------------------------------------------------
# This script downloads remote artifact into the same folder as the script is
# located.
# -----------------------------------------------------------------------------
set -e
set +v
# -----------------------------------------------------------------------------
# Global config
# -----------------------------------------------------------------------------
LIB_NAME='WultraActivationSpawn'
LIB_BASE_URL="https://wultra.jfrog.io/artifactory/activation-spawn-apple-release"

# -----------------------------------------------------------------------------
# Helper functions
# -----------------------------------------------------------------------------
function FAILURE {
    echo "$CMD: Error: $@" 1>&2
    exit 1
}
function WARNING {
    echo "$CMD: Warning: $@" 1>&2
}
function SHA256 {
    local HASH=( `shasum -a 256 "$1"` )
    echo ${HASH[0]}
}
function REQUIRE_COMMAND {
    set +e
    local tool=$1
    local path=`which $tool`
    if [ -z $path ]; then
        FAILURE "$tool: required command not found."
    fi
    set -e
}
function LOG {
    echo "$CMD: $@"
}
# -----------------------------------------------------------------------------
# Script's "main"
# -----------------------------------------------------------------------------

CMD=$(basename $0)
TOP="`( cd \"$TOP\" && pwd )`"

LIB_VERSION="$1"
ARTIFACT_HASH="$2"

# Initial checks
if [ -z "$TOP" ]; then
    FAILURE "Current dir is not accessible."
fi
if [ -z "${LIB_VERSION}" ] || [ -z "${ARTIFACT_HASH}" ]; then
    FAILURE "Usage: $CMD lib_version artifact_hash"
fi

REQUIRE_COMMAND unzip
REQUIRE_COMMAND wget

LIB_FW="${LIB_NAME}.xcframework"
LIB_ARCHIVE="${LIB_NAME}-${LIB_VERSION}.xcframework.zip"

pushd "$TOP" > /dev/null

# Test whether the archive is already downloaded
if [ -f "${LIB_ARCHIVE}" ]; then
    LOCAL_HASH=$(SHA256 "${LIB_ARCHIVE}")
    if [ "x${LOCAL_HASH}" != "x${ARTIFACT_HASH}" ]; then
        WARNING "Local hash is wrong, removing downloaded archive."
        rm "$LIB_ARCHIVE"
    else
        LOG "Archive is already downloaded."
    fi
fi
# Download archive from remote artifactory, if it's not available.
if [ ! -f "$LIB_ARCHIVE" ]; then
    LOG "Downloading archive from the remote artifactory..."
    wget -nv "$LIB_BASE_URL/$LIB_ARCHIVE"
    if [ ! -f "$LIB_ARCHIVE" ]; then
        FAILURE "Failed to download $LIB_ARCHIVE from the remote artifactory."
    fi
    LOCAL_HASH=$(SHA256 "${LIB_ARCHIVE}")
    if [ "x${LOCAL_HASH}" != "x${ARTIFACT_HASH}" ]; then
        FAILURE "Downloaded $LIB_ARCHIVE has wrong hash."
    fi
fi
# Cleanup possible framework dir and extract downloaded archive
LOG "Preparing $LIB_FW"
if [ -d "$LIB_FW" ]; then
    rm -r "$LIB_FW"
fi
unzip -q "$LIB_ARCHIVE"
if [ ! -d "$LIB_FW" ]; then
    FAILURE "Failed to extract $LIB_FW from downloaded archive."
fi

popd > /dev/null # "$TOP"

LOG "OK"
exit 0