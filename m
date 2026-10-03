Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79452292B2E
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987439; cv=none; b=cvtXbhI6m0qUEzJjbTi8zPWeli9WHNAA0vZ4PFkJ0TJFfDUr7EZDMfVlU4r9dJlcl4RHzkBDh4f5oLSNHCiIH6J3dMpRYGHCqhSMaLn5gxt/+swhK9aXGrXXokzKllTX8mE7aSkMUKVtIfC7n9g8p5wZbhuERp875a7tkHWBAV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987439; c=relaxed/simple;
	bh=/Y4+Ew8bQbr3xd07TJNsXmM99kEeC3E5cOSJ3Rcs2qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7fnLc4nMh2KjMuiEw46YgS50fBkfPMjlkmi6ZY9ufaIHf/G5IEzcMFXmgp17NdWjJmbgWn2WYX9IYSCQDf9rkeriFcanWYSUdL/ll9Mb+FbVT0LDsX/u6oIGtGoyj3n95SIa7auu7TAr6Tey0q4fOooxyGAuOJj7HKJXIRz4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3Er2bYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baI4zP+y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3Er2bYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baI4zP+y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NedEw2502460
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=; b=U3Er2bYQbYYenOG3
	yz//5n/vcuk8BFff79e3s5ptrjkIEUUoCjw67ERR2aXKSg91vMMrGwKMK23T1tCo
	hPtTYFm3ZLDKv9LW08Bfb7aJgcqbZlpmfaL123hV1k7TlhXbu4dp6esJwJK9AVKf
	xNQC1Oj51tGhjy+3V1uXU7yzTT7C4/KIeQ2VCB85mI2PFF2JjFxm1ErY3ApXZrms
	K2FU+wMgQ9K82siMho0PJ185+q6D9j89U/CYEIaGZL3c6JxTVoFul0JqUZjPbFjv
	lRnNAuRuO7L6w2I9wmGvk9g1HrGEE8HJKLtkykk5BNbO7J1n1RvV44k3yYfwwHzg
	aZKDgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8ss1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so39103885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987432; x=1791592232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=baI4zP+y87rpNwM6tEGx2nmYOoB2CgfXFDbGAy/bvYjv7WQwyU9yrq9x5kcjXEq841
         gJjn8ha2g6NIz9cEEE9A5RTq1JwhIioCkccM20KHpM5QlVsDnPH8KOPVUa5+j0Ph9YIP
         e8Wmd0X2Mza7ylw6RYMHabaCot3UwojUYZadVhYJkylRYL/ujAG2YLtj4qO4RFVLTIUp
         FvKerKqrzn9Gt55rWIB/tSUUOp1JDsemHIrBldC8DCoS+U1+SzDzDLVO0sSYWji463Xt
         sbZyQVoXPKqGMFdyma3HkSBA7r0aDeL3k1g4qG1zIXez/OvU9Tvqb7Ib9vSvDk0wG4CC
         MBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987432; x=1791592232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=0Ns+NvcS8NJBb6rik6Dj8qyz2eqJsNG4cxNjfJMkDjFeYY5e29XKaeDHm6/oMr8hw4
         TCT6dy4xsE6hJoPHM1Lnw8sOKA6h1MXHxbiuDcYUs8sDfOMXrvvGy+6ZbR/+A3bCQoNv
         MxI/tiSQQlNyQZuz/dkn7VUJ+xHdihmBjhsfkYWXyW1OswMXMZDXdmYw7HrGG0CGpT3C
         d4FzJ7h5hmbrnvXXeWSW/ZWGo6h8MhgNI4oQpu9jdpDJ/3Xl+RBg29SNNq5yJBFM+iE1
         1Kayo40GnEUReGXHm500c8aHHXZMPQ/o3aOZ32A1ktbAdsfkLTGXcpgsyyHrObbJ5lyB
         7Pdg==
X-Gm-Message-State: AFuF++mqSM4ewUBVoL0/Vno/vrUs7nPISkN5EQFWVyoSR3H34jyuDAPe
	tAtjuhPkrlzxmazmaT5KSYJ4qdOTNOivYVBH1OnRwf2ScG7wNwRV6/YgnO0eIUQZ+2XPUuZ9xZG
	1yI9T5/HEaYsTwNplmve4LpO3i8pHI5CUOUuS9qPFR//7xA6kv0kH7RuXStap2jOt7eCK
X-Gm-Gg: AYBFou1HBsPBEwDoM++Us65trB5aXqYg0klmChghU1PCmqEJOrIAAR+5sn1OoyD6O4m
	xss0yHRGsma+UBCI8akCIPkWRYD4UoUYcfaqlTveJJB0ClPhjoyVQ3MgnfAqR8llPj4HcdJLRPY
	6JLficY6zBBXnHiHe7zPS6WYwKjD7xKhDmIUQ56FS8wV5f8WPciP3qNeCnvfavWSj8+hZQPCFAX
	d4olteFHcPxTnp5YAULtegfiGjL69aod9ptvgiu5NbXqdqLGopb4cjCi1LJFJioM5kxt6khQrT5
	0EjYQDsLKy7fNUoCCU3nrORX/Bix/zJ10Q6U7rKdOpRLiRep6FZI+cPmXhOkpRQSOORgEqXXCjv
	G6wWnABdpNwiIzVjBlRRAWFPKL1W2F8LkjRY5VR56wH9SfmhcUndwAOugOPQ5Lg+Dw20Wmbns5r
	JIHJTCnceM5ZX+
