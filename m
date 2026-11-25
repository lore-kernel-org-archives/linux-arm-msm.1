Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641208;
	b=2N59o5MRpG3twU6Om2UYMYXOopwVLZlCwCa/JZbVzRF7VPzMnQoNkXQuTwtgTFmrTgtX
	 XMo2sHC6ANV+b1MPRnNi+gqec0ZX4ModRZnIwAAHboiXCothwuGRTDcJ5MG7VZ8zpI60j
	 eN2WLuBU9LsN1Mgq6FpPCWvBN/Uuay4W0NjPt961DSRCyJH8n9Eh2HKyvaeNsHXk8ExZV
	 n5Yx3YN4AtLQNaOodT5S+R671q93fHPTQ5cqDYZGEjHkQyIervqUxuT5znANLUtPGgLRm
	 LTQ4CajFHvIy2FawIiYtXN1UdAKk5nDijvHJNESo3CsC47JyU/MNa2zaxhQ/ymmqeDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xXs6Urvjrwg0MhiNF5PgspNmB700LKi1Pl9ZIaKiWN0=;
	b=Iw98NTn+NDZu+2oRjBiw+ljxjw0opxSNEv2Q3SVJxI2WiG3/7skCI2gnSuhdoM7g6EcT
	 fozuHdWfw4Y/dK9bMdS39mF42YFVPEgrnRbgbFYdnof6sY/JQ+hndk4Y22PJJVrHNG2Mm
	 Jk0QsieegBB5EpcpaNlaR4lnvhvWsI9VGeCmRd9fiQxsJuAi8fhtFVmwfswig3H9XBXb2
	 HmxGSNt5Lc07yy12LCxG4NfvTGEI8bMCqwDcXZX3Movs8BQaBXAFhrMYu37sGmlXt5RVO
	 C8oU466u3nuwiI49TaOB/o8JMpnuN2JP/kj++tMsPGRUdbG/63hSZweg7Vt94qD/uNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QYtmM41p;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5DA606A337
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5DA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QYtmM41p
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4716d76fso625762e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795641206; x=1796246006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXs6Urvjrwg0MhiNF5PgspNmB700LKi1Pl9ZIaKiWN0=;
        b=QYtmM41pqn1bybHC2O+QYm1el7W1qPS1RbFlwVwZKIANW5WMJ7BSwR/sN2qZ7k6IVZ
         dYYFZm78zNfQCVSeFNTqCmbUCgiXcTQQOWe9zHUyn+wH648TdUQKGADp0HVe+JCA2pTx
         Ysl00fc432si7vjAhucwAkk+sTcf6aPfxlBJaPkTxyiOohhujy3iHR9BC6Byu2Dz8LM5
         RMvwJU5Ug5GQ6QR655p8H94vB9MVeJ1eGKi9A5IIiNBYUa03VF7oBoDiiOjHpzj+0Bpy
         t0Ys09W2PE3u4L0K73AAnUGuordgjNp2fusaMUukklr53lCN/OrANUlEZh/NbR2Mxr3X
         54Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641206; x=1796246006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXs6Urvjrwg0MhiNF5PgspNmB700LKi1Pl9ZIaKiWN0=;
        b=huasaBXHxcRVCMGVRw7PzpPgVhct1JDvDo4Tejh0h6zyjlhM5/xg0APO+AbofCaOz5
         0HcrVQyfG6rSM1umiVaPZv8ckF2ZYkC8/u9yCl2Ia6rHMwmRI+2PTPmGyMfMsFlWzg3C
         8F9YDyhNv78p6P/5rTliYl85yB9WdSsNNRdYr+KGy9AAZDxMyC+G1V8M2twfXQdZl2E3
         mtfXVcuZTadi2jP92Y3ihIAt4tCY+ZIwbSMiICiK1wY7mnJVoGl+25xshuOxxrsU/PPC
         w7F956nu55nz3y1KYG/7PA5PUqbeMVvHSCOX79ec55SQFZIe3y6ZpmLF50Hl8eDtIDxp
         e54Q==
