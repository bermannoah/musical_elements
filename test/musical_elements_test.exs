defmodule MusicalElementsTest do
  use ExUnit.Case
  doctest MusicalElements

  @jpeg_fixture Path.join(__DIR__, "fixtures/fixture.jpg")
  @id3v1 Path.join(__DIR__, "fixtures/id3v1.mp3")
  @id3v2 Path.join(__DIR__, "fixtures/id3v1.mp3")

  test ".get_id3_tags raises musical_error if passed a path it can't read" do
    result = MusicalElements.get_id3_tags('/fake/file/path')
    assert result == :musical_error
  end

  test ".get_id3_tags returns expected error if passed file that is not an mp3" do
    result = MusicalElements.get_id3_tags(@jpeg_fixture)
    assert result == :musical_error
  end

  test ".get_id3_tags returns a map in response if passed mp3" do
    result = MusicalElements.get_id3_tags(@id3v1)
    assert is_map(result)
  end

  test ".get_id3_tags returns a map in response if passed mp3 with id3v2 tags" do
    result = MusicalElements.get_id3_tags(@id3v2)
    assert is_map(result)
  end

end
