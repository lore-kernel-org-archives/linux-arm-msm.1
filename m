Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B016433BD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176980; cv=none; b=BzAearg4hepFzAktX5xbfrx2wXhOkHBTSTzuRslv3K1pLn6h7Ho81c4ufTpujaQEQxZzccejcmNUZZUgbQf1wXb8pVQpulLUrwQtSRfDzvmsdtc26soFmejaXSSS2BmLQWQblrhmIh82XMmlZ994yPG/NGl1OezGY2ftqGpp0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176980; c=relaxed/simple;
	bh=IFv+pM7LkIMdXeZxXtKU/W+xzM/r54FjTckeWLOJWc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TirT2aCkNA48TBWOFQIsc3yHw6VOe41c/8rKidbz0xTcu9cPGDe6CnX7jLqg9eUBOT481/5hMfSDIclt0yo4STB0bLayrTR+bllEbaco9FTvXrUZn1Hwj8zn3Jpw4KBvvjzvgHSBcEAGNZ6ZFqHIQjSwtjCnH8BaWTv6eBV3vCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEs0dUUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHbo+Yco; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEs0dUUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHbo+Yco"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC5Jb1472408
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OY/ykHpTJBaxSXY3AFT3nyFc6hiNTFTZaCP8Lqg9vo0=; b=gEs0dUUVMNhyGe4h
	ay4ev0Hw50RK9+Ecn09tSjEtltHnJcn72kdX10FzX+ldu7isw7HkiOs8pHPWxppB
	PgNcaRpzh4FEdufZO+avZ1Lx5bhO35ZIut70ZXP+tHNmfiD9xoBZljnKAfIHvqPu
	+1sTde3cS+bOK03OkMCBJlLBbZSff9r/ezZf5bBj50SFwMv41jXcmPtuTc/DSt9t
	6cid2u+Jg5e8znT68Bgjao1b2DLUurA4P1PIVTZrtezpUuz1qbk0p7sUOVJGZf7g
	fElDNC9IMNAA1vWU3TCb3u5cD/ph7hxGkqNzVx6xW3bYGa+b3FaekzuRTKM0Cqoj
	RghYCQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5gaks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:29:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso4646707a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785176977; x=1785781777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OY/ykHpTJBaxSXY3AFT3nyFc6hiNTFTZaCP8Lqg9vo0=;
        b=bHbo+Ycobub5IpwTkX+JNC5omNjDgtXfAiAySdAij1F7K8xN01BsLc3xn7phnh67h+
         uQwzo7tudNERXzv5cXzxfEQQ9nxW3VMreG4j4l5RvEuv9MUxTSdHIMYmg/Tztx8x0YZ3
         cY5q+2FRtrZoG5LEOCtu1sLBKkaGtIvlNW9cCzNQqRVFM3jJx2mNY/wRAt7pndvxZPYM
         1LZg7ACnYq+P0s5+T6s75ZJHCt75A+rlm+s2zo+tWcXeNK4GldpEqWAGCOlwOeeYbAxm
         PYKdZ3NHsliVfNbXYM+wVs+6gDL/gCm1R5wmj4o5HdcHArBYtbCEAS8xUsv08mvdFf2y
         LZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176977; x=1785781777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OY/ykHpTJBaxSXY3AFT3nyFc6hiNTFTZaCP8Lqg9vo0=;
        b=sCKbpIPpChpez8D8m82gFkAgdTk2it5KVMXPEwj2+2cRx9105LvfipIuf8sGu4mivl
         eQaJibkaN2xB4FuER2lr0W1SoUXc3bXVcvvNwvwg+zo+X9gf32kTy+vkAhoSAqrzElgD
         0hMc8KB9eC91y36vE8puuv9YHnutGB8wL4Mv6INNiQShbrr1DDQ6XsEDklDkZRw/azp5
         vDpQrchMeXu6lVHZ4HmETgLFIiRL/2siPBVTxvXTmUjl7X3Kp+MHmPTR68pEOo6IlOAj
         pLFpd3mmdhIDtcHU1bxCCePi0W88Ep9PfAQPbiG/fpi/EQijE5ocuIiLKNP3oiCIeIdr
         lM2w==
