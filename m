Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510C35B12B
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217312; cv=none; b=EVDPHwKbP0Kbb5qJa0Vh/mWTFNBh3kmOEd3cNPMI+rBiKnDI8YQZMSyG3AZiUxskJ996Dh4krQEx0RGzourkmA62Zz/yA/CJ1lpR+vsobntPacH9Yh8rM6aubVXxn2yDDQpTMYF44hYIoNMULXKb5sJnxN/HsRv5kDnB2L3upfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217312; c=relaxed/simple;
	bh=QY9ysFxhmb2CtXGWZoEbLvZr15d49FXuEMy/zVQSVA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aapNqRbxrRuCcWJ7G4vrgiQZyqBSCv4dCZTTsYmeA2Lhqzu6AQlFRLWK5OeCwNLkJLUPqJ3fyzCFrP7fja8p9+Efgsp0QhQ5niSbKDpvKLT/UOgu7YnkLEnobL5ed0VaivqJICdqpMcXrkU80enwMfplRXiATzAYWOTzpi+0Qw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGHgIF+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH0rvkEw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGHgIF+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH0rvkEw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdaU22239148
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajJdRqrp/b4NGOrhwXdxyfHIWwR8F0qeHZQ4G6QppSc=; b=EGHgIF+yaDOOM4HY
	V9CwnZMaXh9qdyvB1FGYy0cc47pM3gKJPw5y4GSpcE2DCaT1glY+TRo1VuDinUna
	z7QYOD4/RcQwtJLRO8cFZlDVU0thar4r8OhHxn6iGZwn0SIsSjK22xEtRyQSk8Kk
	7HbVsH8Yzzg3ymCciiq0xTpl7g6ZKN2ay3l37czv/W3pZ0uLsGyxmjjJQykHPikj
	EF2bpX9+hfZ89wCPKQThm4w72McFBKjnXQlL9ncZJSTB2qbKCeOuv41tXp8Ld1kh
	zqOKvMhz9ZqoDSBbGiP/Oz4TOBnGTIHDpjhWDbi/JjmQhqNVRJ7qtv85JLNOihz+
	3aeJ6A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8xa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:29 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c6725e7891so865352e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217309; x=1789822109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajJdRqrp/b4NGOrhwXdxyfHIWwR8F0qeHZQ4G6QppSc=;
        b=XH0rvkEwhorPwpoPgu3Yv03ylAT2kTgdNLLRVCHWdv4OoFnan/x88v1KeGBmb6KIX1
         Ed4c+VQREc7b5ZFCwVMwFDc4CSnPIa7XwtBwdMHzEyri5sGkfk0UGJtcMrX08NKO/CAx
         v/rJzPr/gzc5r/p+fd2FHKAZnYR2IGLSMdmL1QqYP2GBHlXYi3TSo8d/WhchDOV55302
         eq0vL/BJsjHxf+peE/R3HjzhcGVwZYkY7Qrh7lX5kyAW6dzRLno5Qr9OGo1PANAjJLLb
         qpadD6xaNtM0aUreZu1x20JsscB3QYSpCyZVk0nuwCHf8WNX9wIj+XpIO4qSEXKK7C3o
         PIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217309; x=1789822109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajJdRqrp/b4NGOrhwXdxyfHIWwR8F0qeHZQ4G6QppSc=;
        b=CJBfh4nKFrhIeFKVZtWqwFuI1EN0k9Z2VeD6kjTonjj9YRjopZ4CEwpOL2RyJDTPpA
         Bpo7hYG2ntFTBE6IJFK3uxMiCbejJHfRrqe4Yg0J2fT9EiEByTz+SPbZqDtcA+gY3q8d
         U2R6nJcD27JcF6T6E4L5tAhQiuXWJ6TwFjJDN7dniDoOX3s6dCga2CdN1224Gkp5TTK2
         KDqOw5IkRfqpdavCVjCYaLrizi8ZDJN1OzG7VC0ApPXwqNL61VV4r2FUbziNxoc9tpnc
         UDzXDx+S3Zaa5P/3Vh+FS/gYdiQvMWdF0PKmli4/OvfaLwYK3haT82AYDDGQvDPpFNY5
         /U+g==
X-Gm-Message-State: AFuF++lMk9PRnyL3x/NJvZG+ljmryR4JJLSC1iZbMs4So/zs1xQmhMLT
	wJfQL+9ZFxTVm6wN0ho35BOv4A0XYkNIQ6rphq8jHX+th1sAgp7i2uM0lmMkLNSSH7vdv2X3jDK
	aVTDvwt9jke89gNlPsCD4B4Ep/R2A0BDhgVVQwgQJO48E3FVcsVj5ZDSX/Dmi4gYcgr5S
