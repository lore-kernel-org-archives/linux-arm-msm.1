Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBBA3BE163
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646899; cv=none; b=UKe4eHIp+xfPB5Gl4pEyg8QYNbs3flSt6qvPgHelpJG6We+U5NNCw3qIzrZICE6uWnlg6cPoyOBD1ElGygmFOPmaNO1K4YOGl549/C/CMl0M88gBah5ahiOLkBXugFfiVLY36TntltbcX2Gh7FSbZg8ZLeOVrQtKv5qOgImdkZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646899; c=relaxed/simple;
	bh=8F7ncVJr8+D4X0wcIsfrKdILXvhgsSXVVg4EjjW9Izw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tUC/dBxvmb4uPE8MjEVMB5aUawKSXYH0iVMkNltmDcAKp4CFSba9ot+CL3SbI8RtgMtVVRrnGYrWtGi9advqkjgyNkVgKXdQYh68Elr6C3El4Z9Av5NwI8jkN9tywjWlVt1fkW63O0/A+GuPoTQjn0yikgvpp5oTlV6lTnjDHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgaA27j3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUqRl0Dp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgaA27j3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUqRl0Dp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPRi72079225
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 15:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lHYrzeSQljh
	SXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=; b=FgaA27j3gnyuIesmZgEXYpCbiEF
	0TcVR4OS4lc60vtPsJlIKA3mNSy0iVnewCO+4Sgi//H5Kk+lp8basBC+JuqopDDf
	7y5Yyba8pfPW/kDQDMceNUzNTzCHjKpw0thtgthp7WXM9s3oYUXV5gNpZrOkFDwG
	EqyiyzwYi4thepbfpsZe1xHaU8LoIpHuQKVn5uI7tgr95DwUbWrPHuqWjxAuwiB4
	FKUHCVPySOSrFvUYvW+frVEgKPBg21JSb0VZH8ymK0RHkceYhfMvh+nIy0QZvTna
	ipI43B7Hjc0+2rVX7CuAdKiwmn+rrC8xXhW012VfiV7sMVMTRNVhERjtFwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2f9nuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 15:41:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e6188d1e51so8291455ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791646896; x=1792251696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHYrzeSQljhSXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=;
        b=BUqRl0Dpotf9bcVaITzvPglraPuQgojs3hwULu4AgTmO8I0gGRBV4FLXoL4ijdju2A
         VvJTBaAYmjUF6F4aqkn/f4apAgniBwLooJLwsywy2rcnGJnI38oOPrn7n85QkasLkgI2
         xQNTtylRWrQKEFd3vTQPhwO/Vwb8R5Whmss0j4r+14hO0L4BGlOgX/E27GVrn8uX6w3a
         DpAuCBZuUGKAF4w9eZ/ooQcpL/IVh93VuV7NXYAeBiq4ETjQDAlBKyUvH6IwCYyB+6hU
         ieAnCa4gDLoAumVMHQyEvuSn2FFE9P8CiNOEPf49p8BodxHltFxwPEnWDMNs5f4c76EJ
         xGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646896; x=1792251696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHYrzeSQljhSXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=;
        b=kXdvokxKHQDm97vvIwlQRhr464hx1hbRqb9D7yfOsx02AWSb6zSDghYvxB7uyq5gmM
         FKKoBmPkITaNSTXvsMEwg7OA3WOM9SM5P27Az3X///c7LEUEb8EHl+7g3++9/U/OQb3J
         tjCbXb3jy/Dgj0E03dl0rKJdXDe2eUkPYcTJIIiR3igSbruX7cHpBzX4P5zFw58NDliz
         nuBoO76SaCjjaGS0UQOVXHN9Ic2XSwOJIAFCz8yBilrW404uOm25ZC7Va7OtlTv6YxO7
         iizSdyRizStnBn5irb0znfqVyf3+cdrf1dUT14KSiMmPNRlUH6I+RKwx14yKFY9oC3RS
         Hj0g==
X-Forwarded-Encrypted: i=1; AKwUvBzoUiEChUFmSU2cswrIeROaytKX9uwCKBu4/duGJd+Sk7LlwWHQC52Ee3Y6+gDoY8wg3sm5tQ+LjQGZZk1R@vger.kernel.org
X-Gm-Message-State: AFq9FYJvqjE7uh4tYiWJV8EFbSJdELU53KmB7dFI118evUah6dZ7X19m
	y/nbPrPwrQCn4PJYAe/1ZKkWzrDwCpgHw/swrSIU8aZQ0xLSAdNihwcyttisUgrjMCo7rFx9gaB
	z22O6CYeCYhV07I5ClqR5IDWAfXkqrotWzJoADm5sdplN3Ew6dfGYfFIGtEitlfO2+3f/
