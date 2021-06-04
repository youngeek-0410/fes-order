# Fes Order
## サービス概要
https://docs.google.com/presentation/d/1iofsOsxJ1JBCvcUQli61Ndvc6dC429BtBOMfwb6WSUg/edit#slide=id.gd75a8018c5_1_0
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
