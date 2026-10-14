Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00D4EB872
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969286; cv=none; b=qsZAzTM0H/vmxoFpUh6hJmA+EYnHGn6YgJDEytcQqFG0hU231NgFX5V0bLaqJfXYXbEy+2ltmtUTh/v1kibqQ6tbc6hHH1viAoSL4Z0vfpND6VvmsNhjcbasFbzPRFrVkW0KROz/8vwWEhI666by/dD1Jv9qrjybmL1B5kqg23k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969286; c=relaxed/simple;
	bh=l02asWc8j6+hLjU+Da7Xvnl3rhxJD4twDLpSOEejzEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWBk2fH0JtU/i4xGWvtp54kMlbKO5Q0exyijEDk1kdo2lArCcAdlEirzh3Cr/O7/xA4cD+FsTV0rvEeYWCo2tPDPThTNth2BKvEbrrPyLjQDvjKMHVlsUkHBS5hpbupHpnfAkKBAfk7xdhSJN9CiHu4F1twKXJiU1VJWWCTCnik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvHXCifb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXpN1kad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvHXCifb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXpN1kad"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7VIMT2874162
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQKoVo024ah2t6dz9LZgJrw+qbvU9GpIAqsu/Vkuia4=; b=SvHXCifbS5RUT0JV
	XnCqnNmE2BOCPqRS9y808lHhH2D2k58ZxpXK9FHeFQNWLADuvV74Uxc+Dj/NUSEe
	hTJNjz41SWLa6VPES5e6xUTvCTmN78p7ptZAbi5NYK9hvlSZu7e9U3aWqVQaVVkr
	ytdL2LGHEH7S6qmTlNSILMCjOWyUzkOWrHTJhTcYTUl0Vmb2Ra0s1Vd75hTcQGqg
	re6sCfJh+/2P3sCc8hjG9mDNmxzf1YkOPCmi+xlcNo/h/DgRd5Sh3poRtzw9d+Rz
	KLvYsX5eUkVurNE4dFcGibklZb99Y9UR7wwiPYqDXmLZ3p3KvGa8bFr0DSulqBDB
	WZUFaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphhru9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:14:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80f7acc67so40861255ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969274; x=1792574074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQKoVo024ah2t6dz9LZgJrw+qbvU9GpIAqsu/Vkuia4=;
        b=FXpN1kadGumDpDdbqKYN3ThvnVn8JkZRUgUxg0/9QJP4E9FWhyiJtc4LVNokCoQJ8m
         Y4uvvgeJKGmh0MWjYFUZ/opg0K+TM2qCGLMAj7dmnOY2P01nZJND4Ku7PKDLybmQ8z6v
         N2YmjefTiTG2zVMkpnB6CdHvBytz4dGsMyNs9uIpTnS5sG6XfdmXnePFxBTj6CI9SCLy
         /qX3nQRdwbc7sHEgob3VaNeYwfJjZH2kesGxeCt28rhlWQoUXj/DnfzebXvM7I7dS5eN
         QRLTFa6rj7MPzYv5+UB0ZUzRyEam5VmMU/piFQTGutg8O7JoLJQyJEn6orjfrZByS1PL
         t0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969274; x=1792574074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQKoVo024ah2t6dz9LZgJrw+qbvU9GpIAqsu/Vkuia4=;
        b=n7bVkLPdSG+sBrGT1baICn7opPmEm2Tb4TLS7jQN3caCjy0hR2FyX3u2OP6VgIrtfJ
         im4PuulKbFWoAvsJ/Psv8iI7keUTCd/h2H6B6EWDobpNHWIgkYNNq48YDgO2AvKIGQMK
         TK876TSEV1zm9kkCHxtuYi4tDq/Jzfs3WNEbe0ljJmGBXTgrSfSpRFvzfeSU2e+3kYnw
         DuFWmgeHx9iYkfF2hvzamaJdy35PNR+vF1LdIYc1ktZ6vSapCvuXOKQVx9tmNkM5Gco0
         CsGH3evR4T8RyJdbhGyOI8T2uR1MIQGPaO2AHJVvGVIVlvwcGIdOhBOvJl4AUoF+1fXB
         GRZw==
X-Forwarded-Encrypted: i=1; AKwUvBznOpH1nQVJBXIfWCB8dq2i2k0tPaMFrb9O2xW5y3eNIP9cyhuoDW8gvmCCWHA5Ixf5X72R1Nxq64GWj/Mj@vger.kernel.org
X-Gm-Message-State: AFq9FYIdeUHq55gkOj9BFFb7bTw7uLd7ILhcw1YC22yxwdGwNZrYRLeL
	uZM30dTadhdLO8gwfmBo6MJlZtRjtabUoI5ftIEJe+dfoiaKSxlAyeL6jr4zW2VhMfMrWKrrbFX
	VX4tpuOyzSbUu8rBC7HJ6B/PofjDi2Ku84Wkca8NHfQoWLZKPJUllBTdSF9gIquTY64Za
