defmodule AnnoyingBot.Repo.Seeds.PopulateCurses do
  alias AnnoyingBot.{Repo, Curse}

  Repo.delete_all(Curse)

  AnnoyingBot.create_curse(%{phrase: "{user} saco de bosta"})
  AnnoyingBot.create_curse(%{phrase: "{user} saco de lixo"})
  AnnoyingBot.create_curse(%{phrase: "{user} horrível"})
  AnnoyingBot.create_curse(%{phrase: "{user} ruim"})
end
