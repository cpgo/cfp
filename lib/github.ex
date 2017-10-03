defmodule Github do

  @moduledoc """
  Provide some functions to deal with Github
  """

  def process_url(path), do: "https://api.github.com" <> path
  def organization, do: Application.get_env(:cfp, CfpWeb.Endpoint)[:github_organization]
  def board, do: Application.get_env(:cfp, CfpWeb.Endpoint)[:github_board]
  
end
