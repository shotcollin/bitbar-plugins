#!/bin/bash

# <bitbar.title>Coinbase Prices</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.dependencies>bash, python</bitbar.dependencies>

## set icons
bitcoin_icon='iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAQAAABLCVATAAAACXBIWXMAABYlAAAWJQFJUiTwAAABY0lEQVRIx2P4z0AdyEBzg1DAdIYfQJgCZHmCWdsYMAFRBs0BC2UAWT5g1p6hbZAggwIcrgALVQNZSWDWAQY24g3qwRtJ/xgeMqxkCGJgotQgGLzAoEUdg/4zvGQQIxzYLAyODF/gQv0MlgwWDK4MOQxbgV5DKG0nLtZ2wIUykII2EMmoU8QZtAWrQQwMB+HiDygzaDNc/CQlBskwfIKLN5JrkAxDFsMTuOh9BiFSDXoHDI2HDB9RlJ1kECc2r20hkI5OMXhQxyAQzCTNoDJgaAgAvaLLEMkwn+EbkuLvDBLkR78yUoD/Z0gn3yAGhnwk5V2UGBRGLYNmICkvIGzQLqwG8TA0oJQAVvgMymcoYehg+AUXWgoM0kygWC/DbpQ4+89wjYERt0FiRNeNX4GlFJ505EykMacZDPGn7HwCBnxiOMcwjcGJcOEvzqADh2vBQk1AVhaYdZCBc7TKpqJBA9ZiAwDMH49EXcmY2QAAAABJRU5ErkJggg=='
eth_icon='iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAACXBIWXMAABYlAAAWJQFJUiTwAAAC/UlEQVRYw+WYX6gMcRTH997158GD/7Z7mzm/8/vN7KZNN1ohL+vBG+GmyN8Hrrh0S3nQxQPPIg9S8i9SJEUePVGKuOF6Q0qkkD9JQv6M7xmzzO6dXcvO7JJbp+bOTr/zmXO+55zfb1Ke56X+Jkv980D1/GnS8zXRPFy21/N8okDGmEnG5luOUjsN8/qWAznERx2bHgqQo/jl5M7O8S0DcpWaBYivISDPKHWoVUDtABgQiDCQAGaZZzYdCJHYEABUAokN1BJ47ECiE9FLDSBPK9XbNCA4Oxh2HgUEe5XryE1IHMjYZjqcfakDCPf5SNJAbYbo2lDHVYAgcKnExIBcorURTmsBedrmm5UCjwWIiMZiPDyPdEp8Drpajut3kcBEm2IHMor3l785fQTEcehkAaLTD1ukLLUM9/phjyu09Np13YmxAWWVmoqFPwfpeSrpQbQWoxdd8AUeThnR3Sxxn8O8GjPu6s8o8bG4gNqw4BV/gGrdA0frAHD7lxpCVAC8G88vBMwpiShgZzcMlCPSkg7YLjh+9ruilsgC7IxjYQ3mpQ0DyRvi7T5UcVYPUNhOgifdsIZc5iLCPfinQBD5W6R8az6fH9F4hBzHDrSYRpPbWDbD6miMSNcJtIwOf+8UrNUQkCyGijoPmGmymGVZ4yDSAz+qriqQulHq0thVjsb/+1zSK2Mpe7xlt5S3DNXSwNRad2GMXBoCBOHjuTVSnWJyHRTD2bgb4+HSFEeE+iSFfhpsXgKwywDaZoj3SDT83oVNGu5d/76L5CcS2ViBujKZUXBwL5SSO7A58lsxVRwmFkQuI03Q39oGOsKpZG4iwxXOZiAFn8JakR6DqFChUBgOwC1oEW/Kfifem+x+iHhHRFnfB8z2iKE6iBk2MukdY1pGSR2j472xzJSmbGGVUlyWmgggpHJzU08dEO6q6kDqYlD2zT0oomGergTSil+UOnPTgZC6MYB6VHFy7W7t2R69CFF54H9sQPNs+ceG4JzWi0itkOaZONB/9wXtG+MF7xgwhWr8AAAAAElFTkSuQmCC'
xmr_icon='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'

## for each currency get price from api and use printf to strip all but two decimal places for the _price variable
## btc and xmr have two variables because (unformatted) btc price (i.e. $btc) is needed to calculate xmr_price
btc=$(curl -s "https://api.binance.us/api/v3/ticker/price?symbol=BTCUSD" | /usr/local/bin/python -c "import sys, json, dyld; print(json.load(sys.stdin)['price'])")
btc_price=$(printf "%'.2f\n" $btc)
eth_price=$(printf "%'.2f\n" $(curl -s "https://api.binance.us/api/v3/ticker/price?symbol=ETHUSD" | /usr/local/bin/python -c "import sys, json; print(json.load(sys.stdin)['price'])"))
xmr=$(curl -s GET "https://api.binance.com/api/v3/avgPrice?symbol=XMRBTC" | /usr/local/bin/python -c "import sys, json; print(json.load(sys.stdin)['price'])")
xmr_price=$(printf "%'.2f\n" $(echo "$xmr*$btc" | bc))

## display the variables in bitbar/xbar
echo "$btc_price | templateImage=$bitcoin_icon"
echo '---'
echo "$eth_price | templateImage=$eth_icon"
echo "$xmr_price | templateImage=$xmr_icon"
