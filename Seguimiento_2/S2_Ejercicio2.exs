defmodule Ejercicio2 do
  def stringLenght() do
    data = Util.input_data("Ingrese la palabra la cual quiere saber su cantidad de caracteres: ")
    n = String.length(data)
    Util.show_message("#{n}")
  end
end

Ejercicio2.stringLenght()
