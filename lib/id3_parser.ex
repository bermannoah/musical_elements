defmodule ID3Parser do
    
  def parse(file_path) do      
    case File.read(file_path) do
      {:ok, binary} -> 
        IO.inspect binary
          # ...
      _->
        :musical_error
    end
  end



end