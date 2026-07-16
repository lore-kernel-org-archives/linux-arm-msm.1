Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449235295C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232957; cv=none; b=GI9NKDRfH3i2gtASps8DELVrlWKidCuT60b52XyV20UXpNW/V5xEqzoKFHP4vLBt1PySKXnTHS6B3VAueykreY+momdkdgdauaxXsJl/9E/SL+sZKXJet3i6VysAljK42w/Wr11ooD03C2J6rpsZ+woJC77P5uDe4c3ydT70A+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232957; c=relaxed/simple;
	bh=4N17iOoD/clJzRUe2kNuCYy7t9AE/P684XfMMFUwlW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCuql6MhSDCWH9HBfbnVGOChtooAinhqLrWG9weSlx8S9vPZjSYwLQz17IcudKWxU3+UZs4q50wmwvIgJRHLC4hTgVefGYkyNlweuqeD/tUIq460m6LAFyqSYTaVGAqzc5DpzDkk0C0Rkgy3oLaGMiZsrx8BoWuiRqrIuVVnIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtANqHvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAZvOiBJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtANqHvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAZvOiBJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoW723841503
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DUl9fsdKYPz
	3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=; b=EtANqHvSHD+Sxxh5FUM1BCiNiwe
	recgi0jWCToMWtkvkEVr8aEMn+D/iIzOx8vkBUGWhhTETduGlwIUaNYHYpT/7UaC
	jP4HOD3Dn4HJ2E7gV7mMi5fSzot/y5peZfcWGGpAzmXYrqYZrYZX+2SQ8zlvT0gJ
	aeD3Jqf82npHH88SOTpiycP1scNv1t063v53KNA5FcULiX8yrRcKqirKbbeKX08d
	jvD52Iv6aph/JKkYFagJHD2ALxIcZtSgh9GJWGAAxggil23fJFFQG7YP5xgLP/+M
	TgL6LbDn5rXvWurTG9D6O1A7yyRNcVIx6XnsRBV59oCg0RC2U1SV8U2vYag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u80kgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso4125361b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232954; x=1784837754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUl9fsdKYPz3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=;
        b=IAZvOiBJpXZPv7d1xEGppRHvs6QN0NJnZRsTFBIRq780dupdeAat+LwgfHiEIWrSvM
         L6qmXYbpwRNLFnUDsiNxDAPk7t5LyY3fBkWQ/ANfd7MifhniGDFiYDpmEVa4iuvx0pbJ
         yWaOnKztbwrfkLmPh2qZudodvT3ViM2iD6C5PfQlbKwfVH7rLFhNPFbifJjtYPNWZkYY
         pAxPdMvzP6JWU4E3Ep5Vls+9hQy97sIMHhZXyHtqYeWvDwbqCcuPXVm+UofCmQQb1wfg
         p5FT5ov+ISs2e9Pba0bvV0OQcLtrTcUYFG9oVBYQ+yK76uFpWQmZiclQh9dDe6bQFIL2
         FZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232954; x=1784837754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUl9fsdKYPz3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=;
        b=n9BoftV4Gokgvbhlp+fMRzYAxh//AgzWR+DOPkgftw4pec24qnM3bHlJyQg9XPfI5k
         DL0znF0PaokDARoY98550u8qE1GBxiI7DtCsI085B8VVbLGTctv+1lKY/zz7fUGsEn03
         V6wXBY9SjQMKTzJ3fjvY9nDiSIY1VE4ILqFiuzz5On0kachfg3PPZyIA96PhtEvJWIpv
         VmNPXt9fSh9/aaluoxWPpdmqH97R0BhtTrCmjt8Oe8mTjI/7EbIUbkWvuhOHAcluCEq1
         1GJLzf4IMMP2cEMgEV6teyonwzMYn7D3PQhZoP7ZFvqrXmtqONdfOeFC4g2UA/hZPoCb
         vn+A==
X-Gm-Message-State: AOJu0YzmtxrM/Eusq6txXl+rO8sltFoKRuHwTlAf+DcTgrFoM7bMIvhN
	Obv4l0dZYQaK0RA+b0wYMDPo/n/qzoAm323IokfXCtU/wuT5B2DKo4mof7ArDoLGiV1vA6gN9T7
	bvrTeXXftA3ynQNoAIeXJMOfzwUVjsPhY5WUeGCxX4sgUByQKdhOuj4uxakrtO3Y/smhR
