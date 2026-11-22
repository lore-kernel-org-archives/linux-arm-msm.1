Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372929;
	b=hdsiaIMf1+iTxV/h2wME5Eg+29dh2vNwPJ0vGsYCf/Pr5YWhzuSlX9yQfY6S51zJb1KN
	 NrtA8j7JmxeD55VMSb/rhfQjLkv1T+jtRAHPiKyjTlouyi8H4RJr/EWQ4BqlETZ7iQwPb
	 JaMkna4gmT68OMx4TCr2BYJTMGa50mC91bd0FviHx3CFIZ19vEosMNMPnqxRoDCKBlqSL
	 toK+12MFPbAOlp3sbrkhsELY9Df5EJC7MRFO2yGDsUMgdez7X8dBhf2dO5SV9kYxCe+Nj
	 NKHXzjJ5Xd/e8G+DiVoZzcovjLTLNz1nZSN4Y00xV/FoYAP4hiDObXARe3caEjFREsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1Ri13S7vXLNbYPy3fLjTMZ1bWa4NuIHuQ4aqbMG3u6Y=;
	b=ppY52c+nr+UbE/aTCgYCqb7fGVPMi6VECrwWelK5gEDX69YHjijCLZ1ZIoUl+wodIB1E
	 /kEopCqKcuons0M0haEbMxqFhvUKMjnQ51HKas35rpyPlDXn6V1tIjZsiASmsXEx0mT5R
	 0Eaz8/81OY4kAgWYl74afb7tIXhTh5RW5o4iL4/xzo9c6IPfgRbtOhlQayJT4aXO0bSfu
	 ZXeU9srTwoqaq1u+ygPADHP/RJVFyzWgNNAObnikLv0Qb0knRvME6L1MbNivkBsMifKH3
	 sDfvcYBUXhsHPnvwY61oHdfaLoj1DkhKZsOXuvCGvHfKniRnTh7Zp0ycbahjIWEMDKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlKPmWqw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9I24B6Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388E606A335
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0388E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlKPmWqw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9I24B6Y
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUpfZ3985557
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ri13S7vXLNbYPy3fLjTMZ1bWa4NuIHuQ4aqbMG3u6Y=; b=SlKPmWqwq2/F48RW
	XHVa6ySr8fg8/6vj28rmXyrXqoBNbBPkP7UoKnyodnylxQ21Co5hsW9mSpwtkqQd
	CHGD5yK/HxsmwFaNr4jcDuJb8Zq9sZCFyQfbMOekgILXfQ8nGxJjit4+ii8a3cIo
	z/K17mf7z9cNUgPv6i6WXlhC35JNegw/9CfmouJtp6Pjv/IZvdh9PoWnn1dYFM8v
	R+vo0K0FxjIZc35ZShxkNLVPIarCHMxsqK7b4Rl2qRq8UHM5++tTPDl9nJYPO5JI
	dcZFN3A+rBY9KvyV6QyjLp1ZCJVURFGJZz6PEIuTrQkJh/GHRritD0P2MI0digDN
	KIH/jg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu40tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3772800eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372927; x=1795977727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ri13S7vXLNbYPy3fLjTMZ1bWa4NuIHuQ4aqbMG3u6Y=;
        b=L9I24B6YSKA4dRN9r7hfqNcpyhkQ42GVxp/cST0loq0Q7BJtRboVOjRr9Jc95YvL8Q
         IykFcYA5PniQqv3Bgqu3m8svcoNUMNvfj2B47xwnk1cXzkqktvgXDgoXUpa/3oVcDZAj
         kKGqLGltuU7cJjTXvcIuf2RuBHwnFynMn92MI9p6t0+4R/8S3UCBfI7D9KkiuUBjS9ff
         1qExakPoNmjRT5461GR3wUYfkHIYceO+200cDkRfbaw90odnRwFt60U2c9gSeDZr2uR7
         F6rZ4ev9KnwNvmCqWxNzxTEEhkyXEMpbnhNFnuTpOdcgv70du557Z5LHhXf9k40m7suC
         2I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372927; x=1795977727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ri13S7vXLNbYPy3fLjTMZ1bWa4NuIHuQ4aqbMG3u6Y=;
        b=oro9j21OC1HYxI1H5hdUDHU0nOQp/2jz45nXKlacSldNAMDFi+B2CY19PweBXzdqHk
         qP7gG/ACCxjPNaXK60NAJ5k+o40+tcDZwAwsPhYmYpZAyZdmFwyjny58IpH8GDQQeMql
         qYmbsXmpw8pMzc3wm5Z0HHcwkLkR6XKR0g4/GdzqQndA0HGg2h+qZYLh4b4cJ+kyZAI/
         00Zk7EqLr5cf9w4CklagGjGYGAoXvrI9E2MFxIJMU7tzPJ8+/g2TRQh6uA1E7Nb2PVNc
         s0WDQJQ0KptFRY62yV+z85YZRRjjZV8TFkLr38NNQmNBrxtHPRyA9UPDSMBPoq9radyz
         WGHQ==
