Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4934DCF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232951; cv=none; b=nFdYOb+A2QsE01fJlvj0RXHZm+NKvWai/tQD+Zw9dyxuL2UyYCRARXLrcBKcTc4BvSTeo76i/s2xTcj8Hn5lsCppxnO3De2RDUlYJsw3p3EkKe2Awrw+iiaI/sKCOdUS/ub7xNfgRKwz7nr0+7ncXKwvDm8TSu9u7qWuMn9bg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232951; c=relaxed/simple;
	bh=PLvp7B+VImmAy0mqEglqaTYRBRk34EOZi169m+TRW54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuCf3VP7VpFb0ueQfkmP+O8UmUpScoN+61OtcBCK90siYw5Sgj3xTHObXx9g8RgBP4uZzVXoHsaWxQ/HtNBvaI1VQA7UvJhnYQZM6CfpIuApS5eFL+fYpgrRh6IbMGEOnCL/gPAd5vQ2GRwkr+jO/f+x05+a0oY+JPFEOPXlzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jutbsKJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flXSOBGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jutbsKJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flXSOBGh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoYbP3606546
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bX9ML7xsTYJIJbZogiyf1wo1N9fpaq2+vmP
	82mHL44U=; b=jutbsKJlJS/HTdXgLIwyzvuumFTLFd41ACqIKk1tLBgqP+QUxcZ
	3xO7DT8HzQRv9gZ5B3jT7/+vSx3oXDOfZMA0qRCvW/+XPrapH6PlQxUR+G3jGjiK
	B6kJBfHP6mxMsMSoxjP6e/rKVOmQlVbC33ytwPna4tJ8gljARnjmdHD1u7cMxNJg
	qVe7gMQZSXEiH14hYnW12rCRHDml+BZR2IhrBeD6BCaOgUnWrYy+6yqWgTLkjc/w
	K3+7GhB0vRUZYE7Tbak5WyUXfOTE7HvzWjPTek26nXBVIwoxInVTeHeTBj565w60
	J+En+/Zzi22A/i+cE7lBfKeizY9vMiIgaig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1we9735-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84854c2f888so12630036b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232947; x=1784837747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bX9ML7xsTYJIJbZogiyf1wo1N9fpaq2+vmP82mHL44U=;
        b=flXSOBGhhzuoBcC2lejl162HJG9vRs7loXV28CbUBoAby15cQvT8T4zHxaRX5CvM0j
         U7ZATXvWTb22UDV5jBJWBYEVwp2UVCjByB38OlT+9+ttisLLSpcuG9omWNssEU24Ljhp
         a1nCcy3ZtfyBX5aIkERtEps/j9qm+Y23KDJSelIJW110x5mOh/FI44z2eO/VIQPfffcT
         6BqfWLsp0bF8ElCxW+whkKm0zK3XQfI43ipmN+ttrCUZdmuK5esjoB8siiuSQ2fHxSex
         eUUmknCWCsrzMWI2WL10Y4m9OWBDe9gFQfjwwTXSrWkgiUWPvhxsmXw8PhEcJCcmGPM9
         qfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232947; x=1784837747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bX9ML7xsTYJIJbZogiyf1wo1N9fpaq2+vmP82mHL44U=;
        b=l2J358Wvih3LxEhIQnGoehsX2obnJVKapm/6C8esEBP26GZ/x76m3Z4gvSRKVOa4M6
         59v6fQBk6+TergZItonxRgRBJTdMt1KjxqHcb9sn6rbgK52P+7OiutKYOv4HaR/9+ViS
         Mc72sQ0oYWIBkkBiK/5Bs+xltPPAoWipklgaPYU7ifrv2WCYH0+szOdHBNa17hQWeKJj
         l9k2pUkUDg/Xs53myrXR73wrI0Jh8VlVNjxqG1b9sdttnXN1nuaHziAyQQZaKI037Thm
         CoROB1EKk0cBUPzHtC/KmprxGT937TP4O77ol+5dHrhS4RM1G2WLRMB4Osi9Nz0nD3OP
         +QSQ==
X-Gm-Message-State: AOJu0Yy1bSMOJDhVpGLsp5lTSyUmw++iwUTSDbujdRWyKeDXcg9L42s0
	xAks2V8EnKfDdjfafVpEILplhCMyQJF/e2OSWXAbNNgURwwyKm0MDb2M45Tn1jxVbTIbo0Tkwb9
	CLVDVEqacIFiqbaACjb69CjRyXkVl3ytyCgXckGvIgA2sDEbL4M5mnemet1KgoDkg39PZ
