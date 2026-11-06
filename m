Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968420;
	b=zoRtM/9C5cIQ8AJFhdSIJRO4F94666PhUxSXbpEqw3RbCF3BCdEbf0V3lthi3p4aovOf
	 99cGsDL5tM7JTHxJ0jxjDzAqNWQlJEGLyWP0rksiEddA2xNcgsX0sGDYaoAbMRtyPYXAM
	 t95sCSaPt6NXvEMIN2q9/GbKnRHMTVDyTLN4AP/pRA7Jdhb3fi2c5gSrnV/TZ82RyXHE/
	 cKE+w94qmbDKQlsq0Qs4Q6pI61smPQqSuWmLWssJfTlGkNHZZMnoKHYELwcphEh4IeDMv
	 NCSYejiyJc60R0O4n7mb/diXe4GbWmQfsk2YR0+uT51UNfVufTjcEhFm/gJifHSMnsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=;
	b=ALVuMy4tmT5EEWf9LK5eBKKll7PKXDa9pIWMTB5dTtz62JjgzlcjagnU8TPzrY14/Ytj
	 n5Ctptd+0AzoZ31X3AVd2bTg+N4wk4cHVCIS+KYIZFFRvxVAMAYMUbHbQmkG1yJNR/W5o
	 DE1rlFkkIBEZwW9tu2WKIIhxjAiZpF1voi+Nj/iqdkzqV8Fxf7wEd2cb9ZdPi4MKZ+iI6
	 0+aom4GjTgiICDit6Y8yANyuOf0weGQN6Vbjj4/xWt37i0KDNAVwsAagp9si9H63NE5kd
	 tSsb4l5GDnjm7D18VZT4iY+L1++xAHQUos0XnDHRIAUZJ3KiSWu8XpOVXERLVs/ICYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfjAq5So;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLJeojli;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4EC606A332
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4EC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfjAq5So;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLJeojli
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APK5w527298
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=; b=TfjAq5SoLyf2ZMg7
	iuctBYaJFGXit5hQIIsrMFAuI8hrK5t7UigvP0QzrKhvysiuLtpQ8xV+IHv7BTxW
	NkmXcyTMxdrBjU3dH7G1dt3gcyNbcov6jHeWYqXk5USO+0YkSzTsFksq8nsbdld7
	12Bhol25jpnwHArhKAcWQWQFT0gM1CjU+W1C5IxL77BvfWic9dr5eAC9mST2LOp2
	/f5cWRh0WPl6A1P1z6W+ZQv1uC+mzdYyUz7cCZEjC3uPXlQ4G0vBu+6CzjyImQxC
	SilburAoDzY8gMxBi23aMGatNvyY9z/Bs8hkbbxbQ713YIwH7JEc3FhqWgoGQGxW
	7qhMMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ts6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:33:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so749507eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968419; x=1794573219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=;
        b=YLJeojliIoKwM/v1ey8cnCoFFpm2Skpr/RHxdkRY3wmNJ6fmty6sUpHp3erz1VsGkA
         FW+4LyI7Qs29Eyw4+XI7lzsIT/X8Z+0mSROwK3MdBTjzBqxMgIysKDDnTaqEeUkfdrYl
         Jm4KBAiH8AJYizVgvGSYnP+0LvbHmgHmB1eiOJg0zpYOqlA37bccL+ceEdJ6+nbT1uKt
         SZvflluCmKFfjuBMaS4mhIa418XFWxik90GDOY4i3LO2EkJflIP7EzSdE6WfQFeb7SYn
         XbVlGo6+ekBhuU8O5iWkda2w+hfAguVKA/UhxohVILRmKRbkwh+EXV/HnRvUlkfNPJkn
         /OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968419; x=1794573219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=;
        b=J56w1pE+jhte6LPjoU82N5PWLBb3lPA7uzBZUEytoOieDq+yRBU5fzEs1DsIOHVFHg
         jJUqChJfLe8zBs5EkZ3AFKsEXIe2IsCzBHWzjupowYPToyatEnKHLoJH0kt6zRfC1R62
         inoUBXEKiyZXp99Vg8iIi1/WnyXz+bKZDe5lWbExd4Ix+3/dXFNt74+HtfIMDLA1riPt
         v+Ng/yKcX9XJPHbSmWXS37tJcH7V21/6p4FNB8iJwxOxwBAlxL42uvZBIVgyCSU+WIs4
         Z4S+tkjQqYtOXwL6dgfEP6K6Yo7K53wrnoeNp7nRKBYUy3kGNalXHMF0y+JI72MuCTjO
         IhrA==
