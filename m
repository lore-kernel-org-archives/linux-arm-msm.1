Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896930;
	b=QOxRufD2sabBoQxy2nKxs7CHjww2ebEd8xafUO4iQN0KsbdId17z7Ps89Rjkk+WCFvhc
	 9QVUdSyMBlO0JODp6Wg1uIFFk5a3mTWNPMZej+bYKmBfidVMlrn/WFp2ZASnQMwmzR5KR
	 VnICw8ZLixADf9ELQ7E1i5kojHd1/0URYiNHuqpxieQx8oRLEyRp8k+WkfF6K8+Gt8ECo
	 Bhn6GnLbJomJsnyohKcPr08h0RAfAmkKUEhteiGQC2y3YPaNmm/EuHJs9HipSgHYlr33s
	 WDN97unJeW7oe97JmNXsbQ3MrsyEN0ycwnrMPycsZ/l1G7QB26RhUDyANqvaTFI4kuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3IaRlviCKeouJQry4aQ15OvLZ+XYaStkOWv8RGarB34=;
	b=e1V74OESYsZfBgSyMX2vwwRVf1VNt5kYhJHyHb/Fmux6AA0QS+yQnkIl7jULqiZ2/WX8
	 mKpC/j7U7tpqA/RdyE6ftRF0AirAALEaYJ6TGRPdg0fGf9yOleB3yHUgIje/TgYaXHVVa
	 RYfCu11X68oCt87w7zByr/ENhTBP3Yakr61UwOy7UP1kOpEpGCItD8nQoAtkHws/ZGujg
	 XbqPXH/P+AJuuSD4z32jQSU2nzC+GAGMkb3/1UEFBgtPqnQoSzYt+i5TvXEFbWA2g5buu
	 lxiz1VV9rge2X7DPr8mlkqj6FaTWUZmHpHfco0OI3a2rRUDeFvudzEA6qh3CdeZFfRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eGCn0gj0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IaWgieIs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CBE606D824
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CBE606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eGCn0gj0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IaWgieIs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQL033645208
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3IaRlviCKeo
	uJQry4aQ15OvLZ+XYaStkOWv8RGarB34=; b=eGCn0gj0BT2sklDqP0AGICY6I9z
	E98tMO64fHO0iUXq5EcTmSXXnB9yguIQTta2aZJJ9P1/vLzMrOnzjCNB8yfH5klU
	DPnMAEPHt1M79vM6pil79d3e6TTJgjpcsHnCBMQTxxKS7VgVDY+LWYNUjtbzHz8f
	YVLWkRT4LzmiLHJy8vbI4WY2SjaSCpN9A/dYCMBoj9mPD95/TZ2Y7MjzgBi8Cn3Q
	xHq0YnnxVrzHxdCL4Q80j6+jqlA/3R8a6qV7yNteWbn+rp1MORo3a1q2SBmRM0t0
	6uwjND10CRBSyMdtHSDCcUidpiMQIQuDQ1uWMyaX7NzbMJBIvw67pct89VA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdsfcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so1252493a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896929; x=1794501729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3IaRlviCKeouJQry4aQ15OvLZ+XYaStkOWv8RGarB34=;
        b=IaWgieIsdP7YIMoHq9z8DZ//W6pQCAM6avy7Ivsj7g5QUmC4hN6NGbnA94ZwnvyLni
         n2tgUlqTnNbuUtpSWDOSLQGArXDt836JRvltG+zfAX0hUt0L/3lXXT4DYXGQ+SlkhD4c
         1o6JJE+QvJT7ODrZ2YhWtotBItd7vnsB1+F8eyeflPcincdjv5wXWQrLb4+gDEaIQcWP
         2W/9AJjc1gt9J9i/jih4jTTicQtA8WJ0u7pOolrLzF1FmwZQQ5YOIg7PHMjBx+mwed25
         whdA3w4M4K8nHnX6vDbHiSEIvHK3DmgrOvwg50I9eI2n6PgxoeTZ5mnVH6Nu5HU05JVh
         AJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896929; x=1794501729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3IaRlviCKeouJQry4aQ15OvLZ+XYaStkOWv8RGarB34=;
        b=LdOF+NMG/Rhq6lVS8wuwSINMnZLAbRNfWitqMZ6+mTCNFyR/1o38q1iQT11F3mkbzp
         jQFUpbDpT0mgcBo9vv0Wm+p/w/JHaSaRLDRPw29Zt/CPddWQpXWqPrCP8KjkLR/ovDVv
         9Xmo4QXdincKUHeiSgOVZUqeeoVbjG/dvJRWG4DbGfUTisMJ+49v5mDWP2Adr2y/8PGz
         vCcGeUI+Veg91R/zv/N7OnW90qz/emoeTGz3kRNe5qMCFSOuyiwaa0KZJ9jC3sAVOQUL
         XeQukKfYfbpXghtGdacGczB2MfDsvzvEORdeYIHoT8ff9WahoQPB8F1fG0J+yvxm7JUG
         OcTQ==
