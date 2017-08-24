defmodule MusicalElements do
  @moduledoc """
  Documentation for MusicalElements.
  """

  @doc """
  Hello world.

  ## Examples
      iex> path_to_file = "path/to/file.mp3"
      iex> MusicalElements.get_id3_tags(path_to_file)
      :musical_error

  """

  def get_id3_tags(path_to_file) do
    if MundaneElements.get_file_type(path_to_file) == :mp3 do
      read_tags(path_to_file)
    else
      :musical_error
    end
  end

  def read_tags(path_to_file) do
    case File.read(path_to_file) do
      {:ok, binary} ->
        parse_tags(binary)
        _->
          :musical_error
    end
  end

  def parse_tags(binary) do
    :hey
  end
end