X-Forwarded-Encrypted: i=1; AL+hErHEHVATkB1cD6lgCx+n751rZX1m75lb8MzISCb88pLOPowwp/e4eZyy5EKeTehX2doq8UpPglG2OrgUK0Fn@vger.kernel.org
X-Gm-Message-State: APuU4Z+/ZqwatPyc3szthU/11PBbqIn5E49GrNZ4uVvVd27y9u1sM2rH
	xoDXxYRLzFVxpNd8qqmgnkkxOdAfjdFuSFa9yaCu8EMfJXoxAbCaQQ4M2QEFeJ5soC/Yn4BKS73
	jGNO79j9TLHzzgmwebIBetVQSDhOZErpaNwxN3kCQ5MDUVrkPUTBPKkdHk53EK6VQZIUU
X-Gm-Gg: AZFdTZf6H3YikVFHzqK/678BQ03R3BK9nKLl/Sq8Trv8euPNeWgbJOTBpBrpjGbMm9q
	AsgyphHhsZnR1pm3mhYFEDyPN3n2tQ/U90VQd2TmqoPPaOiOfJxtJYtroIKwEgmpFjxf3eVbo02
	vj61W938rqEyqNJNW7qfKjf4QaBzmkG/rLxt+s7SkVnzf9pox3hqejdQ3c7gbxiMoe00C7XR5UG
	Gh/RkRUH6AvLRjqPGoVRTukGG6Fe9LKr5tr04AG1eknUhg0JYIQ7TgE9qEjKMjrkBtM7nqUFKGG
	8W2aioGDHmUUKH1b4ioJGzknmGgn9zxLS7iszUVE4VLzEBIfHiJmSy8w54B9EAbWEPtiORA0gvw
	PURPmQC47QYlDjSpnxAloluK+swl2reczianQqnIwVm0GK7slwmiwKlw7JEbC1wum8zPEo0GO/h
	CgykkCZMjvCA==
X-Received: by 2002:a05:7301:6486:b0:378:1191:43ca with SMTP id 5a478bee46e88-3863f1355b2mr6843970eec.18.1795372926906;
        Sun, 22 Nov 2026 10:42:06 -0800 (PST)
X-Received: by 2002:a05:7301:6486:b0:378:1191:43ca with SMTP id 5a478bee46e88-3863f1355b2mr6843939eec.18.1795372926396;
        Sun, 22 Nov 2026 10:42:06 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:06 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:33 +0530
