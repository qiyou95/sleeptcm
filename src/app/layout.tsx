import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Sleep-TCM AI Platform",
  description: "Sleep-TCM AI Platform 病人端首頁",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="zh-Hant">
      <body>{children}</body>
    </html>
  );
}
