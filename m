Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395182;
	b=yEKoDUFjNfOra9/eGt1T3Q8WOq4F90DxOR5J1FFpj4l6yrGqHwEpnBAbZKUb1wS57FVU
	 +++PNqYT7up6TO3H+TWF6YvLsYsuI7ypG5kCGcLFlA7O3WksgvzmDc9D76JtUkF95kaOd
	 wNu3ZVLg3uUHPwEAMFKbdMBCNQzlI0YZp2O0ukAKR4OE6EaifS16N9vAxJVYHn3QPsjvY
	 59zBBjuYaZcgTHKBtl2BIc01V/wdzj54iSS4QEUeimkWIFltREf8WdkounNa2y504U8e9
	 CXrbeZWOiQxentzNojCsYiPALjiU/HAUeZJUa4qLN7w4ZjFN6ENo6rn2Ev1vFwEpywA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B6OmBv37eHboEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=;
	b=gvhCN6Kl8xkOiTofA1sx9EobhJEglCUQP5Ox+HlO/CXkLi3TxqyvbXG4gMPOc4hQeEt1
	 27vM/sT7q/ofYu8bHMRMMpxigp0ZfNQvltekc8K/uiurDoKSuJp1NZCpWR9oZIPVGYfI/
	 bcviDO7Kvw5EOeUjDo0DSGZ30IOLzjxPTTx3tXnZwppyy3SvaGWlEVaYdjsneLGSsNUxE
	 VzKY37F1ynk3SdYoXtksxucmpxyj0lkKXxQRQ7JfyYb2nD9MLBzJ6tWCb8rQ7Eo2MaRqr
	 oYss4uJ8dHzivISRW+7c47Kh1zJpImFoBWOWK7fMAs2w+NPG+Y1m7sxcffvIjnl2CDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HahJ10wK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LcqaqH+l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29424606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29424606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HahJ10wK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LcqaqH+l
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULBc4K248815
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B6OmBv37eHb
	oEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=; b=HahJ10wKlItNwwuJIt5NekUdnHN
	uj+XDyqH9QgYUL8A3feLWL/Ne3O7n8XNhuvfSy0bJrYh98gQZ38AnNQh+Y7MUVKr
	wd91fTETjHWu0J53Q9EV+6Ib+4od6p6AfwUCMJUZJoD/XDfG7fXN5hELfNIwNP9n
	egzMbRneqD3+A++AwJiiOqItrD5qHRckcgFz6IdK1BsbMSRgJqHVh4nlz3TtCtb8
	tVitXvvP0i6lWHsOIZProSj99iV89WJeITMe0cjbo+hKyH/kUV0J+b1fB5ZO9jrX
	Ffdm9Y00EbLDaNgevhIQIFdHvCgBVf566bPA1+BNUE6iP2bkufvPkSmFgvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so985745a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395180; x=1793999980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6OmBv37eHboEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=;
        b=LcqaqH+lxPYZQQp60qJ7Drik4tGUqPAYNJSCw1/50lvaZ54azlFDqrZZZsqD/qQ3x/
         z3sPqTHfQEH1R8jhh/LbNaJqc9zO1JLs9ZgrFBsMvKzu7PklPo9VQ/N3awG+K9MPDmhM
         4J1rSFrBNYZ1Pce4qf+4bvZ+GNlM58QsCnDEvUnHMgcG9jr03UtMwQSjBzTkmvfxePsA
         yVELKPKVo56WbnALa+dCuysTbOqPzDqCmw6WoTH6lGVAfx3SOw6YzwzLgipBl3FP5gPg
         ShI2ICH5/uc+RKhSKnGBlZ/18ki4bkTWGxr4i7bigEYkHsTEV3KwT1ZkZi2a+5idRUHC
         ndiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395180; x=1793999980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6OmBv37eHboEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=;
        b=14AxEll+QXeqCNKSkJu8CcWdm0s8Ax/Ce7I+8KuaFw6jGsBzSd4bOMKL/7r7Sbglww
         efZThKC7DdjpeDjwUByEwAqGt4Z+EIYFtrzNnaMaQMnU78w7RdsLS6iCLEEj6jEd+Z50
         A1IY/alXDIZkHIwAFFZZfiUVrVzGb3ANilagP+JR/z1Nks70wgxB1av90fodcVHqSi2a
         lWQxtkiqhDzrZHeMeSz2W/g/vev8ZlnLyYLG1PvM973Eaej2rcyoiS9JXcMNRxWzihmz
         5Mkpr628t47C/X+UQH8CH0uDMZCYqh4ONYqvPtDWE7eD2ICXRMQnWPEFUbspwiXsCsN5
         CiSw==