X-Gm-Gg: AfdE7ck/1cgK0y4KQzWhsjCiG3+mmL+NqyYA3W/qfOnmmoqhDRQeM3VdypXTKiEbIQw
	D6YFuZsRbLDbf2sBx/sszLAyLxCvwgRvBqzHXT8dMpI34ORFlGLKAMB/TekXEMFRFn7LJBYTsq8
	nDfaXXtDBM0hx+yshG94lSa5RQ9eM/T858ZE/NZfvmrhH/h+8k9x7DnrzcVJSKhjxAZj9KhaXcu
	a4STou6/ut+WnlVk8B6l0GvKr6Wy6Jezq4NVzTILNd8uEwDNUEq9cC8dyHuMqa3g759WPlmWBPd
	NgMXPZJBI7ybYi1Sya+xPD+MgUt2JItFiylz2fc+qmOrGzgIVi2zJTg9hlFFhBNCNcmRXp8tU+7
	PJtKfmuQFt4UgeqLdi4usv7kz6iLSXh6EAXlkpbi13lIpDYw=
X-Received: by 2002:a05:6a00:3ccd:b0:847:982e:cca0 with SMTP id d2e1a72fcca58-84a671faca2mr7986187b3a.19.1784232947296;
        Thu, 16 Jul 2026 13:15:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3ccd:b0:847:982e:cca0 with SMTP id d2e1a72fcca58-84a671faca2mr7986150b3a.19.1784232946883;
        Thu, 16 Jul 2026 13:15:46 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2739a4sm5377121b3a.19.2026.07.16.13.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v5 00/10] drm/msm: A couple lazy-vm fixes
Date: Thu, 16 Jul 2026 13:15:23 -0700
Message-ID: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX0m89zssGOYCX
 XhU2Jjam3jxJh1HAZF77AK+M/nph75wMwG6KPwVd778UXCHAL9jrqTFIO+3iNM4Uffef+4YRg7L
 HCBH2p3kcvX8UOPv3zofpw7XtNxVMsgqkoFYgA3S/Ypcy0mHk2uiw6kav+kwIEybXEPSKBe62eG
 md2z7IwHu9MNPxTb521D7Oisf/vazD1/9vtkj0Q8ZxlJmX37IcNGv0F7B2mI0XDviUDNlwm8jcX
 ueRp+YYjezOJN/tFYNpxmrmcF9J/kvFfT517HJY3/1Ugt/7Z/MuEdGLdUf2j4Lg+cmyM8VoCYCl
 WPlboULXFG2fcDyhcS3tS3sTuB4bcK+FdfAMqp9jr91wbP283Fxp39uTqVbzOYi5ls73a8yHqO3
 tYZHIwcbdippotGwQ19/4M485a7F5jea6/8m+FyqfR6GxgS/tGha84vLqoSDf0AfqDv6B1/U/yW
 TS0Eg9J+TeEOdSHZ7Yg==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a593bf3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bzYy7Z1X7KArDtV8Qg8A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX5gUOWvuJ2XkI
 x6ujNwo/9+lLVP2QsKEVnP8rt1qvYHNPLG8/XSKTYiwjubWGS88LRT6Sq8MhvX3FeARMlVegmQK
 UAbKlo0E8zj0dzAqyew9a97fYR8hdvc=
X-Proofpoint-ORIG-GUID: QIMxW_hkD6K7IZnzeY5JJ5LVrO22liVk
X-Proofpoint-GUID: QIMxW_hkD6K7IZnzeY5JJ5LVrO22liVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.

Rob Clark (10):
  drm/msm: Fix barriers accessing ctx vm
  drm/msm: Rework queuelock
  drm/msm: Synchronize VM creation on ctxlock
  drm/msm/a6xx: Access VM directly in submit path
  drm/msm: Add helper to check for per-process pgtables VM
  drm/msm: Allow lazy VM creation to fail
  drm/msm: Don't fallback to shared VM for VM_BIND
  drm/msm: Validate lazy VM in GEM_NEW
  drm/msm: Fix per-process-pgtables check
  drm/msm: Remove invalid overflow check

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++----
 drivers/gpu/drm/msm/msm_drv.c           | 26 ++++++++++++++++---------
 drivers/gpu/drm/msm/msm_gem.c           | 11 ++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    | 18 ++++++++---------
 drivers/gpu/drm/msm/msm_gem_vma.c       | 12 ++++++++----
 drivers/gpu/drm/msm/msm_gpu.c           |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  4 ++--
 drivers/gpu/drm/msm/msm_submitqueue.c   | 22 ++++++++++-----------
 9 files changed, 71 insertions(+), 43 deletions(-)

-- 
2.55.0

