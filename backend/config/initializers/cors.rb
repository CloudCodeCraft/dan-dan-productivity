# Be sure to restart your server when you modify this file.

# Allow the local frontend to call the API in development. Override with
# CORS_ALLOWED_ORIGINS=http://localhost:5173,http://example.test as needed.
allowed_origins =
  ENV.fetch("CORS_ALLOWED_ORIGINS") do
    if Rails.env.development?
      "http://localhost:5173,http://127.0.0.1:5173"
    else
      ""
    end
  end
    .split(",")
    .map(&:strip)
    .reject(&:empty?)

if allowed_origins.any?
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins(*allowed_origins)

      resource "/api/*",
        headers: :any,
        methods: %i[get post put patch delete options head]
    end
  end
end
