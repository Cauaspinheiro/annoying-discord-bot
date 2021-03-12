defmodule AnnoyingBot.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :discord_id, :created_by]

  schema "users" do
    field :name, :string
    field :discord_id, :string
    field :created_by, :string

    timestamps()
  end

  def changeset(params) do
  %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:discord_id, :name])
  end
end
