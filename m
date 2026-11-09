Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184163;
	b=OwyPA/zpeMzwAKQjNa9HTo1kgrAi3rhFrZbRsDmF1wbOMXlg6DojWh6UDOqkcjS05EIU
	 gNKyrCuQERu4r0jEwHl2pMRNq6tSDBXdhM33kpKpFiQER7ctGX0KjZ9Nu54FfWdcwr6ff
	 JRIIc9pp96iNRGJnYSqIzjbRYckw5e/8E8GvO+S2jJzLaze2GutzP820PMDYAR1AoeyuC
	 GVsitO6YjYFCyBVit04xcqfZUCioorL+oJpI1Bk9W0iOQs7AwRkqrPSm9g0v0SBfTMEP9
	 CuQ1oTPYJt23pWuZH8invEWp7qJy91+qjsGdGZ4SA4P//LyS8I5Eut5JhQUZ+NC4Tjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
	b=ikIFdcAmgBI/kxVrqMT9x0xa78H/nuDaiYJrgaoHcWesvOycoWhceYOkJ82IY9n+bFwC
	 EXMYDJsbtaCH+6gIOaRQDs7B8eF/HqnMzU6qwtcfn41lAUMopXGTFIHuVaur/KXES6UX8
	 HlZc4yQC0VEoxMDJb+dOcc6jM8p/65RR+zR0jl7akdfgd2egQC1VmgJseRetE6zi2ikak
	 mUN4XFup3qpheG7yIsiiTpVw1irfcx7brf9+iOC+9u5kTszNwoZlzqtvMRvWbSguvQcMG
	 ybeQyNGLOFngZertaitjjEviYdiKPca+zmJzBJEgGfglWqCMux00NDjma4Lbq7ENnUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4p4zi10;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3674606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3674606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4p4zi10
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2573015e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184161; x=1794788961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
        b=d4p4zi10/iZIYiEcew0CxxBGjsSCXKwJz7Wss0Cfi3QIxOJNnQvuBS9HdlIksM/8TA
         0mmD/syfWs+a+UbR4zBmt/bHcu5Jq23y7xhZVY6/giLvcc9+jw1ggQRqVtlWttcH7+eY
         upInWhjp9Xav/kLh3RzPOsX6KRLFfZDtKEc9fypqKcYovOJENTuo01UZ2pqdRkzQSb8J
         ahXIJpkpsnAGD3XJ4TS2bkwaBZQbrBqoDUQhHEPI8QmIMbcS0cnDAYPI5GO4LXfjisds
         6iQbLLjn4kNBelJDM+MBhmxKZATTsynfheAsCwk0EBnK37RVCfaTG1keRkIlCn0JyIkr
         UrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184161; x=1794788961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
        b=rTwR+4Rhsk5Rs2ZqlXKW8pkI2m0ii1/KYT59nANL6aJTCJ78FO+ji5nquaJyTNBNEC
         2M+dqqZkql8grukjB7F6F0FbJvLADW2vh3m+JS/PpYBCCCx8rmDvM10S0Wx5LNiSt1s6
         iX2iiFza2OZCr+AhQjiO9UBPMSWaNmG5UAImDG270Lah07miMtp0RSNwkGtT0qVnOXA+
         gR57lmxkiklVht6q1qujb27sC/8fb7M5ivpdTGz1PM/yWNiRRBD9kP7T9UMUI9VoyXcU
         3rtpYxUiofNKz4sX9iUi2+95sxmIapUFL5yU33F7xaAlI2WjN4jLYx8HdcqGN/2bF4wW
         pYEQ==
X-Forwarded-Encrypted: i=1; AL+hErFpcTYfJefFJm4xU2ksbEypom+0peFwz43FDjH+ZfJ/JMkswLm9m4hPcuKklH19Ak03NfVY8QX+4h6UNOuI@vger.kernel.org
X-Gm-Message-State: APuU4Z95l6slTy9kiWacmV4Ue5rDIVKZLja23AgzDhoMNnDpIh3WmMSS
	sGmrbmzeAxf6NUPAiy9H4nLiVGCoIoih77BdpfkgygYvoLYlECHH5+Yh
X-Gm-Gg: AYBFou3nodN2QNzSnEFPFL9IJQlsJamNo9uryhSuZbKf2RLWc+YCJE/tXcPullqis3z
	5Tmyew9cuLmC/HN9uEs0h0oWc2vgJI0/hmZRZmsUu9qK2LFsOKuvO4ECrMFntKpOMIIBpLBzyXw
	Ue3eiRb/HB3LiKaSLMTrwQmh2QX/A9AUZYZ/Pm/bnbU57CbZVcalhQ8ASQpSllxkZEw2jYkLOBY
	Anz7LW1BIsCp95xY3oNFN9oYUjM0dXMSqXGF96ts/s1apNRtC7syjkJQ8PqKIUI5OHb6pGuIPIn
	CU9jZBTArxFUxUv1JZ67Vl/P/QmFFrqHTXEShTj15esPwGUhmQ+5Hl0U6h653q5FTnnnD3Ah7ET
	L5SVEK6nEdoZA2kA1kt6kRP8Vh6ZU0lfbt9w8RgB5YWlIlqpNECkFYUMPJVR5Cy4D/hvZPECnSO
	hvmo/EmZHpXgD8ijXYVu5+l5R/U0mWewp0Zh9nBwbxq+XtI8/AdClJi46UqGM/uRQC1pFik64BU
	Pa3AAwBAlXrGwXoylal26wVYFa3DAleNUs2nixdh8ft5GGpmMQSilwnyFWgeCvScBigmZnXBA3O
	gr6TT88dqDwmP1TlDe8KrLAX6VLyTFs7Dquw7ZY6
X-Received: by 2002:a05:600c:6087:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4b963c6cfc2mr45624795e9.11.1794184161384;
        Sun, 08 Nov 2026 16:29:21 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:19 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:11 +0000
Subject: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
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
Message-Id: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
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
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=2646;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=aIHEkyuQRMwtS4nF1/vAJgKiqPllrSNgBuEOLsM+WjU=;
 b=4GhFqGxLWBNf/FL/i4sGiZ+95EhdglFfY+0zGtEjtd6bCBnqe5FwKRv6g1GpcjOv1EoIDLwKm
 HLuC9tzQhEzB6kg5r8jpJ4YsbKyhUroOwn4a91d9Gwh48Vq+NbHDb+P
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
so these are LN_BB_CLK2-4.

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

