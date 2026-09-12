Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB747CC78
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217313; cv=none; b=kcovQXzTfDNZx8VPboOAsjghkn3b6rkSBvfQs1kZsUnvhV0KW0cK9elWG1zSXhYIGDGrj7+lqZ/KGt3BRoXmMaceOvo9gbXAB7llBVrte2eVyyxJUiR+7qHIH3q/QtwtB0LzNNHM+vJN/xZM3csOtPRlRb2txxs+Xv4ZfwtR6FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217313; c=relaxed/simple;
	bh=acXpo3fnBBm44TAaGvVzO4K2+eb1q1qZfnXA9/f95ts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IC0kuTFqUtQ65WGAK6Nn05DSCRIWtHWSWPsIz8yaLSuavoHsT70vTNiJcCJDIm/1W8oqO9aOrg5XyG+2lPfmxLdC2/wW9HlJ4vrGW+R9nwgQharsW/C9XtxgJc6Zl/dVMC6+OCa72IUV2ZZmkJ9mh5lX4UcTTKrwpfboWEJQamg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFKsH+4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDdOZ+nG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFKsH+4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDdOZ+nG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBddlG3273014
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3fdU3zA0kEiuqx4voQsN2c
	ygEglGYO5We2HH28Bi7MQ=; b=DFKsH+4mdc8BSHs3A0Q3d/TAcoebngghKR3ZXP
	Czb6aG32Q1bXfkiAgU7PnK0KoCsO9TVFtFtC170rf57JVMtgTuWrRcjngn1WxNx7
	rgvTqNRHDwlJwfLC1eLZe5nEKIQty0ivNV8iVVGTkK8wNV1SB/pzCJWkLvfZK6jX
	ig6hiL8Of4UUuryCd/4J8DFtJSNMzkSnDXhvS1DE8+aJkBQKN9DNLYSQoQ/yg2rS
	nhEy3bTDG/9cNb4/5qdwMHRo8L8Nawzno00dzp/hmUayeQ3Sr06TFiTkKyXfyi+/
	JHIXkqlRt3AI9iVJKGvtb9Dwf/f2n7MAXsKfWBppEJRqRSfA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dgyss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980989f5030so1459156241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217310; x=1789822110; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fdU3zA0kEiuqx4voQsN2cygEglGYO5We2HH28Bi7MQ=;
        b=PDdOZ+nG6xd/zLYXODfsZT8beDY5QQzAbv0pTcb9U82Vy02uTuDLDQqvZVTDSS7ctt
         HfOcWUoZYIsGgoS571fq0ueY5+JcxTWM3IjNPJPvwXx8xDrXorbBnEN9/w3gwG0aHeQy
         W53MMsVveVR9lbGTkzZg77PlZ+t4HnHHqwaNEaRlSGvzQgvP9LioUDHCMID7BlkOVRmx
         S3s7Yl79JOffUFvLSyG4UUWlhMjkHFsYu8X0IasTRcFeXqE7huTLzBikypJW10k19fjU
         q3bIfMgDtq4BdVl3LIDs00lkvZNApt3KOPAZ1tnahMWhDMBuD1OeBv7m4cen033JfoAh
         kMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217310; x=1789822110;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3fdU3zA0kEiuqx4voQsN2cygEglGYO5We2HH28Bi7MQ=;
        b=aEWG9ptRbHvEas9dQnIwIVxnvoThVMZ9BYkVriEXk9cOvRBlPdMH4TtOdLbW+Vn5gT
         sITGJ/00TMBH07YcAlceLEiLxkJnjXpt9cFwatLjsIaLVF87uPUzQeLfL00PVGAANnEA
         d/GCtHTfNGOA30ix+lAAfST72wE64GJJfsxqzNZweuX3POMpwzfp+TI3d6J5PTPZ5UQJ
         19Q3tkSiGhTXyy8YPCzWO5Qi8ZJDx2qSZJuTinUTitnL/+7qrN4Q1h/poP386TRoVJo8
         IHV2eB1LBdSI/C5aUUuMHVdNIXG9G2amu4tw3A7uZPdYTVZY3q014Aswka5OF20jwkp8
         /S6Q==
