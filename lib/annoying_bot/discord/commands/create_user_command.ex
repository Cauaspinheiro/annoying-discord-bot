defmodule AnnoyingBot.Discord.CreateUserCommand do
  alias Nostrum.Api
  alias AnnoyingBot.{Repo, User}

  def call(msg) do
    params = validate_msg_content(msg)

    Api.create_message(msg.channel_id, params)
  end

  def validate_msg_content(msg) do
    case String.trim(msg.content) do
      "!registrar" -> "Você precisa passar vários parâmetros"
      _ -> get_params(msg)
    end
  end

  defp get_params(msg) do
    target = msg.content
      |> String.split(" ")
      |> Enum.at(1)

    with %{target_id: target_id, author_id: author_id, nickname: nickname} <- validate_required_params(msg),
      :ok <- check_target_exists(target, nickname),
      :ok <- check_target_author_equal(target_id, author_id) do

      created_by = "<@!#{author_id}>"

      params = %{"discord_id" => target_id, "name" => nickname, "created_by" => created_by}

      {:ok, %User{discord_id: discord_id, id: id}} = AnnoyingBot.create_user(params)
      "#{discord_id} vai ser xingado até a morte kkkk\n\n> ID: #{id}\n> Criado por: #{created_by}"
    end
  end

  defp validate_required_params(msg) do
    author_id = msg.author.id

    with {:ok, target_id} <- get_target_id(msg.content),
     {:ok, nickname} <- get_nickname(msg.content) do
      %{
        author_id: author_id,
        nickname: nickname,
        target_id: target_id
        }
    end
  end

  defp get_nickname(content) do
    nickname = content
      |> String.split(" ")
      |> Enum.filter(fn value -> value != "" end)
      |> Enum.at(2)

    case nickname do
      nil -> "Não foi passado um apelido para o usuário"
      _ -> {:ok, nickname}
    end
  end

  defp get_target_id(content) do
    target_id = content
      |> String.split(" ")
      |> Enum.filter(fn value -> value != "" end)
      |> Enum.at(1)


    case target_id do
      nil -> "Você precisa marcar o usuário que quer registrar como primeiro parâmetro"
      _ -> check_if_target_is_id(target_id)
    end
  end

  defp check_if_target_is_id(target_id) do
    case String.starts_with?(target_id, "<@!") do
      true -> check_if_target_is_admin(target_id)
      _ -> "Você precisar marcar um usuário válido"
    end
  end

  defp check_if_target_is_admin(target_id) do
    case target_id != "<@!387668324039000065>" do
      true -> {:ok, target_id}
      _ -> "KKKKKKKKKKKK quer xingar o criador da porra toda???"
    end
  end


  defp check_target_exists(discord, name) do
    case Repo.get_by(User, discord_id: discord) do
      nil -> check_target_name_exists(name)
      _ -> "Usuário já existe"
    end
  end

  defp check_target_name_exists(name) do
    case Repo.get_by(User, name: name) do
      nil -> :ok
      _ -> "Usuário com esse apelido já existe"
    end
  end

  defp check_target_author_equal(target_id, author_id) do
    case target_id == author_id do
      true -> "Você não pode registrar você mesmo"
      _ -> :ok
    end
  end
end
