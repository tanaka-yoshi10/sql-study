[![Build Status](https://travis-ci.org/JunichiIto/sql-study.svg?branch=master)](https://travis-ci.org/JunichiIto/sql-study)

# sql-study
Sample app for https://nishiwaki-koberb.doorkeeper.jp/events/39705

## How to setup

1. このリポジトリを自分のアカウントへフォークする
2. ローカルにgit cloneする
3. `rbenv local 2.2.4` 実行（または 2.2系の任意のバージョンを指定）
4. `bundle install` 実行
5. `cp config/database.yml.sample config/database.yml` 実行
6. `config/database.yml` を自分の環境に合わせて編集する
7. `bin/rake db:setup` 実行
8. `rails s` 実行
9. http://localhost:3000 にアクセスしてページが開くことを確認
10. `bin/rspec` を実行してテストがエラーなく実行できることを確認

## How to answer

以下は設問0（チュートリアル問題）の解答手順。

1. http://0.0.0.0:3000/questions/q0 を開いて問題を確認する
1. `spec/features/question_0_spec.rb` を開く
1. `xscenario` になっている部分を `scenario` に変更する
1. `bin/rspec` を実行し、テストが失敗することを確認する
1. `app/views/questions/q0.html.slim` を開く
1. `= render layout: 'layouts/answer_section' do` 以下のコードに注目する
1. `/ 望ましくない解答例` の下にある `/table` を `table` に変更する（コメントを外す）
1. http://0.0.0.0:3000/questions/q0 を開いて、Exampleと同じ結果が表示されていることを確認する
1. `bin/rspec` を実行すると、テストはパスするが、"[WARN] Query count: 4" という警告が表示されることを確認する
1. `/ 望ましくない解答例` の下にある `table` を `/table` に戻す
1. `/ 望ましい解答例` の下にある `/table` を `table` に変更する
1. http://0.0.0.0:3000/questions/q0 を開いて、Exampleと同じ結果が表示されていることを確認する。その下に "Query count: 1 OK" と表示されていることもあわせて確認する
1. `bin/rspec` を実行すると、テストがパスし、警告も出ないことを確認する
1. 解答が終わったら、コードの変更点をコミットする

### Rules

- 変更して良いのは `= render layout: 'layouts/answer_section' do` から下のコードと、モデルのコードのみ。コントローラやテストコードは変更してはいけない。
- SQL1発で求められている結果を表示できるようにする。クエリを2回以上発行したり、RubyのコードでソートやフィルタリングをするのはNG。

## License

MIT License.