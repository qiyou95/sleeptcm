# Sleep-TCM 資料庫建置說明（Supabase / PostgreSQL 版）

這三個檔案是 `01_scale_items.sql`、`02_stfd_features.sql`、`03_item_crosswalk.sql` 的 Supabase（PostgreSQL）相容版本，內容與資料完全一致，只是語法從 MySQL 改成 PostgreSQL。

## 跟 MySQL 版的差異

- `AUTO_INCREMENT` 改成 `BIGSERIAL`（PostgreSQL 的自動遞增寫法）。
- 拿掉 `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=...`，PostgreSQL/Supabase 預設就是UTF8，不需要另外指定。
- 欄位說明從 MySQL 的 `COMMENT '...'`（寫在欄位定義裡）改成 PostgreSQL 的 `COMMENT ON COLUMN 表.欄位 IS '...'`（寫在建表語句之後）。
- 其餘（表名、欄位名、資料內容、INSERT語句）完全不變。

## 執行方式

1. 登入 Supabase Dashboard，選擇你的專案。
2. 左側選單點「SQL Editor」。
3. 新增一個 Query，依序貼上並執行：`supabase_01_scale_items.sql` → `supabase_02_stfd_features.sql` → `supabase_03_item_crosswalk.sql`（順序不可跳過，理由跟 MySQL 版一樣：03會參照01、02建的表）。
4. 執行完可以到左側「Table Editor」確認三張表都出現，筆數：`scale_items` 59筆、`stfd_features` 86筆、`item_crosswalk` 54筆。

## Supabase 特有的重要提醒：Row Level Security（RLS）

這點跟單純的 MySQL/phpMyAdmin 不一樣，**務必注意**：Supabase 每張資料表預設會透過 PostgREST 自動產生對外 API，如果沒有開啟 RLS（Row Level Security），任何拿到你 anon key 的人理論上都能透過 API 讀寫這張表。

這三張表（scale_items、stfd_features、item_crosswalk）本身是題庫定義資料，不含病人個資，風險較低，但還是建議養成習慣，一律開啟 RLS：

```sql
ALTER TABLE scale_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE stfd_features ENABLE ROW LEVEL SECURITY;
ALTER TABLE item_crosswalk ENABLE ROW LEVEL SECURITY;

-- 範例：允許已登入使用者讀取（依你們實際權限需求調整）
CREATE POLICY "allow_read_authenticated" ON scale_items FOR SELECT TO authenticated USING (true);
CREATE POLICY "allow_read_authenticated" ON stfd_features FOR SELECT TO authenticated USING (true);
CREATE POLICY "allow_read_authenticated" ON item_crosswalk FOR SELECT TO authenticated USING (true);
```

**特別提醒**：之後如果要建病人資料表（`patients`、`sessions`、`responses`），因為含有個資與健康資料，RLS政策要設計得更嚴謹（例如只允許該病人自己或授權醫療人員存取），不能沿用上面這種寬鬆的「允許所有登入者讀取」規則，屆時我可以再幫你們一起設計。

## 目前進度

- 已完成：題庫資料庫化（3張表，Supabase版）、跨量表去重分析。
- 尚未開始：病人填答紀錄表、計分結果表、整合問卷實際版面設計、RLS權限細部設計。
