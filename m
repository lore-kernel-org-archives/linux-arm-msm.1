Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641208;
	b=fLyNmpLAyrkkM+ubsHE2TDMKt6c0mslu07AdlpjEII2GeyvvqbDeZGhXh2rnI7cz59dX
	 TYO/7pUqNIq3K4f7Q0IT1TTbEIT8afRtBkFZfsO5HZqEKfi64WpWxBv1U7fiDVPthbWj4
	 HHJHT03pf7l0WFZ4Fk067MHiMCZMnSwoDLSinew6psB+pFnphlgXGJFbmu9WOyvvWr4Ah
	 bkLxmuF7krHQEVUFv0qpfGzZjV9hNJV7w6eJc00gnFLg20UC/Q5WN3folzbsqyz57Uyjv
	 +n8xj9Fk1R6LTnlJzRqies8HE2C2KzqiqBcy/2alTPimsapLJdSjXwSYWZ7LpmyIZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rMA4lAFiUy/mbWPg6Kl2z9WAvu/Yy/1A3FfHztcMwb4=;
	b=UJZgl8LX9+MSpg1qdYQDCHFWpSEdKJtCVHuSPB51WJ5JcA3klgZ47yXgrEKBRoSE+wfT
	 v94d41C9yTeLQnWDROJ38TDtem8PjDO0m10tCwt1LUB3iCZm1i0PbFIPkvUFE9hRl+60M
	 6a2SCL03wPXFYYQ7jSeTRpBSYjlnIU5rGI8FF+vAGC3dmZ9UA2Lgx4qtBWuhtVdDKoBOD
	 MozB/EGHL/be5MLM6oIh4qy0V52duprZTBE2TiTUo69/QzAuqJmWsMca9SfsU/HiVLZiH
	 Xazn4Q3BiLAg3KYnjtFmOoE2JockzfJHZyBzHO0gTQ3dB8gAEuYLQaZSceNlz4VfalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K3DJaNyD;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81336606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81336606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K3DJaNyD
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4626641fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795641206; x=1796246006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMA4lAFiUy/mbWPg6Kl2z9WAvu/Yy/1A3FfHztcMwb4=;
        b=K3DJaNyD1gnPAynTJwXTQkvn/HuKIQhRJoCjxyB/mWrO4kdxMTbXRTx2r/usQLgc6z
         IzaFdCmNXYUSIfB+xDxhGuf5Z22Uj7Q1FbCZ3y1rKPY53D5X9CWyirIhaU8uLyhlVjdc
         EKSY8qMke+dxyHQw0rLwSxE+bX7+xjN4N6kg+bOulko7ZyyxhpZEF3P/maA72Na7NXX2
         +MMeAMu0tCxuhHZlBAOiba/5mE7wulkKN8EBIKtyrvwJwA1v4+ZqkbvWDNyaN5K69k59
         GBPkZg8qJSy2JCgSvML5+wOwWR05gsMC+LtvSBS36O0RTDNhJmmsx9Hr509Z5kU4S9ax
         71/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641206; x=1796246006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMA4lAFiUy/mbWPg6Kl2z9WAvu/Yy/1A3FfHztcMwb4=;
        b=oglmMzCwgaZs7peSZpp2uz7NBkc4f6jG4J1JmiGOa1gBr9xFiD6zurgPjLYg0auvEK
         NlZDe17i+0NxhcfdV9lAX15nhewee5m3PjQRUkKG81c3uR2zWqX/5cUHMYeTHQyOQX7N
         1KmYdnx+wGNeslBuBnw82AlsVvfvHtmdcCeWrqdbvuUmyMo1U4gXe3iGKzNEks9bapA2
         TKOMwUYlq7DUiVDai+dsd+9kj1vV6AVvpvy8zF6nzUPUwVNRU7eLs59pHY3BTOkZlkpZ
         ha7ypu3L0m6/iqWs6ZzjWPoGQiOeOLgqD3upSqtZv2D3iWtRvApIyqvDv+dG2tEiXNyw
         R+9g==
X-Forwarded-Encrypted: i=1; AL+hErGEbbT620LMU1WaPYZNBFRZnUHDNN0CqvvJDkCW9I/IZrsCcpUXl3CDigHr3RBqIUaF7jadAwF+k6zC0JYa@vger.kernel.org
X-Gm-Message-State: APuU4Z+NWIyxOd8y8vdqDj6Lh1HoLPzVGDZRYVN8N1y0azvPzvOrhxAO
	4CwrhuY05NkwAvtlizvd+J/C2MOQdpuUzZ/6j0IAOu08edH7JlIVVAWbosxXwRjR81w=
