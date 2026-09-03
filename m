Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719A4A6CC9
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441832; cv=none; b=DB3vixTkmNmxwu0E1HhVQCbkLBHAFykZNzwBKA4sUesTk/KOaxTknUMu+7ehVFE8yHb3kxT/n3VWu+xCo2jB42RzOwge1mzd4kGU2uVm0Hjxi+qCQJVm2VKF7/WBKo1iBn9nKaALna8e9RAWBdL4UqAMTCzr5uxw+Z/YssGcLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441832; c=relaxed/simple;
	bh=NrFw7BXZVFZ9tRlXdJwvxA4tQOn9tdfDrYwT+OYyZR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFTEI7w+A2y30hZMJ158SI8f5h/NaaGCJih8MwR2ni/Z22A2BZrgZf8nPV4PbdZyfK8lnQub00/H2zcY4IHS/Bo8IFYU1W190rdtFQ9HWUQrVAS3/UdtpxjR2tG9sYmpz+8+Hmywrrn6M/FzGK8tbfGgXekTqwBs9/Vos7DHxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOrC4MfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbijJysA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOrC4MfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbijJysA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAQGR1040616
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+mI3GEI2CDfK3ssOBCMKAt4S/5fYocofrXGK1kFQNw=; b=KOrC4MfCUaYdZFPC
	Y9tDwRDQARL4Aiw24OjmAR+qlMYqhehogHwbkp6F+MlAhll0I9J7GtBSkajUVirq
	EvnJAbUV8wJny7+KTX5wJXr9xPQ2C1ZHy1zczyaZeUQyM1vC0dH3Yug8gWgqrNsk
	oypxpgX0BMp10ZcyeLJenIFm2cDX+5ojNp4rTNPH1bYV+yuwtv/CAey6QYU6sMol
	9UIKPC/kbU4TMhHcdR3t0vKhK6q4fWAOESOOXU1GMx2LzcsBxu4NcCujc5P+XvGc
	RfcGHj1f28vKKQgYq800WKMGxUCF6y4cWOF2PWm1t9F0wkIGlEWsKyUJJowyiTFQ
	z9NUGA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hy3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:23:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785b66a7017so605006137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441826; x=1789046626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+mI3GEI2CDfK3ssOBCMKAt4S/5fYocofrXGK1kFQNw=;
        b=YbijJysABmFFtgeHW8wLpsVgoXWRyfMbrnF3Rxks+DTkOSUbjj6POUAgS4ehLnSJ59
         VC4MuUtHJoJrYdC7I1LsEtj6FkW7MLOkP5C/s4+w28fm3znf+QsKMpzQO9qLo850rSz0
         hLFoQku1cbDRH9ilg09/cUt9tRezcbLIHc23wtF71bJrQ9usSYieDVL6js2yWG/LDsEg
         jUXtr9KVM+ekwUjVboJUUsZucnMwcKqacExiXFfRS1ySAwQNX5jGZyKdteVDrccYDp21
         XvFJH0ILtSSeVR9QfJQvogIefeNUmkf7Q2qfXPRqNVEVwfQ/9X8hOVbOmZWhhWTVWsr/
         37YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441826; x=1789046626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+mI3GEI2CDfK3ssOBCMKAt4S/5fYocofrXGK1kFQNw=;
        b=i1Jghs602IVkXkB83gb/7hk0FzSj9Js6Tf6an/66LxhiQ2CXIt7GNL5T1wWifXo4sc
         nYRM0vEZdFeGH4v49INsn+j3mRUTWvVVR78FSdhcDO7KD15IHwR38aPxE0hHWlDIKY0s
         v8RgiDoTvYUKKYHq/LMl+KZZR3iwkP+iPiNp0cK1wNQ+ADCfKnDPAFk51/MMTlsFUr2c
         aLIlz08hyUpYax7yRwxsmGdyugLNWhRzpf7qy7FpwvEr0LzouG4zNFumOuYH+Ruc/ePt
         Jwo3vScIC7poRi6vqYKNv07q+UmfWEKUHa248IA+plBLViYJb0t9iEi9FLpzmqJqteWQ
         Sr0g==
X-Gm-Message-State: AFuF++krui0u0hb1i02/QKkIBQhMDIqLTkWTwQPZtKAY56NxjQ+QMa0u
	RPwUxhhodSCs8gh8uXFYtzXGLNdqBowRMeTqkh47t+CksVhc8YiDHSabVBlDG/Y2bY5UjEiFGer
	P6tLZ0pBTizc/2LiQW7hs7XFAmR5VhJOzL8Tjmo7YK/maLKBJdfsq1nIyVtp7RVilT1q7
