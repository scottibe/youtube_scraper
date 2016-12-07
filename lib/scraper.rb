#!/usr/bin/env ruby
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'json'

class VideoScraper

  def initialize(index_url)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
  end 

  def call
    rows.shift
    rows.shift
    rows.each do |row_doc|
      LouisVideo.create_from_hash(scrape_row(row_doc))
    end    
  end

private
  def rows
    @rows ||= @doc.search("div.yt-lockup-content")
  end 

  def scrape_row(row)
    @length = rows.search("span.accessible-description").attr('id').children.text
    row = {
      :title => row.search("a.yt-uix-sessionlink.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.spf-link").text,
      :url => "https://www.youtube.com#{row.search('a.yt-uix-sessionlink.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.spf-link').attr('href').value}",
      :description => row.search("div.yt-lockup-description").text,
      :byline => row.search("div.yt-lockup-byline").text,
      :views => row.search("ul.yt-lockup-meta-info").children[1].text,
      :duration => row.search("span##{@length}").text,
      :uploaded => row.search("ul.yt-lockup-meta-info").children[0].text
    }
  end
end  