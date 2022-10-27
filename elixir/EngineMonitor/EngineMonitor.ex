defmodule EngineMonitor do 
  def latest(list) do 
    hd(list)
  end

  def new_reading(list, a) do 
    [a | list]
  end

  def max_reading([]), do: :empty_list_error

  def max_reading([head | tail]) do 
    max_reading(tail, head)
  end

  defp max_reading([], max) do 
    max
  end

  defp max_reading([head | tail], max) when head > max do 
    max_reading(tail, head)
  end

  defp max_reading([_ | tail], max), do: max_reading(tail, max)

  def rising([head | tail]) do 
    head
  end

end
