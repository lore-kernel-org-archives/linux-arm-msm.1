Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EFE4E0B8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284529; cv=none; b=hijGlwnkf0UguRDnRXhuRFLHphkxKL4uxYRS0USP5C7gBQGi84eB3mIUbcmfYjbnovs7DNw35GfkHTSeMF7cW0X9/JekBjgAbrNviRGXJ/8RiNLus4FTabenwNtIjlITSz2hauiw9XW/4omN3hHdQQC4QnJkjkWPtGJ0ggHIfdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284529; c=relaxed/simple;
	bh=e02s4WWH9yTVcdNXW9xvol+o9MtMw5H+b3owIqeQiAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNQtiazPNRNoiSy3EEK5Nu6kvbdkb3jllgxTYrNUEI0Js6P6cK0a1LdDZSVs+w8oqiIAjdt+q9JNny94sZg6ojj5TU+At20BRUsTtM4ZP1/GxSXPRmnhTShWmFNveo7Xmau8r/qXD6bLnF1xbdNdBfTUDztJVXTMWmDYw2yTLeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mz7NdAbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNfHYiCc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mz7NdAbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNfHYiCc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdbce3247790
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJ0xZghxcteqbgqQNa5Ju0bXGRBgVxcsciLwivSYvoE=; b=Mz7NdAbNAlf8h0Co
	k2v4yGHyQJRsvNr/GRswo+5QJlKr2zmQZkeapv6h6BM+47Elrbv7H5Q5wUPOi0CV
	y90QsqIEa0/evXlwgiZKdOc90VIse6kqNgcUHXiihM6CbH4diIV82OGShQ16lO2H
	S3u/TWHG4lXxReyWHHlMu1sNs354jxSsySVhApVZUCaGkVKYKPU+QGrhx8G82tgv
	BT0yC1NWnHd5ICZH4SNpAW8t41OPpPSty6YMjjxW+XXQ6MzOhDPX/2NXclt/4vnf
	xVJ4THoE/Zfrecoc6DWtBZslP3x7xcxppqYbPvnLmrk4WmT+cqBIp2XtKAjMJ3bO
	QkMyTQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881rv4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143803143c4so646947c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284525; x=1790889325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ0xZghxcteqbgqQNa5Ju0bXGRBgVxcsciLwivSYvoE=;
        b=SNfHYiCcL/Xkr8aGBdLG1Wjhd/b75J3+OHc9oY0zjZZYJhW/zt3BHBRyJHPAQIluTY
         kQ/HSq9wqN1kezpixjAyMdtSlOl/XmM3mfjxWvakhYlQZjptzff1v36RiykRnqojw6l5
         fZWt9+GsJJ/FlMnXP06mPWJDWG5HCixoq8gMdALPasjptriEhv06MGWEpzH2e0fPNH+t
         TQwxMAm11IeCwfA3oHdLLOcWjh8Pw0o9qK7Wvt6nyPTb8Y+SLRR5wUsBO/IfNwoSuOpW
         ltyZcQbqgVU4ilAY+iRLAHMaef2eDb5KwGOoAzIw7PlI6jYXlnKE1P73ZB5d3EBc3q1w
         StEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284525; x=1790889325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJ0xZghxcteqbgqQNa5Ju0bXGRBgVxcsciLwivSYvoE=;
        b=LU3jEfw7sp3M+rbQeoHnxJL0nnPJ+13QH6SbOhdB8upxA7wdGV1jJlxEmBFD+ysJyx
         /tzXyxAjenpNxizqVaTd+bvdbFTDT1xJYm180R4UFZJtm9MzJg99WdzjhkJ4r21ShOY0
         URNxS+HxdbpAaVocQ/Ey576HJSzC2yu1oKp6XCu6JWPiSbzBD0Phc1tT/qkdzwG45zKa
         KvFT6YjlvYoaJTxPipwhnNffkdFkkjrTKJRfEyYgQxNPj2DSXUN8ADepK/Ed12KRaFgh
         EPloPT4O0HzJocmgF2VvBkZFen/CNd61YZxYzuMFN/sHuN813uyP7FN+pgJc83PT3ODd
         lj2A==
X-Forwarded-Encrypted: i=1; AKwUvBwXHSuODM+TPOH6G0l4FJNp01qd2f9iLI5v1/+e9lTUqS8mTAf/PP3cxCSjXCGc953SorUoY8DTBfwwHwFp@vger.kernel.org
X-Gm-Message-State: AFuF++mWE7+Qkaf9WkgfwcQhgMHHoW/RQPcHtWMVfsM2D703ICsMALjf
	EH88TVba/b42ruApxumAocpW4eXjZInDBZf7ARsOM8R/JMOxZCB0KM6bROYzPGcxQdg7cwZtGA9
	GE1sCdlQtWJLEYkjpwv+VwMlU1b25gmkLlU6IjCDAeqR9tP09Un/MKQXJs3asXKVyuf2urq6hiv
	TL
