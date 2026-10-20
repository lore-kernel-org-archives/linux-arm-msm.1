Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529271;
	b=Ul9KF28HWPghcCtG4QmUuVei51A5xc8axbhd9fDTy4FI6l/kDywJE0TvT03eBhJuIJXA
	 qR/hSCpPHY1mFjfrFnF7tng32xDCpf9xm8nyRExgxQhVYVYu2nniBizALxsHuQl0zxbia
	 6rTWhs32b08WclX19PTueQIzDftEcoXH+JW2iVFeLNm6w5f7KdU+JJz5X3dWCyT3wfcEA
	 EdKV69XTTwYzYwhRepIqsxVkazkSgyPjed2VIPFt1RIvsdkPr+7Rieh5sd9XtNRNFaw+G
	 U/8cmhphMxEgqHONFKwvN0QXbAQKGBR6v8ScHQHs8CzX7S1T9sejKpbYvB5RvKLohFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
	b=h7sOAEAOATfzRYoba9WhwwfJVh4S2d8rfQQtAWN+yVrt1M6rG2e7UIixQLxjwxiq3sCu
	 8eafTdXigbGGPZELxzzEw996/wH2MpMpwIsVygpzXAphNVmkWZCeSVI/lX1ylovqYKhko
	 lylkolF5Smk1CwWrxPFlI0hlyIt8l31VnDPS7+cUvCY79uZzvGOsr6ADNe3ENpn5RHh0U
	 99zynKDpJHrCEKxoagbKzQRPnfGZBldAZWp3uBAaPKFz5X4YaTKAVrgsAmvO8R8oTleuH
	 AdG3ZB1rDv+lELLOeU+SdPjJCB3pWlCI0IAETb5a8wxgTl5rhNdeSpzCGICZ+RDqNCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Cg/JXG0d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bV1WnmAZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4133606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4133606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cg/JXG0d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bV1WnmAZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI7KiG3460850
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFtglml+hC8
	hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=; b=Cg/JXG0d0wGJqusJYFtJJwctqc8
	VBbPhdK7OVglHXm2tbw/wNHLa9K2k1B/NtDJ8q6rSzK4H4+fMCaLTTyWU64kQ7QJ
	0h30pNGE1mSaCu21SasAQ8KGr47+6OGsf6d8QH+oTHc58BB+zTXvWeUJNLgQmXkw
	bFXcSbGcfFITPUVBTJwa6WohXlYiqIFpnmEAdXJuXeIhO8FtYDFB0SdOUE+TuWI1
	9uaPpM+MmVrtybimn0ZwR1xSL+BcMQUYt2efj0/vtJIjaF6S1gQR8gj89LORE1nG
	hfUqfVGcaASQzgN8z2LYrjjSgxe66ajvob3w1wXK06RnGzu03zzOgVv95ZQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4rh9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd63a7cdfb3so2371030a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529270; x=1793134070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=bV1WnmAZwTNE0gHTk+UWu+uEWiN2Z5j7Rzug6xtCEaaw2KIkWkmrMTUP30/8rxOOb/
         beDdQert+gzV1K0Cf8iEicASxxv7VSlociUzitnLjmgeoh/A/w1+gf7aIIbXCep2LGtA
         g+xDMBtYrGYt38ajfe104JM/ooK/FfIK6E1ApCuWqvg2GtsNX641Te8/BRNCRD72p6A9
         W16zkWXAIqqL+nGf8O7c9yWRmBk0pOsWPC8wchXbT9Kb+h+/TeJVFsP/21whFMXnKwS0
         HUHCM5Da+xXluTmJdg8BKkZYRps5PMiI8UTtWU6mM/rjg5TUmYlL+zQ9pGDRNAWdlzbD
         YOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529270; x=1793134070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=RqQe8xqvy8ORsXMRdxfpcHDtkXy1e4UfkYa9Z2tHoEoGHgA4FXc+2PViqqB0tSbveV
         FOPIxMRRQ57TmyA/VM9eu8lsVgnDDAuNT8KXiHF1TIeLhWtnZSymykWLs7soITkx/+ps
         qqhGnVD73UnRCib5jlWq4ms0AE4Ab7cp2oQCHv2fkV88pIwVArJPq+vcXeE7+VYffPS2
         Gi6beDeWjPoaTyR3rjfZD7jeBE0i2AYwB1St+OWIJPhy+dptSlZVEBtEpjcZDWMko+6G
         tr5NMmHW5PUK9RjyENgGuXhh53YDw3LLEE5A+E2auBkYnbblMUvBuuTvj4NfQxXVdMPA
         zL2Q==