Subject: [PATCH v7 3/9] ASoC: qcom: lpass-rx-macro: Add shikra compatible
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
Message-Id: <20261123-add_shikra_support-v7-3-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=4621;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=7mhieR30L/xiL5xeXVcwKKIjfcaZfWQD52FXRHeuJ0o=;
 b=REKC2Pahj+OpBclnAOl2sF9KL0mIRVRz6uaXRLaLUNGrUnnI+nEtoR7evIBq1KbHbjMRGi2yR
 58C8ImFoeVDAwX4W6mMWkjrDWDpL9i2r89dst33q6nhxIttn4t0OBmk
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: SZhmaHOzZ53SrbjM27Vk4co6ieeMDh29
X-Proofpoint-ORIG-GUID: SZhmaHOzZ53SrbjM27Vk4co6ieeMDh29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX3ZH1OKf19me/
 1iQpKijBGqmWlxOfja/85pVUxnENC5dDPF0z2itMZJ67Zkk1zh2lG8JBE9jBqaapiJAFhCHBX0K
 gvD3rDZc5cn4LITzN1I+aw4KC50HNPfojUPSCaMpb8mLas8B4dFxUm+WGQvAfvZDDWd+kN7nKoL
 y/SzIw0DuaSTD8rzmCPSobKLxQwX6w76i4Xrb4IsnGViOuZhVWGcakPcKPnQ1XHPOMa099anIh/
 zQHvNi7toEReSRma/UUOh/JGQZbEkObCkmH8KXIpQLeL3dpoa1ALlavcrhQumUI7Z3cKuQZDV5O
 cts5uaGAu627cA4AkN4rD7GOlzgySzMobk1so3jZOeoWHI1ZULEE3PElqY4X8+KABxx8HPvglOW
 44QrQan6OVz7Elc9aDff7rIp4VUeZNnZP7lcK2G+uEKQMALqw7tzEN0oCUTv0YHgwJnlIbECtfj
 YPaTgw5cik+10IeQ8bg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03377f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NMmcyecwr9U0xRdsPIcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX0L4cY7vsRswc
 L5tu+CLrACuMOxUQWEDAU9+nS9xyLXoveXGg5L3hgKvWb+sLRz+r5iZZ7gx+QeMpCYkwyXGsnYP
 lnFwZrIpMH+wo3cCN6QQZ/+GMr9W3fE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

Add Shikra RX macro compatible data and hook it into the LPASS
codec v4.0 flow.

The Shikra RX macro register layout matches the existing v2.5+
layout, so reuse the v2.5 register access helpers, controls and
widgets.

For shikra requires the FS counter to be bypassed before enabling
it during MCLK enable.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  5 +++++
 sound/soc/codecs/lpass-rx-macro.c     | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e1c4..77933eb8c4d5 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -10,6 +10,8 @@
 #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
 /* The soundwire block should be internally reset at probe */
 #define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
+/* FS counter control bit[7] must be toggled*/
+#define LPASS_MACRO_FLAG_BYPASS_FS_CONTROL	BIT(2)
 
 enum lpass_version {
 	LPASS_VER_9_0_0,
@@ -30,6 +32,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_0,
 };
 
 struct lpass_macro {
@@ -70,6 +73,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_0:
+		return "v4.0";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 5253ad438188..b3adb32f7d33 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -59,6 +59,7 @@
 #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
 #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
 #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
+#define CDC_RX_FS_CNT_BYPASS		BIT(7)
 #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
 #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
 #define CDC_RX_SWR_RESET_MASK		BIT(1)
@@ -651,6 +652,7 @@ struct rx_macro {
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
+	bool fs_cnt_bypass;
 	struct snd_soc_component *component;
 	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
@@ -1659,6 +1661,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2091,6 +2094,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
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
@@ -3698,6 +3706,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3861,6 +3870,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	rx->codec_version = lpass_macro_get_codec_version();
+	rx->fs_cnt_bypass = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);
 	struct reg_default *reg_defaults __free(kfree) = NULL;
 
 	switch (rx->codec_version) {
@@ -3883,6 +3893,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
@@ -3989,6 +4000,10 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				 LPASS_MACRO_FLAG_BYPASS_FS_CONTROL),
 	},
 	{ }
 };

-- 
2.34.1

