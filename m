Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1A21883E
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217311; cv=none; b=A46tCBb0RaUUnnIgfC2/scPd0MhBIZD+DQ4GyIcijO5XiBoiLhTiBY6BUVW5gU2By9sRcS/t1wCAZn7hvwgKwbM86RWA1utzs8990p9gkktSLUPwzAGr1Ad4rwO2Feb6f2k2FTtZhwAoMfbsEMVQMX7XK+V/h7TMcr2TjK4YiJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217311; c=relaxed/simple;
	bh=4uipgtNRIs5qYNUtyZUsdJb0hErPAZce83PVI4j94so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AoVX5el8dWZGaPaH3s/MHPjF0WKVLdnaDcgia883XWV2Oupq/dcwAnikXnLN3bLiUtgM3nwwXkAcL8RnSIHbXnBq9Bu4E/DbJFm3WpzVXwOVzlWVGW5dbXOBMgjktNde3VDYHgM+9WDUcNke1M1xcWxGvJtDZdF3EXLUfIV2oFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfMEWa69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEOyk6Yk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfMEWa69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEOyk6Yk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBe2vh3759702
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8zAn/guR7xH19vvVnJFNiMrsIee98EJBNEAzw4/qBE=; b=hfMEWa697HLp2ZKw
	aA+Nz3thc1sl8jU4pjn2fuM5N9p4zMWU0EVC9bHm7gv0guz0JI4VdMEJPfmpWrSZ
	I0X8rBEiQRBSIwstA7WskrWKk/FssntFjpQNQqiIBZGkkap4BDCRgf86xdeCD2Ey
	kV1pdjjlIxQVYb/xpvKZfzyHBYV23hCqe8lC4ZgS953MAM53AX9fzWFLGNSmTibW
	xuCEa04FGXRWRGVMU0AN48/UGCfT0fV9ieY7ixRwQT3TJXfHeubHxhFP57ZPicqA
	tzARAfUOaC3ONKbaPTIuZ37pJc0FuDnD9ZkT2pFfkA1cBMDEQ7EMSDPs11CqX94H
	oWabyQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8ybe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78481f4ba52so1629272137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217308; x=1789822108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8zAn/guR7xH19vvVnJFNiMrsIee98EJBNEAzw4/qBE=;
        b=XEOyk6Ykk1gF+lElPCr7L3FXUXaUvFpNvuNKVWhtfZmvWsMsKNvb5YYU2w1Fn04ssw
         vtuMeGu+qcn3Ws1M/MgfKHVB2k9bkPo6taIOL0HsMwVQmbtrwHFbqIXY3VvemOeohkj/
         g849YZVgBkeY6w4hQOfs8oiz68duww7is637XK8Kc1dPSE/g2XrLnjsD0knjRngATJ4W
         gyr7MVhuCnLhsZ38IiFErdZvPoHuhynnXHMNZVKhF3D8EszpNIymCZQMqLVGv+i7qUfV
         sL09k7IUTQucUgjdK7R2x4ZWfFLUCDdNtBYREoDh8iQfX+hLws3a6HT0m0QtK6i2gEcP
         zMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217308; x=1789822108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8zAn/guR7xH19vvVnJFNiMrsIee98EJBNEAzw4/qBE=;
        b=dV2WT/ly83rJkcNwWKgQoF6l6zMiy6P2w99dlglb/QJVHyPGiLSOLFKZmuhp240yFp
         zSH1h5YiGOdJImDtVTe92AHzjoLraKxsdBWIQbRuwOgi1MxFvK67FNVAw0VcRVPJR4FY
         P8TbBTOfKyxczRZw4gT9TEse0pt1CG9TqQuYRUnnSY9SlAjqYukkZYzqFL9lLPcsxhvW
         xTvvYOZVUyP7XyePAdeb/jC0c5brbjgKECk5GqGUnhfdjPIJc5Zgrd3gc7uBxTtSoS9Y
         dkU/u74dDblLzRaUm1rAOYAGWjCROaYfpfIlpBKFVYL9N0Ot0zlsHsxOpMgy8VYh2/pv
         0ZWw==
