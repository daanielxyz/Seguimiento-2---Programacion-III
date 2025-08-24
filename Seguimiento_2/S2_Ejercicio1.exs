defmodule Ejercicio1 do
  @moduledoc """
  Shows user input text uppercased
  """

  @doc"""
    Prompts user for input and displays their text uppercased
    """
  def messageUpperCase() do

    Util.input_data("Type your name: ")
    |> String.upcase()
    |> (&("Here is your text but uppercased: " <> &1)).()
    |> Util.show_message()
  end
end

Ejercicio1.messageUpperCase()
