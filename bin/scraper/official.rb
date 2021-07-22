#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'open-uri/cached'
require 'pry'

class MemberList
  # details for an individual member
  class Member < Scraped::HTML
    field :name do
      noko.xpath('./preceding-sibling::tr[@bgcolor="#FFCC99"]').last.text.tidy.gsub('Hon. ', '')
    end

    field :position do
      noko.css('td').last.text.tidy
    end
  end

  # The page listing all the members
  class Members < Scraped::HTML
    field :members do
      member_container.map { |member| fragment(member => Member).to_h }
    end

    private

    def member_container
      noko.css('#cab_normal_text_e').xpath('.//tr[@bgcolor="#FDE3CA"]')
    end
  end
end

url = 'http://www.cabinetoffice.gov.lk/cab/index.php?option=com_content&view=article&id=25&Itemid=23&lang=en'
puts EveryPoliticianScraper::ScraperData.new(url).csv