X-Gm-Message-State: AFuF++l0/RNWfqZ+4hH08uwoKkRFkn5nRxIvNtjYCsIj8bT1JGAqvhvI
	E3uJD/OKm/rFnqqYFicGpzhNydKw7wcWQkMhcIucoFzqIhpOv2jiqy7Cpfh68VRntOQ4wzi24uO
	Lmqyd1Jwhjezgn54KMM/Gh9gGVpIlrxLKTnLqQ75+0oaJL1xluGQFQ1Y5BO0hXwIuwDPF
X-Gm-Gg: AYBFou3YDlI0sc4sFK9E4YGCS/MePUkk5274E1ixauDY4cPYWVA78Lw0YMwxKimLY95
	soUoqbqEECVEHJkBtVAggNPLhccYmAYqL7GgqWRthj2pO4jHn3iRfgfUooSmGQFu/RNFqxHv9HK
	v4NKcojhpENVa/jEFHjy4sKS1Dh8xWnpZZ93oII7kh7mteR6TaTGDV6YBo7kMEHy3FmAYF+kKK2
	Yy22O9HkWd0Uwe1pHAr9ZW3mUcwOL6uzpnNhA1IJvzm0HqxpT2RAXj2I/z8PykQKUGzSDBrtQk8
	lHdtqlepezuqW3d7aLsNcLM2zPm/64ldKbRop236h0IhTMh4zEETaXeoF/pqd7Si4P2LszEeh8K
	igqnfT8WFOYUOvJXM2PFnMC2hKL2P1FS58iPlo/TxPtknYf6cI5u/2wuvvtP7xe9xA42UEDP9VQ
	hXWlsEBciEyYLF
X-Received: by 2002:a05:6102:8607:20b0:783:79ac:9db2 with SMTP id ada2fe7eead31-792a47f5970mr4006984137.3.1789217307941;
        Sat, 12 Sep 2026 05:48:27 -0700 (PDT)
X-Received: by 2002:a05:6102:8607:20b0:783:79ac:9db2 with SMTP id ada2fe7eead31-792a47f5970mr4006948137.3.1789217307256;
        Sat, 12 Sep 2026 05:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:21 +0300
Subject: [PATCH v3 1/8] drm/msm: serialise framebuffer pin state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4844;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4uipgtNRIs5qYNUtyZUsdJb0hErPAZce83PVI4j94so=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoWhRUgj92XA1t8cgUikty59wtzwlwc/cc+g
 LvGItd1o8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFgAKCRCLPIo+Aiko
 1SVBB/wIDj2hNjtFS94Dq2NKOqOACF7g4dlURrxlnTY7k/i770eR0iBP1RzHD2/nzFAvRvR2TEL
 NzrHxZi9Delu7Dkie+3Rw/EOmBjD4QKi/6ZUOJ5BnKuGwV4to8DwMyTl/xBRwFHbcobHO7cJngj
 qRRah3PqgGm0KiKbMGa1OO64bVfGEMH7fZRY4UI65B7mCHv6GGlHcY+gBu+bKIPv6wuOpur/hov
 x7G3mDN3MdAn/eaj/VCQdaTsF7671HLgQJvjW3i8r6RncMxqBGoQDu+11fJlIxjeE8mTGEpc8HW
 1YMcQQeI4lQmBAYmten0N/y63HDQBuzc5zyz4BIyKyESYWy9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX6evFVO/RoVei
 8TrpgVcuR+iPgkif+Z4CEL4iyQCAI8EKTxZAYasXpldNl6XS6q9FQM4UxkwT9BnuNlzdSGWtPqJ
 /HaIlRPFmLFkPncebgQrEgsVD+C6khc=
