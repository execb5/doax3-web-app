defmodule Doax3.Characters do
  @moduledoc """
  The Characters context.
  """

  import Ecto.Query, warn: false
  alias Doax3.Repo

  alias Doax3.Characters.Girl

  @doc """
  Returns the list of girls.

  ## Examples

      iex> list_girls()
      [%Girl{}, ...]

  """
  def list_girls do
    Repo.all(Girl)
  end

  @doc """
  Gets a single girl.

  Raises `Ecto.NoResultsError` if the Girl does not exist.

  ## Examples

      iex> get_girl!(123)
      %Girl{}

      iex> get_girl!(456)
      ** (Ecto.NoResultsError)

  """
  def get_girl!(id), do: Repo.get!(Girl, id)

  @doc """
  Creates a girl.

  ## Examples

      iex> create_girl(%{field: value})
      {:ok, %Girl{}}

      iex> create_girl(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_girl(attrs \\ %{}) do
    %Girl{}
    |> Girl.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a girl.

  ## Examples

      iex> update_girl(girl, %{field: new_value})
      {:ok, %Girl{}}

      iex> update_girl(girl, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_girl(%Girl{} = girl, attrs) do
    girl
    |> Girl.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Girl.

  ## Examples

      iex> delete_girl(girl)
      {:ok, %Girl{}}

      iex> delete_girl(girl)
      {:error, %Ecto.Changeset{}}

  """
  def delete_girl(%Girl{} = girl) do
    Repo.delete(girl)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking girl changes.

  ## Examples

      iex> change_girl(girl)
      %Ecto.Changeset{source: %Girl{}}

  """
  def change_girl(%Girl{} = girl) do
    Girl.changeset(girl, %{})
  end
end
