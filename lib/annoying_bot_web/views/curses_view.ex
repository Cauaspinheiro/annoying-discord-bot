defmodule AnnoyingBotWeb.CursesView do
  alias AnnoyingBot.Curse

  def render("curse_user.json", %{message: message}) do
    %{
      message: message
    }
  end

  def render("curses.json", %{curses: curses}) do
    Enum.map(curses, fn value -> %{
      phrase: value.phrase,
      id: value.id,
      updated_at: value.updated_at,
      inserted_at: value.inserted_at
    }
    end)
  end

  def render("create_curse.json", %{curse: %Curse{id: id, phrase: phrase}}) do
    %{
      id: id,
      phrase: phrase
    }
  end
end
