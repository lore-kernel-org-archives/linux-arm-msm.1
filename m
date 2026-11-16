Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807268;
	b=UbFFkSJ/DGoLODxhk/Z36AfCKwrtDlAtddnLS166kEjJSkajC06YCxs+GQQF5j5oAY52
	 vly6lM13SNHfCjS1uf77PG433AZkRvVellwbeTqkHYsloStwHzKlIOHGxjCPzrUDScw+8
	 b7X+6fzWqV9VkjJTdSG5nZfJxPz2npdf3pqWLGD0+6dn7bU/TLmDLU0vxRgZ+GAJPV+vR
	 rvwIwe6LlWHwYwjTdUtwXuScQ6u7iJ2ivIuPwEjl62MxQ5ki2yKvLiOeb81aw6zX6MnSx
	 K/dk3bytwrgo26l1PLpyYioidWI5Ue/2ntBVTe/Qoentk2VK6gCIOQOoZoVz/AAFFvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2fL6zbaASk684qx6VKumcp/fIHqrXs9oL5KQ1XlMF/s=;
	b=uk/FDhqL1Q5R7QvsHRzO0aV8V0MH4lWt9kNpMFHedtYFzZ4u2FZOutduRH2BrFlVj9np
	 QhK2EWh2OnLQbd3zD59xMmQKoNES38ixREuTS07/XQ+/Krm6eoGPrj3L8JL9aHRRQxJy4
	 FfFovAwmfCWoiPaZStK2zDdRhLAw1oE8u5h8FHtpCBTI50wdAw9e53MIFEGMwsM39SmPP
	 vaPsAwef6gNY5kXElKTpQRMyAcnP+aeHAGTOm/Q7/CCh1G/BWZCvh0fyPmZNBMG6G4D78
	 /XRlOjf/vzhdMkgpa3x8fRKYdarQ66eNdOPf5RoRyl1dMJ4tX5psnJO8Wk/cj+FOinw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuMpofNt;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AB606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792AB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuMpofNt
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so4104860c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807268; x=1795412068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fL6zbaASk684qx6VKumcp/fIHqrXs9oL5KQ1XlMF/s=;
        b=FuMpofNtUp+eiRfRkKbt6dnoH12nORN94fUQ5/v2aVBAtnHLnDtgUMPJtudVJaSZjn
         bsEHMxEXQhkaQX5b0T7whLiKqR6rKvJ60HVT7x+V9xKDk+T3dePfhz5YqeTDkOzQN3E5
         bLCEr44FgTk9taMzhVCNThsC467LYVaHy5rFQK2qrKlYVcOZGl7OYVgOyEEgsLbrXntk
         Hrufw0vbYvHt8HVcr7HoYYD7goFTIoyERvIPpe5wzA4kSokxtCYVs0PhKl+oGx6dVd3K
         riaT5MTwj/5WQ0aNMZuJx+bni+nzuDtAyxoqLGocgNYe/UbDrVi4mlTaSpPH1PY338+o
         Qc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807268; x=1795412068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fL6zbaASk684qx6VKumcp/fIHqrXs9oL5KQ1XlMF/s=;
        b=aKsat87ckzO1qcysb377NpOoSCZ79b+C3JyLh2GdSB+1IVpa8pZwN8TghihO2A1fiL
         jH7rtDaL5i2auasxB/9cfO/fgdvPR8B8LjZ6ZX+i5cVBQZgMmK//NOTAzkEuUWwHMn/3
         qLq4xWs98O5q/H9jjkLSPkwVYHiZ3SLS6kVDsh0uJr+SwjRYVNPr8aL7wndH3YXa5veV
         I2CotE0xZJX/s0msUSAuzBmdvYWgKA3AdV1/VTQLOd/YdNfGXQizkEVHMdTzNE/xJ3UM
         3Tn5v/kBAn9950cNmjryXEgz1J3z891D4K7xzkTSuCI3+n2qf2YKLyTxzFwZUGYw9/Zt
         1+hA==
X-Gm-Message-State: APuU4Z8KoQKnzB6RjJi49aTKkVAA7Z3TXELIOs8iBZPOX0HL7+LBU8UX
	xywZMn72MsxkFmLadyet0NWsl3j3h1K47y2Ab3lnRZ6XUPz6b1/jqLyI
