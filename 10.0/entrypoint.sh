#!/bin/bash

set -e

# set odoo database host, port, user and password
: ${PGHOST:=${DB_PORT_5432_TCP_ADDR:='db'}}
: ${PGPORT:=${DB_PORT_5432_TCP_PORT:=5432}}
: ${PGUSER:=${DB_ENV_POSTGRES_USER:=${POSTGRES_USER:='odoo'}}}
: ${PGPASSWORD:=${DB_ENV_POSTGRES_PASSWORD:=${POSTGRES_PASSWORD:='odoo'}}}

DB_ARGS=("--db_user" $PGUSER "--db_password" $PGPASSWORD "--db_host" $PGHOST "--db_port" $PGPORT)

case "$1" in
	--)
		shift
		exec odoo "${DB_ARGS[@]}" "$@"
		;;
	-*)
		exec odoo "${DB_ARGS[@]}" "$@"
		;;
	*)
		exec "$@"
esac

exit 1
