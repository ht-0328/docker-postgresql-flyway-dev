-- 都道府県マスタテーブルの作成
CREATE TABLE IF NOT EXISTS master.prefectures (
    code CHAR(2) PRIMARY KEY,          -- 都道府県コード（2桁）
    name VARCHAR(50) NOT NULL          -- 都道府県名
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE master.prefectures IS '都道府県';
COMMENT ON COLUMN master.prefectures.code IS '都道府県コード';
COMMENT ON COLUMN master.prefectures.name IS '都道府県名';
