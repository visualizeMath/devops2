#Give the user admin privileges
rabbitmqctl set_user_tags admin administrator

#Set permissions for admin: Configure Permissions,Write Permissions,Read Permissions
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"