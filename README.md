# iPhoneのヘルスケアデータをTSVに変換する

## 概要

iPhoneヘルスケアアプリはデータを一括でエクスポートできる機能があるが、
フォーマットがXML形式であるため必要なレコードのみTSVに変換する。

なお、現状は体重のみ。

## 使い方

iPhoneヘルスケアからエクスポートするとzipになっているので解凍してexport.xmlを取り出す。

以下、xml2tsv.ps1とexport.xmlが同フォルダにある前提

`> xml2tsv.ps1 -path .\export.xml | sc data.tsv`