X-Forwarded-Encrypted: i=1; AL+hErFdDep3EyCeMPN7D1gGXQEwExYAkh2oPWIJIY6qUoeHpofKs1wAm2Gvr0RuiQycdqOrA+/b42sNSlxoRNqP@vger.kernel.org
X-Gm-Message-State: APuU4Z8f9kcNO8pqXqo6oYypdcya2GPZnrjlZnY50ZM9Ua4HSRi2rzw8
	Y0gAmdD/pwL89Pm45UqbhY6Xz4555cPOQy/0yhEqr4O4CW80DcVhwJluRmG1nD+922BL13hoH7J
	ZD/BRkxgQ0HCWbA8w9M5ByAomowzcp6tX6H4w5oKMCKVDiw+U0OKAdCREEtCAwQt5Wuiu
X-Gm-Gg: AYBFou1AT8WdZ9eXZPb1riPuP7eMMNxtE0ie0szxavfAzoieJ2FImzh0nhICsEt/rcE
	nbTi38Wq72xzlSpCQGVI3Fpz5Qa5TKd2KVfh7GaYFJeyOflKojizft4OvPIsPl33xRpmMCZDRBS
	sh4hoLTZO/CsN/SRtA/bcZC0Uth7rp3CY26XovK5zVMYsRKIdjf/Lk6Qw7+wOZwT3HYJdsNqSTX
	2E4XY+3vezuCjxGvIgoFheNBnHX2G+t4fZ0vqASTkAHxkvOcBrjj+zQ1zJnFJLbOBZFtkWmgDnB
	iQYSAI/bdqWOhouQU325oyvAZkXdffbJj0rxiM/QmrXjpTs2fxpNhfU7j/AJqgcVmOSFmW2ajXy
	0XuBG4QYn1lnAt/gY3eE0lDJtzirTuyT0867MwFXBEGfrBQ42JkRYk8I3x86vRBFkz4gjvwMhSO
	NEtbI59JpC
X-Received: by 2002:a05:7301:a2d:b0:369:f182:8e99 with SMTP id 5a478bee46e88-36f780cdc63mr3078388eec.35.1793968418572;
        Fri, 06 Nov 2026 04:33:38 -0800 (PST)
X-Received: by 2002:a05:7301:a2d:b0:369:f182:8e99 with SMTP id 5a478bee46e88-36f780cdc63mr3078335eec.35.1793968417804;
        Fri, 06 Nov 2026 04:33:37 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:36 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:02 +0530
Subject: [PATCH v6 v6 3/9] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-3-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=4251;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=f38ysNY7nGtb5msueYg8TScI4A9s9J5UTjiHIk16+yc=;
 b=1ZPUNXmyShlTKV2aff4z+PrFlMRVT2DHgfOyjqK8XOlPI1LqhBSFyXjFu0V9EXCA3Lbf0XcMn
 gQkJnNf7BezCP7PPJDo8jNKgfuHTPT6KT/YWv5se/CGDcMSYoSRoDbp
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX3UVg7+Bxe5b0
 bOmcg1bZdxaZ0DDb0KgMip/vE0wdebLcVYyg88UTF4tSVrL9+4hoYogJk/y2eegsjvFyO3kive6
 cI250f0M3F9GeYgE4VPxNlsq2oNSfXQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXzMA6sKz2vHZK
 11whT1xrDtPbq6f6vQ73YquCWkVw53XJwBO25+zs9SMdlXfaZQ5mzdN+IsJJ/wrWVLipy788RdW
 Mk/RA6RsCyCJw2gcYqrv5qzVKPmwR7BYnpy8TVsZK1FsFT13wugiLXM66U1FGwzZ8ZdUGH9kxAp
 WdWgPMfQRegMGQYf8QGR7hxbCIruK0Di7/C562pfwDKwCDTsToYi7BS/IU4UrtAhWOhAxKhYz4U
 JGWVZ4WS6Fb9Dmid2hzymJoPfZggmsOyz3PhajYWxHa1IzbEfJz7+JUIf7nnhFQIiQWYzf8a1fx
 Sn7FDdQ5NzNgFbCoN/M/O7KQn0afTzWoVpOkJVy9rWb6Dg/XecXuGkEKQd5XTDV9T7apM+0Fgv3
 PGL6FJkQ+Yupdnea4hP/2+eUY7acFmVZHL2YRkyrd43z6gy8f3SSY53CcAvm/Y5prwP5nDkacuv
 ToxKA2EMkSDU7RTOD0w==
X-Proofpoint-ORIG-GUID: 5HP2VuOnWmvBLsIkKc3Jpxu3kAoBzcy4
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedc923 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 5HP2VuOnWmvBLsIkKc3Jpxu3kAoBzcy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

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
index c59c746fb638..5fe06ce6b960 100644
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

