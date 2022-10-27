formatted_text = IO.ANSI.green_background() <> "OK" <> IO.ANSI.reset() <> "✨"

IO.puts("#{EngineMonitor.latest([851, 841, 800, 756, 640, 390, 201])} #{formatted_text}")

IO.inspect(EngineMonitor.new_reading(901, [851,841,800]))

IO.puts(EngineMonitor.max_reading([901, 851, 841, 800]))

IO.puts(EngineMonitor.rising([901, 851, 841, 790, 800]))

IO.puts(EngineMonitor.danger?([851, 841, 300, 800]))

IO.puts(EngineMonitor.fire?("FIRE EXTINGUISHER ACTIVE RIGHT"))

IO.puts(EngineMonitor.decode("HYDRAULIC ELECTRIC LOW LOAD OPTION"))

