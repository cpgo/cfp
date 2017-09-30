defmodule Util do

  @moduledoc """
  Some various (and useful) stuff
  """

  @doc """
  Pop the first error of a changeset
  """
  def pop_error(%Ecto.Changeset{} = changeset) do
    case Enum.fetch(changeset.errors, 0) do
      {:ok, {key, {value, _}}} -> "#{key}: #{value}"
      _ -> "Unknown error"
    end
  end

end
