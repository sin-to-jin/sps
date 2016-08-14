PEST_LABELS = {politics: '# Politics',economics: '# Economics',society: '# Society',technology: '# Technology'}

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
    if PEST_LABELS.has_value?(pest)
      result << "<tr><td>#{get_pest_sub_title(pest)}</td>"
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

result.blank? ? "" : <<-EOS
<div class='col s12'>
  <table class='responsive-table striped'>
    <thead><th>項目</th><th>現状</th><th>将来</th></thead>
    <tbody>#{result}</tbody>
  </table>
</div>
EOS
end

private
def get_pest_sub_title(text)
  if text == PEST_LABELS[:politics]
    '政治（Politics）'
  elsif text == PEST_LABELS[:economics]
    '経済（Economics）'
  elsif text == PEST_LABELS[:society]
    '社会（Society）'
  elsif text == PEST_LABELS[:technology]
    '技術（Technology）'
  end
end
