Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8943303A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299981; cv=none; b=Rhlu6wc8Ulq+7QkIC546nQggC97Kq/VmqIus3+slSbBWYxXjIwgKLv6taISlOH4vpvIlPMXZLwArmw2cEoxjWAPW43e3u42STnQKMnmN++5n+FxZIz3bFJoBqzUVON6BtMPXAO2xAM/ykvrxPwh8oukhxTV3biDuiY5FTlnG3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299981; c=relaxed/simple;
	bh=r2L4kMqfhwIbUzsmf8wdDtYuSEy+RrrvfwHFtyC9iAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSLpYtX/Eb7Y4A/1PMuYxozQkvI/XkjAw1iGgDimveDth46I2OEnJpiLNG/E+8u/FD6AZiCfgK3B+1E/CkTY4biDXKbtIM1YFeOIAfkJNtakrTFKozy9711ILNJl/mBbvbAABvAOIZJBhYVAStMRy3eIGUWXLz+owW4wSgdA1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI6ER5TH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI6ER5TH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso8960095ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299977; x=1787904777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=GI6ER5THeq5IUr9nJOQ3nGfZtNgdBuj/Gh8ro0UHJFY5BvjOnnaGC/hos8CxBdNlX9
         lbAFdF4paN7cZwIdb5PE9m2dAA+lTA3gqof6X9IPQ23oq6t7ghEig6sGFdKgxWkSNCN9
         m1Xy/a8qn1/MvXAA6MJnKKodpPqo84f3+heeSU98edfrKd198rCsddGeEnXxvCrG2vK5
         Z/k7uj1PbVn8EtR/PXyVm73cRek4HwWKITwRL/A90c71yVegHJ6TBg2n9g4xw+ypWrJf
         AXTnS9X9a0GXCNAbJU5Cm8LC60ffUtw1Bvmk8uD3BfMcLd0Rme/SIoZrBXBsUj+tW0tv
         kQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299977; x=1787904777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=buPxfVH04Vd4mBbi1IS2S076H5CSCLLt2PPdaO0z+/SS/gazeCazxvNbDGdXt1kAqB
         Mm6euA8DFida/PAQX3tq3KDNNVvByLTJjDsIIps0ApIAk2w78wUwIfC01+N89xPNqmPO
         78oxH7a+cbU+Ilm9RCZi7B6naVJt++5D9lAkqIdLBXFBItN7aHyipLSMkYk6fdu896O/
         zpfcNQRcR/5QLudud4rJugMYo8b80K3M+Ja8vhm9cvMEepJooUE/4iQO62EOarXlWjli
         9FcLC0KAdwLicLztFIHNXP6LcFQFQw+LoLYUy/rU0HYNRtJQvHPOAmCVT8jTdlKYUyaa
         3obw==
X-Forwarded-Encrypted: i=1; AHgh+RqKQ1MZfJQ+R3q81H62fXjc9635gg80K3amNUYfwmmpouKRBfLHqorTQMtgVF3wbpLSr91j9e0/Q1/oitjP@vger.kernel.org
X-Gm-Message-State: AFuF++krLue7Zqma2I/hKjPZpDJJNKfUSQ2pvcjPN0nrZkohzaIQwOsC
	v2gaquQfwIaqlkhCqMycvm3EYVSRcCz7gGW7sKXfblBzuwLzQUk9Rxpo
X-Gm-Gg: AR+sD12xdwWGCmWhpu0z2U6m6EPEIqn2D4tG54QMpkBE6jvPOkTLNra6b50xl0Cadqt
	Sri16aKpIr+3RR0+5Xx/Xr/sxD7Dl0+B14AT5EO5ID+ZTgaS269WCcYyuiWP7WvIwDpov2aW75N
	zTbhqpnFBMdFF7Mp21s8shyCH6Mf0HFanKe6G54S1P2+p3KUqIvtlvEYPs6hcnFbEJ4OlJ9tWNT
	0u6shwzmSq5DPaIdSyQAakbzRzK4SOtXjTWhg2pYIWpUxNVOyUJcNgezoGLBEZt8h25acGGWkis
	94NOmp/eBW6lC7sbrakOxCkwLTFdYC0w97NlRRnsxD/GhakKpg+/NfKeH933982gHzjK8Q3YIqv
	do0NrS7nMFTH0UBK6PTGtrhMVMZ0jR6nsHWSDHWY+lWvslNcCyVaHt9k8C0JN4BJW6uUzkIJUOK
	agNuC99dboCjBcmPSyufpQqSRAFDNVWkIcasTPgx+LyvKEMYaD/BQwDYbdRrquJDlMZatNU27BZ
	jvhvqSQtXCe
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr8791698a91.14.1787299977440;
        Fri, 21 Aug 2026 01:12:57 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:56 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Fri, 21 Aug 2026 08:11:18 +0000
Message-ID: <20260821081125.4522-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

