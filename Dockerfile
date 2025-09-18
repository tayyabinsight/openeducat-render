FROM odoo:18

USER root
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# extra addons folder
RUN mkdir -p /mnt/extra-addons

# copy OpenEduCat addons
COPY ./addons /mnt/extra-addons

# copy config and entrypoint
COPY ./config/odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo/odoo.conf

USER odoo
EXPOSE 8069
ENTRYPOINT ["/entrypoint.sh"]
