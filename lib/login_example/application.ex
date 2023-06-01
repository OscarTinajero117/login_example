defmodule LoginExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LoginExampleWeb.Telemetry,
      # Start the Ecto repository
      LoginExample.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LoginExample.PubSub},
      # Start Finch
      {Finch, name: LoginExample.Finch},
      # Start the Endpoint (http/https)
      LoginExampleWeb.Endpoint
      # Start a worker by calling: LoginExample.Worker.start_link(arg)
      # {LoginExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LoginExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LoginExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
