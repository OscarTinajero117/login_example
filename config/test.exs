import Config

import_config "test.secrets.exs"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :login_example, LoginExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CjqE7O4FoP3pCU/3hUwVy7IO2M+XsORgdBPTTwuy58x+/3/jMZCDW1ncN8rpgGwb",
  server: false

# In test we don't send emails.
config :login_example, LoginExample.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
