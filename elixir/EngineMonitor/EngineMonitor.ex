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
  def rising([head | tail]) do
    _rising(0, head, tail)
  end

  defp _rising(counter, _current, []) do
    counter
  end

  defp _rising(counter, current, [head | tail]) when current < head do
    _rising(counter + 1, head, tail)
  end

  defp _rising(counter, _current, [head | tail]) do
    _rising(counter, head, tail)
  end
end
