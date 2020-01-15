DROP TABLE IF EXISTS tutorial.??? CASCADE;

DROP SCHEMA tutorial CASCADE;

CREATE SCHEMA tutorial
CREATE TABLE tutorial.heroes(
  id INT PRIMARY KEY,
  name VARCHAR(64) NOT NULL
);

-- データを取得するとき
SELECT * FROM　<テーブル名>; -- tutorial.hero等
SELECT * FROM tutorial.heroes WHERE 'id' = 10; -- IDが10の人の情報をすべて取得
SELECT * FROM tutorial.heroes WHERE 'id' = 10 OR 'id' = 15 OR 'id' = 25; --複数条件で検索するとき
SELECT * FROM tutorial.heroes WHERE 'id' = 10 AND 'name' = 'アキオ・イノウエ'; --複数条件で検索するとき
SELECT * FROM tutorial.heroes WHERE 'id' = IN(10, 15, 25) AND 'name' = 'アキオ・イノウエ'; --IN句を使って省略した場合

-- ワイルドカードを使ってあいまい検索もできる。
SELECT * FROM tutorial.heroes WHERE 'name' = '%ア%';
-- 結果：名前にアを含むものすべての、すべての情報が表示される。


-- データをインサートするとき　上記のテーブルに入れる場合
INSERT INTO tutorial.heroes (id, name) VALUES
(10, 'アイアンマン'),
(11, 'ハルク'),
(12, 'ウォーマシーン'),
(13, 'マイティ･ソー'),
(14, 'キャプテン・アメリカ'),
(15, 'ブラック・ウィドウ'),
(16, 'アキオ・イノウエ'),
(17, 'ホークアイ'),
(18, 'ファルコン'),
(19, 'スター・ロード'),
(20, 'ロケット・ラクーン'),
(21, 'スカーレット・ウィッチ'),
(22, 'ヴィジョン'),
(23, 'アントマン'),
(24, 'スパイダーマン'),
(25, 'ドクター・ストレンジ'),
(26, 'ブラックパンサー'),
(27, 'ワスプ'),
(28, 'キャプテン・マーベル');

-- column名を省略してINSERTすることもできる。
INSERT INTO tutorial.heroes VALUES　--以下略


UPDATE <テーブル名> SET <更新処理>
-- WHERE句を使用しない場合、すべての情報が更新されてしまうので注意。
UPDATE tutorial.heroes SET 'name' = 'トズカ・ユースケ' WHERE 'id' = 16;


-- WHERE句をつけない場合、すべてのデータが削除されてしまうので注意
DELETE FROM tutorial.heroes WHERE 'id' = 15;

