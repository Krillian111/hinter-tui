defmodule Hinter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    Supervisor.start_link(children(), strategy: :one_for_one, name: Hinter.Supervisor)
  end

  def stop(_) do
    System.halt()
  end

  defp children do
    [
      %{
        id: Hinter.Repository.Local,
        start: {Hinter.Repository.Local, :start_link, [%{}]},
        restart: :transient
      },
      {
        Ratatouille.Runtime.Supervisor,
        runtime: [app: Hinter.App, quit_events: [{:key, Ratatouille.Constants.key(:ctrl_q)}]]
      }
    ]
  end
end
