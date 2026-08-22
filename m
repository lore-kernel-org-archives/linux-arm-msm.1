Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58238DC57
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787388553; cv=none; b=At+aqOWrHG2RBY1v2QC9fmulQUDqjJ8hOHafbmZdombX1jDPWwcEGy1HRdmbxB1td/v5dtC8WsXH1+96daofS9TCFBR7psjrYx6YX7cDb6aPuUonsroNCUe9XJDNUKtWocG7/4VYtlAFtUhpfnLTQwKOvB7waZpSdd5+405spM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787388553; c=relaxed/simple;
	bh=P5Qno/Uulwf66qJEUC3nIVjx7J4uBGKo5YpYlIjLfLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2JS668eSMerWhA2aRzBk5pSQ6LbqC7+cu6K1bjKRWIA/huF9t9fz59K4Kfo7VxeYykccRBrs8qpS9JrqPwAtDOd9q5415Ro57zVeDcFwbY9Ei/m71dP7/EYPFcI23Q2zkXZdszbcKNKc1/y2I/DQKF03d5jQF3dxXNtZM+PkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUmNnTSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBpu2CHY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUmNnTSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBpu2CHY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xqBG3666685
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl2pM3He0T4p4J5i6ZEzUZ8aa7IUKceqVLVcY5mk0cY=; b=DUmNnTSczxx+WgfA
	799htvWxk27NrQZPVcjK9Dyiwo6j4HmzXC9o8SXcWBk3VmhArjXKkomCYgudHin4
	BqEbrSM+67I/BnTgZpibUhLWsxhOtVVJPLch1yP5btKglKNXvw1vL6F+5vKq1Sjh
	+xRyYLqdm2vcBuelLmTttOdfgcef8rqbVSBWg2zEc1hIP9TCBaCt5JNG9kUQaJjD
	pO7Im+S5aDSnpKWBn65t1qykO91wAS/RYi19PLYtVPUn0hZlvbWQT/2voiOKqkD3
	SwBGO7g/B2XeoRCy89xwx1bBdJtLOKrB826fhiiqAjxmoEBoOFxQG5qFakyKnbG2
	RwakZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qrp02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:49:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7b3adda4so17976031cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787388550; x=1787993350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl2pM3He0T4p4J5i6ZEzUZ8aa7IUKceqVLVcY5mk0cY=;
        b=gBpu2CHYHAJiX845o4kUiWz1/Tj44o1f2YkJ8QUsSoZPkt/XeVyYbFD/lDuttrY/NS
         vIxdF9lTXxn9u+YN6jOr5tm5ulHm0aOZrQ1I6yGwRHkFfLgTt0OviduXMsi+2ynis+Ev
         hcTd2gnPtRgTUD7of3INowajBjfPclC/y6QzCHX89GriPkLjwo6ZTKzCVfL1AtyTkp3S
         t5FuLUSE2f8T/4kXwB7oPUv53IGo6Y2dzC+q5f8o1C8W8b16JruyPa0ORGshHCnnoHvP
         UGNJN0uvx79rnG2AisuNEqNbZNeGRmNd9+qX1+zRDkTZzIpsF+L1bjcGqjAB8SOua5yQ
         dd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388550; x=1787993350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl2pM3He0T4p4J5i6ZEzUZ8aa7IUKceqVLVcY5mk0cY=;
        b=lgDSliKthrdl2XJTW9eCRfsWlTv8Kwn36jfrVjlIyZn24k6a8qOhuA4uA1waSt4MDC
         qczq7AvzVKtnDBJcDeWm6Th/cMiBy0+xMfR/mN2WdwcdVnFfVsyX5q9jOTTaubimuDDp
         pXNjgr1j+2uxjOvJtmk5K6kGH9esIKTTvn3+tp584xRXPQ5Wm9/Zv6tPdo1ji7ZGxx/n
         pkkmU84h5P3BhfQ2db7lCjZNDHuIOA/saXVe05W8xrHjFuxCtHo/LyciSzYxTEH7gI2m
         C4EU0rTsNjv1fTmR18hU+NbYTE3CFVVAubE876Wv3XnLCaX3w7uiHQQ7kqQ+4iAqHeYp
         pbmg==
