defmodule PdfGenerator.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pdf_generator,
      name: "PDF Generator",
      version: "0.3.5",
      elixir: ">= 1.0.0",
      deps: deps(),
      description: description(),
      package: package(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [ :logger, :porcelain ],
      mod: { PdfGenerator, [] }
    ]
  end

  def description do
    """
    A wrapper for wkhtmltopdf (HTML to PDF) and PDFTK (adds in encryption) for
    use in Elixir projects.
    """
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README.md", "LICENSE", "test"],
     maintainers: ["Martin Gutsch"],
     licenses: ["MIT"],
     links: %{
        "GitHub" => "https://github.com/gutschilla/elixir-pdf-generator"
      }
     ]
  end

  defp deps do
    [
        # communication with external programs
        {:porcelain, "~> 2.0"},
        # a helper
        {:misc_random, ">=0.2.6" },
        # generate docs
        {:earmark, "~> 0.1", only: :dev},
        {:ex_doc, "~> 0.7", only: :dev}
    ]
  end
end
