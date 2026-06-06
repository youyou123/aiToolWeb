# Adsterra 广告接入 — csporku.org

页面上 **「Ad slot — top of article」** 是我们开发时的**占位文字**，不是广告平台自动显示的。必须自己注册 Adsterra、拿到代码、贴进 HTML，再重新部署。

---

## 为什么现在看不到广告？

| 原因 | 说明 |
|------|------|
| **只是占位符** | 灰色框 = 提示「这里将来放广告」，没有接任何广告脚本 |
| **还没注册 Adsterra** | 需要 Publisher 账号 + 网站审核 |
| **Push 广告不占框** | Push 通知广告在 `<head>` 里，**不会**出现在灰色框里 |
| **广告拦截** | 浏览器 AdBlock 会屏蔽 |
| **流量太少** | 新站填充率低，有时空白 |

---

## 完整接入步骤（约 30 分钟）

### Step 1 — 注册 Adsterra

1. 打开 https://www.adsterra.com/signup/
2. 选 **Publisher（发布商）**
3. 注册邮箱并验证

### Step 2 — 添加网站

1. 登录 → **Websites** → **Add Website**
2. 填：`https://csporku.org`
3. 类别选：**Technology** 或 **Software**
4. 提交，等审核（通常 **10 分钟 ~ 24 小时**）

### Step 3 — 创建广告单元（选一种）

#### 方案 A：Banner / Native（会显示在页面框里）✅ 推荐先看效果

1. **Direct Link** 旁选 **Banner** 或 **Native Banner**
2. 选尺寸：**728x90** 或 **Responsive / Native**
3. 生成代码，类似：

```html
<script async="async" data-cfasync="false" src="https://plXXXX.pub/adsterra/XXXX/invoke.js"></script>
<div id="container-XXXXXXXXXX"></div>
```

4. 复制 **整段**（script + div）

#### 方案 B：Push 通知（不占灰色框）

1. 选 **Social Bar** 或 **Push Notifications**
2. 只需一段 `<script>` 放在每个页面 `</head>` 前
3. 用户会收到浏览器推送，**不会**替换灰色 Ad slot 框

---

### Step 4 — 贴进网站 HTML

打开本地文件，编辑后 **重新上传到 Cloudflare Worker**：

**文件 1 — 所有页面 `<head>` 里（Push 用这个）：**

`site/index.html`  
`site/article/best-free-ai-tools-for-students.html`  
`site/article/claude-code-vs-codex-vs-cursor.html`

在 `</head>` **之前** 粘贴 Adsterra 给的 script（若有 Push）。

**文件 2 — 替换灰色广告框（Banner 用这个）：**

找到：

```html
<div class="ad-slot">Ad slot — top of article</div>
```

**删掉**，换成 Adsterra 给的 **script + div**，例如：

```html
<div class="ad-container">
  <script async="async" data-cfasync="false" src="https://plXXXX.pub/adsterra/XXXX/invoke.js"></script>
  <div id="container-XXXXXXXXXX"></div>
</div>
```

---

### Step 5 — 重新部署

1. Cloudflare → **Workers & Pages** → **aitoolweb**
2. 上传更新后的 `site/` 文件（或 wrangler deploy）
3. 等 1–2 分钟，**Ctrl+F5** 强刷 csporku.org

---

### Step 6 — 验证

1. 用 **无痕窗口** 打开（避免插件缓存）
2. **关闭广告拦截** 或换浏览器测试
3. Adsterra 后台 **Statistics** 看是否有展示

---

## 还没批下来之前

- 占位框可以 **先删掉**，避免访客看到 “Ad slot”
- 或改成空白 `<div class="ad-container"></div>`

---

## 除了广告，怎么先赚钱？

广告要流量才有钱。现在可以：

1. 文章按钮链 **Notion / Canva / DigitalOcean** 联盟（有佣金）
2. Reddit 引流 → 联盟点击比广告快

---

## 检查清单

- [ ] Adsterra Publisher 已注册
- [ ] csporku.org 已添加并通过审核
- [ ] 已创建 Banner 或 Native 广告单元
- [ ] 代码已贴进 HTML 并重新部署
- [ ] 无痕模式 + 关广告拦截测试
