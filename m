Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978191;
	b=3yZmcaXFvetr7RxsK3BQ0j20oXSh+FB0+FchgGnNs3w/KRhTXOPYZRRQQ1W2B2n4F8Th
	 I9HsWasNpNGORLBnVStLfvflzY519J72uZn2Ih655npOX4PGhQO/+JNx6TF+ccLwlcWzy
	 3AyW/camNs2mO3CCJ0iTWA2UPDnbJY/2nMc4mI2eb2kOzvEGZfmIzr2g6bymkbnawATQQ
	 GFFwIJ8o9vuWObLfM8EwU2ylTuPh0ST2oDdWaNnu0fimxmKbV/iRBVO3o9PJRLik6/20A
	 oN0YoWRZubJgRBJpulRw5E2U0+WwQwCHFiZp7U9aupGSeOG1x4rDNyu1OAYLluad+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
	b=heoAPdIqSAzcf5px0Q4ztwGHBiSx0yO6IpuD25j4kUySh8XzX5IY3g4IT7C3bUsuoOvb
	 YkHBJzTt+jyiJZJFXIKn2n30q+pSwsd1k533gHY5b6oRfPOS0rGbTP2ZlxAcxhVDURCXe
	 5iyNCitn0INMHvXEWlq6WJ58IeKNNMuiNI8muPOQVrYG7xGhkumguCKimpvW8ihNvI672
	 PAAkqzREOgubZbGIxNETyeVnMgEdUMxt6JrfB3iKXRcfsEsQNMDqoj8TJ2oI/i1wVp8Sk
	 8O1rUbSVoLb5gc4dHkBKguSjo/1Ih9wYfRtiwkrlShgEHP7/lR1lnnxxQNFaafNePmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Riby8XDZ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC7606A335
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EC7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Riby8XDZ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f6295304dso749369eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978191; x=1794582991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
        b=Riby8XDZUTN02uc/x9DJZfVAfRQr6pCTMR5vFi++YFyvACzYFpuB5EVSvKmLrQmfU9
         IvIdoBiCEs4D5uleEK/RTAHVUuEm3gRV4uJz6B7/PV9s0ID6uGhIMrCVXF8V4gFOtjO4
         f6M0f41iv83Z54xLxCqNpozHmggUdLdoFqxBWCKx3WKs94HIwGdnvNGtHl8EkZSaDIut
         BfppfqeP15iUrTpTJvB59zzliR5CWR3yU+x3uTz4d2jpKxqIWLz23nGl0VwIbtiO226h
         QrWpFKPew3F4m7gyJWHXCD1+nTl/1e247sdivEqe/Q9ZCgHyWT2G1jsg0X4dLhGuR7m+
         VKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978191; x=1794582991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
        b=kEfVrBnksR2X/jJOaFZjrpwuaxyNQAuIZd98kcX0jVJKbv/z1+tJ6A5GClCO+a++fa
         +uga9aWo1tvlNYWcOA9YDgUJVZN5M+xtdWPGd8xYxTfkwtB5j//0kprQ2nI5DzKHpPJK
         IHgAiuNjF7fIp9lLn9RpsUHzgbribdN2UJhZmFWixVEHNskOAa44DRKcYbwmpmBUL5kv
         Sdmyn7En3+i9v/1X1o2bnphvYbjBx6/Ij2mAVXEG89Hq6Q4qOuUPk7wCsCdoM9Hg+aUz
         WANRUtyEdb3XkBoeQgFrCgh7ogBKO1ClqTigMKY3/1OOiEYFezEy0PPuXoFX2GApEFRO
         lr7w==
X-Gm-Message-State: APuU4Z/zeh9VN0r3H1aKuBlOoIIOJbTcDE1mBfu6mdqgFk229NCdxgxh
	DoixRifRFq0UmNxstQcgDqw/h/NPvF+KwQBj69vc0CMK6fKo8lI81ORk
X-Gm-Gg: AYBFou2pvdbTLuhhfacVgqElh8oPReROsCwPr3Ud7dgW+uM9JWMhwTcp5GZgYbB2WHp
	vyM5aSsfDXzc7t3YuGbREp3WCTt8Rk3DOQy7Gao7n9EUUBH0ChmRY+EXcF3EgetRsVIYzRUGbpD
	2IJ7aoJ25fWhV2O+OMYYPoRbRG3ssd+yUY8fUVw234VnaF+wrKVArGb8ium29RzIDUYLD5VDMFR
	VNj/FIg9fugFqN+ZJB946wkCutLvJ74d0HwhDwvXonUORPY5W93wlDnRmFQAOuEJj1bNpELI0kR
	e3W49NDvj0D9hqmB4SwDI3Z8Lly1YnS6do0bZsEhssZw6TWa/4FD7JH+SpJ9ZC86lUu+1nXbyl4
	OPb7Yg/Aac1YkO/NSHOrfANiEpWfVftEg8tjAOOTuwLBCA+MkHaXHM1A1b/KDrq6UzdJdfl5ixQ
	a/lbgjn+X/Osg8Q50NLcgyVTGqNd36tln8fkc/8mB193UEx+ITpbd2PydoCFoYv0Wnmfqdx8EvO
	j8+PEkbfc8UKcvsrZHeRRRyEdToKFH2PBjVofqot+bJyRZ1QSx2IVoMJcQrBpbnGFfom1VBWz+q
	r5NHIC3VqPvIaZXVOWNOALRBGmgrDpePLV2Rtziey1fKc99Jg8GAddEDs+p94SQ0j2TQgT50UYS
	aeIRPyhnuad+c32eqGkYTLMjAvXXC
X-Received: by 2002:a05:7300:b0aa:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-36f7691a412mr3600161eec.30.1793978185868;
        Fri, 06 Nov 2026 07:16:25 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:24 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:38 +0000
Subject: [PATCH v14 3/8] thermal/qcom/lmh: Switch to match data for SoC
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
Message-Id: <20261106-sm7250-v14-3-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=4409;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=nwH0k71RDFHMH21LAx9GvawuLoxMvflAeMTqII5xMG4=;
 b=9GEg6sCjo+Fw5z+URS3OWyPStxL54iUQB9zxVL+ED7z7plk4poxuPjsJg0fe2SUj1WrtGGXPB
 evpAQlKueAoDYKBDSbEHFGkU8bbJI8v1oalpbyXhlQL0bxSilhSdRJS
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
index 99396b93e..e160ac477 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
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
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
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

