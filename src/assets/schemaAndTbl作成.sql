DROP TABLE IF EXISTS zinzaidb01.human cascade;
DROP TABLE zinzaidb01.human;

DROP SCHEMA zinzaidb01 CASCADE; --テーブルごとスキーマ削除

\l --データベース一覧の確認

\dn --スキーマ一覧の確認

\dt <スキーマ名>.*
\dt zinzaidb01.*; --すべてのテーブルを確認。一覧を見るだけならこれでいい

\d <スキーマ名>.<テーブル名>
\d zinzaidb01.human; --テーブル構造の確認


CREATE SCHEMA zinzaidb01
CREATE TABLE zinzaidb01.human(
  id VARCHAR(5) PRIMARY KEY,
  name VARCHAR(32) NOT NULL,
  eng_name VARCHAR(32) NOT NULL,
  place VARCHAR(16) NOT NULL,
  picture VARCHAR(128),
  department_id SERIAL UNIQUE
  );


CREATE TABLE zinzaidb01.department(
  id SERIAL PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  FOREIGN KEY (id) REFERENCES zinzaidb01.human(department_id)
);

CREATE TABLE zinzaidb01.skill(
  id SERIAL PRIMARY KEY,
  name VARCHAR(32) NOT NULL
);

CREATE TABLE zinzaidb01.skill_relations(
  human_id VARCHAR(5) NOT NULL,
  skill_id INT NOT NULL,
  level BOOLEAN NOT NULL,
  FOREIGN KEY (human_id) REFERENCES zinzaidb01.human(id),
  FOREIGN KEY (skill_id) REFERENCES zinzaidb01.skill(id)
);

CREATE TABLE zinzaidb01.qualification(
  id SERIAL PRIMARY KEY,
  name VARCHAR(32) NOT NULL
);

CREATE TABLE zinzaidb01.qualification_relations(
  human_id VARCHAR(5) NOT NULL,
  qualification_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  FOREIGN KEY (human_id) REFERENCES zinzaidb01.human(id),
  FOREIGN KEY (qualification_id) REFERENCES zinzaidb01.qualification(id)
);

CREATE TABLE zinzaidb01.traning(
  id SERIAL PRIMARY KEY,
  name VARCHAR(32) NOT NULL
);

CREATE TABLE zinzaidb01.training_relations(
  human_id VARCHAR(5) NOT NULL,
  training_id INT NOT NULL,
  attendance_date DATE NOT NULL,
  FOREIGN KEY (human_id) REFERENCES zinzaidb01.human(id),
  FOREIGN KEY (training_id) REFERENCES zinzaidb01.traning(id)
);
