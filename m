Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E6147F3DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251696; cv=none; b=TtrSwBZkbTjQ7rTbrLdZvn+opNIqwlU7NGigo17Eb/CyG3Zo+L1TqYObB7D1buKPVDdrAziWCUT5DHYBZOvPMI9XUlYenbZoBbVfPE6B9GBi0hnn/urlcdTX0+ulbL9q3bohQKB8cGca1+lTZqOOIpLPqmMSyf0mJG9sWFZhcsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251696; c=relaxed/simple;
	bh=/w84xb811UCdfbbxRLB1tMb/4lRokzCJN/2N6GCioWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAwlmnfaN1E6D7z7SmxFaYEy0LvIreNYEsos/YHtIsN88SrRM56F4v33WTGm1CdvH03jcMjBjO7YX3PRj8lx+TnHhQwUJuYJTgg8tH9uoKxoJb9E7yRGs22GKXJzM/aZiAU6Qi5vbR5w3lNtmQ53xiBzhPyBleJONw7GwKV1brY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZI7nMF7M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAGT3UCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZI7nMF7M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAGT3UCQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC58b7805072
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWSa5lB3j3mcV9ImYYXYzCgGvPWgSCaRoBUOlJ7hrHM=; b=ZI7nMF7MqtIx468z
	Ux6nv4gOPuuSpCl+Gra12VejnmtcYwLgeIrfSJNB5MLw3T7pGpSgeojsvWLrfDyF
	DTq2m4ke/xCHv+MEsGeoxuRiigYNLLChOAs0sIXZE+eaSnrO5qtlWpNXCBTZnCtZ
	M2wVN2u4bW8+zimOMNhghX8uWuZ0OlXtFg7co3gHTHlxsD3qiXAGbmaq9MZ8o1m7
	gGHIRvQYBvfg1yMMAAjCG9HiGjb7aw/b9eMHc9/4lqLBkrHu2J4EKJfe2+MhfmWt
	vbJ87iFOWepAnbvMqSRBGFSI4J3XKjDWiM4b7MSquY4w4eVwOC5HsIQJ91FBVxcM
	uJj3Lw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8f3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so567859137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251693; x=1790856493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWSa5lB3j3mcV9ImYYXYzCgGvPWgSCaRoBUOlJ7hrHM=;
        b=DAGT3UCQPLTeDwYfZbJfx6ZfieIGI0SNIQ2JKkFD2XeyIyVylTuZ0H8FYTX7MNMBQF
         UlP5scsEVDueLW/FHpl3YAYVFyVvOHmbkhCAbpPn8dCtOaGeTTvwhebsCLeoe1iQXzNK
         qx4Z+dtmG6gGRtiBrF1w+hZnzoO4EAnoNY4UIicc1VnOCDxmE7RCKbR/Uw7bfOAGOAQU
         9F3K6cL/oEBJ0MC9miwK9QHdgMFVeKH3Z6hAVbhlqf47yDIkMsd+fSsOqUQUvM6Snc3I
         PbfKdP1XExQootnp1tPdtj581CHAOz+wsAtugGjnDXY15Drq7ClTacHsfWTIlMwtXN7g
         CIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251693; x=1790856493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWSa5lB3j3mcV9ImYYXYzCgGvPWgSCaRoBUOlJ7hrHM=;
        b=IW6VMRfZtlwAKqh1gfZbmZkOOwjt82BoAbaJgyafPLUchPoAd6mXtvmOsIXdDYZoUI
         +zgeRzXbTkckTMQCUOEtYKeEeE29gb66cku0XV+Fu+zo183xflLauGXSoQM86wUjyPBz
         pEz3gkKsuJx32U/85czF02WBFvS5qK4JTMOqd2AqXe5NgfIQaLqWeOVmBAUECHtGt/v8
         fAdBuHhao7Kxrzu4tN3KhasBhctpQGGQQSh9Lkmb0dd9RtEvQ+km+trAMJa+wVckZOTZ
         2cqcosP1cidM31oeThnOFvya0BT0JU766Y9vQ5zqBvjdRrmgRGUe8Y5y18hrTCxbsT2D
         eo/Q==
X-Gm-Message-State: AFuF++lXGIHfM50IivAMwJksxsIg4XqbnWG+OUfoH1nVcV+n/id4OEa8
	tmoTiBNZsT2YYbnzFuS3ypjRq+QWlTjbhiCgIMPBmoMJDYHf1SPRHiGfc2wFJ6+2M+VWUpvqfR1
	zG8WhEANx2HHdmP3nYu3XhxvzJL/YbiJvdZKTBdju2pKrntaX7aWsfDipEEyR8T3v7DTS
X-Gm-Gg: AYBFou2WkDPoC4I1lYeroHdfh2Lub/GX5QVdCZBUjFyxB36Lhxur05ReZijB2IEYNEg
	KovBndo7kygz3WeXkGf2vtRjy2ylYqEDzEjBJQF+JCNniytb8V0C32jI5kaIFztAcCPSjcFNlpr
	ucBxQ+MezOAOLUoEeiJ8jMlofyU+LhKqU0fE3+krMVsfFpX/0djxWAlVfMktLnvhY3xt+LqCYdT
	dKlC1skJiUVUYN1r2XiTL6h3eKIyUA3JO3OKWj36C7FGCckQ4r3s8wuPujHU0h1n3nu51pjcQvr
	9ZtmoA4ds8yl3/Ru5VdOHnwpJGBanGn97aRuNeCMQrVvDyL2E2IJ3qo0erg6f+dS4DGQje4O7Pp
	iqBt3y0Sj
