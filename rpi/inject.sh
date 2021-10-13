#!/usr/bin/env bash

set -e
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

main()
{
    parse_args "$@"
    validation
    mount_image
    inject_files
    cleanup
}

parse_args()
{
    for i in "$@"; do
        case $i in
            -i=*|--image=*)
            IMAGE="${i#*=}"
            shift # past argument=value
            ;;
            *)    # unknown option
            echo "Unrecognized flag: $1"
            exit 1
            ;;
        esac
    done
}

validation()
{
    ERRORS=""

    if [[ "$(id -u)" != 0 ]]; then
        echo "This script requires sudo/root."
        ERRORS="yes"
    fi

    if [[ -z $IMAGE ]] || [[ ! -f $IMAGE ]]; then
        echo "Image file does not exist."
        ERRORS="yes"
    fi

    if [[ -n $ERRORS ]]; then
        exit 1
    fi
}

mount_image()
{
    devices="$(kpartx -l "$IMAGE")"
    boot_device=($(echo "$devices" | sed -n '1p'))
    writeable_device=($(echo "$devices" | sed -n '2p'))

    echo "Creating temporary folder /tmp/boot"
    mkdir -p "/tmp/boot"
    echo "Creating temporary folder /tmp/writeable"
    mkdir -p "/tmp/writeable"

    echo "Creating partition maps for $IMAGE"
    kpartx -a "$IMAGE"

    echo "Mounting /dev/mapper/${boot_device[0]} to /tmp/boot"
    mount "/dev/mapper/${boot_device[0]}" /tmp/boot
    echo "Mounting /dev/mapper/${writeable_device[0]} to /tmp/writeable"
    mount "/dev/mapper/${writeable_device[0]}" /tmp/writeable
}

inject_files()
{
    for file in "$SCRIPT_DIR"/boot/*; do
        basename=$(basename "$file")
        new_file=$(echo "$basename" | tr ',' '/')
        echo "Writing $file to /tmp/boot/$new_file"
        cat "$file" > "/tmp/boot/$new_file"
    done

    for file in "$SCRIPT_DIR"/writeable/*; do
        basename=$(basename "$file")
        new_file=$(echo "$basename" | tr ',' '/')
        echo "Writing $file to /tmp/writeable/$new_file"
        cat "$file" > "/tmp/writeable/$new_file"
    done
}

cleanup()
{
    echo "Unmounting /tmp/boot"
    umount /tmp/boot
    echo "Unmounting /tmp/writeable"
    umount /tmp/writeable

    echo "Removing partition maps for $IMAGE"
    kpartx -d "$IMAGE"

    echo "Removing temporary folder /tmp/boot"
    rm -rf /tmp/boot
    echo "Removing temporary folder /tmp/writeable"
    rm -rf /tmp/writeable
}

main "$@"