X-Gm-Gg: AYBFou3LvJbTS34iXyFpuwC/Rg9YCz8sLKUysIxxb3w1rEyn+hOkOnyzMUEnOUWQj2+
	tEuQcl9yMWqpH6asiTKHrPTPox1TzFRvCOmVE0UkNI4N2AkuD2kyQaXc4elId9YCARGmjok54JR
	njIGrf9r2r8NI9pc9TueKUyZKuELIZO8z9h+lpkb7AXT3yi/2UGnrxylnnIVHxYdJv/6dFcXIpM
	kva5BJK8Kr+TAcfaXuHj9/gGID66zZCHemu2fVtTevf3G6jB0RrtVVU9PjrsbnwqnOXk+DdMkFr
	TYz+S6lVkSf7opfs45DIjlQnO/3QnaAA9HtGyK+m4Rmarq+A3Xnn3PyiTQrQUdPG3oBwoGonea7
	rWeq9ocDkxvQXafp1AdsifDUPiSIexYODnTvLm4ceLtgRMg+D3w==
X-Received: by 2002:a17:903:324d:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2e84280aef7mr42482385ad.5.1791646895939;
        Sat, 10 Oct 2026 08:41:35 -0700 (PDT)
X-Received: by 2002:a17:903:324d:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2e84280aef7mr42482105ad.5.1791646895337;
        Sat, 10 Oct 2026 08:41:35 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422db284sm23095575ad.68.2026.10.10.08.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:41:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
Date: Sat, 10 Oct 2026 08:41:19 -0700
Message-ID: <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MiBTYWx0ZWRfX0bSI9FLbI7aw
 GQWXc9HjUNkWKv2Y9MT83TVhm+kUGPiFV5Z8ITG2KtmXgCB27OgGsYMx9f0WBHb4htfddXESLXn
 08PqtiiY6rEIz/OnkjrlIiUuoGVrhu0=
X-Proofpoint-GUID: bj-Qi_jqbaximyvTMh78Bj9JJFjpuhhf
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6aca5cb0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lSLAbbbIx1VGLg0Ku8YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MiBTYWx0ZWRfX6hx+EtiNZbGk
 tnHqrEnt+DF/s8WVTByITMjmjWNULODuoeyh5QSSLvbLL4hPJOujAMT4S+xuBpLg1mUeUzSvV5j
 CrzTyBU0JiWKCk7mzDsC4uucDJxHMtc5HWxNk7QnRjEZ0aA9gemS7oF6rb6UA/DH5bpTMN2qQ3E
 tihfp/wxU9dYD0VjPZB3G6kPL9BkrhKuPO4dYSopYf4gN0S+3+MjznNyyu0ClO4MXYzDZAYRjo4
 QfhB4Z4g8pjSTqWBq/X6o6GSArbEkNJLWRgSNdt1wflwFF8KYmWLE1m8bCo+20WAxq10UHZ+rNh
 CY/mX5YoJSlP3HW4g+e4p94HyWCAJ3qxY5xWyGfpXgEd20b2e1oYzCeZmLM7uHXZHaGcc+W+0i6
 mzBey3EpgSlUgCKacA3ZvLkHspoM1WCNltiOzqUpHAPGVvUsNPV/NSLHgSB+CPXnlUijJmJWcUx
 1VQc+abDqOw/pAB9TJg==
X-Proofpoint-ORIG-GUID: bj-Qi_jqbaximyvTMh78Bj9JJFjpuhhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100062

It is a bit more a6xx than a7xx, and this simplifies the next patch.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 168 +++++++++++-----------
 1 file changed, 84 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7319f3ed6968..b44b0fd916aa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -678,6 +678,65 @@ static const struct adreno_reglist a640_gbif[] = {
 	{ },
 };
 
+static const struct adreno_reglist a702_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
+	{}
+};
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -1129,69 +1188,34 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
-	}
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
+		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
+		.fw = {
+			[ADRENO_FW_SQE] = "a702_sqe.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a6xx_gmuwrapper_funcs,
+		.zapfw = "a702_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a702_hwcg,
+			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
+			.gmu_cgc_mode = 0x00020202,
+			.prim_fifo_threshold = 0x0000c000,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 236, 1 },
+			{ 178, 2 },
+			{ 142, 3 },
+		),
+	},
 };
 DECLARE_ADRENO_GPULIST(a6xx);
 
-static const struct adreno_reglist a702_hwcg[] = {
-	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
-	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
-	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
-	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
-	{}
-};
-
 static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
@@ -1454,30 +1478,6 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
-		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
-		.fw = {
-			[ADRENO_FW_SQE] = "a702_sqe.fw",
-		},
-		.gmem = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
-		.funcs = &a6xx_gmuwrapper_funcs,
-		.zapfw = "a702_zap.mbn",
-		.a6xx = &(const struct a6xx_info) {
-			.hwcg = a702_hwcg,
-			.protect = &a650_protect,
-			.gbif_cx = a640_gbif,
-			.gmu_cgc_mode = 0x00020202,
-			.prim_fifo_threshold = 0x0000c000,
-		},
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 236, 1 },
-			{ 178, 2 },
-			{ 142, 3 },
-		),
-	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
 		.family = ADRENO_7XX_GEN1,
 		.fw = {
-- 
2.55.0

