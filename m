Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024647DF97
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251644; cv=none; b=PO6Tr43nFg7fZfBTGVowcr/kC3rxqZVELh/m2sZbrbj5IKK2tcx/Jlx9aJduVWycMl87afcnH9HQ6n1VthGvIzAjfTlRx1q7WZzuR/rh/eewMXFLsuxEfptrN5YHm6B4bJTGTsLkANeFbFns8ShUxLTDL661MJ9irK3BpFEGQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251644; c=relaxed/simple;
	bh=NpFkNyaRbbIy280UOhuPcTN0madFk6MFT8lDT1uMuJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMVMUj/K0SVZiLCtgEtKbC0pIKn1SM4iwPsByCeKPVOhHt1kQsHl4xQJy1H2X38MSRTygRtBl5qs3M5KAettQbdSKprmltd0LP70Nspja2wBdmYkMLPeX2ywKSmbjgmAmwe6ggyjQ6HhY9xlL5vuzqYIWLjKGFmtz7WtNfmLfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsGKGps0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkL4hDqV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsGKGps0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkL4hDqV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4XtB3282841
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3xokX7bYOscGmP2T43FyhKVF0zRdoQlxD+Kd+fGdic=; b=OsGKGps0ryiTRV/y
	+x3hPmAABB/TDjHkYngV+f+EjSfTYybHvqNsvRGmVU2hxFaO4QbM+cOGMBRY/0fn
	koKYISoQt7Xqq4YU/qN22eU9C1j/5zA2zuIeeImNbFs44ShSmN+7KEH4HKEdLS67
	cFzFCnfL5Wk0dVz4k5RgDrbg0w7re/mT+VsP2Ld5R4/6IZjF+VwCOkHYCh4oVEkY
	ZnNB6sqxX0DqTVNmcM/aeszxzt8li/qimcyfBJeTt2y7GQFTtFvjGZvr0fwXg/+Y
	+XqINF3nEIUTyWHfgHeLPhiHivMgIuHncLzxlZ0bC6ckBAVaJdEgVct/0ulyPud8
	TKMiJQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9a55c0cbdso861997e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251640; x=1790856440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3xokX7bYOscGmP2T43FyhKVF0zRdoQlxD+Kd+fGdic=;
        b=KkL4hDqVFBoD4giB81HoXsRnpNxfoDp5JF6El/h1nziandtOH78AGrOTxjcfAGWOym
         CnF+f9reHdVlxK7HFqUtg1xHVymQIx8WXO4FiM8wCNdeCCQlzGGBSL2+9Oika+AsUjIx
         s9+xyeaOuS5b5TETFPJsre/Q1hJqQ1K6XVmMeoJjkoXLouZR3alIthnWA9nJRrkFWHUV
         /0Jz2ycnwQc3nq0Vqf3dz6xmBm83TlbUN4A+9dyo5qfkzJYFpcsQCLEsg+tELT/qu6/7
         U4L5ZDcq+Fqjx4Hvct+5J5oWMhKx/Dbqr1TknSRt1bZn5JWK/Z9ifyu9Sd2KLkUjOsi2
         h2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251640; x=1790856440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xokX7bYOscGmP2T43FyhKVF0zRdoQlxD+Kd+fGdic=;
        b=cdEyeYAu66dwT3eO3pMAtFPM+HYizEungsNd6D7uwH0tyn9BFIPgAyYAu09lxpLX3g
         IS4QWdoBA+Kbzc6gpwX5o3NL4peLgbBrQH3Pf9jj9g/tpFTLFmUgWtBjUeZpxI1iGptq
         V5EUXiUBLZkC6Zr2uNOwd8FstE8+TbgL1kd0kVcNAyD0P79ovifBge3wDZFPsJkoZoi4
         P+4Xo21PudaSUW4BQlWq4IQv5EkxSuQ4+ixMUZ5Q6LBvZEFkIJbSdo45l/9OnvkZ0G/u
         HlEqfLQrS+wlDBCh63XWLZj+b8lts7Z3aDi97//OagoICsC2OmEBD3IC9+Dd2ZLREJGZ
         7ZKg==
X-Gm-Message-State: AFuF++nMjwKVY6M0JJlU9ZaLc8GjgrR2cYeG0odNDTNxQ0mPdPjZtdxm
	i9CdrldHZA0ECpeGSvfGolSwg8rC1465AiiUvIV2S1MMo2jFvWdC6beoh5Pq+9sXatIn2RhmHyJ
	yWuZ4q8tEfvSzUUwk+GOX788NlKp8Tcvq3FzcSH1DoayW1W8q2Xk1JeTfFBkrKWR4rql6
X-Gm-Gg: AYBFou1yDhRTumT5Nb/scac4m3Ee4DMxgJyDqNMguwC5cPlJxW3NQIuDntFiWy5AOFU
	lNxEb5JAJeNkH0V2VYzNySxxrwa4JSOx7E0KmmC7WCUqGhWXgJ3IRDCdhsojTPxL1vKe115Qm5q
	o0y050Tjqoq0uqz3gh40BAWjymSbNcjfGU6GGmb0QQrUG24I6crmYGfiQtKbzcui/dxG/sqMsuS
	NYEPBxF2acfQq6HI2zCHwZCtklcc6r2cuWbhS8FB0smP/I3CU8J9N0GbqhFlX86PN7hioNK0o+w
	ti0W4X7kf9FOq1jxeRZYs1JtihjQ/1PKVi3l/ZIMq5TEmVoSGBhPnSdqn2It++zA3GJFCkflz3w
	jAu7XFjaZ
