Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D0486B86
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159250; cv=none; b=ltoeaQ+DxYz9Tx9hInlmWtwcEXoJ2QtxGPouSWOBSxGsOGarZQieY8tFNR3681fU8m6bMplbpD6bgJIch3tTFnhxYIxaQC/nzbTwlFZW8UIHEPxkx+uRsITkQpVnx+q/uV6XW8Q6dnsN2WsOzrs44l628Qrb8Ln8tNXAQPOyiNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159250; c=relaxed/simple;
	bh=r8Yu5tb0l7jWK4wCyJ4+Ppu+uskbOfyIKW3R4yDaSUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8kpT8O4yjSdbVXrG5dE5onUNkAw0wWNs5z8is+0nORcfFCqDz0ByyKMuH8Jv8uLvIAtC1Uhc8sJqYiqqcEpL/Ee5985Blgpe4O/AvJ2etgQJ5qwsWMA5pZIOxBHhpSbBgBEfuvYJq4LC3ZDP/afbrOxy8u0Lw7mezT1SIwhEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXMWh7I6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3mDLxXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXMWh7I6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3mDLxXY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA31BL3936290
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOjyHEWtGuZjCr/VrUZ6KrtiiGIwDJckbv8O61ITjRs=; b=lXMWh7I6BCc9a1Xg
	OJ+rel88sk7wxqBiynIpx5ySBTcq4DCa9VNhXEU2qJKNLhUfXkABlKoAazX8AeUT
	FrXOy4aovigOqahx/E1Gz29P8/GpE1C0v5VxyWYuX5MZMy85WZrYY8KXb31BDt4a
	tdUQvFp0Af22WmCWF61Tn4KikvYcbdSIN2cslgo9SQ6onkfYO/fzigipkEnUVVc6
	lxm70d2xgcz5kQylT0PS7+/CDH0DZcocvp3EMw83Cy8gIFU5VoPRGQwlOvu4ci4t
	p9szL44+bo2yY6unJHOjNLVzdqlIK0mvOIBPgxVOLLJzpoR1wgDkgMJ4gCb0ysi8
	lI57dA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428t868-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1451383c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159231; x=1790764031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOjyHEWtGuZjCr/VrUZ6KrtiiGIwDJckbv8O61ITjRs=;
        b=A3mDLxXYcV0y7DnQxQQrln+FcJ7X1qcWDEXLTEihuZ4Pt+BxnztvtiH4HONcI4JSOx
         GKR3jBtbS6ZDGHWOI1n/FVhNKcgf+U8KTDYPrKu5JfisJwZyZNVel1hE4Ma4Brbbt5z7
         SyGZusPwmxGlObRGf3oTftx4lR2Z0R/nrfKmWDQYtE7STin3JpTH7sQ8yy1fWdmKqQ/w
         vTPnn+c0f6P1UOrrmJfIg057dWYV2Ia1CKXXNGWtTQa6AiQrWippvsDpghZj+y6C6W3r
         uxPjRgLESpcSY8JG8V89XnjDAfMMnr3gSZaur4hZYjPWudXoGvDTvH9B53JjHiOoW0nH
         ytUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159231; x=1790764031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOjyHEWtGuZjCr/VrUZ6KrtiiGIwDJckbv8O61ITjRs=;
        b=2y7Me6SolDgeirsXZ2Ujj2iEjhjl9a8g6ac/aP6ZUMINUMhszkIcXMVFyj9KQrKD9g
         ptj2k3K50dq7Stj7n5lIYi21xEfp7rQo2cHKsn3DLOYht0jniQNHa4CxQD43OnPnS7qx
         TWZdK5bsFX4HBtqE8xcIksusZiIcz77tAGFNeAM7A62wlaDwSvdvTPqcC/gcUE9K3PDA
         U6sU2nOjEfDm4PT40ntvANSEP9SwpOcwj67p0+tfO3Ovp+6VMbAq3j3O9Dz5O/AIFygn
         avjtPF0taCX0OoCsET4GUnrOTOBok1RF9ATlYgdm3ryPl6Ts9Hvfuko0yiXKJrEi4Rct
         YHIA==
X-Forwarded-Encrypted: i=1; AKwUvBwkIg4NjGkKkkv5pNsLVTdvLU2CJlU80FjM3Yfa2MeQYqEDUVoBMyy3hnb6POoWRCOYr7u/BOS5Mq9s5Hko@vger.kernel.org
X-Gm-Message-State: AFuF++nzkg0uCAfwpPGf/HcCK772IZLXwI5oNGO/LNBIkil3MgVXQ0IV
	lZCVUiy2L854rgGwH2s7mZkvkF38vDO0mg10YDr1KRzyNdMhPgW2uzH1vafUPRa2nMBKKbByvJz
	Re6hZUKnQnVI2J8v/lx7iYqXozJDM1QDKlyQBeg7h+IyVcA2ldP3z5rQC/Ke2LL90nWtZ
X-Gm-Gg: AYBFou03md+pZjxk4joPXboLcDbW6vV0t2IaaUau9MgyHehI0IkMTNplsyzKsbgODAN
	pigZMbHg8rXMgU8EJr4jzmJw1f0VzpZ50TkUfTbWP0vRau2dKF17r46bYxh3Ohqqh+Q/psZjA7r
	tGruDO+tfLSN0XtCj8EpvpW3dcwaeWEdItO3fFNJ8JnB7YtvPbS2LWv2sI+Wfu7bggQ7YIscw7j
	u8SdgIZjd6p0VJPoEu9M75YlThF/G5RDU0Zb96wZDGGPK7yZ8UTkvFX2v6TWGOsKWJ9OqCIOaG9
	/GpzV5VYGZiFzVWHjHxCuKMRU128nIhT0mBDfwjIpgO3K1sLqg/MnCQX+u5mgqeyqhHxti3257o
	hsEb/0U70Rr1ODKWtQhs6jes=
