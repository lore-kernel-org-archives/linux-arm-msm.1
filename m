Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69514052C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340619; cv=none; b=izqMQWJctQww6KIi/lPnz5DjoV9qqb5j7hHgX82IHcydEkDI8VG5sC5QnS/gBjfKd+Rr7OGftHxy/LzEmqnRyHqxJQ0MSooJaB6r+g3sqVKXNe0YTsgDwSRUbp2wLHvVrTI5BSw805CYlX0iKKqy9Z6z/Ys52UneUTroslY4Rzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340619; c=relaxed/simple;
	bh=haNJTpsgx0TlfqzWawzbQIaFPz/UgQjWPCitxeNqB0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5+BiuZLojgga7dNdxr7ZsZdLm2GFFzSp0zkAdSXDVw+WjalSKdkLjia57LUstWbXnOI6rqpwekcFSpu55a2C0E4/WNBuP4A5ZyA+uUE3eyx+yjOX3dHYk3awYsim6QIfp8nAJhSx9T0ck2DcL1i2CSLwkdNp1keIQrWjvW2Cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Drx6JVgO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJyp5ScK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Drx6JVgO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJyp5ScK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF34Rs1700261
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mmTWztalT6h
	ryopRPQtckYmk1TcKP24H1NmDD4Vro7c=; b=Drx6JVgOR6wh/NzjaJ0aUi7xdXG
	qEueoCPDOEw20d5RTebm9aIUM5JGq4HDW1Wb9CB2X9J7HB3NHhesLYTKaoZ/v6HB
	eVEpBcvAh8ZTc5JlNOQbAzcgNYxXuW3GO3291orO7ZUawK3IUusRPm9zyZnzAwXb
	FlmkHi0zV+Ykm7XTJ8+Bcd5rH9/3ni/TRxn/+QE4BoV52eoNBhlJBEVc7NdmP2fN
	lmtxmRiBo3s1EKVeQlYCW9/PN3tnaRAT+DHZxAFDCHjCSk9entlVxuBFAaJ6Bic2
	FuJ1dU1J56ror5t6FGesCHMy1jN41hL6RY9wVhYwwPr039xtznAULIy9Wyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj19q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso1212098b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340616; x=1785945416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmTWztalT6hryopRPQtckYmk1TcKP24H1NmDD4Vro7c=;
        b=SJyp5ScK5cNENGIr/a0RhHzQI9N1w8shB9nyjeU03rssgthNZr7zyLKERhp8JySN0r
         0Zd3hyZVp1wz6Z3PYESgUNrPrkLuO70avElY+dFE+M08zCBaj2m/PyPmTGyegbaDkMKL
         Mq75nXeGJH0AZUucqGrUxecgCwuPhPUwhWmCzpvCEfb/3hMEtSjvhIfJMsSqHRsHUPVw
         O5UY4SrUxh+fbyVnqIu9/eM7EFRy1O7XawVJzWbyzAp8kGdZLhmmsk8miVUOjxceYY1j
         XD+ke1zNitQ+m/T8FFKgYC3NQDoGPvXyJicYA7flXkOFITz2WgiNvuC5IdED2xk8d+US
         YYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340616; x=1785945416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmTWztalT6hryopRPQtckYmk1TcKP24H1NmDD4Vro7c=;
        b=tZDxTzUviPWryAGuMXBMMyqAXbmgApHOTNGanqA8GHMBgh20hFpgEMpltbbqHmypx4
         46tqpqlf/SiHgZa5ldB+iyhucdA/FkXjVkYfHeYAVVAG8yesU92wVAgQCVIsy5GfE5CY
         4yAFp2L/jXuJHFitvfXv6DrIDY9b2Puo0xzTet+a6Iyk2UAGogdQjolRE4/iTJnd+HEO
         mXdlatGqEODd+7w9DOWvPX1MD1mrqpXY6TJ5KSlT+Z620Pd9SZJvWxJwXBM8k6MMo65T
         kkl5J49wE0+msY/C4wPCczZIy5UWHMY197kuzTOYMYMJYPY5kjaNMwB42qVQiS/V4YNq
         AQAw==