X-Gm-Gg: AYBFou1FQLVSTh4hkj+VyWxTvqFk5w6i86SwI9+u6/91t2cMh6zyAfGkwonhbNBI4of
	MNURKsflkyszlEjvjc4JlYB55XhCOUkcfXZf4FqJcaOzgP6HnKg2za2MIO9f4zQG+Q8/vYVMHyG
	EwI50WUNG2Ubc2ocepBQddhhCQ4nBsBcNpQ36XR1LjqoBTTEXBiTbs351ctT+gtHjtTjAC3d/Bp
	kqdFDqD/pCZ7LWf+PNsCUahbkRZ7N/E7UISq65Ht5eMmCKijgxxzbluvfxWRmv2KuMP7HIdBfjG
	C3mgP65EDYLFkATU7/BNgD4NwQOUGaqJqqk8YPxHdpFhfLqPQJ+dWGnQjajPfHCjYSiwO73D5zI
	1kYI9x8FR9qyXGtqtmPGRolIOVYdU9UhiXgqn88B1DoqOcfiN2+K0WyPrEsU8iSB+4eYvhm8NDf
	LUDOqgQICjzjw3
X-Received: by 2002:a05:6102:94f:b0:791:40dc:a1f3 with SMTP id ada2fe7eead31-795ab7ff924mr1518641137.11.1789217309233;
        Sat, 12 Sep 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:791:40dc:a1f3 with SMTP id ada2fe7eead31-795ab7ff924mr1518626137.11.1789217308812;
        Sat, 12 Sep 2026 05:48:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:22 +0300
Subject: [PATCH v3 2/8] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-2-a7ddc6fe2032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QY9ysFxhmb2CtXGWZoEbLvZr15d49FXuEMy/zVQSVA0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoWuEQvk88wTjsRw2D/AVDzN2lbBytzilskT
 5NdOBZAIBWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFgAKCRCLPIo+Aiko
 1eXqCACCrqtXMD33umlggPg3i7lcdVLQG61UoaTPUeXoqbI48UaWmLOy87sJQPm+jTsx+/RPxTk
 I6007iHQP9gHbzHMDO/pWTtZMmFK3+9fdC83MsdQcNKnNacWTdrCA2DymBREkO5K+gAeIUejAqh
 FifPvmeGlN67zyVnyPwD6DedZS4QahCEzLLs6WBIDvesfGFu71tFxAQ3v5iQyxzkDuNa+GL4LHL
 r+1UUVcpFVwlyfW1/5Z6as3IpFYMipUE3ud3WdKTpsBhpKTfe8gK5npHvVmyS0Sv02IIjPk4Zdj
 vaAhBbVgVt8IF9dF75jzf8s5RX+kXidh2OVg3h8hVZz4ABKQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YYxiKkBnCqiRCBuUDo01eQ_OJqL110au
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa54a1d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tvlXP28v7VYLJ75qtzUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX7DMXEA9nbQlV
 oWyvF7JK8YOrdIyo11uIEq5cUBuVP/zMSgFK9y3PcYOQtIuFpRMOWyfFYmWzLrME6G3OhaiXaek
 c2211lWDnJPgUoLdyXftv19RFo1f5pc=
X-Proofpoint-ORIG-GUID: YYxiKkBnCqiRCBuUDo01eQ_OJqL110au
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX9Zdu31Ywy9Ze
 wq66wlAnidZ/TKh5LmfGEV7JjZwoTxl0mWWpcG7G+LlZMxlFLB07tRseYju5afFvwv0ghy+AjGK
 iajxOy+oFruI/ubHcB8rnkAstxnDj6zUSSgNPL16QLlDQHV3PEeml189bPCZHMiMWD+KP4BKoGJ
 238ZZY7wltF0My3Op+tdPloIanwg/OML8PWAeJw46WpWV2SIv4mTzmVQw2p6F/J57h2CzsstXAT
 Az22C3j3sumBWmzYfCjE+qH1oFfnjy2ZB4drsOC+qazkXeDQfMBeYjucwksp8r+/jEnBr3O2vr8
 C7W+sN+oMo9zvUl1KtQhMdbgegE5zm69uBRQKktEZ/l9AroTci9Jb0zFn5ObzbrH9k8uIe83AZf
 M0BTS+gNw3ujJoJHWT5qiC32zTKF09pjf2J7FW1uHwGhpT6IPmwwhKOXjEAEgJgyLqGBvAkRqJB
 2x0Li+U+Inb0VnwFLlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120184

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
 drivers/gpu/drm/msm/msm_fb.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 77415302e6d8..552ca5cf0745 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -102,13 +102,28 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
 			break;
+		}
+	}
+
+	if (ret) {
+		while (i--) {
+			msm_gem_unpin_iova(fb->obj[i], vm);
+			msm_gem_vma_put(fb->obj[i]);
+		}
+
+		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+		msm_fb->prepare_count--;
 	}
 
 out:
 	mutex_unlock(&msm_fb->lock);
 
+	if (ret && needs_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
 	return ret;
 }
 

-- 
2.47.3