X-Gm-Message-State: AFuF++kCuo7Z7OidLihkAkM1J87v2d/wgWua/wJ58DXzYGu3B1IFQ0A1
	Xhk7/KtxTTdLQxfUqWmfIN1TJQXHr/aWIhg3IZHFa9Q4xdjh3pwRai8EaXASSsmtg/SmJQrOIOc
	ducxvQWZhqxUcs7BH5RxLXvOrxsr8qFbOmeJEAj1dxcx2IezLOITiH3lgx20vjji2nwsOXiFTo1
	yb
X-Gm-Gg: AYBFou1BURvhAmgUeYySyt1IX5kUSMYknl9aZ2V4QROwkZiPeyNP+a2dDtXdnnpYj95
	Rc4dlUW2fpOld6ug8DX83n5vG4tt5CzQpvIk+y6PRJZs1i2p/IlE7sSVGHBlFSjRqUkwuoou+fe
	QZ7DfZi+EoV9JZ1xUpz5c4qyKRGLCvf/OcN5nhgKs17+dKnOWhandrSVoJU1hR/WqvHe4iqgx0l
	HTatNYJDwhsRtJdDapSrBJ+xoPy1aGTrtXZCTLZRT/HNZ5eHJI6wQKZBnSKo5RRLD+Xd48GXiYS
	S9VLtjbe2ItkIYj7dtz/vNMio0S19C+Zvh1Ia+MlhjUN3F/qUCZs2+Gd7lLtxzZLh1tsnE1m3JM
	qPed873pGGPPKzvQGzqX5CNQTYL5gotCjk5hgNiCYfOyGStfBmmtzEl/6/ijgvD3J9VE1qjKeSk
	wnJfQRekRL1od5
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr9876546137.9.1789217306125;
        Sat, 12 Sep 2026 05:48:26 -0700 (PDT)
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr9876534137.9.1789217305617;
        Sat, 12 Sep 2026 05:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm: fix SMMU fault dumps
Date: Sat, 12 Sep 2026 15:48:20 +0300
Message-Id: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRKpWoC/22OwQ6CMBBEf8X0bElbam09+R/GQ6FFqhakC0RD+
 HcLajTByyazO/tmBgQ2OAtotxpQsL0DV1dRpOsVyktdnSx2JmrECBNEEYYLgy8ecOHuGLzvMDM
 807rggmQExa9bsPE2Ew/Hl4YuO9u8nTBvR7BNF6Par6100NbhMffo6bT9RKaLyJ5iggWRhjCuq
 BBiXwMkTaevee19EgeakD37xcglhkWMShWVdLPlTMs/mHEcn3pbbbUjAQAA
X-Change-ID: 20260902-fd-kms-fix-smmu-2d4baaf460b0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4924;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=acXpo3fnBBm44TAaGvVzO4K2+eb1q1qZfnXA9/f95ts=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoWM5RjmZcTLZVo531LPjHKZK6O2gy6icUYD
 w6ifwDOn2mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFgAKCRCLPIo+Aiko
 1T3oB/97ujHCP024sgmssO5D99l7RPN0tf56l9TAcYMPtkxRfoK7obZMI2SdLdzeB1R/5/Vm6xW
 jPAtK966iQJT6B9E37k4Wr1xFHkarjT+03irz+ICbjCyngiEMtPE+Q0b4krKmawobdPkVcWK2Qc
 BRwx5UjhrTYshdWPUxlKdvMIkJK1VxLOTGoKNLBZWesUtG/OxLnQhaeeTkrGSwrotTq4pYXauwr
 A4aqz/yZ8RL/UknvcsxwDHBnpgEzu7TFnBOOl5bAj70rsSdDe1/TC5GTnoBDnUyovRo8Y57u+D9
 2ACKou4tFkRE9EV9NY+qyPN/maw8LuufJr67JOu8DXqNZVZD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX5RwcYuWBppAL
 48qEHluZNmWgr/MwnoucpUi9Ksd5PdRLpQ+DDaoPMRaE64T8DbpbM02vnC7U3yu/KCCYRdfhexy
 QHu/DZuCqPJCYwfeXmj5GwpbY/KIgKPftD2DTRnyQl2G7QLS8spBUyUUmSWl2UL0ckSzHS2ODE7
 iqyAdN5CbVQKt0C4OH6X2TdPGU40JXjAexwOVEb8WVsKuUc0sOpJ+w+5FatkKg6sdRbirZSW5Vg
 Qv8B3uzOe6LOlFq4NS+BfI7EjeeY/U6nmcDBJzOYKtUwG5XoIK77C92cnn1ur4uKEHlZ+M/irxY
 y7PcH6cTAyRy5FFI6P4GeXZMMUon/jEogQLQYvv8oZ/CiH232vBohPoAsu7wK/0UZaJWbYaN9xP
 Jw1BENHBVyB+GJpyupyt2HkHhvKvY8JZFYnVAAb02kZjcky6DZsJ881Ig5WvoMeFCYEnng4U7HV
 hfXiC8AOxrVav52GawQ==
