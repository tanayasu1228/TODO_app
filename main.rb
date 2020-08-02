require 'trello'
require 'pry'

# 認証
Trello.configure do |config|
  config.developer_public_key = 'TRELLO_DEVELOPER_PUBLIC_KEY'
  config.member_token = 'TRELLO_MEMBER_TOKEN'
end

# カードの取得
member = Trello::Member.find('TrelloのユーザーID')
boards = member.boards
board = boards.find { |board| board.name == 'TODO' }
list = board.lists[0]
cards = list.cards

# 出力
puts "========================="
puts "【TODO】"
cards.each do |card|
  puts card.name
end
puts "========================="