export type ScaleCode =
  | "GAD7"
  | "PHQ8"
  | "PSQI"
  | "STOPBANG"
  | "ESS"
  | "AD8";

export const SCALES: { code: ScaleCode; name: string; description: string }[] = [
  { code: "GAD7", name: "廣泛性焦慮量表 (GAD-7)", description: "評估焦慮症狀嚴重程度" },
  { code: "PHQ8", name: "病人健康問卷 (PHQ-8)", description: "評估憂鬱症狀嚴重程度" },
  { code: "PSQI", name: "匹茲堡睡眠品質指數 (PSQI)", description: "評估近一個月的睡眠品質" },
  { code: "STOPBANG", name: "STOP-BANG 問卷", description: "阻塞性睡眠呼吸中止症篩檢" },
  { code: "ESS", name: "艾普沃斯嗜睡量表 (ESS)", description: "評估白天嗜睡程度" },
  { code: "AD8", name: "AD8 極早期失智症篩檢", description: "評估認知功能變化" },
];

export const FREQ4_LABELS = ["完全沒有", "幾天", "一半以上的日子", "幾乎每天"];
export const YESNO_LABELS = ["沒有", "有"];
export const YESNO_UNKNOWN_LABELS = ["沒有", "有", "不確定"];
