# realcugan-ncnn-vulkan-simple

簡単に realcugan-ncnn-vulkan を複数の画像で実行させるためのシェルスクリプト

## 🌱 セットアップ

realcugan-ncnn-vulkan のバイナリを`bin/realcugan`に配置してください

## ⚙️ コマンド

```bash
bash convert.sh 2 2
```

第一引数にスケールを、第二引数にノイズ除去レベルを入力してください

- `scale`= upscale ratio (1/2/3/4, default=2)
- `noise-level`= denoise level (-1/0/1/2/3, default=-1)
