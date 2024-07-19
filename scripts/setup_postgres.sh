#!/usr/bin/env bash
# Install and Setup PostgreSQL on Ubuntu 20.04

# Variables
DB_NAME="kenyaDB"
DB_USER="admin_kenya"
DB_PASS="adminWA50000000"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if PostgreSQL is installed
if command_exists psql; then
    echo "PostgreSQL is already installed."
else
    echo "PostgreSQL is not installed. Installing..."
    sudo apt update
    sudo apt install -y postgresql postgresql-contrib
fi

# Start PostgreSQL service
sudo service postgresql start

# Check if the database user exists
if sudo -i -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='$DB_USER'" | grep -q 1; then
    echo "User $DB_USER already exists."
else
    echo "Creating user $DB_USER..."
    sudo -i -u postgres psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASS' CREATEDB;"
fi

# Check if the database exists
if sudo -i -u postgres psql -lqt | cut -d \| -f 1 | grep -qw "$DB_NAME"; then
    echo "Database $DB_NAME already exists."
else
    echo "Creating database $DB_NAME..."
    sudo -i -u postgres psql -c "CREATE DATABASE $DB_NAME OWNER $DB_USER;"
fi

# Grant all privileges on the database to the user
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

echo "PostgreSQL setup completed."