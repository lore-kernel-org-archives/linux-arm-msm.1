Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542E247F78C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251685; cv=none; b=NbvXhiH5BFERdS0RmvRJdfBOOpnJsK98TWw3hR2KLPx45R+TFlFdZuo+fSCT/ZUqsQxZ0c9YI3FkLl8lzL4dqwLE3iXGdVRv5UWg7xg5PS4j0DqlEbRlFOXs6GIxaFruFiVl2HwlLh8ebdn2cH2GmieW7uUf2GhFPS6zZ8kZ7GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251685; c=relaxed/simple;
	bh=CQXJofXOmMw3cH+dS3fdFOgmgQjockpxZA9akNR6TvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y87Baqbe6qJdeaw0/Nnjh5IQi6cuN8kKABPhaScuAOmQkG77Qg6bZ82wB5zSJrQz9tzRI07VPO8pk2cVrQvn6eYQWw6LIyCyv33e8KcqBtSjr9+E/A122R5hJcP/veTT94WcAoYuK0bLY/9sH5uiiqv88aIxiOVxYl620ec5f50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCJZGym9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp9JcKti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCJZGym9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp9JcKti"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4k1N1429861
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=; b=bCJZGym9ZJXX8NO0
	9JoZJHuapsmSf0516wZ+cQSu1ltEH4yVVTEpzfCYAKhrpXMv7e6IxgsmsDFRO5Ya
	z0MgOG3TbmmOnCs31sowgwP2QVQM5R0wUyHc+QJfz0LfEaObcE9bIm/hEqR0lswE
	r6RXKBQJE2w09JcP4ROezVELTYbEjOBwvAxZitBkndMUsgr5xkiXRmrhy7Iyr/6W
	dN1YeyjMHY3tE2ErtrYQzTVwFtVkhNQB+8drZW4jI4sMgxdXAycBK/xJO8BMU+Pt
	R2bVCwB0W6rYMrnGAPGA78DHYSsRs84chYiL5cRsMZ5JKcP6iU/T9ksypB5GIxA8
	LLmGBw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9vgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso744671e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251678; x=1790856478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=;
        b=hp9JcKtiQuclGs+oeGhubfjJptWNVY5XPFqVAAC1qdFr8Dr2YAKaM+cpL13DUuuJX0
         wDQwYeOA3FhZPaeYBu/UkGGsfwXAQLTKE43xnP/LT5dQkzYMEvKZNsrBEjLEmhEvSqvW
         17AMo3S6swejmuNmWQbu6dpCCUVkn25i5cti9W1bZukSc0sPqnc6soWFFfwC9761FChq
         NawsNqu5uRkBpTQQNYP2xXJgXrUrSCsXkq+qcQVm1UTg8flH19HSLIl/194o5Nas+QwT
         y361ZkdBBqlRj6mPn19EnwO1V0WsA2kANUriWwYLMgHJLfMMwj2slkuShCvIpblxmO6O
         EJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251678; x=1790856478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=;
        b=S21lc6qMIqTpunWMyoemqeXG2b0VPjJOsR/KMCffGfOg6BxyJhDlAJV2Wl+YZfRkYw
         08HroJaaFEE8R8gWdP9azm5qkEdUlsYv5/vuYxf6/bEfB/nfW9bMtTvSGTiSLET2pkR3
         Krb5Bf9/bLjv+Hj6vzN/UXqpsZQPdlblgSpRrIcYay70heXOXkDaU2xmgyKmdHMWVG0C
         iyWkCVgek4O9In2Kkt828fiVyGEz8Dl3BIsgGuHXF4PnDLtCgYk5w9F83Pe3WHbkJLzz
         xA/30aZiL2VEmkRyonlg/2zxKfVnkkftU6DT6I3KpXeahNVy78Fivok+ctX8QULR9d6o
         1HKQ==
X-Gm-Message-State: AFuF++m1vXEgmhXIcjQcwv8omzxIZL3sb9X3oTGZvKdvSP6Gq+AVfv22
	p5pQNqt8qtAh2WsdHos4jhohFuGN1+GHMusEo5pZjI8Z/Hi0rJewU+NCl1MNQkMG85j8qQx+xGN
	nTQdSgzXPxOmMzCPtdiGg+41h1uOEzTXqLxMzFT5xzfPV6Ronu8Fgt1rQBthvMj5ZZqXU
X-Gm-Gg: AYBFou0TukJaKESjTmK0RtZoijD01lCnAV1noA32oFLp4p4yYKuAK9Ing4rfpRTB5kI
	d54ZtUcPOelQsWzvbaYVXff3TN6vAuS+3yLK4PyENBX7aaQPAhr45ceFaq4d6n2JJ9/E1gwveFU
	JrTrZwy9M8jtsAuTb2SD9aAFsBjn+xtp4Z27YoZslFUcXeZsOMkD/fVsxSgXYLMZUp+170P+/Qr
	yCPVG5jdUdRLAcuG428D4fc6t/a1JFztnbFgLVdrklBMij3tb+n2FVAYYbB0q+6gND0AQEz4AcJ
	pOt23zX5uopcH+NdsUxavfOWslERUmFgxtI4+XxfA1CUZ5JXCIdG4PwH/Z6zbPl+fcqWXE/Ax0K
	Q3Ux31Baw
