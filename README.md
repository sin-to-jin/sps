# SPS Summary
Simple Parse Serviceの略語であり，ビジネスフレームワークの記法を提供するサービスとなっている．
APIとしても利用できるが，このライブラリは[MIT License](https://github.com/ogasawaraShinnosuke/sps/blob/master/LICENSE)です．

## Language
Ruby 2.3.0

## Get Started

``` sh
git clone git@github.com:ogasawaraShinnosuke/sps.git
cd sps
bundle install
ruby main.rb
open localhost:4567
```

## API
### PEST分析
PESTフレームワークのことであり，、政治的（political）、経済的（economic）、社会的（social）、技術的（technological）の頭文字を繋げたものである．

``` sh
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
```

# LICENSE
[MIT License](https://github.com/ogasawaraShinnosuke/sps/blob/master/LICENSE)
