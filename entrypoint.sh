#!/bin/sh
set -e  # Bail if anything fails

# First arg is `-f` or `--some-option`
if [ "${1:0:1}" = '-' ]; then
  set -- /opt/studio/bin/server.sh "$@"
fi

# If we're running the studio server command as root, run as the studio user instead
if [ "$1" = '/opt/studio/bin/server.sh' -a "$(id -u)" = '0' ]; then
  chown -R studio /opt/studio
  exec gosu studio /entrypoint.sh "$@"
fi

# Run the command
exec "$@"