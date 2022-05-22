defmodule Conversion.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Conversion.Repo,
      # Start the Telemetry supervisor
      ConversionWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Conversion.PubSub},
      # Start the Endpoint (http/https)
      ConversionWeb.Endpoint
      # Start a worker by calling: Conversion.Worker.start_link(arg)
      # {Conversion.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Conversion.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ConversionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
