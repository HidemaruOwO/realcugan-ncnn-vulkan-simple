# realcugan-ncnn-vulkan-simple

簡単に realcugan-ncnn-vulkan を複数の画像で実行させるためのシェルスクリプト

## 🌱 セットアップ

`setup.sh`を実行してください

```bash
bash setup.sh
```

### 🔻 バイナリとモデルのダウンロード

- [amd64 Linux](https://01.raw.v-sli.me/realcugan-ncnn-vulkan/x86_64/linux/rcnvg.zip)
- [AppleSilicon Mac](https://01.raw.v-sli.me/realcugan-ncnn-vulkan/arm/mac/rcnvg.zip)

**ビルド済みのバイナリがない場合は[realcugan-ncnn-vulkan](https://github.com/nihui/realcugan-ncnn-vulkan)をビルドしてください**

## 🚀 使い方

`baseimg/`ディレクトリに変換元の画像を保存したら`convert.sh`を実行してください  
`dist/`ディレクトリに画像が出力されます  
このコマンドを実行すると`dist/`ディレクトリ内のファイルが全て削除されるので、`dist/`にファイルが存在している場合は予め別のディレクトリにバックアップしてください

```bash
bash convert.sh 2 2
```

第一引数にスケールを、第二引数にノイズ除去レベルを入力してください

- `scale`= upscale ratio (1/2/3/4, default=2)
- `noise-level`= denoise level (-1/0/1/2/3, default=-1)

## 👀 動作確認

- Mac (AppleSilicon)
- Linux (x86_64)

## ‼️ クラッシュとエラーの対処

正しいドライバがインストールされてるか確認してください  
ドライバが正しくないとクラッシュしてしまいます  
もし正しいドライバをインストールしてエラーが発生した場合は[issuse](https://github.com/HidemaruOwO/realcugan-ncnn-vulkan-simple/issues)でお知らせください
