Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8176B3A963C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321361; cv=none; b=YhPqWVzKovTU7DOtNW9VnhZCCWOlAB786BqQ/lzdMJ9N8OKFvYZSB5wMUXYE717KTmRVCLjzRWhrVUkmrfSMFLakpR2huykEXTYe2PTkrzxJjpfGm08ZO0FUZIgj56oE4zG5eI83Rdkh0DhoV1A0ngwWnjbceCpGqvga/dT+FOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321361; c=relaxed/simple;
	bh=JUQ7EMGttbfT/5fmu9W2HpS2GGy0t642YnR7G4osF8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WU9z9RYs5ei/wZ464zkVOH7x/9FfxdDYeyHwVTKq1x1BN+qg0/u2wULaQXbq2g0LQwqupLDzRKq97DtCh1VpYJFONy3oVrG9/zCBzRFvTByPXtj0FtmXqO40Bot9LjgznC77DPlHUVITL2Yq1DCKvLXESy6lVyYCsPmoBn4RA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbMI0vBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aqu3XgjI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbMI0vBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aqu3XgjI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtXcx2887032
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S9p22RaEXCQ
	i7TxgfihtQyZ/x+xxl4vghHU97Q3yNyc=; b=CbMI0vBwvX7bfkJb4TlgCDXZEcD
	J5xg4flYLXn+6Zb94EIsnSKDpxEsKRfbxtSEQBYNAZkp41KCZMRxWDHoVAQ6AiQi
	xjkZ/H3jXE30GEZKy83iGJd1PZR8f2HSJ3WYWWZ2gJqoALdTmiov+CVXx9FlI1n2
	r758aJEgjP5Zsm+JQ2YLSQ8+4JU9efbmH0qKMCns1HSLK23KVsRWmqKFn/Qrrctq
	ci0wPGrvO3EdQQqe66l78bb88noF+OfKy5ncnhQjN8ZBfPahvq/JfRpUr71wkc3m
	zOFxRReoAniGBNBuUrcVfn+TrK97t9fwRd057mdM0olSpTEXin82btHi7AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjn6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3951025a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321350; x=1784926150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9p22RaEXCQi7TxgfihtQyZ/x+xxl4vghHU97Q3yNyc=;
        b=Aqu3XgjIqUKb+3gZEURS2BoJcm0mDt3wYYf2pL4G5pcmHFraBZgBsyX6zDUoxqNNuD
         Es7/m6YmH7o2+abZ2UNda+elSMwQBvHJWM3lHJCEVJ7If+UZCbdfrZJc3v1jvdmCCtF1
         kV/Ugfu+CQdpNaTWHBBXva0OJvLqjHG2Zil/edYUNxhos+PWt1W5ZPlSfku0yr3ovUwc
         /zE7Yaq+mP7+F6U6M52ABXu01CpqTFgubMKzJI7U/eoXJpn9vX6cLnuhVvLbq6LJO/a3
         igBfMzlnqw55xZcuL/9XvfWbB1Fyag9f+aw8ZBJWGmkiLJWZ65QJUQPWhjTO8Yu5SabX
         BsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321350; x=1784926150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9p22RaEXCQi7TxgfihtQyZ/x+xxl4vghHU97Q3yNyc=;
        b=P+xwS1mJAxdmbesTvYdmXu1NKebTKN7sSL+908Dzuba4dQsjL3OiyX2C4QDngFuzyD
         onnO5RQTOFa13kBbctBZ8wbqf7llUuDjt2Ien7r65EVvOb/pZeMdYgAkALYHPvWQT4rg
         nXR8Rmd3I67DU4D92EgVoQcEPM/bvczND1ggHTIEV0Eo714OyAqUQQvsE0zpLuZ4wdOU
         jKtsLdUv4pnq6lHAshKBF51viZAbgaJcFBg2dkYCRDvMb7fJsncgPNlPrBpiZnOoxlQS
         n6UE34KesYqH+H6SOhTNEbLopKs9Bi9AYZB8W8D2FgGot24ZKF4fpq2ld8NFJ6juBYuk
         5TTQ==
