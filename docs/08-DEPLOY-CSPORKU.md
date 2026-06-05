# 有域名后部署指南 — csporku.org + Cloudflare Pages

域名已在 Cloudflare，用 **Pages 免费托管**，约 **20–40 分钟** 上线。

---

## 方式一：直接上传（推荐新手，最快）

### 1. 准备上传的文件

把下面整个文件夹里的 **所有内容** 上传（不是上传 `site` 文件夹本身，是里面的文件）：

```
F:\outapp\ai-tools-monetize\site\
├── index.html
├── sitemap.xml
├── robots.txt
├── assets/
│   └── style.css
└── article/
    ├── best-free-ai-tools-for-students.html
    └── claude-code-vs-codex-vs-cursor.html
```

### 2. 创建 Pages 项目

1. 登录 https://dash.cloudflare.com
2. 选中域名 **csporku.org** 所在账号
3. 左侧 **Workers 和 Pages**（或 **Compute & AI** → **Workers & Pages**）
4. 点击 **创建** → **Pages** → **上传资产**（Upload assets）
5. 项目名称填：`csporku` 或 `ai-tools`
6. 把 `site` 文件夹内所有文件 **拖进上传区**
7. 点击 **部署站点**（Deploy site）

等待 1–2 分钟，会得到临时地址，例如：

`https://csporku.pages.dev`

在浏览器打开，应能看到首页。

### 3. 绑定你的域名 csporku.org

1. 进入刚创建的 Pages 项目
2. 顶部 **自定义域**（Custom domains）→ **设置自定义域**
3. 输入：`csporku.org` → 继续
4. 再添加：`www.csporku.org`（可选，建议加）
5. Cloudflare 会自动添加 DNS 记录，状态变为 **有效** 即可

### 4. 验证

浏览器访问：

- https://csporku.org
- https://csporku.org/article/claude-code-vs-codex-vs-cursor.html

能打开 = 部署成功。HTTPS 证书 Cloudflare 自动签发，不用自己配。

---

## 方式二：GitHub 自动部署（以后改文章更方便）

适合会一点 Git、打算经常更新内容的人。

### 1. 推代码到 GitHub

```powershell
cd F:\outapp\ai-tools-monetize
git add site/
git commit -m "Add static site for deployment"
# 在 GitHub 新建仓库 ai-tools-monetize，然后：
git remote add origin https://github.com/你的用户名/ai-tools-monetize.git
git push -u origin master
```

### 2. Cloudflare Pages 连接 Git

1. **Workers 和 Pages** → **创建** → **Pages** → **连接 Git**
2. 选 GitHub 仓库 `ai-tools-monetize`
3. 构建设置：

| 项 | 填什么 |
|----|--------|
| 生产分支 | `master` 或 `main` |
| 框架预设 | **None** |
| 构建命令 | 留空 |
| **构建输出目录** | **`site`** |

4. 保存并部署

### 3. 绑定域名

同方式一 Step 3：自定义域添加 `csporku.org`。

以后每次 `git push`，网站自动更新。

---

## 更新网站（改文章 / 加广告代码后）

### 上传方式

1. 改本地 `F:\outapp\ai-tools-monetize\site\` 里的 HTML
2. Pages 项目 → **上传新资产** / **Create deployment** → 重新拖文件上传

### Git 方式

```powershell
git add site/
git commit -m "Update articles"
git push
```

等 1–2 分钟自动发布。

---

## 部署后要做的 3 件事（才能赚钱）

### 1. Google Search Console

1. https://search.google.com/search-console
2. 添加资源：`https://csporku.org`
3. 用 DNS 或 HTML 验证（Cloudflare 用户选 DNS 最方便）
4. 提交站点地图：`https://csporku.org/sitemap.xml`

### 2. 接广告 Adsterra

1. https://adsterra.com 注册 Publisher
2. 添加网站 **csporku.org**
3. 过审后复制 JS 代码，插入每个 HTML 的 `</head>` 前
4. 重新部署

### 3. 联盟链接

在文章 HTML 里把 `#` 占位链接换成 DigitalOcean、Hostinger 等真实联盟链接，再部署。

---

## 常见问题

### 打开 csporku.org 显示 Cloudflare 错误或 522

- DNS 刚改，等 **5–30 分钟**
- Pages 自定义域是否显示 **Active**

### 只有 www 能开，根域名不行

- 自定义域里 **两个都要加**：`csporku.org` 和 `www.csporku.org`

### 页面 404

- 上传的是 `site` **里面的文件**，根目录要有 `index.html`
- 链接路径区分大小写

### 想用 WordPress 而不是静态页

需要 VPS 或 Hostinger 等 PHP 主机，Cloudflare Pages **只支持静态文件**。你当前 `site/` 静态站用 Pages 最合适；WordPress 以后可再迁。

---

## 检查清单

- [ ] Pages 部署成功，`*.pages.dev` 能访问
- [ ] `csporku.org` 已绑定且 HTTPS 正常
- [ ] 两篇文章链接能打开
- [ ] Search Console 已验证
- [ ] Adsterra 已提交 csporku.org
- [ ] 至少 1 个联盟已申请

---

**下一步**：部署完成后去 Reddit 发引流帖（见 `docs/07-C1-LAUNCH-TRAFFIC.md`）。