X-Gm-Message-State: AOJu0YySi/4xtMNJQLhGgaNJHbQHJ1An+zNFCgkETmLajAHKf0zXQzq8
	eTocZQ6NzV4fcXUkTL5zuwix3il1xOCsDAM87UIh+4fWPDA+pfoZuimMtVIfCf9OswWUQ7xBsMw
	aH3hzpsMBOHeENWTkpKoatqTej+QdVRxeJQhJ0ufoh6LMTEmXOlCdO+T98ReRcAV6PQdTgetwsz
	qGt+Y=
X-Gm-Gg: AR+sD10WHN53EE8IUzD7xMITePbDcckAZisOsRx17JlWHUm2DaeDD2glKmJ9AVaf+7t
	3J2cSxTSvBeEUygOg5VQso2BwB38UEVDrFaMhbHGs4rpdEVNuNqE7FfhiMRsAd0itXKk3175jZA
	uNeaUXiKBCkdo57QSqh5jATkA4HWarx18vW1btF4ZGFpv4hK5M+67CHsssNQ949n8bfiMXEwiM6
	TfKK0sqVQS4Mi2mpGZ1IvX3AQql/JrJaufUg5XzAvS79nlTOvCZKgv62pw/eHlpxpu9JmVs4cdo
	NTB4zU+oGsQrSFCKTusn9zhS0DRKpj7rQfTmTefeownMcvjIBsYFlh1RNIQnSO63jNGbsiO1fWl
	LcI1s8Ia6PyCCa9gt7RKLxHexfn6oSa0=
X-Received: by 2002:a05:6a21:398:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3c67dae411fmr9342371637.6.1785176976916;
        Mon, 27 Jul 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:398:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3c67dae411fmr9342341637.6.1785176976424;
        Mon, 27 Jul 2026 11:29:36 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm31963087eec.28.2026.07.27.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:29:35 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 23:59:10 +0530
Subject: [PATCH 2/2] clk: qcom: Add support for camera clock controller on
 Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-maili_camcc-v1-2-01dbd7ddb276@oss.qualcomm.com>
References: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
In-Reply-To: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX/EpfUU8zl48g
 pRMqwyHEZq4wr84S2N/VC5xTiRH23uplYfiQHAf9isPnqbidfXAp8yq4fqKqjnpfpxt3JmOq3l8
 ePD27ZjWLw4CquLdkKUTXmLQFqbOKlc=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a67a391 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WUYTnRVY2eYULOhlZxwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfXzdp9ptckLLHZ
 7S82MGy4AjrhizUadAmMRMuzpOxSQdLnETyuefmzLUVl1x2fPo2QAa1x2iP1cIqP0Y5tnYqTHCX
 LNt++Ke8ddMqReL+VcShHYOlG/MHyPv8VRUN1IqhYO7IlTurE+XDG9JJF4ZVAoa+bRQfaLjQYLF
 DWb9UB4JIkfNEsBGbxey+IpF6CwxiuBMJyPDI3QFUDN1L/D7wZT0ZzED9x3WXOoR2YQ8KGvm0Gl
 F2PpUZZ5ulGvRXKPJ7xbcQEKYPYx5OdXz5+nKHgWlYyEVw9UR6e/UQzPrAC+C0L5kIVxoD8ZtWB
 xFrCimGDftKmFiKMM2w9I+5Kyq6JJUQxDH9bZVtUZd727CKi7BkRNN86TZG98Y9Ov1SBLnxmSf7
 4FDXohxUmDl1lwTWTbJeah+gJaoIHvSQAL5XoGkTNPkX8WYw5v4VsKLNdFb1gtixdtyFAq59ani
 9xbNrkEdaFecPCpcbcw==
