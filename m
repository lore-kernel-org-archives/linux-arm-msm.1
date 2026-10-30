Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395184;
	b=o7+UdTfBEle+xbGZhd58A0zI3HWlyYBVag3EmdO4FjR/fzYOpSmB8N94ydNyVcfrtKQg
	 Dp0EuzM+iJG59IrMCGSRc+BFKt/fV+9NWrPJIpcer/Fn2xO192+cz9Q0pi66m5EtLrn6C
	 Py3BJhcvhYCxTP0ykK68wBadoaPw0javSv9CeDwEiSy0IvS+uKCbHqFCG5v37+S1W6vYj
	 RplRXz79EZ18fZHd8z/uqa/XEaF2iLiKKipVfhhrPAR3mNEWcF8aul2NReykbfxrFXmXb
	 Dp7U4284s5uY8NhDk3JaZLTtFka2tvFLG6nL3Kl71bsfDCOgvDmTA8N11nSlLHVi7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OuQj5LyMq+haJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=;
	b=YFyZ5L6K/ure62J4vmO6FaqV1XIBG1Mo/jqq6Jhcg1LZgoBORtyyDewV4SAuefokHwJ0
	 PWRE4vlVbWo7bP8Kyo5PwsTJxOofJPLR08Bs+dPCaFINdWXTiRfzZ1BBwY6XFOfMkJ4LT
	 Rg2VskAw4S0FGscHDYzwDl36MG/l4LvjYKYSXmgxpH2+bw31Y6cPZbwxFvWa7M1A6sSne
	 AVuBxCjo3Wfb5wqcuq/wn85FnqeD7AmT9uepnKymkVWyFN3vJ9nX0gQ7yVFAaM9qb8oqw
	 WHHChx9XrYw28xXpkV3vPpG6UWtODCoLdpVkujdpKl0fPQzD/vHSli8dm5mhyoejB5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XtP2/e36";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8Tm6uFp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85E60A2609
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC85E60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XtP2/e36;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8Tm6uFp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULFl461265253
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OuQj5LyMq+h
	aJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=; b=XtP2/e36zDkpHSCmxSv9Y6XXd5t
	ajarRKs2oQS/OOKfJ9a+JYfnh6ver5NQBNqyCkAH68ZQ/82Je5bGYN5H62CShupV
	Z3R63SzNyD5n7w58gO2k8DVcBAqbaFRW6H8skf5tGJu1GmnS5rdIUGRdXVbdhrVZ
	RokiqNQ0FB2HE5TC/uGdGHku5+e6j57nrGxjFvtb4Djgf/GQgwahG3FTbuT0/tf4
	6YGwdM+qgEEjywplrhAx0D9HaTXVSXM1Uw3//9tQFY+09Ciz1rQCQhIut4SEjgn6
	2iPGuiCPFgTi/u5VMdF2YXGFSbUnC1cuz9GLX7MOZPyMmhZIjtqVBjXC3zw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x00166-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e941532594so13050655ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395182; x=1793999982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuQj5LyMq+haJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=;
        b=V8Tm6uFpe5orhhtaTc+gewJ1b//vvmq8OFgAcgSf7h6uke8KkZ2r4rOB2R1FKSHgHC
         ddilZ2EAsQ77SrVTh+bmKmVPUOlhSjTIkdTnODReF3s62xIaGN/ZYjNPOdIg6t/3li4h
         x/MEhiiE4TiXVHpLXgiuj6bE15zUTOHtIuQ5kdF/joEBzcaukXyzWDkPP3MB2k413+yR
         n/+tNKLlLrq/RA89SewXSAvEb5RvKxghCITo3vWtueKYEKoWBNCwOlIOyUScCBvx5+ce
         KyrvXR1ph//4Rt2Mr65ZHFOefra8k5MFox226fSULP+MdA0FznS4QeqBn3Zz4snTobo0
         Z8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395182; x=1793999982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuQj5LyMq+haJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=;
        b=adWhJEZeQIhV1k5EGWCWpv5o9PzkVaX/xKn3avP1ySyzipN7ehlHZx/jtjaMNEiQM6
         uFNMOIrzUXPf5Uw6ECkH85naHVZfW1Sn/30WIGszNnyTkwZoxkXVhdxzjRxA3PLFLjai
         qXBHVk7Z28GHfNQsWcUW0IxWPGfhs8BOShX4Abjd+ldousyPxO/dns49xH3o4c6YlGZw
         /ePufVV0tNgmn2WF8y20B80EKU8lfrSxSvRkDLks7tcGI4A9YElgd3Cbo7163tuz4RIr
         IXKp8wFHXd8tvWnU9K/938Etq/ok3UPJBUn2qzvbss4eawXBZUOCq1eQRbbWHxKc2cr0
         uPLQ==
