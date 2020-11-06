defmodule PairsOne.Theme do
  @moduledoc """
  Game themes-related data and operations
  """

  @themes [
    eighties: %{
      title: "Eighties",
      cards: 40,
      difficulty: 0,
      new: false
    },
    animals: %{
      title: "Animals",
      cards: 50,
      difficulty: 0,
      new: false
    },
    animals2: %{
      title: "Animals 2",
      cards: 50,
      difficulty: 0,
      new: false
    },
    fairy_tales: %{
      title: "Fairy Tales",
      cards: 50,
      difficulty: 0,
      new: false
    },
    covid19: %{
      title: "COVID-19",
      cards: 50,
      difficulty: 0,
      new: false
    },
    memes: %{
      title: "Memes",
      cards: 30,
      difficulty: 0,
      new: true,
      extension: "gif"
    },
    ecology: %{
      title: "Ecology",
      cards: 50,
      difficulty: 0,
      new: false
    },
    pokemon: %{
      title: "Pokémon",
      cards: 50,
      difficulty: 1,
      new: false
    },
    halloween: %{
      title: "Halloween",
      cards: 48,
      difficulty: 1,
      new: false
    },
    music: %{
      title: "Music",
      cards: 50,
      difficulty: 1,
      new: false
    },
    flags: %{
      title: "Flags",
      cards: 50,
      difficulty: 1,
      new: false
    },
    owls: %{
      title: "Owls",
      cards: 50,
      difficulty: 2,
      new: false
    },
    cats: %{
      title: "Cats",
      cards: 50,
      difficulty: 2,
      new: false
    },
    robots: %{
      title: "Robots",
      cards: 50,
      difficulty: 2,
      new: false
    }
  ]

  @doc """
  Given theme name, returns number of cards in that theme
  """
  def cards_number(name) when is_binary(name) do
    themes()[String.to_atom(name)].cards
  end

  @doc """
  Return theme data by name
  """
  def get(name) when is_binary(name) do
    themes()[String.to_atom(name)]
  end

  @doc """
  Accessor to themes map
  """
  def themes do
    @themes
    |> Enum.map(fn {name, theme} ->
      extension = (theme |> Map.get(:extension)) || "svg"
      new_theme = theme |> Map.put(:extension, extension)
      {name, new_theme}
    end)
  end

  @doc """
  Themes as a list
  """
  def list do
    themes() |> Enum.map(fn {theme, data} -> Map.merge(data, %{name: theme}) end)
  end
end