X-Gm-Gg: AYBFou1atW86ko01G5APl55624U0Vnkhk+KUyeZcPllDE+h9iCXfCWYqV4+JTs9PzGT
	TKLgoLJTa/22JUfwQsfh373wD4nES29At2c/q0jNsLJTvTsFQJ/ZMKfXenIV6dE61JM7pPfO18z
	5tRCO/E57U2YQcU2LYCJayRTm74EJz7bVQAT/G2DJflbepOoirj1UiWYcC5be3lJ9SceYVgUlxV
	r5LX0cc/KrCFdW/C+zwRvM+4GKnd/6fO8musO8aw9JJg6R+C132G1xfewIwmhmhie5GgAbruzRZ
	NZvade4Ba/oLf5FMDNprUhdyFTG7T4WUkSFXSaET7qhoX60S7K5q3yS9yn5YUuXJGGk4PLssx8K
	863uibXOND10yEhp6IJ8Mb9k=
X-Received: by 2002:a05:701b:4183:10b0:143:271a:3df3 with SMTP id a92af1059eb24-1450403a968mr2967582c88.45.1790284524295;
        Thu, 24 Sep 2026 14:15:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4183:10b0:143:271a:3df3 with SMTP id a92af1059eb24-1450403a968mr2967553c88.45.1790284523639;
        Thu, 24 Sep 2026 14:15:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:23 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:34 +0530
Subject: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=3597;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=I88dKR93qprsU57JQfFiug9aNzx2vTCQK2zznJC5iNU=;
 b=1psEMZuRUs7tbF4UQyIgkdQzaYUKb5r3TO16eJsS2mHei0/EsusvgUpRTNXYMHS/LegWQxYOi
 A/A00OyHanVDzGuLxHDd8SWZF/3mR9HLEhmSEIt7x9ElBifOKeHpu0N
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab592ed cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_hwIf5ch9eKH10-pnQIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX2pqVrjWej5ux
 ff177YS2KkvYMO2z/RCyzfdJop0tZ7KH7UD8m+QEfXZojPiArSZz7mhEgEJgo66K/DDF94Nm/9X
 nzaeVFLJWdNmKa147dbmb1fuekN+F38CtlvH/NIz6Plq19MwAadl45kLnDkOZN8WMBGItW8atCY
 RsBLE0hLwVgHsgUqVYmOqIECzbUjN9sV3JAitwLVKC05//ltEh1g0DVS1bLIYIbvT9L91lkfAGn
 yXfTIFaRjbKDOcSfXmCu30ZlHjhyyxQQGG0JZNt7A5iwDBuTYlST4LB5DGIraO9ea108gD+dni1
 8SEO9K0SrLNITeVxkoVM9d9Q3UUTC7Oa/HA0Dx6/oY3x0k/pxcuCvMfOq63uM+SNmEudAcZEXCP
 z6phhb1AzVkPsErD/GgqGwY6ECNTyATy9nOgaAnIaEBAvfoSEsV8AIHghqPZz//fge8uT/AYpFz
 XphZbyaBJk1lRuwUIkg==
X-Proofpoint-ORIG-GUID: vCTubx3wLD8zZyEdr-5P5vUUiXLjgt5n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXxC1A5dnHwdXR
 Gjiq9ZuGc+9Dc6+TNp2snS9mnJ68JDPwpwMIgRP0Mlzq31szLHXpmJrpFwpi5hthEedr/WDUZWP
 sKjwNGIwWz2icjAlcUD9LisVKJvb2nk=
X-Proofpoint-GUID: vCTubx3wLD8zZyEdr-5P5vUUiXLjgt5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
smaller version of Glymur GPU with fewer slices and smaller internal
memories, but shares the same register layout. Also, the GMU chipid is
different when compared to Glymur's GPU. Add a new catalog entry to
support this GPU.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 42 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 ++++--
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 90a0c7ffb3c8..3f11b16e9a1f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2524,6 +2524,48 @@ static const struct adreno_info a8xx_gpus[] = {
 			{ 242, 1 },
 			{ 221, 2 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x44060000),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+			[ADRENO_FW_AQE] = "gen80100_aqe.fw",
+		},
+		.gmem = 15 * SZ_1M + SZ_512K + SZ_256K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_SOFTFUSE,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &x285_protect,
+			.nonctxt_reglist = x285_nonctxt_regs,
+			.pwrup_reglist = &a840_pwrup_reglist,
+			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
+			.ifpc_reglist = &a840_ifpc_reglist,
+			.gbif_cx = a840_gbif,
+			.max_slices = 3,
+			.gmu_chipid = 0x80a0000,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 388, 1 },
+			{ 357, 2 },
+			{ 284, 3 },
+		),
 	}
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index add93c1fa039..165620d51109 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -200,7 +200,7 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
-	if (adreno_is_x285(adreno_gpu) && state)
+	if (adreno_is_x285_family(adreno_gpu) && state)
 		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
 
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..eb394d9a1d9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -597,9 +597,12 @@ static inline int adreno_is_a810(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x44010000;
 }
 
-static inline int adreno_is_x285(struct adreno_gpu *gpu)
+static inline int adreno_is_x285_family(const struct adreno_gpu *gpu)
 {
-	return gpu->info->chip_ids[0] == 0x44070001;
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->chip_ids[0] == 0x44060000 ||
+	       gpu->info->chip_ids[0] == 0x44070001;
 }
 
 static inline int adreno_is_a840(struct adreno_gpu *gpu)

-- 
2.55.0

