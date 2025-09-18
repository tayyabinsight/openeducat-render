#!/bin/bash
set -e

PORT=${PORT:-8069}

cat > /etc/odoo/odoo.conf <<EOF
[options]
addons_path = /usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons
db_host = ${DB_HOST}
db_port = ${DB_PORT:-5432}
db_user = ${DB_USER}
db_password = ${DB_PASSWORD}
admin_passwd = ${ADMIN_PASSWD:-admin123}
data_dir = /var/lib/odoo/filestore
xmlrpc_interface = 0.0.0.0
EOF

exec odoo -c /etc/odoo/odoo.conf --http-port=${PORT}
