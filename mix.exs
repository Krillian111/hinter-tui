defmodule Hinter.MixProject do
  use Mix.Project

  def project do
    [
      app: :hinter,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Hinter.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:ratatouille, "~> 0.5.0"},
      {:ex_const, "~> 0.1.0"}
    ]
  end
end
