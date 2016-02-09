FROM gliderlabs/alpine:3.3
VOLUME ["/var/lib/inventory", "/etc/inventory"]
COPY assets/inventory /usr/bin/inventory
RUN apk --no-cache add openldap && chmod +x /usr/bin/inventory
EXPOSE 636
ENTRYPOINT ["/usr/bin/inventory"]
CMD ["slapd", "-h", "ldaps:///", "-F", "/etc/inventory", "-f", "/etc/inventory/slapd.conf", "-g", "ldap", "-u", "ldap", "-d", "0"]
