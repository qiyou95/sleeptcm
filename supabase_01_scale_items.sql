-- ====================================================================
-- scale_items：六份標準量表的題目定義表
-- 適用資料庫：sleep_tcm_db（或你自己命名的資料庫）
-- 使用方式：在 Supabase Dashboard → SQL Editor → 貼上全部內容 → Run
-- ====================================================================

CREATE TABLE scale_items (
  id BIGSERIAL PRIMARY KEY,
  scale_code VARCHAR(20) NOT NULL,
  item_code VARCHAR(10) NOT NULL,
  display_order INT NOT NULL,
  item_text VARCHAR(500) NOT NULL,
  response_type VARCHAR(30) NOT NULL,
  score_min INT NULL,
  score_max INT NULL,
  notes VARCHAR(255) NULL
);

-- --------------------------------------------------------------------
-- GAD-7（7題，0-3分頻率量表）
-- --------------------------------------------------------------------
INSERT INTO scale_items (scale_code, item_code, display_order, item_text, response_type, score_min, score_max, notes) VALUES
('GAD7','1',1,'感到緊張、不安或煩躁','freq4',0,3,NULL),
('GAD7','2',2,'無法停止或控制憂慮','freq4',0,3,NULL),
('GAD7','3',3,'對不同事情過度擔憂','freq4',0,3,NULL),
('GAD7','4',4,'身心難以放鬆','freq4',0,3,NULL),
('GAD7','5',5,'焦躁不安到難以安靜坐著','freq4',0,3,NULL),
('GAD7','6',6,'容易心煩或易怒','freq4',0,3,NULL),
('GAD7','7',7,'感到害怕，就像要發生可怕的事情','freq4',0,3,NULL);

-- --------------------------------------------------------------------
-- PHQ-8（8題，0-3分頻率量表）
-- --------------------------------------------------------------------
INSERT INTO scale_items (scale_code, item_code, display_order, item_text, response_type, score_min, score_max, notes) VALUES
('PHQ8','1',1,'做事時提不起勁或沒有樂趣','freq4',0,3,NULL),
('PHQ8','2',2,'感到心情低落、沮喪或絕望','freq4',0,3,NULL),
('PHQ8','3',3,'入睡困難、睡不安穩或睡眠過多','freq4',0,3,NULL),
('PHQ8','4',4,'感覺疲倦或沒有活力','freq4',0,3,NULL),
('PHQ8','5',5,'食慾不振或吃太多','freq4',0,3,NULL),
('PHQ8','6',6,'覺得自己很糟-或覺得自己很失敗，或讓自己或家人失望','freq4',0,3,NULL),
('PHQ8','7',7,'對事物專注有困難，例如閱讀報紙或看電視時','freq4',0,3,NULL),
('PHQ8','8',8,'動作或說話速度緩慢到別人已經察覺，或正好相反-煩躁或坐立不安、動來動去的情況更勝於平常','freq4',0,3,NULL);

-- --------------------------------------------------------------------
-- PSQI（機構官方版：4開放題 + 10子項 + 4選項題 + 1睡伴狀況題）
-- --------------------------------------------------------------------
INSERT INTO scale_items (scale_code, item_code, display_order, item_text, response_type, score_min, score_max, notes) VALUES
('PSQI','1',1,'過去這一個月來，您通常何時上床？','open_time',NULL,NULL,'記錄時:分'),
('PSQI','2',2,'過去這一個月來，您通常多久才能入睡？','open_number',NULL,NULL,'單位：分鐘'),
('PSQI','3',3,'過去這一個月來，您早上通常何時起來？','open_time',NULL,NULL,'記錄時:分'),
('PSQI','4',4,'過去這一個月來，您實際每晚可以入睡幾小時？','open_number',NULL,NULL,'單位：小時'),
('PSQI','5(1)',5,'無法在30分鐘內入睡','freq4',0,3,'從未發生/每星期少於一次/每星期有一兩次/每星期三次以上'),
('PSQI','5(2)',6,'在半夜或凌晨便清醒','freq4',0,3,NULL),
('PSQI','5(3)',7,'必須起來上廁所','freq4',0,3,NULL),
('PSQI','5(4)',8,'覺得呼吸不順暢','freq4',0,3,NULL),
('PSQI','5(5)',9,'大聲打鼾或咳嗽','freq4',0,3,NULL),
('PSQI','5(6)',10,'會覺得冷','freq4',0,3,NULL),
('PSQI','5(7)',11,'會覺得躁熱','freq4',0,3,NULL),
('PSQI','5(8)',12,'做惡夢','freq4',0,3,NULL),
('PSQI','5(9)',13,'身上有疼痛','freq4',0,3,NULL),
('PSQI','5(10)',14,'其他，請說明','freq4',0,3,'需另附文字說明欄位'),
('PSQI','6',15,'整體而言，你覺得自己的睡眠品質如何？','choice4',0,3,'很好/還不錯/差了點/很差'),
('PSQI','7',16,'你通常一星期幾個晚上需要使用藥物幫忙睡眠？','choice4',0,3,'未發生/不到一次/一兩次/三次或三次以上'),
('PSQI','8',17,'你是否曾在用餐、開車或社交場合瞌睡而無法保持清醒，每星期約幾次？','choice4',0,3,NULL),
('PSQI','9',18,'你會感到無心完成該做的事','choice4',0,3,'沒有/有一點/的確有/很嚴重'),
('PSQI','10',19,'您有睡伴或室友嗎？','choice4',NULL,NULL,'沒有睡伴或室友/不同臥房/同室不同床/同床，不直接計分，用於輔助判讀');

