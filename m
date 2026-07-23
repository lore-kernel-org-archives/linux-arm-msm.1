Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606852DCF61
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769867; cv=none; b=CfWXT90NGq+aZfY22VSjib83TEvND+pZsDqAPa5miIFvpyWc6m/VMbK1C3jN2AT+d2Z8u0Q9SGf/ylwLBqwupOcv/bNRV2siS6chFuG22QuB5O4vp4ed0rdOq/o5f0BlbQkkIrW3pZ/bVD51UoJqwvkCV0XJFH4TcIPo4CztLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769867; c=relaxed/simple;
	bh=EAJEd2MEIlyLOfFUXJxbMf81oi6KegNxYKDCSxaOrss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k77/nKDZaBY+38IdIas8/FS4b4QnVlIlsbrReMh4zD1GCDHVPkei3VUZ9wzhk4V9ZkcYQpIQd6O1WnsHm5liSImrixmUr8eNr+pR92CNlgfYmRijYAizZAAgO2r8vVp0zisk2ZNB18t+Q2IrQGc0O9pwzpklel5oG/TlA1wAFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMmcDXfV; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMmcDXfV"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6688a2dceb8so44501d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769864; x=1785374664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqI7t4tO8EpEw30cMaLWLcxKZ+xDgEtSOVu43LNAj3I=;
        b=IMmcDXfVViK2GZAMc6L8Wo0K4/qLqneVnqeD5TpQjO/eWG57ZhftG1ZVh8mFDwgcv+
         0jZBVW17skh6X8sXC1DzW6yvATk7TK1ldj3Sc1cYBrqjMH5ZZYn7TWBt5cvGm7DKbeXo
         vrEyI4Eqo4PmSixfZJlfBeJ38UpDZdGDRNcmL7mjKZamToho5KiNMUMpt7Ee7qlsQmJl
         rxi+S8e5TMi5dsa82jUj58V8O62jEMJFyrL8kbwW1k5AsdBUlGBkHQrPdQIBzgTgi12v
         9zKx99ssVjdX2Rh5VaAwg2ezhJvFqCvIElel8YrZ15PVMDOmTsmTzHnzu/WriR0xDydz
         qPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769864; x=1785374664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqI7t4tO8EpEw30cMaLWLcxKZ+xDgEtSOVu43LNAj3I=;
        b=U4XW1LZWL3SqpNaiJL3nxY+qORA6f1j5sT6P+84mD9bJa7hzM+HDVv2Sfl6JbRSCHy
         DmjnmRFDBYmfHM9ZVEaheWWJbnqzBP9HD8L0sSR94jM6T7lUiVctBXkcuTquUU0fOwWZ
         Sgtl06zqcShkk8Y4ECoxxeqUTMFdYB/Ypjmjx7UaHe2LxT2weUPfZhallzYxPAdtkg0S
         CntHI4jx7gPEvPrEQBULviYg95IgslqkqO5sQg37sfJ/THd09GLrN9UNdw4yXht3oLcK
         3OcLVtqgsJwJ8o+PEFMm5S7oU2w0MTIIqdnqiiUv9FIABYtb4RCkrVXnkMVWWbTNjM31
         Q8Aw==
X-Forwarded-Encrypted: i=1; AHgh+RquXnuDIKtUi0F2I9daTzTLUrKtaSNISOxZ1bqbJa/wm/f0RBmVKYr8IXGqi3nPPIYadtVyE+CUyYft65WK@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0/+Ds6RP6+AGiR5Lokvx+LyE3i+XXMwZWH0qp+Ox3Hl/gRbF
	mtpi9m6q1PD48xmVDJz4yEsB7OBI3ySAP0D9cBl8czWqmDBPBCz6ipI7
X-Gm-Gg: AR+sD11W2RmMRQmcxxcy8CEfkWDvw34sKY1/8Y1q7fKaVk7vjcSMpiOCa7huxx8/lYQ
	MVqg3N/LM0x6y3uH0K+JgeLI6rZ4nAi1hUwY1X/8R3raclPNXiytQUMTFyVa/h6VG/rbtTLgxdq
	AXprJuH7cTgNvlkj6epvUCIu41P3xqZIIhSoV2bCRfWGmCtQwH6wgBZ5/0EpJiD7NHV1zeM8XN4
	JkfuoAkEbfvTLfFQaWEHXYt4ndUAXa4/kwWiHk2ROrd6eJAovk53tNePGRBwmK9Txb0hYfeRWLZ
	TDPDS5Yb9IdIas+Ry2ezhNf34h9hNVe6f2G+63qcUxz6qsoOKKkhbA4ovprdMJdm9IY2DYlccFG
	ROol/Ev97ylKT7rnaTmihaOngO3o44MuI7u81cy/enxT6TYOI/a4Ueom6IthOzxW+kj6u4Co8mc
	M7F5gpHTZSySkH1uGX4BsgxvP7kcLi
X-Received: by 2002:a53:b641:0:b0:667:a284:2280 with SMTP id 956f58d0204a3-668a4c48cc7mr195500d50.31.1784769864231;
        Wed, 22 Jul 2026 18:24:24 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:23 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 2/2] clk: qcom: smd-rpm: add MSM8920 support
Date: Wed, 22 Jul 2026 18:24:15 -0700
Message-ID: <20260723012415.48288-3-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012415.48288-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds an
IPA (IP Accelerator) block. Add an msm8920 RPM clock table mirroring
msm8917's plus the IPA and IPA_A clocks, and register the
"qcom,rpmcc-msm8920" compatible.

Split out from the combined MSM8920 change so the shared clk-smd-rpm
driver can be reviewed and land via linux-arm-msm independently of the
device tree, as requested in review.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split rpmcc out of the SoC dtsi commit for upstream-first review]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0b624ed4715c..587d288b8f9e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -667,6 +667,36 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
 	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
 };
 
+static struct clk_smd_rpm *msm8920_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_BIMC_GPU_CLK]		= &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK]	= &clk_smd_rpm_bimc_gpu_a_clk,
+	[RPM_SMD_IPA_CLK]		= &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK]		= &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8920 = {
+	.clks = msm8920_clks,
+	.num_clks = ARRAY_SIZE(msm8920_clks),
+	.icc_clks = bimc_pcnoc_snoc_smmnoc_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
+};
+
 static struct clk_smd_rpm *msm8936_clks[] = {
 	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
@@ -1300,6 +1330,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
+	{ .compatible = "qcom,rpmcc-msm8920", .data = &rpm_clk_msm8920 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8937", .data = &rpm_clk_msm8937 },
 	{ .compatible = "qcom,rpmcc-msm8940", .data = &rpm_clk_msm8940 },
-- 
2.53.0

