Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DADE4052A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340615; cv=none; b=tKcUf2awRN9saZ7xsyC5sbVJwAPV4MUrObBap/7EcdR5vLLorEXJP4+I2kSMsc1uWv0r4EWdubJJ040wvI7BNVPLDKw82SMc26s+CD+FxRkB13vqa3T6uHPD1ouv03UYs3gE36O62ZLRTF6oSxq/ybX4Bn1/IwlJVh3Eu78TBHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340615; c=relaxed/simple;
	bh=x6iVVANElOzzftScgIHxMzDKlbc0yJweoGktavR7ooE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mImgQMSNdIF2OOfXJTK+Dz0kCX2rzb7aK5ikbucWK5tg75C9VlV49ZQSf+BPjPmU1mrMI8Iz0QLpNqUGFWOE0mlTBfKs87vsMX9XfbTFyMWioIauEs8fTEznoCtkC7tUL/zczy7iEND2tC7NAxReGHkcD9FE9Ux2Q7V0jb9zh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K24YfTFI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7G9TrrB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K24YfTFI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7G9TrrB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3BYX2108196
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5Uxk/s1mozQ
	uhwk+cHuG2u1j538IneDvUnNY45Gdb+E=; b=K24YfTFI+CLqhUK1gVVXSJFSSPH
	x13wMrLdC5xvYp26gD36kRWGFdhbiw3sWvctLYNDk3JLMWB+Cx2XAvOwWRfvXmU1
	1jiDqIS5G5T7dEsvS7wj95JPnmh4xzn+fZ/DJu52y5WWfMzUD3tI34IUXKpWgXo7
	UoDHZHILcY9hwH62wZHtRF4wkcaQH8VaTTeIMVc/9U20As8NHF8Xv6G2UMcNa+CI
	z/Bgvb3ab9xv400jGzQffY3XLqO3SB5BTOU8rzKLnl2A8eFp4lFp3aWLyQJQKXqG
	B0Mo4NR/v+NXWbOxmifkfDtwxoQVAokczisv8uRwcqkWNuLTS76olq1tRRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8fvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484ba00601so1304035b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340613; x=1785945413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Uxk/s1mozQuhwk+cHuG2u1j538IneDvUnNY45Gdb+E=;
        b=g7G9TrrBBjAaKZhnmjGshte6dfSWuhEuaG9ZjiALvNojN5dm/R/2kneTVstG3P1eS4
         9dCTZrAx7QUlyl39/mxVvd6jNAVhW3Q2sFPCpkkMPHVAc9zCqqu++nyY6iMzYpdSkuAB
         ID8q5Bh+TQ6Fvtac6oomSonhp30r/TfiHaBVQWbprdfC/GFsD6n7AzVAmx0FOcllzBVr
         4h1rOPCAEyOEwHMUXyUot9ahdycgNYhBfFgPC9riGGe6W0Jr/I/qAFMNzMIj4ThLlYcK
         jDtz7ZqQhMflot8PeJXQCeTh9OdDjn8AcFhPM3a3ktBeAzrgwy5nXy69vFtxAsbdpAsY
         upKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340613; x=1785945413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Uxk/s1mozQuhwk+cHuG2u1j538IneDvUnNY45Gdb+E=;
        b=FoSQVrina/Cpu32DWzM/y59Ms3Q/dn+yMEFhjExz12Wt1VCuV8YMA23Yv8H3Pux2Uw
         RYx725mJuf76ZJA7oiEpknEZopCwxI4ZWDXqGbSkqbDdUQXdd+NPD79ExFoayAVbEP3u
         NbyN0yqnmto9s8Pzto9NVHQjiB/9HXTNyT7PVGskCbsGaba0RT05MoZ2i+Em12Ghzicl
         tQnrt5c84ubWB/USyo+y3sS+OWal/50t70HkOGU5eQWMuuUpFRqpP/cXggW5bmsvvAHg
         NoG40qEQtJYRilxCnQuPm5/evEEfaJansDu01pyGs+p8wuzkVKHv5CZvCnK33NB2Tyru
         qw0g==
X-Gm-Message-State: AOJu0YxAe+FGFRB7T8OlO+gEVlV1pbqMYqyMxpxs1byz2caMh0pQa6qP
	GiFfPsqj+RnOaOwgqEFOTF3fx82KfF2bQBm+YZHyixd7kw0Z2j+EJP53KSnvkco7zgwNh/s5PTx
	GmMTFMzC8ieXUxkqWwIj9xB1CbV171CUiTGqTunYo1ST1Z5BSKD27Fjb7VHX07mly9/EC
