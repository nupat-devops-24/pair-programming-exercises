#!/bin/sh
set -e
echo "Waiting for MySQL at $DB_HOST:$DB_PORT..."

until mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1;" "$DB_NAME" >/dev/null 2>&1; do
  echo "MySQL is unavailable - sleeping"
  sleep 3
done

echo "MySQL is up - starting app"
exec "$@"
