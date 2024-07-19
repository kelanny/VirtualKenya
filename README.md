# Memorial Site

A web application to preserve and cherish the memories of loved ones who have passed away. Users can create profiles for the deceased, share stories, upload media, and leave memorial posts.

## Features

- User accounts with authentication
- Profiles for deceased individuals with biographies, photos, and videos
- Memorial posts and comments
- Media uploads (photos and videos)
- Notifications for new posts and updates
- Search and browse functionality
- Privacy controls for profiles and posts

## Technology Stack

- **Backend:** Python, Django
- **Frontend:** HTML, CSS, JavaScript
- **Database:** PostgreSQL
- **Storage:** AWS S3 for media files
- **Deployment:** Docker, Nginx, Gunicorn, AWS/DigitalOcean

## Getting Started

### Prerequisites

- Python 3.8+
- Docker
- PostgreSQL
- AWS account (for S3 storage)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/memorial-site.git
    cd memorial-site
    ```

2. **Create a virtual environment and activate it:**

    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. **Install the dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

4. **Set up the PostgreSQL database:**

    ```sql
    CREATE DATABASE memorial_site;
    CREATE USER memorial_user WITH PASSWORD 'your_password';
    ALTER ROLE memorial_user SET client_encoding TO 'utf8';
    ALTER ROLE memorial_user SET default_transaction_isolation TO 'read committed';
    ALTER ROLE memorial_user SET timezone TO 'UTC';
    GRANT ALL PRIVILEGES ON DATABASE memorial_site TO memorial_user;
    ```

5. **Configure environment variables:**

    Create a `.env` file in the project root and add the following:

    ```env
    SECRET_KEY=your_secret_key
    DEBUG=True
    ALLOWED_HOSTS=localhost,127.0.0.1
    DATABASE_URL=postgres://memorial_user:your_password@localhost/memorial_site
    AWS_ACCESS_KEY_ID=your_aws_access_key_id
    AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key
    AWS_STORAGE_BUCKET_NAME=your_bucket_name
    ```

6. **Apply database migrations:**

    ```bash
    python manage.py migrate
    ```

7. **Create a superuser:**

    ```bash
    python manage.py createsuperuser
    ```

8. **Run the development server:**

    ```bash
    python manage.py runserver
    ```

    The application should be accessible at `http://127.0.0.1:8000`.

### Docker Deployment

1. **Build and run the Docker containers:**

    ```bash
    docker-compose up --build
    ```

2. **Run database migrations inside the Docker container:**

    ```bash
    docker-compose exec web python manage.py migrate
    ```

3. **Create a superuser inside the Docker container:**

    ```bash
    docker-compose exec web python manage.py createsuperuser
    ```

The application should be accessible at `http://localhost`.

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes.
4. Write tests for your changes.
5. Ensure all tests pass.
6. Commit your changes and push your branch.
7. Create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Django](https://www.djangoproject.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [AWS S3](https://aws.amazon.com/s3/)
- [Docker](https://www.docker.com/)

## Contact

For any inquiries, please contact [your-email@example.com].

---

*This README was generated with the help of [ChatGPT](https://openai.com/blog/chatgpt).*
