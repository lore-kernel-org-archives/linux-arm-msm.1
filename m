Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815182;
	b=CNbw8SOKBY8AWX9R4kreJWO/dd7GFP/5oUxGf/igg99KxkpVBG47c6PcaSEAONk10Ub2
	 zj60T1sq3IaA5mAMDhIgl3nWtZm3hflUUNEDZgdV/mIiDnW4laX2OSfl5APbghNrbNLkr
	 lhoeQzjLPAq8ThYAlX8ctO/9FT7XeMRtNDslRCZOTR4t5NqbRSgEXrGhKE/Lm/t4HdIOK
	 59zZ+BPk89CDI/J3QLgeswSNRVkPOdzMeRU1C3gZ5fbOqACoenGbxxLTh8ZOtROk8TBCU
	 EMTXxVMnIL5uOluRjIlqflJFS+ZgPLgLcj0LXeGA3b0df+sXyTqNVbS6xTD7xZmBi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZbwvZwZo80Iue2F7lohPFghKOXyEe5aytOmDivRO+MI=;
	b=uyh+X1Lw/LepjdEs4BblmEWAkrPz/r1RcOgBGBkE8K9xtyDGP44D0FoY3xp1L7fPdPUZ
	 VP21dcN2NaTBj6lQHpoOfOxlUMARSlKlvbQr4ciSW0r+h/uGUZItqaDzfeiKaZWB8yO/m
	 5mhkN+50Stp58rjfBdKB5B9gSAOUzFQgb1/1DAlZrHXeS4MY0ifFPfZgCvYVAwfQxDpmB
	 Q3NCnMlj4q5CF96fcftLLbfqs3/20pANcH85BEoU4nyoGLiheJVSOVTWg5y/bE2kc/Ay6
	 A03cKOul/9PyNJ2Qkogf+hA4HHVyY4MQVIkRH3l8kM39fyQHzpXpWb0kU1ugQ80YFYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ezg8KyFh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9LytEqu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B32606B084
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B32606B084
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ezg8KyFh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9LytEqu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fip631292225
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZbwvZwZo80I
	ue2F7lohPFghKOXyEe5aytOmDivRO+MI=; b=Ezg8KyFhIIVauGYiZ1jIqH/bsDJ
	KIDhdztaBNKyPm8CFyMYVMEQ7Xcc3Mq6F9PcY0mG0+Fa4SU8EyXSA6J4JZrgHPjs
	1pFiM04C8xEs+54lVLtiFwEZH7o45gNBxdomfMVYe20nHz+V/9JU9b6wafS5icWU
	CWI/QQuRsL3+/SdJcHK7m2iU9KoC3b9JqHwRQIje/smcWOCVK3oRzfE00nCGY/SM
	FvfD7hSRTk0xckzqmJSrptaboTvf/+Pxo5C3OSohkZOMJnZmOKJMowBiUfu0h8+u
	pl0h9GE9bCCV9XpMvaS9MEr5tHHjsLfdSJx5/ipKb+mP42ODRkDzqDJ53iQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163jaab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso9354295ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815180; x=1794419980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbwvZwZo80Iue2F7lohPFghKOXyEe5aytOmDivRO+MI=;
        b=D9LytEqu+UW2nMIDWb/cB7+KlFO4Qi1ByXIr58R6rmoJEzsu3IwapAVPI4mTfBKDpF
         p+qt9/j3LvHcxpkW/gT6CsypG9PKcfObQga7kEpAB+3tC3aGy14oU3yG/Zuods69trvr
         bcodqQNAVTQeU/mKXRDYbO3/WqSOzCmWT/94f0gpjLw2QlKVhFFHGHeaiU1ykYMTSSyI
         7U7Y08ek4vXdmcrYePNzAGe4yq/V7nuPG8HDNq721Ov2znd/+erloS3eAXVYJ69hH+Xr
         BGy/ELMD6PCodh5no82n06b99znkpHEVL/I6Fu/z/prT5Dq+0Xtb5UuPGYC/OuLlgyfC
         vUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815180; x=1794419980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbwvZwZo80Iue2F7lohPFghKOXyEe5aytOmDivRO+MI=;
        b=fMFeuMpu6bxrKLgpBduUbW7DFtXrEssiZy3yBQfaxl7+ghvUXEypxAP/+IRn5By/y9
         4TVR656U3sxz38lJamS2XuwXHcu9p1QaGREd6AVhooiTNgIOYvS+tkiT5Y2f/JcioTuH
         J4UUc7e55wdtej/O8YQuuGcu+9bwaIHpcWalsQGoiGDEjjKu1ONFmfyBeNYUZ485R5RI
         mbId/j7FWH/6Rbfw9iY6tKwXACH2EiUQH0WRuN1bFjwi58Qy4wJKFn9fHICTkVz4ZaDN
         UZN/zPKNn/7B67MxGGenvH0C6K5naQgXlxwUSymn1IhfSMX+W6R3MsjIYbdQS5jQLZAD
         rJhw==
