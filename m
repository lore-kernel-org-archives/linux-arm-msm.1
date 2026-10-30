Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395193;
	b=X4Yof8r7tRgpbPv78DaJlwtnxWSMq1cKqElZmikP36QbeW7DaEHFbNS1fK54yVfIGk9t
	 hi3BdssxlHS7+gJqW/6ZLk5H1ES45hFiNnTYu/2tq0E92XGgGvpAbkVzmDLYHjr+fbYTa
	 /wsomP5AQRIkArJBpHl23F3i97cg4vbUMJTqTTI3/UX3PIbPr66b1uFind2n95WySsMPI
	 4XqBH/atCrS8CWL3YKBqCO/JnUrx3Hv8d0Va80sUWMTgsPJUyR00Vn6cnREVpkmTi8gK8
	 vqiG/mxw8N0s6pwQzAsD9Nw+6B7y5LCenzPMMt5TcT4BV+fvexK2bS4OqsawG3QRm3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bTiaSLHFW/fXC1REagdUa92in0joZhwBxCG1tYFIKuA=;
	b=VefgDohp3xduU/1X+tR1GNLR5jBGl/SYqRssZkcb4+MTdFawD7zCUuSTWiyajNe+9D9M
	 dZerFQwF7cQSG2g0391BdLZonRfuyy+SQr9aVmCvUByPI2+n2tg9MtHNda6kdQ95pYte4
	 7mlU/dx0fHJIhaON60gVtrO+tXaDzYQ5p0AaeWH7d7BtVAgSrozzytM4agAtXJy26+E5e
	 595OOgisvI1zi/wrqkEDkV4h0Wa5Q/LKdfABzul5AJl81RNuVp3BkG3rsTD/nO8s2qmdb
	 H0VUAkLCtH6ZKi170D967tGF4XBjsVZTBxPc/W/0rjxsKxRUiPM5VxK2PbZBHACOjEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n1ZCr3i2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y6nNGgkA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482D60A5BC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C482D60A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n1ZCr3i2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y6nNGgkA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAXLA3473046
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bTiaSLHFW/f
	XC1REagdUa92in0joZhwBxCG1tYFIKuA=; b=n1ZCr3i21u9F0I1FT8zjsHNVsI3
	ngj1Vc585lkA4S6SH3tr4ec7OsXiz2eM0Hd3ntruYei+x8rhUN5PgJXVv4xtTiy2
	J+0klTWKrMZf0Ln33XvkERcI+nQmgp7KTfR/uv5IKy86cChz37A+fLrSLzJ3qOgI
	dC90reV+ggiEy8c3P8RlanzF+rst72DgzZxZqUyavHHZYjW7QSrDxtpUDeUIe3gQ
	hXkHFWzBKR6peMs9FXUmdFg6WBwSc6xqiVjXGcITVGZeWbnFjmPf3FZviYM3xaOu
	mR5M5RAtUpvh2PQiuSnn272fTTX7y/0/7rraAg72itghn2HEUNuOU1UJrSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g0rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so685974a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395191; x=1793999991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTiaSLHFW/fXC1REagdUa92in0joZhwBxCG1tYFIKuA=;
        b=Y6nNGgkAv2IgC6fjw00FKFqvdHIKT5GeC4YSPwhMGvNfIU7jikOE8jQRyp/RYzCDZz
         VWaUHy9RFOMhimOI6k0bhRoFnrsTbMvV1G9eN4SRV5spKET+lMoy/0rGOtsJ3VjDDgoP
         UdrRJUY5vOH7Y5qY089FzSi1NQ4Q8lZMLQyM/GV+/30N0wx5G2qBtp1rE+IRygD01xxS
         Ml+gXqY1c0FeT4Jki3gR+ny2kZO1AF96KvU6TM/02no9FALEBo8tDWSHYZm9+DCWPw2f
         ERCa15zmxyzQq1TstHqompG1JAeAhvyReYmk+xL7+GFoTz6fghmkLGI3yD9TWpN8Rfxq
         eqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395191; x=1793999991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTiaSLHFW/fXC1REagdUa92in0joZhwBxCG1tYFIKuA=;
        b=Z9IQ2OqEe/IjHYgWcgSqbVIhe65E7JWEZwZQ2l/at+dtb6i/OBAtmW6/DV59worxHN
         xVbS5SBJ4Cqobei2o/10c5FJLxs3/dOB4FZHthg3x9umwk+1SpHVltjX5Q5Rhim7fluo
         hllLAqEElWWB0rxsz2x7rySQMc2ReYHDm18vU0Ja5wj0cEFcg2cuNWc4ur04cyFRMY7x
         kxH7oxpF9msWrS1BsHPF4WRYy0m2QFRpFus1JY3iMU4rMgsLyy//pKg96lHCDPdJXvlf
         1n/n7ogIlPY17xFPuMsSVpmD2sjkPY4hnbnXnWrGHa4VQ17kYlHZ4v7DFYWhhII+/gDR
         EJfg==
X-Gm-Message-State: AFq9FYL5SnkObU/bBiOT0m3hItsA64SfqBuZFzuSjlDTrOEX8sA5qu5A
	pxN4dKj250OeeGM5cn0EI9DxnA/HtPRZXsgeqYdAWXe3XBXtrT+GfR0jfXqJfkubtbpmHDvhrQR
	/avoAmFIR3uHPoGbQtmlln36FgiXgViwupcBmx+heqGJGgMZNyMqe3/runBLcrzACYf2b
