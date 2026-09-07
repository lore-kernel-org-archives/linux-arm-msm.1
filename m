Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDF43F0B7
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769588; cv=none; b=hieHzMCfIjOy2FZTg3o+wjrgyMF4kX/o/7QNPxgsZNVay8a2jAPelKTlRX285fWndlqkoYnklmkCAEE4gVr0CN47xbqhksx0Wys7/AUe0efp8fJsGGIgk01Cp+p4uRx0dQJc+dJRq6nF0UzbJVnck9VHWx7S9JRTclSRaMfnC/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769588; c=relaxed/simple;
	bh=N4FyLsi/vnMLGsG8W594EiPMPZHDtd5RYGzvBPKBmGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCUDOI/z0bNXB0Ja/sxSD7SbWHb2PP7n8Tr2cJg0s+Ds3vsCMBs757VSJej/XLbxi+M06vy3QZxbbn8LWY1hF972BjhbQJVnoB935BkAZd3qLJJWT/jKHgvdV5IlV5aK0L06PbccAmgNaFZmjlQXbJd6LKPIQOVa9d9hIIVkWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgeBV6o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCME+9F9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgeBV6o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCME+9F9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777FQr2838621
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMeRUk9VWt/DciSMuhzLmvU5L+tx6RdOIZmcnWooAHk=; b=NgeBV6o/6DHKy5T0
	FpsJc1ZoVj5N1/8Blyq1RqstfbhD1djgWis6RJNxwuXsBxlyywDXGDN/uHTCQrl4
	/5qTO/DvER3k6D9omp253eDTc248v8HBn3VBH30JWjHsVdSRDt33/aDTXcjlJ32U
	Jm76ytFhwY1dec8zN06boMF/zWTOhkpTR1Nim8vYvXx50wyqemrv9/ABDbLCgmDH
	fmp0X+URwnItHby+qmbbNIEt6ZxA43iJOlJYUrBREbSONNm6Ys/2ebPCewfyNO1A
	nIOmdY77jFctGNuoqnOtx3RwPnTOugrXes3/Z8adtagHYbCQGfnGu4KOPiqzHGDf
	L3Eiew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuenxq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:26:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so4451528a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769585; x=1789374385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMeRUk9VWt/DciSMuhzLmvU5L+tx6RdOIZmcnWooAHk=;
        b=bCME+9F9WFro3VLmdkhNrt8Yg7Ej2xO/yJhFLgO0X+GOSXy4rQuLwukZy54weuwrMP
         q+A0qFuuG7mowjDzYPedaS8h2pYvlgjmnwwS2vyWJ0Gan87B8scrm2AQQAu0a8RfQngj
         DcvlS6ImsfblWBmDqkIaGfUKD3ofo0xqNmn6t0hr5HnaWv4omx/b+wwf827kc1jj0NNW
         LybMCrS9dS77mTsbyl4OawithKuRBz3JbgQeMaZ3nLLgjz/RyskGWxlttBhArp23azG/
         4hg8BkcHeiZB7rOMJJIMy1kzcW4PlzKDQ0ZwS9KF6IItk3OuBy5SndKsd5+5lqKsNLHh
         /cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769585; x=1789374385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMeRUk9VWt/DciSMuhzLmvU5L+tx6RdOIZmcnWooAHk=;
        b=M6PuNb2trf5N3u1o1dbmhTS7PMRfA8cluBDbRZEi33Rj33GO5kZJshlG37uTEJq6MG
         Ilg5ctkp39WvKVYNd/KkHcshW5hQulJDiLcxiM+nxnHRh7IbFpFmvOEFKCgc/6KbJ/bK
         7tCsE8+NnUV2RPq9gPum1nj4igA0xZHpm1C4VekuiuQ+iPn7UhXpgfyKocohI/BAf/j3
         npmmzd5knHhRidD5YJlxuISvhDlo44sLNDUlIUzbT3D03tjNOUhCbov/zg8BQvnX0N/N
         t75q6zasb1MZvZsVQHgYRGvGmz4qerInb58DMNqSnbtfleRvNC6SnWJdJr8hHJWqCJVB
         meRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE3GTLy+qkauHuS05HvGLBz6hz61BScmY+T95pT5giF5fHXBHamvedj9/8LywxBDEE+dWh6k8P0Kfr6BsW@vger.kernel.org
X-Gm-Message-State: AFuF++nu3HgOxQ16Acll4c6FVoAzwWN0bjCdrBsAmdzpZsmrz5/gMdq1
	0aH2lRHTvqCxYjynjWyrGqzbRL3dof+V5f1x038+6kA845/M4ecbi1NwY6JWRWbheH/MzluQNxn
	LtxXJcv5TbvIY3FBnggC3/ClU5RCJ8VvhRy7RF8fFUJKwcvusA1Cav0rq/zvFlHOguppv
