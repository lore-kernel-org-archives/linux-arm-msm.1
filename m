Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747943;
	b=x3CtcxicMEUssSDTmOPnkImJghcNGDXP6jSAya4Vhdi6Uv37wKeZSHqCSrHXKeCy1Bto
	 SH8pWr3JvrKkPecPYOQBJx7XY4P/QyyGlbT0rAjMS8MZULJg3PpXvIIABz37oLjPtPo9j
	 Tyoikj/ND7WkBoMJh8w9wA+cj2mwBKBDX/eKwBv4JZzYl8KrMvPMxkHf+vbQznRpNioTM
	 H9qSGffIr7OTt9BSJpdjqjCAjqUu5DAJFxS3gm4pyr6/luXblWIFKmfAtXnv8GaZxjaAs
	 864BIjyWC7YbwKLBcBZ1/TiMBRCBhU5rUKHTEUJpLvgHICDYcAiuklb1NDVRIQnODyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dll+M/H3iQD7KOEN8AqTqNktTQiz8H9I7kmdB5ZKl/4=;
	b=2A8PGqNJfWsfSuXHDbyH90i0LAV6AbyzVCFohB6RwnVHz4hgRzLZWh2rxIyvt2DPNGvk
	 U5OcN+/MY5RMp6y6TwRtQkY8oYXtxZ9naqiePyT32YLG4L+a0SXhDg7SCA/g4oNEtLXxp
	 HQD90B1onAoRFC1/Gm7XGTK8KZWu85SpRwjT+Af9lnBYw5RgPFerYPFA4zdALLFwH5GMG
	 4OWfG99QFAPlnXVUh3veOjahZPey89BWXA/a8xYMxVFP3jq1751+RaCYfRMe9OvDMivCP
	 e+CFZRoKqBJVU4EbZUi/vdHwRhWyUL4AxIVQy9K7vMK0oSId/tpKg75KBTC0tkxlkHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XGIUxLqe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qwzc+U/R";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A3606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XGIUxLqe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qwzc+U/R
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKm9P854850
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dll+M/H3iQD
	7KOEN8AqTqNktTQiz8H9I7kmdB5ZKl/4=; b=XGIUxLqe0IzNl53qsfxlRzyB1eS
	TnKCJanrJ2jE7BD+14T3y0J5reuEC/4M5H+EDvTRnmsQOs05iSYDU2Hr+8A8ZlwW
	z1uSBRVPf5OD7CaOi87Se1Uqdd1bZoJJ9jC04rCOiQWmeFi/OfdVPpGAFMlepe8c
	JpKkxWV720ezj2ke6btTnM4B9pfBQljSmqTKAHsB9QF6Mgw03uZp1R2AzYWfIVDh
	yTw01MgEmgJuQsUVaP03S7qXuaF+JIQmjoT+3Y4MyY2SRzb9/5u5IzlFKZMeFDRp
	XK9UvmLPBrb/7KZ54TBsmNK1vat1ncpZ2Z9wOf9Cg5zn98P6ii/A5+FK5Ew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv8ffv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:19:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so131657b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747941; x=1794352741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dll+M/H3iQD7KOEN8AqTqNktTQiz8H9I7kmdB5ZKl/4=;
        b=Qwzc+U/RO62XqL3udyGJqX5Zk93sR4hawwX0sSq8GsfjIcfncSG0UbfRLH9/RbNeC5
         em0F4FRJjrQT3I0tYeOiCBaznJWz06bYjGVidH5doue7MhmN8ecSpx23lOIDN0Zeu8+x
         W5XSDZE/gRND0BXmIkABhREc7it8j4L/GVGzV5pSkrVFdP+wR25Gyk+oRJm6IJA57LuQ
         vr9BVv+xQzguvAk5RLa+1WHyZtjPQ2sG2VAADpIBIUhR03LO6OSAthoZXIuIFEPrbEPl
         CaRT6nJFbX+4VSvWF8QGGXubyuB63pjf9+9fG08sCMwFOnc3td97CSLUEjKgKVaWDeah
         Bb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747941; x=1794352741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dll+M/H3iQD7KOEN8AqTqNktTQiz8H9I7kmdB5ZKl/4=;
        b=SsRqkcr9slYNAUmoT8tNq50xkDHxSo+y+n+6V9n5ygCkR0pMxck+j57/HQ1kg7+Ju2
         zkpldvcdhHM7WQuUh3r5SM7wLj5gsUKQzeHLaB+VjMoMq7kVnWQouIqNufCOZMWlp2Xf
         1V/YWYFviwsxhXhrQQjXAq9t+UNXrHmn1jAJLL5+BliJQ4snbT6V9J8VT0dycMavdWf3
         ceOSC3ndcedwQX0l9BqgyCcwKT7VNeKMRreUmCMRAy+JV+A1wvrOONe7Rst4QYaNOP2K
         Wo0+kVYG09mk/iEMErZb/cKvsStaARqsyvot7uZHRHp+8CERYw+bA6dvB9nbcKq81t7A
         z26g==
