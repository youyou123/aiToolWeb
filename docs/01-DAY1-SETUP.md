# 第 1 天：建站 + 接广告（逐步操作）

预计耗时：2–4 小时

---

## Step 1：买域名（10 分钟）

1. 打开 https://dash.cloudflare.com
2. 注册/登录 → 左侧「域名注册」→ 搜索域名
3. 命名建议（任选风格）：
   - `pickaitools.com`
   - `toolpulse.ai`（.ai 略贵）
   - `smartaihub.com`
4. 购买 .com，约 $10–12/年
5. DNS 已在 Cloudflare，不用额外配置

---

## Step 2：WordPress 主机（选一种）

### 方案 A：最便宜 VPS（推荐，WordPress 完整功能）

1. 注册 RackNerd / CloudCone / Vultr，选 $3–5/月 套餐
2. 选 Ubuntu 22.04，地区选美国
3. 用 **1-Click WordPress** 或宝塔面板安装 WordPress
4. 域名 A 记录指向 VPS IP（Cloudflare DNS 里设置）

### 方案 B：Managed WordPress（省心略贵）

- Hostinger：约 $2.99/月 首年，自带 WordPress 一键装

### 方案 C：纯静态（进阶，暂不建议新手）

- Cloudflare Pages + Astro，无 WordPress 后台

**粗手推荐：Hostinger WordPress 套餐，一键安装。**

---

## Step 3：WordPress 基础配置（30 分钟）

登录 `你的域名/wp-admin`

```
1. 设置 → 常规：站点标题「Pick AI Tools」、副标题「Honest AI Tool Reviews」
2. 设置 → 固定链接：选「文章名」
3. 外观 → 主题：安装 GeneratePress（免费）
4. 插件 → 安装：
   - Rank Math SEO
   - WP Super Cache 或 LiteSpeed Cache
5. 页面 → 新建：
   - About（你是谁、为什么写评测）
   - Contact（联系邮箱）
   - Privacy Policy（可用 termly.io 免费生成）
   - Affiliate Disclosure（说明文章含联盟链接）
```

**Affiliate Disclosure 示例（复制改域名）：**

> This site contains affiliate links. If you purchase through our links, we may earn a commission at no extra cost to you. We only recommend tools we genuinely find useful.

---

## Step 4：注册 Adsterra 广告（20 分钟）

1. 打开 https://adsterra.com → Sign Up（Publisher）
2. 添加网站：填你的域名
3. 选择广告格式：**Push Notifications**（比 Pop 不伤体验）
4. 过审通常 10 分钟–24 小时
5. 通过后复制 JS 代码
6. WordPress：外观 → 主题文件编辑器 → header.php，在 `</head>` 前粘贴  
   或用插件 **Insert Headers and Footers** 粘贴到 Header

---

## Step 5：Google Search Console（10 分钟）

1. https://search.google.com/search-console
2. 添加资源 → 域名或 URL 前缀
3. 用 Cloudflare DNS 验证
4. 提交 sitemap：`https://你的域名/sitemap_index.xml`（Rank Math 自动生成）

---

## Step 6：Google Analytics（可选，10 分钟）

1. https://analytics.google.com
2. 创建 GA4 属性
3. 安装 **Site Kit by Google** 插件一键连接

---

## 第 1 天完成标准

- [ ] 域名能打开 WordPress 首页
- [ ] About / Privacy / Disclosure 页面已发布
- [ ] Adsterra 代码已嵌入（过审后可见）
- [ ] Search Console 已验证

**下一步 → `docs/02-AFFILIATE-APPLY.md`**
