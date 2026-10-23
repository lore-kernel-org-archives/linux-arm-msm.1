Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797946;
	b=L1a86NDrRCJzN/ryzVjLDwD+NOGKLpc3Mn4SQGgbiaTHpw+vrdK1eY/jKXxcrHxoXvbS
	 HGy75hnW/97/8BmLdHdoalgN5DnsXtdrmUqG3kB7nmejnQ4LNJg6EHj/jA2ZJTJjHA3d6
	 bOeyByDqWOy/lMve7nm0Ut2eS68ciJauJxU9vk4vvFd02Qab8of7RVF6yd5a0/m6DeBI0
	 CV9hCOfmrMD0zjE+U0Dz7Q4nHaODpTCk+HU8UE9GpqX/EMbBza0eVDcNuiMyRPvXAxPQx
	 VCPPfwUW8pPpODklR0HuxVL4QW6myqdLufpKy4fxrHWjwxZmNrPN3vlkNICm3sshaHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
	b=YVHnns37n7YXOyhnuUDruHXvaCAP4KnO69MdbR4NrpO7CO2bsB/7HXgjK5KLlGikG34g
	 GD1DdYJyXAXAZlH0IVe5GQdc77fxjQNT0JwOzNmKMky7RD+mW3IKvJlNuT1gQAZhxpXvj
	 rHhoO/goIzRAVicSflyvYpYAQa6v9gXwZGgtHO7URDyUR9eJIbVuD3Nn/Feoxy8zUhnb8
	 wjFVsrZE/llTblUUkZIP0EO7DLUuhmSUNC79u8ArWjrFz5CrrjZ/t2iVtjgBzD66wsALL
	 BLU69bdoNWHQU058ZpiYt0i4n8MCGd0qiXKJoGFhoejDAF9919hdMWkUIzxj8izFHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv5xqKw3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDrgsMeH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78946606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78946606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv5xqKw3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDrgsMeH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvPh94027107
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=; b=lv5xqKw35Ncp+fIs
	fV7M8GPHLSj6KdgNN2yAG6lFk6NEunQbnI36M8ixckXU4c2bvU2EiEk2FFQamyU2
	RPA7lNq6/BeiauXnlmmtghIDAF2K9jVgcb/umW5ySKWV/ZaBPXLP7mPD0nn2HEZ6
	SsQSe7CZU2lFMEKXrDV2U0UV6NnzL76yqDfLUt8t9+7ouc3dDyXoN/SwcnqgSGmi
	FJ5hWbkAnVq/SmL405kahlhUQyHaW8kdvSsBqqiw6EVmyRuOVRbGtQYQrLQkki7E
	ZVXBkF624Xl4QyrVvmyRSEFzOoLPxKKNl8bKEeZwpSeW1ozGVwsX6GjV7CQloWaa
	43BiOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcs7gw0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bebff9fcaso43400456d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797944; x=1793402744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=TDrgsMeHZUp4d4J5s675EOSXnM/OW7ilj5aCup+Kqp269uxieb1aTEGu+7skqOWhOX
         YEUIYIa94aheWA67AqQ5iuf4tTPqbLYOt7W3F8/Z9PUsA9Lo3eeJKfr0nGc6aOJyxREC
         Lg4Z0OUtEsYm6oSDs2LRDBkf2lrW/gUGABEJVpSpwXw5y1ZSJNIgO8zcGGto6BXknjsh
         CHne/RefD3K8wLlpU9a4LdxmXuKXWWwfzSWkNHDGVwZT+WgOJSXq7FUKoWq0NsJ+hpV4
         1BcmLXv/fBJfNpCXiD1HCVoCPLS3sYxKFF3yNM1S29TLgFvb2ivJq6pCbOPUiXem3ApR
         YH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797944; x=1793402744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=VVFpmkLHg7HQA3t00VFlLdfBa54M50VxGSaJC6e7wgQJRpflKtoZZvVxA4ySFVENkt
         AeLBTiIjPJLlGVvsCQ7t16jNKXNK43g4YZ9Sl9XFwGOfl6wooFjn40ccXtjWpLxt/Nug
         qTG7oFYBaPKhe/Vk1hRq0DGiU7qJk351rhsjUkiObtZKDs6Pd8FrmyGzmFKogv38afgU
         YHWJihQ4C4VjKJMF5nBR2l0m3/o7XuZy9LIJsCIZsT1pqv+LjkUUpfwe0r5OGpR+s3go
         aXBYJlMfB8H/OkHK4398m/xvmUaoju9u4YyGtD0izfY/zHT4j0uimEY+uqOAdg/inMVE
         rS9w==
X-Gm-Message-State: AFq9FYKbBFFjrLorxEPbjAymvq2gRIWfciLnyh4v1D7Psf0w2O4CNjt9
	lEUHegGpjCCSED7/wqi630ctMWA4Yu5rOny6wRfJha2R8nT8jU0zSY3oMNWFGH2RM0mPgpQYO2i
	OlW7eWozJaqWbiIWSoBJ+U1Qbj+858XjS9obKIcSxazVwbNUqeTA14GGxog0AshPIuhko