X-Gm-Gg: AZFdTZcuBly4fH13xB+59ef1le8CNKjuZfhqGDEjkYQNQopSC/QIw8gDs8+kUjNODGo
	Dk4eQ8VufOsu+fDT0Ed3b/pemWg+h4jjfNBW65c5Osgs52hFu1QnPdO2b7rmD/2Yv10GJaJAOwK
	srGpkMvGrXp1tegAW11y3s7n+Ec7KCEq1kOMOtP7QNEt2meUejzZZJPy44L1HscR7PlHIKVUQIL
	fJvcK07KwE89+YApmMEo6qIjj0MOdpsrPqvjeCjqlAiBRPyRp69jshJeEh40dDImg0JwXSQEtYb
	DDkzS/8ISc/fDwwGgGZe1gM02PG0gdqlbw2BOrckUIhhy2XrRa2TaT2yq5/LNoRCDJRtYnWzs8r
	s/NPjJE76dxC0vCrLjsr/gCzNcVU+3z+c1nKfzV7ugxx9Osc2vO0tlVnUJEk2qJ1zK8RjsB6WNW
	6ny3uKM6/iTqBjAEJF2DuytWZN04UsjL2hYAzMBJuqchbq90Oaos6BKF98IhNwuOKqpGgUbd8r8
	xl5d666m+97wRjCfptc7rIjcojgSDntU61pSrStcKflAg96Er28GM7iN+TLMScXERA8pt7ulhab
	yh1Ko2vScrzupOFSrizJ2wVu2gD6uhCnQhelhGbwCjr8msFtt5TuRV6l1MDWDoaNBUHsJg==
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id 2adb3069b0e04-5c1bc57989bmr7086630e87.0.1795641205624;
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4858972e87.23.2026.11.25.13.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: Configure SC8280XP Lucid 5LPE PLLs properly
Date: Wed, 25 Nov 2026 23:13:14 +0200
Message-ID: <20261125211315.1437946-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
References: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SC8280XP camera, display and GPU clock controller Lucid 5LPE PLLs
are configured as Lucid PLLs, however clk_lucid_pll_configure() is
a macro for clk_trion_pll_configure(), which sets PLL_UPDATE_BYPASS bit,
while clk_lucid_5lpe_pll_configure() does not do it. Configure the PLLs
by the Lucid 5LPE specific function and describe the PLLs and their post
dividers by the Lucid 5LPE PLL type expectedly.

Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c  | 46 +++++++++++++++---------------
 drivers/clk/qcom/dispcc-sc8280xp.c | 25 +++++++++-------
 drivers/clk/qcom/gpucc-sc8280xp.c  |  8 +++---
 3 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index b0f1d40d1df5..d14cb46a19af 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -70,7 +70,7 @@ static struct clk_alpha_pll camcc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll0",
