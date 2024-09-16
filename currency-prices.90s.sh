#!/bin/bash

# Display the current Bitcoin price in the menu bar and additional cryptocurrency prices in the drop-down.
#
# <bitbar.title>Crypto Prices</bitbar.title>
# <bitbar.version>v1.10.1</bitbar.version>
# <bitbar.dependencies>bash, curl, python3</bitbar.dependencies>

# <bitbar.author.github>shotcollin</bitbar.author.github>
# <bitbar.desc>Display current Bitcoin price in the menu bar, with additional cryptocurrency prices in drop-down.</bitbar.desc>
# <bitbar.image>https://raw.githubusercontent.com/shotcollin/bitbar-plugins/main/.github/images/currency-prices.bitbar-image.png</bitbar.image>

## Parse API data for ticker price and use printf to strip limit value to two decimal places
btc_price=$(printf "%'.2f\n" $(curl -s "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=BTC-USDT" | /usr/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data']['price'])"))
eth_price=$(printf "%'.2f\n" $(curl -s "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=ETH-USDT" | /usr/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data']['price'])"))
xmr_price=$(printf "%'.2f\n" $(curl -s "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=XMR-USDT" | /usr/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data']['price'])"))
fil_price=$(printf "%'.2f\n" $(curl -s "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=FIL-USDT" | /usr/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data']['price'])"))
ada_price=$(printf "%'.2f\n" $(curl -s "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=ADA-USDT" | /usr/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data']['price'])"))
erg_price=$(printf "%'.2f\n" $(curl -s "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=ERG-USDT" | /usr/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data']['price'])"))

## Populate values for currency icons
btc_icon='iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAQAAABLCVATAAAACXBIWXMAABYlAAAWJQFJUiTwAAABY0lEQVRIx2P4z0AdyEBzg1DAdIYfQJgCZHmCWdsYMAFRBs0BC2UAWT5g1p6hbZAggwIcrgALVQNZSWDWAQY24g3qwRtJ/xgeMqxkCGJgotQgGLzAoEUdg/4zvGQQIxzYLAyODF/gQv0MlgwWDK4MOQxbgV5DKG0nLtZ2wIUykII2EMmoU8QZtAWrQQwMB+HiDygzaDNc/CQlBskwfIKLN5JrkAxDFsMTuOh9BiFSDXoHDI2HDB9RlJ1kECc2r20hkI5OMXhQxyAQzCTNoDJgaAgAvaLLEMkwn+EbkuLvDBLkR78yUoD/Z0gn3yAGhnwk5V2UGBRGLYNmICkvIGzQLqwG8TA0oJQAVvgMymcoYehg+AUXWgoM0kygWC/DbpQ4+89wjYERt0FiRNeNX4GlFJ505EykMacZDPGn7HwCBnxiOMcwjcGJcOEvzqADh2vBQk1AVhaYdZCBc7TKpqJBA9ZiAwDMH49EXcmY2QAAAABJRU5ErkJggg=='
eth_icon='iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAACXBIWXMAABYlAAAWJQFJUiTwAAAC/UlEQVRYw+WYX6gMcRTH997158GD/7Z7mzm/8/vN7KZNN1ohL+vBG+GmyN8Hrrh0S3nQxQPPIg9S8i9SJEUePVGKuOF6Q0qkkD9JQv6M7xmzzO6dXcvO7JJbp+bOTr/zmXO+55zfb1Ke56X+Jkv980D1/GnS8zXRPFy21/N8okDGmEnG5luOUjsN8/qWAznERx2bHgqQo/jl5M7O8S0DcpWaBYivISDPKHWoVUDtABgQiDCQAGaZZzYdCJHYEABUAokN1BJ47ECiE9FLDSBPK9XbNCA4Oxh2HgUEe5XryE1IHMjYZjqcfakDCPf5SNJAbYbo2lDHVYAgcKnExIBcorURTmsBedrmm5UCjwWIiMZiPDyPdEp8Drpajut3kcBEm2IHMor3l785fQTEcehkAaLTD1ukLLUM9/phjyu09Np13YmxAWWVmoqFPwfpeSrpQbQWoxdd8AUeThnR3Sxxn8O8GjPu6s8o8bG4gNqw4BV/gGrdA0frAHD7lxpCVAC8G88vBMwpiShgZzcMlCPSkg7YLjh+9ruilsgC7IxjYQ3mpQ0DyRvi7T5UcVYPUNhOgifdsIZc5iLCPfinQBD5W6R8az6fH9F4hBzHDrSYRpPbWDbD6miMSNcJtIwOf+8UrNUQkCyGijoPmGmymGVZ4yDSAz+qriqQulHq0thVjsb/+1zSK2Mpe7xlt5S3DNXSwNRad2GMXBoCBOHjuTVSnWJyHRTD2bgb4+HSFEeE+iSFfhpsXgKwywDaZoj3SDT83oVNGu5d/76L5CcS2ViBujKZUXBwL5SSO7A58lsxVRwmFkQuI03Q39oGOsKpZG4iwxXOZiAFn8JakR6DqFChUBgOwC1oEW/Kfifem+x+iHhHRFnfB8z2iKE6iBk2MukdY1pGSR2j472xzJSmbGGVUlyWmgggpHJzU08dEO6q6kDqYlD2zT0oomGergTSil+UOnPTgZC6MYB6VHFy7W7t2R69CFF54H9sQPNs+ceG4JzWi0itkOaZONB/9wXtG+MF7xgwhWr8AAAAAElFTkSuQmCC'
xmr_icon='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'
fil_icon='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'
ada_icon='iVBORw0KGgoAAAANSUhEUgAAABQAAAASCAYAAABb0P4QAAAAAXNSR0IArs4c6QAAAOZlWElmTU0AKgAAAAgABgESAAMAAAABAAEAAAEaAAUAAAABAAAAVgEbAAUAAAABAAAAXgExAAIAAAAhAAAAZgEyAAIAAAAUAAAAiIdpAAQAAAABAAAAnAAAAAAAAABIAAAAAQAAAEgAAAABQWRvYmUgUGhvdG9zaG9wIDIxLjIgKE1hY2ludG9zaCkAADIwMjA6MDY6MjkgMTE6MjQ6MjUAAASQBAACAAAAFAAAANKgAQADAAAAAQABAACgAgAEAAAAAQAAABSgAwAEAAAAAQAAABIAAAAAMjAyMDowNToyMiAxMjoxMzowOAAICRUnAAAACXBIWXMAAAsTAAALEwEAmpwYAAAHvGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNi4wLjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iCiAgICAgICAgICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICAgICAgICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICAgICAgICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAyMC0wNi0yOVQxMToyNDoyNSswMTowMDwveG1wOk1vZGlmeURhdGU+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+QWRvYmUgUGhvdG9zaG9wIDIxLjIgKE1hY2ludG9zaCk8L3htcDpDcmVhdG9yVG9vbD4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMjAtMDUtMjJUMTI6MTM6MDgrMDE6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDIwLTA2LTI5VDExOjI0OjI1KzAxOjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8eG1wTU06SGlzdG9yeT4KICAgICAgICAgICAgPHJkZjpTZXE+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgMjEuMiAoTWFjaW50b3NoKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OndoZW4+MjAyMC0wNS0yMlQxMjoxMzowOCswMTowMDwvc3RFdnQ6d2hlbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDoxOWY1MjYxNi0wMzhhLTRkYjAtYmFjZi0zZWRkNTIyMTcwOTE8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+Y3JlYXRlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6U2VxPgogICAgICAgICA8L3htcE1NOkhpc3Rvcnk+CiAgICAgICAgIDx4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+eG1wLmRpZDoxOWY1MjYxNi0wMzhhLTRkYjAtYmFjZi0zZWRkNTIyMTcwOTE8L3htcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+eG1wLmRpZDoxOWY1MjYxNi0wMzhhLTRkYjAtYmFjZi0zZWRkNTIyMTcwOTE8L3htcE1NOkRvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpJbnN0YW5jZUlEPnhtcC5paWQ6MTlmNTI2MTYtMDM4YS00ZGIwLWJhY2YtM2VkZDUyMjE3MDkxPC94bXBNTTpJbnN0YW5jZUlEPgogICAgICAgICA8cGhvdG9zaG9wOklDQ1Byb2ZpbGU+c1JHQiBJRUM2MTk2Ni0yLjE8L3Bob3Rvc2hvcDpJQ0NQcm9maWxlPgogICAgICAgICA8cGhvdG9zaG9wOkNvbG9yTW9kZT4zPC9waG90b3Nob3A6Q29sb3JNb2RlPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpYUmVzb2x1dGlvbj43MjwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WVJlc29sdXRpb24+NzI8L3RpZmY6WVJlc29sdXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgor2FqvAAACGUlEQVQ4EX2UO2iUQRCALzE+8REVxaiIBjRFCiEgpBCC2CnBgJWNAUFsFMRHYxdII4Ig9mlSSUhhZxEQLESCYKFYCUIIWPhAFJUkvr7vdubPJoID383s7N7szOzctVrLsibMXvRw2JtCj6Gvhd2JljNwqPK1za5w1Oo3i8/h+B76Plq/kvo99q+25z8fmeVmzhhkd5xNv8t94F63C2RdUeXT1DsqR97olw7D2th7hn4StlW5vzfW+Z1YFrUHdQ96VnjLwqAjcBo2FteKzx2sJmC7XjNUvoEZ2JeDcB42wDjYz6+gvIPbYOAL0Aef4CH8gLasfpgbeG28vXkBf2AaHof9Gm3Wi3ATaunK/plpvp4PshXs0yAchTtgYC97Cc/hLXyBnARjeaaZuSvYopwDNy1xJ6Q4lx/BvYvhvIrOTM9a7rbYMLPVYtZ1SxwfS1WWimrpy7fozJKbdNn0MbZAPwzAEbgLZnUd3sBsaB/sn5LX46zFEvJRnmIbaAoehf0K7aMswC2opYnlGJwEU++FS+ArOyIGPAX+dg3ivNqGUegDZRiM0YiDPQEHGs+y4SUGOwH1TzBPdGNMwq50ZB9zrTbLacgLLHMGlP3wABwnxQtTOkzdkgwqbv6EebDh2soxyFf1lT/AHCj203P23ViNZDkO9FDjLYYjlf+NuXUcw0qUpso63bJVGp7DnI0eY/NyHMiLnd8MlLr1F3rRYBCcrtGXAAAAAElFTkSuQmCC'
erg_icon='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'

## Display in bitbar
echo "$btc_price | templateImage=$btc_icon"
echo '---'
echo "$eth_price | templateImage=$eth_icon"
echo "$xmr_price | templateImage=$xmr_icon"
echo "$fil_price | templateImage=$fil_icon"
echo "$ada_price | templateImage=$ada_icon"
echo "$erg_price | templateImage=$erg_icon"
