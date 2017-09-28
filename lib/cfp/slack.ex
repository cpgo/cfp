defmodule Cfp.Slack do

  @moduledoc """
  Some tools to communicate with Slack !
  """

  @doc """
  Returns the URL of the slack workspace
  """
  def workspace_url do
    "https://#{workspace()}.slack.com"
  end

  @doc """
  Returns the workspace's name
  """
  def workspace do
    Application.get_env(:cfp, CfpWeb.Endpoint)[:slack_workspace]
  end

  @doc false
  defp token do
    Application.get_env(:cfp, CfpWeb.Endpoint)[:slack_token]
  end

  
end
