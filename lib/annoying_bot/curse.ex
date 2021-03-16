defmodule AnnoyingBot.Curse do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:phrase, :type]

  @valid_types ["general", "reply"]

  schema "curses" do
    field :phrase, :string
    field :type, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(:phrase)
    |> validate_inclusion(:type, @valid_types)
  end

  def validate_type(type) do
    case type in @valid_types do
      true -> :ok
      false -> {:error, "CURSE TYPE NOT IN #{join_types()}"}
    end
  end

  defp join_types(), do: Enum.join(@valid_types, ", ")
end