X-Gm-Message-State: AOJu0Yxdabzj++KEY6hHP7+UFCduXVK3JkwTz6zaIGfdMhXNk0xl5y90
	XHuJ3OHUtfofQRP5DtDJzaWIzosg5PNKe/Df0jHfg80wjthuDSGFnMhhUpPQk2+ee9Q441ZqY4d
	nf6y5qEpSiThVBOQ5ikZjAAlcKbDl6WIOxzLpQXs9O4nn0ewUSv3lDmm/P/Uef3m8hf5I
X-Gm-Gg: AfdE7ckXkrbfk650oUvGNO6s8KJ4cSI/q/XvvB3dagHgm7KshOlplPbKuzz5Q6lFE5+
	ZChaXG57EbK4+T0sb3aqoJAFpUzWpdTXjkgx5tsDqO65CZNaJ567SGUYHgx8qn7+QTsky5EDmR+
	jPePGQny65c6f7YzFAPQ5buGducYu7frRXbOHeN+/gTDlR5SM07OeFCpacaxF4FnNFrVrVKD5RC
	hm1b3aqJoJ794dxcWoa+lPDv1zlUG3fpkN/yV9mQN3bq+mePzkIyzB1ojZT1P15VsEsT23qwW6f
	gxGoh8rX4v3CCAJD/4QwqhBcqMXO7EWQS1Wek+ND+myOuw9vef2dSPGCInOQeKC45CmEfPjBTKz
	IHIAZ1+UqfYPpUPqnuMRSJtmHP8T2KLH8xgm0swJCr/sk+iM=
X-Received: by 2002:a17:90b:4d01:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38e4b56d65cmr4691803a91.21.1784321350035;
        Fri, 17 Jul 2026 13:49:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4d01:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38e4b56d65cmr4691773a91.21.1784321349578;
        Fri, 17 Jul 2026 13:49:09 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff1545sm1701047a91.5.2026.07.17.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:09 -0700 (PDT)
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
Subject: [PATCH v6 13/16] drm/msm: Allow lazy VM creation to fail
Date: Fri, 17 Jul 2026 13:48:29 -0700
Message-ID: <20260717204841.26120-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX1u9zwjVY/nY0
 mouQ2Fxg5EKwb1JSsx+MpYF5RleZiGgFI5za6nx0mQbE1qPa9Czm+ChEHoTHk6Zam0yAO7NYCbv
 g4RTo2r4JTJttSIuUexGNxuLpkr+wFy5gzBOFtHv5w0NA3trG+MFo+N6UwHUDPDABuepbVE1hxB
 NBy6XqMegd59HniAyX4eJ+m5LMWJLMzgvENvXXzSgaXm+HsYaPHGpD32+zto9ntXV7DIM7nLdvm
 Flklpg5aSMS7zzBUEbLSV3fXrj3jj71ixDouv8fXNAUkMcCZQiBD2NfP7Bjmwc+K5qtxi/PL+FA
 7/yhtsS2qTcEeMSUPnIFCbtMJeWDpVgCul42vvxIJCVUNAzzXofjveZjUUWCeH3eBhaOVOxlmqv
 BcxdjYErwkd4/DxlnFQZ1D8myaVT8bI2pf/77npuxiIgxfbY/wjEwVKgfnyI3ZX+q8yM4aKjnrR
 13SQGp0YF8tvTWr2ZaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXwQIiYfAqJSZT
 XIsDD7g9xqHnU8Jnk69Trsv2uj1e4Kc7YnO9w3koihEBKnp65dDu34YSpmuzhYWgvggwSruE2mP
 0yF+pYivk8xc03+l0/E5YWsVNnrK2gk=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a9547 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RFCq6YHzeVPHqihPuhoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kVS27b4f80Qk3W8JoF6E58RmtctdaP21
X-Proofpoint-ORIG-GUID: kVS27b4f80Qk3W8JoF6E58RmtctdaP21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

In the next commit, we'll stop falling back to shared VM if private VM
creation fails.

