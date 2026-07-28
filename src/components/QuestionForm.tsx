"use client";

import { useState } from "react";
import {
  FREQ4_LABELS,
  YESNO_LABELS,
  YESNO_UNKNOWN_LABELS,
} from "@/lib/scales";
import styles from "./QuestionForm.module.css";

export type ScaleItem = {
  id: number;
  item_code: string;
  item_text: string;
  response_type: string;
  notes: string | null;
};

function choiceOptions(item: ScaleItem): string[] {
  if (item.response_type === "choice4") {
    if (item.notes && item.notes.includes("/")) {
      return item.notes.split("/");
    }
    return ["選項一", "選項二", "選項三", "選項四"];
  }
  if (item.response_type === "yesno") return YESNO_LABELS;
  if (item.response_type === "yesno_unknown") return YESNO_UNKNOWN_LABELS;
  return FREQ4_LABELS;
}

function QuestionInput({
  item,
  value,
  onChange,
}: {
  item: ScaleItem;
  value: string;
  onChange: (v: string) => void;
}) {
  if (item.response_type === "open_time") {
    return (
      <input
        type="time"
        className={styles.textInput}
        value={value}
        onChange={(e) => onChange(e.target.value)}
      />
    );
  }

  if (item.response_type === "open_number") {
    return (
      <div className={styles.numberRow}>
        <input
          type="number"
          className={styles.numberInput}
          value={value}
          onChange={(e) => onChange(e.target.value)}
        />
        {item.notes && <span className={styles.unit}>{item.notes}</span>}
      </div>
    );
  }

  const options = choiceOptions(item);
  return (
    <div className={styles.optionRow}>
      {options.map((label, idx) => (
        <label key={idx} className={styles.optionLabel}>
          <input
            type="radio"
            name={`item-${item.id}`}
            checked={value === String(idx)}
            onChange={() => onChange(String(idx))}
          />
          {label}
        </label>
      ))}
    </div>
  );
}

export default function QuestionForm({ items }: { items: ScaleItem[] }) {
  const [answers, setAnswers] = useState<Record<number, string>>({});

  return (
    <div className={styles.form}>
      {items.map((item) => (
        <div key={item.id} className={styles.questionCard}>
          <div className={styles.questionText}>
            {item.item_code}. {item.item_text}
          </div>
          <QuestionInput
            item={item}
            value={answers[item.id] ?? ""}
            onChange={(v) =>
              setAnswers((prev) => ({ ...prev, [item.id]: v }))
            }
          />
        </div>
      ))}
      <p className={styles.note}>作答結果尚未串接儲存功能,僅供預覽題目與版面。</p>
    </div>
  );
}
