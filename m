Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657066;
	b=cUrhTOl9FO9ZxQujhLawFcdgNs2DusnKTNKYbVYBfowAhngkkclR+tTCrZAwHrgR87fj
	 DgyecQEBO8q8se8lBzPNnEwAVHhd0QZL0rWCr0eFLmCiVKqtNGVRzdvklnxUIsld0zC0s
	 p3tIkypE4A0gn4Q1JQsAbLFTmEvo1VvrC38xvl8EorvxJalAXTQzlRfzbXR8m4NJXgWNc
	 VPQxe5vHnBC0Y+EdSAauRbH28PcV/ePfDNLdmsA/mt1nJjjwIjQh0uHhEVGZp9huExi/P
	 zLGqN8fBlvSfp8b0Yc2J82Ty84rK7RrR31udfgKoVEHGiDHsgoCFucO2gM7aAosVI1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LhftlRe/CSUkquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=;
	b=zqt+ZMCOEb30LORid6Enjme2VvBrhiJF4HHHpY1Ze927B/XUqH36+Sb10Ya3a9btx07M
	 UYxrYG/nEDAE3b7jsh6UVg2ydXaUH3IzYBQ3BfGkL/Z/tiIsWWsQ4a1OF7PVFW/RbXRcr
	 oZTGsk6l5/FPkQEjqeuJoH5LxwARpUO3jLb+XWsES08EjPU3SmxZQF0Umwsa8ciGAvXQH
	 9dlJhrZbRe7c9b21LOq3bHr7AKl8OKawZ4EgC0RAnerTbgZb9+FtecozL4DA8ZyIpSLTa
	 tBc3pso8G5OnkdvnLhYrSM5sOXCINyh8snfIn6+aXFfC3vLBfTcga+O3tFA7nen/nFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tgc6s1DL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKlucL34;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6205606A33D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6205606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tgc6s1DL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKlucL34
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5vpC3292390
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LhftlRe/CSU
	kquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=; b=Tgc6s1DLZF1+E7qBWHc6/9jfRNr
	jljhhd4stOaEuwbamP0X9tI4+c5iszgkoRx5uYHx0+lHnb5mDZZvpMfpxaxDinVv
	yGbfCpHpY0a+VtcLXSVfamuZkw1dRnQXd2OPxeEneQ45DQnRil6BrRFiXRNavlVD
	YEgJjIu+NZsGENap8T+4DI2QV/QJjHFfH5JO9bvKQVRqCOpAkUs3BuosltzeB+o6
	BJnSK0JIlxgha0KXThLzPVNamHGvuExgx8tejw+/w6fIebJ3cdHKwn8VHU0mmhv1
	+Pg5ZfT73AgG5ceO3UDlM2kO/MF2vmWig8yserdTADb86iinLbAll0QDesw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07egp52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88c768885b4so3801922b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657064; x=1794261864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhftlRe/CSUkquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=;
        b=dKlucL34B6tC1rDI61fllwLVtgMT4A+HmbUyRdwzoKma9q+6CwJTXUtOYHzo+gTC4a
         HW+kGiHRiBjMGoHS+ZLJLCIcghgzHpDMdqaVFl94N4QhqrIz6Mg6lHyjOSJLOdp2K/3a
         8udRwafuzt24xMV7x8qOvt3WT5iSNeeuRIeo45daop/PvMWSlByUvWCt7iTIH6e6r2dk
         nlwv4NkZIa5naADUgd5a3HLh5yKwALoZTbSjrwniNvVQS092x2BVmUH8V8eDbm+dgCMt
         6GZnV5ivQksRoyqqSk6Oh1HjtKkffyyEkJdrpRczGHcdbG0sWm95GDxk6cSvTnkecAL8
         SJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657064; x=1794261864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhftlRe/CSUkquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=;
        b=m6CWATisnZ+zc0zcDHimr5Tc7FJjplWKu6JlslgcPa7Hu51cLqZux8cYdyE2ZIFDqZ
         /nWxo7sXMedDs68EBgVCIkKdMbJ+VjR/dkXZk83ib3TXRKurBqE2ZClbiblMbK/cizeL
         bjCcVap7jiLKYoBaAuMXnzuFpR5af3e+H9EOjjZPrPWoD4LiTaszmjqxiQSYNWkeCckh
         Tk4ATUOv9Uyhuk6sM6t7MKDn4qQ/jyWNr/WVti1gtmMFlEj4sY0RjAOez10IuJ4swMJH
         uCftTSRz/WeXUWxD1wEyqqFovSGoy+0PIeGC28vtpqLgr17yT/Cnu6WauxtqbBbuY8I7
         yrlQ==
