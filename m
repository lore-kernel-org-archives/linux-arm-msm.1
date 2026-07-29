Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791834052CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340638; cv=none; b=DnyZEspGPpuXLgHlT03e8P7OcCGfQmUIfnpXKmCDA2vFCh3hFK3CddDLR8oHEbqlRJcHlgYpDnuzyZSUnFfVL5zfamfgXoTsQQ6+ozCAY50yboPzOI8kHUoNssTnSWpBTIXUjAGP1hAawe9WTaT3U9SNWw/aObf5vZVEIPvjgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340638; c=relaxed/simple;
	bh=JUQ7EMGttbfT/5fmu9W2HpS2GGy0t642YnR7G4osF8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Edihp3DGdMML2iPvxFDacxTjE4ANmWO9TCL2HMOZE1Dj0+PZmsXNQMm1QhymWrbfdzUMunMaZuey2t/O+62M0WN3iiZ3SMQe8q+jnzTEEJqlWMPQLB30LXJFRkbL7FYZcn6iLO11TwjNAQwOUUSHYWx3TDQuglOZRib9ht30eZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNX0Y78S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1dxIQym; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNX0Y78S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1dxIQym"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3Gxx2108261
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S9p22RaEXCQ
	i7TxgfihtQyZ/x+xxl4vghHU97Q3yNyc=; b=oNX0Y78S3vpsRifE3ETY+5Dkfry
	ljCM0hvy6uOGhcGI7l1/+KW/AeGP4H0zKCPmYUu66efloo5/U2FHhjMIhLMcPvxO
	Gb2jKo+hzeUmqi2SWt+n0NyJqTYTg9yp4yq6QZzkFhXOEoxB0txUmQDyb610d+kq
	0P49SmtySp5z5I9w2AwJkXy42ur0886LcSieesbhbpM2YoZ+4jZ7+TB3ugMefXKu
	PqOKO1jUtnwSmnP52xBLXlvyLTlYGoKjBWkHlvZ3RTIhgB4Mdu3RvgmFOLUKTDm+
	qA96o44Ja+ltIH9ic515tmp1ECuUuLNyo/g2Cux/1GJoF3gsoprwgt36g0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8g0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so13386235ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340635; x=1785945435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9p22RaEXCQi7TxgfihtQyZ/x+xxl4vghHU97Q3yNyc=;
        b=h1dxIQymma69mz2eCKSfSWozQk4dUKdkPs6i34ZU6fr3DmG6Qmkk3TDR7ntJUZmUUR
         VX+GthKyjlgONMIk7rUfnS7i0dy0gvriFXcfMVLTiUOE64NiNmN1XpPLeys9zBYwjAvb
         Zk35z+SYEToK+nj9//JlCr2qhxTb46bQ6IGXiln5kbq+E4HC9GwStRTba7nhKMDU6E83
         ELK9IccLWGJrG4HFELKcPetXMwTxQcUxYMVuJmFtniojkzeHYz/nDkGcZ15VDpNF3KhE
         Un+Iqy58spalwzl1KsKy1n7dCCYHaMkictF3CNMaGFWQ0Q/cedVCAbXL0J7E0Mr5/Sth
         qQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340635; x=1785945435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9p22RaEXCQi7TxgfihtQyZ/x+xxl4vghHU97Q3yNyc=;
        b=nD6NgtATX/8rElOOTbKjNn+eHN+I8vyetJKwzwj6Vm7jZWWJJTtX0Ef7ghTPCTjugT
         TtmhJyhQTRwuNNyjZcyg8LMfkM2d6yy9uVEOxmdZZ5ni+r6C7i4muKwzO5UdAAORvxD9
         xz9lOlR2Jv+0Q0fhnMhKbisO5FVCFy3q+UiAaP94T366TE5BkucBnmr4MkD4Wv/g7oep
         mxH93hmYouawSw/t03E15CIIP0Pxdy2z5ckL3Wb2iCn1F0Ox02tlTcnkV2Ewii1XmeII
         rJUKZupKg5n2QjJE7ew15+eWH6pgw1Pb+cnTfMXshWHfMMrlRqbzqj7HyJP6K5R4AVA2
         s/WA==