X-Proofpoint-ORIG-GUID: zXRb7xg5z_gZZHszRADN2k2PCF0QggqX
X-Proofpoint-GUID: zXRb7xg5z_gZZHszRADN2k2PCF0QggqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270170

Maili camcc is mostly identical to Hawi camcc, with a few clocks
removed, frequency table updates for a few other clocks, and PLL
configuration changes. Hence, reuse the Hawi camera clock controller
driver and extend it for the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-hawi.c | 158 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
index 5b004a627fddead1e7d229bcc8f7c2bfae3560a0..e56afb42edd397945a486181cf120f30aed39c3a 100644
--- a/drivers/clk/qcom/camcc-hawi.c
+++ b/drivers/clk/qcom/camcc-hawi.c
@@ -61,6 +61,18 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config_maili = {
+	.l = 0x3e,
+	.cal_l = 0x42,
+	.alpha = 0x8000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.config = &cam_cc_pll0_config,
@@ -136,6 +148,18 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
 	.config = &cam_cc_pll1_config,
@@ -188,6 +212,18 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config_maili = {
+	.l = 0x1f,
+	.cal_l = 0x42,
+	.alpha = 0x4000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
 	.config = &cam_cc_pll2_config,
@@ -240,6 +276,18 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
 	.config = &cam_cc_pll3_config,
@@ -292,6 +340,18 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
 	.config = &cam_cc_pll4_config,
@@ -344,6 +404,18 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
 	.config = &cam_cc_pll5_config,
@@ -396,6 +468,18 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config_maili = {
+	.l = 0x32,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
 	.config = &cam_cc_pll6_config,
@@ -471,6 +555,18 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 345.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll7_config_maili = {
+	.l = 0x11,
+	.cal_l = 0x42,
+	.alpha = 0xf800,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
 	.config = &cam_cc_pll7_config,
@@ -500,6 +596,18 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll8_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
 	.config = &cam_cc_pll8_config,
@@ -677,6 +785,17 @@ static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src_maili[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_MAIN, 6, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
 	.cmd_rcgr = 0x212cc,
 	.mnd_width = 0,
@@ -698,6 +817,11 @@ static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src_maili[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 	.cmd_rcgr = 0x21250,
 	.mnd_width = 8,
@@ -1071,6 +1195,17 @@ static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_ofe_clk_src_maili[] = {
+	F(300000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(376000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(445000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(609000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(688000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(841000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_ofe_clk_src = {
 	.cmd_rcgr = 0x20120,
 	.mnd_width = 0,
@@ -2961,12 +3096,35 @@ static const struct qcom_cc_desc cam_cc_hawi_desc = {
 
 static const struct of_device_id cam_cc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-camcc" },
+	{ .compatible = "qcom,maili-camcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cam_cc_hawi_match_table);
 
 static int cam_cc_hawi_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,maili-camcc")) {
+		cam_cc_pll0.config = &cam_cc_pll0_config_maili;
+		cam_cc_pll1.config = &cam_cc_pll1_config_maili;
+		cam_cc_pll2.config = &cam_cc_pll2_config_maili;
+		cam_cc_pll3.config = &cam_cc_pll3_config_maili;
+		cam_cc_pll4.config = &cam_cc_pll4_config_maili;
+		cam_cc_pll5.config = &cam_cc_pll5_config_maili;
+		cam_cc_pll6.config = &cam_cc_pll6_config_maili;
+		cam_cc_pll7.config = &cam_cc_pll7_config_maili;
+		cam_cc_pll8.config = &cam_cc_pll8_config_maili;
+
+		cam_cc_camnoc_rt_axi_clk_src.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src_maili;
+		cam_cc_cci_0_clk_src.freq_tbl = ftbl_cam_cc_cci_0_clk_src_maili;
+		cam_cc_ofe_clk_src.freq_tbl = ftbl_cam_cc_ofe_clk_src_maili;
+
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSIPHY5_CLK] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &cam_cc_hawi_desc);
 }
 

-- 
2.34.1

