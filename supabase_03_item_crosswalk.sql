-- ====================================================================
-- item_crosswalk：跨量表題目對照表（STFD Feature ↔ 6份標準量表題目）
-- 依賴：需先建立 stfd_features、scale_items 兩張表
-- 使用方式：在 Supabase SQL Editor 選好資料庫 → SQL 分頁 → 貼上執行
-- ====================================================================

CREATE TABLE item_crosswalk (
  id BIGSERIAL PRIMARY KEY,
  stfd_feature_id VARCHAR(10) NULL,
  scale_code VARCHAR(20) NOT NULL,
  item_code VARCHAR(20) NOT NULL,
  overlap_type VARCHAR(20) NOT NULL,
  handling_note VARCHAR(300) NOT NULL
);

INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M03', 'GAD7', '1', 'high_similar', '量表題保留原樣計分；STFD M03可省略不重複問，改標記由GAD7-1代填');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M01', 'GAD7', '2', 'high_similar', '同上，M01可由GAD7-2/3代表，不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M01', 'GAD7', '3', 'high_similar', '與GAD7-2同構念，STFD M01可省略');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M03', 'GAD7', '4', 'related', '構念相關但非完全相同，STFD M03維持不變，僅資料端建關聯標記');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'GAD7', '5', 'no_overlap', 'STFD無對應Feature，保留獨立');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M04', 'GAD7', '6', 'high_similar', '量表題保留；STFD M04可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'GAD7', '7', 'no_overlap', 'STFD無對應Feature（M06易受驚為對突發事件反應，構念不同），保留獨立');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'PHQ8', '1', 'no_overlap', 'STFD無對應Feature（無anhedonia條目），保留獨立');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M05', 'PHQ8', '2', 'exact', '完全重複，STFD M05可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S01', 'PHQ8', '3', 'high_similar', '一題涵蓋多個STFD Feature，量表題保留計分；STFD S01/S02維持獨立以取得細節，但UI排版相鄰呈現');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S02', 'PHQ8', '3', 'high_similar', '一題涵蓋多個STFD Feature，量表題保留計分；STFD S01/S02維持獨立以取得細節，但UI排版相鄰呈現');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S05', 'PHQ8', '3', 'high_similar', '一題涵蓋多個STFD Feature，量表題保留計分；STFD S01/S02維持獨立以取得細節，但UI排版相鄰呈現');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S14', 'PHQ8', '4', 'related', '構念相關，S14/B01維持獨立以精確區分嗜睡/疲倦/無力');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('B01', 'PHQ8', '4', 'related', '構念相關，S14/B01維持獨立以精確區分嗜睡/疲倦/無力');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('G01', 'PHQ8', '5', 'high_similar', '量表題保留；STFD G01/G02可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('G02', 'PHQ8', '5', 'high_similar', '量表題保留；STFD G01/G02可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'PHQ8', '6', 'no_overlap', 'STFD無對應Feature，保留獨立');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M07', 'PHQ8', '7', 'high_similar', '量表題保留；STFD M07可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'PHQ8', '8', 'no_overlap', 'STFD無對應Feature，保留獨立');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('L08', 'PSQI', '1', 'related', '背景時間資訊，可輔助判讀L08作息不規律，不直接合併');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S01', 'PSQI', '2', 'exact', '與PSQI 5(1)、STFD S01同構念，三者擇一或標記互相參照');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S04', 'PSQI', '3', 'related', '背景時間資訊，可輔助判讀S04過早醒來');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S05', 'PSQI', '4', 'exact', '與STFD S05同構念，量表題保留計分，S05可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S01', 'PSQI', '5(1)', 'exact', '與STFD S01同構念，量表題保留計分，S01可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S02', 'PSQI', '5(2)', 'high_similar', '對應S02夜間易醒/S04過早醒來，量表題保留，STFD維持獨立取細節');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S04', 'PSQI', '5(2)', 'high_similar', '對應S02夜間易醒/S04過早醒來，量表題保留，STFD維持獨立取細節');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('K01', 'PSQI', '5(3)', 'high_similar', '量表題保留；STFD K01可省略不重複問，或用K01細節（次數）補充');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('B08', 'PSQI', '5(4)', 'high_similar', '量表題保留；STFD B08/S11維持獨立以區分日夜情境');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S11', 'PSQI', '5(4)', 'high_similar', '量表題保留；STFD B08/S11維持獨立以區分日夜情境');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S09', 'PSQI', '5(5)', 'exact', '與STFD S09同構念，量表題保留計分，S09可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('C01', 'PSQI', '5(6)', 'related', '構念相關但較籠統，STFD C01/C03維持獨立以精確區分全身/末梢');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('C03', 'PSQI', '5(6)', 'related', '構念相關但較籠統，STFD C01/C03維持獨立以精確區分全身/末梢');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('C02', 'PSQI', '5(7)', 'related', '構念相關，STFD C02/C05維持獨立以區分持續/陣發');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('C05', 'PSQI', '5(7)', 'related', '構念相關，STFD C02/C05維持獨立以區分持續/陣發');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S08', 'PSQI', '5(8)', 'exact', '與STFD S08同構念，量表題保留計分，S08可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('B03', 'PSQI', '5(9)', 'related', '構念籠統，STFD相關疼痛Feature（B03/K04等）維持獨立取得部位細節');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('K04', 'PSQI', '5(9)', 'related', '構念籠統，STFD相關疼痛Feature（B03/K04等）維持獨立取得部位細節');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('L10', 'PSQI', '7', 'exact', '與STFD L10同構念，量表題保留計分，L10可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S13', 'PSQI', '8', 'high_similar', '量表題保留；STFD S13可省略不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S14', 'PSQI', '9', 'related', '構念相關，STFD S14/M07維持獨立以精確區分');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('M07', 'PSQI', '9', 'related', '構念相關，STFD S14/M07維持獨立以精確區分');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('L12', 'PSQI', '10', 'related', '背景資訊，可輔助判讀L12睡眠環境干擾，不直接合併');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S09', 'STOPBANG', 'S', 'exact', '與STFD S09、PSQI 5(5)三重重複，量表題保留計分，S09可省略');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S12', 'STOPBANG', 'T', 'high_similar', '量表題保留；STFD S12/S14維持獨立以精確區分嗜睡/疲倦');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S14', 'STOPBANG', 'T', 'high_similar', '量表題保留；STFD S12/S14維持獨立以精確區分嗜睡/疲倦');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S10', 'STOPBANG', 'O', 'exact', '與STFD S10同構念，量表題保留計分，S10可省略');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S11', 'STOPBANG', 'O', 'exact', '與STFD S10同構念，量表題保留計分，S10可省略');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'STOPBANG', 'P', 'no_overlap', '共病史而非症狀特徵，STFD無對應，僅存於STOP-Bang');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('B12', 'STOPBANG', 'B', 'weak', 'BMI為靜態指標，B12為體重變化動態指標，構念不同，不合併');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'STOPBANG', 'A', 'no_overlap', '背景資料，複用demographics，不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'STOPBANG', 'N', 'no_overlap', '背景資料，STOP-Bang專用');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES (NULL, 'STOPBANG', 'G', 'no_overlap', '背景資料，複用demographics，不重複問');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S12', 'ESS', '1-8（全部8題）', 'high_similar', 'ESS整份量表是S12日間嗜睡的情境化細節版，量表題保留完整計分；STFD S12/S13可省略不重複問，兩者資料互相參照');
INSERT INTO item_crosswalk (stfd_feature_id, scale_code, item_code, overlap_type, handling_note) VALUES ('S13', 'ESS', '1-8（全部8題）', 'high_similar', 'ESS整份量表是S12日間嗜睡的情境化細節版，量表題保留完整計分；STFD S12/S13可省略不重複問，兩者資料互相參照');

-- 欄位說明
COMMENT ON COLUMN item_crosswalk.stfd_feature_id IS '對應 stfd_features.feature_id，可為空（表示無對應）';
COMMENT ON COLUMN item_crosswalk.scale_code IS '對應 scale_items.scale_code';
COMMENT ON COLUMN item_crosswalk.item_code IS '對應 scale_items.item_code';
COMMENT ON COLUMN item_crosswalk.overlap_type IS 'exact/high_similar/related/weak/no_overlap';
COMMENT ON COLUMN item_crosswalk.handling_note IS 'UI排版與去重處理建議';
