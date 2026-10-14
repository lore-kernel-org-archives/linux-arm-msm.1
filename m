Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6714DF4C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969250; cv=none; b=hstZgAsoH6cDU58NGlVii6fHkK7E4sqz7q9oKXl/WUWeaeN4xUxkVlvexOS7oRnqwBcf0+DQuNo3b7XLIOD5f+GzmgAk0+HQeQKwjJczWMdJHzQFZkLJzkZ9sDrsUlbeGz3jDroWL9IzkON2b4bJa0sIDdAsuPbOtxcT/5Xv6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969250; c=relaxed/simple;
	bh=sdJImY2kBB9tU0sh1ZYyAOZP5VPS8woIDnVxrZx+Xnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTO6yTVWUUbmXgpo6m6U7vD3esO9q9D1/vOZFNT3PAgqB1w/4UvK983AqvifmuTgQ+Yq8dLXc5FO4Mcb1LKo/L2x//z9LQ67UZfgPwdRYoXPlN8NjKFiyDeyB/wXJSkMDtli61oM/8Uw2QHAg6z4j8ZdKuLiBjFcxwmJk5f0W/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqnocRkz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHTOCm6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqnocRkz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHTOCm6P"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6d8Vb2087981
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQKQ2gf6Bggo1WTX6z8XfoFXBZQFh0q9Ms7wN3xZT7o=; b=NqnocRkzF6tPLLGF
	W59HMC6/BdSL+gKlm2gZvyz1L2XuBIC0jpT8k8Dnk7cRKoNQtgstxM7kC5RC6r3e
	LKVPGWckG89qtn46KY9KCHiW+BEgRR7w/zvPrRxcwRYBkIYHyb9vJbfm8UgAu/eP
	e0S6jxLelvukSA5FYtsXPuhWsykBrwG9TPt9ynDLbsLFhtZaNSAJP1rWOE5Jq4pb
	WG3Cq7wuTuE8sisKq4rOWRP6+Nmq5JgemsnfhGwbC8Jrk4CgFTA9jrPGFcFGMCSL
	SYvxqhcY+DqAzE2i/0jr+JFt720kcCpmcq1D3FAUEfVgLGQ+AVNeXZHcg9hsM8Ha
	IDJKvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49j2au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:14:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e85f74c21aso30639315ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969245; x=1792574045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQKQ2gf6Bggo1WTX6z8XfoFXBZQFh0q9Ms7wN3xZT7o=;
        b=EHTOCm6P3w+/u5GjO2Pze/Fs3aGTQV94ryrt/RPV/kw4ys1UE15+qJ+8p1x3tk74QJ
         QE/uxg+QLkbXgF0DK39qIUfYpIVHT+POHo/6u2Z4O9lQD4JqI457vmwO+97Z/qmUaiaV
         saHEvP6LEE9sXw9Qai92tk0WTm/nvZtoW6D5L3hyEcolmISAgtXbKQ/lALTfhxHNpPGz
         oa+kY387d8ZW0F7Mh5yf2ZPxOedcU83bU0EHerRCk29NVUWTi8NFkElRyAC3AvR/q7Wh
         fED73xvuA1K1ZcPG1QZPEwmQlneXnvJ+9E8wxg3xpkLht1nkVz3GdjtJt6qWhLWbM+kC
         se1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969245; x=1792574045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQKQ2gf6Bggo1WTX6z8XfoFXBZQFh0q9Ms7wN3xZT7o=;
        b=Fy7nxw28aOjnytZakyiFUnliU1N41vSk3incY9bYRf2qUtC2u5UirQflzMQT7JKbIT
         yrsWmg9/i078iU8Nr3WTRAA3f7m/Q82MSiUQGHpuvsIk3qmL6tTQ6keWPnGI5S6WpMzB
         5PdM0LDy9uOpbt3he/G7AvnofS4NCROxY83t2tqI5GH3WaxRSeBXyQVKQOj0yPzW7ze5
         iwp7zaZUZhO+DmVto0B6HGnc05N+SQBIbH8sHEMr/AbmL0T1hUMGAqEbQbtapYZ+NyZp
         /oF4LSUSxOjvOQGMzc5BqsZnKZJyGtNXl4af1dmUWOXB0WTYZ5APJh43Md3o+oqRlqdP
         GISw==
