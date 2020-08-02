require 'trello'
require 'pry'

def puts_todos
  configure
  cards = get_cards

  # 出力
  puts "========================="
  puts "【TODO】"
  cards.each do |card|
    puts card.name
  end
  puts "========================="
end

# 認証
def configure

  Trello.configure do |config|
    config.developer_public_key = 'TRELLO_DEVELOPER_PUBLIC_KEY'
    config.member_token = 'TRELLO_MEMBER_TOKEN'
  end
end

# カードの取得
def get_cards
  member = Trello::Member.find('TrelloのユーザーID')
  boards = member.boards
  board = boards.find { |board| board.name == 'TODO' }
  list = board.lists[0]
  cards = list.cards
  cards
end

puts_todos