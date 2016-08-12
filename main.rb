require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'
require './extension/pest.rb'

# API

=begin
curl -F "section_1_result_id=# PEST
# Politics
Politics
AAA
--
hogehoge
fugafuga

# Economics
Economics
hoge]
--
fuga
piyo

# Society
Society
--
no time
hofehoge
jfoie

# Technology
Technology
tutururu
piyopiyo
--
hogehoge

" http://localhost:4567/pest
=end
post '/pest' do
  param = params[:section_1_result_id]
  pest(param) unless param.blank?
end

# Client Routes

post '/pest_index' do
  param = params[:section_1_result_id]
  @section_1_result = pest(param) unless param.blank?
  erb :index
end