X-Gm-Gg: AfdE7cnlv84YsUUH0SE7c4Q8sojGDcBNIhRlzZJFvWYmrAjyOeMo2sg+FUp311UoZZm
	DBu7cdZmCINmpECRfFhIY4WPudXJwF+922f7dsOBZ+pVbgPOiPo/VABIMJ8KFb7y5CtaLKXMFpr
	BPs6GUOkoUdKBGAzLMwxAlM2JDeLKIXWV01Br+KnTCMKYmzNzeJWmF5b3UYson1Sm70XZXitUIl
	WLL5KBWd20YEaK1miZmW6BJKHCtCZV8UX6SitJRHvKKhMZutx2efiSOYJM8vMFHeSpe3+lLCa/M
	tUzm/+4/0l7krlOGWsQGBlYRhe6L0cGdxsBaq3lkI+iAuNiG6f1fS4H58X6sURGZMcltmialfrj
	fn0M8T8FEPflfXz3nxisgiv99wqzK4kHZcx1LAcme9rGx8OA=
X-Received: by 2002:a05:6a00:ac83:b0:848:7fea:93aa with SMTP id d2e1a72fcca58-84c238c499amr731505b3a.21.1784232954283;
        Thu, 16 Jul 2026 13:15:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac83:b0:848:7fea:93aa with SMTP id d2e1a72fcca58-84c238c499amr731468b3a.21.1784232953869;
        Thu, 16 Jul 2026 13:15:53 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5c699440sm4290243b3a.34.2026.07.16.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:53 -0700 (PDT)
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
Subject: [PATCH v5 04/10] drm/msm/a6xx: Access VM directly in submit path
Date: Thu, 16 Jul 2026 13:15:27 -0700
Message-ID: <20260716201538.365824-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX+CZyt4wBCH8Z
 BIqdIeA9pgCnmGMvjtebYRAHdmVD7UwLouMlE/+w7pfiBx4LSCpN9FbSkelGcrbQpCYlOahpzQC
 BD4K1sKHI2QVWmI3Csfjz+2sEHETcQ0ElBXwwtx5fWjussAnINmS6R1zyDDojRLLETFZHC1/+WA
 6v9dviGygfbKtEg3yUj5FXV2ZDwzkLC6x1timr6yxHujhDaadSDwtXH6RW5CWyDPoLhrV9+8RRa
 IyUEFqgnAzkDD6U5712wF7bTX43UJNJSNeFKeYYltACSh/Eu6LfYj4zgcmSXXzWLj9yl7dkP6RK
 cHFn0UYsd1Iv5nrAx8pdo5tUgt8x43cF5Pxc3UXoJCIpqBEje4hs8GYrcdZt2IJmyIhm8G3sdLR
 NfsHArX5Hn44ym+3PmwDdpHliftfi/EchsaHIBMrsxLKtWdyvwQa4VCbyxQQntdTQmqda1S2MlB
 0vyEK2SeLRPMWup3rYQ==
X-Proofpoint-ORIG-GUID: asCpFsrnv-2Fy4DZZ8mtdTtalIDsnu6d
X-Proofpoint-GUID: asCpFsrnv-2Fy4DZZ8mtdTtalIDsnu6d
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a593bfa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QS8Fz2UHHwPDOV3g--wA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX+tpZKw9FYHAu
 qnTzQhiWfIyvlcXj6cIti4tUK1mR1vxu3Gl3X4pGdm8Dzm4JCPyaImeusACplR5V966WFXpmIKg
 JGAIGGXkPvoIwGBNWJJp3uHasEgwdno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

The GEM_SUBMIT ioctl has already ensured that the VM is created, so we
aren't expecting to lazily create the VM this deep into the ioctl.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..7f1673163f67 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -229,7 +229,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 {
 	bool sysprof = msm_gpu_sysprof_no_perfcntr_zap(&a6xx_gpu->base.base);
 	struct msm_context *ctx = submit->queue->ctx;
-	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
+	struct drm_gpuvm *vm = ctx->vm;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
-- 
2.55.0