X-Gm-Message-State: AFq9FYKZ+Xh9Cgb3mx94GzEwmMtJxWYB4CMX6Cyx813vTdUtC08+WHUr
	5QhhW1asvE2CqjbLmWa2x6MSSfqT0lMlmHcajF52geZqMSr0AH3iwqDScDLwEVY1dMR5X5IW0Av
	R4ngXm//MkGeHqRFrGXGjLklj2Ck3DTTYLj7xak43PPNQ77yP8/O+xxh7W3VWJmxVhGbt
X-Gm-Gg: AYBFou1X/7EGb8A5WtZXiL5p6BCY9Cfh6BPYABYBhkPXMVWoe36Im5V8D0CeE49bsVf
	ZZCUb0gUhJQqRkd9LhU0cmklBWht02rpm1ADIo917QDWuLUnOsQkBlR9yxQchgD3CbkYDk568t+
	KW1cwoGTRkdYm3+FkhisBogNcUzH+hSMS3evjpUMb4WQQo1hErVd0rheI5ZlwnsUu+RuDUU//6I
	DJb5hHpEXDMRIgdHNTgHCBPLf7SDzE7pTRGuYg+kp3pLXFJSXh9IwP+TJBHltgzSwj/Q2WsT5d4
	zE0Z+xXyTwshdrOi8/6e9HWqcJTX+D04E/XLTp30wG/QwCuQ9KGDRVlnrmc3VasePmKAU1moVOu
	Xpabo45amdr9AoLiQDnGGxn5X6PONLoC9+1W7TuI0Lr0t9GWbWe3j+zHYYBE3bGbPlfK2qqiIaR
	WDBc4eVag+GuudT+lpcYTZwQ==
X-Received: by 2002:a17:902:f70c:b0:2eb:a1b:e9fd with SMTP id d9443c01a7336-2eb364de4efmr34482155ad.41.1793395182078;
        Fri, 30 Oct 2026 14:19:42 -0700 (PDT)
X-Received: by 2002:a17:902:f70c:b0:2eb:a1b:e9fd with SMTP id d9443c01a7336-2eb364de4efmr34481965ad.41.1793395181706;
        Fri, 30 Oct 2026 14:19:41 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392aa7absm11605155ad.65.2026.10.30.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:40 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 03/19] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Fri, 30 Oct 2026 14:18:05 -0700
Message-ID: <20261030211928.45761-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F9Kc757aST-rUHKyJglsqOk80K_BbAwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXwvJ/rTMrcQ+a
 YhibIxDvWZ88JlqmR6/Zxo5sq3IBb8XGKGOii/k88ewy9e+yFHsScx6NNmc0ZFLofwZpV2TMLIe
 xsZsbOjMSldAMi7dDK9OBqO3og5jAbVt281qbFg12/yUYdHMZoO8KIr6blzVGXbE2jg2fLpwrxX
 K/Bqf5S5m99/49wUHvegUFr7+fwBQ9OHEu9/PKtHpZL3x3OWdZYgQq/B9pKPh/LFMl/fX//MZcG
 YqsT5QCk2ycmdZa/VaeEslNb9A7Pkj5rsnmNJgzWGGhQqY5G+284Yi7OFYy1wfjLdXA3qCmJ+6C
 /J3XSCbwShGaompNwb8dPw1AvRZhFcJ7sVJrfesdaU1zpAibRq1o+smlvICD3BQklR6nXeR8zSM
 PDpTvJKhHzsRXHhNxYUGJN57342X2Dq1tVHw10oInMkHwpVBgp4NfEJ1EyqxphcVTq248ATZYcG
 zbcrtjSr0kWQ3Z8hhFg==
X-Proofpoint-GUID: F9Kc757aST-rUHKyJglsqOk80K_BbAwe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX+RKtKEB9mYL+
 Yb279EhkXPoCMqSpSs7TK2qbYV4RN76781TjozjKwPAuKZrFZctCSudy1qrRX70LkrUQ+Ln8sPg
 YLm0bHR044jmJr/UpNIBXjFoMsDzWEA=
X-Authority-Analysis: v=2.4 cv=FvOQbGrq c=1 sm=1 tr=0 ts=6ae509ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index fb000b79fe2f..2a2ddba6761f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a14379e26fbe..a0983e2ee641 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,13 +16,10 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, u32 val)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 val;
-
-	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
 	if (a6xx_gpu->cached_aperture == val)
 		return;
@@ -32,14 +29,20 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, val);
+
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_raw(gpu, A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe), flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -74,8 +77,10 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_acquire_raw(gpu,
+		A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) |
+		A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice),
+		&flags);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