X-Gm-Gg: AYBFou0bhdE12qovk05o3FDHeV92Y3yyq0oU3GWMUl+5pXesID3VuBn5E1foQJIPQuX
	ptYUCpkfqeqHqn8hZcqCySNUT8aLw0a9sV8VdIHhhqGQabqTHTSjFA5ToZ8VtdymdCVPXwobCSq
	pHg4HY1nO56b6Ua30kgnI3WnW8chv/IIRPQm7KP250OeEON96wR6l8paDOYyEfvVu/c6vwOvgNO
	dyQqrG7IbOFY20vXhfCxLS6GuE9IeoNhYlz+CS7UXUIjYab4AvB+GgLbe/758wJLgztJS/bUN07
	jpyGbRrYyfq885r4h0nE/d0xCi1gb+kYJ92nbh7HorYhJV/CZ0TYkYGt1HGyaId8XhYBu+LWY8X
	wxTGZ7UjV/EvOCBVCmguE4nW3JSvQIZzsR7g=
X-Received: by 2002:a17:902:f786:b0:2e2:c28d:ab6b with SMTP id d9443c01a7336-2e84270882amr122601615ad.0.1791969273981;
        Wed, 14 Oct 2026 02:14:33 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2e2:c28d:ab6b with SMTP id d9443c01a7336-2e84270882amr122601305ad.0.1791969273338;
        Wed, 14 Oct 2026 02:14:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:32 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:55 +0530
Subject: [PATCH v5 9/9] ASoC: qcom: lpass: Add support for LPASS codec v4.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-9-fb9f0667e613@oss.qualcomm.com>
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
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=4300;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SdGNI76uwD/Vc/LAF/gdMfMFsUXlmNUJ68p4AN75i9E=;
 b=1zn9O9D66Jr2LF4qRFu9DyzJRP5YWx6ksengMgUkmbt9AyYCsbR42AUtWsuL3txrmijzQpFuU
 79oy6tr+xrZClzih9b9G9OcH5WJmzG2NJdy97d6dAvDn04Hx93W/Xju
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 70G89X5_FHTWn2Lf3L8rFwn3o8vQMWce
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXxtPZR5lgYz10
 lkm+32Tr1C2Sj791xMiVZFvzcx4S6Ud3+8wvN++DngB6lJKUv/6BcN+6kLoXg+Wn8vxwaQYvUfv
 mz5Hx1RLhTg3CZE3NyfhLf9DHOCRQ34=
X-Proofpoint-ORIG-GUID: 70G89X5_FHTWn2Lf3L8rFwn3o8vQMWce
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf47fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Pm4gKVr55SiOJ_VcJFcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX0OyEZiOCcr7T
 SoVWc5hzm2Cz+3VMCdajz0dlr8jZTpzbklwSwzL7ZcBK7txlj/s6Iv317/fWTUbpddsjWoNq+te
 jt1qKJsDWfvnkiTv3FFRSx68xNcwBrI57kqaa+/q6CdJQCjIASo4Uirvh4RoT0HPRtWiB9pFfXa
 i0LRx2yGx6ZR1TOo80dlT4S+KdVHfj2sSZG83bKJ//5yFyhvuXpoJUNwntm8uWFhihPhwYYce38
 6J/x7oN46AtQJ1oeGpOGszwlGPtv2/dCEYsK5dTddG16O+SG6s8n9aHc/Iu+1msyU6+kiRZcEDk
 EWHYjFNacN4i6ePhr8aWIVaWmhmQrIQ/f3cVglEXmsL4L9Ynd52fvJ3P+SNUj+8HwLZmXEw1+Sr
 eIAh9+n1EJGnTklNf/DrDPIwy/dYONa4i1YtienG25RDykNBcHV5mUSezK4SIUD2PwREdD9OJFU
 iDprxaQkcWK0OA0oUiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

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
index 707b22a6b..a51a6012a 100644
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
index 93ceee878..b7c1eff05 100644
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
index cdef2b187..94e3c26e6 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1909,6 +1909,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		}
 	} else if (maj == 4) {
 		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_4_0;
+			break;
 		case 1:
 			version = LPASS_CODEC_VERSION_4_1;
 			break;
@@ -2183,6 +2186,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

