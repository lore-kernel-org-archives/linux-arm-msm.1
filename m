Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968452;
	b=fbdI2byOeOLZiVk7UY7LnejYUFSEy6nX2sKbirak6IVAWkKukdBema7VVPoc6lFMBjkl
	 1fEHAoUxn4wDckKfJVL9l9VhYpSYHYcFMSEKiLp5XvTALw7XSOn/b9WqhN0BxGfTuFYqh
	 Xa6gyMV5dieKHZZTAyJiBWPZvH4+WNFHOPOpLn5OPSSmG9EyCfQm2gR/rAvWfg5WAeTez
	 NH6tapn/73Xy7YQ6FOBHScMHihMLV1LpGoPI2Jr7eXMsUeUcBS74mW3qqsZvKcXFV3o6l
	 gQ6VsKQ8FYFbk7i6fO2eYsV3p4e9m7MmtQq9c7htPjoTohPNBAElOvJ39RS0S+qUTOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=;
	b=VS+1ZjriTN/5OPi6t4Zgx4px3mPCkk2rHyis+eDGqr7PTIQ9ouLzetuaRH9iugn0vJq4
	 sx6XzHKQPPzeMBcnU7DGGj3fUi9tDc+XgVlsLAHp/vW2xDrKNNnockEF2R0rLFcd0D/e2
	 o+c1ryZP7KcJ9bHiDE1oCCIBBSPuClPN/pJn71cBkr5iEMsDLVhLRTte1ET8Sh3pJUemY
	 zUqaRfBjOzPNIOZkswte31YBfYYHoCWcuiZ67sEz/Xohu210aHNzYmADdoe8YQvhnPIDg
	 hdUFrT84slj4EXtNCMEcqf941V09B/PsoP0qQXVccC42rWI5JDBDdUrk2Nfjm857djA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrDQ0Pa3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FqyTzCoB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B2606EE82
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5B2606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrDQ0Pa3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FqyTzCoB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP8rZ3703883
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=; b=YrDQ0Pa3w1BZy+l4
	751Jvbn9b3Ya5kMsporgP92mZAH55F6NalX98/CDS4yFSC5yI7udykDOQI9OAulN
	VpN/DnDc8TLFtNZCVAVBmNntOKcyqTpYZQHb6RC86QKVVadT0O37f57B4FwW4F80
	PHNb65Z8rdHVDRRp78T9KbQdRXfzNxbq/o+Bt6YdYC4Llfpv4QsWIRW+jg2JVnvH
	gYhrQ/1wfuaBLhm3p+r+DCxJHKNva9L2fN0yb2jMxpYOlncqhTod0nss151FwBAE
	7FpM245KJCvPMXcV8zfZDmiCaEUCjG3qPBsSS1ooRX+qRzQaqK+pEqLhHVuiPDsE
	PYrOiQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2ttj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:34:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3700be873ebso406387eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968450; x=1794573250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=;
        b=FqyTzCoBevqQaGethSc4ILZJLd2M2Tf17y/ais3zdsetqFm9UjvSKOQze90bN36Pvy
         hjbliStOuw0TYd5PXUmU43B9lNhkTnrKyJWQRBvO86hgqrsurNa7KxwnSgcEY9HqIdgi
         wWA5YM6oWUIiPr/zLrqRllIi5lW84GEsqE0V9+SaKnLF5oin8Hdum6jjCV6N/vVWX8J6
         MDeDlz7TEtrlUCNNa8LbBEQlw19G2hCugIWjpZnUefBPUFwX2NF3I0ADYqHU6AK9Likm
         zhYyAfdk3TASF2iXrSYz+GGgm9iGR05nwB+cFyK96uv3ZYDPY1sdquLLB3tWIQPpgAnE
         OPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968450; x=1794573250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=;
        b=sG7gL51mAnf7xoCXZ7mky1fZi0cOnvSd75ucDQJZoVk7i9RakKNALXGuxIfcU9bb/Y
         acB6sYeDo0Rnoe6JcYoaIrCKD00/+zZvscqzCu3knATBLydgwl02Z9QCicsIUnsWvlI9
         oyt8jMbCBq5RdTdvV5+AYijiguNpasm9RK0rqxAWsBs34nkfE7MkSJiEVswx36pvTkP9
         UJA56oHU22uWEmRxlaBVc3HEnrkOCCy9Jg66OmLiBhwexc59LN4uN1VBgt99LKH4eIsJ
         l4FO3EaZK1ZAt8LRIp2ix4rmPg8nKZZakOUTMmr0nLQstsV6E8loljNm0AqPXBBzpO4Q
         oW9A==
X-Forwarded-Encrypted: i=1; AL+hErG3UuBiY8mL3de4HruUIvo/9ALKw0ZfIFj4yBwusWRKNlSJrD4jzzhmkuy7DZVukXEekkUp4GJwy8PDfsLk@vger.kernel.org
X-Gm-Message-State: APuU4Z+IxxpI0CIQvnVNNj+45WyDw0DH985sSOsEjr0OSLqqvTGvQSME
	Z/1HkX/QavRyiuNH1yL2qZe9YpHBYJSHPqJ9RURzFA3SXa+TBCCLmDG83qUm01H4jTFX41ee6Ym
	H93VyZNhvSPRDnhS8x6KaepOiDzzx5KL/3p/gSMbSOo7gBRk4W+IPft4aNZKkLwyRdsOM