X-Received: by 2002:a05:6102:3ed1:b0:7a7:79c5:d465 with SMTP id ada2fe7eead31-7af1973816amr1126129137.0.1790251678253;
        Thu, 24 Sep 2026 05:07:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:7a7:79c5:d465 with SMTP id ada2fe7eead31-7af1973816amr1126101137.0.1790251677583;
        Thu, 24 Sep 2026 05:07:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:27 +0300
Subject: [PATCH v2 15/48] clk: qcom: dispcc1-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-15-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CQXJofXOmMw3cH+dS3fdFOgmgQjockpxZA9akNR6TvM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJQy5ONo70EP64WXP3iFcC24rUeNgy+70UOL
 qaUpPGrSEGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUAAKCRAbX0TJAJUV
 Vjy5EACb6acFzFedBqO2kT8nPcKyzUgODZu38TyD0NDJevhgdbIuqkwqWTsRBpSJbbKbmF2jkGA
 cZVK/EPsR4QaA/CivWCyeCPCyFIpvmQH4itELw/QqI+6eA55K3wVmo192gp7VYw3f7nsKT3M8qI
 0SBVBAddI5ZQg5mV1b5hUd+vDlcqh6hRUfju43B3i6FGmLWbyTMCOtArvQvtMa5FGpvXNxpuJhJ
 HwcmHxkrwtY6zBTwPtToI5U6TRYP+Ipan91+mSbXLvdL6+z/Pa1Qti2rYc7nxfc+y1yGvGZtKYj
 rzDOCwWKb1Yy0veR1UO3h9yVCiCS/Dn4byJwPkyZoNlY0tAPKvR6ap17yHDh0IPo3UdGm78NB6E
 J+k5FTV25IFViabvnjyPgxUw2z7Ppm3TsTLkQkIbsAUl+9GaGGDQzHs8o9YknscNRbjm5Y4fOiN
 wZFi/YE82KOHb1xriI/wMYoR+GKp+fgbd334SKfLbP+1NWhN6ATjYETQpfSFf7SZ6tNyWb5ye8A
 jVH47IxCGLD37G/NQi8IhZ+2uY3+0IgEFehas9iR5STdqWx6tyLfJ1WT8KLAbq9MLTVlxTptKNF
 Tm4bwM/+puWBTVM50wZKJQQJLmFkLvzbAq5wU7wUbN9HH9HHHuSkG6DMidBNLHOJlHN/8KV4+tz
 HMHXJxj6IKo9kvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab5129f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xG6gKK67fXx6DpdPwiUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 2TSoNKshDj1QbcEzYk10GN8bjZlnMKbD
X-Proofpoint-ORIG-GUID: 2TSoNKshDj1QbcEzYk10GN8bjZlnMKbD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/o3OQj7sRHaS
 ySaJ4PTboGrWCGPJHa0fMrhC/TVezfISh3IPDuR+DPljdWVwNdXYPhEO07e8Z2q4J2svMIEM9Im
 iUlSnY4d6/gF5aEPXmx1YuJIaekHc3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX54m/9RhOrRkQ
 2FpTpMKKdmB61VSGIaeasycR/Th6U4TJoXuZBjvvypl6gtNv0kLwxziF15qiDR0Fit5lZQO/7Qe
 ygGYQrLwwSJ8CbZgc2uYKYvk0N3Z3bsOdQR+n6slvkXPblL5YxVva2j+ggcUQQAVjOxM4ambAVL
 vFHQtqRbGDV5v9F2Kxoo0Nd1SAIH7RqmJ5QP723gqwIxMB6SdoRtxrKisvhgXvOgYIH03yOSLiT
 8z050TAfLsYoTJA0oa91ZMwuijkyF6g6CoUwVVOJBye1uU28JRV9uV7kgtg26CpHKLFLAS1PVN/
 dgTgyQmblJp48VobEUSMIAyrYUcPm8dKQvTs+bws2llUEqym0SUAf6ATbWePeUOiqV/Zcqr12CM
 guRP8FzIw3MS0bay9Qr/M2+NEhTUoYhOMU0rQJIZX89ZjfmwOmLGjLHCl6IOOcxW1OfSOXe+ZOu
 2LB1Jgv27jpBkfKcIUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc1-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 58008c1afc76..330d953b5e9e 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_1_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_1_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_1_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_1_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_1_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_1_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_1_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_1_sa8775p_desc = {
+	.driver_data = &disp_cc_1_sa8775p_driver_data,
 	.config = &disp_cc_1_sa8775p_regmap_config,
 	.clks = disp_cc_1_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_1_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_1_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll0, regmap, &mdss_1_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll1, regmap, &mdss_1_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_1_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_1_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_1_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

