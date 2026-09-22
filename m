Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D304CB8CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070215; cv=none; b=gpCD8CkZUjPyJIec82nvjpipvJnUAU7YA24TF6HrKJEpiAVv1Hk+TqYT34YLrM/m558Th8qiqlwh10KJs821u5LWA4d1+W3VXWahrSRT2d7M8wVOqZM/ecZf5WmQBriewKYq6D3gaz+pULwkRc85KPc2BPnp2EKbl6ADRdrSrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070215; c=relaxed/simple;
	bh=qsXF0dZevHujgAyvXlegqZLisSzLQyqTMPlbdzLNVYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhD+7/qrFF6NRs+d3lIYDpPigcPOiVUdR3eOCcaCoLXU6C2Fp+iJrkq+PDFG9c/3nBUls74ySZ0oWHBXFD01M+OvKPKzJjw1rHBF9AakmTOCTP0B/Rs2ymBC4ULMO3eIcBl1t5DiX2Rgv0ECFv1Sxz69GTV+mrMlRT9GRVwRMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zrc85VFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtHMWSYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zrc85VFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtHMWSYC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M99UG31842547
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=; b=Zrc85VFsLtFIoXpp
	eTY5zKDj83+zaZ8qxoMxvG8mEPKPF4k39TSrzC9rJxhM9CX2His/9YK19G5g1cK8
	ctXkkpfjC4YM7rdvfcewNx5bFOxLrrypqurWxtgsFHOjCZ43Bz2ZoVDp8BjKN4/C
	TdFeGoItl6X1aKjb15h6e6pHJSu6+JjleScGG338fmZ1Kv9+JOWpUKiVaiP3kjof
	GMhBBKU3X20Ev7xfruaf5YMeQMSMT856XqLXTZyIpOnovyEe/Z5BVCV2GHLnniMp
	Q3YQDEvhqAIRg9gsKw4aaNxtErvc5M+T9alk1MTacVP2voce8FtQK3CjpsumUTdx
	T2m5kQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj1119yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3538430a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070213; x=1790675013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=;
        b=QtHMWSYCgD7NSitqz6/U/QsTVSK9difYt4MWFeGBJs0TL5fp5hxNsLauBc29sK/mgj
         RW0EZF8RNaUOj1mW9KMwwEKtUTv/Z6bblz6T8PYN1MkwXFPjprdGW/aBbch8EnLjbYpy
         UzdEH/VN3O6pmkr5f1X75nENEDl2r8mSoWBk+0V51Cn/tbheOT8zVLArF6bH/7Y1X344
         Y1E9uST/q5csb+wyQ+ihCeEu7jeQODj1TRdRDB0P1F6v6j3hTM6YQqU3AAE+ab3g2v17
         J2pvQeUvyK6mthtHL2HA9GQ4D2O+7SfMLkHuGMtfedOalPmSsMqVQbqa9XQDAtKWu8k4
         ot8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070213; x=1790675013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=;
        b=MLHNs37y27H6oKqIKR7tMmGCkj/tZsX80yzQYW8dqSE0tqVcCXAfAdNgq0yRj2fc1y
         jPwUtxNRaUkJ6HPxKILUHyDgDaQKHqpofnGjjygsSmykwU8tAdrO0KQO4+gen6N6U9D0
         QR87M5tFWUyD1U1yLcR0RX/w281A2BtmMtCsRXZJkeVxIAR5p6b8G5SkQx0mQ/E4cpoy
         kBF+57/gHqzRkFbZi2DZqoJ4aZA5N3LLukeYOk+FmiYoCOZeVQaVcdNCBs2yzyUF0gw7
         8FEy+tt1WA0lNuJP7IBWwyIgljEgJuOKhl0K+8fC3bARl5sa38qHp296aHKG/so7jVuo
         JBjw==
X-Forwarded-Encrypted: i=1; AKwUvBxaIBuzAM69+iXsGYB04o/2CcMbe8VMj2p+Q54UBhGRlug1LoGBcN1wCG8HFc1U5R405dno2gnnLVhBjHy9@vger.kernel.org
X-Gm-Message-State: AFuF++mDl/pbs6IoOoeR36GqT1s0TwO6727PynziPjk1KusCJKkfTYP9
	02C9nybEMUlMkrow8fGpmb9iGZJVwZpmRdcbHa4mxKtuZWzuAFDoxuHySyssUakqKd6D9zkAp7R
	nrvreN58hKeszNeI1VbXDAf3SXnnbJIgBV8ofDTCGVAyOGMWVivU5SvATNnwhn0yAhOjn
