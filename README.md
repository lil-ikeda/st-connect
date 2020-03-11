# マッチングアプリ「Street Connect」

# アプリ概要
ストリートスポーツのマッチングアプリです。<br>
マッチングした相手とはアプリ内でチャットをすることができるので、一緒にイベントに出演するメンバーを探したり、練習相手を探すことができます。

# 作成した経緯
ストリートシーンにおいてイベント運営を行っている知人より、「イベント集客と、参加者管理の手間に課題がある」との悩みを聞き、その課題を解決するために作成しました。<br>特にチームスポーツのイベントの場合は、集客が思うようにいかない原因の一つに「一緒にイベントに出るためのメンバー探しが難しいこと」が挙げられるようでしたので、同時に参加者管理も行えるようなツールを作ることができればと考え、制作に至りました。

# リンク
**https://st-connect.net/**<br>
トップページ最上部オレンジ色の箇所からゲストログインが可能です。<br>
プロフィール編集、アカウント削除機能以外は全ての機能がご利用いただけます。

# 機能一覧
- **ユーザー関連**
  - アカウント作成機能・ログイン機能
  - フォロー機能（アプリ内では「リクエスト」と記載しています）
  - マッチングした相手とのチャット機能
  - リクエスト通知機能
- **イベント関連**
  - イベント作成・参加機能
  - イベント検索機能
  - イベントへのコメント機能

# 使用画面サンプル

| トップページ | イベント作成画面 | イベント詳細/コメント投稿画面 |
----|----|----
| <img src="https://i.gyazo.com/9ad82c0e5fb18e0472498eb7bebda380.png" width="300px"> | <img src="https://i.gyazo.com/1011cb60a6810a1344abbf37f9fe776c.png" width="300px"> | <img src="https://i.gyazo.com/5e810e77ac5305eb74c8666b0ec95242.png" width="300px"> |

| ユーザー詳細ページ/リクエスト機能 | チャット画面 | リクエスト通知一覧画面 |
----|----|----
| <img src="https://i.gyazo.com/b4129fd78361057fd82d271ca0ca03fb.png" width="300px"> | <img src="https://i.gyazo.com/6e7f0cf017c7766d4dcbfd6d38903a38.png" width="300px"> | <img src="https://i.gyazo.com/e9aa6047f5bb9094b2bcc95c902a7fb2.png" width="300px"> |


# 使用技術
- **バックエンド**
  - Ruby 2.5.1
  - Rails 5.2.3
  - Mysql 5.6.46

- **フロントエンド**
  - haml
  - sass
  - JavaScript
  - JQuery

## インフラストラクチャー
- **CircleCI**
- **AWS**
  - Route53
  - ACM
  - VPC
  - ALB
  - EC2
  - RDS
  - S3
- **Docker**
  - Docker 19.03.5
  - docker-compose 1.25.4

## クラウドアーキテクチャ[![Image from Gyazo](https://i.gyazo.com/94e9265d0eac7d9076cb9705d3dbba71.png)](https://gyazo.com/94e9265d0eac7d9076cb9705d3dbba71)
