# 广告配置位置 + 收益怎么拿

项目里 **没有** 单独的 `config.json` 广告参数文件。  
广告在 **Adsterra 后台创建**，代码 **贴进 HTML**，收益在 **Adsterra 后台提现**。

---

## 一、广告「参数」在哪配置？

### 1. Adsterra 后台（创建广告、看数据）

| 后台菜单 | 干什么 |
|----------|--------|
| **Websites** | 添加/管理 `csporku.org` |
| **Ad Units / Banners** | 创建 Banner、Native、Push，**生成 script 代码** |
| **Statistics** | 看展示、点击、**收入** |
| **Finance / Payouts** | 绑定收款方式、申请提现 |

网址：https://publishers.adsterra.com（或 adsterra.com 登录后进 Publisher）

### 2. 你项目里的 HTML（贴代码 = 「配置到网站」）

所有要改的文件都在 `F:\outapp\ai-tools-monetize\site\`：

| 文件 | 广告位 ID | 贴什么 |
|------|-----------|--------|
| `index.html` | `#ad-home-top` | Banner：script + div |
| `index.html` | `<head>` 内 | Push：仅 script（可选） |
| `article/best-free-ai-tools-for-students.html` | `#ad-article-top` | Banner |
| 同上 | `#ad-article-mid` | Banner（可再建一个广告单元） |
| `article/claude-code-vs-codex-vs-cursor.html` | `#ad-article-top` | Banner |
| 同上 | `#ad-article-mid` | Banner |

**示例（把 Adsterra 给你的真实代码替换占位）：**

```html
<!-- head 里：Push 可选 -->
<script async="async" data-cfasync="false" src="https://pl12345.pub/adsterra/67890/invoke.js"></script>

<!-- 正文广告位 -->
<div class="ad-container" id="ad-article-top">
  <script async="async" data-cfasync="false" src="https://pl12345.pub/adsterra/11111/invoke.js"></script>
  <div id="container-2222222222"></div>
</div>
```

改完 → **重新上传 site/ 到 Cloudflare Worker** → 只在 **https://csporku.org** 生效（本地 localhost 不出真广告）。

### 3. 不需要配置的东西

- ❌ Cloudflare 里不用填广告 ID  
- ❌ 没有 `.env` 广告密钥  
- ❌ Worker 代码里不用写广告逻辑（静态 HTML 即可）

---

## 二、收益怎么产生？

```
访客打开 csporku.org
    ↓
页面加载 Adsterra 脚本
    ↓
展示广告 / Push 点击
    ↓
Adsterra 按 CPM/CPC 计费
    ↓
钱进入 Publisher 账户余额
    ↓
达到最低提现额 → 你申请 Payout
    ↓
打到 PayPal / 电汇 / USDT 等
```

| 指标 | 含义 |
|------|------|
| **Impression** | 广告展示次数 |
| **CPM** | 每 1000 次展示约多少钱（如 $1–5） |
| **CPC** | 每次点击约多少钱 |
| **Revenue** | 当日/当月累计收入（美元） |

新站流量少时，可能 **每天 $0.01–0.5**，正常。

---

## 三、收益怎么「拿到手」？

### Step 1 — 在 Adsterra 绑定收款

1. 登录 Publisher 后台  
2. **Profile** 或 **Finance** → **Payment methods** / **Payout settings**  
3. 常见方式：

| 方式 | 说明 |
|------|------|
| **PayPal** | 国内常用，需 PayPal 能收款 |
| **Payoneer** | 很多站长用 |
| **Wire 电汇** | 门槛高 |
| **USDT / Paxum / WebMoney** | Adsterra 也支持部分加密货币 |

4. 填好收款账号并 **验证**

### Step 2 — 看最低提现额

Adsterra 常见 **$5–$100** 起提（因支付方式而异，后台 Finance 页会写）。

### Step 3 — 等余额达标

- 后台 **Statistics → Revenue** 看累计  
- 通常 **Net-30 或双周/周结**（按平台规则，以 Adsterra 当前政策为准）

### Step 4 — 申请提现

**Finance → Payouts → Request payout**（余额 ≥ 最低额时按钮可点）

---

## 四、在哪看今天赚了多少钱？

1. **Adsterra** → **Statistics**  
   - 选日期、Website = `csporku.org`  
   - 看 Impressions、Clicks、**Revenue**

2. **项目里手动记（可选）**  
   - `docs/04-AFFILIATE-TRACKER.md` 底部「收入记录」表

---

## 五、广告 + 联盟 两套账

| 来源 | 在哪看 | 怎么提现 |
|------|--------|----------|
| **Adsterra 广告** | Adsterra Statistics | Adsterra Finance 提现 |
| **DigitalOcean / Amazon 等联盟** | 各联盟后台 | 各联盟自己的 PayPal/电汇 |
| **Cursor/Claude 推荐额度** | 各自账号 | 不是现金，是使用额度 |

---

## 六、操作顺序（从零到有钱）

```
1. Adsterra 注册 Publisher
2. 添加网站 csporku.org → 等 Approved
3. 创建 Banner 广告单元 → 复制 script
4. 贴进 site/*.html 的 ad-container 和 head
5. 重新部署到 Cloudflare
6. csporku.org 无痕访问，确认有广告
7. Statistics 里看到 Impressions > 0
8. Finance 绑定 PayPal/Payoneer
9. 余额够最低额 → Request payout
```

---

## 七、你现在最该做的 2 件事

1. **Adsterra 后台**：网站是否已通过？通过 → 创建 Banner → 把代码发给自己贴 HTML  
2. **Finance**：先绑定 **PayPal 或 Payoneer**，避免有钱提不出  

联盟收入（DigitalOcean 等）是 **另一套账号、另一套提现**，和 Adsterra 分开。