X-Gm-Message-State: AFuF++l+z4vhgjpw486kNZ9SlOj26Ok1Q+UZA8AKXbhP/QlYs/cajSuC
	qVvOKFnyW/kNn2l7/uARw8R7O+cT1XE3dB+E6lMtCaJ233Ib+1LkBEY9n9u3lqHBLFd31sfrRxL
	AW/vNGJe6Dh9OeFTeo0QiId6rWTRijds2Pml7WsUJdu9NUB7HD2HaPIP0CsSMIGfSMTdj
X-Gm-Gg: AR+sD12R/igwDXXDKRGl0w409ALIzf7+PmTQxBd5A0ZN939DxHGyOxmET+MMAxyCSX+
	Fz/BkFMlotTOH7blaqJKsR/gRDLRl4f3MOitOPPe5uvcimeiHyJY4R8Grfo7+BbG9VFNHkixU7O
	tyK8D+qCW30a2CrCQLoXGXXE9SQ+6KgzLoPl0etwROBIGErl4GgTW7qV4gRa3Op0GfVXYjkADlD
	74UlecgQ7HaauEep2WLsrf4fzKLLmC5XWn7Gl/wB97Sg1H1p8Zlf5VvJbq71vRsmf0Y7/awwbiD
	3zCUKZz432fvxRN4tzhdXxEMahFX4Yg2sAfweCxTVWVnVCoFOLtVGpK592uRr6cvicfdq0yYiQw
	zal9Y9u/ti5Px2GBCov7oDMixgUJ0ptk6aBRk+e7cavHjzuedD+t3z7B5/asErCttaXfxI7sDTC
	fR4fv4PnF3mUsf
X-Received: by 2002:a05:622a:5c10:b0:52d:7b88:dbdd with SMTP id d75a77b69052e-52df5a4848fmr114610881cf.31.1787388549932;
        Sat, 22 Aug 2026 01:49:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5c10:b0:52d:7b88:dbdd with SMTP id d75a77b69052e-52df5a4848fmr114610601cf.31.1787388549498;
        Sat, 22 Aug 2026 01:49:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fab887sm3066901fa.25.2026.08.22.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:49:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 11:48:59 +0300
Subject: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on handle
 close
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
In-Reply-To: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3799;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P5Qno/Uulwf66qJEUC3nIVjx7J4uBGKo5YpYlIjLfLQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqiWJ8JMZbmM2NJeiW7gb9/N1oR04En269Var3H
 t0RJ4DGh7+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaolifAAKCRCLPIo+Aiko
 1TCVB/9wD+Q8pkJ9h09RroItxPTaapbAI3USEKG2KRiBQisUfmy5zEYDQekJ4BxfpFVEEk0hgO+
 6jMWwXatR8tx78QK8N7PlTafRiND37lSuvlNE4Fk7G9KSeDO3FZJOmSYzv7rcLrwQONwQPCsurt
 Gy/+JAYUi1C+oKwuvN4I+KdA8CUmBbg+RStcplBPbtsgVqxYXXmZkKwng44DbXBswDPg4KVcDd6
 O+Fn0jPzvMpA6q7r1TV/RU1PcxqrYGEZag1wK88Wpy6DE+jPBYMNQfDkyzW7NrvfaLkWtBCqrIc
 4ZauqSCtoQVIybVq+AvoQVxQV9uiHkHYebS34CGOCijIcbbl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CbbQQVusQN8t3GUh-aMH5wFMjkFc7olS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfX8VeBjCRH5gI9
 ebv0YWZXlI1xoxcPfHFYqlwvr/+MuuefIfsFx9H6Q5VxGy1ur8QquVtJ7kV/RdC9EiodpabqbCX
 ZHG7rsRIc0E6Dqayy9DNcQRGKlpdrGGGic0Amos1E6rP3lfDck0L55E07d1mw+7Aoxo0FjhalAk
 aKfQXijB2EHYnd0JjRanEphljvOCa4CkIB1FXv3+hOAT2uW1wvnATgtypGv+vZfsrI/tWIros6L
 3TT7lWGztkHN8egORIPOxWrHUD/lD4rTQ+uAqJdELJQorfy+urSqwmfHLZJGpnJWdeFpHUiOp7P
 WdSzBYOKIB1fHZ21rfnym5BW3eWTfrZIjfPZXHLL5Rhq3gHACEXtc9hh1NduR9239W1IoUcP4Ng
 EV3iBMrNyNdTtjFMATURCqHcFgNx00qY8gRV1lxGbM3vccsDACQKdDj6su9Jd0j8iOd54KdyLN1
 eSmCzMrklR4WE4DkA+g==
