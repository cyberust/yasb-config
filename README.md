# My Yasb Configuration

Windows 11 におけるタイル型ウィンドウマネージャ「Komorebi」用のステータスバー (yasb) 設定ファイルです。
視認性を重視したダークグレーのテーマと、ハイコントラストな配色を採用しています。

## 特徴

- **Platform**: Windows 11
- **WM**: Komorebi
- **Theme**: Dark Gray Background / Pastel Widgets / High Contrast Text
- **Timezone**: Asia/Tokyo (JST)

## 導入ウィジェット

1.  **Workspaces**: Komorebi のワークスペース番号と状態表示
2.  **Layout**: 現在のウィンドウレイアウト（BSP, Columns, Monocle 等）
3.  **Active Window**: アクティブなウィンドウのタイトル（デスクトップ時は "Desktop" 表記）
4.  **Clock**: 日本時間表示
5.  **System**: CPU 使用率、メモリ使用率
6.  **Custom**: エクスプローラー起動ボタン、天気（Tokyo）、IP 情報、トラフィック監視

## 必要要件

- Python 3.12
- yasb (Yet Another Status Bar)
- Nerd Fonts (アイコン表示用)

## 起動方法

`start-yasb.bat` または `restart-yasb.bat` を使用して起動します。
Windows 起動時にタスクバーの予約領域（App Bar）として動作し、ウィンドウが背後に隠れないよう設定されています。

## ファイル構成

- `config.yaml`: ウィジェットの配置と機能設定
- `styles.css`: 配色とデザイン設定
- `src/`: yasb ソースコード
