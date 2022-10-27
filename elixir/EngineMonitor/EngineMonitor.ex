defmodule EngineMonitor do 
  def latest(list) do 
    hd(list)
  end

  def new_reading(list, a) do 
    [a | list]
  end

  #------------------------------------MAX_READING------------------------------------------ 
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

  defp max_reading([_ | tail], max) do 
    max_reading(tail, max)
  end

  #---------------------------------------RISING-------------------------------------------- 
  # example function guards
  def gt(a, b) when a > b, do: a
  def gt(a, b) when a < b, do: b

  def rising([head | tail]) do 
    if head > hd(tail) do 
      rising(tail, 1)
    else
      rising(tail, 0)
    end
  end

  def rising([head | tail], count) when length(tail) > 0 do
    if head > hd(tail) do 
      rising(tail, count+1)
    else
      rising(tail, count)
    end
  end

  def rising([head | tail], count) when length(tail) == 0 do 
    count
  end
end