@@ -93,7 +93,7 @@ static struct clk_alpha_pll_postdiv camcc_pll0_out_even = {
 	.post_div_table = post_div_table_camcc_pll0_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll0_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll0_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -115,7 +115,7 @@ static struct clk_alpha_pll_postdiv camcc_pll0_out_odd = {
 	.post_div_table = post_div_table_camcc_pll0_out_odd,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll0_out_odd),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll0_out_odd",
 		.parent_hws = (const struct clk_hw*[]){
@@ -145,7 +145,7 @@ static struct clk_alpha_pll camcc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll1",
@@ -168,7 +168,7 @@ static struct clk_alpha_pll_postdiv camcc_pll1_out_even = {
 	.post_div_table = post_div_table_camcc_pll1_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll1_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll1_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -223,7 +223,7 @@ static struct clk_alpha_pll camcc_pll3 = {
 	.offset = 0x3000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll3",
@@ -246,7 +246,7 @@ static struct clk_alpha_pll_postdiv camcc_pll3_out_even = {
 	.post_div_table = post_div_table_camcc_pll3_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll3_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll3_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -276,7 +276,7 @@ static struct clk_alpha_pll camcc_pll4 = {
 	.offset = 0x4000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll4",
@@ -299,7 +299,7 @@ static struct clk_alpha_pll_postdiv camcc_pll4_out_even = {
 	.post_div_table = post_div_table_camcc_pll4_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll4_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll4_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -329,7 +329,7 @@ static struct clk_alpha_pll camcc_pll5 = {
 	.offset = 0x10000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll5",
@@ -352,7 +352,7 @@ static struct clk_alpha_pll_postdiv camcc_pll5_out_even = {
 	.post_div_table = post_div_table_camcc_pll5_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll5_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll5_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -382,7 +382,7 @@ static struct clk_alpha_pll camcc_pll6 = {
 	.offset = 0x11000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll6",
@@ -405,7 +405,7 @@ static struct clk_alpha_pll_postdiv camcc_pll6_out_even = {
 	.post_div_table = post_div_table_camcc_pll6_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll6_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll6_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -435,7 +435,7 @@ static struct clk_alpha_pll camcc_pll7 = {
 	.offset = 0x12000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll7",
@@ -458,7 +458,7 @@ static struct clk_alpha_pll_postdiv camcc_pll7_out_even = {
 	.post_div_table = post_div_table_camcc_pll7_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll7_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll7_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -480,7 +480,7 @@ static struct clk_alpha_pll_postdiv camcc_pll7_out_odd = {
 	.post_div_table = post_div_table_camcc_pll7_out_odd,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll7_out_odd),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll7_out_odd",
 		.parent_hws = (const struct clk_hw*[]){
@@ -3012,14 +3012,14 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
-	clk_lucid_pll_configure(&camcc_pll0, regmap, &camcc_pll0_config);
-	clk_lucid_pll_configure(&camcc_pll1, regmap, &camcc_pll1_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll0, regmap, &camcc_pll0_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll1, regmap, &camcc_pll1_config);
 	clk_zonda_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
-	clk_lucid_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
-	clk_lucid_pll_configure(&camcc_pll4, regmap, &camcc_pll4_config);
-	clk_lucid_pll_configure(&camcc_pll5, regmap, &camcc_pll5_config);
-	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
-	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll4, regmap, &camcc_pll4_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll5, regmap, &camcc_pll5_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 96b3e5505279..1d09fa9e7a94 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -85,7 +85,7 @@ static struct clk_alpha_pll disp0_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp0_cc_pll0",
@@ -100,7 +100,7 @@ static struct clk_alpha_pll disp1_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp1_cc_pll0",
@@ -129,7 +129,7 @@ static struct clk_alpha_pll disp0_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp0_cc_pll1",
@@ -144,7 +144,7 @@ static struct clk_alpha_pll disp1_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp1_cc_pll1",
@@ -166,7 +166,7 @@ static struct clk_alpha_pll_postdiv disp0_cc_pll1_out_even = {
 	.post_div_table = post_div_table_disp_cc_pll1_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_disp_cc_pll1_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp0_cc_pll1_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -183,7 +183,7 @@ static struct clk_alpha_pll_postdiv disp1_cc_pll1_out_even = {
 	.post_div_table = post_div_table_disp_cc_pll1_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_disp_cc_pll1_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp1_cc_pll1_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -212,7 +212,7 @@ static struct clk_alpha_pll disp0_cc_pll2 = {
 	.offset = 0x9000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp0_cc_pll2",
@@ -227,7 +227,7 @@ static struct clk_alpha_pll disp1_cc_pll2 = {
 	.offset = 0x9000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp1_cc_pll2",
@@ -3173,9 +3173,12 @@ static int disp_cc_sc8280xp_probe(struct platform_device *pdev)
 		goto out_pm_runtime_put;
 	}
 
-	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL0]), regmap, &disp_cc_pll0_config);
-	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL1]), regmap, &disp_cc_pll1_config);
-	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]), regmap, &disp_cc_pll2_config);
+	clk_lucid_5lpe_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL0]),
+				     regmap, &disp_cc_pll0_config);
+	clk_lucid_5lpe_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL1]),
+				     regmap, &disp_cc_pll1_config);
+	clk_lucid_5lpe_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]),
+				     regmap, &disp_cc_pll2_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
 	if (ret)
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 2ccc083a4f98..36d2b028f288 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -59,7 +59,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_pll0",
@@ -88,7 +88,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.offset = 0x100,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_pll1",
@@ -453,8 +453,8 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc8280xp_desc, regmap);
 	pm_runtime_put(&pdev->dev);
-- 
2.53.0

