Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD840B0EF
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704301; cv=none; b=SHUOH0FdiRdi6JJ+vjb7Cd/qp5SEArydpYmoa3XBPtTeTcLXY7DYS9U93kinABfdYUAVkpv+LqzCubaGKA7GErK38R9o6uOUn85WceG8rF4xvSKYQHMYJKR4/JZxt9DOP0HPse/pJtg1YqJ3ZrUvWi9329ED9K/CeNkzfBwzkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704301; c=relaxed/simple;
	bh=gxoQSeMomlLlSgismEZYS34EWU7wg4s4uQ+gewbEBP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyZEOFYl2JYOoIT/+keOJKYgrdiW9FBTZYliHRcDz1ry5BoQBvR/jwpN9CfjXRu0QsxjX1OCUBQ96TEaNqk8vJWY5LGpoEd4DgELZGR7OJkmEv21FKwUFMfNCSLGig2fTQE1Lr1FOuqOtgP3cVwbMuw/4Ym1tC+2/c+vUwDOsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dk/0w84e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqhCt8vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dk/0w84e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqhCt8vk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686003SP3937665
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Sep 2026 14:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=; b=dk/0w84euvhzt7/s
	3cZDvVyTBBXDZ4jtXQQfQx1qMzwYA+CDjwhO5RZ12+q9x6TTi82VrKpHerdkx2Z/
	9lpGmmFQdiLf+K51Y49bDXSRh7NlWZjrOVya3mxoR0QFtA3M3QydCwVMNqB5hWHt
	DTV//3EvI/UGX2TiObRK2SVgrqW2hXB27vMTZq8KYMKoEwiU/beo93LQc3B05FpR
	y20AMpaYTU3m+vEdWXw7lwOeMFZSWxymu6UZrmnfCK1u7Maf2vdNkP1qcDbwXAaH
	qz2C9TKdQFr/kOhkH59a+7xtFrm+Ajbw4n347rfHF424XzJvzXtn/03kRLVz5cH/
	KS43tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vbeaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 14:18:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4415129a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704296; x=1789309096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=;
        b=PqhCt8vknPyeZxZ9FUjGkl3BBGDhbCeKwh2AQE5ftVo+SLRl0HBjwbDoYEUwuX0Rmu
         +XykZsBvQ8sjlN5iTGyoAGO9LPyzIe8z7hBQ+9HZb8DqR2e+SAvPEbjNNdg2IqTtwE7t
         0HDQNbWpNsMVO0bG3LXby2bRkyNTf81Ke2yjWDyKk+BJZxjNfVRfCxlsPrw6MhNkeZj7
         WcUtnGp5pQNQ8V1MxQY9JQLyJxL1GjfCbzT8LLOsJmOs9NLP6jLM3G9lcHbpSGV4c8MY
         e5FWHEUiMJO/588aj+U4AHk0cxlnbxWmciXNkYgfCivd/xdC4RNQ6piHXQzfPZoXF50/
         3QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704296; x=1789309096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=;
        b=HOeadGT9NJPjEIe4MPTu72cvlrnO3mqHGSOh6kMGMMhyfme62DQ3PQjN7BJBZw5zxK
         OtgeItrQjbasy6cHIFyaYMHKVksGBfb31s4OWa0kE4ltnd385b/VykBxuG+MYL5V+3Zf
         Q36vijBsqWLZzpqRtNrTbXyz0HMXRd3E1CKyx/BLA/krPh3T7TZulHb2DpaGg0XpKyNI
         qZcjm9BpuIepcN6WfbncBmmTROPZZ9m4pD9GnuSjdsOVJb5wuRLG11rF7ZA3eExXjx/t
         NMGEpLJErvvBmrHHHqpwLchj26eTfKLE+cfmlwuwuv25FSpfxLzQvkQ8WA877QBRWVR0
         VvyA==
X-Gm-Message-State: AFuF++lTTMFbIsZy4VAYKehgrJhUeyqINDpKoxEvdP7W9doAMyWCskw7
	IsYsVNAVCrudJgTxq93PR+MxOr2aE6j3iov7WUoMm2VU18jdl7Qr+ntjdxChApedThlRTn8+eGt
	OzwdRu77UNQFfL9zUE3do0EMMt9ftrZ/lOS0k5DGIBiBTayMmGyNLjcPCHuFLqzouYP7Q
