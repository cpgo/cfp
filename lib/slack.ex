defmodule Slack do

  use HTTPoison.Base

  @moduledoc """
  Some tools to communicate with Slack !
  """


  # Overriding callback
  def process_url(url), do: "#{workspace_url()}/api" <> url
  def process_response_body(body), do: Poison.decode(body, keys: :atoms!)
  def process_request_headers(headers) do
    [{"content-type", "application/x-www-form-urlencoded"} | headers]
  end

  # Public API
  

  @doc """
  Request an invitation for the slack
  """
  def invite(email) do
    args = "email=#{email}&token=#{token()}&set_active=true"
    case post("/users.admin.invite", args) do
      {:ok, %HTTPoison.Response{body: {:ok, %{ok: false, error: str}}}} ->
	{:error, str}
      {:ok, %HTTPoison.Response{body: {:ok, %{ok: true}}}} ->
	{:ok, :invitation_send}
      {:error, v} -> {:error, v}
      _ -> {:error, "unknown error"}
    end
  end

  @doc """
  Returns the workspace's name
  """
  def workspace do
    Application.get_env(:cfp, CfpWeb.Endpoint)[:slack_workspace]
  end

  @doc """
  Returns the URL of the slack workspace
  """
  def workspace_url do
    "https://#{workspace()}.slack.com"
  end

  # Private API

  @doc false
  defp token do
    Application.get_env(:cfp, CfpWeb.Endpoint)[:slack_token]
  end

  
end