X-Gm-Message-State: APuU4Z8BmNZNxEoQsv6p3A6nwwqugvuFVyqmxBZ+BlWsJC7BIWSVL8xg
	3Mff1n7uO092KJH1jAHWwBMGfw8dGzE83vd6DSyPiUb3G38hIM8dRtBjiraXduJnMFsDEJOqE7K
	AptY1d7q/Q9KG4bqRvZ3fMDW6VRIHdwIKH63aB5aiMynjVOEkImC9SFdJhJJfVuzLvMen
X-Gm-Gg: AYBFou0I1gj30eh6pu7xoWRoNvcUgN9DscZvJitvqJFAuspu1A3VbZ71z6lzK0+plUz
	2/XBjaGkWo/SgAI0AdfmD+HE6uOQUC9IdCQskAS90hcy1jcz3MMJpD7GxT3l2aYnK+JZG4c3qtb
	wNHzLWSJG7cam9WH73d4NIpQwcZECTu91j8VBSkJgA4jPx5dLHNFVY8mpBIgkRRlRakk8IraXZT
	Jop9CppD0RzSFAq8u7+bCa2hD4+ui1t+GlTEjUQCspNy/4JFInsC5QDgxtrT/kEeTOLSLJjDrtM
	LMmsQwpvRIy2ZzYfOxz/nRxHlGpg/nkXTny+WDUfJWDeS5Tll3xQ7z9c2+rDB0Fzs9kDFZ9EMyS
	1SuliWUlPNVcxy3MRuAtSQrTfyh0ytjU0vgOuLBdQrddx+dkiNlvD/fGXkiN7YZBPrchlAlf1rV
	yn/cOQYbURROMfNoPd2kInSUidm2JbA5/HcmE0Fl5EtSUMwvdPiXVTMdzd1VU=
X-Received: by 2002:a17:903:124a:b0:2e9:6c15:6b2f with SMTP id d9443c01a7336-2eb36496190mr154424075ad.25.1793815180308;
        Wed, 04 Nov 2026 09:59:40 -0800 (PST)