X-Proofpoint-ORIG-GUID: -1g_klnmMhLiqG_I0M4AvcRv3TRMWZV3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXzwuu8u+jc8pv
 hT9WDm7X8yrBOid2IbJQlS/1kCqpsDuciVycDT2d0zlMSen0hTaETcSmDAjsobrqWnBZhhTojZO
 KxYalpvSrVq3/1jNhzV5JCCo5EdMX+E=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa54a1e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=COk6AnOGAAAA:8 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=hPlEVOE2XIimEfz4Pi4A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: -1g_klnmMhLiqG_I0M4AvcRv3TRMWZV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

In several cases the drm/msm can cause an SMMU fault on modesetting (due
to the display controller still scanning the BO which is being
unmapped). Fix the cases which I stumbled upon, together with the issues
found while chasing them: hardware block pointers surviving the
reservation which handed them out, and the teardown of a KMS which was
never fully set up.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Initialise the framebuffer's lock and dirtyfb count before
  drm_framebuffer_init() publishes the framebuffer (Sashiko)
- New patch: unwind msm_drm_kms_init() on failure rather than handing a
  half-initialised kms to msm_drm_kms_uninit() (prompted by Sashiko)
- Drop the pin count from the deferred unpin work rather than from
  ->cleanup_fb(), so a framebuffer scanned out by several crtcs stays
  pinned until the last of them has passed a vblank (Sashiko)
- Defer each retired framebuffer with its own drm_vblank_work, as i915
  does for cursor framebuffers, instead of a per-crtc drm_flip_work: the
  release no longer takes a detour through kms->wq, and nothing needs
  setting up or tearing down in the kms init path
- Release the framebuffers still pending on a crtc by hand when its vblank
  is switched off; its interface is already disabled by then, so no
  further vblank arrives to run the work
- New patch: clear the DSC blocks left by a previous reservation, the same
  bug as the DSPP one (Sashiko)
- Link to v2: https://patch.msgid.link/20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com

Changes in v2:
- New patch: lock the framebuffer pin state, it was updated locklessly
  (Sashiko)
- Do not defer the release on an inactive crtc, it was leaked there
  (Sashiko)
- Flush retired framebuffers from msm_drm_kms_uninit(), before kms->vm is
  dropped, and only for crtcs which have a vblank work (Sashiko)
- Clean the flip works up after destroy_workqueue() (Sashiko)
- Fixed the long-standing issue of the msm driver roguely setting
  allow_modeset, which started to manifest in timeouts and SMMU errors.
- Link to v1: https://patch.msgid.link/20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Antonino Maniscalco <antomani103@gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
To: Federico Amedeo Izzo <federico@izzo.pro>
To: Helen Koike <helen.fornazier@gmail.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---
Dmitry Baryshkov (8):
      drm/msm: serialise framebuffer pin state
      drm/msm: fix framebuffer pin refcount leak on prepare failure
      drm/msm: unwind msm_drm_kms_init() on failure
      drm/msm: release scanout framebuffers only after a vblank
      drm/msm/dpu: clear the DSPP pointer when no DSPP is assigned
      drm/msm/dpu: clear the DSC blocks left by a previous reservation
      drm/msm/dpu: only reassign resources when the encoder is reprogrammed
      drm/ci: mark pixel-format tests as passing on SC7180

 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   2 -
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  34 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  17 +--
 drivers/gpu/drm/msm/msm_drv.c                      |  27 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  78 +++++++++--
 drivers/gpu/drm/msm/msm_kms.c                      | 151 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_kms.h                      |  16 +++
 16 files changed, 283 insertions(+), 68 deletions(-)
---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260902-fd-kms-fix-smmu-2d4baaf460b0

Best regards,
--  
With best wishes
Dmitry

