Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F354E56F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554616; cv=none; b=aazx4tbjfXOYlUWFJjMvGTEfI1mkC9TMdICyTYwMnjYysl1FZhhFLSnPREM7flU7FYe16hq9SPcpJRne5SP85YGWIYgPDaFRveismWLe5gpR4PkwcjV0oaKsjjqnIVXOoe97V5lKoRsX/lUukRSCIrNWZXxW8pCpfQLK1njLwxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554616; c=relaxed/simple;
	bh=iXUNYaH4A1wy07zs/nnJgB8Uf+MSyhMYIfjrKnWdaUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okFqmr3Q7K+aqpG5l8WmdwcqOaG97KbwkDXy0oEXFo1i5Xt7tesgAAUDyBigrdbKeqcz439uJGBbEP95bpGTdYhn2hvlYdtBcgjLykvc3OJo2BL4qf1GR7BII2QJeCjQCaBOsEEZG62WGhhDc9OpS8JSXKlpPw9JRKqSUpROHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE1YX2FG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kun6Tk+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE1YX2FG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kun6Tk+/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934IM2226506
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=; b=eE1YX2FGLQEW+594
	yxtfQMNy274bTYynCJODx9VnptHd4/PkGXlWvRhf0KJRVVHQM4pj7uaI3u7KrWml
	0V41qNJ4CGNbtiV6o4hTrdFTLBM7MmsXF8OWGU/HpHuDQLcz6oJWLLb8PB6xOFjU
	grakThKaMnz4NkgCH3Ava5wJnqx6xylghZapsvSneuLAOuVsarJMeJ5gZ+t1pM4J
	Bn5vnewgcY75PDcJ0qSS5+O+smBIxbZ/vDk4VTdT+QIhE+rAqpV0CR0vc6GivcMO
	c2trmUcX4my0fWL/cJrZ9mwVk/mSMs2J25uxEGEuu02UCCBfVPpt9//r67ebDX2q
	ucjYJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f925ba4eso19934785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554589; x=1790159389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=;
        b=kun6Tk+//vWtZQvObDFhYs0AqJfHVNfdq3gn2eoNaClALZp8xVP5LDpQfGUq5+3G1g
         uiggELYVYKa/EEC+gSDA7pXv7uU6b8lfFCO8fqqBrg1HLjagdI6XOB8uTCO5h4I4+BBC
         So0wegoF2PvjObACwjkD5aBSJXqcCBEsn65htqAE1A7OgdPSAdr2ht6Gy9n+/X7/Io/n
         bQpLYRf+7qGMfIldx2dXjwP02ClEPWauQrXkw72DyBcYnqJxJPApW7C/gX3gqm828x6I
         FadyGARPt0etiQr6AyrR5qITBFVtBIYYGDvr+GKiNCPfKj1kf9fU8uJz0StiATB3o9OJ
         L67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554589; x=1790159389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=;
        b=vPeCtC070K7Mo+XyRgBlnpLn/Mm2EaxEr9zf4rILN5B+oYFfnUIeJwmzD7uiufxZYf
         IjtCMdTqx5y1H3lqpU6cwKYm9G0v86PqHwprGdtrM8ThosIJJ3380rwtkZ1otdqLlPA/
         ARWIT9JZNjQVIZCtsl+q2dLhShxijJlernrwTJQSt+sgUJZtI2VKK2BOyd/aoLJK8NrA
         TFk27msssvqPh+PN1JheBc5Ka6KumYMXjzAB6iGM0jkwMWRHOQCfvs8xC+VJabdrbXvp
         65lIuRfuQ2+7654KjX1dNcI2aV8Xk0fz7TCYR+9XfKrrtC/FQmJqyhMMweDy619Zyzed
         rDIA==
X-Gm-Message-State: AFuF++lqsRIabD5wAHyAcW2Hn8FUaU5fm18EqNgjH20rV4K8dYU2BK3o
	uIlzbOxsEJcssWWdvFREWf0FX2bYfYVGh0iMrGkziLnppvwmQyWA0RPhi/+Xb8DE97YnCxc2609
	glGYx1Z+MNfgeU7Q6iysSFH6fVQwQLr0CERrPNZDCSW4/eQLnEgZFy9+KOcIpHBtVUQid
X-Gm-Gg: AYBFou3vyep5aJSAJJhM3rtk68sscIbfCZ0YWq6AYG1cfOJjIjM1LtowLTCOiNItje7
	2D+WA0eW/z2PXW9XOXFp460W0Ff4567yot2246s5Vr6Zlj2kjFIJ2AW8WCbCRu1vhrHXRjWkL9/
	0a1QNL7Gl1tV2+xmNXlAB+0ykBUbD9smx89NZkcs3CFpszPh3KAsNO0ooLSoVNCWMv7ZNJyTa1B
	XCXFNTN327aMbKggZ9V6WreHkgW/dGIJLx4X/oDMaCVvetwwZe0SEaQUky7I/oYgLMy+Fy8iRue
	XiQW5uKRrzQ5E3XAqwkE0Ol0gPu/ZMwOE6djQ7GXfWnIiPfpGOVdnTaEd4GGyEHxpicoMmQB9Gg
	QKqlKZwk=
