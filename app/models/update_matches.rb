#  date       :date
#  event      :string           not null
#  handicap   :integer          default(0)
#  komi       :decimal(2, 1)    not null
#  result     :string
#  round      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  black_id   :integer
#  white_id   :integer

class UpdateMatches < UpdateFromFile
    def process_file
      matches = MatchesParser.new.call file.download
      matches.each do |item|
        normalize_black_name = item[:black_name].mb_chars.unicode_normalize(:nfkd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
        normalize_white_name = item[:white_name].mb_chars.unicode_normalize(:nfkd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
        black_id = player.find_by(name: normalize_black_name).id 
        white_id = player.find_by(name: normalize_white_name).id
        result = item[:result]
        komi = decimal(item[:komi]) 
        handicap = integer(item[:handicap])
        date = date.parse item[:date]
        event = item[:event]
        round = item[:round]
        matches.create(date: date, event: event, handicap: handicap, komi: komi, result: result, round: round,
        black_id: black_id, white_id: white_id)
      end
    end
  end