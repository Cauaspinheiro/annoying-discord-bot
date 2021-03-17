defmodule AnnoyingBot.Curse do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:phrase, :type, :created_by]

  @valid_types ["general", "reply"]

  schema "curses" do
    field :phrase, :string
    field :type, :string
    field :created_by, :string

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

  def get_types, do: join_types()

  defp join_types(), do: Enum.join(@valid_types, ", ")
end
