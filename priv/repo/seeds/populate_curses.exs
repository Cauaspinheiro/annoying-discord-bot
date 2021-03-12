defmodule AnnoyingBot.Repo.Seeds.PopulateCurses do
  alias AnnoyingBot.{Repo, Curse}

  Repo.delete_all(Curse)

  @curse_long_phrase "Se o {user} acha, eu discordo.\nSe o {user} fala, eu fico surdo.\nSe o {user} erra, eu comemoro.\nSe o {user} tem 100 haters, eu sou um deles.\nSe o {user} tem 10 haters, eu sou um deles.\nSe o {user} tem 1 hater, eu sou esse hater.\nSe o {user} não tem haters, eu não existo."

  # GENERAL TYPE
  AnnoyingBot.create_curse(%{phrase: "{user} saco de bosta", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} saco de lixo", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} horrível", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} ruim", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} sua mãe nasceu pelada", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} arrombado", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} programa em java", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} fã da karol conká", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} acredita em signo KKK", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} terraplanista", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} franzino", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} cu de espeto", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} abandona os amigos para jogar valorant sozinho", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} fã do mucalol", type: "general"})
  AnnoyingBot.create_curse(%{phrase: "{user} nerdola", type: "general"})
  AnnoyingBot.create_curse(%{phrase: @curse_long_phrase, type: "general"})

  # ONLINE TYPE
  AnnoyingBot.create_curse(%{phrase: "O corno {user} acordou", type: "online"})
  AnnoyingBot.create_curse(%{phrase: "eae {user} seu corno, tá on pq?", type: "online"})
  AnnoyingBot.create_curse(%{phrase: "eae {user} bom dia arrombado", type: "online"})

  # OFFLINE TYPE
  AnnoyingBot.create_curse(%{phrase: "O corno {user} foi dormir", type: "offline"})
  AnnoyingBot.create_curse(%{phrase: "vai dormir {user} aproveita e morre", type: "offline"})
  AnnoyingBot.create_curse(%{phrase: "{user} kitou e foi dormir", type: "offline"})
end
