Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740633F59B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321338; cv=none; b=VDklk3IsxUfEeZeNtwtGM8ISUv/MXBhZuV+OniJQ9+0psBik5PCHZjmG8etCca8XdmdtN8MZOKuPZtue97yQFnQaeycmWh6RN2DkCddmXKcfj35RhaFns2Yh7mSZFi/WUXqz2DYQyH75DCc2wMqc+SmTKKEUhPhimX9EXmADDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321338; c=relaxed/simple;
	bh=haNJTpsgx0TlfqzWawzbQIaFPz/UgQjWPCitxeNqB0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6gl8+a+taFWH60ivmUtKqaC3NQ2ZVHQ5LWzr/cTO/+yZB/l00ZNfkjon7DnvmgBsjD3YXy0arG6/JjBDFg1nJpk3uvyi2+h+XVuRBnWfd+okliy6DpaQCSiQ5pfeEzmFsSL7IekMjxSH3xaLHgAJMQRMbEe5GD5MCFliH3y10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8vPbl+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpOrkmKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8vPbl+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpOrkmKZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtVRs2619490
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mmTWztalT6h
	ryopRPQtckYmk1TcKP24H1NmDD4Vro7c=; b=k8vPbl+3ghmkQzJz6iXYBtAIFzB
	hTY5NspubI+xmijA/Xe3jfLpI881J1FrfyPE1wvkgdUxVK4EZ/JSnL8xV0vEfMV7
	VcQlbncZuSERz3uTa2Mn5CUUVnWv+t4wHX0wE7GVkGUSLFXPm2G29DD70yToP58R
	PkY8X36l1TTTRPwXisAPJod7bCu4zfISwMMm4+XnpOY8auUpDcaHRRBHY9rDPluG
	qQCb5C3sXvpRDrn/HIW1CPuQdb8nu8+LWK5WGQfMR5D7sEHTez9SQDTGPUHij8Mj
	xLvrT6Vco/GC3kbtQ6kkskRNWfri7JgIEy9a7ZJ6A2i8dRK3lBmKm5U4wzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagb7eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a06bc82easo11185011b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321334; x=1784926134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmTWztalT6hryopRPQtckYmk1TcKP24H1NmDD4Vro7c=;
        b=UpOrkmKZ++HG9PpulzBADq2RZVHz1b6lBznUjTSLw2Wo8jmqSjahDNoB2owtjhqHj0
         R1Qz0Vn4GTZpqHune8rNE4+gzC9Mr8EkM7j1xcRLRGnlIUZ/sbuorw4J8VFWQaJPmi/T
         JHL1Ht8e4gscMJqLqcA+r8ZqzW4yu0BGMnyJh6PaSuLOZ585VoGCdB6DKer8ovw9u8su
         J5P6m1NVClXj9ic2Z6Pmwo/wphNrfx4PdhNdM0kUbaZRd0hK5VpYHwRTluTElQzLCkHD
         kt14E92Cb1RW1ZCOk1tmK+zIiwuIjvsCxVAK4klFNISykVqeovrT8cictCcnKq4Hqj4P
         G0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321334; x=1784926134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmTWztalT6hryopRPQtckYmk1TcKP24H1NmDD4Vro7c=;
        b=JTMba5CmetVOwsIRry6AXNK3ym04E/K3vjEQcPYBo6bGi8vUcsQJVCe+/GV/bbW35b
         AxBueVTHp7Fcld5Ee91vgmkFzPOF+WEi1WQErHyOgPTrB9gtw7NgQ6cM/tWR8Kh5f4nk
         uyscWXxX0VSXRjOiwrzBBGmNobovZrXYZ3sDcTZxnrT8li8TUPp1sH5zs7/HnacqUR5H
         4DxjH4nHMzHz7Y7HQqu0VKwHis884f6eJPk8H/7Ai4+WW5hGr6TP/zn2IkI1a1TBv6fr
         EhGJISYkmn/K1ziNyE906aTnAxSDRh7PX4E3grCxaHqC2gmAJPbuDm68Y4PL/vBG5oxN
         tQ4Q==
X-Gm-Message-State: AOJu0YyuNtw3n0zzppgAOb9BymU/HhR762aPdBwOFxGAIn4C0l1njplq
	HH2tk+N18S6u+RNBXcbUpJ21G3JsEGq17xCC+3PpIjH5uXf7TXJPpMzHKbEOpeE2ecpaEuq6UPx
	7oZOrbM3J9HuCJaWi2mIHEOTu7E9vgds/NI6u6V5la6FR2+2IkkUpZCXGZakAuwB3h0c/