X-Received: by 2002:a05:6102:809c:b0:785:d308:cc0a with SMTP id ada2fe7eead31-7af1cb95fe7mr988520137.9.1790251640001;
        Thu, 24 Sep 2026 05:07:20 -0700 (PDT)
X-Received: by 2002:a05:6102:809c:b0:785:d308:cc0a with SMTP id ada2fe7eead31-7af1cb95fe7mr988503137.9.1790251639207;
        Thu, 24 Sep 2026 05:07:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:14 +0300
Subject: [PATCH v2 02/48] clk: qcom: camcc-sc8280xp: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-2-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NpFkNyaRbbIy280UOhuPcTN0madFk6MFT8lDT1uMuJU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJDviHCd8d2Wl0zsmJ43z1grFM1K0ReEkSLE
 R4Oa2tfICWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSQwAKCRAbX0TJAJUV
 VqYND/91zMoxaVm+CApRhC6UXiZR2fhnE4v1zlw5NDL/AjCH5pMLBgd2PPvqA7C+ozlwOefiCxm
 JQpYGRhz33qBUUQgyNwDNfJJUxKl2Vsps69fjUDvkmLt7kKT6/91kCNDE0+yCwMl7tS5aLPQUu7
 npOsNdxwddyEzRHKlw9akX3MPXHa8OOcoRawSF5s9SwiRiS23RDAlhY1J277KYhlCI1VaLrI7Hm
 ftzymt6jbJ45Haa6O8gY0AQVXLKIp/PdEN675zNVyfLhI8ejEXMm+u4E8ZD2b7dvEQrQIDHl/Jv
 m2Pfwd4QNnvnZAG/dCoDECHrF9RTlyCPoaEu5ZwICYE+nDBy/KPTxTFNDqlKXbyJ9P45hSUoRMU
 LzdvIvYHFsyIZjm3KcN/fZtDK7d1yZcDCUPfZ0ib2JDQtn/gk5OouYmprBbl1rhUr90Bp8RHHtN
 Im3AW59LcbIu3A7UIEIb675dhdxqxHZpFrgZZiXs1+y7xq5EKKBRlbGww0+LilO0rwh7azF9nnD
 n2T65iub2EMwmj+R7q+Bvpom8L5WBQpfCJO/13yUqJWxV1xnxFFPCSlx9opNi8xVHjFCtX+6++z
 wOr2QtQvhe/QU54DJjDen2pOK0ov/8sOHgVk7UhFE886RM+PLuor8yO1EXdwFQUlIUY4D+nFmVU
 hr7UVhaCZmgMJ+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6Tx1A0AgALsL
 dOYdM12naMFBLyfTaSLFZi9pFNDgJvhehrcAgvh0Wvi+olqt/34jxlJ9CelHEd1pqHPkGj1U6Eu
 7WIF78CFApH3w4RR0IpfFUoDBaiOFXo=
X-Proofpoint-ORIG-GUID: Y5wlBiPto1TKRC0eZ-QRt_XZvGs8957n
X-Proofpoint-GUID: Y5wlBiPto1TKRC0eZ-QRt_XZvGs8957n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX7rv41N336v1N
 /5H9I8NKsEWixp0vTYGRDm7p80rbG/Yb9zdc2QutHvy+pTFpCXtPNPnBtqEg8fxz+acjMKVvOhQ
 XiTGzRtWGkj2Vbf6CVba+ZVm8OsfquuHDa6MybukU4kpu8RPgGLwlfi3q3TyqpGUnwYPFmMSMR5
 mD1lA4KgErsqPfkDTWNYr6xG2fXKw7rKFTbfvcI0X3yF4db1UxlhDVGyb91S7R5mG1hh2lZwLtM
 vL0zVz61mTYqQ+WhTRLcBdOFvyajik/Q2VCX8lVypRiOpBrh6TBy6K4CDiz28d5Y/hk92y1Or7i
 XfuF3kBf4TY+kovefmtQJtYXUYWxu/mkk1MS8DwTImFLslClGpNOiUE9AuB6eth5QTmrG86H8g3
 xIeHuruUAYo5qOpnoog94P7bSzPbvDzXTOoht3OtFx7fHsNZLMQcf7L/1p9uXpCziQrNrFDQYi8
 8iv4NP3HbUZX8s8ImVg==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab51279 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rrqsg2U6P9VQxLjfjP8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 660d8655d391..b0f1d40d1df5 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2967,7 +2967,17 @@ static const struct regmap_config camcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 camcc_sc8280xp_critical_cbcrs[] = {
+	0xc1e4, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sc8280xp_driver_data = {
+	.clk_cbcrs = camcc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sc8280xp_desc = {
+	.driver_data = &camcc_sc8280xp_driver_data,
 	.config = &camcc_sc8280xp_regmap_config,
 	.clks = camcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(camcc_sc8280xp_clocks),
@@ -3011,9 +3021,6 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
 	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_disable;

-- 
2.54.0

