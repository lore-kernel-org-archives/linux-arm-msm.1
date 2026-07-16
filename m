Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9C3537FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232952; cv=none; b=YZngqfAqfKiMEbkhtyefqUjHOKFQpK8jqWbr9dDHjQkGGilVjl73uv1EuEqIMnswR+cqL8uIQjXFpG3Og7MMEQDahWyKt63CMhd4QebG8/HfGGfLWOS21hYrWq6eifTM99pZjYLXOvCVf3PI+GIZ613WVOC665V26bUQCoTG/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232952; c=relaxed/simple;
	bh=GxVogIMhu1mzW4YRsiI52i5vAv+yBYbcef61tqhGQOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7aPFVKE21H9Cr/fXq++pFtvCcWg5xuap7AOg6CYpjQ3ssSIVJnoQsXqrwVSiSsk3siy4+MRbMTdsnhYpG0lR/SmQX6y9jJ3Z6y7jHY4Psa/4eLZiSKynLcNRhO1yqUXq5rrSPkB481dg5enRkeruJOv/LNycdFkHSH71XaAV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=in4g1Utl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/gmD/Vm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="in4g1Utl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/gmD/Vm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoOxM3753238
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YHzHGsRPIUG
	VAMOUo6qKw+18SGmm5iq6ipy2Wi/zZYE=; b=in4g1Utl1ieeFIZ6MecIVVSwUK8
	gfIFKI4yMv1i5RUM9+X6TYJpJEyMsyaLs3NGs+56Is7/rSLJagPtt46OD4qm9nT8
	h1n4xzcHMTq5IjUvXcMEkfabwKezxg6HWnez5fVMCpQRHy82hrdiKApKMWMRPIi3
	dHge/835nYJGZyV4bDa0+CUOr556zvXfhRxhN79bFzzE5u4Ybtf701auGVvhZ7vL
	eYleISm8plKVbCMjAQzEXUds4CEnIeAiPfxJ4Poj1L6O9HTfZxyjYEGW9eS9ar75
	tUwpQXcC7h7EmVBJYRkQRvqfBUCHDxYcrEdcpCZWKIElTRYtafDVdlXYYaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex35mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso88926575ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232949; x=1784837749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHzHGsRPIUGVAMOUo6qKw+18SGmm5iq6ipy2Wi/zZYE=;
        b=R/gmD/VmDgtYwoGT7M//0q2a2Fj90K0poBQp6HLVS7/p136yB8SC7PeAclM9rCP0+R
         4lHpw2VJKfomQ3xti/MJxleZCOqqBCOO5W3Mzr6zQJaWSMFU+HX/IuxIGEPUXfhWC/Z1
         OyLwpeufk5rOII1n9AsGRwBU8qpiycar8exZb/0lPU61hLVbAL+VCP1aDH3McHaLwZrR
         4NXorjYPTJQG6bogDgmwFsvkg50jb7WesJNkMep7yJsiTr7mD8vPEPAC3NjAhmBbYizA
         zgy+HVX8RMPtysHmIG7aW1YeTTFMJfpAr6rNUU9qCPmyHlnF9CuMl2ltKZAf1NvXinSk
         hR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232949; x=1784837749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHzHGsRPIUGVAMOUo6qKw+18SGmm5iq6ipy2Wi/zZYE=;
        b=KGQIRDPTV7DSXCVPV0OCnMrQRMOVgeM3MhRUB8RowNVvZFW0lLuefOhrHQZdVHFy1L
         0XalkIvbZdu1bs3pifwf4ltcRSuo7PT8LX+hn51cEvfGKmcjt8vGBE0XHKWWJgAAye8A
         XEp9Vq4aJjcNH/AM9mVbmmuO60ISg8vBIuveKMfVxVXytzg57eAFidtAyM6FQ2Q8Xs7z
         gr3giOhbTTWHf0r9dqxeXhKpPr9nj6loMkDDq3z7+aE0QurOs/QajFpJhaoPCehLi27e
         EeTjNOrlUttptFq5JbiZsw4sYYnXj0QEmnArgqq/NCQzOLt6BnExTfA6gMNFwPK1qhYB
         pOlw==