X-Forwarded-Encrypted: i=1; AKwUvBycHtYG2LNnEWLISkJACfWmP7JxlBnW7rbx4lASwaUq0w8rFIOdpp0KWNIMpkC4GpDLqjpfh4shfFm8cbZd@vger.kernel.org
X-Gm-Message-State: AFq9FYIe2t3FXplhHGBosORqyGqA6eGNo4Y870MNX2bwQu5oSC2WtP0O
	AVjPoDUz7fO48NINDXcUFSt1SBf8yR6M02Kt4RQJRNT3z++4kszuDu7cM/3RgYp3lacp23zXez9
	Hw8kvD/dFTn1IUGOe7/yRGDTSSkH4t5tDfJ+QDdapXi6Ow1SAW2nLU5SWuQ5ermbIbWI8
X-Gm-Gg: AYBFou3BlkUq6Ay+OItM8a6ZdRU3NslbD//e5YZU1VAn4yT6dkYWgez73bMGeyK1k0q
	PzdfvIq/T3862NI/Ou9Sk9xRyoM/h0c55+ZyntOXMRovQAqoreMQLkgWKKQLGHRY9BnH1JZEkQb
	M4P6ZZzXLfnFi2XGuIkFoJT/RCtnK+b0G5P2aB9sgYvy54B7KyU8FX2j3BKmbuztx0FAxXaMa+5
	ZzLS2BmcmuoSZ+o2hOnwFWKwRi7czMI12kjc29I77PzS0lgcgKGvX/7kf8eG9MgLVdsXEhFG1En
	O0dUAwaT1+GQyrvakXuUdfJYCUd2J4KfQYHEQiyZ27uRevqlj4DdOpmGDKdSWw2RsWFkR7+H2ZL
	73ZS6QyKgXy6Q0LgbjCVlPx2xHiuMHQdKrHE=
X-Received: by 2002:a17:902:e543:b0:2df:98a1:d0a7 with SMTP id d9443c01a7336-2e84053c728mr108026865ad.33.1791969244882;
        Wed, 14 Oct 2026 02:14:04 -0700 (PDT)
X-Received: by 2002:a17:902:e543:b0:2df:98a1:d0a7 with SMTP id d9443c01a7336-2e84053c728mr108026515ad.33.1791969244345;
        Wed, 14 Oct 2026 02:14:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:49 +0530
Subject: [PATCH v5 3/9] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-3-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=4239;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=sdJImY2kBB9tU0sh1ZYyAOZP5VPS8woIDnVxrZx+Xnk=;
 b=Cd3qJHylMANBN1TC7npnDFTfzEetFQ+VyNIfBZC5MIiZmpTMkKc7EmGhPugTT17cGH0TDPjj1
 S2MOsiwtvggC8SXmedGTXj4uGb2tQjfueu9uWQ11N89DtQ/VMhi8v6V
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf47dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXxXLMFqLcKEIL
 SGV0bUUHqXXN06Iax+T0o2ctgYA4l+sWVZzm3JlUVE3Chy5hB1wsE1ZzTuJ2woerOsNcaCDQ0Dp
 RHuIwcaiCVUH3Nc1Uql6JWmAdZouJ2QEd38AgkUMUuyyArwdCpe3JOAh6kEsk1aD3kq7A06BOaA
 aV4LxYM5Hjo+F9ulXDTATYhma5l+MHExjBk+Eqz798Af3O0grfGDRkIRJSmS2VZuYgidqnFydi1
 XkEAF20qub6IMZY/42TJ4Ibe7yochyzZUGkVlG72ZR0tW+GhF/pNoIhD33Z9EUa4NKd6b5k11yH
 uBzHNs5R/mZMgMtmI/xW4uNSlzjavDRhbPRAs7YRnVtqH4G2YgbxMMfr+766f1i/LKGP23U3ZuD
 jCge/KCVcYFvco/B3SB/FfnABriX9Wv3q2bER9hQ/tggLDL8i0t1Kq2hy453JSgUCelcvWNaVzt
 xp/Pd9Pc3UQb3VGS4ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX/8DeeCzU3UoX
 BZ5T/kKCJR2ozXY/2x+gMO1OhMWFO1NQ5noWCxGBdopO7Er+/3CiA/Fjku/+eFmDN+BmRf9Gcet
 NWZUNYeJJ/5e1WWHvluTTklBT3pVI68=
X-Proofpoint-GUID: D74Bynu9hFWIFzQy4i9vuK7b7RJswwTh
X-Proofpoint-ORIG-GUID: D74Bynu9hFWIFzQy4i9vuK7b7RJswwTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

Add shikra RX macro compatible data and hook it into the LPASS codec
v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e..b52665b11 100644
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
index c41eb8de6..93ceee878 100644
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

