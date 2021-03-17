defmodule AnnoyingBot.Discord.CreateCurseCommand do
  alias Nostrum.Api
  alias AnnoyingBot.{Curse, Curses}

  def call(msg) do
    validated_params = get_params(msg) |> validate_params()

    with {:ok, params} <- validated_params, {:ok, curse} <- create_curse(params) do
      create_message(msg.channel_id, curse)
      else {:error, reason} -> Api.create_message(msg.channel_id, reason)
    end
  end

  defp create_message(channel_id, %Curse{id: id, created_by: created_by}) do
    message = "Xingamento criado! \n\n> ID: #{id}\n> Criado por: #{created_by}"

    Api.create_message(channel_id, message)
  end

  defp get_params(msg) do
    type = msg.content
      |> String.split(" ")
      |> Enum.filter(fn value -> value != "" end)
      |> Enum.at(-1)

    discord_id = "<@!#{msg.author.id}>"

    phrase = get_phrase(msg.content)

    %{phrase: phrase, type: type, created_by: discord_id}
  end

  defp get_phrase(content) do
    type_length = content
      |> String.split(" ")
      |> Enum.filter(fn value -> value != "" end)
      |> Enum.at(-1)
      |> String.length()

    content
    |> String.slice(String.length("!xingamento")..-1)
    |> String.slice(0..-type_length - 1)
    |> String.trim()
  end

  defp validate_params(%{phrase: phrase, type: type, created_by: _discord_id} = params) do
    with :ok <- validate_type(type), :ok <- validate_phrase(phrase) do
      {:ok, params}
      else error -> error
    end
  end

  defp validate_type(type) when type == "" or type == nil do
    {:error, "ERRO: Insira um tipo como último parâmetro"}
  end

  defp validate_type(type) do
    valid_types = Curse.get_types

    with :ok <- Curse.validate_type(type) do
      :ok
      else _ -> {:error, "ERRO: Tipo de xingamento inválido, use algum desses: #{valid_types}"}
    end
  end

  defp validate_phrase(phrase) when phrase == "" or phrase == nil do
    {:error, "ERRO: Insira uma frase como primeiro parâmetro"}
  end

  defp validate_phrase(phrase) do
    with true <- String.contains?(phrase, "{user}") do
      check_if_phrase_unique(phrase)
      else _ -> {:error, "ERRO: A frase precisa conter {user} para poder marcar alguém"}
    end
  end

  defp check_if_phrase_unique(phrase) do
    with {:ok, _curse} <- Curses.Read.get_by_phrase(phrase) do
      {:error, "ERRO: Frase já existe"}
      else _ -> :ok
    end
  end

  defp create_curse(params) do
    Curses.Create.call(params)
  end
end
