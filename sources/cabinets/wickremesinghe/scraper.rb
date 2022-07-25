#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Members
    decorator RemoveReferences
    decorator UnspanAllTables
    decorator WikidataIdsDecorator::Links

    def member_container
      noko.xpath("//table[.//th[contains(.,'Portrait')]]//tr[td]")
    end
  end

  class Member
    POSITIONS = {
      'Minister of Health and Water Supply' => [ 'Minister of Health', 'Minister of Water Supply' ],
      'Minister of Power and Energy' => [ 'Minister of Power', 'Minister of Energy' ],
      'Minister of Tourism and Lands' => [ 'Minister of Tourism', 'Minister of Lands' ],
      'Minister of Transport and Highways' => [ 'Minister of Transport', 'Minister of Highways' ],
    }

    field :id do
      name_node.css('a/@wikidata').first
    end

    field :name do
      name_node.text.tidy
    end

    field :positionID do
    end

    field :position do
      POSITIONS.fetch(raw_position, raw_position)
    end

    field :startDate do
      WikipediaDate.new(raw_start).to_s
    end

    field :endDate do
      WikipediaDate.new(raw_end).to_s
    end

    private

    def tds
      noko.css('td')
    end

    def name_node
      tds[0]
    end

    def raw_position
      tds[4].text.tidy
    end

    def raw_start
      tds[5].text
    end

    def raw_end
      tds[6].text
    end
  end
end

url = ARGV.first
puts EveryPoliticianScraper::ScraperData.new(url).csv
