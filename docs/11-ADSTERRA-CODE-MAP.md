# Adsterra 4 个广告单元 — 贴代码对照表

网站：**csporku.org**（ID: 5828519）

在 Adsterra 里对每个单元点 **<> GET CODE**，复制 **整段**（`<script>` + `<div>`），贴到下面位置。

---

## 单元分配（4 个都用上）

| Adsterra 名称 | ID | 贴到哪个文件 | HTML 位置 |
|---------------|-----|--------------|-----------|
| **728x90** | `#ad-top-728` | 全部 3 页 | highperformanceformat `e953e783...` |
| **300x250** | `#ad-mid-300` | 2 篇文章 | highperformanceformat `d22d76c9...` |
| **Native Banner** | `#ad-native-home` | 仅首页 | effectivecpmnetwork `e602b12a...` |
| **320x50** | `#ad-mobile-320` | 全部 3 页 | highperformanceformat `7aaa573c...` |

---

## 怎么贴（每个 GET CODE 长这样）

点 **728x90_1 → GET CODE**，复制类似：

```html
<script async="async" data-cfasync="false" src="https://plXXXX.pub/adsterra/XXXX/invoke.js"></script>
<div id="container-XXXXXXXXXX"></div>
```

**两段都要**，放进对应 `<div>` 里面，例如：

```html
<div class="ad-container" id="ad-top-728">
  <script async="async" data-cfasync="false" src="https://pl...."></script>
  <div id="container-...."></div>
</div>
```

---

## 文件清单

### index.html

| 位置 | 单元 |
|------|------|
| `#ad-top-728` | 728x90_1 |
| `#ad-native-home` | NativeBanner_1 |
| `#ad-mobile-320` | 320x50_1 |

### article/best-free-ai-tools-for-students.html

| 位置 | 单元 |
|------|------|
| `#ad-top-728` | 728x90_1 |
| `#ad-mid-300` | 300x250_1 |
| `#ad-mobile-320` | 320x50_1 |

### article/claude-code-vs-codex-vs-cursor.html

| 位置 | 单元 |
|------|------|
| `#ad-top-728` | 728x90_1 |
| `#ad-mid-300` | 300x250_1 |
| `#ad-mobile-320` | 320x50_1 |

---

## 贴完以后

1. 保存所有 HTML  
2. 整个 `site/` 重新上传到 Cloudflare Worker  
3. 无痕打开 https://csporku.org ，关广告拦截  
4. Adsterra → **Statistics** 看 Impressions  

---

## 注意

- **同一单元代码可以复用**：728x90 的代码在首页和文章页可以贴 **同一段**  
- **不要**只贴 script 不贴 div（或反过来）  
- 本地 localhost **看不到**广告，只在 csporku.org 测  
