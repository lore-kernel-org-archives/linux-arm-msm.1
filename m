Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF304D90DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340641; cv=none; b=sxre0LjKLhV6H+zvK9CSB+7rHrF73YA+ROSjTNvCwUVM/fhHD+jkqZVSB10neoUDrHdW3crs1jQ/3/INpSUbJFaAhdSL+EgeNWdvUFUEiHdkQdIFFyB63v4XE5g/rgxO+VNSzYOgV+CuaYuzI711gUY1/n5c8WTcLLP+CGedjBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340641; c=relaxed/simple;
	bh=+8OgFO6VNJ8TsixnL3Bkmbua4zl1BlZxa3GBrY+qUZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3lLTO4RjRQVU4/u0F7d4W5LN+8NB1kWVp3JXkYSVl9RInr7Z5dW/+yAxIWaq7WeE+ivOE2RSLpzXCX6HjWPxW8S805uLsNLqaiHVSqBWDnAk/VFJ+YAwXN1ZFAfFvMl/Gm81TQ1cNEgmiojT5IPlqfd2OLnh2KfbWnhGXhr+HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLW+n1ZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5mI11q+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLW+n1ZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5mI11q+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3MZP2593259
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rc/ljxoshAi
	Nv4QJKXYpPgimbLWzx8XhYbA7LeAuwfE=; b=NLW+n1ZFkIgpdJRzhttM74NX2Vp
	mV1yiw+VWqwLzB3KDZduqA0EQZooSt/+BsXgJV/1Auzf/MFZsG1RNBdmOybSY9ZU
	F5r2Q0/2NUjGeX2izKZiwKNQ5gzJK274JDmFKdZENGS5COmbqBk6N0/eeKxrudo0
	II9vU2lO8PDPymkWI8Ps9lLeu9K8GejOCicLOiwOiRwzttMJGijhmOZclegy0AqH
	HqspeH0mA7lp6z1+ERoosuxvBJFLZDAWP7BnY9CRFrArvxcL1R1mLJ5NA8V6oP+W
	RLTq0YeGeGEPtNFkHUALOUsaIw297ugR1lv+ZmQikDRXB1HdgshZSdE6Xwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08h1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1346900b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340639; x=1785945439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc/ljxoshAiNv4QJKXYpPgimbLWzx8XhYbA7LeAuwfE=;
        b=N5mI11q+PfllW2oYGIFDuZnYj/ZlmBeH6wTH4NrWdma7i4N/9z6XWxUsql1PHUV1/4
         l4n+Hchxe45jwS/4qy5usqurBqgPdNJu9n3lWd7pXEBUTmeMA7qnc3Ufo9FmpXr5KmjX
         sMfNuXCAj1nt3PGtL3KfFyEws7qPWVEdywsnJ6V7OdJQgkoqJ0md+DkS3ndbHlnNqb7b
         I4KoBLjppXv0nueru5qpNiJNL8Gy7tLbTIt6hNIcYcCUbV70ccTojSQ2XNOyUpTO2TfE
         pvbPMxGmtTjbtF96eWLvkzgNTGI6Q/9DgeoUiwSwkVrvHbrVieppLHkvoqIn7ylOmAta
         LO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340639; x=1785945439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc/ljxoshAiNv4QJKXYpPgimbLWzx8XhYbA7LeAuwfE=;
        b=UYdVFBGARyOm/m8kUJWHXvBmeandeeddIrMX2nu1cHTJLcVbI6zPSBT2eh4sKFhcdC
         KcAEsU9IsccwQllJolN2HOXk1F63IPEWzjlJlrT+BtvBXGfMyjiwIJsC68u7ql44IyYn
         N3g55UpZdFOnoXfIxhvmhSbw7ffyzkeupaTnVeq3o0sUMSqAaDEc/2lP7sdlTE0fIpQ6
         TAc3acC8Vr2bVGRj9HdtuVE0T1IdayNZkFLiwBHfwWVW51zESsD3EkGayCnnP85iHJwf
         QhrpLG0iF/rmFAxujBFkVQpYl/6n0cTafNMGEK+9dy/J8eIt5gmLqpvaJ/KPn3dZRIvM
         LXhQ==
X-Gm-Message-State: AOJu0Yx/VZffw/GLG+P2RDf2UzeCEu7PM/v7DEz0GuJOfmDJyh+Uxbin
	fKjtwyDJeGXYvCrxfr0HHPHbFJLJzg9RK4sm0e4s609Osgpy9xLYg05FSaNmV4pVTNM0GXR52fD
	VI/EKXvKdWcj6gPgIN75/f5CADhtlrkwlm5RMiT3+MpiXL4LvUrwyXFwt2ZcE5vdcbNab
