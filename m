Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3064E56D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554586; cv=none; b=dcXW6SlABkzP5kEM0Kq0esAoKoizEaOGJCcpLRhuF7GIkg3nAwfXWTrkePviSTLzCBIQTs4nclCNlN9kFQF8XPXd15nXIVKzw5GWIwR+oC/PPzqNeW9B1fYZU7D8Q/gA2Cvtb9c6etJlQMHi6zV+QWojTHN9A3843hpQ4jyO17U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554586; c=relaxed/simple;
	bh=Zt1XtMcJTtBMmNvNRadDt4f3CZK1iu79tRUg4BM2u50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9SYDF9pwJwibVrKFhlA54/WGf0XIZhgtiVBtvkFf0ASBpW0ystsue8GBSI5F/TsoeCTayB9ByOXwTkKuvmJngwXoQF6xdF8fbPZ94ZlPi6V8Dcm0su6J2/yf8GwlDY7DuOCCk5P9RR5hawUj1uO6xnDrCymJhuhp1TdzFg2BiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pE//wHjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBDw8PEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pE//wHjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBDw8PEn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AbF2658312
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X31xIlH+SeeyJrg8fCIZj2iiMFxIi6b+bf+Q6vfRneM=; b=pE//wHjAzzyPEYat
	20PezwUp1UswrfxuPnQWYZfoAQ+svOkD91teh7Rh4cx5HBRTjZ6uUA0oym9/Si0d
	aTXoCg2C2tnhwXr9bgKxhpRcHwyJ7A/TBk85hYJTC5oEbt0R/FI2g5fL24Jmq9h9
	e9cFrYGM8wqdxpGI2964Pz8yQoGhgYqa8S0a23XExJXxMIqkW+Bz/7TtiFu5TwoT
	KJCthsa3FXYgi2DWIivhxOHIUP3ihD6FlBo/hpkhx5/nqrFe9zRxcQAt2PLI6xnq
	l/OJxPrQYON/HYsdjHBdNC1D4w4/ZL7GkcLvSv8efMJWQ8LjmzidZlZS4cPV3sU0
	64TmGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujan0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so364207985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554564; x=1790159364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X31xIlH+SeeyJrg8fCIZj2iiMFxIi6b+bf+Q6vfRneM=;
        b=OBDw8PEnD7LN2vfhTZrzT9XMLQBWT0uUc15naShrqsG12mlyelasGZMV/GYNMhmbsy
         H714TxfQ0zjyGxrhepGxcjR1qvK3dCATNuBh7Yf6o9WIjqkf1mKR7pyVA+K2VCjoJeMz
         qCuR1PmV57PFERQGOfPv/gWiu9MsIkKSGoqnT1ceTcXs7ayoC0MiZ0eTOC8WuIf6dMKs
         DvqF/7xEx3NODfB0nyvOQ1tm3ajCY5+Ugpew5ZeSxHCdYNXpm8kY6hMVmmXZyMTL7EMW
         tEbu2G3N4XJr8He7FWuVs8cb8CJ2Ubi7aYnNaId7a8MmyngrtMwSOtkjveOEwQckSGc6
         JQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554564; x=1790159364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X31xIlH+SeeyJrg8fCIZj2iiMFxIi6b+bf+Q6vfRneM=;
        b=ekHWMUWChhvMnfG2uZgKVQxnOlWStMhnf7btuUp1bM3qOUqZ6e446b3bhZLyI4Iy/F
         yWLwCWc0LE8hpYEquLzx+o/6WZJNR7J83U228vDJaAz8TvBafNBDLp/Wz7Idt3f5bM2P
         VSH7I1c/IprW8/1ILJJnikw9yQYn83IyG9nzgoHhqBGUEXov+S9RYYftaRgaWaRgDs/b
         SP/QwaMDgb1B/MzHoNg8ITegYJ/a/8euDeCjT6Gq8goe7M5KdBqToHBLjQ352MkgxQ+x
         MvspTfhTAP7Ej4oTkP1JI6axdQ6Ceg7De3ePV067LpB3A9gq6D3mTMBBIbvHIAT8Cw/h
         wlew==
X-Gm-Message-State: AFuF++mFl1WIOq67oEViHTJV7SMCQiHOJNKWqRwsbjshphtj7m2jFdK9
	W0jUmQpHZaOOUI44JSW21qS7MZaWTQjQOrFFGOGmg35l2YFBQ0l0hp/U/iRGPsZ/fF+VjjcH8Av
	aCCZ6GDHf88V+zYD561k6D9PaUPRq7I0pr61j06BP756OmwdD/sA8k+1zgVhwDrP9hTbU
X-Gm-Gg: AYBFou3bfFISK/gHuCvmOZFQlE7UUakyDfDOvPDd6pLbeWTmb/Ns8N0u9oPm6/Z/OXo
	3vJC2TLXHFKuaiml41myYtzmRUsvh344123hP2t4NBqegYhXnGfsxawEJ+O85raP1p1LIq3yyFq
	wn3Piw5ew3JByR17d6TRSg5ktTi5mYDduL0G6W7W2Tv6pGohmAbLzttJIES8ae8+ndJX3CuBXYA
	fLZjH/ntHb8j+xkknypmBDUaU5kRdDAKGFKEIbBBXPsSQWyZdTRK29m8U6l9jx1qn7vvu076N8/
	i22I2tyerkRniMKA0PVPFtApULI7+R6cur7TuaoajsnyE2VaK4YUqwb+/7QucOVdy6wWBgO7rAm
	YBv3TRQ0=