X-Received: by 2002:a05:7022:43:b0:143:5d6f:5532 with SMTP id a92af1059eb24-144f916f3femr3112543c88.40.1790159231133;
        Wed, 23 Sep 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:143:5d6f:5532 with SMTP id a92af1059eb24-144f916f3femr3112479c88.40.1790159230408;
        Wed, 23 Sep 2026 03:27:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:48 +0530
Subject: [PATCH 08/15] drm/msm/a6xx: Send THINMEM config to GMU for A850
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-8-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=3541;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=r8Yu5tb0l7jWK4wCyJ4+Ppu+uskbOfyIKW3R4yDaSUw=;
 b=VQH6iln49RMi+LSqM9cgazdGzSBd4skt8mdl9ONuSZt9VvEUe1p6XhSpuTJAzz9ZTFJvBemuE
 8FiFfOPDfoOBh8eVGmn4TinLbwNbifpPPDG+Yjb+7fAGE0/BSfsYO6R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3a97f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uikLNib5dCET3MXmAjQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: IpLjm9kIMgXLGTajkFWbgO8CPBWTmFy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX10B95QIWRJBH
 bzQI8s+lkDgU4TrD6nubUc3ye2VjM2IWou5HVReRTqG3fBhYnDS8DEJAru0mMqwzbu0tccoWOo7
 HyCGJMZ9r+avbes74pU4uhB9ZqI39u64Gs32i2Go8lJ8KQWbsxOl22n1lzGO0govFChx2bzm58V
 HwTZ22F7M+oVMNpJW7SDf4+zvIL+pmvJAb1AiytMhfjALXbuqPQHaLR2c/kbe3ECjyJrpzZ8j+b
 L//XX1v9QLggkHA9h93bFQH76oMGTXi0ZtfJ9KFpHS4A5NWIy+s0wBOZJodpDZrWfEJE0radS0E
 cQ3NvLoKJeBkbZQW7jpoM4IYSyx2kr7zDbPA49kAl8fV0dlxC49xoxYZhKg1lnFkJm8XXXeCH1Q
 KsoCkxtto/hZZv4vXFtpk/PdHRQSI83PkNf9aNkL9CTc8gPNWu8g4FV9URkxRv/BytCbtJeGuZk
 ydgsIbFYP5+cfOGzq5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX2CIRi48dD+Tk
 dxDdheUlXf4FCa8A2lOLazpzc5t1juy0DwZ0D28wymPN8It7dHswSO1LpNksI9j54hwghVOWmAb
 1NxwqpS+Loi/Hza8Z8kaID3uyI3AMsE=
X-Proofpoint-GUID: IpLjm9kIMgXLGTajkFWbgO8CPBWTmFy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230041

Add HFI support for the GMU THINMEM_CFG feature and provide the
configuration value used by the Adreno 850 GPU in the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h     |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index de576816ec7c..83c6f257f478 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2849,6 +2849,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			.gbif_cx = a850_gbif,
 			.max_slices = 3,
 			.gmu_chipid = 0x80b0100,
+			.thinmem_config = 14,
 			.bcms = (const struct a6xx_bcm[]) {
 				{ .name = "SH0", .buswidth = 32 },
 				{ .name = "MC0", .buswidth = 4 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b50c57f427b4..43273e5f8b5b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -42,6 +42,7 @@ struct cpu_gpu_lock {
  * @hwcg: hw clock gating register sequence
  * @protect: CP_PROTECT settings
  * @pwrup_reglist pwrup reglist for preemption
+ * @thinmem_config: GMU thinmem configuration
  */
 struct a6xx_info {
 	const struct adreno_reglist *hwcg;
@@ -56,6 +57,7 @@ struct a6xx_info {
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
 	const struct a6xx_bcm *bcms;
+	u32 thinmem_config;
 };
 
 struct a6xx_gpu {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 186a73c0b99c..e33a2258e0f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -888,6 +888,27 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+static int a6xx_hfi_send_thinmem_config(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	u32 data;
+	int ret;
+
+	if (!info->thinmem_config)
+		return 0;
+
+	/* Bits [7:4] contain the thinmem_cfg data. */
+	data = FIELD_PREP(GENMASK(7, 4), info->thinmem_config);
+
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_THINMEM_CFG, 1, data);
+	if (ret)
+		DRM_DEV_ERROR(gmu->dev, "Unable to send THINMEM_CFG (%d)\n", ret);
+
+	return ret;
+}
+
 static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_test msg = { 0 };
@@ -993,6 +1014,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_send_thinmem_config(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_send_core_fw_start(gmu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index e10d32ce93e0..5123349a3de6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -244,6 +244,7 @@ struct a6xx_hfi_msg_feature_ctrl {
 #define HFI_FEATURE_TDCVS		30
 #define HFI_FEATURE_DCE			31
 #define HFI_FEATURE_IFF_PCLX		32
+#define HFI_FEATURE_THINMEM_CFG		38
 #define HFI_FEATURE_SOFT_RESET		0x10000001
 #define HFI_FEATURE_DCVS_PROFILE	0x10000002
 #define HFI_FEATURE_FAST_CTX_DESTROY	0x10000003

-- 
2.55.0

