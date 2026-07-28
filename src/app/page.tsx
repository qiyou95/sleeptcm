import Link from "next/link";
import Topbar from "@/components/Topbar";
import styles from "./page.module.css";

export default function Home() {
  return (
    <>
      <Topbar username="(username)" />
      <div className={styles.main}>
        <div className={styles.actionRow}>
          <Link
            href="/questionnaire"
            className={`${styles.actionBtn} ${styles.primary}`}
          >
            去填寫問卷
          </Link>
          <button className={styles.actionBtn}>歷史紀錄</button>
        </div>
      </div>
    </>
  );
}
