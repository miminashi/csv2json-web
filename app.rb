#coding:utf-8
require 'sinatra/base'
require 'json'
require 'haml'
require 'csv'
require 'open-uri'
require 'nkf'
require 'pp'

class Csv2Json < Sinatra::Base
  configure do
    mime_type :json, 'application/json'
  end

  get '/' do
    haml :index
  end

  get '/documents/convert' do
    url = params[:url]
    csv_string = open(url).read
    #input = StringIO.new(csv_string)
    #output = StringIO.new()
    #CSV2JSON.parse(input, output)
    #output.pos = 0
    #content_type :json
    #output.read
    data = []
    csv_string = NKF.nkf('--utf8', csv_string)
    CSV.parse(csv_string).each do |row|
      data << row
    end

    content_type :json
    JSON.generate(data)
  end

  #post '/documents/create' do
  #end
end
