# Use the official MySQL 8.0 image as the base image
FROM mysql:8.0

# Set environment variables for MySQL
# Replace with your own values for security
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Expose the default MySQL port
EXPOSE 3306

# Copy any custom configuration files if needed
# Uncomment the following lines if you have custom configurations
# COPY ./my.cnf /etc/mysql/my.cnf

# Default command to run MySQL server
CMD ["mysqld"]
