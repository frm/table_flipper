defmodule TableFlipper.MixProject do
  use Mix.Project

  def project do
    [
      app: :table_flipper,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      name: "TableFlipper",
      source_url: "https://github.com/fribmendes/table_flipper"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    "A useless package that prepends a table flip to Elixir error logs"
  end

  defp package do
    [
      maintainers: ["Fernando Mendes"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/fribmendes/table_flipper"}
    ]
  end
end