X-Received: by 2002:a17:903:124a:b0:2e9:6c15:6b2f with SMTP id d9443c01a7336-2eb36496190mr154423965ad.25.1793815179749;
        Wed, 04 Nov 2026 09:59:39 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0919b739sm10610075ad.59.2026.11.04.09.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:39 -0800 (PST)
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
Subject: [PATCH v5 3/6] drm/msm: Rework IFPC disable
Date: Wed,  4 Nov 2026 09:59:23 -0800
Message-ID: <20261104175931.28475-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: P4XPQsph15P_JIGHHSxie809Ms1XUjQG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX/tZJUer8XJnw
 1R4trk/xvdRqhzJzjRyx/lsuxyh/MOisuLuW3aihKt1Z4YkHKYvU8mjzXWw4MKdujwN1fTnokHh
 0cNS1e/k043KpbNVjmuGMQMF+FViBkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX7M1iTUOS9dcG
 EvGweAualzA9AlkUtC98uH1xPLM0eRtsCR8t2Gk548VyjvVAEA5EKfS/wrsLlukEU1XBxZni0i8
 jOyzGQGxuWv89d87uMZPFXo5P8ujLHc5L/nLqNtEqwMS6vpJ0D03aBqvCGvJWDWhWbcuWu6en5Y
 Mq/FsBogQOhXxAA/+WkIgnyyhwSyPakNpiqUO7apvDM0GlyNh/LRe8aTxZolKg0FxV1Fl6mgXkN
 Gs8PntH0EjUh5aHwenZc+Gw5ktTnwi/3PYOCCrVw5DmqkMcPbRKcpaW5lNlOwiWsIkVPctTljbS
 500heqOYzijdVd4Jpa5DIMxNf8xssjuapGfe+8EDzrN3Sy+yYqfg2+wP/EFgZoXxxXc81+mdg1O
 +6VvUAhkLz9wg5oH37N3KZiO9opW3nmubSIDN8im8mP+uqyNKKzmCExkBJpQrDKKWL+2MuSGG9A
 7iyOmMiaBxyw+xyEvAw==
X-Proofpoint-GUID: P4XPQsph15P_JIGHHSxie809Ms1XUjQG
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb728d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0FW7IQkLa0pm2cqxDqMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040071

Previously this was coupled to SYSPROF level, which made sense at the
time.  But there are other places that we need to inhibit IFPC.  So
decouple it from the sysprof refcount.

Now it has it's own refcount, so multiple threads can vote to inhibit
IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
state by setting or clearing an OOB request.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 28 +++++++++++----------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  5 ++---
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 26 +++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  6 ++----
 drivers/gpu/drm/msm/msm_submitqueue.c | 16 +++++++++++----
 8 files changed, 56 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..b02bcaa4bd96 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1443,7 +1443,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 	}
 
-	if (test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	if (test_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	ret = a6xx_gmu_wait_for_idle(gmu);
@@ -2128,31 +2128,25 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
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
+	bool ifpc_disable = refcount_read(&gpu->ifpc_disable) > 1;
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
 
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 09d76cdf059f..2a4f81d14400 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1565,10 +1565,9 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
-	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
+	/* re-apply IFPC-disable OOB request, if needed: */
+	if (!ret && test_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
 	}
 
 	return ret;
@@ -2851,7 +2850,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2922,7 +2921,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2953,7 +2952,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 81d21acccea1..cdb830b7b778 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -298,7 +298,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e7d04c865968..ba8306e9eb44 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -846,10 +846,9 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	if (!ret && msm_gpu_sysprof_no_perfcntr_zap(gpu)) {
+	/* re-apply IFPC-disable OOB request, if needed: */
+	if (!ret && test_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ca21b3bf20df..07b7bd8d2329 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1014,6 +1014,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
+	refcount_set(&gpu->ifpc_disable, 1);
 
 	mutex_init(&gpu->perfcntr_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..0334a0f604ac 100644
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
@@ -375,10 +383,20 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 		(gpu->perfcntrs && READ_ONCE(gpu->perfcntrs->stream));
 }
 
-static inline bool
-msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
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
index 36ce9a102c5e..8c2454627a8d 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -266,8 +266,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, true);
+	msm_gpu_disable_ifpc_get(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -304,8 +303,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Re-enable IFPC: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
+	msm_gpu_disable_ifpc_put(gpu);
 
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index e3e7c401fa5c..d41756c0152b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -25,7 +25,13 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_get(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Disable zapping perfcntrs on context switch: */
 		refcount_inc(&gpu->sysprof_active);
+		/* Disable IFPC: */
+		scoped_guard (mutex, &gpu->lock) {
+			msm_gpu_hw_init(gpu);
+			msm_gpu_disable_ifpc_get(gpu);
+		}
 		fallthrough;
 	case 0:
 		break;
@@ -37,16 +43,18 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_put_autosuspend(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Drop our vote for inhibiting IFPC: */
+		scoped_guard (mutex, &gpu->lock) {
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

