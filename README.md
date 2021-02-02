# <a href="https://github.com/sucatman5555"><img src="https://github.com/sucatman5555/protospace-33030/blob/master/app/assets/images/logo.png?raw=true" width="240px;" /></a>（ボイスカード） 

「声で伝えるSNSサービス！！」  <br>Voice--carDは、投稿した文章を読み上げたり音声ファイルを投稿して発信する新感覚SNSです！<br>

**ログイン方法**

### 🌐 URL https://protospace-33030.herokuapp.com/ 
<br>-base認証-<br>
**ID: admin**<br>  **password: 2222**<br>
<br>-ゲストユーザ用アカウント-<br>
**email: guestuser@com**<br>  **password: 12345a**<br><br>


# :microphone: 利用方法
**【Voice--carDの作成】**
1. 画面右上の「Voice--carD作成」ボタンをクリックする。

2. Voice--carD作成画面にて以下の記入をして投稿する。
  - タイトル記入
  - カテゴリー選択
  - メッセージ記入
  - 音声読み上げ文章記入欄（※音声読み上げをして欲しい内容を記述する）
  - サムネイル投稿
  - 音声ファイル投稿(※空のまま投稿可能です)　

3. 投稿完了です！！TOP画面に作成したVoice--carDが表示されます。

**【Voice--carDの閲覧】**
1. TOPページにて聞きたいVoice--carDをクリックする。

2. Voice--carDに音声ファイルが投稿されている場合は自動で音声ファイルが再生されます。
<br>また、音声読み上げを利用する場合は「音声読み上げ」ボタンをクリックすることで、
<br>カード作成者が投稿時に「音声読み上げ文章欄」で記入した文章を読み上げます。
<br><br>

# :mag_right: なぜこのサービスを作ったのか:question:
私はYouTubeで動画を投稿する際に、もっと手軽に楽しめるコンテンツがあればと感じておりました。

- **「YouTubeのような動画編集の手間を省いて手軽に投稿したい」**
- **「画面を見ずにリラックスした状態で視聴したい」**
- **「目が不自由な方にもSNSを楽しんでもらいたい」**

コロナ禍で出かける機会も減り「自分と同じようなサービスを求めている人がいるのではないか」と思い、本アプリを制作しました。
<br><br>

# :books: 工夫した点
- 「直感的なわかりやすさ・使いやすさ」 を重視し、１つの投稿を１枚の「Voice--carD」として扱い、カテゴリー毎に色分けをしました。
- 「Voice--carD」のメッセージと音声読み上げ用の文章を使い分けることで「シンプルで使いやすい」と感じてもらえるように意識しました。
- スマホからでも手軽に扱えるように画面サイズを調整できるように工夫しました。
- お気に入り機能を追加することでコレクター要素も楽しめるようにしました。
<br><br>

# :computer::sparkles:使用技術・環境
### 【フロントエンド】
・HTML<br>
・CSS<br>
・JavaScript<br>

### 【バックエンド】
・Ruby 2.6.5<br>
・Ruby on Rails 6.0.3.4<br>

### 【データベース】
・MySQL8.0.22<br>

### 【本番環境】
・AWS(S3)<br>
・Heroku<br>

### 【その他使用技術】
・Git,GitHub<br>
・Rubocop<br>

<br>

# :pencil: 機能一覧
### ユーザー機能
- ユーザー登録（deviseのgemを使用)
- マイページにて以下の投稿の一覧表示
  - プロフィール
  - ジャンル（投稿ジャンル）
  - Twitter(フォローボタン)
  - 作成したVoice--carD一覧
  
<br>

### Voice--carD作成機能
- タイトル記入欄
- カテゴリー選択(Active Hash)
- メッセージ記入欄
- 音声読み上げ文章記入欄（※音声読み上げをして欲しい内容を記述する）
- サムネイル投稿（Active Storage）
- 音声ファイル投稿(CarrierWave)

<br>

### Voice--carD閲覧機能
- Voice--carD内の表示
  - 音声読み上げボタン
  - 音声読み上げ停止ボタン
  - 音声ファイル自動再生機能（※音声ファイルを投稿した場合のみ）
  - 投稿日
  - タイトル
  - メッセージ表示
  - カテゴリー表示(Active Hash)
  - 再生数表示（impressionist）
  - お気に入りカード取得・返却ボタン
  - カード編集、削除ボタン（※投稿ユーザのみ表示）
- コメント投稿機能

<br>

### お気に入り機能
- お気に入りカード一覧表示
  - タイトル
  - サムネイル
  - カテゴリー
  - 投稿者名
  - 再生数
  - お気に入り人数

<br>

### スマホ用のUI

<br>

### テストコード（Rspec）
1. user_spec.rb
2. prototype_spec.rb
<br>
<br>

# :pencil2: 要件定義

https://docs.google.com/spreadsheets/d/1_UJcGQPtxgxvpdZxxSQYXYqBsfbdVsQ-OOzBmtZJlmM/edit#gid=282075926
<br><br>

# :bookmark: 課題と今後の実装予定

### 【課題:①】カテゴリー別表示機能が必要
- ユーザーが選択したカテゴリーのみを一覧表示させる。
### 【課題:②】AWSに当アプリをデプロイする
- EC2に「Voice--carD」をデプロイする。
### 【課題:③】非同期通信によるUIの改善が必要
- お気に入り登録時に画面が上方に遷移してしまうため、JavaScript（非同期通信）に処理を変えてUIの改善をはかる。
<br><br>

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes, dependent: :destroy
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_prototypes, through: :likes, source: :prototype

## prototypes テーブル

| Column             | Type                 | Options                        |
| ------------------ | -------------------- | ------------------------------ |
| title              | string               | null: false                    |
| catch_copy         | text                 | null: false                    |
| concept            | text                 | null: false                    |
| image              | ActiveStorageで実装   |                                |
| item               | CarrierWaveで実装     |                                |
| category_id        | integer              | null: false                    |
| impressions_count  | integer              | default: 0                     |
| user               | references           | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_many :comments, dependent: :destroy
- belongs_to :category
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user


## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| prototype   | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user

## likes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| prototype   | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user
- validates_uniqueness_of :prototype_id, scope: :user_id