X-Gm-Message-State: AOJu0Ywx+mTrChDGm6Rud4pOqHkDBQrcocLMuN/gm1J6zRkJPGFmHlAu
	2eqXtYV8fr/l80bFmEWl3LPP31+bjJ9DP2EWVw2Q8nE6PPEspb027rEMAfd0JaK+j03ElJVp49Y
	gmQAkFfuwDmErWlqfQUr9ktBrxpYmh9mzumELmYlVJQ3KXHxLYsQ8SrAiK4DaMbr1cjAH
X-Gm-Gg: AfdE7cnddOrAAROqxI1zauPOlry45QVYl/+GqbLsBbR2ZHlWPYhxQEDbFq76xtv1IdA
	yeP7yikEVbzNA27H2vtzxFnC/6id0Nqa2oqiA3098ezxjox/Bh+PPP5EeEwCycdoG6th2i6LLYA
	lip75OFsYxOreKIfEdp0Jc3F8XrQ8sjNBHsIIR4SI6zzU5qY2CsUX+FrQXwh3miVS8gHUu/Een4
	i43iJkft6hUcHdTr/cyKsOXGo6BGpgcPJPGgxNuQgCKaTQ27ZYr/CZYV0zZjcdP5/BXn0/rbK3W
	IqIjUYTKOuu992PIFjjKTw5G3/hjvuTjKVIb+1qE4iPMJB6/68xYUz4/VaI/Isn6mWE6WydnGjn
	8gGSwLa+kWoZhY+JdUT1cBBgUBdX8kbVBkz+0YPnMQWJJWP0=
X-Received: by 2002:a17:902:f64d:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2cee9b82e93mr139874165ad.39.1784232948858;
        Thu, 16 Jul 2026 13:15:48 -0700 (PDT)
X-Received: by 2002:a17:902:f64d:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2cee9b82e93mr139873795ad.39.1784232948438;
        Thu, 16 Jul 2026 13:15:48 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10120539sm25289885ad.19.2026.07.16.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:47 -0700 (PDT)
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
Subject: [PATCH v5 01/10] drm/msm: Fix barriers accessing ctx vm
Date: Thu, 16 Jul 2026 13:15:24 -0700
Message-ID: <20260716201538.365824-2-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a593bf5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PXeb_Y4BrUyLDKu8J0IA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YP_9wVfUfnIGnvrgPpWPEsKQrkb2PL80
X-Proofpoint-GUID: YP_9wVfUfnIGnvrgPpWPEsKQrkb2PL80
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfXzmCb3yinGzMk
 mSdTDZle3yy15hIG51FtBXloH56gdtG1bPXLYQpRG9FKXPyj6E6EKPObqWdSM2eZKw57MLFawdb
 BhhvKRMkEtM8baBt8I8VtIKSAlN8qV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX3eyxBxbE1su9
 Wx57CztroFQ36dIhv9HQfOEjZps48Nqb3rArSBgCG0tnb2x0LC7VSf4dep2nCimJvIfTorPSqDg
 GKJM1RKdKGTDQqcQmUPgO6aw3h77LHA35aDQQ1SvgyZskj0Ypg4opF+980GFFyfQbKUqIkuED0v
 1GAp81v1mtcHoagWCr4y5lOWo0dMKwOj38TaTnzEe/V0doypfPEiSgAk/tTCP4SXBos9cgq9LLl
 dGF9hg3j/EbSqC3+K/MFq+VIXbsnCkH9EXCCNOTGDnozoCbs++0LSCgrvq1PB6p+hYxJ0vjEyuI
 KrWlkrkp8GmsaG4RG5/XX4A03SMOpXp9nzm8nZMhL1KBvJcko4+BRHlkouVcgU10/9hSOe3WthR
 ZLawI8oPZQRt0euB34V5olTq4Trm5600wgnDgVa0nvHuawuj7amhcmANFHo+Hk81+v9drfWCXHp
 sAyaWQKJsOafGqGIxgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

Don't rely on store ordering to protect us from caller seeing a
partially initialized vm.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: feb8ef4636a4 ("drm/msm: Add opt-in for VM_BIND")
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

