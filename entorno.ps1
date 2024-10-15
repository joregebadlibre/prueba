[System.Environment]::SetEnvironmentVariable("DB_URL", "jdbc:postgresql://localhost:5432/postgres", "User")
[System.Environment]::SetEnvironmentVariable("DB_USERNAME", "postgres", "User")
[System.Environment]::SetEnvironmentVariable("DB_PASSWORD", "postgres", "User")

[System.Environment]::SetEnvironmentVariable("SPRING_RABBITMQ_HOST", "localhost", "User")
[System.Environment]::SetEnvironmentVariable("SPRING_RABBITMQ_PORT", "5672", "User")
[System.Environment]::SetEnvironmentVariable("SPRING_RABBITMQ_USERNAME", "admin", "User")
[System.Environment]::SetEnvironmentVariable("SPRING_RABBITMQ_PASSWORD", "admin", "User")