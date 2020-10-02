<img width="536" alt="スクリーンショット 2020-10-02 18 00 39" src="https://user-images.githubusercontent.com/69449342/94906332-43646780-04d9-11eb-8465-25472486b001.png">

## 概要
タスクを登録し、日々の積み上げを記録するためのアプリです。  
記録は簡単にTwitterに投稿することが可能です。

## 開発環境 
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- jQuery
- VSCode(Visual Studio Code)

## 制作背景

## URL
 **https://stack-tweets.heys-apps.work/**

## 利用方法
![task](https://user-images.githubusercontent.com/69449342/94908500-b7ecd580-04dc-11eb-97e4-22cf9bfd9b02.gif)
![count](https://user-images.githubusercontent.com/69449342/94908506-b9b69900-04dc-11eb-936f-4f571d326a41.gif)

- アプリをTwitterと連携します（ログイン）
- フォームからタスクとそのカウント単位を登録します
- 今日の積み上げ列のフォームにカウントを入力しして「追加ボタン」を押します
- 累計に反映されると同時に、画面下部にそのタスクに関するツイート文が生成されます
- 「累計をツイート」にチェックが入っていた場合は、累計の数字がツイート文に反映されます
- 「Twitterでツイートする」ボタンを押すと、Twitter公式の投稿画面に遷移します
- 表のタスク名をクリックすると、編集削除のウィンドウが表示されます

## ローカルでの動作方法
`$ git clone https://github.com/shohey-421/stack-tweets.git`  
`% cd stack-tweets`  
`% bundle install`  
`% rails db:create`  
`% rails db:migrate`  
`$ rails s`  

- - -

## 実装予定の機能
- 目標の設定管理
- ツイート文の「・」を任意の記号や絵文字に変更