X-Gm-Gg: AYBFou0zQN83RjdEH3U5CEWfsT/q7G6UqDYOyULzSyvfKHk75hACd/cwfS4MvuxHRr8
	8NZheHjgtDQ9Xjof0v2vtg3QuaoNrU2lZ/XXjfFRfbgh31uaEfYDX0trxribtalQec4LuG9zB82
	D7yJyeNFaYKnoU2aIraKeWD/Ci77KmepxuhMpi8Q4LnLlm4PZ7iomSHfnAMsNRFK/arKbuZE4EC
	sV4A6qY5YoJZ38dNjacERpxbagtGgK8tKt0u13nxZlcg33X5PBniXga2UX+YAawuafC8EoLf0CX
	s3IIwEpZIWqfEdSIpXj806Tm4SAkC5L5qjpT2/Ln4CcKkI2CjFpb3tr3x35TuefqYQ4KMv/d2FT
	8KzplwHB/9xweBEdeEi1sz+Pi7HpoaJf00yRr3qC0iFRPE+boytdknsjkkwDgZEJ5wgfzmtLjRi
	ON+jK6zWs1vZeS
X-Received: by 2002:a05:620a:4628:b0:93e:c12c:9dc9 with SMTP id af79cd13be357-940ef9d651bmr88680385a.73.1792797943637;
        Fri, 23 Oct 2026 16:25:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4628:b0:93e:c12c:9dc9 with SMTP id af79cd13be357-940ef9d651bmr88678985a.73.1792797943201;
        Fri, 23 Oct 2026 16:25:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:23 +0300
Subject: [PATCH v5 02/10] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-fd-kms-fix-smmu-v5-2-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Y4+Ew8bQbr3xd07TJNsXmM99kEeC3E5cOSJ3Rcs2qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zmi8IM34DRGqWrJCYA9m0kbGboYUYA4FsqH
 KrgN2N/QGqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs5gAKCRCLPIo+Aiko
 1YniB/94HAdz8UhJFMKIN988mHG26Nn0vnk9L/t9IBX8IZ5deCt2VIY8H/3PYSyeTjTt9MHH7kG
 cKTbC8OZtoaeEqx4L6wpF3/qVZ1Il6AtDeY74Zcx6FY6Sq+C5bNaTbVl5hfyGgFKMSiSd6nxcIn
 6zjkMjNdOo2SwIaoxxgYO+/SaaKy8aktz+C3ABuqMd9j6mqTUMANVhepHxekCtdQZeVEn1Oc9MS
 nJM4hcJ8xunBCSXc0NCRM6j69gLW2HSf/Qo8PYg0AFUQw3n06Okfs0foka1ieXaZ/TpXUF0g5Yb
 HNlDNj6sCtusVaWoi16BVv2Hu60WuOA+oBSB+BKhzBFwY4Lf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/TTjUtnWN3BM
 FPOBIqpO5wUdpBa9b6reYQNcODB5CG+TISKgulGjEdwwxg0JmrWFvo3q17jKIAv5x4YIFZjZeX4
 HRfAIdGcJaxCMD7tsGEAzp+8jwAG5iE=
X-Authority-Analysis: v=2.4 cv=XJCl2ghE c=1 sm=1 tr=0 ts=6adbecf8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oM4tAuVuu9RyGq0-O0gA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXy0y41h4SniXG
 fYRqJDvwU8HSRhGnHpjKCxLEQBEjkK+xkxM+uZXtOCS/TIt+Z9oJZsKef+yUDp4cnWxfBBd0y2E
 paT/HiiDwcb1TUh+Gu+paaiyCbBmbU4K2VhE7isO0qvtI4krnkdQPpCb1RDuoElYZD4JhOqBgsc
 IjJrC4qcZ7QJZXLVCrPuNJBU6o5hs4X7NeSeQxViQcejfuNNp0T9Ra3Kwyx3ZtbsK0uDB87+bf7
 jgaRPk2fwc6y2SfsI52eKP3hztRyw8lxBUEZvFDaAn7t/Xgoh3kgd+jw0Yxe2nyFPvveNPewNDC
 18MMB+Wxd47qOUMzVw8QaLvaDFhJKfZz0jZqRgO3dTmu82orOBcYZnRK4LPkqRqoEFPG1xzr4Az
 1lIvmT2E79hbhkqSnt6WnGZAT4TFcSa9PQ65t7bi4G9E/Uz0IADAlUZZekNhMjGaqweGhMVV0IG
 B+0ZkKaFD6V+QyS4e/A==
X-Proofpoint-GUID: 9aOEr8v20M_lvSHUWx-zcC-V16aFj9ri
X-Proofpoint-ORIG-GUID: 9aOEr8v20M_lvSHUWx-zcC-V16aFj9ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

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

