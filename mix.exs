defmodule MusicalElements.Mixfile do
  use Mix.Project

  def project do
    [app: :musical_elements,
     version: "0.0.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     name: "MusicalElements",
     source_url: "https://github.com/bermannoah/musical_elements"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:mundane_elements, "~> 0.1.2"},
     {:id3v2, "~> 0.1.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description() do
    "An early stage - use at your own risk - module designed to make it easy
    to grab metadata from both id3v1 and id3v2 mp3s."
  end

  defp package() do
    [
      name: "musical_elements",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Noah Berman"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/bermannoah/musical_elements"}
    ]
  end
end