X-Gm-Gg: AYBFou1UF8OwH2T8OWf1OUhsQvCErx139eSusJRPNYlVWY7v7PfLNC09GVqtmqcWicI
	9zVzRWAk/AWrIcF7y+r6HSJWf888bVBaNokTc5gXxGrCZC2mhAH+NNLKxn0mD4Ixq5/zBXLzOQk
	IVYhdxL1EAqGrwvowYY63XayowXe8FyuFyCX1nqoVRNHZWUxSMw0tVCnPqaccReH/CNmg7kthzx
	ipvcQzK5ZHxcYU+WclZ8egoB9BXLfXeyN/025Z+k7l0GiWPi2PgZTwyxR2gl3JsWCnrIMesgaDK
	sfEyFwIZW7MDbcQfXzrAKyibVF+c0ykN99BrTNbAAJEasSL6GegkDmJzYLyaMuRq7Co2q0ilQtc
	fKVZ7YyaOj75AKf9qCFdRGPI1sVy/GlyxIXabm6QAAxTKBMgPoJ3wE0xTaoxKhZC4vaAakZhDcm
	TGXs0Njkn/
X-Received: by 2002:a05:7300:cf91:b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36f773f0683mr3318454eec.6.1793968449431;
        Fri, 06 Nov 2026 04:34:09 -0800 (PST)
X-Received: by 2002:a05:7300:cf91:b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36f773f0683mr3318402eec.6.1793968448778;
        Fri, 06 Nov 2026 04:34:08 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:34:08 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:08 +0530
Subject: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
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
Message-Id: <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
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
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968395; l=4318;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=0O/KQCzGRUPAuDFWuuYOS9c0YMN/OB+r75xvXVHjAJ4=;
 b=qzlx+BgMzvpuHVRmfrcoSf3x0U48qbH+mrQxTSuIUBcw8QKY7UAeQDEc7gSm+8B2Erm1OZOWN
 E6VUOR+v2G6CUet3zGQOQYWGzLW4CNkyuZ3CaRYb/elc8K420mlwsyx
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX3HqplqVhN1pc
 /JWWAjkQT4QkXqPdLHP8VXkKzDHhbSm7eVawmI6S9l8C8fkOmDkMtSBZFZC9mCV9+hCNoPXJpxC
 tYYJOBrYRXZ/JYlaEH1ERD9uLheY52HZ09OuRTUTL3gBnqZvElrgyoPhCNmCFHwzPI9ueLThU18
 TkK1TBRqs53BnqGM7TdGmGgOoPxtCkLhHAH9grDoYegDH47NCgLvXwzQaE81EOAT3XiQO7m2/bh
 KypkHJqLr42wAMXZFEUNfbRzVM1xAywQASz8GzHsicEtnBg16Ez4CozBkhkDsClUrijZMIGcHy4
 ArLm0DkMiJMHL9Ldc3saP5QJ0Eqlr+N+L6y4bU1yZjk2a+gF9oXJXOZOB889FtYtK6F+uIuRxmB
 NIOraxR/wwTzt6OHzDcNbHU2B2JfNLH3f7oEuXM+eULGwNBlS7o9goMK+7EqPT77IVGIed2rPsV
 oqJEJZM40wK6qekN7KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX5RjN6Qn/YvWL
 /c8TSnArWw86MBZ9utEh07zoRW7bK/mCIfY54iLL3YE27ApcKjHnIy7CDyBw7U4Vtj+6mspqPKg
 AHDovqRXVNsGZ8JOHy1aB0FDN8brzCE=
X-Proofpoint-ORIG-GUID: cqTAPDqbe3fhJQw585noTbuZfeuT4CTi
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aedc942 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Pm4gKVr55SiOJ_VcJFcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cqTAPDqbe3fhJQw585noTbuZfeuT4CTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi and Maili use the LPASS codec v4.0, which the macro drivers do not
yet recognise.

Add LPASS_CODEC_VERSION_4_0 and its "v4.0" version string, and detect it
in the VA macro when the hardware reports major version 4, minor 0.

The RX macro register layout of LPASS codec v4.0 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls,
widgets and register defaults for it. Unlike v4.1, v4.0 does not need
the FS counter bypass or the adaptive filter blocks, so those stay keyed
off v4.1 only.

Add the "qcom,hawi-lpass-rx-macro" and "qcom,hawi-lpass-va-macro"
compatibles, both pointing at the sm8550 match data, so the version is
read back from the hardware at probe.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 5 +++++
 sound/soc/codecs/lpass-va-macro.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 707b22a6bda6..a51a6012a7ec 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -31,6 +31,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_0,
 	LPASS_CODEC_VERSION_4_1,
 };
 
@@ -72,6 +73,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_0:
+		return "v4.0";
 	case LPASS_CODEC_VERSION_4_1:
 		return "v4.1";
 	default:
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 5fe06ce6b960..ab1b0d7c5dd4 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1615,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
@@ -3660,6 +3661,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
@@ -3846,6 +3848,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
@@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,hawi-lpass-rx-macro",
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a11347404058..0f94f445f082 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1901,6 +1901,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		}
 	} else if (maj == 4) {
 		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_4_0;
+			break;
 		case 1:
 			version = LPASS_CODEC_VERSION_4_1;
 			break;
@@ -2175,6 +2178,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

