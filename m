Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615966;
	b=Q8vqDUBJubkE+a3aRXBTEKl5pFhwpv7tPkKPDuyZ0/0Z25NhuyVnnMA2dwH4Tfl+XY8I
	 5FAu+OhuN3agqSvTgxFsnKh0VbfMdvpKbcrT3jehzoNUEb4OZOBlCAtV7omJJOE4HSvP5
	 +SbpP4ej97yK/pQU1iw6wsyMwiVRoekguK3BeCjRS2L+dIzly2y16vAOo05uTrEjSG28S
	 V4vpOmzLrlMdEQlcCBDHyQvzJTN1X1r3hu9Y9YAXY9Z0x3rZJfPUBE/Ywcq6xox8CUDxg
	 KAdlmznSCxXypVfEW5QpmaoWGT2tPtQjk27aXE1VXQwwYpikrtYpJhbrGht+htucqzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
	b=B4RMQ0PdDMDFu97MzTJ7pSz0gXE7C/XjohrbF5xB8zE02kr11gpMRUa6bPicqFPUS/Ru
	 FQbrrfB2SDD8KmqgAgv54j1V9XxBjjQkSL1BU5EbF8zXITDszfIEiV9tv/Z5vvvV3tdgs
	 mtvBbnZeSHTYNmmAaKlwS+1/6Yzg/q9uWdZ7GoHcRMmuhDlQnjz784C3Ppek6hEVyaioF
	 mRuJ4BTLs7D96a7ypv2hHNXKPN/1iDKklJAYgsM8T9tVrkQlgtiwe94CdrArHNqwgMaAZ
	 eEo3N4YwHK/PB3Rt1N0wA5QzZK1rqerS+xXA1TLEGBHYwzyW9Pu95bZ0R9p1i1tENCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGz5YOPy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcJnwUWC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69684606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69684606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGz5YOPy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcJnwUWC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeLET207505
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFtglml+hC8
	hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=; b=hGz5YOPy/udZJmTKSCE8pXcNhZj
	a9HiWPaY1U0PLtrD8THEtWGaMdT9vWSTvnJ5W062YUSCY7CFL+poiS1dp1hmipM4
	FeS9M1Xuzq+MnlZ2H81qsaLQJN2xvifl2MbCOt0p6nFGM2GdZZd3Xaa8J6+DCv7H
	NxbD+S2CieiD1eqp4ooJgBt4lkcsasdqMn2eEliNw41o44kYapFu7ka+dco9HzAe
	aLvUK/bXQ7IlfyayOCQclrKajfr97/EXlgX2X9zGiYnSafeIv1pMAkvdLV4ZN+uK
	aomgTC91HDQsRCFet0jfToCSdHZ0QduBMGO4LjPMuhMf5CBRcg+UwI7heug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7b2hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso17808325ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615959; x=1793220759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=dcJnwUWCx57lTf7tJ4tuU8rlwlSxq/+GiIWakYndzDJirf6e+febQhl/2QxTjU9Mw1
         KEb2UVNyBTMvacihW0P5JXH44N+3AwkUtr38OLpYmfBZjfUR2VyQMTqH7IwL0qKrt2Wo
         KiKt2ZbgJQIThi++9obMco5HKq34/pmd8lvCO/OaUG99GFciMqKzw/+2IfxQh5OT1fvY
         0YbauZJOG8yPptAiq2yEXGrQmx5TrSveVOrjTZqKwDcyK4kVI02Z4OeoM/0Zsx5K2bl7
         TqmUIoKNK6E+WcHCoElKb2zOT4XHj0Ii1dkl6aJ3mIIECpH1eiKIad61aRKRwk9dHybn
         2SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615959; x=1793220759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=cpEYnUmR+ngPwG472cD0TZRhoLRg6sEHeYHJvU87T54OAmoa5/CEVS4u9Lu5fWGxU8
         vaLwfO3I48I95A82KlDt8c9EY1LvmuMbIKM3eiDf+VT/iDrkKr+4iJt65eeORqeMbro3
         mIWhUJsCOKvwjBg4izFnoWRmfvgzP5YlfaGBd+yj+/M8d4i9c0InxYl3xjDrP1eaoeZ4
         1tcSqcQsieLvsAB7mWZLxf14EVap1BbUDFdvZ5LmiHevJMK8bMkcrqxIaOEA0hP8kUwU
         5F7xu2OypThBHPvz4g//lLHDRh6TmF9VZEcDxY22MTxo/E2w3BP69Yp5i8zp8klUzstx
         0oXQ==
