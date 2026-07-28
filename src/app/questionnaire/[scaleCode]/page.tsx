import Link from "next/link";
import { notFound } from "next/navigation";
import { supabase } from "@/lib/supabase";
import { SCALES } from "@/lib/scales";
import QuestionForm, { type ScaleItem } from "@/components/QuestionForm";
import styles from "./scale.module.css";

export default async function ScalePage({
  params,
}: {
  params: Promise<{ scaleCode: string }>;
}) {
  const { scaleCode } = await params;
  const scale = SCALES.find((s) => s.code === scaleCode);
  if (!scale) {
    notFound();
  }

  const { data, error } = await supabase
    .from("scale_items")
    .select("id, item_code, item_text, response_type, notes")
    .eq("scale_code", scale.code)
    .order("display_order", { ascending: true });

  if (error) {
    throw new Error(error.message);
  }

  return (
    <div className={styles.page}>
      <div className={styles.header}>
        <Link href="/questionnaire" className={styles.backLink}>
          ← 返回問卷選單
        </Link>
        <h1 className={styles.title}>{scale.name}</h1>
        <p className={styles.description}>{scale.description}</p>
      </div>
      <QuestionForm items={data as ScaleItem[]} />
    </div>
  );
}