X-Gm-Message-State: APuU4Z8Yh1gKHBQ7noyd/e8YsiaY6w31YieAva787LbIdQJHxuinuGhK
	h8S+B8PMhkZjbHvUi/n8E/mriiTNvQVSgIaRkXcQcz0CAtUlV7d8agjMjzpqPCqmQ6Ya0+ITiqG
	TZRZfE/1ZS4JPWlLp0XKyNxlQe6n22HUSK9uvUbms7Uzc2rYlKQ9iOJEuF2nsNAiacYdk
X-Gm-Gg: AYBFou3vDeIxTywd6FwHULqx/mK3CcQR/RF0IO7svPE0S6+dODgd4nyrMz/47ToA7Od
	R7sAYbOzsEqF4d5tiPn9V24f3EnBPBKla7XV8HIfB71ndX43RhXq7kvOjwx6ZhyWuweIqDPx/AN
	s6+n2Y8R0TdztTcJHTc0pxKDDOFFKW9+bnOfxPeFi06BbKsDRJJHq/x96LYtKl7TCXMl+CDD4t9
	u3omdniOpKZzhAql7IlUOKA7ujxQwEG+8ue/SBRVeb9sL7VmUCboC2GwOVLNAKwn/tEm2MuwM0/
	45MZMic6cYq+RovC61HhDo4XU5UlHiVFaud2ZsKYb6XGf9L1KL7y0kYp3YmEnntfNZ923i1emeY
	+pKLf1eP1VaGpLvgY3if4+GHYrjWWOsKxzmlWEKL7nksvZ8U0W4tHMdX9jvrF2hQXfWjAwkDYqt
	slNaW7T7ien1cTDFe96N+Zg4QBUzUGNv3nQ/BedVnz61EspDYw79lfiXggN4hF
X-Received: by 2002:a17:90b:1b03:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ae89287394mr15579496a91.0.1793896928401;
        Thu, 05 Nov 2026 08:42:08 -0800 (PST)
X-Received: by 2002:a17:90b:1b03:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ae89287394mr15579465a91.0.1793896927892;
        Thu, 05 Nov 2026 08:42:07 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0993fb8a8sm4659683a91.4.2026.11.05.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:07 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 3/6] drm/msm: Rework IFPC disable
Date: Thu,  5 Nov 2026 08:41:50 -0800
Message-ID: <20261105164158.23263-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecb1e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EfYLDePoL0mgIiDTUNgA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Kfya4PaEk6bgvwMQcEDSNZ_e70d1QxFY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX0Mruwnr4Cral
 dThfMZ3yq9B5lmLDaeJMiFmmsGjU+U31p8NGD56eSlieEeZBmKd5OJZtCPZnTfyo2F9iOpC+I8Z
 Semmu+Zwm4XRydw+pS84zREWTomc2UQ=
X-Proofpoint-GUID: Kfya4PaEk6bgvwMQcEDSNZ_e70d1QxFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX/qaIvf49cNNU
 CwIp8KxDIWpXxFe7Re5k3UB/cMsTPxwPu47rEzLJerjyRSW8J1Gs7aX99AjqY1ic3+15VLer3e4
 N4IAaO1D6Wchv9oBZgIw4ygWR8UjB3dnxj/KGOiSfwzuG7wSv+b97wbDVsfL6pLaWGZrCHdVhCM
 KElH90GQ9+hc5x7rekF8HRX6F3vRYGgwLJH7RYbGrWY0knY/Iz+2U7fEvZq4wcZ8xf0LxR1/U4L
 mTy6hWfXqkNH1D7Bxf0wG3fApXpBQYRgPH/EG0dvtx8pAhIKxRfikc5xnNaLLiRMyRk0bAFB7/p
 VhpJx7Wq5QE+tpIgu+6mmJqtAlStVAk786mvMS0s/y8ONrbMSPavXhT83bs17vNJWSArurytc4o
 xu3SxIp9dxkngK8ikihwatJ20dC3UleAwLinYGodBWZFra0QLeZcc4V5ZS0PY2RW9Mg27rKFvoy
 gQ8TwJXXf3qLjFa1qkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

Previously this was coupled to SYSPROF level, which made sense at the
time.  But there are other places that we need to inhibit IFPC.  So
decouple it from the sysprof refcount.

Now it has it's own refcount, so multiple threads can vote to inhibit
IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
state by setting or clearing an OOB request.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 27 ++++++++++--------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  9 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  3 ++-
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 ++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_perfcntr.c    |  6 ++----
 drivers/gpu/drm/msm/msm_submitqueue.c | 19 ++++++++++++-----
 8 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 7096d7e45906..9098cb0b884e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1506,6 +1506,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	return;
 
 force_off:
