defmodule ExAws.Support do
  @moduledoc """
  Documentation for ExAwsSupport.
  """

  use ExAws.Utils,
    format_type: :xml,
    non_standard_keys: %{}

  # version of the AWS API
  @version "20130415"
  @namespace "AWSSupport"

  @spec describe_trusted_advisor_check_result(check_id :: binary, language :: binary) ::
          ExAws.Operation.JSON.t()
  def describe_trusted_advisor_check_result(check_id, language) do
    [
      {:check_id, check_id},
      {:language, language}
    ]
    |> build_request(:describe_trusted_advisor_check_result)
  end

  ####################
  # Helper Functions #
  ####################

  defp build_request(opts, action) do
    opts
    |> Enum.flat_map(&format_param/1)
    |> request(action)
  end

  defp request(params, action) do
    action_string = action |> Atom.to_string() |> Macro.camelize()

    %ExAws.Operation.JSON{
      http_method: :post,
      headers: [
        {"x-amz-target", "#{@namespace}_#{@version}.#{action_string}"},
        {"content-type", "application/x-amz-json-1.1"}
      ],
      data:
        params
        |> filter_nil_params,
      service: :support
    }
  end

  defp format_param({:check_id, check_id}) do
    check_id |> format(prefix: "checkId")
  end

  defp format_param({key, parameters}) do
    format([{key, parameters}])
  end
end