X-Gm-Message-State: APuU4Z84eU2cthI3IGc2oVQw1CkKL9z5HJRwj/o8L9x1zBUGlY342rR+
	lhNPEGqro5RZ/F6wYyF8iU5+roWgveytoPcMep8qTBGqISZc0yAzo0h2+KUzPymK8J4F03qpTpM
	ku8OMqthoafB5cVDz4KT5FGTzzCJi9UbYbohlSMFMGB5LTZ5g3gqFcctVTOBoG7xoj2bU
X-Gm-Gg: AYBFou1dmAjbfcetSACvgj4FGxTkGTr7X7jYRKtCna1Tlj2Y05E3k6AP5kjSSYt+dFt
	o5bZgkIpvSv9rPVM00eLNf76e2k0xLE+GWTU66j3S/7GXLYIHl8/5jBeX3bN+yXkcSDUWIUh8uA
	bZOolia7e/CvRLlENkeIX1RrLZma2IyNvfSlWwQPQ2KRtxl+vLr8+09nQsZqGDRMxhYVYqNgfYl
	Swu+0yKI17hZkuX+Yy/5CWhBO9JAecWR9koFcrVEOjT98ia5WlqDzltMwD7oP7K0UkI6c8ybgeU
	WVOJ9ITvwjvBOhfivA47Bt2VlJsLTi3lIespiQ2h7MKcmVlLeBos6OgMZyhPC6ck7jy2h8TzLOy
	4E2Y+eK2GYC5hkJAtWbpOl4g+5SwkplvsxacTtUTFX3c4KlsIhS1nC8jb+iOgRMZar4oTxg45+u
	KWI93jBM1C81YY2C1gEQVxHQ==
X-Received: by 2002:a05:6a00:1bc6:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a9be1a0cf8mr10090908b3a.16.1793657064272;
        Mon, 02 Nov 2026 14:04:24 -0800 (PST)
X-Received: by 2002:a05:6a00:1bc6:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a9be1a0cf8mr10090880b3a.16.1793657063749;
        Mon, 02 Nov 2026 14:04:23 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm2037507b3a.48.2026.11.02.14.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 02/15] drm/msm/a8xx: Export aperture helpers
Date: Mon,  2 Nov 2026 14:02:46 -0800
Message-ID: <20261102220405.30730-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX7e0pPUO4CdGV
 Z6fFbUxZrGxASCuvR5YIYk5lVIgcpcF2Q6v1vrIVfBeczUW7XQ6z6IULEr7iB9dA8POA8AJ41Ct
 EePkQgA/pMwvn0aUHZo+boIvfXh+UCJzhWwfKNWh3u2mbgFi36lg5gsg6/pnwJtruxvNtE6SQpX
 Jw4mn5z0ptn4PLRtszvJXTHnzQs0rBd271wGOGDC+2rzQmk17/YybseSnCt9ZOqGjS8qbFf+2jw
 iusylAkd7vAj96ySiK2PWduvCezR83BzkDnMXlHvjWYLduSQG2dwkXM3gbXWwb3UeVGX8J+a1Ob
 QYn/AaytR1qwEWU+jRxgfwXwrbX+VfK/erxopagZlQtal04UNMuuDIbcVjAoAUFwkr4btghmTGe
 utBqnFtVMaXfUIFaFqUA8RGOt6+8aIDrlqVzJFQl7JkoNbLyh2nmooZuSsIpocMSF0HAXA5+wyd
 K3xD/kVWAhADsIWEQ4w==
X-Proofpoint-ORIG-GUID: ZI9u0F0TI1UReR-xlAy25Sacci8IZGUw
X-Proofpoint-GUID: ZI9u0F0TI1UReR-xlAy25Sacci8IZGUw
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae908e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX2mvIr4Sk5zpy
 sI7ODXUce5TWNod/B6okDW9kMrDwegeFk2aIrwTSNG8yUDftukSUed4Kp928l6xPxAIiUyhaPXS
 fsGJECLGJJwIf/CNZrHZS2hIf2v7M9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index cb0ac27dacba..46e2b921f4ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -349,6 +349,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ecf15a8f68de..afb115c3d7eb 100644
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

