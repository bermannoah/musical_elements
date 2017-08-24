defmodule MusicalElementsTest do
  use ExUnit.Case
  doctest MusicalElements

  @mp3_fixture Path.join(__DIR__, "fixtures/fixture.mp3")
  @jpeg_fixture Path.join(__DIR__, "fixtures/fixture.jpg")

  test ".get_id3_tags raises musical_error if passed a path it can't read" do
    result = MusicalElements.get_id3_tags('/fake/file/path')
    assert result == :musical_error
  end
  
  test ".get_id3_tags returns expected error if passed file that is not an mp3" do
    result = MusicalElements.get_id3_tags(@jpeg_fixture)
    assert result == :musical_error
  end

  test ".get_id3_tags returns expected response if passed mp3" do
    result = MusicalElements.get_id3_tags(@mp3_fixture)
    assert result == :hey
  end

end
