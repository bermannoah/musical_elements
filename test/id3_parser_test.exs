defmodule ID3ParserTest do
  use ExUnit.Case

  @mp3_fixture Path.join(__DIR__, "fixtures/fixture.mp3")
  @jpeg_fixture Path.join(__DIR__, "fixtures/fixture.jpg")

  test ".get_id3_tags raises musical_error if passed a path it can't read" do
    result = ID3Parser.parse('/fake/file/path/hey.mp3')
    assert result == :musical_error
  end

  test ".get_id3_tags returns a binary if passed an mp3" do
    result = ID3Parser.parse(@mp3_fixture)
    assert is_binary(result)
  end


end