Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460122045AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232957; cv=none; b=A6TOOOSq5K+hqcd0c4hHvzYn/7knHEY8zMNEMi1LvK5Xn8NsPqeLjViiL+jkN94LavPUsGJVD0+O86MBpQCvVyGp94buJ/px+SFs/3xEd7wWdEqZI5QIiW1VtV/itV5ktsGadPqoHSN6ABoHAkl5F+yP/nydng5JvY29m2oChWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232957; c=relaxed/simple;
	bh=haNJTpsgx0TlfqzWawzbQIaFPz/UgQjWPCitxeNqB0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV4UCnhHdNLjNfa41WvrRH4hOohsJ26bzZEHPMcY5Y19SlXBiK3EXVkpMYcCFtC874OK11uR6RPbu32HsKEp1GpDb+WjndHlx4EuuV7w2ryetFN9iqfOeW7qaEgHbqzdWe1CyQltWfv0GVzPjTV8/PFoz5v68OUIDM/DzSMH//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hF2Za22D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXTxcVDt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hF2Za22D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXTxcVDt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJqOeJ3853483
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mmTWztalT6h
	ryopRPQtckYmk1TcKP24H1NmDD4Vro7c=; b=hF2Za22DHpjLJxSlXR3pOV+0nlJ
	CTYSTNk4kovuw+27nQ7r7V+SMur652gblaBaxhNdMdnJNmGmySLgDR/4LrfwlLbQ
	eqKEXKKwOWBYZoO1E49pk0R/bzGXleN/gX2SMOdh1yzJb/sFV37Hqzw2b7y7+ztT
	xL6rYCJac+ap7zfxxG77/NNxrDMg03I3asPx3cBMN+OKH6DHt45fRVdOpNlwSd35
	wuWcOd70vqxZFT18AcCjsbrCN3jHRxkP7SfSNJoNLBTz6MNnZW55XDvHFgQMsnzH
	MR9p1u3AfCU3IGBTrw5QmWowBFRIrG6kIy79EXAYaHUAv8v5LvhS2EgvB2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym19y0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2632494a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232953; x=1784837753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmTWztalT6hryopRPQtckYmk1TcKP24H1NmDD4Vro7c=;
        b=WXTxcVDtOxXToJQS2Cv+Nq9Zx6hwcFEMc8aUa4fd8J7bBQwobl4vFCchLNgdobWk2U
         38+aP6+lMbC4QxgLQQhNKxcBCdXo8jPSJT4j8ix9itBphg2hUbBcSa8M8PanKaRE4cXL
         c7SRQwkunIe9nJGdq9Yz9iSFUwgwWTanITzXKHdh7PRwo+Yes99t8u7q7v7QNU+Q7+rv
         Pp1jOhRPhDMfirw7DtLTW2nVTLkPBH5UvnBrmydh5IDvYlDzYZRHbYv05bSOcPO/kVY4
         q+UtwZM6YIRsW3c5Z2Y7PU/Rgu4NGR9tSPiPP1q6X+lBLRvPN2ke5zvmPXL78x6hmf2U
         oNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232953; x=1784837753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmTWztalT6hryopRPQtckYmk1TcKP24H1NmDD4Vro7c=;
        b=UPlhTB24D/F1huyDwYthvaGCxj8izoQTyBRVt0W+c0/8fZbIsRsBrBBTWtJw6JgZra
         zxuFQKZlWGp6yKL2TwDKlLmNg+Wc0QcmA6uw5LwhLp0gqwD5YOPmMfr1Dp0AXvpilBvS
         z7jXVReZKZuJA7/bvW4WA2IFBz0fRJTqigTqTJkGhe1efvDQVG8IenHVkC3Mto/X97a1
         dzk+pdXY0lSPgMrCM4bznPqnEBjy3d8gTfNrGcD4RrzIvRrob0pDagdBy8EVer/yto8g
         Ju76qhGIkcTkl0dK7reusB1O68kvRwex3c2vMHsNfWC20EI/RBBEawxGDErKl6mHMPsl
         QTyQ==
X-Gm-Message-State: AOJu0YzV8gNxzrZy12+/FSnq9+3Z0diEcyxbuC4Wnff9/Kw3hUDXUeFO
	Aqji01cg1aAFJMlzqF7QbNEfpVLuXrUuGUdeW8PMkH5X4+yW6R7RoPvneHpzYKqsLF4d2ieK0nI
	3+kZ4Yt18JdqQrlV8Jz8TYeDt9bZjbKI6UUbM+syrubRqr6ei2qcu5nx635b+uTdajwk5
