Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD742050
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886234; cv=none; b=rywn5CY+qu9T4ekHpBGt6+YqJO2FUlncbjUN2H931ShfOSzU9LmjQCgF8tStkhQRrAN+1Piu1dqWT9n4xQLyXoYQexpvG/qzw+8CSdhFDn/t43mhqeRzQWLwRm8l6F/+H6xFt4y6FhePCzI5JkIF6WDTMG2w1JfRvpALrUhgcK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886234; c=relaxed/simple;
	bh=99pJRjLsjgQp97RPaeWEZ1YZegnfkzqsNfQJNAJNwP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExRNtRp9h91v+ZaQ/f3V4PCejFMFi0EDRR90CEvpBwwbpMNv4gSerm5jH3HRrP+DOpeuYh8fjLB2uE4b9We12wpDXyTNhabn+CuBxyUpTHo+ilKxHeuN65IFndmGxLR1BUGqz768emVR3SlFtmp4a2hbgUOCHEHmwQK746aRJPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYuRae4V; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYuRae4V"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cee9b74ee1so18547725ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886233; x=1787491033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=KYuRae4V1hS2NQ3vslM+2DLILO2YsIPFIbL2zuD024L9znztmMabFC10WnbLvVGXb0
         oIbUPi8cqNjq+J1Q3Z5kyFklouipYBErhCDexHZqrLSBFD+NjWq2hKStVZDg+OPdW+mg
         SPKTIwvm4c1dxehRez6RiGZ4qkDQiM7nTyxlbDTb9T3P8qyv6Ip8iVUYq2VL/WcWDQ33
         03ACjxX2giU3d6ty0066Sf+yBs/1sFGhKI0tWmM2yim1YPQRvu8mdMQomqsEL2Ao1B+9
         jxaeCtLZQupkF41W/pmTxnRB4kQJtAXsySiS3MxHfNO5A6eik5Bz37K1L8fE2eWWtTKU
         Ewog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886233; x=1787491033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=gnGunntCvbno0moflqfOGjI3q514aHgMj/BmXK+1RgOEb/iNBGahBcpl0paY8hiBBy
         +BoGmgeKlTsAn0IeoRJmRedhmmOUU25M+DhaPRItqBe8reX5p08IqrogwPkVN0J88kbX
         eCqeLY116gRTXlHHNSSlzmPcuhPcdTJZllyHGb0WWfeWPfUljNJFHdvi6T6tQ1Gyiox9
         cwDUBRZlQZlaEo4e8txXyRR+2+TXTHTnE6KFlUXf+YMUeFrsaGYgDBsjJ7JYESx2tagR
         LWj5fhUUj5D/st4hk3ekJ3msRzPfHMzpcSxIBThb9IaZZ4jYm/kKrcR+j79pyIzab9um
         xhsw==
X-Forwarded-Encrypted: i=1; AHgh+RpqjVbxfOX1RXFJWInm0KVjQXqrRqajkqskjR3s2ZoPDxy84rjs1nFbuB+xlIg4LDiaEDJZhpjIREmdT8ma@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/HiZ+baJDlwM3bakolvOmS/ERxJnF5VkIfoM0JsXKyo+DVZ5p
	6T2l2ktgfDuNJUt388HsOvGF6RlLanJtWvl/cgbCfSSy7ohilzOjU11E
X-Gm-Gg: AR+sD13+VXbo7f6Jsct3r51ftCeSpIErMCtQXIkwZf+G0YEx43U3dlnlpWCJm525j66
	UwJlgOgf1PoITF3Un/LFYCHUNIQJUbuZSSoB4/+rVniluIkgyi4tH99AHy6XMuy5JyAtBmz6frU
	CL3L2iNLdjyDvqxhkJHNIxerjW17e5mpole+7nMI2KSFxkdpmqy+C1As6eCVAmRGyf7GtA0PlaJ
	TpKV+R2AutKDWsc+IY5m4w7KIkVmuyDQ/3E8/nSd1iU+0AGbyysf0EHisu73paSlaXJqTLr6+EO
	7IHSfvd/ydxBgWqv0blP9APURrZt/8T6iH8aNSbxEwphvax4TJ3hyUEpAn+f0AO6YHArXdkKScF
	NiGrkHiC0KCgKnDhZmxwY4dzYKyuaZIU0uulLQ+75F2l7YYv5VN/LCI08rP77ebnvnhiuG87gpB
	RfK5elIgS7/95GNHtNT4So1a/LG0Jv3fcFQ9lvdghPoMZoUu5DNs778X8+WfeyxbdnTjJyDs7fR
	60LfHBTLOMT
X-Received: by 2002:a17:90b:4f84:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3933bd186f4mr19782001a91.4.1786886232899;
        Sun, 16 Aug 2026 06:17:12 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:12 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Sun, 16 Aug 2026 13:16:44 +0000
Message-ID: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a..f4cafa274 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1011,6 +1011,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
 	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
 };
 
+static struct clk_hw *sm7250_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_d.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7250 = {
+	.clks = sm7250_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7250_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1120,6 +1143,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

