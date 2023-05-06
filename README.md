<h1>
  <img width="500" alt="Protocol Buffers Template" src="https://user-images.githubusercontent.com/58544849/236625073-781a3aa8-bf72-418c-acb1-59f949cee4e6.svg">
</h1>

![Generate](https://github.com/smpny7/protocol-buffers-template/actions/workflows/generate.yml/badge.svg)
![Release](https://github.com/smpny7/protocol-buffers-template/actions/workflows/release.yml/badge.svg)

## 📖 このパッケージの利用手順

### Go

```
$ go get -u github.com/smpny7/protocol-buffers-template/go
```

### Python

```
$ pip install git+ssh://git@github.com/smpny7/protocol-buffers-template.git#egg=protocol-buffers-template&subdirectory=python/"
```

### TypeScript

```
$ npm install @smpny7/protocol-buffers-template
```

## 👩‍💻 このリポジトリにプッシュしたとき

CI が自動で走り、`Go` `Python` `TypeScript` それぞれのコードが生成されます。

## 🚀 リリース手順

リリースすることで、バージョン（`例: v1.0.0`）が自動で上がり、npm パッケージなどを更新させることができます。

上部の `Actions` タブ > サイドバーにある `Release` > `Run Workflow` より、リリースを作成することができます。

<img width="382" alt="Run Workflow" src="https://user-images.githubusercontent.com/58544849/231660409-3bdb7f1f-3379-4f19-a988-68caa3de7bb5.png">

バージョンアップについては、以下の 3 つが存在します。

- **patch** `例: v1.0.0 → v1.0.1`
- **minor** `例: v1.0.0 → v1.1.0`
- **major** `例: v1.0.0 → v2.0.0`

## ⚙️ セットアップ

### Go の場合

GitHub など一般公開されているリポジトリではなく、プライベートな社内のリポジトリを特に設定の無いまま利用すると以下のようなエラーが発生します。

```
$ go get -u github.com/smpny7/protocol-buffers-template/go
go: downloading github.com/smpny7/protocol-buffers-template/go v0.0.1
...
404 Not Found
```

実行時やシェルの利用時などに環境変数で `GOPRIVATE` を指定することで解決します。

```
export GOPRIVATE=github.com/smpny7/protocol-buffers-template
```

### Node.js の場合

npm などに一般公開されているパッケージではなく、プライベートな社内の GitHub に公開されているパッケージを使用する際には `read:packages` 権限が付与されたアクセストークンが必要になります。

#### 🔐 Step1. アクセストークンを取得する

GitHub の [Personal access tokens](https://github.com/settings/tokens) にアクセスし、`read:packages` にチェック ☑️ を入れたトークンを生成します。

  <img width="800" alt="Personal access tokens" src="https://user-images.githubusercontent.com/58544849/236625291-b69ef3f0-94ce-4c3c-a82a-f8662dba4408.png">

生成されたトークンは以下のような形式になっています。

```
🔑 ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

#### 📥 Step2. インストール時にアクセストークンを利用するように設定する

`.npmrc` を用意します。

```
$ vi ~/.npmrc
```

先ほど生成したアクセストークンに置き換え、以下のように記述してください。

```
//npm.pkg.github.com/:_authToken=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
@smpny7:registry=https://npm.pkg.github.com/
```
