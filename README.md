# Fes Order
## サービス概要
[ハッカソン発表資料](https://docs.google.com/presentation/d/1iofsOsxJ1JBCvcUQli61Ndvc6dC429BtBOMfwb6WSUg/edit#slide=id.gd75a8018c5_1_0)

文化祭、地域祭りなどで使える事前決済サービスです。

Pay.jpを用いた事前決済機能に加え、購入特典としてクイズゲームの提供、クイズの景品として決済時に使えるクーポン発行などの機能があります。

また、店側の管理画面も用意し注文された商品を一覧で確認し、各商品ごとに完成時にユーザに知らせることができます。
## 環境構築
env.shにdockerコマンドをスクリプトとしてまとめています。
```
$ git clone $this_repository
$ cd $POJECT_PATH
$ source env.sh
$ build
$ bundle install
$ yarn install
$ cp .env.sample .env # このタイミングで.envにAPIキーを記述
$ rails db:create db:migrate db:seed
$ up
```
