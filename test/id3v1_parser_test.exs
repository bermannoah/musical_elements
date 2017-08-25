defmodule ID3V1ParserTest do
  use ExUnit.Case
  alias MusicalElements.ID3V1Parser

  @mp3_fixture Path.join(__DIR__, "fixtures/fixture.mp3")
  @id3v1 Path.join(__DIR__, "fixtures/id3v1.mp3")

  test ".extract_id3_v1 raises musical_error if passed a path it can't read" do
    catch_error(ID3V1Parser.extract_id3_v1('/fake/file/path/hey.mp3'))
  end

  test ".extract_id3_v1 returns a map if passed an mp3" do
    result = ID3V1Parser.extract_id3_v1(@mp3_fixture)
    assert is_map(result)
  end

  test ".extract_id3_v1 returns a title if passed an mp3" do
    result = ID3V1Parser.extract_id3_v1(@id3v1)
    assert result.title == "[Polka in G]"
  end

  test ".extract_id3_v1 does not error if fields are legible but one is missing" do
    result = ID3V1Parser.extract_id3_v1(@id3v1)
    assert result.title == "[Polka in G]"
    assert result.album == ""
  end

  test ".extract_id3_v1 returns all relevant data if passed an mp3" do
    result = ID3V1Parser.extract_id3_v1(@id3v1)
    assert result.title == "[Polka in G]"
    assert result.artist == "Henry Reed"
    assert result.album == ""
  end


end
