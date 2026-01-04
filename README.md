# Windows 11 Structural Intelligence Desktop Environment

Windows 11におけるタイル型ウィンドウマネージャ (Komorebi) とステータスバー (Yasb) を統合管理するための構成リポジトリです。
「構造的知性 (Structural Intelligence)」の哲学に基づき、認知負荷を最小化するためのR&D環境として設計されています。

## Architecture Overview

本環境は、以下のコンポーネント間の依存関係を厳密に制御し、安定した自動起動を実現しています。

* **Core**: [Komorebi](https://github.com/LGUG2Z/komorebi) (Tiling Window Manager) - Server
* **Input**: [Whkd](https://github.com/LGUG2Z/whkd) (Windows Hotkey Daemon) - Controller
* **UI**: [Yasb](https://github.com/denosawr/yasb) (Yet Another Status Bar) - Client
* **Orchestration**: `deploy.ps1` (v3.0) - Deployment & Task Scheduling

## Key Features

### 1. Robust Startup Mechanism (v3.0)
Windows起動時のプロセス競合と描画レイヤーの問題を解決するため、従来の「スタートアップフォルダ」による起動を廃止し、タスクスケジューラによる完全管理へ移行しました。

* **Legacy Cleanup**: `deploy.ps1` 実行時に、スタートアップフォルダ (`shell:startup`) 内の古いショートカットを自動検出し、削除します。
* **Elevated Privileges**: 全コンポーネント (Komorebi, Whkd, Yasb) を「管理者権限 (Highest)」にて実行し、Named Pipe通信の安定性を確保。
* **Silent Execution**: VBScriptラッパー (`.vbs`) を介することで、コンソールウィンドウ（黒い画面）を完全に隠蔽してバックグラウンド起動。
* **Dependency Resolution**:
    1.  **Komorebi**: ログオン時に即時起動 (Server待機)
    2.  **Whkd**: ログオン時に即時起動
    3.  **Yasb**: ログオン後、**20秒間の意図的な遅延 (Sleep)** を経て起動。これによりKomorebiのパイプ確立を確実に待ち、ワークスペースのOffline問題を回避。

### 2. Structural Configuration
* **Workspace**: 研究、執筆、分析など、認知タスクごとに最適化されたレイアウト定義。
* **Styles**: 視認性を重視したハイコントラストな配色と、ウィンドウの隙間 (Gap) を排除または厳密に制御したCSS設計。

## Directory Structure

```text
ailab-workspace/
├── config/
│   ├── komorebi/
│   │   └── komorebi.json          # ウィンドウマネージャ設定 (Layouts, Rules)
│   ├── applications/
│   │   └── komorebi.applications.json # アプリケーション個別ルール
│   └── whkd/
│       └── whkdrc                 # ショートカットキー定義
├── scripts/
│   ├── deploy.ps1                 # 統合デプロイスクリプト (v3.0)
│   ├── komorebi_hide.vbs          # 自動生成されるランチャー
│   └── yasb_delayed_start.vbs     # 自動生成される遅延起動ランチャー
└── backup/                        # デプロイ時に自動生成されるバックアップ