X-Gm-Message-State: AFq9FYKrbFhN/eYxm0+FOdxgiKQaW6QgabNLx8JQW7wn8iUSOBsRlM6U
	ZSEn3yNJva4HtPa6bnRk85IUPb+MJnmBatQA909OU/DUDY6+Y6WB7r4UYGl6C9UXzsePuco3Ylt
	L0Q/IeFGNu2Pyy0noWWxljVN2YyIPNWFTVl/e9U4cyLDk4v+TEYAgopk+bl/RWzcBznwS
X-Gm-Gg: AYBFou0XFEvgvu6fUerY5ZEMl6ng7gSiB4wNAFU3VafT0zVFFoDZGuv/4cgPXSgZvzR
	tJXW0xVLbzLnHonkT/yUteLqG2tkV+n9qrggSoKLdTqaDYv52u4Dve9VTrqjAHOnEw0DyvWv3UF
	EutwdQRdOKwLGV+JsdaaBEnuMZKDoKUKaZ87S4vLL30tKEwIToIJelPBPU1GTQDDaHiiudi9waf
	XfAIc1jQij+ruB7t7VbeJ5vH3+GPtn1Nf8Pnnf4E3ovfKxWoWmRzZcEzBxsSHK5UMgVvB7Vq467
	PbZnCYv8vtgRLU4mh9j8AsUX08K2L0WjQFx6+zgz/o48OqYdEvCqlRI71Aq0HcD60IXq4vKICyc
	QkNzUjhYZohhuZVTyeDx7hpVRtj3XJmJMoRFBLG7dbZ0fG93/+Q==
X-Received: by 2002:a17:902:ce11:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e9a68d91bfmr94432655ad.22.1792529269067;
        Tue, 20 Oct 2026 13:47:49 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e9a68d91bfmr94432505ad.22.1792529268651;
        Tue, 20 Oct 2026 13:47:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b434e67sm3125145ad.27.2026.10.20.13.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:48 -0700 (PDT)
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
Subject: [PATCH 02/12] drm/msm/a8xx: Export aperture helpers
Date: Tue, 20 Oct 2026 13:46:16 -0700
Message-ID: <20261020204728.28844-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AWyMSKwsK7NAsYCEo3l3k8uyksok-FJ1
X-Proofpoint-GUID: AWyMSKwsK7NAsYCEo3l3k8uyksok-FJ1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX31b6i3sz2iZ3
 NCzMEpJGjB6o7BEdqd1b6aH+Az73nLG8pzv7oYF8oGfKnNJk6Ku7BhrAnhvCWo0lwsYEgEp3gs6
 QfrRUvJZn5CKaBcyT85jaLxsQe15EDY=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad7d376 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX9EUkhgwbi5/1
 AW8sEou2v7nsbv4glk3tlI7Wk8MbK2YHXg5uc8SbpWhzHjQZaOrEWK6pkarA+jZhLMIXnzNKiha
 3/Gv/yo4dLmX2ElOjckOGVY138HGyMU4mzdpWJzFoc5PBfKOjTgc0SOYFoaJORpmFzL3FldQDm6
 fulRFR41L2fd1uz5rEvPZet/NIXe6qnw2ZBnLBdozLUguXEobFOdOYcGUiC9nSkraankjY7Iu4U
 C0BiRVm7J2v46SBrhkvY1MoS6bn1Dqe8tPun4Or33UFvtsWIe05sq9pFDBGo9jYBHsffIwve9cF
 DSJs9cxoiYiVMAGo/0BLzinA7FGt4buTOZmYU2mrf5P67z94hTytT3/Tov5Ig2PFf27li34Kt1k
 WJ9q1tSzWrfXANlJ7Ewnb0UVPt3AzLRWGEcLxGPrJSw95qNmWvvEwOzmS/w1J09qFjem09PRFUT
 5VBDGrjbJGo5go4nobw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

We'll need these from gen8 gpu state snapshot code as well.

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

