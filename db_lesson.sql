-- Q1: departments テーブル
CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2: peopleテーブルに新しいカラムを追加
ALTER TABLE people
ADD department_id INT UNSIGNED NULL
After email;

ALTER TABLE people
  MODIFY person_id INT(10) UNSIGNED AUTO_INCREMENT,
  MODIFY department_id INT(10) UNSIGNED,
  MODIFY age TINYINT(3) UNSIGNED,
  MODIFY gender TINYINT(4),
  MODIFY created_at TIMESTAMP CURRENT_TIMESTAMP;

-- Q3: レコードを追加する
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender) VALUES
('佐藤太郎', 'sato@gizumo.jp', 1, 28, 1),
('鈴木花子', 'suzuki@gizumo.jp', 1, 25, 2),
('高橋一郎', 'takahashi@gizumo.jp', 1, 58, 1),
('田中次郎', 'tanaka@gizumo.jp', 2, 30, 1),
('伊藤真由美', 'ito@gizumo.jp', 2, 27, 2),
('山本健', 'yamamoto@gizumo.jp', 2, 35, 1),
('中村さやか', 'nakamura@gizumo.jp', 2, 45, 2),
('小林亮', 'kobayashi@gizumo.jp', 3, 31, 1),
('加藤美咲', 'kato@gizumo.jp', 4, 26, 2),
('吉田拓也', 'yoshida@gizumo.jp', 5, 33, 1);

INSERT INTO reports (person_id, content) VALUES
(15, '営業部の打ち合わせを実施しました。'),
(14, '新規顧客の開拓状況をまとめました。'),
(13, '経理部の月次報告書を作成しました。'),
(12, '人事面談の準備を進めました。'),
(6, 'システムメンテナンスを実施しました。'),
(7, '顧客へのフォローアップメールを送信。'),
(8, '開発タスクの進捗状況を確認しました。'),
(9, '請求書のチェックを行いました。'),
(10, '採用面接のスケジュールを調整しました。'),
(11, 'サーバーログの確認と対応を実施しました。');

-- Q4: department_idがNULLの人に部署のIDを割り振る
UPDATE people SET department_id = 4 WHERE department_id IS NULL;

-- Q5: 年齢の降順で男性の名前と年齢を取得
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6: テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

  -- peopleテーブルの中から、department_id が 1 のレコードを対象に、そのレコードが持つ name・email・age というカラムの値を取得し、created_at カラムの値を基準に昇順で並び替えて表示するクエリ。

-- Q7: 20代の女性と40代の男性の名前一覧
SELECT name FROM people WHERE 
  (gender = 2 AND age BETWEEN 20 AND 29)
  OR
  (gender = 1 AND age BETWEEN 40 AND 49);

-- Q8: 営業部に所属する人だけを年齢の昇順で取得
SELECT name, age FROM people WHERE department_id=1 ORDER BY age ASC;

-- Q9: 開発部に所属している女性の平均年齢を取得
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

-- Q10: 名前と部署名とその人が提出した日報の内容を同時に取得
SELECT p.name, d.name, r.content FROM people p
INNER JOIN reports r ON p.person_id = r.person_id
INNER JOIN departments d ON p.department_id = d.department_id;

-- Q11: 日報を一つも提出していない人の名前一覧を取得
SELECT p.name FROM people p
LEFT JOIN reports r
ON p.person_id = r.person_id
WHERE r.person_id IS NULL;

