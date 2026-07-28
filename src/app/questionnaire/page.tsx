import Link from "next/link";
import { SCALES } from "@/lib/scales";
import styles from "./questionnaire.module.css";

export default function QuestionnaireIndex() {
  return (
    <div className={styles.page}>
      <h1 className={styles.title}>選擇要填寫的問卷</h1>
      <div className={styles.grid}>
        {SCALES.map((scale) => (
          <Link
            key={scale.code}
            href={`/questionnaire/${scale.code}`}
            className={styles.card}
          >
            <div className={styles.cardName}>{scale.name}</div>
            <div className={styles.cardDescription}>{scale.description}</div>
          </Link>
        ))}
      </div>
      <Link href="/" className={styles.backLink}>
        返回首頁
      </Link>
    </div>
  );
}
