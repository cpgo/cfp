defmodule Github.Organization do

  def on_board?(id, token) do
    req =
      "/orgs/#{Github.organization}/teams"
      |> Github.process_url()
      |> HTTPoison.get([{"Authorization", "token #{token}"}])
    with {:ok, response} <- req,
	 {:ok, list} <- Poison.decode(response.body) do
      check_member(id, list, token)
    else
      _ -> false
    end
 
  end

  defp check_member(id, list, token) do
    case Enum.find(list, fn(elt) -> elt["name"] == Github.board end) do
      nil -> false
      team -> has_member(id, team, token)
    end
  end

  defp has_member(id, team, token) do
    req =
      team["url"] <> "/members"
      |> HTTPoison.get([{"Authorization", "token #{token}"}])
    with {:ok, response} <- req,
	 {:ok, list} <- Poison.decode(response.body) do
      Enum.any?(list, fn(elt) -> elt["id"] == id end)
    else
      _ -> false
    end
  end


end