This isn't expected to happen in practice, it would either require small
memory allocations to fail, or missing support in arm-smmu-qcom for
setting up per-process pgtable support (ie. missing patch during
bringup).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c           |  9 ++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    | 12 ++++++++----
 drivers/gpu/drm/msm/msm_gem_vma.c       | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
 5 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5738eac9aebd..84101e534ebe 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -359,7 +359,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 static bool
 valid_per_process_vm(struct msm_gpu *gpu, struct drm_gpuvm *vm)
 {
-	return (vm != gpu->vm);
+	return vm && (vm != gpu->vm);
 }
 
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2fd1b717d8e6..52ff72d8e17a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -422,10 +422,14 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (!vm)
+		return UERR(ENOMEM, dev, "no VM");
+
 	if (msm_context_is_vmbind(ctx))
 		return UERR(EINVAL, dev, "VM_BIND is enabled");
 
@@ -436,7 +440,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
+	return msm_gem_get_iova(obj, vm, iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -450,6 +454,9 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (!vm)
+		return UERR(ENOMEM, dev, "no VM");
+
 	if (msm_context_is_vmbind(ctx))
 		return UERR(EINVAL, dev, "VM_BIND is enabled");
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 040354ee16d1..6b0bee6c39bc 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,7 +30,7 @@
  */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
-		struct msm_gpu *gpu,
+		struct msm_gpu *gpu, struct drm_gpuvm *vm,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
 		uint32_t nr_cmds, u64 drm_client_id)
 {
@@ -66,7 +66,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->vm = msm_context_vm(dev, queue->ctx);
+	submit->vm = vm;
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
@@ -552,6 +552,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
@@ -567,10 +568,13 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!gpu)
 		return -ENXIO;
 
+	if (!vm)
+		return UERR(ENOMEM, dev, "no VM");
+
 	if (args->pad)
 		return -EINVAL;
 
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (to_msm_vm(vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/* for now, we just have 3d pipe.. eventually this would need to
@@ -607,7 +611,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds,
+	submit = submit_create(dev, gpu, vm, queue, args->nr_bos, args->nr_cmds,
 			       file->client_id);
 	if (IS_ERR(submit)) {
 		ret = PTR_ERR(submit);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3ed05ab0eeef..1fd4789f2be3 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -954,7 +954,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 
 
 static struct msm_vm_bind_job *
-vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
+vm_bind_job_create(struct drm_device *dev, struct drm_file *file, struct drm_gpuvm *vm,
 		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
 {
 	struct msm_vm_bind_job *job;
@@ -971,7 +971,7 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
 		return ERR_PTR(ret);
 	}
 
-	job->vm = msm_context_vm(dev, queue->ctx);
+	job->vm = vm;
 	job->queue = queue;
 	INIT_LIST_HEAD(&job->vm_ops);
 
@@ -1430,6 +1430,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_vm_bind *args = data;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 	struct msm_vm_bind_job *job = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
@@ -1444,11 +1445,14 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (!gpu)
 		return -ENXIO;
 
+	if (!vm)
+		return UERR(ENOMEM, dev, "no VM");
+
 	/*
 	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
 	 * immediately close the device file and all will be torn down.
 	 */
-	if (to_msm_vm(msm_context_vm(dev, ctx))->unusable)
+	if (to_msm_vm(vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/*
@@ -1479,7 +1483,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	job = vm_bind_job_create(dev, file, queue, args->nr_ops);
+	job = vm_bind_job_create(dev, file, vm, queue, args->nr_ops);
 	if (IS_ERR(job)) {
 		ret = PTR_ERR(job);
 		goto out_post_unlock;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 233c4f35ab12..d307cdd17d90 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -174,6 +174,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
+	struct drm_gpuvm *vm = NULL;
 	unsigned ring_nr;
 	int ret;
 
@@ -186,6 +187,11 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
 		unsigned sz;
 
+		vm = msm_context_vm(drm, ctx);
+
+		if (!vm)
+			return UERR(ENOMEM, drm, "no VM");
+
 		/* Not allowed for kernel managed VMs (ie. kernel allocs VA) */
 		if (!msm_context_is_vmbind(ctx))
 			return -EINVAL;
@@ -217,7 +223,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	queue->flags = flags;
 
 	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
-		struct drm_gpu_scheduler *sched = &to_msm_vm(msm_context_vm(drm, ctx))->sched;
+		struct drm_gpu_scheduler *sched = &to_msm_vm(vm)->sched;
 
 		queue->entity = &queue->_vm_bind_entity[0];
 
-- 
2.55.0

