defmodule Ejercicio2 do
  @moduledoc """
  Displays input text amount of letters removing spaces before counting
  """

  @doc"""
    Handles the logic to count the letters in the text, using .replace(" ","") to avoid blank spaces being counted
    """
  def stringLength() do
    Util.input_data("Enter your name:")
    |> String.replace(" ","")
    |> String.length()
    |> Integer.to_string()
    |> (&("The string´s length is: " <> &1)).()
    |> Util.show_message()
  end
end

Ejercicio2.stringLength()