X-Gm-Gg: AYBFou1sHDdfm+qpDJf/vLSeCoorH35UC32Ci44rQ10LnoAJRR8MFfpe98Hz0mzQV2I
	77wKgz6FLpWAh4PiFbup6R5yREYsa/U71vK4GhB9SwoWwXS2joQT15dxYli+ud/vjZDF8mO1iSv
	yVUUFkExQSBx2Q21XESK+Ai6mgpnXAqU5iGWcZTrUejF4q4WYpc15O7b4isCOos508xLLoJ5E/9
	2MI0EMzj76X4SBmGL/0DNQ1JnZeQR9jU8Zyx5MR2HLUg0V3xCs1NjTB2Bwqz9RaSba7+0axswll
	+wZu17f/PVv0LRaXJJDNPV1OIRaMMc+Tny+tgipGUfujA/iMxmIMQAPt5t//ClaicTUIWQHuuLe
	+XtuUWcLnY6rTeKg/XGUVbQea/BXOBz3w9Ns=
X-Received: by 2002:a05:6a20:6a08:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3ddec857475mr693834637.80.1790070212609;
        Tue, 22 Sep 2026 02:43:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3ddec857475mr693801637.80.1790070212131;
        Tue, 22 Sep 2026 02:43:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:32 +0530
Subject: [PATCH v4 3/8] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=4188;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=qsXF0dZevHujgAyvXlegqZLisSzLQyqTMPlbdzLNVYA=;
 b=CR2OZjP/DnyqjCZK9W4iOwqxNRHhzEYUe6J8f8YmsLpULfFI1vvL1z3TRy2KqgHGayJk7F5Dr
 rpUQv3YHC9eDVB8zKRZEIwLYNdFNHI+DVPlvfsc2nvv/cbg11IRBEr0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: E-v7IQ0P8VKNXzU2nexGFrFjOwVqZIaL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXzLGdsGH5e1wd
 vLLbxeDYnY9f1qItRjI9JrGcdk4qiwxIbvJxX4rx3leM95SNXyKtSyaE9G9FTOR6QhOrNW7LvYZ
 4gk0YRVWuKW4PZ+XNHHL3FL5vN8+/hs=
X-Proofpoint-ORIG-GUID: E-v7IQ0P8VKNXzU2nexGFrFjOwVqZIaL
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab24dc5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX0chB25RmzcC5
 k6ctWxscDRQ8vPNcu/Pre9IFGGE4tmlmpd052prokh5SuPHy+c9PQe+vb5xCPKcEbJuZaIEtuq5
 EuQkelRp+2CLzjGV1IiGZfcZxTo58wNiqRudmCEVM42hrJc8thJI73dpU4tqiovB0uEfFpVb867
 81QR/9dsko4msyv9Cjn8k94NOFUbcVP5KDhQAUKduSZPYolDYs233lp8LIi9sr7sjIHWU6+9JxQ
 l4e42Q1/DHcFHPT3j0ZHDnuDXCsdIl6hsiVuabgFTzoA2fr9F7MZLGOuZOXxBVDvC4QuGgs9Shi
 8lRaS7v57/0PTEkeAjLTC1re4TByNl1tzIz3BDoBNRiHodvkoazdYOOM0ZtqAQAgyZ5xsX270Rt
 z+wqtqlhjAbv/vszIE2lRFX5WM3IBspyOlNQ5CbcX8VQz8rGlEFh5a7LecrGBXPZTvq9JuYOkFW
 ccwZKitMoRcCYeVSCrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

Add shikra RX macro compatible data and hook it into the LPASS codec
v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e1c4..b52665b11e35 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -30,6 +30,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_1,
 };
 
 struct lpass_macro {
@@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_1:
+		return "v4.1";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c41eb8de6160..93ceee878b78 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -60,6 +60,7 @@
 #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
 #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
 #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
+#define CDC_RX_FS_CNT_BYPASS		BIT(7)
 #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
 #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
 #define CDC_RX_SWR_RESET_MASK		BIT(1)
@@ -652,6 +653,7 @@ struct rx_macro {
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
+	bool fs_cnt_bypass;
 	struct snd_soc_component *component;
 	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
@@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			if (rx->fs_cnt_bypass)
+				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						CDC_RX_FS_CNT_BYPASS);
+
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
+		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_objs(struct reg_default, def_count);
 		if (!reg_defaults)
@@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	},
 	{ }
 };

-- 
2.34.1