X-Gm-Gg: AYBFou2pb/m3ZF4WusPj8vPBhaK1Kwpl2cq6PwGZdYCxzfS81hNoVOO590IjnwOExBZ
	MUApfEs4RDljrWSGN4vsMursAHMOO5D+X0Vse5Qs791wRk18dUTTqgj3n5VTp5mVkcI8NVwn1/M
	Cs9fCx8kbEmCKS7yX1XXm1ija2nbApjV2SSIBvf52LnPijDbjJqG2WMvr7gdKq/s7d7Ivg5sKaa
	iRDiEscZ0VnxIbZAFK6JcG2ZnH/f0hkHVku2DJ/yhNEROi6+5pp79S6eVtcj7tezAoimeLjgYoj
	naTvBZfDLvXq280PujD9ihQHQ8pTkMzCJBgkYNvhcl+VaQLb7WJI/r5xaPJ9rUm1HMUIZTlvjoC
	r9Q0SvCpbyFsT4ovjB3iqZCzwMt6FXAWx9BNIEWBe63RHqQwXVmXKs5V1yULU95FGVIv+0O3o9R
	nGIpBl37+9drHTEYHYku73uSk=
X-Received: by 2002:a17:90b:3807:b0:3ad:a232:403f with SMTP id 98e67ed59e1d1-3ae897aa79emr3082140a91.56.1793395191343;
        Fri, 30 Oct 2026 14:19:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:3ad:a232:403f with SMTP id 98e67ed59e1d1-3ae897aa79emr3082120a91.56.1793395190873;
        Fri, 30 Oct 2026 14:19:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0983427csm1171058a12.29.2026.10.30.14.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:50 -0700 (PDT)
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
Subject: [PATCH v4 09/19] drm/msm: Rename sysprof_setup()
Date: Fri, 30 Oct 2026 14:18:11 -0700
Message-ID: <20261030211928.45761-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX+vcfxVVHtzsK
 PwnqNCeFSJLMZaG/tss6SJGBc/11xQ6sBPly1XdT/JLBzRGhzWK8+R1tnOmfKjLAm9gyos0oT+P
 ZIF3DA9iDHGFwMl7jdEsdIRgyWHaa74XOUMXwkxAvgeSs/keWkHnWQg5huVgWV7xueayDzBISrv
 z1YI9TjnZncvVIqcvOAdydxUz4eQgGIbCqnE86gk2R7UkRXdNxICab4DcSKi8HSaGujyzSXCCFH
 vsX+2FlKDl9mntGe5TSuEfsPKzCEr00OE7P3tJEdxPxLdcGeIs/tqQaXnXhmqgwPXBQcTi8fsId
 yckJ5A/ifROzn5o42rDYQL6j9J07ZO0LggCYqpePuv+537soJbklxcwxLP2lP3Jlx0UW8b3bax5
 2UkS4XV748W5b9FmWY9jQX4p6ypBR9+iETfaMmcolWjSgeVeILOh1KyDHcSXVyGafh91sQNYWqt
 nU4Zg7duPhTB6323Sjw==
X-Proofpoint-ORIG-GUID: me2IsTNzvK_cUt2dWH4Jnl4Tu1zhWCrq
X-Proofpoint-GUID: me2IsTNzvK_cUt2dWH4Jnl4Tu1zhWCrq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX+9lQFy//Gm9f
 yyBg+7U8FruNG+qmgguwnZkhFn8kPpPHdZy8viFjP38rnh4DdpebWV+45FFIzzoJXPyr/bO+Ap7
 iIU2jIlMT130TUSHOcZVFcKPnfETo4U=
X-Authority-Analysis: v=2.4 cv=Arx7T+9P c=1 sm=1 tr=0 ts=6ae509f8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MKlMNXPVnuVdJcRjF-wA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

We'll need this for other non-sysprof related things, so give it a
better name.

It keeps the behavior of implicit force_on when sysprof is active, to
avoid accidentially re-enabling IFPC when sysprof is active.  That isn't
a problem yet (PERFCNTR_CONFIG is not intended to be used with SYSPROF),
but it will be for future users.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         |  2 +-
 drivers/gpu/drm/msm/msm_perfcntr.c    |  8 ++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  4 ++--
 6 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..f3ec78226ed3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2128,13 +2128,22 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
+/**
+ * a6xx_gmu_ifpc_update - Update IFPC inhibit OOB request
+ * @gpu: the gpu device
+ * @force_on: whether to force GPU on (disable IFPC)
+ *
+ * Update IFPC OOB request, if force_on is true, set an OOB request to
+ * force the GPU on (disable IFPC), if false drop the OOB request.
+ */
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu, bool force_on)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 
+	force_on |= msm_gpu_sysprof_no_ifpc(gpu);
+
 	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
 	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
 		return;
@@ -2145,9 +2154,9 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
 	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
 	 */
-	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	if (force_on && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	else if (!force_on && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	mutex_unlock(&gmu->lock);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 09d76cdf059f..70c0024bdef4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2851,7 +2851,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2922,7 +2922,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2953,7 +2953,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index c49301be504b..639e63c29f4b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -298,7 +298,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu, bool force_on);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..2e1b1bea37ce 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
+	void (*ifpc_update)(struct msm_gpu *gpu, bool force_on);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index ce65b1160955..7b4a6e49d3a7 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,8 +259,8 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, true);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu, true);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -297,8 +297,8 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Re-enable IFPC: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu, false);
 
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..43103b054ee7 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -43,8 +43,8 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 	}
 
 	/* Some gpu families require additional setup for sysprof */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu, false);
 
 	ctx->sysprof = sysprof;
 
-- 
2.56.0