X-Gm-Gg: AYBFou3EX4eDGZwybBLAu3kJP3pgchUPfH9Vau+kW+Q0RSJ8KjoXA77QxeQz/QMF9OX
	rOaj7d/oR9zGvBShZAUNjtp0Xl/5ubRSIXPPMD7WpS9AaPR60Sdrii6idJtiZ3OuQ2KTWa9fyIf
	myn/npmSqgODPoW1/AMALXgk0HIVp+fP+IKddbe5dh1jr7wn2mHzqwWsw9OLrVtY8SRDZEGLlld
	mK2khwGSjNybJj3wEJwxfWj+qo1j+IlIEQoy9DE6v+RP6jpEtY+V3OlRGrCNNcmyJJO0u02Iy2x
	6dRT1n8t3VR8V0i/i8erOYDzuTB7WIJ6HJjqJ/OeBCCJ8gPG08dEHkfqstYgi4l7fPihPxJGmWn
	c8QTagtmJlaQQfYBKHwtyVi/UtpbZS5ooTF/dmzzszz76+cIrckfLE5g+UOeiMfZUg1Fi5WhtHI
	gdVfqjvhZ34AgQ
X-Received: by 2002:a05:6102:32cd:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a1eed1c93mr3585908137.0.1788441825716;
        Thu, 03 Sep 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a1eed1c93mr3585885137.0.1788441825273;
        Thu, 03 Sep 2026 06:23:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606da57e9sm1296480e87.83.2026.09.03.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 16:23:40 +0300
Subject: [PATCH 1/2] drm/msm: fix framebuffer pin refcount leak on prepare
 failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-fd-kms-fix-smmu-v1-1-608d02491666@oss.qualcomm.com>
References: <20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com>
In-Reply-To: <20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrFw7BXZVFZ9tRlXdJwvxA4tQOn9tdfDrYwT+OYyZR0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqmXTebiKydvKEhAHkK7W6WCJ5/HHQYgcyZIGg/
 LynZnPECGuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapl03gAKCRCLPIo+Aiko
 1cgDB/9xO0XIZbbgdMWUPUY7xeo5AOfwIYi9GYgdd5Y/bmqF2smB915SaGJONfU9yvFHkpi0BHA
 /nSHNJF/3RWzF1LoPj5L0w/dvmxDkGYkTgIGdcJUF3/VMmFfmDQ9JNUU8h4/mFN+J4roGhHu6bA
 rf8eiv0liGzuBoxvgQK4yo9ddA0GtzctLM4C9FEJsIJryBx7r8/J3tcKsgFz7fobE3jg0C7VRvI
 ThPxJj5UPlSZljaLGPAYzmw9aLxf62lK+uy54CMohjqVdxYpZa1b9vxR0H29LTbwLIbxKK9J0WV
 My9HNDsc/AdAeXv5xvXYzX2QoPn5zUqST4CtENNEHHnvG0ov
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9974e2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bAolQom50hykzV7YMrMA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: QVm6h3ZWx2R5qNwBJaFFJMQKlEYYMfgZ
X-Proofpoint-ORIG-GUID: QVm6h3ZWx2R5qNwBJaFFJMQKlEYYMfgZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX3PfLSMJLYyTJ
 QGVFqtfPM1312GBkkYkm92LegOvCCvWY4VB2YKAezrx9AoEeHnPiv3tI5jsAjuWAmcNIXV83Qjq
 mKEAxIl6SXfXj4gm2Qi6Vs2m5f/fZMM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfXy3+01rKgw193
 4X4vV9CyxeEooS6kgpjQlNTl4WyVx9Cmlx9DJELacETcxNo63ut39vytaXa4ruxYOWMrlcsbq9f
 OaH+Ai3o0rCfo5obwTBRl038JFWrnRd0rglqj11Qi7mk2wA+skwuuGDfmwDPqWUYcGzVyU85WAv
 Er1h6OY/YnQE8mWImhIzrV7/N0oM22MdVkjW9YBPVn3jwSFuFF9Li0RRzmEFtGGrIZpeMD3np2F
 01irwDXJo9YDn3y94xS4iDRy3LuXCLwemPgm0mV1Z/OWKqDGAtaKWPAxiYrtSO92rBqiuqWuGHU
 URqv9mhd+5U28RHUkeE5+MubdSDBSz+4LdkJ/WHwGaFldvFG4wrO5YJlEyRZyP0loT0FGR/04pP
 9CmDow6nyT5V26sxP7EH8pmKLyv9q0ZS/bhdv12ZI0pyTt1BMLqhU/fa16fshyZBceVfXAQOg0m
 LRYUd0IJ0l7RIyVriFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030116

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
 drivers/gpu/drm/msm/msm_fb.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..934337202afd 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,11 +89,27 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
-			return ret;
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
+			goto unwind;
+		}
 	}
 
 	return 0;
+
+unwind:
+	while (i--) {
+		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
+	atomic_dec(&msm_fb->prepare_count);
+	if (needs_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
+	return ret;
 }
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)

-- 
2.47.3