+	clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
 	a6xx_gmu_force_off(gmu);
 }
 
@@ -2145,31 +2146,25 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 
-	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
-	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
-		return;
+	/* Caller must hold a runpm ref: */
+	drm_WARN_ON_ONCE(gpu->dev, pm_runtime_status_suspended(&gpu->pdev->dev));
+	drm_WARN_ON_ONCE(gpu->dev, READ_ONCE(gpu->needs_hw_init));
 
-	mutex_lock(&gmu->lock);
+	guard(mutex)(&gmu->lock);
 
-	/*
-	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
-	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
-	 */
-	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	bool ifpc_disable = msm_gpu_no_ifpc(gpu);
+
+	if (ifpc_disable && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status)) {
 		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	} else if (!ifpc_disable && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status)) {
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	mutex_unlock(&gmu->lock);
-
-	pm_runtime_put(&gpu->pdev->dev);
+	}
 }
 
 static void a6xx_gmu_destroy(struct a6xx_gpu *a6xx_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cddce9b5b28e..28cb0ea7f149 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1565,7 +1565,8 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
-	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
+	/* re-apply IFPC-disable OOB request, if needed: */
+	if (!ret && msm_gpu_no_ifpc(gpu)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 		if (!ret)
 			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
@@ -2840,7 +2841,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2911,7 +2912,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2942,7 +2943,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 5cd817a259f6..ab4cb43e4a54 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -295,7 +295,7 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu);
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f892731cd3d3..25ee3ac16ed6 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -849,7 +849,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	if (!ret && msm_gpu_sysprof_no_perfcntr_zap(gpu)) {
+	/* re-apply IFPC-disable OOB request, if needed: */
+	if (!ret && msm_gpu_no_ifpc(gpu)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 		if (!ret)
 			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 44e5da9d6ab9..d1cf8d87952f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1012,6 +1012,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
+	refcount_set(&gpu->ifpc_disable, 1);
 
 	mutex_init(&gpu->perfcntr_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 799545c69093..d1abe0ef3d1d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
+	void (*ifpc_update)(struct msm_gpu *gpu);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
@@ -186,6 +186,14 @@ struct msm_gpu {
 	 */
 	refcount_t sysprof_active;
 
+	/**
+	 * ifpc_disable:
+	 *
+	 * Count of votes to disable IFPC (1-based, values above 1 mean IFPC
+	 * is disabled).
+	 */
+	refcount_t ifpc_disable;
+
 	/**
 	 * lock:
 	 *
@@ -376,9 +384,25 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 }
 
 static inline bool
-msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
+msm_gpu_no_ifpc(struct msm_gpu *gpu)
+{
+	return refcount_read(&gpu->ifpc_disable) > 1;
+}
+
+static inline void
+msm_gpu_disable_ifpc_get(struct msm_gpu *gpu)
+{
+	refcount_inc(&gpu->ifpc_disable);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu);
+}
+
+static inline void
+msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 {
-	return refcount_read(&gpu->sysprof_active) > 1;
+	refcount_dec(&gpu->ifpc_disable);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 189be6cc23f1..b1b07212252a 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -267,8 +267,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, true);
+	msm_gpu_disable_ifpc_get(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -305,8 +304,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Re-enable IFPC: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
+	msm_gpu_disable_ifpc_put(gpu);
 
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 4d744604f436..cdfc7a6c6848 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -9,7 +9,6 @@
 
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
-	guard(pm_runtime_active)(&gpu->pdev->dev);
 	guard(rwsem_write)(&ctx->ctxlock);
 
 	/*
@@ -25,7 +24,14 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_get(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Disable zapping perfcntrs on context switch: */
 		refcount_inc(&gpu->sysprof_active);
+		/* Disable IFPC: */
+		scoped_guard (mutex, &gpu->lock) {
+			guard(pm_runtime_active)(&gpu->pdev->dev);
+			msm_gpu_hw_init(gpu);
+			msm_gpu_disable_ifpc_get(gpu);
+		}
 		fallthrough;
 	case 0:
 		break;
@@ -37,16 +43,19 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_put_autosuspend(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Drop our vote for inhibiting IFPC: */
+		scoped_guard (mutex, &gpu->lock) {
+			guard(pm_runtime_active)(&gpu->pdev->dev);
+			msm_gpu_hw_init(gpu);
+			msm_gpu_disable_ifpc_put(gpu);
+		}
+		/* Drop our vote for disabling perfcntr zapping: */
 		refcount_dec(&gpu->sysprof_active);
 		fallthrough;
 	case 0:
 		break;
 	}
 
-	/* Some gpu families require additional setup for sysprof */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
-
 	ctx->sysprof = sysprof;
 
 	return 0;
-- 
2.56.0