X-Gm-Gg: AfdE7ckddFxbv6BrDepO6446sOSozHxtuU54/MyU1pXVNaNLWdD7QP51uydpIlBDVAx
	9DglwiLDDZ327rIf2sSYPO7unlXibYuHFhDwhG7dzVuyqlJr4M1KJbi4v9pP0heUdUJqCd9fclQ
	hDYpO0Qt9zoLKg7Qfcd+Yvfmj0E7imCqfzxz/ySIGXFU2QDJeKG1QrGBVXP5XLPy9MRwqNHbkvF
	a5NQF+kZaishzQx+aVAbtp3AndYo3PjnCUOGC8HB5ch5pt2l474YWGoxpYywSYb1sL0LryfrY2V
	T9s+qccCEVvtyFqCFju2BS0zy8negvncyI3IOaYExub0RknbZoiFglMhGN04lWEqE0Ls7Wb48NN
	c3CEVxvbqqjsFQtXRISSh/EI1YSLjgMfv3+Qc6QPFWEhJQco=
X-Received: by 2002:a17:90b:3a4b:b0:387:e0cb:7f5 with SMTP id 98e67ed59e1d1-38e17fab248mr14071711a91.41.1784232953034;
        Thu, 16 Jul 2026 13:15:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3a4b:b0:387:e0cb:7f5 with SMTP id 98e67ed59e1d1-38e17fab248mr14071670a91.41.1784232952484;
        Thu, 16 Jul 2026 13:15:52 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0d7a5bsm1826785a91.9.2026.07.16.13.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 03/10] drm/msm: Synchronize VM creation on ctxlock
Date: Thu, 16 Jul 2026 13:15:26 -0700
Message-ID: <20260716201538.365824-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
References: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a593bfa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Hu6Oc1eQfK70imYNBQsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX1BFDe7Be4AJt
 ITLDPkt+JvuShmn0HJzpuYAPGYLPe+TVM/o2i9n8tzDof8qqIAznSrKY/9FELaaYeaFRl4+gtzb
 jNjDxV+YP5RTOzUn2YsLkwG+7YD494MF5RT+ui+1PI1L6w70GeD6tXUUcR7WaNwT0pG/yJqB7hk
 hfulpT67okLZ/nVRBn2GRBOltcxlWVN590HSKx9TBWFGX3QjqR9ByQaAbNDkx3+vkg5sQhyQ8WM
 1hjzqxoBBzXos3j0sRrYregKIUxNBUrE6RTHBdqJUYK5M1BFZV/rSNYRBRFO25+YBHkn3+8BlYW
 jWMo8HSTXQSEhou1ma78HUOiSPu7Psg0kZu5BQgaplxLOLLzN5NwxEWM40fa5oPw9OklhXm+9EM
 PW43S0Yep3tV1vJI5PgKppVGY04S2REFa2bXTvfPMw0/5VNzLsfQjx3uyG+yOoqDDLAXXeBjvCH
 ytwdnbuCSU/NmZMYZRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfXzgRmki8/zB5o
 qmJZQ2cqF0adLFYdJoIGFrvZT9UqY+Rm/tbpuxPs4RCV/FWQH97N+byy0kmBj4Nrn7jiiVw/eJD
 lrt0MzqlJJBVfjIlfTTFoOuUg1ETmfM=
X-Proofpoint-GUID: VFg-H3eV5q1PfPvv_x0P9f9Jr4H7vozr
X-Proofpoint-ORIG-GUID: VFg-H3eV5q1PfPvv_x0P9f9Jr4H7vozr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160206

And serialize setting EN_VM_BIND against VM creation.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 ++++-
 drivers/gpu/drm/msm/msm_drv.c           | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..0d54141ff089 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -503,7 +503,9 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		if (!perfmon_capable())
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
-	case MSM_PARAM_EN_VM_BIND:
+	case MSM_PARAM_EN_VM_BIND: {
+		guard(rwsem_read)(&ctx->ctxlock);
+
 		/* We can only support VM_BIND with per-process pgtables: */
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
@@ -518,6 +520,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		ctx->userspace_managed_vm = value;
 
 		return 0;
+	}
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 384f32f4d0c2..2fd1b717d8e6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -222,7 +222,6 @@ static void load_gpu(struct drm_device *dev)
  */
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
 {
-	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_gpuvm *vm = smp_load_acquire(&ctx->vm);
 
@@ -230,7 +229,7 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 	if (vm)
 		return vm;
 
-	guard(mutex)(&init_lock);
+	guard(rwsem_write)(&ctx->ctxlock);
 
 	if (!ctx->vm) {
 		vm = msm_gpu_create_private_vm(
-- 
2.55.0