X-Gm-Gg: AYBFou0uPVtZUuEDmJflL7CYjAez23k5pwkSXwmIYLWi8qcihwhNrlGlAhkr0ExUYDY
	sCVaP4i1qghBU/8Sd9DiMrDAyy6kaOl1lzaT8736iH7JfYNJO9AANRVDazb0dr05Ift3v1NIKBB
	gPw+EKspvImfxJgqcgwmAwU/jaw2Q/pcLP6HLNLeRH7Zfp5WWMKtL3AL48mD56TLefHrFN8cpih
	o0SC97RvRgFCUd5P+IFDezXsPqVu0dWEJ9q0c4c6ghO9YWzKT7ZwKpJ0cqBI7GaAb+OmAjuqdyb
	X1OPF17S+qpdJZjLSE9/0tIrj67V+xtPaD6SX2OaQaaigwKd007dFrpXlx1w1bdb9TC+4qf77dw
	yhAXT9lmSVLFEH8uog3yayaa9bVTh0sY+HmQkPwD4kbQ=
X-Received: by 2002:a17:90b:17c2:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39b25f1c5bdmr25232892a91.0.1788704295809;
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39b25f1c5bdmr25232829a91.0.1788704295315;
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:10 -0700
Subject: [PATCH v4 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-4-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=2809;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=gxoQSeMomlLlSgismEZYS34EWU7wg4s4uQ+gewbEBP0=;
 b=lL2f7yhu577Z3kaxQivGtNNGXXMQoDyrqm59F3pdMyZFS856aGeWn8pM//2J+WBUniT9uJXjX
 BSFvE02wcDXAkXpm8pDrjhPQV+Dit/p9Tu1vAzAJh6Z7qLMp8/ds1Vc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: VuijS94YT3dhWD324KmXmfo1RiHVoz_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX0es9C131C8FD
 jRKc9yzhMJctq4hNrlw0kLkL6Az8Opz9dQwQHqD2/ZMnF8c5QKoGT2JjJUHXkx5/R6CD+vDINot
 YNP/gqXZO2lskskJBfLSGLZJ8xpKrUDI0ghLlHDYhe7yVUcxJU7p1kMQdbsBhxTiN0iIPduWijK
 8KCArzK1S/XdaRanlBuqB6Qrwu8pf8qbk1EYjB6ZKpAbneX09bNkfOpgTyxnM9NNQqkkSpUYapk
 gtfL6brAp7Dn2LCW0W2jOHdLabQoovN3u7M/O9RqhlfprWwKUNRA4KRju+s9le8YUJyCgzGk/HM
 ITfYd3qTSNiUUelyZJyLoZFQ4fmAXmilxSRKWOLdoGOTkdCvCfl8yvajupfw3D4blbcbdDyZZ9r
 LZZJOhEIAATtFxfTlVcLx3KS2Auaf4xvOJfwY/ibUGDif5nvpAhoImYGCrf35QdLrB+5cw6lLHJ
 tEikk5VfQCP1VTiWBEQ==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9d7628 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LIjNjOY4wKn3Yy6eg_0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VuijS94YT3dhWD324KmXmfo1RiHVoz_C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX/M4jihQqt5Hc
 VNH3dqqQk2XnaoeYg18ruF88FVlgy7cdQ1V0BtKxLAY2NCYcCZJje0o9CnxlRdE/agXNEuqOP/0
 sEcHPZaZoGJt0JOM5fpCy4C2t/SZcg0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

Most CMN PLL output clocks are derived from the 12 GHz PLL output
through a shared, physical /2 stage, ahead of any further per-clock
processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
This /2 stage is present in the CMN PLL block on every SoC supported
by this driver.

Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
and store it on struct clk_cmn_pll so the output clock types can parent
on it. The two plain fixed-rate outputs, xo-24mhz and sleep-32khz, are
the exception on IPQ5210 SoC: they stay parented directly on the main
PLL clock.

On SoCs other than IPQ5210, every output clock is a plain fixed-rate
clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
value rather than one computed from the parent rate, so this /2 clock
is registered there but currently has no consumers; IPQ5210 is simply
the first SoC in this driver whose output clocks are modeled as
depending on parent_rate, which is what makes the /2 stage significant.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 4fdf78f6829e..c86f7982607c 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -96,10 +96,13 @@ struct cmn_pll_fixed_output_clk {
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
  * @hw: handle between common and hardware-specific interfaces
+ * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
+ *           every supported SoC.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
+	struct clk_hw *div2_hw;
 };
 
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
@@ -362,6 +365,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -388,6 +392,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+								       "cmn_pll_div2",
+								       cmn_pll_hw,
+								       0, 1, 2);
+	if (IS_ERR(cmn_pll->div2_hw))
+		return PTR_ERR(cmn_pll->div2_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
 		struct clk_parent_data pdata = { .hw = cmn_pll_hw };

-- 
2.43.0

