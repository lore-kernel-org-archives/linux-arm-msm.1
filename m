Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810837;
	b=PKZfffGz7Yq0rZZyyJQEYdPGSH8TNXWYO9suLCSU0YmhQRMFuE9Lna0/UQrQxS/XF4aX
	 MJCL4CvIxwmDhaAu2c3Bj4b1JAkak32Rb4ZKfx0tOgnwthn0/v99HS3MCc+wq/XxShxfz
	 NoIZBUud6P+6tNGgopnEJJtYxQNEopuVksvBdvaMbDTbKnBy4T4TG+EHiRS/biHRSnaNP
	 Glf8qDeEgFJOolL95LJWevhLoA8pcuOfgHMgt48NnsNMSeKUiL3PQF+z/yyqrndzM926W
	 X5nnh5RTmEjND1CQBKDBYoAdDrc4DkrDqbNPY1LhvZL/CwgREAuSGBp2Hx7TJ1G8/Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
	b=awStqY3SHUCB3U1U6EtgOSBNRrv6sRiRi79YXd102Ih7x07q194TzgN+/D1xItLo6qqC
	 xJN5T+AHFuQ1jcKx0ukzo/J36lSPrcdzdk9BV7Ulr3/Ati9bO7fM1wPGGV1W4kbYifuuS
	 5ZksNn8Wetn2UE/ct7EqmP/g9URKT96+Z9HCZZQOO+8JkbfmtkqoLaNmqw9Vk8iVZnofW
	 x6lzxEH3VParCX4JX/CovwWqNDN1Oxefe/UD5hndR/RlLSOlHtpfb8KNRppRXFfVAGe7I
	 C7OZVehsGhHVvlDmQYA7gws96YXJkLmcvwpitv655YWuSk9U6Jh+fYxLrpDM9pzbkHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682D6082BDC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0682D6082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso1297991c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810836; x=1794415636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=Ii+JEp8NcqQOExZCbNy1Q72rEE2d82j/6uqSwHBPOZM5MI/gsmkc8VVqk1azPShaNG
         cuXcwE/gD7VDumYMltfWPvWHst7fCWcVmipbhzGgDXh2GVypSyrp2k4O4b60Q9NV0k4A
         V4nlC/+2OnNcoSoToNxDcBGgJO/yheVFxBcJffRm8mbY+w40ZrnsyPrlRkDIPQbrd8IB
         I1BPtTsMlJ2HCIfeVSTs6wIyZewYdjeB4c6A7RaJesYBkyD4WCMbvuLbnaCBfI6DsK3J
         JnOvcFw6haiXJnCW/3so2voL5cDhoekP/pgDJsqYqnmMcc/aSL8qtr+xd3hq5dPW19uo
         6UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810836; x=1794415636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=j1m/ltKk0np7CzerTzuDr1FDSuxEbJI0h39XuVUX0HnPOYbL3jCNv6Re5jwzpohrpy
         P/EjgfFNTLobw93zqstNSpUyyAaEXeB3qum9rsWXcqvprhI0Um31ngWm2vkbQIhQ7OOT
         s8vPb2hJMOC8cC8b+Y+hYehIaqro3qlJyCHlLOxpcCSM1oW2yvz5zfRQ1er/+r3ivCaP
         e8ZfZBy5VtLZlNzhEotC9n9hvEYhU9ynHh+tHr9Ux3Zc/IrwFPqstZxS8KfBSalbLHN3
         /datGEtsPINLR4d+tEcYqbbfOqPxd4FAqbVeAJ5pIKZyN7JcM/VY9Z+IXuCNKG6oBGv9
         dQvA==
X-Gm-Message-State: APuU4Z/wuIhiT4dIU5Bvyb8xc0EPOrKRN0wUgyofEq9GDaYflvvkpGmA
	455SkCNwcMi/cl2JCwa35KA3cS9vNdiEcj3DalItC/5YSS+pe2NH8Tc3
X-Gm-Gg: AYBFou0CifQRNuVVJJ0jTczhurWbrcOnqvbm2f5xLjMKxb83F2+XKpN6/MSQKP7DsFv
	0lNM9vgcSZL7p3CVDmJSkRWC2crgoxlLC06mHC5Sxx0WkkguUrEWri5t73KcY/D8lrCb7oHwK2F
	RXLGFphQnl1MkbA4f4j7EurJN4Kck0h96ss/KomrLhQgVxvVzlA9Cvn9uwWovjOdvEVWWWdd7Ad
	HKw3tR6/uGUQ76PdEQOvKKNjYVEpqEgfLF4E65+yF0YGDfNu7e2S1MGxxq9kxlqi5cS6tJemHq6
	dXG+o8jFM59q759fgVjF0Jkmn0vavGgpT9a/A3YOdyx/ihR4cVRnGbH940SDxCu0cvBNBzHYxFr
	mvHuzHHWnhx8Mct6lTnPi3VyIrYHV/Sxhl+oaLyuUgTmIKYRsAorJJM0h88VfmP87uz0Cm4Bdif
	1d2ZrVvWZ396C7iLMV/JBZXKRXq0siQZ3raR6KOpNqBYwnh7uYlVrbLMSEcg6GEs5BnqAoAJn4a
	u1WvGkm8mEVPZDscFeF8fOOAYEZ01Wi8kch2b8XQLy2xuucaRaaEl7RgwEk8K+PfWcF9ZCz33iW
	Q7B6ahP5JAe1xyHboWOLP6FF23zywx0p8bxQ9ZoSvaLxQFVEdYHdxPh5YRFB2Z7YkweL1wpaTUK
	FxTExIqE=
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr23701286c88.33.1793810835903;
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:35 +0000
Subject: [PATCH v13 3/8] thermal/drivers/qcom/lmh: Switch to match data for
 SoC CPU-to-node mappings
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
Message-Id: <20261104-master-v13-3-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=4488;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VU3SQSKgFReF5BiO2cKpUAobqELNHDdICbyBD7TlHBc=;
 b=zEQCRQG3leyhQotPeA5MCZh/7vfckyMF2IzU+0IxPHpx8ud6vbLpA0+Et2DgDiTWDZbxXhkrL
 j/JgrQU0zoCDYa1IoTh9tAQDpIItm9Dg7NXu4XbjUYF5XSuUW4NhvDj
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
 drivers/thermal/qcom/lmh.c | 73 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 99396b93e..ef49ed1c6 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct qcom_lmh_node_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct qcom_lmh_soc_data {
+	uintptr_t flags;
+	const struct qcom_lmh_node_map *map;
+	size_t num_nodes;
+};
+
+static const struct qcom_lmh_node_map sdm845_lmh_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct qcom_lmh_soc_data sdm845_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct qcom_lmh_soc_data sm8150_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+};
+
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm8150-lmh",  .data = &sm8150_lmh_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct qcom_lmh_soc_data *soc_data;
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
 	lmh_data = devm_kzalloc(dev, sizeof(*lmh_data), GFP_KERNEL);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +181,23 @@ static int lmh_probe(struct platform_device *pdev)
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
@@ -230,14 +271,6 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, lmh_table);
-
 static struct platform_driver lmh_driver = {
 	.probe = lmh_probe,
 	.driver = {

-- 
2.43.0