X-Gm-Message-State: AFq9FYLU5qNd51LsRxp3dzo7KTKUWJDJ8nB/75rROuL8FK3zW15xEE3e
	ubq8Au26aa35FVMX1x4PWqv0AHBhbINrwa3rjelmImY8L73RJVIOaEXAcj7cnS1UYGaWaueLtD9
	inSYC7NQqk/pQg3NejCHp8Tu8v7oOUCJhUSKeTGnsFbQuTPZjaFT5Oj8ETILa/TIqGOG4
X-Gm-Gg: AYBFou277/QGNJtzQnoeCkEPbJoJjsza71eeTn5F+wArRFRWegP5NitVyLEleNK0mbo
	AoWdNTjP/6KmMgW9SZ0lvUYAz/ocYhhzk3/ac45R7OT50HP07dv0HUZ0+S9MwoQUuUpvDBCjhkX
	Y+sSp4YTKTCRLGwmGAwiFui4HL74SY8y1zX9wRRFdyvC3s42uGPCc8aYsryY9ZR6JIsVuuRSGCa
	LvWHhuEQETx6SA+KfG+ka4u04yvIkt36wr/p2dqEKlsJ58dH2DfVmYHyp+8tNL29DbeR4SpG5qR
	lIbYLQKkKW6A0p87Mcktn+AeY2NIcR/PkxxqQRyzB+VgiE7iZQEjSe8KS8TJYHCGNZqXBOc9ys4
	ypR35sujlu5KTQJBOYgOzcpqbuoJYiWqZk5kAF6WGrJE9+P8dIW5kDKsKq9yZF4lcVxis4pfoFX
	b2f7FJcRoAd6RhCcu6PlMSWC0=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr2762588a91.44.1793395179935;
        Fri, 30 Oct 2026 14:19:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr2762574a91.44.1793395179529;
        Fri, 30 Oct 2026 14:19:39 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ecaf5sm5291016a91.16.2026.10.30.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:39 -0700 (PDT)
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
Subject: [PATCH v4 02/19] drm/msm/a8xx: Export aperture helpers
Date: Fri, 30 Oct 2026 14:18:04 -0700
Message-ID: <20261030211928.45761-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: E4bRuNSxqtHgnp8ShnePDikC5MrAMvl2
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae509ed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX4uCtizq1qduv
 czditT0oUYccwZyWpif7iJPymzBy0RSPCnTArmyQF+ddyHas6tGcc8tDhCdjik50Hl7EIjVHhJ6
 CW0fkyE9kuDbphXN5naAkZltF/Nn0dbBgsXWvK5dsR4J+6GImkEejEEHytKQvDlXxAC5Oa+jWxI
 xqVkwD/LHwdlKL4rng4wF5OFXWY+NK6aZ+4//Dn7/6M1yJe1UxGC1Vhm1+IRAW/nCa0TTgIZ5tL
 DHr6WNttFBVTUW9PADlETsc6Jexd/dm5OlKAGfeoPbSZYc4U8O+0vnMcYFu82c7wHCuXzpsVkz6
 O2ZdpTC4lMmlGGrYWJyQLGBoYEWyjg57ejpTUcZRSVY1OmBBEnOpBTSJGB+IGRY3ptrMm7abeLN
 phc2k53J9lhW9F8MFCeViV+HUx7/Hg==
X-Proofpoint-ORIG-GUID: E4bRuNSxqtHgnp8ShnePDikC5MrAMvl2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXyF9HOfXIzq3g
 gIT94UejGHjlvA/ncjF8YldXKKbnsunm9FLl1iN7P12h9kqBIvOBV+DQKmYtorMNpadtetPMrH6
 G9B7yRp3wsRonM6Ls3/sRFU5RsPCENg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 81d21acccea1..fb000b79fe2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e7d04c865968..a14379e26fbe 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
 	a8xx_aperture_slice_set(gpu, pipe, 0);
 }
 
-static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 }
 
-static void a8xx_aperture_clear(struct msm_gpu *gpu)
+void a8xx_aperture_clear(struct msm_gpu *gpu)
 {
 	unsigned long flags;
 
-- 
2.56.0

