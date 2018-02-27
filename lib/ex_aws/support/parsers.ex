if Code.ensure_loaded?(SweetXml) do
  defmodule ExAws.Support.Parsers do
    use ExAws.Operation.Query.Parser
    
    def parse({:ok, %{body: xml} = resp}, :describe_trusted_advisor_check_result) do
      parsed_body =
        xml
        |> SweetXml.xpath(
          ~x"//DescribeTrustedAdvisorCheckResultResponse"

        )
    end
  end
end