X-Received: by 2002:a05:620a:648d:b0:92e:45e4:c6e with SMTP id af79cd13be357-93bb774e0c1mr329148685a.22.1789554589521;
        Wed, 16 Sep 2026 03:29:49 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:92e:45e4:c6e with SMTP id af79cd13be357-93bb774e0c1mr329143985a.22.1789554589028;
        Wed, 16 Sep 2026 03:29:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:33 +0300
Subject: [PATCH 17/48] clk: qcom: gcc-qcs8300: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-17-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iXUNYaH4A1wy07zs/nnJgB8Uf+MSyhMYIfjrKnWdaUg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9bHdyf1pQUsGFGKbe1NTNuuW3GVZnsugBB7
 RZUqtuQoSCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWwAKCRAbX0TJAJUV
 VnRFD/9aAyvenpt39gBdAL77al9ea8VCCnd3ONwZM5yjLEym2+QbuiTgYvTjXA8YOfecjxrxkBY
 /1hQuii2CfuX+PAshuqvOiYyCKVt3kpwvUG5GWmymi2rdHBuZsm+SES1WsGmV/3bzC+cheXt6bd
 psvfnHAKjct2pg4PfSQpn12iW4oUtBydRdfk4SymVimdcmYXx6mxz9ApdVDyHIsDgV5bjv83DJh
 VBd4f7/wLQH+vcVpnbfiCQ/UESNmRVwlVrEECvtnWsbDMDCGEXup05HeIp1/oWJzecnqUHe4ayC
 kw0ZEps6TcoWtKpvONdoEBfNePeO8kcXPh23wBKb/22pzaIjCOycRgEjfBM1g+S7Qn0Uu4Xy3p8
 bWbzOW98DgsCrln4CBewz4N8D+zAf2644yaO2Qfo91KiKiJ5RORhjMk0mUSIYojZbvatvaIALz6
 uiG40LvQDbYdpg3qATh2tEA/A10SuRP+uh6i6sd+/YPI81Sbdke5XLNqRzTvhr5hPOdqyu6pZP8
 30wiI2aCq+uWagX0xpObGZ+mGwUOeILUz119yHn7dv5mddruJC8+WjUbjIucW1oMNaKG3F3CMoM
 WujGWdQiXYmvcKS2aLrZ2sjcq2ie2A+CClFNf0dqBf7FkrmsubsRIVGkwqVCZdhGPauZxqsCPjq
 A1Z/BvjKFpjtRsg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f9e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BUBuu6iD-0flK26thyTNZgd4D4yrewWb
X-Proofpoint-GUID: BUBuu6iD-0flK26thyTNZgd4D4yrewWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3/yY945MtdlC
 p/KFiRGyBcUAnU4sABHGcDPYzULlyYcht9vASE6Nwoci67TitTpV9fNAPBCwDKUnii4l6BK6XH6
 lUYcApxRo/l6T3a1SGXjTwbfvo8AU9hPG3oZiFJvrGv+ENt9rX0vLzu2V2bamz3U4z50Ld7wAo1
 C1bl+2KEwkylzQ+Dy9AOBeK7FCPDZB+sbTW5GrV3ZxaE/I8tiG9efT3JuXhvUcFwxIzKva2bsQU
 b4Klc6X+EkAqaKOIxuO7TUrKdICN+soQrxBYuNGj9ZpGC/Z9lrt03X/v1o54fHIi2ZND5wHkDEe
 7jBSnt6m3juE/JAMeRDrmd9lT+Fc4o2Q+qytEGjfZE5UcvM8H0m7Br158hdMg+otuDiVjVLe5sX
 pv2msGhb9BKHfoXRI+UJshPG2gDz1N2Nixry7hUnReeOOxYkdxZSDnnaNl/I7JMguNG2lM3heQ6
 jY6qStFwAtyWyIccJ6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4kmZLzpD+Jjj
 wezSZPcWxZPoBaQDKFlG+CklMpmh1fbtsslMaqDwFMkqo3ZWlzh/AuB/VI22CQrby3CSMV1rgbY
 3GLI5dmEdDPwX4BrTtlcDpGqFohYnGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 51 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..1d2976aedc51 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3673,7 +3673,32 @@ static const struct regmap_config gcc_qcs8300_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_qcs8300_critical_cbcrs[] = {
+	0x32004, /* GCC_CAMERA_AHB_CLK */
+	0x32020, /* GCC_CAMERA_XO_CLK */
+	0x33004, /* GCC_DISP_AHB_CLK */
+	0x33018, /* GCC_DISP_XO_CLK */
+	0x7d004, /* GCC_GPU_CFG_AHB_CLK */
+	0x34004, /* GCC_VIDEO_AHB_CLK */
+	0x34024, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_qcs8300_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_qcs8300_driver_data = {
+	.clk_cbcrs = gcc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcs8300_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_qcs8300_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_qcs8300_desc = {
+	.driver_data = &gcc_qcs8300_driver_data,
 	.config = &gcc_qcs8300_regmap_config,
 	.clks = gcc_qcs8300_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs8300_clocks),
@@ -3691,31 +3716,7 @@ MODULE_DEVICE_TABLE(of, gcc_qcs8300_match_table);
 
 static int gcc_qcs8300_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_qcs8300_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_qcs8300_desc);
 }
 
 static struct platform_driver gcc_qcs8300_driver = {

-- 
2.54.0

