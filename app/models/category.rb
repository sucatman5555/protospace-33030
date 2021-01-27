class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '政治・経済' },
    { id: 3, name: 'コミニュティ' },
    { id: 4, name: 'アニメ' },
    { id: 5, name: 'ゲーム' },
    { id: 6, name: 'ファッション・デザイン' },
    { id: 7, name: '音楽' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]
  
  include ActiveHash::Associations
  has_many :prototypes
end
