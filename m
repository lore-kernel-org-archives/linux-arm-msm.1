Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001E0376A03
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232967; cv=none; b=MVTonIH0wmVZY8ddp0/DT3KuRulQ260rosLwjEgEJQsjA893G93F2Xtj0IAzo1d3efDo3Y7qftpghKcoBLaTCzLgUAnIePRlE7c58ZmeMpnoPPMBZxm+6989zvGQO3UUlbkxXczpdQi8maxY93sX7zY3Q/nCueXU1VQdWgfjR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232967; c=relaxed/simple;
	bh=plPG4Pa//cZWcSBZyuDX/H43p72/a2X/5oHyz9R8Qs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCq0deKpm7gmIQ8b0GVFiK4yaQr4/bu6RNMGLNogAsjYW6gRzwjpTXXFC9tvlhbt/1SYX8XOBMpcvV89IS7QWYi8jOz+vNmSaDa25BHxuI3Iiiwys2RII7GB5iTmUWqkgA7v+bcVrA4rgW7pK7+KWH8TN3gKz2SD/AAdsJlVXpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOba50vT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYT9SMV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOba50vT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYT9SMV3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJorXl3864127
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WnSM4lxQZEs
	mTxwUeMg+vWDIzmfUTyWcy5ySJC3KBaU=; b=BOba50vTP5/8GNhmwJ5nFp+W5O8
	8wEng31bEDk4F2kmXZ/ez6WW5b8LWVc4xRonLY60iIl5tpEyrKLcyqpcbEL5h//O
	z73bUO4jZUsEZMokqSQ+7kT6o1BSV4Tq1wuXFysNN+Sl4PHESnWK2QYg0Mgfgx0c
	9s5sU42PleRa4z+JRMcl6znNEsZnZy1hWacgPrnP7mNWrDgxwtHFti3vliMD5VKg
	rpxD32jNNWn+XcoMim/DxwGnfpIvUq3LzdBVYbCEHwjHETljqdSTkN+/MchoPLOR
	As1pdTCqtI5nnX0Pfhkq+Vn36HpxMzzPA4cIvvEtHqz2C4dNIB+lDzoAcMA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10b8w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88da04b719so3433149a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232959; x=1784837759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnSM4lxQZEsmTxwUeMg+vWDIzmfUTyWcy5ySJC3KBaU=;
        b=QYT9SMV3FRjfaJSAJ0t3SAGYRcx7/fXi+vprWz+fZwkugaHNUpKNrkNhn1MHvge7cP
         wjhHvzOS8iTUXgyXBS0mbmiWEgjoQV6UzIPuBSlDkX6ESHN9LBOE6ytvm4W8iyYT9Cus
         usSalWMsD0PBNKzMLsL5dsyWlAilpDo4W4Bz23PXcT7hk8pP3CbtCzUrjdUPqgviM3I2
         o7kFiPHG4w1nZVZiVWOXUfa5uHENXe2vAeBUQecrGjyjv+QhE46tpQqKiteeAA95Ws0Y
         s1yruKvugGhSSUHh2nEE9EG2vRrMfYfpzOO0crSKaS3ZLX/PlbPY70WSh7c/bbf9fiAj
         BDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232959; x=1784837759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnSM4lxQZEsmTxwUeMg+vWDIzmfUTyWcy5ySJC3KBaU=;
        b=XlDVNnr5sI4gAH7KLmsxOBVB/Kzz/yNw9aYYj5tZ9ss2sSTLHat/40kuFsFDaEdo0S
         KtPlAzHq+RYaucIO/3oOBbonGV3KDKUgrqDetXychWe+WO9gnch+xCI8oLQFiM2GD1EK
         yQl5KKnTu4F1/oo6sq6tq9RzbJEb5vNjow0Z1YOjiUTa/L4Rrg/6LRt18qnAPCY3d0XG
         lOM8Yb9nyeqTxIVsabS1cWMX9QUMRa/K5mo1qDbnWmcJe3ghjLwMBwZ5/KPytwExkY4I
         H7GTgk9qVqQRpbBXE2mKsmlBYyCejevLjq8GUBDvlEx6XDte8QBJbUkwsuN1pyLVid45
         VafQ==
