terraformでGCP上にPyTorchインストール済みのGPUインスタンスを作成するtfファイルです。

## 構築手順

### インスタンス作成までの手順

```
git clone https://github.com/bassbone/gcp-instance-gpu.git
cd gcp-instance-gpu
terraform init
terraform apply
```

### インスタンス作成後にJupyterLabに接続するまでの手順

* gcloudコマンドが使える環境で以下を実行。

```
export PROJECT_ID="my-project-id"
export ZONE="my-zone"
export INSTANCE_NAME="instance-gpu"
gcloud compute ssh --project $PROJECT_ID --zone $ZONE $INSTANCE_NAME -- -L 8080:localhost:8080
```

* ブラウザで[http://localhost:8080](http://localhost:8080)に接続。
