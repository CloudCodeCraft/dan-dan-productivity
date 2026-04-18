curl -X POST http://0.0.0.0:3000/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{"user": {"email": "danlee@hey.com", "password": "secret123", "password_confirmation": "secret123"}}'
