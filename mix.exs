defmodule Pusher.Mixfile do
  use Mix.Project

  def project do
    [ app: :pusher,
      version: "0.0.1",
      elixir: "~> 0.12.4",
      deps: deps(Mix.env) ]
  end

   def application do
    [
      applications: [ :httpoison, :jsex ],
      env: [
        host: "http://localhost",
        port: "8080",
        app_key: "app_key",
        app_secret: "secret",
        app_id: "app_id"
      ]
    ]
  end

  defp deps(:dev) do
    [
     {:httpoison, github: "edgurgel/httpoison", tag: "0.0.2"},
     {:jsex, github: "talentdeficit/jsex"},
    ]
   end

   defp deps(:docs) do
     deps(:dev) ++ [ {:ex_doc, github: "elixir-lang/ex_doc" } ]
   end

  defp deps(:test) do
    deps(:dev) ++ [ {:meck, github: "eproxus/meck", tag: "0.7.2" } ]
  end

  defp deps(_), do: deps(:dev)

end