X-Gm-Message-State: AFq9FYKvOcewazp/9go3IUYAm4qskDspFZUpsdVXd4/oasNXNMrvKngJ
	jTOvbJh8V4aWtnOg788/Hir1qSOobHY9zF42sLgBcVaX6NcpVO4zYaF+BtjAS92tfmg0Kot8VZE
	kkM9WA/BCXEHGzUiTAo5d2n/SvzJcOHQl7M7FpF1dj1f4FU1TSLylAI5bTBdn3QuDnfli
X-Gm-Gg: AYBFou3imMgcPPgMprqHhCsO8guGtPONkg5qiHOTXYpup2MHhyyQ5lyp3I8EgetTG5M
	RNekEj4mTa3htZ381hq5a14cnxZiUvXpBXu8WkvMP6BueSqH17kszeXObIuNRoTnQOWOOf7wNFj
	sxtZ711XbBptn75B+is+Jt4lRSh6hV5YhfK3BJML67vHJoanscTTuAyfj7dwvRpI7Z/ytb7VG2d
	ai+Oaet9F/BbVYA/UojPRAkp3BYFq+yRTcb2C+uAXd0Q0KNFBQPdfuQZko+fMZrDg1UyBUdB2oE
	Gwql3AKfCKmCUemuedy5AMHVmFXgmlCnjHaE2INbTJpGjvJ0Jh71lDh1nCwYZjf18p2J6WBKwmj
	AwC5TcaGDtCVxvWU+TWhnxfbG9kDgf3uGSHK3xwlaycoP7/ArWw==
X-Received: by 2002:a17:902:c948:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2ea439fbce1mr26167015ad.16.1792615958861;
        Wed, 21 Oct 2026 13:52:38 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2ea439fbce1mr26166755ad.16.1792615958413;
        Wed, 21 Oct 2026 13:52:38 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b3082basm15852275ad.3.2026.10.21.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:37 -0700 (PDT)
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
Subject: [PATCH v2 02/14] drm/msm/a8xx: Export aperture helpers
Date: Wed, 21 Oct 2026 13:41:27 -0700
Message-ID: <20261021204244.67160-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: _h6m3pTLd-KMyXqm8vnCvkORolhb4fWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX17Lv7y3o7HNv
 HOfbyrtqPTH8gGv+wPCWnrSd2lu4sajUNLpOFY0WFnpmlXeu+VisQyqBiSZjQgHhOctr58w4Fdw
 4jbM89//r6j+qqQhoenS/tcLI7i8ZpGvrP7sRtSQWGNskgluJj7t4Wg5QxpIPeIVuOv78wEW2c9
 rQ0IR0Z3V7VmChvPVy99c24sTXwyKESnPHkCRhXhp66NeHSLT8HY5su5om+VIFKYrQtVJVLoyJs
 cIJma9vYKzfW0plXfSd7K1kIQmZOV54S92e9+EzLzYCcX/0pNoqmdH9xrH/A3aSyZ8f7ceQDYKI
 fT5JdAT/OfP4eWtw9lll9wLA0sheEDUqxaNEC+jwyrWjUlHXNsdhTSJ44eTzZCmfSnk/KVA4PVw
 CwK6XLZfROl+TyGiGXHNHvgVA38HnvzH9dwSotZxJd4CT+3NbXnSBOf+NDS0XrRHM2BjMG1FgED
 EWdF2MUSmwJNatlaPTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXyYzYgp68gT2M
 V+TVXnfEjas91jmInAQMtb9qMB2WYAySOmX2NxxZ3cOgjib/oEdHRNP2AiwMxfvbEY4j/nqaA/z
 xtvkh56BFJ3f349GLUatC7PI+CFtiMw=
X-Proofpoint-ORIG-GUID: _h6m3pTLd-KMyXqm8vnCvkORolhb4fWC
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad92617 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

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