X-Proofpoint-GUID: Yx0A_ghu78tLEqVXkSNk6AWWmnWs_CHN
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa54a1c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=-SLBVWGn-DbGgWclMpAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: Yx0A_ghu78tLEqVXkSNk6AWWmnWs_CHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX6Tf8M1i1keDz
 8iz2cashpIMh+3tRQFHeqtlUEbBo+ma+SvPvuu58vB2i3Z+JPMxzC+gu/Z1QOxZl/WIDOrs4P/J
 jlnV+iisedCh4GDhiid20KJU/U4sXWAVuerzsnHi068kK7QCeYuYk8okWsN9DsVaZlmUzaxvL+G
 tN92CcuGXdDkVNePgxuSNXwonS+p8eA23auCzv46jfimzvecGssvUWMxgyuXGujDr4tVqevWaUk
 nzg/2lA63YTJ1OvB98SENQu4N5vm057vXnSRDuXWYzR1DSOYHEpkr42m1M8D8okzClBhsVQqHTq
 m4TqQ4hKaa10XcBWaK1UfE+4SdtVMpvtmgsPPCnw/E+pwtPtvnan7LhaXgxX9DYQH1nO2dKmy7b
 LFNLcPdbZeO7nM6idGUl968byZbJRQpPjXuCy/twfYIGOhB2OzNjzCzmFbP6GoK/8fJubuIr0Kx
 5YKXxfcSrWHfem3NdgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

prepare_count, iova[] and the pins they describe are updated locklessly,
but drm_atomic_helper_commit() prepares a new state in parallel with the
completion of the previous one -- stall_checks() only stalls on the second
previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
in ->cleanup_fb(), and for a double-buffered flip that is the same
framebuffer:

  cleanup: prepare_count 1 -> 0
  prepare: prepare_count 0 -> 1, pins, stores iova[]
  cleanup: memset(iova, 0)

leaving the plane programmed with a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
Refcount framebuffer pins"): a prepare which finds the count non-zero
returns at once, assuming iova[] is populated.

Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
adds the framebuffer to the object idr, from where userspace can reach it
before msm_framebuffer_init() returns, so take the private state out of
its way and initialise it first.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..77415302e6d8 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -22,9 +22,12 @@ struct msm_framebuffer {
 	/* Count of # of attached planes which need dirtyfb: */
 	refcount_t dirtyfb;
 
+	/* Protects the pin state below: */
+	struct mutex lock;
+
 	/* Framebuffer per-plane address, if pinned, else zero: */
 	uint64_t iova[DRM_FORMAT_MAX_PLANES];
-	atomic_t prepare_count;
+	unsigned int prepare_count;
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
@@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 					 clips, num_clips);
 }
 
+static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
+{
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+
+	mutex_destroy(&msm_fb->lock);
+	drm_gem_fb_destroy(fb);
+}
+
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
-	.destroy = drm_gem_fb_destroy,
+	.destroy = msm_framebuffer_destroy,
 	.dirty = msm_framebuffer_dirtyfb,
 };
 
@@ -76,13 +87,15 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	struct msm_drm_private *priv = fb->dev->dev_private;
 	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
-	int ret, i, n = fb->format->num_planes;
+	int ret = 0, i, n = fb->format->num_planes;
 
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
-		return 0;
+	mutex_lock(&msm_fb->lock);
+
+	if (msm_fb->prepare_count++)
+		goto out;
 
 	for (i = 0; i < n; i++) {
 		msm_gem_vma_get(fb->obj[i]);
@@ -90,10 +103,13 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
-			return ret;
+			break;
 	}
 
-	return 0;
+out:
+	mutex_unlock(&msm_fb->lock);
+
+	return ret;
 }
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
@@ -106,8 +122,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
-	if (atomic_dec_return(&msm_fb->prepare_count))
-		return;
+	mutex_lock(&msm_fb->lock);
+
+	if (--msm_fb->prepare_count)
+		goto out;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 
@@ -115,6 +133,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 		msm_gem_unpin_iova(fb->obj[i], vm);
 		msm_gem_vma_put(fb->obj[i]);
 	}
+
+out:
+	mutex_unlock(&msm_fb->lock);
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
@@ -199,14 +220,15 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 
 	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
+	refcount_set(&msm_fb->dirtyfb, 1);
+	mutex_init(&msm_fb->lock);
+
 	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n", ret);
 		goto fail;
 	}
 
-	refcount_set(&msm_fb->dirtyfb, 1);
-
 	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;

-- 
2.47.3

