# TweetWithLINEBotAPI

This is Tweeting
 
I try to tweet with LINE::Bot::API.

|try|result|
|---|---|
|<img src="https://user-images.githubusercontent.com/5573785/63578791-2833e280-c5cc-11e9-8990-e23543e076cf.png" width="250" />|<img src="https://user-images.githubusercontent.com/5573785/63578823-37b32b80-c5cc-11e9-9ab3-994a1ad19bb1.png" width="250" />|

これがあればLineしてる風に見せかけてTweetできる。

## How to use this?
1. HerokuアカウントとHerokuのアプリを作成する
2. 作ったHerokuアプリに環境変数としてTwitterのapiキー、LINE botのキー情報を登録する
2. Heroku cli をインストールする
3. 下記コマンドを実行する
    ```
    heroku login
    heroku container:login
    heroku container:push --app <your app name> web
    heroku container:release --app <your app name> web
    ```