X-Proofpoint-GUID: CbbQQVusQN8t3GUh-aMH5wFMjkFc7olS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfXz5LkAOTZw17+
 BeV16CCY860ad8q12fSOHBDCE4aQfJpPPN3DPHAH9bNSkOwXyz6+YB65ICLhDEPZ1YqwFLcAxbp
 +9tp5EcTFJBQdPsKEs0xvUL4PkEEbdU=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a896286 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cz9NNj-IL8ditOTxCAAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220070

On targets (like A530 / MSM8996) without per-process pgtables
msm_gpu_create_private_vm() uses the global VM, so all DRM files share
one GPU address space.  msm_gem_close() unmaps the object from ctx->vm,
which on those targets pulls the buffer out from under every other file
that still has it open, and frees the iova for immediate reuse.

A dma-buf imported into a second file hits this as soon as the exporter
closes its handle: the importer's texture keeps sampling the old
address, which the next allocation has taken over.  On a530 this is
every ext_image_dma_buf_import sampling test, reading back all zeros.

The VMA teardown a shared VM needs is the one already used for kms->vm
-- defer it to the @vma_ref drop, when the last handle and dma_buf
reference are gone.  That restores the pre-drm_gpuvm lifetime without
reintroducing the reference loop, since a BO with a live vma_ref is held
by userspace anyway.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 13 ++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++-
 drivers/gpu/drm/msm/msm_gpu.h |  3 +++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index f90afffe3442..e73cf49c360e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -63,6 +63,7 @@ static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
+	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_context *ctx = file->driver_priv;
 
 	update_ctx_mem(file, -obj->size);
@@ -84,6 +85,10 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	if (msm_context_is_vmbind(ctx))
 		return;
 
+	/* A global VM's VMAs are torn down by the @vma_ref drop above */
+	if (priv->gpu && ctx->vm == priv->gpu->vm)
+		return;
+
 	/*
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
@@ -95,7 +100,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 }
 
 /*
- * Get/put for kms->vm VMA
+ * Get/put for VMAs in VMs shared between contexts: kms->vm, gpu->vm
  */
 
 void msm_gem_vma_get(struct drm_gem_object *obj)
@@ -110,6 +115,12 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
 	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
 		return;
 
+	if (priv->gpu && priv->gpu->vm_shared) {
+		dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+				      MAX_SCHEDULE_TIMEOUT);
+		put_iova_spaces(obj, priv->gpu->vm, true, "vma_put");
+	}
+
 	if (!priv->kms)
 		return;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0c2c35636251..31d84e2b123a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -879,8 +879,10 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
 
-	if (IS_ERR_OR_NULL(vm) && kernel_managed)
+	if (IS_ERR_OR_NULL(vm) && kernel_managed) {
 		vm = drm_gpuvm_get(gpu->vm);
+		gpu->vm_shared = true;
+	}
 
 	return vm;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..7722776e9129 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -223,6 +223,9 @@ struct msm_gpu {
 
 	struct drm_gpuvm *vm;
 
+	/** @vm_shared: Has @vm been handed out as a context VM? */
+	bool vm_shared;
+
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
 	struct clk_bulk_data *grp_clks;

-- 
2.47.3

