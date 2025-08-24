defmodule Ejercicio3 do
  @moduledoc """
  Calculates employee net salary considering regular and overtime hours.

  Regular hours (up to 160) are paid at normal rate.
  Overtime hours (above 160) are paid at 125% of normal rate.
  """

  @doc """
    Main function that handles the complete salary calculation workflow.
    Prompts user for employee data, calculates net salary, and displays result.
    """
  def showSalary() do
    calculate_salary()
    |> format_salary_message()
    |> Util.show_message()
  end


  defp calculate_salary() do
    # Handles the main calculation from user input to net salary.
    %{
      name: Util.input_data("Type your name: "),
      worked_hours: Util.input_data("How many hours have you worked? "),
      hourly_rate: Util.input_data("What´s your hourly rate? ")
    }
    |> convert_to_numbers()
    |> calculate_net_salary()
  end


  defp convert_to_numbers(%{name: name, worked_hours: hours_str, hourly_rate: rate_str}) do
    # Converts string inputs to float numbers.
    # Handles both integer and decimal formats to avoid errors when typing for example "160" instead of "160.0"
    %{
      name: name,
      hours: hours_str |> String.trim() |> Float.parse() |> elem(0),
      rate: rate_str |> String.trim() |> Float.parse() |> elem(0)
    }
  end


  defp calculate_net_salary(%{name: name, hours: hours, rate: rate}) do
    # Calculates net salary applying overtime rules:
    # - Regular hours (up to 160): paid at normal rate
    # - Overtime hours (above 160): paid at 125% rate
    regular_hours = min(hours, 160)
    overtime_hours = max(hours - 160, 0)

    net_salary = (regular_hours * rate) + (overtime_hours * rate * 1.25)

    %{name: name, net_salary: net_salary}
  end


  defp format_salary_message(%{name: name, net_salary: salary}) do
    # Formats the final salary message.
    formatted_salary = :erlang.float_to_binary(salary, [{:decimals, 2}])
    "Net salary for #{name} is: $#{formatted_salary}"
  end
end

Ejercicio3.showSalary()