X-Gm-Gg: AR+sD10VfVA9YTWgGzKKwRQFfeeSKfj8UbVsLrZB7vWXXslwEp27si1n0RjkIgE5qio
	99dLnnY1Pl6YeaYvrDx0k0GVHBF9ULUl0JVlwE+jgSGU8T8+9+GhRQHjUUdQOJHbcLRzKGPt6h7
	pZVN4SjZvsYZHJEgMVYjPYRdipRkjbPGpDqwYn+y2FRI5bbnIkFVbbrigOM3dbhhEECz4Ile/kE
	lWfz+NJEUS2v1WasJ8WrV5CKeeMsQfk0CEOmw4T93xr50CFCIRBjEwUNckMrI9ucE367DD+dUMj
	Pm6mP/cuT7dN7FWrA/xYIv3eDVZCC+NSADgE1bCCW0/MmyTmV6uSq+4ZlwpLYtbItzP8K9ZIhFu
	jwsQrrgg2gBiPwZsmvGASX6f5MhsVf4VxLPGaAuhRsJJKKFk=
X-Received: by 2002:a05:6a00:2308:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84e932ca8d4mr7961124b3a.7.1785340612816;
        Wed, 29 Jul 2026 08:56:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84e932ca8d4mr7961099b3a.7.1785340612342;
        Wed, 29 Jul 2026 08:56:52 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0301b3csm1604311b3a.34.2026.07.29.08.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:56:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 01/17] drm/msm: Fix barriers accessing ctx vm
Date: Wed, 29 Jul 2026 08:55:38 -0700
Message-ID: <20260729155609.20190-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX8qEqK5F3KsDb
 XCbgj6UtK8y0pxe8wXyH1TP+hpSOSWP/wWM0PotjINoqDLMyaB4FMVxU+SzLMAIjlfLGt5ftres
 uisY4Kk+hnxmkbYUjKlzUflMVGCmQK0=
X-Proofpoint-ORIG-GUID: LSxReVlF290x-KJaxg2wwrmGPc45LK5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX/C8QSAs1pr+K
 Z+6RXVEbXSDgnRXJ9ibgjCniGQeYD5dSJzYUb/JGgBVRn3Cu1IEgcgmfVkbaTJ2G/pZTGJ3dqgs
 SMUwsbsB18YrcPiH6qvZNcn2zdHRcjW4/ARMEWqa9Y9nXADSdU3dZ/3lpkfOvu8wLYzyYkvY0UH
 2hFQvMOegXjRsVo+BGFL/V8bO/QI9QhAAz/cHvsJzWB4n4txEPzkP2NB4lPB1c2HlOlDgZ56qBF
 SmZGFlsThjXW+2IYzH/7Bp5KDjjARp3zs7pBhs+CyZECno2iOdRqMfxoM3HTyqwKSFpzMke2m/n
 Qf/Ym4Wi4fPldOYV0hbGkGsnxiwBrLJma3lShgmwuRfz96ZRxHb8rytYjNAR80kGJL7BXBaHqAH
 qaqAwFu04S7kGXkOLU+RpiGrNotcPdBjsQuveAuMUCNBsML/aXX3ZOBS7DWG22Fr/ZDXJ2lI232
 kalvEM5vUNAygR0zoSw==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a22c5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PXeb_Y4BrUyLDKu8J0IA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LSxReVlF290x-KJaxg2wwrmGPc45LK5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290127

Don't rely on store ordering to protect us from caller seeing a
partially initialized vm.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 32d5ebea2596..ec88155e0ed7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -224,18 +224,19 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 {
 	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gpuvm *vm = smp_load_acquire(&ctx->vm);
 
 	/* Once ctx->vm is created it is valid for the lifetime of the context: */
-	if (ctx->vm)
-		return ctx->vm;
+	if (vm)
+		return vm;
+
+	guard(mutex)(&init_lock);
 
-	mutex_lock(&init_lock);
 	if (!ctx->vm) {
-		ctx->vm = msm_gpu_create_private_vm(
+		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-
+		smp_store_release(&ctx->vm, vm);
 	}
-	mutex_unlock(&init_lock);
 
 	return ctx->vm;
 }
-- 
2.55.0

