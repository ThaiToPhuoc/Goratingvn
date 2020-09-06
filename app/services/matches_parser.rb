class MatchesParser
    def call(data)
      workbook = RubyXL::Parser.parse_buffer data
      matches = (workbook[0].map {|x|
        {black_name: x[0].value,
        white_name: x[1].value,
        result: x[2].value,
        komi: x[3].value,
        handicap: x[4].value,
        date: x[5].value,
        event: x[6].value,
        round: x[7].value}})
      matches.shift
      matches
    end
  end