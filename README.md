# portfolio アプリケーション
* ポートフォリオとして作成したwebアプリ群を一つにまとめたサイトです。
* URL: https://portfolio-box.jp（現在使えません）
* アカウントを作成しなくても、ヘッダーの「log in」ボタンからログインページに移動後ゲストログインができます。メールアドレスの登録が必要ですが、アカウントの新規作成もできます。
<img width="1008" alt="portfolio_top" src="https://github.com/komanosuke/portfolio/assets/54266017/a85854a5-2408-43de-b057-1870b64882b7">

# 使用技術

* Ruby 3.1.3
* Ruby on Rails 6.1.6.1
* Unicorn
* Nginx

## テスト
* RSpec

## データベース
* RDS(MySQL)

## コンテナ
* Docker → ECR 開発環境ではdocker-compose(web, nginx)

## CI/CD
* CircleCI

## デプロイ
* ECS, ALB

## AWSの設定管理
* Terraform

## API
* ChatGPT API

## ER図
![drawio](https://github.com/komanosuke/portfolio/assets/54266017/64141dc0-cbab-409b-9b37-7cdc38037b47)


# サービス概要

## ECショップ
* 架空のファッションブランドのECショップです。カート機能やお問い合わせメール機能、管理者による商品や記事の編集機能が実装されています。
<img width="1438" alt="cxxsew_top" src="https://github.com/komanosuke/portfolio/assets/54266017/0eaacb60-f535-4467-b1b4-11afbc2dfa9d">


## SNS
* 架空のファッションデザイナー向けSNSです。デザインした服をアピールするために利用できます。投稿機能、投稿編集機能、いいね機能、コメント機能、フォロー機能、画像投稿機能、無限スクロールページネーションなどが実装されています。
<img width="1440" alt="sns" src="https://github.com/komanosuke/portfolio/assets/54266017/cbe289c8-68a2-4b8b-8728-6dc459bb8208">


## 学習サイト
* 学習の基礎となる「漢字の読み方」や「基本計算」ができます。正解すると、キャラクターの画像をコレクションできる機能があります。ログインすると、ヘッダーの「学習記録」からコレクションを閲覧できます。
<img width="1440" alt="kanji_top" src="https://github.com/komanosuke/portfolio/assets/54266017/a2d12334-c160-448a-b366-72c88b237ea8">


## 英検１級単語ドリル
* 英検１級の英単語を学習できます。自動読み上げ機能があります。
<img width="1440" alt="eiken" src="https://github.com/komanosuke/portfolio/assets/54266017/9e4630cd-87d2-4bb9-8382-0a69c24a909f">


## ドラえもんトーク
* ChatGPTのAPIを使用しています。声は違いますが、ドラえもんと話しているような感覚を得られます。
<img width="1440" alt="doraemon" src="https://github.com/komanosuke/portfolio/assets/54266017/7877e92c-4a49-45eb-8cfc-4a5a123cb771">


## IoT機器と通信できるアプリ
* IoT機器と接続していないので単なるデモですが、IoT機器のカラー変更などの操作や、機器から送られるデータの視覚化ができるwebアプリです。
<img width="1440" alt="iot_gadget" src="https://github.com/komanosuke/portfolio/assets/54266017/65286319-f38d-44d6-95f7-2a0bdc71d9e0">


## 生涯収支の概算アプリ
* 生きていくのにどれだけお金がかかるかを視覚化できます。
<img width="1440" alt="cost" src="https://github.com/komanosuke/portfolio/assets/54266017/a905fb25-abee-4d15-ac69-ab807795db22">


## 似顔絵展
* 似顔絵イラストレーターとしてのポートフォリオです。
<img width="1440" alt="portrait" src="https://github.com/komanosuke/portfolio/assets/54266017/9d8803aa-f2fc-4943-aae3-46fbe44ccdbb">

## AI関連ニュースメディアサイト
* YahooニュースからAI関連のニュースをスクレイピングしています。
<img width="1439" alt="AInews" src="https://github.com/komanosuke/portfolio/assets/54266017/f8ec1dfd-f2a5-44cb-9e7d-38deb8f38f2e">