X-Received: by 2002:a05:620a:6609:b0:939:b783:1748 with SMTP id af79cd13be357-93a345d7062mr967658785a.7.1789554564139;
        Wed, 16 Sep 2026 03:29:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6609:b0:939:b783:1748 with SMTP id af79cd13be357-93a345d7062mr967656185a.7.1789554563650;
        Wed, 16 Sep 2026 03:29:23 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:20 +0300
Subject: [PATCH 04/48] clk: qcom: camcc-sm8150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-4-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zt1XtMcJTtBMmNvNRadDt4f3CZK1iu79tRUg4BM2u50=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9OQZyuYcb703KrDHQVw8AHr2mbq1+HGk8fI
 yB0k30mmP+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTgAKCRAbX0TJAJUV
 VpQpD/sHUfuV7j6h21ksZbSpy8zXHkGuk/PwiWT1ChMdp3rOCVzSRUp6SW9EzcdhQZH4+Xn9pUK
 68Q0wkgG38DShgO/F7/1qg6r52TCTQQvYzjkZnlWN0iHjw5oFjK1H+0qcrWVGqzOyptvGVg3hLi
 W5MDJ9vexCVOg6Zubkg+9cWESB5QSBMl1Vdww3zONcYKDXHZpxFF2LuhZlUw3U4qwMnVWgddWO6
 lHGpVCvdydCB9iUCF9MR7wLD/v8FWBP2raEZ9LcmTszu5wrXKuX1m6JLXJPC9kRwOWk+XPfu0dn
 pY1sAWaCXLfgWPjzl6nt3PPXn9XuLIV1Iq5aj3uJ0X/SR7b8uevDyMxLvCzvMJQKhgzc2JDDfBV
 LwTUa6Jn7LyN6kcOgjukW05bHcSQ4BR+hfZ+Wp3ooRxjlZwOqesI/0TFxpNicJlSXTeAzBxuZfH
 NGDo4oUW/nO93vINIAsIA1nAk58iYd8ZNg9mLi9XVr4U6qyE++Tqwe06iMP1Bl+sDVf/mYF3nTw
 Dwz3OxITOgOXa1cpSR/laLNSATj9J/fAskM1q24iQo98+uF785NA/BPbmbCsd88dTDVv1hkkDro
 KG4rUmKan09jEqR6tfrDnZRBtzM0pFUFG6d7tX1SPyiJd6ogKIwd5we86wvYXyesojhGMVVonZU
 Tha+BKUpVaO92Og==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9bAJ2a2dF98y
 L7zMxLCp5Fq06Y55YXOyvLWCCYt307HYtyFa+L9HasADnBa9jxw3CXfC9KGZxe0VLtjlOr8ilOL
 wmyH3+dcyK8Q5dZLSOtAAnFCx9HmXZs+xk8Zgwp8acK8w/Nc2g5MIzp89eq+m/oX1pF0LkaGHov
 WTfum/chDn0DVQ4C2fTY5G8KsXDMZyPKfqTThCDvDLNAnkli5TkFnEdKF22ZHbr8uXvqPaPb0gB
 LxV6hinuWw4gsVj5gWZ8PDynFZBpgcVa4Cd3YxY4W6OOT7/+si0NgYCULV55kKcFD0/260XGdSM
 dHkFRvdDqp4EYcPXEC5Az8gPUYU5tHqMk5zVfIay7r9wZnKWl9U9gALNc9+ds1mVaOFRaRV4mTq
 BWykCRxBpbWHisSPhaINyu1oiy4E+1BjjTn41n91YUaQ/8PS0r3YUw6gxlmcFCD26CN+rEiuF7D
 IQ6BiJnb8BFEK0gzPFg==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6f84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HACHd5sh_oZ471OAbCoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXzoI2RDYXWVRq
 JJ0HwnIREk8keq3/1H3hRsqt/N5vGbdyJ85MHh/YQTW1wpGsT+XWIxlzy4xJaXro4gtoVDHwNAM
 6/g10w95CmW80wP6GTiQC41UV2sgcrE=
X-Proofpoint-GUID: EAtsE8KlBFo-oQIKxXY1tDbSQlqRrT7x
X-Proofpoint-ORIG-GUID: EAtsE8KlBFo-oQIKxXY1tDbSQlqRrT7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index fcbaff55fc27..27a51abddce2 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2093,7 +2093,17 @@ static const struct regmap_config cam_cc_sm8150_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sm8150_critical_cbcrs[] = {
+	0xc1e4, /* CAM_CC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sm8150_driver_data = {
+	.clk_cbcrs = cam_cc_sm8150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8150_desc = {
+	.driver_data = &cam_cc_sm8150_driver_data,
 	.config = &cam_cc_sm8150_regmap_config,
 	.clks = cam_cc_sm8150_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8150_clocks),
@@ -2134,9 +2144,6 @@ static int cam_cc_sm8150_probe(struct platform_device *pdev)
 	clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 	clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 
-	/* Keep the critical clock always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8150_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

