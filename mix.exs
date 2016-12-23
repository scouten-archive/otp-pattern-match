defmodule PatternMatch.Mixfile do
  use Mix.Project

  def project do
    [app: :otp_pattern_match,
     version: "1.0.0",
     elixir: "~> 1.2",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:decimal, "~> 1.1.0"}]
  end
end
