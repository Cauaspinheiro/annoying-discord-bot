defmodule AnnoyingBotWeb.CursesView do
  def render("curse_user.json", %{message: message}) do
    %{
      message: message
    }
  end
end