X-Gm-Message-State: AOJu0Yw/RFVHCP5CfnJK5Q/h8KDUA4srJDbXSpzMQ1p0Lx1qGms+PDi1
	g31+ZFqWXhduR+77oOJW2acwF9wxexWuBeyUs2umguII8XTwVr3yYhkhIqQls5GYVynX8Y23I3i
	Kx6sUnOMRPy44/uhaTmj3939LxojdfKYK0AhlMyKr2AQFpf6IDdnu/cRrRvflwObLiTb0fkEejt
	n/
X-Gm-Gg: AfdE7cnltH3L1VrOf4pOCldSdHiiddC9FcjeE4oUYWmKzv7OECpvOVMky0GljZc7UV+
	QnbGzLKRRf1/15ucvmjbNYU2ci+2zkz7Jc8CRswsSnj8UhTWPvstvwQIZeJFybUTdFaClNiBfbo
	6aySata+A1BSMOjrVMXlMKW2pW8MRtP+E7vCbYRq1wziqbBKHNuLQLOp0F4yL7KJl+cOKxpPUSa
	09/vr69HocbBSGH3Uk6XpsnjStwweF68AcSRMxKOK7oLC/xrgKI7vFD22FIw8yWJXio/yJjJwgg
	T8HGgHTm4CTv8ZSOKezVmTsi9qR9vgM90XW+XEJVCaYTSpoIhDIInJSAvZ2Mh/jt7/YBKsAniV7
	8lBlH6XoZKwIeXw1Pa/NlnLPVrvw/icIE6YiJ2ZycG3Q4o8I=
X-Received: by 2002:a05:6a20:ae2f:b0:3c3:7481:7a03 with SMTP id adf61e73a8af0-3c3a5cf5b48mr670980637.34.1784232959070;
        Thu, 16 Jul 2026 13:15:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:ae2f:b0:3c3:7481:7a03 with SMTP id adf61e73a8af0-3c3a5cf5b48mr670951637.34.1784232958595;
        Thu, 16 Jul 2026 13:15:58 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ff4402sm2291627a12.25.2026.07.16.13.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 07/10] drm/msm: Don't fallback to shared VM for VM_BIND
Date: Thu, 16 Jul 2026 13:15:30 -0700
Message-ID: <20260716201538.365824-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
References: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uE1sZp7mliN_GG-ur00ce3y2cRv39k53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX7DxJ5zqLfYK4
 X3WOd0OjWCwPZsT2rkXyjUBtuGtxejosaw1g35ZZdYJadkVCM0yEm+ZtUxzm+KHtEUN+XTB4YFQ
 fWjLAr6uc0PB7Y5UUwR2Zy6HCgOz45kHlnTzgqkBW2JVw4PCMP9oGzeU6fdNcX9xhdstiD6JQSh
 6UjvUT6CpkQNteCGGPVzYXnxf+dGsWoSQxMlo/MzEES1rJCsbEJJnA1IdecZ39/7F9TU7addwcl
 TI9kcDVi+ajVw1GIpek8hWq1+M5RV/8lEHESbAySUlaSzUVUAZXUHMpH5P0FrCPHERMmHz2jb8h
 qxyjTRZjs9HJXWFed5clU/fKlGzMM16FcSWYjv56/6n2jvp4CAYF0BIar1RxmelNnFdAU2+qokx
 Iq38+BOURnLDGHnTimTWHTI2tVmgF/USCizWiVXfBrb/D4G29qU5QsTCySPih3bX1F7bHP0xB8U
 A6X97+z9tqluNwiPbew==
X-Proofpoint-GUID: uE1sZp7mliN_GG-ur00ce3y2cRv39k53
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a593c00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX4opbhg5PJKq1
 EHSbTRcQkDITHQAb960/gHTK7LlQtlxAjVh+V4lhPEZaGUP0Ga3gEevpZZMEF1mJ/NgP00OpAtm
 Xx0mqgE6lfLPfbXWRnuOzXbP3IinRas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

If the user wants a userspace managed VM (EN_VM_BIND) don't silently
fall back to shared VM.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 52ff72d8e17a..73d99bde26f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -234,7 +234,8 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 	if (!ctx->vm) {
 		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-		smp_store_release(&ctx->vm, vm);
+		if (!IS_ERR_OR_NULL(vm))
+			smp_store_release(&ctx->vm, vm);
 	}
 
 	return ctx->vm;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..d02c37380414 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -875,7 +875,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
 
-	if (IS_ERR_OR_NULL(vm))
+	if (IS_ERR_OR_NULL(vm) && !kernel_managed)
 		vm = drm_gpuvm_get(gpu->vm);
 
 	return vm;
-- 
2.55.0