X-Received: by 2002:a05:620a:1b9a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cf178a668mr803418985a.49.1790987431968;
        Fri, 02 Oct 2026 17:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cf178a668mr803413685a.49.1790987431402;
        Fri, 02 Oct 2026 17:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:17 +0300
Subject: [PATCH v4 02/10] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-2-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Y4+Ew8bQbr3xd07TJNsXmM99kEeC3E5cOSJ3Rcs2qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydtwrPat7qXUt66f+1g4fJ8zOYW9Zis+PZp
 +p7/sDvxfCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1cxRB/4iUUgl17KXsRCJ+FOWP4ku1AInAHA6A0VhVqHEZMS52SlqTXHj+gh55MXrQynLwF2a/Vx
 YewljfPpngqmOQx2GAagDIm6k2tegkQrh4xmCE5GEhrwUkfCr2+0VkLjGbvCEXHVvhGEQ+JDj9U
 FrS8TYarjb96cwT9jkOnohW627OHttXoLAJ2zF9bc7/7uG1bUQytDJIGOLc0UMdjSm0nwBvI1jt
 zg7iU+r+8jCIsjgsbJFvppl3M3DkHWkwWPgvPasDZx0eWRdMuPOJiN+6T89/qkO1oEVVT62q8Pi
 0N3tRWo9/eoBAkF1zl4grO/n19xAfWTdQznHCEZ1YmE8Fz09
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cBjT3JqdTRR9o9HOkfN6FPW8In8_woqm
X-Proofpoint-GUID: cBjT3JqdTRR9o9HOkfN6FPW8In8_woqm
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6ac04ca8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=oM4tAuVuu9RyGq0-O0gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXwyd5nj0e9Kld
 rM84CCNPRKQZgpiXHS5mEKW4g19rBAAcSTn7EqyJsNbSTG+7YZtY5Ic4h90pVpxGjPWy78kKOe5
 NaDowNbGU+wGaMBmMVCgc/7B+27XcuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXylRRFrF4xvRu
 swJm9t83kjiSoo8w6JjsIVRUb43zLDZisdyBCCPb1MW3MKoZv37gZD5QS+jvHvdujgrMSBqhJvE
 Jk1Vb0Jv+NotxmzyLjvofPr++tkod7/bZXpxWWvuuGL5Kz2msoUeZS8wYLbu3Ekl+33Iyo4fdx2
 YgfQdj0vpRF0arxF2Ji6gobG3sNLReRuRlPi6i3fFMPjjzud1inMUVzrUlF0Ffw5ZZbyzEmNYPI
 PEqd6PDc11YomuLrpcKtsLNarwG2F4cKBk3MgBCGPePpnq52GEt2qNerNbUhfhcc9Dj2pt/S36S
 pb3+XloBqubuZZjze30Q1R9hyA0I27G7ZXHmyJJyLpyevMVNPkOkIlWew/0ErDHCcYZnrI+7MzZ
 RDFyeTzs2qAw4WdWqB20CM4HYl4SDJOtlv96pqZRKzu/PXS0IMRt3wicv0AMX/0EU3O3GKi9H07
 Oe9NshuSWUcPRTb01Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

msm_framebuffer_prepare() bumps prepare_count before pinning, but returns
straight out of the pin loop on error, leaking the count, the
msm_gem_vma_get() reference and any planes already pinned.
drm_atomic_helper_prepare_planes() does not call cleanup_fb() for the
plane whose prepare_fb() failed, so nothing ever drops it.

Since commit 8ac37c88f991 ("drm/msm: Refcount framebuffer pins") a
prepare which finds the count already non-zero returns early, assuming
iova[] is populated.  With the count stuck, every later prepare of that
framebuffer reports success while iova[] is still zero, and DPU scans out
from a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

Unwind properly on failure instead.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index a38e5b3a1d1e..792d47b4acc4 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -80,6 +80,18 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 }
 #endif
 
+static void msm_framebuffer_unpin_planes(struct drm_framebuffer *fb, int n)
+{
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct drm_gpuvm *vm = priv->kms->vm;
+	int i;
+
+	for (i = 0; i < n; i++) {
+		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
+}
+
 /* prepare/pin all the fb's bo's for scanout.
  */
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
@@ -102,8 +114,17 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
+			msm_framebuffer_unpin_planes(fb, i);
+			memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+			msm_fb->prepare_count--;
+
+			if (needs_dirtyfb)
+				refcount_dec(&msm_fb->dirtyfb);
+
 			return ret;
+		}
 	}
 
 	return 0;
@@ -111,10 +132,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
-	struct msm_drm_private *priv = fb->dev->dev_private;
-	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
-	int i, n = fb->format->num_planes;
 
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
@@ -125,11 +143,7 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 		return;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
-
-	for (i = 0; i < n; i++) {
-		msm_gem_unpin_iova(fb->obj[i], vm);
-		msm_gem_vma_put(fb->obj[i]);
-	}
+	msm_framebuffer_unpin_planes(fb, fb->format->num_planes);
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)

-- 
2.47.3