X-Gm-Gg: AYBFou1OOYd/fYnPhGtuISF6n9FoTCbrXfUqGcGiqvL/9f8pwWvlmEUWaT4RJscVjhY
	05fv17h15UeOlMkldJEu3ZDeJDY2SIC3tPzFb1QA/BgQbBLCQHqQnTRtby57PstOH0YGfATpFFB
	n2Wfbign0FiA3Fdi4dk5oeu6pktgoNeORTi41aP/jArgg1XLynucSWMhPFmGbDAUU2s74WTRG6T
	kvQUenCQeEC2zgESG3OcqB3xbzWRjzxl07lfrgbXwaiEl8BJbGIzETHlZ22bz82KmRzkSRfRLeB
	qo1smeXiFdXnRRjvolKujr2hhwztoGSGLJnVA+ebROVxvUaurexaMqkzlrVSdONfY6ubLZJPzuI
	EhaaTo2JKN3GD1KRt7UuCHkr/VI1G4Wrh7K0bNL7HExAoGo1g7DV+MoWy87u9CAU26XaOID9BzE
	ICPPz5Pao4pjNHU1R9n1cO+o8vNez240IQJQyeHQAdGz6nv7mJRSpPpBiGa1G9RBjCddqHUlxTz
	ZVdq2mNWc82xs3q+//N+R6E2FMtCRxJmG7s+YdpVAhOAqBH5yYqT4IhmqSKB+REITOJOlnkPQM0
	+2knAVwyESrQUb37+9pMZv7ikFyDSlBcZZcXdjExKQM5/kacSe6gmVEPw8tcjWD+hJO3nobcOyw
	V3Yc8
X-Received: by 2002:a05:701b:4516:20b0:19a:e0eb:6916 with SMTP id a92af1059eb24-1b50310592amr8163491c88.42.1794807267615;
        Sun, 15 Nov 2026 21:34:27 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:27 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:47 +0000
Subject: [PATCH v15 3/8] thermal/qcom/lmh: Switch to match data for SoC
 CPU-to-node mappings
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
Message-Id: <20261116-sm7250-v15-3-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807228; l=4188;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=bZHb2T2DvlEG6nhD1/DLPHwdE/GdBSsox2cJaGJ4pKw=;
 b=kw22MPin7eMqG9dZ6eGd+PAQWS7wBeVL7HKcVaAUHWuZI4BHDoRXntvUpOH9ep83HfeSukHdZ
 zHEJTs+uq+SDBTgqqBkCApBX/iJ6UYR+y4c4wAuSNmewqsgaKjue24/
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

lmh_probe() hardcodes the mapping of logical CPU IDs to LMh
hardware cluster node IDs: CPU 0 maps to LMH_CLUSTER0_NODE_ID, and CPU 4
maps to LMH_CLUSTER1_NODE_ID.

This assumption only holds true for 4+4 big.LITTLE architectures like
SDM845 and SM8150. On platforms with asymmetric cluster layouts, such as
the 6+2 topology on SM7250 where the big cluster starts at logical CPU 6,
lmh_probe() fails with -EINVAL. Consequently, the second LMh node does
not register its interrupt domain, which in turn causes dependent drivers
like qcom-cpufreq-hw to fail or indefinitely defer probing via fw_devlink.

Address this by introducing a SoC descriptor structure (struct qcom_lmh_soc_data)
and an explicit mapping table (struct qcom_lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 63 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 6bfe25021..9d66d75d8 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,53 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct lmh_soc_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct lmh_soc_data {
+	uintptr_t flags;
+	const struct lmh_soc_map *map;
+	size_t num_nodes;
+};
+
+static const struct lmh_soc_map sdm845_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct lmh_soc_data sdm845_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct lmh_soc_data sm8150_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+};
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct lmh_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
 	unsigned int enable_alg;
+	bool found = false;
 	u32 node_id;
+	int i;
 
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data)
+		return -EINVAL;
+
 	lmh_data = devm_kzalloc_obj(dev, *lmh_data);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +173,23 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+	for (i = 0; i < soc_data->num_nodes; i++) {
+		if (cpu_id == soc_data->map[i].cpu_id) {
+			node_id = soc_data->map[i].node_id;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_err(dev, "Wrong CPU id %d associated with LMh node\n", cpu_id);
 		return -EINVAL;
 	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
+	enable_alg = soc_data->flags;
 
 	if (enable_alg) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
@@ -231,9 +264,9 @@ static int lmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);

-- 
2.43.0