-- --------------------------------------------------------------------
-- STOP-Bang（8題，是/否）
-- --------------------------------------------------------------------
INSERT INTO scale_items (scale_code, item_code, display_order, item_text, response_type, score_min, score_max, notes) VALUES
('STOPBANG','S',1,'你是否打呼大聲（聲音大到可以從關閉的門外聽到，或枕邊人會因你晚上打呼而用手肘頂你）？','yesno',0,1,NULL),
('STOPBANG','T',2,'你是否在白天經常覺得疲勞、疲累或想睡覺（例如開車時睡著）？','yesno',0,1,NULL),
('STOPBANG','O',3,'是否有任何人觀察到你在睡覺時呼吸停止或嗆到/喘氣？','yesno',0,1,NULL),
('STOPBANG','P',4,'你是否有高血壓，或正在接受高血壓治療？','yesno',0,1,NULL),
('STOPBANG','B',5,'身高體重指數是否超過35公斤/平方公尺？','yesno',0,1,NULL),
('STOPBANG','A',6,'年紀超過50歲？','yesno',0,1,NULL),
('STOPBANG','N',7,'頸圍尺寸是大號？（男性襯衫領口17吋/43公分以上；女性16吋/41公分以上）','yesno',0,1,'需另存性別欄位以判斷門檻'),
('STOPBANG','G',8,'性別－男性？','yesno',0,1,NULL);

-- --------------------------------------------------------------------
-- ESS（8題，0-3分頻率量表）
-- --------------------------------------------------------------------
INSERT INTO scale_items (scale_code, item_code, display_order, item_text, response_type, score_min, score_max, notes) VALUES
('ESS','1',1,'坐著閱讀時','freq4',0,3,NULL),
('ESS','2',2,'看電視時','freq4',0,3,NULL),
('ESS','3',3,'在公眾場合安靜坐著（例如戲院裡或開會中）','freq4',0,3,NULL),
('ESS','4',4,'坐車連續超過一個小時（不含自己開車）','freq4',0,3,NULL),
('ESS','5',5,'在下午躺著休息時','freq4',0,3,NULL),
('ESS','6',6,'坐著與人交談時','freq4',0,3,NULL),
('ESS','7',7,'沒有喝酒的情況下，在午餐後安靜坐著時','freq4',0,3,NULL),
('ESS','8',8,'開車中，在車子停下來數分鐘時','freq4',0,3,NULL);

-- --------------------------------------------------------------------
-- AD8（8題，有改變/沒有改變/不知道，由家屬或照顧者代答）
-- --------------------------------------------------------------------
INSERT INTO scale_items (scale_code, item_code, display_order, item_text, response_type, score_min, score_max, notes) VALUES
('AD8','1',1,'判斷力上的困難：例如落入圈套或騙局、財務上不好的決定、買了對受禮者不合宜的禮物','yesno_unknown',0,1,NULL),
('AD8','2',2,'對活動和嗜好的興趣降低','yesno_unknown',0,1,NULL),
('AD8','3',3,'重複相同的問題、故事和陳述','yesno_unknown',0,1,NULL),
('AD8','4',4,'在學習如何使用工具、設備和小器具上有困難','yesno_unknown',0,1,NULL),
('AD8','5',5,'忘記正確的月份和年份','yesno_unknown',0,1,NULL),
('AD8','6',6,'處理複雜的財務上有困難','yesno_unknown',0,1,NULL),
('AD8','7',7,'記住約會的時間有困難','yesno_unknown',0,1,NULL),
('AD8','8',8,'有持續的思考和記憶方面的問題','yesno_unknown',0,1,NULL);


-- 欄位說明
COMMENT ON COLUMN scale_items.scale_code IS '量表代碼：GAD7/PHQ8/PSQI/STOPBANG/ESS/AD8';
COMMENT ON COLUMN scale_items.item_code IS '題號或題碼，如 1、S、(1)';
COMMENT ON COLUMN scale_items.display_order IS '顯示順序，用於排版';
COMMENT ON COLUMN scale_items.item_text IS '題目中文內容';
COMMENT ON COLUMN scale_items.response_type IS '回答格式：freq4/yesno/yesno_unknown/open_time/open_number/choice4';
COMMENT ON COLUMN scale_items.score_min IS '該題最低分（無計分則留空）';
COMMENT ON COLUMN scale_items.score_max IS '該題最高分（無計分則留空）';
COMMENT ON COLUMN scale_items.notes IS '備註';
