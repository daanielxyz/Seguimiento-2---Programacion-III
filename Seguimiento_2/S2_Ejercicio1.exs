defmodule Ejercicio1 do
  def mensajeUpperCase() do
    Util.input_data("Escriba su nombre: ")
    |> String.upcase()
    |> Util.show_message()
  end
end

Ejercicio1.mensajeUpperCase()