X-Gm-Message-State: AOJu0YwDovgFhtEAz+PQghpXxd6uXXVyYbXQg9UF82r60hSKiwZV+X2E
	DrMA2opZdRcx6NPYlrwaD6RO4F9EWAjGbwY7j/U36iKIcqtt5NkhTi7NOGrYbtAnI44FbSyXQX3
	PWMXOMFwsBJ1oEMfLuMgNsYPmqS96nYGFd4kITSOkJ4sj/HNuVTRf6LeTa6PL7+4B81Lo
X-Gm-Gg: AR+sD13KdUY3m0wmMtQEA5DUtnTVeSkqY+fJbspxmnfVkNQWgRziHX238S1C3pyLdaG
	GDar3FIIHU0Ben/7XzhybaA0U/IJFCJkUEd8a/F4ivXmpBVSk+p2sAUqZsB9K1Rvj2zWWGRfsux
	htXYhj8VB+NpSAdgsBzhCpoweFqv3YP9u2ZLiQEnuNCsVLd682PlCNTLBBR47klMigsMOrI/T+v
	YDv35Y8EYfYJAlXjMml3zPgUz4ypbYG04Qi6+gYU8fZUV8l5aM83o7Q6DG7b/k0KulcjJPn18Fs
	v3emd/wJGdLJMnQ97TPNwn648hjTVtr3RPmQqdi7kpc/GsXdpVV+JRzyvJpi7MTF4VpmTjUmmRP
	3XZoev1Lg9/jByyd4L27aJPi18rAnhA41Oow0yC3QPaJfvmc=
X-Received: by 2002:a17:903:948:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d015abe469mr84921255ad.7.1785340634742;
        Wed, 29 Jul 2026 08:57:14 -0700 (PDT)
X-Received: by 2002:a17:903:948:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d015abe469mr84920965ad.7.1785340634272;
        Wed, 29 Jul 2026 08:57:14 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf5fcfsm13568195ad.62.2026.07.29.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:13 -0700 (PDT)
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
Subject: [PATCH v7 14/17] drm/msm: Allow lazy VM creation to fail
Date: Wed, 29 Jul 2026 08:55:51 -0700
Message-ID: <20260729155609.20190-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXzEXLmX4ZXbka
 o4VgbsqV6Oc7g3gKxGontuFaKkJzGzuS16a91D1ec4AxJSgsnq1CKbjU9OCUC9tubaRDFeW70XV
 BK9lD1XA/G42USySZNie5uIVGCqoqvk=
X-Proofpoint-ORIG-GUID: X4pI93I2RP4gu7ybx2PWODK8BiMwpzeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX9ZvI6ZdDzWSy
 ipzfgk3EEVdeUb55F1EQZkLxN1K3L7nv473dPAxT1TMZLu63ExW252VYwZ4xZxDD9iVSSmpn/jx
 S6POdCEjddyYfklx0J8fHaPBosxsgFHgIFw9e5MiqHa4ezEdhmExSGOXf2+2rC2whzRvFR42nQk
 f15mYxpqp2NHObalqkcs1/pKvzTGSR3NyE8XpvBLgPiuBb/Wqfk7mmN96rET2B7Bqr+Dq/T2PDd
 XK8OGT3Vq8uvTZJqLOdK7386qxLHLoldO4D/aOB8DqfhJ3mTOKldWyCCk4YzhHeOChJElNgYY9X
 bSfg3HjfYjQWvSq8uLYJ10TeGUsVTggBD3460GX1cB8ltwwyv3moUfMDjF/IrCpJ/LfxkaGSZO6
 5LHzN0irLgui9b3gPdN1ct9xxffZKFQqtFMTy8G4yoRZiIhXr7no6f8gUkMhFA7KzdF/mxquszR
 M1WXvOlavNs5fEseBeg==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a22db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RFCq6YHzeVPHqihPuhoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: X4pI93I2RP4gu7ybx2PWODK8BiMwpzeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290127

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