X-Gm-Gg: AfdE7clifYslBhQ11UGyO88mOIqevNgu9EitI8kQNQz+QyiDw2ueD0NfCCohIT7wCUn
	UDDhBDciOOY72rWo3vKKkARyg2G6NcMEuWfEHVc1/OpyZv4bVsnaGr8zwK2c5bE2902FCAeNN6W
	Jz8P8l/ng6zCDM2ZKMANT+gLk8cvX5vMvV7kfpBxYyTmwbrzjXc+qiBkZmWfbrivl4AlLHFiMAQ
	9xb7dgeGOzMBjOfFmm6zIkh7pLZ47mOu+14qcW5M58S5DAQb11WI6arIcJi5oJeDJksvxW453GD
	LdiqFN2vDsj7gOUW0kpaSnndzVAv98iQSosH6ly+zLVD3pGCe6qRa0d4bJvJl6lCnAoInbrc6kF
	vdCj4dSg0ph2MPQJOzZriE0Roff3h4c3TD4Z0aWYOthyA8ds=
X-Received: by 2002:a05:6a20:430f:b0:3c0:9c18:d5a4 with SMTP id adf61e73a8af0-3c3ad997edbmr4549959637.65.1784321334431;
        Fri, 17 Jul 2026 13:48:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:430f:b0:3c0:9c18:d5a4 with SMTP id adf61e73a8af0-3c3ad997edbmr4549915637.65.1784321333859;
        Fri, 17 Jul 2026 13:48:53 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f77dsm1397778a12.11.2026.07.17.13.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:52 -0700 (PDT)
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
Subject: [PATCH v6 03/16] drm/msm: Synchronize VM creation on ctxlock
Date: Fri, 17 Jul 2026 13:48:19 -0700
Message-ID: <20260717204841.26120-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX+8PapAf4CUH8
 o7piiVKUPw58K8/xCXej0DiMQ4RliCzEQLWeiK8AqEUMtHgwx7suTjxOZ8ZDtr6y3UV5/7Pljtg
 nV2kCV2vnJbO1uBOBUx11/bt1ipF3bUgArv7NDLKmAiLXMZx4PEiU+d51BRhaBxBFdpxCvA9T5t
 BVt0REKTjBQbouNMXaL880dNDBfiUu44p4LCQXp20viF393J2aJY1p6jTx+2lIF2GQwMgCzvKaq
 eu+1bZUNlvnwz/utJMafv/T3DHe75sg/kJS3/O0LIx9DNaPeKx7qnmc8bnmX6S/91SA6ostuAHm
 yHVgG9MUU23u4/DoxMZSR6KbayN6FjjAOts7kkCiic0wexIzac4xkBAjfb8gtx5stLl+5qVcHnK
 vkOxMrEEdKLcDLM/F34PuW6QXNZYQsoiv4QMBVm0cHHhTBajEB4mRCx8n+R+55+J9Oht/2PXVHF
 p1TRtjIgES0OFI/gdVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX8Uquy5RE6gp7
 eGbqKWW5S/LUnKOlGjpIYV5NSnguQvWfEn6rO6QHnP94jICnNBwfNO7n1T1zED3CllSICCZZ8Qt
 lfO5Jsl5qwBIQJggJMescArSdRU2N1g=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a9537 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Hu6Oc1eQfK70imYNBQsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: V_uNYl4MjCk35CI56mslQPo2zs5HnFkM
X-Proofpoint-ORIG-GUID: V_uNYl4MjCk35CI56mslQPo2zs5HnFkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

And serialize setting EN_VM_BIND against VM creation.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 ++++-
 drivers/gpu/drm/msm/msm_drv.c           | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..0d54141ff089 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -503,7 +503,9 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		if (!perfmon_capable())
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
-	case MSM_PARAM_EN_VM_BIND:
+	case MSM_PARAM_EN_VM_BIND: {
+		guard(rwsem_read)(&ctx->ctxlock);
+
 		/* We can only support VM_BIND with per-process pgtables: */
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
@@ -518,6 +520,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		ctx->userspace_managed_vm = value;
 
 		return 0;
+	}
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 384f32f4d0c2..2fd1b717d8e6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -222,7 +222,6 @@ static void load_gpu(struct drm_device *dev)
  */
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
 {
-	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_gpuvm *vm = smp_load_acquire(&ctx->vm);
 
@@ -230,7 +229,7 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 	if (vm)
 		return vm;
 
-	guard(mutex)(&init_lock);
+	guard(rwsem_write)(&ctx->ctxlock);
 
 	if (!ctx->vm) {
 		vm = msm_gpu_create_private_vm(
-- 
2.55.0

