require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'

OBJECTS = ['# Politics','# Economics','# Society','# Technology']

get '/' do
  erb :index
end

def pest(pests)
  object_name = ''
  result = ''
  text = ''
  current = ''
  subtitle_flg = false

  pests.lines do |pest|
    pest = pest.chomp.strip

    # insert title
    result << '<h5>PEST分析</h5>' if pest == '# PEST'
    return if result.blank?

    # insert sub title
    object_name = '政治（Politics）' if pest == '# Politics'
    object_name = '経済（Economics）' if pest == '# Economics'
    object_name = '社会（Society）' if pest == '# Society'
    object_name = '技術（Technology）' if pest == '# Technology'
    if OBJECTS.include?(pest)
      result << "<tr><td>#{object_name}</td>"
      subtitle_flg = true
    elsif subtitle_flg && pest == '--'
      current = "<td>#{text}</td>"
      text = ''
    elsif subtitle_flg && pest.blank?
      result << "#{current}<td>#{text}</td></tr>"
      current = ''
      text = ''
      subtitle_flg = false
    elsif subtitle_flg
      text << (text.blank? ? pest : "<br>#{pest}")
    end
  end

result.blank? ? "" : """
<div class='col s12'>
  <table class='responsive-table striped'>
    <thead><th>項目</th><th>現状</th><th>将来</th></thead>
    <tbody>#{result}</tbody>
  </table>
</div>"""
end

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