X-Forwarded-Encrypted: i=1; AL+hErFKCXUPxQuSWcYTcJMrnPTXm8K9uCKvwTz25bomokYewMo4zAb1szQmWc1rjut9PkbL/2rCdADj0h3g0HOd@vger.kernel.org
X-Gm-Message-State: APuU4Z/U0LzFzI5but5fbJ1kFyBsD37SZux3B16ViuBPpcYUQNLVLG+R
	SWqwpX1LRdxVBkgfhJ/1vxFw7nQ4IVQ8bmihi2tXUSEjEs/815Ilaj+jMMw+ojNqVGM=
X-Gm-Gg: AZFdTZdg9gai0wHaBVA87BLw7dONnNGbtpsk9ph9kZ4X76EENafhOMI/M4hHd004O7i
	dVc+vvgsgB54W24D9PrETuzd1mtx7aEPwypx9BFiCWr+d12pu8QSYqu5fBW0D4gPii5Iiqwl1u2
	GZwuPYhWpzVYN0boAN085u2z8kUTP5OottbqXjKFXTJCJqh01od7w83Tb2pCjmc09T1tpSgLkE6
	amenioYOfPqVphP/9HY2MqG0wmqEDzWfmhymKxNbDAXE+dKuGqtd/8yVFAr5ZZsQs2I70jS77n9
	usltvvIp3rhtAeN8nLk7J813ojmpTeTRsnRQNTFJSPW3OLyFlr8d77DfDjgSzjz5Bu5/lZyuKsS
	15WwF/ZbcrP3Tuy4DYG3OTtKug5Y8wzlj3brbjQ51eJX+/qE8H7h/M4CRSe6XsjyqZvKGES8GJ4
	6E142cJKtXpY5vlKseSriE+twx+HWBMtA8XGE9Q2EnTbDuC1Q65O3l7yVkRLNVYeywfgHt5PtqL
	cSaI8jH5vCWroMNfSrrLWTORAF3cEl9zr0rkwXReWNMtdPOXjBv2f7mMENMhjLcf1NykDvKJ4n/
	5RW/QyvRIlFx8mYCacDVql9D4gQYtRHuyhDaf5ucgZsNObJFtLNIZg6N6uL0ON5TBWpg7A==
X-Received: by 2002:a05:6512:1318:b0:5c0:465:3fc6 with SMTP id 2adb3069b0e04-5c1bc8601a5mr6550334e87.4.1795641206204;
        Wed, 25 Nov 2026 13:13:26 -0800 (PST)
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
Subject: [PATCH 2/2] clk: qcom: Configure SM8350 Lucid 5LPE PLLs properly
Date: Wed, 25 Nov 2026 23:13:15 +0200
Message-ID: <20261125211315.1437946-3-vladimir.zapolskiy@linaro.org>
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

The SM8350 GPU and video clock controller Lucid 5LPE PLLs are configured
as Lucid PLLs, however clk_lucid_pll_configure() is a macro for
clk_trion_pll_configure(), which sets PLL_UPDATE_BYPASS bit, while
clk_lucid_5lpe_pll_configure() does not do it. Configure the PLLs by
the Lucid 5LPE specific function and describe the PLLs by the Lucid
5LPE PLL type expectedly.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8350.c   | 8 ++++----
 drivers/clk/qcom/videocc-sm8350.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 6d2660bdd825..b80f41361de7 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
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
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
@@ -601,8 +601,8 @@ static int gpu_cc_sm8350_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8350_desc, regmap);
 }
diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 8528aeb3a342..1e52d07861bf 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -63,7 +63,7 @@ static struct clk_alpha_pll video_pll0 = {
 	.offset = 0x42c,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "video_pll0",
@@ -94,7 +94,7 @@ static struct clk_alpha_pll video_pll1 = {
 	.offset = 0x7d0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "video_pll1",
@@ -576,8 +576,8 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
-	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
+	clk_lucid_5lpe_pll_configure(&video_pll0, regmap, &video_pll0_config);
+	clk_lucid_5lpe_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 	pm_runtime_put(&pdev->dev);
-- 
2.53.0