X-Gm-Gg: AYBFou38EaMH6CryJqCC8e+lhnjgQ10JX9t0kr6W7Tu6uzNd6Cao2YRAuwlEnluX5ND
	QEDeQzPHFX090eH+SGFydlI4IptbM0HOfoZwL7yTn1vUIFjGM0qGWnXuF8t+y42OFlubbxR0V7W
	i4NvLD4ixbacCwOAPyQCtUiXg1yPWd6BODn6l7DvF9ekEoE6nON2IU8tczCZ7BiwknThoJTmKyI
	wJYKYAvhgPNd3qEkCELk6tB1jOjn8NYnVsxnZ0Pafv3HIJCXL3HKF3BZEkLr60gkIbVD4swwvcU
	7X2HmoIoCp40PC0C0UD52iN5KaFALzYIlY1aFXNvksEH6TbdEgchHTq2mnBs5dJJksBm6TqAF7v
	08hwaoEcB4Enm7oqOAe3DALFZ
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr35780832a91.24.1788769585581;
        Mon, 07 Sep 2026 01:26:25 -0700 (PDT)
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr35780759a91.24.1788769585067;
        Mon, 07 Sep 2026 01:26:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:56:13 +0530
Subject: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL
 width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfXzrdXD0nMp0py
 Y2XncQJECyuFgwsY+4B4PJio2ujGnzpVL94LWS2YL/EUin2/0L2plbshm+gD/ZQ+9qtX0b4jb5z
 kLhRyEmX4+0L82nrAZHBmflksJiBftTlYDxbWFhBN6uVNTPTrr79/OPDF0pk28Kw3rlxvUfO2Oe
 oFnq6ah0KahC3SD3lMWUlnqquiR7oI7qxEif9R0VwS4aLMBB9hcLIp724x4asqhSTdTKXuf1Ucz
 +mImmaRVzS+yeK36HRZLaAZ/dhXDt8cuZqCCBmiheFjbZut8ZnxfQeoAwzgyEKT1VhmGcdsQdAA
 kTyDIZtGgHp21qGFzM3yk6qSmsX0+vkijd3vkTMXpohOFbJh3AiSW/iSiOSFqLQCzLbeTP6oNy/
 KqJRnAq7tQloR4+Ha4Imaap8FhxeAzrtPoozNbSzU8Ifk2eWgqX1NuR2xk4bWJmEXOA9vSVIawM
 YQ5DWbRb30UXVaVgPqw==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e7532 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iX_rjOfq5r2Sv1zA3QwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lPsN5iDq7xRS2QAaXOL50HyNng0XjaW1
X-Proofpoint-ORIG-GUID: lPsN5iDq7xRS2QAaXOL50HyNng0XjaW1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX0s0+RhsGqur0
 fzfHeazSxQz7kJQ/bXU1Hb2tg/1rP+qdTPa1/+gHIY2dFpiQwHUNSX8rnmTF0L6I2u4tVhrestf
 NS3ipEIHi74aF1Cz0EHOTjb4kFbQemM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070090

On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
carry the fractional word at a finer resolution, for example the
ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
however, derives the ALPHA_VAL width solely from the register-map layout
and can only express 16 or 40 bits, so it programs and reads back the
28-bit configuration at the wrong scale on both the set_rate/slew and
recalc_rate paths, making the PLL lock to and report the wrong rate.

Add a way to identify the wider register: an optional alpha_width field
in struct clk_alpha_pll that, when non-zero, supersedes the
register-derived width. This feeds pll_alpha_width(), so the recalc_rate
and round_rate math scale the fractional word correctly, and the Zonda
set_rate L-adjust MSB check is derived from the active width instead of
a hardcoded BIT(15). PLLs that leave the field zero retain the previous
behaviour.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 7 ++++---
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..981f973da02f379832fdc0cded3f2b4cae5879e4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -382,8 +382,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
 
 #define pll_alpha_width(p)					\
-		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
-				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
+		((p)->alpha_width ? (p)->alpha_width :		\
+		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
 
 #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
@@ -2290,7 +2291,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	if (a & PLL_ALPHA_MSB)
+	if (a & BIT(alpha_width - 1))
 		zonda_pll_adjust_l_val(rate, prate, &l);
 
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -86,6 +86,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @alpha_width: optional override of the ALPHA_VAL width in bits;
+ *		 0 means derive the width from @regs
  * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
@@ -95,6 +97,7 @@ struct pll_vco {
 struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
+	u32 alpha_width;
 
 	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;

-- 
2.34.1