X-Gm-Message-State: AOJu0YyHHArGk6lJN6HitaZ82y1GM3p4oCDhrIzPDp8wmKsk6srAAcpr
	1g4AQAOV8Fd0Txp1F7vsKPDEsNB+oNA/6Hjj2eTXbLmWobvzY2fk70+gOACAmes/eAmy7ylKOGS
	rwbLIagOHGGg+wLvsXLiC34XKOM4Yqd1XNVDVNWq26ySk0ZUbX13cjGPaEXbFbHjPsreK
X-Gm-Gg: AR+sD13TjTAtm5VZ9nKFnAEI6Xsb+r9L8RktcYSveMMLp0lQfOwAE+qQHDGXBnBWZX1
	87RYunHNmVF/T2FVylTbdNQDj3p5vp3NbPRK3Il30ARZ/BMMJNXIv6rZOWkS1m/T6lfvq7hqGRT
	A7hb92t1YTMqC6xCJRz3FUbyXK8vbI/CmS82MQFcMIcGdoFcONzXNB7IfKleTV2FIqtdHsTwZLD
	ymKTLmstBocPlO1TGVRW+PT8tn2y+k1ylqLOqd4JDxyu4S8RmQD9iH1is2BUeFYzlrvT05Gk8ME
	AIL4CIhk1/briQ50Dw6viHwWFYV1FcplatrEw2TtZn1yLlmVvKXxjZVXCl20z06VPLJXGLtAh/Z
	89xnrHlMYKpSWmpIqgJtlQF82A1SBQBna4tOABPBxBf7gLog=
X-Received: by 2002:a05:6a00:3a14:b0:847:9b9b:8981 with SMTP id d2e1a72fcca58-84e93328759mr7904832b3a.33.1785340616479;
        Wed, 29 Jul 2026 08:56:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a14:b0:847:9b9b:8981 with SMTP id d2e1a72fcca58-84e93328759mr7904810b3a.33.1785340616038;
        Wed, 29 Jul 2026 08:56:56 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba92b0dcsm1178305a12.32.2026.07.29.08.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:56:55 -0700 (PDT)
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
Subject: [PATCH v7 03/17] drm/msm: Synchronize VM creation on ctxlock
Date: Wed, 29 Jul 2026 08:55:40 -0700
Message-ID: <20260729155609.20190-4-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a22c9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Hu6Oc1eQfK70imYNBQsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: y3t5YgHClYNPKubLLN43VZdq1BOBH9nV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX4jDt08lVigzA
 U3OR1T6genf7vd9+cmgH8wiR3+y+b0Gc2rxnVIvCyx+OjrhOjRo76hib7RVtBW8JHx9um4lTKmZ
 xXCyQoMOByy0Kd753nAA2tJYSpfGBlgxnEO0kNXqES7iASTMTmHqRJC7ocJtBhp9q1oh+Vm7P/3
 /IHtcAOl4VrEa3AqYGwEh9ov+ZAyaDHNmVLlcB4PiLVca/WK8s65HkIE3StPIvQFMKWXtxNZeki
 L1cGj/qLuZab2LiH6QGcTnlDr6+Exe6jGDiSqXb/UYbweUvwgDkVrE3Kj84wQv4RqNVV5zIeGW+
 RblxzZkVERyQDIilCbIZRG0ECpL6v96ZdJ8/0pHQQcr502c6IGKhkQfqY8m+YCuyg1uBZNiI7Xa
 Ag//QtF+ckbFZxgXlfcf2RHZ3Qlx/NVYdz7dEHeHRqVV0NzgvACLMCMxYpBv4gFZiYIbfE7ayZx
 Tww8bWF+LVaEAsbLhKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX+YR4GNhmrIV4
 IVXneXqWPXeeFZU5WX/stpRxgmUAcJwDFPFC1mOCthx7wF85WN5xPbgV5n4JZPCYHIaDkAmRImL
 6mJf0IaHJmTWeAuRqm1wPtz+e8bE8fo=
X-Proofpoint-GUID: y3t5YgHClYNPKubLLN43VZdq1BOBH9nV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

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

