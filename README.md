# deploy-pipeline

Terraform を用いた AWS リソースの CI/CD パイプライン実装サンプル。
3種類のデプロイ方式を比較・実装します。

## ディレクトリ構成

```
deploy-pipeline/
├── terraform-resource/   # デプロイ対象の AWS リソース (Terraform)
└── terraform-pipeline/   # CI/CD パイプライン自体の AWS リソース (Terraform)
```

## デプロイ方式

### (1) GitHub Actions

GitHub Actions のみを使用した純粋なクラウドランナー構成。

- ランナー: GitHub ホステッドランナー
- 認証: OIDC (OpenID Connect) による一時クレデンシャル取得
- 特徴: AWSインフラ不要でシンプルに構築できる

```
GitHub → GitHub Actions Runner → AWS (Terraform apply)
```

### (2) GitHub Actions + CodeBuild ホストランナー

GitHub Actions のワークフロー定義を活かしつつ、実行環境を AWS CodeBuild に委譲する構成。

- ランナー: AWS CodeBuild (セルフホステッドランナーとして動作)
- 認証: CodeBuild に付与した IAM ロール
- 特徴: VPC 内リソースへのアクセスやランナーのカスタマイズが可能

```
GitHub → GitHub Actions → CodeBuild Runner → AWS (Terraform apply)
```

### (3) CodePipeline + CodeBuild

AWS ネイティブのパイプラインサービスを使用した構成。

- ソース: GitHub (CodeStar Connections 経由)
- パイプライン: AWS CodePipeline
- ビルド/デプロイ: AWS CodeBuild
- 特徴: AWS コンソールで一元管理、CloudWatch との統合が容易

```
GitHub → CodePipeline → CodeBuild → AWS (Terraform apply)
```

## 方式比較

| 項目 | (1) GitHub Actions | (2) GHA + CodeBuild | (3) CodePipeline |
|---|---|---|---|
| 設定の複雑さ | 低 | 中 | 中 |
| AWS インフラコスト | なし | あり | あり |
| VPC 内アクセス | 不可 | 可能 | 可能 |
| ランナーカスタマイズ | 限定的 | 柔軟 | 柔軟 |
| 管理コンソール | GitHub | GitHub / AWS | AWS |
| IAM 認証方式 | OIDC | IAM ロール | IAM ロール |

## 前提条件

- Terraform >= 1.0
- AWS CLI 設定済み
- GitHub リポジトリへの管理者権限

## 使い方

### 1. デプロイ対象リソースの確認

```bash
cd terraform-resource
terraform init
terraform plan
```

### 2. パイプラインの構築

使用する方式のディレクトリに移動して apply する。

```bash
cd terraform-pipeline
terraform init
terraform plan
terraform apply
```
