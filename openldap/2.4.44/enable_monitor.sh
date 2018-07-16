log-helper info "Configuring monitor backend..."

log-helper info "Loading back_monitor module..."
cat <<EOF | ldapmodify -Y EXTERNAL -H ldapi:///
dn: cn=module{0},cn=config
changetype: modify
add: olcModuleLoad
olcModuleLoad: back_monitor.la
EOF

log-helper info "Adding monitor user..."
cat <<EOF | ldapadd -H ldapi:/// -D cn=admin,dc=example,dc=org -w admin
dn: cn=monitor,dc=example,dc=org
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: monitor
description: LDAP monitor
userPassword: monitor
EOF

log-helper info "Enabling monitor backend database..."
cat <<EOF | ldapadd -Y EXTERNAL -H ldapi:///
dn: olcDatabase=Monitor,cn=config
objectClass: olcDatabaseConfig
objectClass: olcMonitorConfig
olcDatabase: Monitor
olcAccess: to dn.subtree=cn=Monitor by dn.base=cn=monitor,dc=example,dc=org read by * none
EOF

log-helper info "Monitor backend enabled"