X-Gm-Message-State: APuU4Z+NHi9Xzd4fMJZjC9kKA8S0doGU3zGR9yZ3seBMIJoi4Z3F+vWz
	SEehm3lrGp79KSiS91YlD0/DxTmz8xQFuUWdXW6JAn4zAE2xnrsuNcRaPpJmf+lPLcR0JR77L2b
	cOrgrRw26wAEFtzYpZpa83wySJCelys0pG9/6B+CNuEmSeFAMof8z4JiJ08uq1nfKpArW
X-Gm-Gg: AYBFou3lmQ/PtLCEY+Nw5mQu34BdHw3Q6Kjf/VM4huGWf59yGDpswxuONFhsUAPJCSU
	QHfGwcyjvY0DZyV8eHqJIqnyvxuye0cE9g620Qqad/J7MNrmojALxdmeoWAcypsKNqppipxkvQK
	ST2oCLspyvT6PAC3K3RVlypVTOF3fIcFgCq8tptzhzAB/V1B+5SQMEXd1fn5O+aiUoeIw4CmFkv
	akiA2QkcomCW0w0ayybXFXJO9efvuXW3hAQo0Q9n72PGuvDlN4M5HCnSVDzltnFpk9eD5acHYfR
	M33e+JKj6w3tquxa+dBJLaUtlgCsQ3Pdb4jpjEstOkYnzHIOPZQY5H1pZriZkXvYH8Ok6NOnRea
	SwolnViGqB/qJ3fTJLrTgbFxDnlOAkyU+J02NRU5W+E5Wc559apH8+AxS1bVpQnsvFsot2gTOZM
	wGCm9MpfOi+ChPQoBmP0WCQSLzxqHgjTmVQ8oaPs1INpbV60RxKeVf8mWL6Q==
X-Received: by 2002:a05:6a00:9512:b0:82f:38df:681c with SMTP id d2e1a72fcca58-8a9ba902187mr11080473b3a.6.1793747941414;
        Tue, 03 Nov 2026 15:19:01 -0800 (PST)
X-Received: by 2002:a05:6a00:9512:b0:82f:38df:681c with SMTP id d2e1a72fcca58-8a9ba902187mr11080451b3a.6.1793747940945;
        Tue, 03 Nov 2026 15:19:00 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569444sm155154b3a.36.2026.11.03.15.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:00 -0800 (PST)
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
Subject: [PATCH v4 3/6] drm/msm: Rework IFPC disable
Date: Tue,  3 Nov 2026 15:18:42 -0800
Message-ID: <20261103231850.17493-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aea6be6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0FW7IQkLa0pm2cqxDqMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9dvWUdrLGa_znWQgScC8YldNyoF8R55f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX6CEuJqpC3Uhj
 kkclb+kCZ9b4GcvbUqjdMKQd+o21vuCsRI8q1F5Dgy2tIWAOzaGkMZPI1moqjnrZG9mmSlNNoEt
 pjsf4YJQZvzY55Y/Ohw1xJzYW7vkT70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX5l4v6Rf6314P
 voQlitxNMRIEXu+6yAcfEfT6DmQiuyE4v9M5zmC0WV+4HD8+7xfctZ3ZWGa1nN/ADleqRglYUg4
 1Wgp1tkb924lEml/kkSDJl4/fBpjhvt1Svq/t04HYYp4OjOTDi0uDgXptwzmi+R/qGrvFzRm8rM
 KgD+iHRnfldHRyk78Za/l7qWP1EMlKNWUJBnnHqahdaGtZ+evFodD5Yvw46m9MQ89uWU2lGMqdQ
 CS8TE/wjBeTvayHJiKijrEoFiyn+d9xVJGSSCbG+DuYkZjHhJ9G6dOyRckXnYUlSzTaNGwvnrD5
 RU2g57iVp8xA80VStDTJ5Ev5HtEsFJkMdq0h746YGIgwqmMjjdk8cWxNonpYscIIWjNGrR9aM3h
 8S084bxkc2oxdDEwHkYTtXm2rrDNjd8cuaDAgKt58o/KtOrO6d8CZFdF9edTnDZp9+GBHvLzf9b
 JOBq4JtVp4w9AT1lEbg==
X-Proofpoint-GUID: 9dvWUdrLGa_znWQgScC8YldNyoF8R55f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

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
index ce65b1160955..867dd476ed88 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,8 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, true);
+	msm_gpu_disable_ifpc_get(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -297,8 +296,7 @@ sample_worker(struct kthread_work *work)
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