X-Gm-Gg: AR+sD11aE9klKb8HXelivPB6z0tu2MmAzU26jn+aDbf6ZK2Z0GPwaVrAWrHbbiqmV71
	konDYKctGUANP527n9ML6Fhttzhk80yKfLr3w9bWtZRIYxw4bd+krOzrsASyfs0qs3yv7uJmfge
	HzmmGbsyd8QedPeiLXNSvT4xWXXaXYB4/KpPUQO2cvt69dZ042z8yrsiE80U9PiO9XjUUPMIXX2
	ZXia/OaqQR2WdiE0JjOxre0dPc4s8t0wJ2Whq0Br/d2tM7s8Lvtah+bm7AjIc/qWYT7lys4imx0
	whEIxGayjwL8lfRE/KUWy+QLxqbGI8YNh8zq1aNM39865lJzlgQHjSoQkuLuh/gCGo39lNgJnZU
	Pbyi/x3QY6lhlkLt3Aa+LEeu2ILma0Wqw2VASfCxT5Yhirts=
X-Received: by 2002:a05:6a00:12e6:b0:846:2f3d:6259 with SMTP id d2e1a72fcca58-84e932c6985mr7407586b3a.57.1785340639004;
        Wed, 29 Jul 2026 08:57:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e6:b0:846:2f3d:6259 with SMTP id d2e1a72fcca58-84e932c6985mr7407543b3a.57.1785340638600;
        Wed, 29 Jul 2026 08:57:18 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea7344ca8sm1211056b3a.21.2026.07.29.08.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:18 -0700 (PDT)
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
Subject: [PATCH v7 17/17] drm/msm: Fixup invalid overflow check
Date: Wed, 29 Jul 2026 08:55:54 -0700
Message-ID: <20260729155609.20190-18-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX5JKl4kgyKIpt
 4MTAD9NOt+W2urIye6OiAB/fNE/xaWQB8qZ2a2904xrcgaInazdRJabyHIwU1vNamxGHWttT+Bh
 HchyC1Dig54YD6tgha0YDxidtLwWiblA+6M+bWAYynnBOoUZSySd/B4zh7e/ArGADp+/8BXmt/e
 rrOA4gN64k05SFVlnoMQJFgkBLk5OqQw7Erwd9FeCxoYuHEOtX32rEJSBKdSroVvBdmJPlnUnGI
 ZGmCEH2rTzgAUS5cK+8ADnaQQ3dViyeOFltHjUcHlvo+wB/UqdEjHkx6M6KqBgzvTVRFKg0MIEq
 pydeOTc8uQ/9jjkGN1VHA8C2o4/ZRRmG2b8Pweku8dHxEnLA6KtQWBUgndhB8UoMyLAMKjUwkYe
 j5qbca4JShjf0HW7XFTUZLhB91Fps/xCKZK2C938RwDEqNbQl5dUGVLmTFfXDdsPNrJQGrTM1Hw
 aditX+OZgk0RtoB3xTQ==
X-Proofpoint-GUID: KZSRZsKTFtxCGwXLzzOR0wg_inh6J2Vg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX3KqfUmvLxING
 BrC6OfpAYSV7ra8RZ8g2qCxaf2lOoIaxr7rdkJgjpVqLZiwYXUcoERYmge80QQQaMdCijtGJkWs
 uSJJr8EkxkAEgyfbWX1aAUy3UnP2JvI=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a22df cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uVkA5J_fsNn9jy38BCIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: KZSRZsKTFtxCGwXLzzOR0wg_inh6J2Vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290127

On overflow struct_size() would return SIZE_MAX.  But kzalloc() (and
friends) check this already, so we can just remove the check.

On the other hand, we should be using the overflow helpers to calculate
the cmd array size.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6b0bee6c39bc..5862db05297a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -36,14 +36,11 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_gem_submit *submit;
-	uint64_t sz;
+	size_t sz;
 	int ret;
 
-	sz = struct_size(submit, bos, nr_bos) +
-			((u64)nr_cmds * sizeof(submit->cmd[0]));
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
+	sz = size_add(struct_size(submit, bos, nr_bos),
+		      array_size(sizeof(submit->cmd[0]), nr_cmds));
 
 	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 	if (!submit)
-- 
2.55.0