X-Received: by 2002:a05:6102:3911:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7af1e4e799emr1024520137.22.1790251692513;
        Thu, 24 Sep 2026 05:08:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3911:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7af1e4e799emr1024497137.22.1790251691828;
        Thu, 24 Sep 2026 05:08:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:31 +0300
Subject: [PATCH v2 19/48] clk: qcom: gcc-sar2130p: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-19-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2911;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w84xb811UCdfbbxRLB1tMb/4lRokzCJN/2N6GCioWE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJTU/zZ4BCqOOguIUe32WeglSEcxybbhOZie
 f9cP/zM9cOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUwAKCRAbX0TJAJUV
 VgNiEACTxKAop10Ugh+1QfmTPmkAkJTrM76NCH6Lm/KtiHW8RkCdtN3PiF0U9pWWib4ik8JE7iI
 15OhaTiibzhNwJsjTIS9qkarionaj37U1si5tJeBWNz/U/NsuSfHbK2VsvS/w9aja706/Ndsqk9
 xF65UnAkY5wKh0P/N6ZCQB6MTYU2RuEoyfBkcdk/eStuhrMgu8VLSddKjd2ytrksGMPVQjrjZ2e
 jNEBL/1sBIEvmWDqSL8WD61hB65LZ7uI/BIZ17RsnpPMWT55NtzVtd6WkE7xMLvKhsXAc9ypX07
 haqhuzZX2rbL4sJHL6LoR2NOG0MvqEc5prRtI11wB+CFZMtwIisVpE6ddYsZ4rlD7adRWWQd+Q7
 M3bsNIhcNhv2vesxV5Nm8vxXKdmLWPpxw+B64B6mg6fmDo3+lkqA/PzjGsUAjAVP37S/WIm62GJ
 7/jaEr2WITgHE3UdqD37MyG1qXjQ8ifuZwCkJu+/epdRs95IzCSGaAxgYmTB3CufKjLllbHfvuh
 ZKGrK5uzfUFIRtC9s3s05rxbcAl3fn9kZ/oJRyi39XKCJnLrjluqC50/1wtAu6l77+NV0bXjRT4
 NKdieGFWhfSJ4xru2tHWr/9KvcT1KR/Y4Tj0/3Qx1aRKMmKLyWSAOoq42ht2jxcnHczN0hzjdW5
 4MwP38Fck/tgEVA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9JVB6yeD6zJkeeYaQ-cAzY_5adaxzRYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6ZQiL9/y1Mgp
 IQ2KDtbk6IPm49RCcp5jrprryaemzQpKadV0EomFB8QcXAy76eSZhBrfZRGkO5tbsyG39ogx/o9
 0cKiMXMQGLTaTpttTclC8uJA45p+gYfyCHZuO0bYIm+nCTpWIfs3cRmM2M3YMCE81PrD+h6vtFL
 UzrNw9WPYqj2xLqyfoyQRxy/2ibNHq+fEfBOBXw1O1HS6wjB+btlqqmTni9bBw/Pb0Ji2B0W6eA
 R7vwsQ8ne32rKnaqYda7oFJrPIWobR7KfJKMORLnbqcBHCC8Fz6AF3c7LEETYZ6XKfZfo9FbbrB
 WgvNOWtk+rAfP6j+ghZy3X8z0CLSvsPdIizAOGgzP9e2HgS/nc6ZxqUCdLSREP97e69eI7na38o
 PR9VU1/bW5e6LuNhtMcWcjgziJ8x5Ysym2+jZ+SiP7rKQt27l7ZlL9BLxCk+svJH7T2AEEf2bNv
 9i5OrkXel8YAv6D4E7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX15FoBmIh6zD6
 cKYHBonCKwzdTapzEsELurCYQw05rIfjK7ybUMeEhyffEKGN3JWkr+xccDdGx1OeyitH3JEmlx4
 pvq1vJ9gLPDt6xj75a1yXKrld9rL8dc=
X-Proofpoint-ORIG-GUID: 9JVB6yeD6zJkeeYaQ-cAzY_5adaxzRYv
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab512ad cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sar2130p.c | 45 +++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 7456001cf25e..f40d10274c02 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2300,7 +2300,29 @@ static const struct regmap_config gcc_sar2130p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sar2130p_critical_cbcrs[] = {
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42028, /* GCC_VIDEO_XO_CLK */
+	0x9b004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sar2130p_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x62204, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sar2130p_driver_data = {
+	.clk_cbcrs = gcc_sar2130p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sar2130p_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sar2130p_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sar2130p_desc = {
+	.driver_data = &gcc_sar2130p_driver_data,
 	.config = &gcc_sar2130p_regmap_config,
 	.clks = gcc_sar2130p_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sar2130p_clocks),
@@ -2318,28 +2340,7 @@ MODULE_DEVICE_TABLE(of, gcc_sar2130p_match_table);
 
 static int gcc_sar2130p_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sar2130p_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9b004); /* GCC_GPU_CFG_AHB_CLK */
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x62204, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sar2130p_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sar2130p_desc);
 }
 
 static struct platform_driver gcc_sar2130p_driver = {

-- 
2.54.0

