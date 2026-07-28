"use client";

import { useEffect, useRef, useState } from "react";
import styles from "./Topbar.module.css";

export default function Topbar({ username }: { username: string }) {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const menuWrapperRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (
        menuWrapperRef.current &&
        !menuWrapperRef.current.contains(event.target as Node)
      ) {
        setIsMenuOpen(false);
      }
    }
    document.addEventListener("click", handleClickOutside);
    return () => document.removeEventListener("click", handleClickOutside);
  }, []);

  return (
    <div className={styles.topbar}>
      <div className={styles.topbarLeft}>
        <div className={styles.logo}>睡</div>
        <div className={styles.greeting}>Hi, {username}</div>
      </div>
      <div className={styles.topbarRight}>
        <input className={styles.searchBox} type="text" placeholder="搜尋" />
        <div className={styles.menuWrapper} ref={menuWrapperRef}>
          <button
            className={styles.iconBtn}
            title="選單"
            onClick={() => setIsMenuOpen((open) => !open)}
          >
            ☰
          </button>
          <div
            className={`${styles.dropdownMenu} ${isMenuOpen ? styles.open : ""}`}
          >
            <button className={`${styles.dropdownItem} ${styles.ai}`}>
              問問 AI 助手
            </button>
            <button className={styles.dropdownItem}>
              下次看診時間
              <span className={styles.date}>2026/08/03</span>
            </button>
            <div className={styles.dropdownDivider} />
            <button className={styles.dropdownItem}>個人資料設定</button>
            <button className={styles.dropdownItem}>Login</button>
            <button className={styles.dropdownItem}>Logout</button>
          </div>
        </div>
      </div>
    </div>
  );
}
