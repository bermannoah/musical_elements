defmodule MusicalElements do
  alias MusicalElements.ID3V2Parser
  alias MusicalElements.ID3V1Parser
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
      read_id3_v2_tags(path_to_file)
    else
      :musical_error
    end
  end

  def read_id3_v2_tags(path_to_file) do
    try do
      tags = ID3V2Parser.extract_id3_v2(path_to_file)
      parse_tags(tags)
    rescue
      _-> read_id3_v1_tags(path_to_file)
    end
  end

  def read_id3_v1_tags(path_to_file) do
    try do
      tags = ID3V1Parser.extract_id3_v1(path_to_file)
      parse_tags(tags)
    rescue
      e in RuntimeError -> e
    end
  end

  def parse_tags(tags) do
    tags
  end
end
