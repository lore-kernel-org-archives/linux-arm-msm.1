Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864277;
	b=ENEMEKdZZrwUiOyPoQ+WufMI2kDjxMU7oYIsAJXzNbPD9HiH5H4D9Jgn7k4QPezLjzQF
	 aWSCRyStOREFDzN6R4D5PaAVwgtpB0Xn7U335NaZN+OBcttqeYrXNwebESsGImp8h1KR7
	 10lLm1CBOTpvmhieCdWTJGV5ftw/JxiahVcQavKrFt0oecn0AEgtcGn5ijaGcoPasLuk0
	 KlaCkqbUYSvn0fU94wub/X4b2QprjBujVAhh1L0EBqcPJaRTKq9bj6edKZ2UyioY7ictQ
	 3aPbMe1XV+hDg0rrUStNJEj9jSJmJ7pw8U831ymVCjpkhIUnzriDl3p3x4x+FnOyo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
	b=Gfs1Kbw5FsIW9dWxyPZVb9RizR7pufkxVeIsdd2gDYlkepWkzeI4x0bVFWijodPmkLLi
	 f6WI+mRTYaoeres7g17l5/HVVT/qFhjpgu4P1hd+u61SSQXQ+87Z2tMAVBWhtOtXhJhRC
	 EZ5rIOxPZOqW+psJUXMaW/5HQ3I3as6OmFFbas8LCu5lW0hVCckvVnotg2kypk9QzWS6+
	 EVCl3nTmKqC+W5nDKwRCFn9WaxHtATwrGd/Fbab0VS4WInraJJqs7uS4B8Y/Wuem3lhK7
	 c288m6V3R1cAnQj6NGTNGK3f8QqFvEs7MSAt9pr8aTAXFxgUa4ZGGGBxlITihPLKu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Od1ucjYW;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A283F606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A283F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Od1ucjYW
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so14590085e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864275; x=1795469075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
        b=Od1ucjYW5+qo18N3MM7tj2tZJWbDbHoeDSC6n7RJJfhjGadMeF8CK/OtTTRTbmdOzg
         czkjQ0DDeF5ejXEOM6wavWUGEHsj3WGnuGzGZaQHHuXuPE5vs8JlRKJV9pMQdA/LfsTO
         MzolRipICdeDX5L5gI1XQYDuUmExZPRd7PhJQ2B4wDaF1bQd38X2RzSSjAcIRCUE9nC6
         tbonHuu5CHVGNPnGgV07WEjRxQHMzSj89oWEKwuU5IMUQJOLwDHZrykEBOZEyonz+XWA
         YPC3a1WFA0T4uVPn2YvhhovLYqGBXQQO55mKDincZxpwOAesppKhPEtZZC//T+Z/Qex4
         zVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864275; x=1795469075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epa5IEYHWsJY0JP+N5Pv5GwJ4u2FQrHZJPZPWohLYF0=;
        b=PDkP09P0DYMUbhO56+RIGXlC7GaWI3gg7ErT1UXuEsybVuQG0/pBj8oAOQyF5Odbqz
         DPLqu0xwcjWLSsL325QAzorW55FJLumUQDyGs/b0EmkKY/PLjVpsOaTPWXwM7GaNfbQl
         2V52jhcDAuoq081LdbyiE26vaMn3V7LhJrxDyBwo48yE32Y9lOW7rT8D6edva3ILt45u
         DQ3B2voPjGibEuvUBtXd7CQPuOib91GFDDVM+0tQyveRiUBuTVC4TwtxudPGcpS2UTtK
         y1e8sBt6iWYGFkHMNwNiDkEJm3oZjghJOKi40dinzUiHcrNLj4WWUoawpnWCNigyiL5J
         BLjQ==
X-Forwarded-Encrypted: i=1; AL+hErGm1DABaJLrJ7v74L//bIGI9pz01uYHc+4HLBc3+EpxEhm2KYm0SR30w2+x6jesbnM1BFvCZjAuPCjYJDIb@vger.kernel.org
X-Gm-Message-State: APuU4Z/ajAY0ZsL2k0j6C47UQyrRHXwWRJgLE8gYLgeLeDp+UZT8veD8
	WRUvP4/pNp4Eun4LEPaCJmR4fTHzCdE0jUurCC9RW9762v21/oGv7YUt
X-Gm-Gg: AYBFou0Z3oOMODeyrNeQ4qDnrxEV/sKdSLxbP4rDBwHL9jVQsNzkddAEBsbP7sivPlt
	NPfp1WiZGCOygiAPDQnINzix5UZVUAkwJLO0vypfmH1End8lR10msTqCnul7H7nRu8a1QqW1N0U
	sQlg6Za+PCjlSiLpB7ZVHXmgNYK82UBxCwReTAQZEePhN7tfl9pCggrg6sDXM/6HZ9teNeKkUqw
	/tmceyT3r0vKcYVTbGM8gziEQ30s9hv9iZy4nFvGLxEijIyQzQQtoDYbEBZ0qmmXyEPQNv1/fVt
	Dh79zc56yDwKJJVchfmsXR2WMZX4vmFZPhX538HJ1b7vT3/3QwlVpa/WyUnuQECySkd6zYoLjo0
	a1x0yLZhHMSpxZQy+PyTTbX8YfW5BxaKuA4KpRPkrWAGZ6y1GZBspr+AW+3TiDduomK21ygUnSR
	WaIqj7G4FlUcWmbjGtW5LLqy5YN2v7rn6Gcn1DCZW9zmy3Lu4BzrQBDl+zMf22RDVWplf7KWWmy
	xgS9Nv+dBbPUHnReck8v5nPTV827VciMn4WArUJQApLtupB0M56VlJUrjsSmEhxhCy2F2uUMXe9
	CKl/1l6Q0VyukmKFr992WIrI3hRtCQID8u1aT0u/
X-Received: by 2002:a05:600c:a00d:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb6842670dmr161939845e9.30.1794864275018;
        Mon, 16 Nov 2026 13:24:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:34 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:20 +0000
Subject: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2699;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=CYr23Vm5en0po39j5T9TwtOypnqgRXjF+/zxbnKqVkQ=;
 b=jU+Icb+XKUsl1PdEnDqpsU516pvV/uHmpga47T91CddUo+hWwy0HlEfA26EvDbT8sy281LIhR
 N3gBzhJTooQCxaVpb46KL9nlPB/CIWU0ZDsQkXyWty7fJhtvXb6Vpus
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
so these are LN_BB_CLK2-4.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6..fc16111c890b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -383,8 +383,10 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2, "clka5", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2, "clka9", 2);
 
 DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+DEFINE_CLK_RPMH_VRM(clk8, _a4, "clka8", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
@@ -413,6 +415,25 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *halliday_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a4_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_halliday = {
+	.clks = halliday_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(halliday_rpmh_clocks),
+};
+
 static struct clk_hw *sar2130p_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
@@ -1137,6 +1158,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,halliday-rpmh-clk", .data = &clk_rpmh_halliday},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},

-- 
2.55.0

