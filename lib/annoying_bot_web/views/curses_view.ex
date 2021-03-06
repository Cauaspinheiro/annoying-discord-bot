defmodule AnnoyingBotWeb.CursesView do
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
end
