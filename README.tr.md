🇬🇧 [English](README.md) · 🇹🇷 Türkçe

# Orchnes 360

[![validate](https://github.com/orchnes/orchnes-360/actions/workflows/validate.yml/badge.svg)](https://github.com/orchnes/orchnes-360/actions/workflows/validate.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE) [![Agent Skills](https://img.shields.io/badge/Agent%20Skills-spec%20compliant-6f42c1)](https://agentskills.io) ![skills](https://img.shields.io/badge/skills-26-success)

**Yapay zekâ ajanları için uçtan uca skill'ler: fikirden çalışan bir işletmeye kadar, hangi yapay zekâ aracını kullanırsan kullan.**
Ne istediğini söylemen yeterli; ajanlar tüm yol haritasını çıkarır, işi yürütür ve senden yalnızca karar ve onay ister.

Yapay zekâ ajanları için taşınabilir, token tasarruflu skill'ler (beceri paketleri). MIT lisanslıdır.

Her skill, açık **Agent Skills** biçimine uyan bir `SKILL.md` dosyası içeren bir klasördür
(YAML frontmatter + Markdown talimatlar). Bir skill'e ihtiyaç duyulana kadar modelin bağlamında yalnızca
adı ve açıklaması bulunur; bu yüzden çok sayıda skill kurmak neredeyse hiçbir maliyet getirmez.

## Skill'ler

| Skill | Ne yapar |
|---|---|
| [`agent-behavior`](skills/agent-behavior/SKILL.md) | Her oturum için temel davranış: kısa, kanıta dayalı, insan gibi yanıtlar; yanlış "bitti" bildirimi yok, döngü yok, baştan başlama yok; yalnızca gizli bilgi, onay ve gerçek kararlar için soru sorar. |
| [`agent-orchestra`](skills/agent-orchestra/SKILL.md) | Bir ajan ekibini yönetir: üst düzey model işi parçalara ayırır, her görevi yetenekli en ucuz modele (önce ücretsiz/yerel) yönlendirir, sonuçları sözleşmelere göre inceler, gereksiz kodu reddeder, playbook'larla öğretir, kararları ve maliyeti kaydeder. |
| [`ai-integration`](skills/ai-integration/SKILL.md) | Ürünün içinde yapay zekâ: model seçimi (LLM/SLM, bulut/yerel), platformu tanıması için RAG + araçlar, kapsam sınırı ve prompt injection savunması, her iş için bir ajan ve bir süpervizör, yasal müşteri analitiği, eval'ler ve izleme. |
| [`analysis`](skills/analysis/SKILL.md) | Belirsizliği dürüstçe gösteren, tekrarlanabilir veri analizi: iş KPI'ları, kohortlar ve tahminler; hisse senedi, kripto ve sağlık verileri için kaynaklı bağlam ve risk uyarıları; tavsiye veya teşhis yok. |
| [`autonomous-loop`](skills/autonomous-loop/SKILL.md) | Hedef odaklı döngü: ucuz bir worker model iterasyon yapar; en üst sıradaki supervisor model yalnızca teşhis koyar, doğru kalıpları gösterir, testleri tasarlar ve onay verir. Takılma tespiti ve kesin durdurma kuralları yerleşiktir. |
| [`brand-ip`](skills/brand-ip/SKILL.md) | Markayı koruma: isim taraması, marka tescil stratejisi (sınıflar; ulusal/AB/ABD/Madrid), tasarım tescili, patent/faydalı model, telif hakkı sahipliği ve devirler, alan adları/kullanıcı adları, pazar yeri marka kayıtları, açık kaynak lisansları, ticari sırlar. |
| [`codebase-analysis`](skills/codebase-analysis/SKILL.md) | Herhangi bir repo'yu baştan sona analiz eder: mimari harita, kalite ve teknik borç, güvenlik incelemesi, onboarding rehberi. Önce ucuz keşif yapılır; her bulgu dosya:satır kanıtıyla verilir. |
| [`commerce-integrations`](skills/commerce-integrations/SKILL.md) | Ülke/kıta bazında ödemeler (satıcı kaydı, yerel yöntemler, taksit), PCI/SCA, webhook'lar, iadeler, mutabakat; pazar yeri senkronizasyonu; kargo, gümrük, e-fatura ve KDV/satış vergisi. Bilgiler tarihli kaynaklarla doğrulanır. |
| [`company-setup`](skills/company-setup/SKILL.md) | Büyüme planına göre şirket kurulumu: şirket türü seçimi, ülke bazlı kontrol listeleri, vergi/sosyal güvenlik/banka/ruhsatlar, bölgeye göre gizlilik ve e-ticaret uyumu (KVKK, GDPR, CCPA…). Tüm başvuru ve imzalar kurucuya ve uzmanlara bırakılır. |
| [`content-social`](skills/content-social/SKILL.md) | Deneyimli bir insan yönetici gibi sosyal medya: strateji, marka sesi, takvim, platforma uygun paylaşımlar, resmi API ile zamanlama, topluluk yanıtları, kriz yönetimi, analitik. Kullanıcı yalnızca giriş yapar ve onaylar. |
| [`daily-assistant`](skills/daily-assistant/SKILL.md) | Yetkin bir asistan gibi günlük işler: gelen kutusu ayıklama ve taslak yazma, takvim yönetimi, görevler ve hatırlatmalar, toplantı sonrası takip, seyahat, alışveriş karşılaştırmaları, faturalar ve abonelikler. Onay almadan hiçbir şey göndermez, rezerve etmez, ödemez. |
| [`diagrams-mapping`](skills/diagrams-mapping/SKILL.md) | Gerçek kanıtlara dayanan, kod olarak yazılmış doğru diyagramlar: bağlam/mimari, sekans, akış, ERD, durum, dağıtım, süreç, yolculuk, zaman çizelgesi, zihin haritası. Mermaid şablonları render edilerek doğrulanır. |
| [`growth-operations`](skills/growth-operations/SKILL.md) | Lansman sonrası büyüme: huni ve en büyük kayıp noktası, izne dayalı CRM yaşam döngüsü akışları, SEO, CAC hedefli ücretli reklam testleri, yerelleştirme (i18n, hreflang, para birimi), destek operasyonları ve SLA'lar, A/B testleri. |
| [`guided-discovery`](skills/guided-discovery/SKILL.md) | Hedefi söylemek yeterli, tüm yol haritası anında çıkar: her bileşen sade dille, kim yapıyor, varsayılanlı en fazla 3 karar. Sonra ajan işi yürütür. Paketler: e-ticaret, sağlık, SaaS ve herhangi bir sektör için genel harita. |
| [`infrastructure-planning`](skills/infrastructure-planning/SKILL.md) | Doğru boyutlandırılmış altyapı: kapasite hesabı, VPS/VDS/bulut/SaaS seçimi, veritabanı yönetimi/güvenliği/yedekleme/PITR/katmanlar/failover, RPO/RTO, IaC ve CI/CD, maliyet, modernizasyon. Ölçülebilir tetikleyicilerle aşamalı planlar. |
| [`market-research`](skills/market-research/SKILL.md) | Kanıta dayalı karar: talep sinyalleri, aşağıdan yukarı pazar büyüklüğü, davranışa dayalı müşteri araştırması, rakip kıyaslaması ve yorum madenciliği, fiyatlandırma ve birim ekonomisi, risk kaydı, ucuz deneyler, devam/ayarla/dur notu. |
| [`memory`](skills/memory/SKILL.md) | Oturumlar, ajanlar ve modeller arasında kalıcı hafıza: durum, kararlar, bilgiler, kullanıcı tercihleri. Son açık noktadan devam eder, baştan başlamaz. CLAUDE.md, AGENTS.md ve her araçla çalışır. |
| [`planner`](skills/planner/SKILL.md) | Uçtan uca planlama: çerçevele → keşfet → karar ver → parçalara böl → riskleri azalt → yayına al. |
| [`product-build`](skills/product-build/SKILL.md) | Mağaza, platform ve uygulama geliştirme: önce "hazır mı, özel yazılım mı" kararı, sonra her rol kendi çıktılarıyla (BA, veritabanı analisti, mimar, backend, frontend, admin, QA, DevOps, güvenlik, dokümantasyon), Rust öncelikli teknoloji yığını, e-ticaret planı, tam test katmanları. |
| [`research`](skills/research/SKILL.md) | Kanıta dayalı araştırma: erişim eksikse ister, yerel dillerde küresel arama yapar, önce birincil kaynaklara bakar, temel iddiaları çapraz kontrol eder, çelişkileri bildirir; yanıtı kaynaklı, tarihli kanıt ve güven düzeyiyle verir. |
| [`root-cause-analysis`](skills/root-cause-analysis/SKILL.md) | Kanıta dayalı kök neden analizi: yeniden üret → kanıt topla → hipotezleri sırala → nedenin nedenini bul → düzeltmeyi kanıtla → raporla. Hatalar, performans ve üretim olayları için rehberler. |
| [`security-operations`](skills/security-operations/SKILL.md) | Yetkili sistemler için savunma amaçlı güvenlik: appsec/injection, CVE yönetimi, bulut, e-posta (SPF/DKIM/DMARC), kimlik ve parolalar, sosyal medya hesapları, host/çekirdek sertleştirme, olay müdahalesi. Önce salt okunur inceleme, kanıtlı bulgular, onaylı düzeltmeler. |
| [`software-engineering`](skills/software-engineering/SKILL.md) | Genel mühendislik kuralları ve mimari katmanlar; türe göre rehberler: web, mobil, masaüstü, gömülü/IoT, CLI/kütüphane, veri/ML, oyun, dağıtık sistemler. |
| [`token-economy`](skills/token-economy/SKILL.md) | Token ve bağlam kullanımını azaltır: hedefli arama, kısmi okuma, filtrelenmiş çıktı, toplu işlem, görev devri. |
| [`visual-design`](skills/visual-design/SKILL.md) | Jenerik yapay zekâ görünümünden uzak, özgün tasarım: kimlik (logo, renk, yazı tipi), marka rehberi, şablonlar, kanıtlanmış tasarım sistemleri üzerinde UI/UX, yerel GPU, bulut veya ücretsiz yazılım için araç yolları; referans siteler yalnızca lisans sınırları içinde uyarlanır. |
| [`workflow-automation`](skills/workflow-automation/SKILL.md) | Sade dille otomasyon: kısa görüşme → spesifikasyon → doğru platform (önce ücretsiz/kendi sunucunda çalışan, ya da kod) → idempotency, yeniden deneme, uyarı ve onay adımlarıyla kurulum → test → runbook. |

### Yol haritası
[ROADMAP.md](ROADMAP.md) (İngilizce): vizyon, tam skill haritası (fikir → şirket → marka → tasarım → ürün → altyapı → güvenlik → büyüme → yapay zekâ) ve planlanan Rust orkestratörü.

## Kurulum

Bunlar standart **Agent Skills** (agentskills.io spesifikasyonu) paketleridir; çoğu yapay zekâ kodlama ajanı bunları doğrudan yükler.
Kaynaklı ve tam uyumluluk tablosu: [docs/COMPATIBILITY.md](docs/COMPATIBILITY.md) (İngilizce) (2026-11-22 itibarıyla doğrulandı).

### En kolayı: çoğu ajan için tek klasör
Skill klasörleri **`.agents/skills/`** altına kopyalanır. Bu klasörü **OpenAI Codex, Cursor, GitHub Copilot, Gemini CLI ve Windsurf** okur:
```bash
git clone https://github.com/orchnes/orchnes-360
mkdir -p .agents/skills && cp -r orchnes-360/skills/* .agents/skills/
```
Tüm projelerde kullanmak için bunun yerine `~/.agents/skills/` kullanılır.

### Claude Code
Plugin (önerilen):
```
/plugin marketplace add orchnes/orchnes-360
/plugin install orchnes-360@orchnes-360
```
Ya da klasörler `.claude/skills/` (proje) veya `~/.claude/skills/` (tüm projeler) altına kopyalanır. Cline de `.claude/skills/` klasörünü okur.

### OpenAI Codex
`.agents/skills/` (proje) veya `~/.agents/skills/` (kullanıcı) altına kopyalanır. Skill'ler `$skill-name` veya `/skills` ile çağrılır; ya da Codex açıklamaya bakarak uygun skill'i kendisi seçer.
İsteğe bağlı, her zaman açık temel davranış: `agent-behavior` kuralları `AGENTS.md` içine konabilir.

### Cursor · GitHub Copilot · Gemini CLI · Windsurf · Cline
Yerel skill yolları (proje / kullanıcı):
| Araç | Proje | Kullanıcı |
|---|---|---|
| Cursor | `.agents/skills/` veya `.cursor/skills/` | `~/.agents/skills/` veya `~/.cursor/skills/` |
| GitHub Copilot | `.github/skills/` veya `.agents/skills/` | `~/.copilot/skills/` veya `~/.agents/skills/` |
| Gemini CLI | `.gemini/skills/` veya `.agents/skills/` (ya da `gemini skills install <repo-url> --consent`) | `~/.gemini/skills/` |
| Windsurf | `.agents/skills/` veya `.windsurf/skills/` | `~/.agents/skills/` |
| Cline | `.cline/skills/` veya `.claude/skills/` | `~/.cline/skills/` |

### Claude.ai / Claude uygulamaları
Skill klasörü zip'lenip (klasör adı = skill adı) yüklenir: Customize → Skills → + → Upload a skill.

### Skill desteği olmayan araçlar (Aider, Continue, ChatGPT sohbeti, herhangi bir LLM API'si)
[docs/COMPATIBILITY.md](docs/COMPATIBILITY.md) (İngilizce) içindeki talimat dosyası alternatifleri kullanılır: `AGENTS.md`, `CONVENTIONS.md` (Aider), `.continue/rules/`,
özel/proje talimatları (ChatGPT) veya sistem prompt'u (API). [`orchnes`](https://github.com/orchnes/orchnes-cli) CLI'ı (Rust, ayrı repo) skill'leri kurar ve bu dosyaları senin için üretir.

## Tasarım ilkeleri
1. **Bir skill, bir iş.** Odaklı açıklamalar güvenilir şekilde tetiklenir.
2. **Sade `SKILL.md`.** Yalnızca temel prosedür; ayrıntılar `references/` altında durur ve gerektiğinde yüklenir.
3. **Doğrulanabilir.** Her prosedür "iyi görünüyor" ile değil, kontrol edilebilir bir sonuçla biter.
4. **Sağlayıcıdan bağımsız.** Belirli bir model veya araca bağımlılık yok; araca özgü notlar `references/` içinde.

## Katkıda bulunma
Ayrıntılar [CONTRIBUTING.md](CONTRIBUTING.md) (İngilizce) dosyasında; ayrıca [davranış kuralları](CODE_OF_CONDUCT.md), [güvenlik politikası](SECURITY.md) ve [değişiklik günlüğü](CHANGELOG.md) (İngilizce). PR açmadan önce `python scripts/validate.py` çalıştırılmalıdır.

## Lisans
[MIT](LICENSE) (İngilizce) © Ömer Faruk Alibal · [Orchnes](https://github.com/orchnes)
