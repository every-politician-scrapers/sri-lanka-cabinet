#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    POSITION_MAP = {
      'Minister of Tourism and Lands'      => ['Minister of Tourism', 'Minister of Lands'],
      'Minister of Power and Energy'       => ['Minister of Power', 'Minister of Energy'],
      'Minister of Transport and Highways' => ['Minister of Transport', 'Minister of Highways'],
    }.freeze

    def name
      Name.new(
        full:     noko.xpath('./preceding-sibling::tr[@bgcolor="#FFCC99"]').last.text.tidy.gsub(/[()]/, ''),
        prefixes: %w[His Excellency Hon Mrs Prof Dr]
      ).short
    end

    def position
      POSITION_MAP.fetch(raw_position, raw_position)
    end

    private

    def raw_position
      noko.css('td').last.text.tidy
    end
  end

  class Members
    def member_container
      noko.css('#cab_normal_text_e').xpath('.//tr[@bgcolor="#FDE3CA"]')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
