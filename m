Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998B549364
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881064; cv=none; b=gGS+I1L/fG1G153xnFKA6PMYlsnpSShOHECSUHbOT4SYCnhwfdlHVMPyCQCobaes3xm371VEiRBenUoApi/aROj6gvQGaeZmtyC5yEJPIr4rpDPaLNDnO5vFZnE3Hxr7ZY7vGIBRyLwuHdYVIzjGa/kLTQAFQeiYzzBwLFZ2tRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881064; c=relaxed/simple;
	bh=rpTHwGs2zVtIX29Hf4f8KNNEO8Xrccsx6BFDzdIrL80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E+JsmRgfgdwmGQs2UwnPI0FdJCHbhR/Lrjd990eVxnRmYhvTaEKCu7/igjE5/Q+bvuVbHC5Pd7sQIbtXzsENl8JnrUCgluQouGtQhxDSXqh6+IcTcCRfNm9Vrxf5s3eBkbhKGKsk+/9WqgVjzGvL9N7Q5Md6KQRCRi2d+UnkMo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1e473dj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFwgzHbd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1e473dj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFwgzHbd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688F1Muv273510
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QQP9xZA0DIBu9yTvo0EnII
	J/cPZDZ1G3rrVHZCeKk5c=; b=i1e473djRNxt9irLfG52L0C///QTqQKtQ/pVy5
	oZNlvE+a90/gQMP2S/9d75/ZaK/qwHszaeo3pGAyZnLQxB3UD5Al5gL5MfSfx1H7
	AXNqn4c3JKq/V8DG//jfJn20zoSHUXExbGbC4Lu2YqYdb8D0XmWWks3diGLy7fzW
	tP0BLLognjWneqm+kNhVIotDJ0YGeX7AbmxXZSEDUv6V69o31h+TzlkglRIe/QtV
	gIVLd6k2CzAXv62XyNOdutm2t9mNQ7NKXF2uL+t9J33OdGLXmY9J2uVZsrypZM8B
	CaQXtSeNiSMY7pu+pDOl9lf5s9CyOAU9WY9mQCTaG8RwIVhg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0paqv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:24:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c664914e69so5073181e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881054; x=1789485854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQP9xZA0DIBu9yTvo0EnIIJ/cPZDZ1G3rrVHZCeKk5c=;
        b=IFwgzHbd7vrER3S570nxGGvFh0jT4r4kHyFdcMq780wbqkDIL7otbw+1c9Qa7O9gb5
         HZquy4oOZFdVmktuOYYGho6iNjFHEKxk6sANcqwLmZyeU7RX0/PF8HvDbZkvrGVIegO8
         CpsaY8HOoZ9zYdbTe+gEcfbnbIQlk7wYj1g1vK+djs1lvFudCMU+l5tErvRLpQeYLNsl
         wkRlFcqWpZhL2EVP8Dho65hNXkJIJ8mEKrvcVFclKHqnavTUygWj5bB7JEpOeZEE5IaK
         bQ5IlbcOmlLCSGNuKA3sOAHNrnsjk/1/ZaP4zVDVyevG/GXg/goWrTf+mZ/lze8jTFa2
         slIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881054; x=1789485854;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQP9xZA0DIBu9yTvo0EnIIJ/cPZDZ1G3rrVHZCeKk5c=;
        b=rpVsOW9Woo+222FwPEecI8Qc+7a4qVCJBlpLIsvFtpzqd+iGyq8S/UEQ9zp45Jv8eg
         ERDfz4EZUyfNb+W5CMHaV8anz/W9GHFeBFbLeYg22KdmpLm5HN7d/zQdM1uZ6YhIiKf9
         zWWSvmF9pEJJE2PWJ81nIBtjCwYqInvN8K0EgpARWZX/a3T9xXaLWyW4sSAJFahZdpHs
         ItvX0+r+J6zwOvPWNiuzWZMYmyNPaSG3nq4N/g3WJX8VMAKU4infNRzZX8nTlIT3R/aV
         T4qThvoBoVWY5KQOM7SA83Mj6N2gSsMYHUBUZ7B8ZXMGDspmA4tsHnKIy5XxCSvDnx8A
         7E3A==
X-Gm-Message-State: AFuF++kjztFn8reFVf7TGTr90l0g3yf1kNgp2eKAUCYZ5Kk6+xrY0Nju
	BzRlqtxBjazpq0txYYT27lLpLo4GXhh3/7x/eEcissu8rhCCHV3ThfY7MYrSoGgo+Yy47NU/Av3
	azf5THFdP4fSgKvtexClPs3nb/QgGsENTPYQN3pCFgTJ4vtA4T28DbuHCSBRaKeDQqrPq6jfBew
	Vj
X-Gm-Gg: AYBFou24BtnQAxlk9NKxiZ6cx71G+4PrIyRwZ5bJclfHU78fYzT277TkwtgbkV2jrXK
	1zhYSPcLd0nrWrjq1IDhgEOLUymcAw/5LhXp12JqCTbsbBcVZuD11zvw5FJ4Xmln3GPploNWSRo
	hwE4uHfItJc9SVLfA1Mxx0FTrmolxnsR9yDjZlTViTca5vR3O8lI8CMFu9Euz8PnwIS9Lm1ZKyc
	Oiyg47X9LV9Xh9kERAtNnp6kvP3Au2YNz9qfvdKUv1/QSRBZSSw/DoHKgXz3EDxlOzsSey1t4ji
	YzvCpX7aywcVbCj044s6X7XtCSefT1yIHX5b3c2HEgXdp3mAAeq1DRQfojUrNFfxvoWmex7Gw8P
	eRB2D+Lbx0RsWoBSHYiLc2kzo3XP3rEieY1NRgxqmlWRi+7c1wNZGSYMBT19+c2qqhEZQupSKO1
	Syb31cNBQIMwRW
X-Received: by 2002:a05:6122:2088:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c802286397mr9419978e0c.5.1788881053678;
        Tue, 08 Sep 2026 08:24:13 -0700 (PDT)
X-Received: by 2002:a05:6122:2088:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c802286397mr9419925e0c.5.1788881053156;
        Tue, 08 Sep 2026 08:24:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe10asm3103722e87.47.2026.09.08.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:24:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/6] drm/msm: fix SMMU fault dumps
Date: Tue, 08 Sep 2026 18:24:08 +0300
Message-Id: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgooGoC/2WOwQ6CMBBEf4X07JKlkkY8+R+GQ6FFqpZClxIN4
 d8tqPHgZZPZnZ03MyPtjSZ2TGbm9WTIuC4KvktY3cruosGoqBlHLrBADo2CmyVozAPI2gBc5ZW
 UTS6wQha/eq/jbUs8l29NobrqelxjPg6vhxBR48/WGhqdf249pmzdfpH7P+SUAYLAg0KeF5kQ4
 uSI0iHIe+2sTeNg5bIsL/lGPiTcAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rpTHwGs2zVtIX29Hf4f8KNNEO8Xrccsx6BFDzdIrL80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqoCiaw9RBogKdJLJxAJEkFZtSNdlcsQvN6MLAz
 BIbwHna2LWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqAomgAKCRCLPIo+Aiko
 1V9vCACUqE0klKsbtF7B4tbJInBmjGTJOGwmZumwwVtB3ixyaxgM/EXPmP875waq3vqc5hrvVrx
 dhP28h0kakuVhmw1Cha40vhIhGt4oAkFnezY4BfFvinjKAOmwN5rvo5kInl1SLKwhCo4g2fr7Rc
 t8fVV69F+jrknh70UyzUUrvrpwCssbv00q/MHTMnIKFUlSf09qpYPINy903pYTlYAjPluDRVjW3
 Za56nKDQY59FeRpS1htivu6nUhEfdFxuN4u5fiLDa5bdUddCv5lNtWb7W6Gxv8w+8bI+oeZPCux
 dzRUMgTvHUgZw+Yupmk/8+qjGE8e9Tl6a7tCP4bH6ja/fgNh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: s43MI4D7d6Ezl61c1OrJk8oBoGKlzBB0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX5ARTLaT+XMpa
 biu3vbXsOa2qNoywHXRfth71EDG9fwBKwXeCuV+F6Fj20iGb6upHq6/NhMtCKIKHY04WzlnWuJV
 0f19UXNi7h6EpuJot1VmswCh2ChfOuI=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa0289e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=COk6AnOGAAAA:8 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=pP-i1W5VvTVjX-mheSwA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: s43MI4D7d6Ezl61c1OrJk8oBoGKlzBB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX/atjpmLENnb1
 VAo4pgvTXA9Vg00SM5w49cgs32DdA1x9PLn9dnRGqAyT70SrZZE+SSxd1HyYUfDIK5/ttQacP0G
 R7rVE6iilKGsFqcRMESoNQ7xpCoZ+ktv0R4h7wpAuAner38flqDKMkHG+ngQc7siel7Ekv454ps
 Wot7VlpHMfxvhf1KpEjUSU67F4sbzQRNC8yCMRRvhN7MfKQq55pMkOXmlnPEc7cP+Ser01ey4iI
 A8l+L7UNUy68WXaV8agtcTB9gOiucDevnhblEu1IeQFvWhXm9HC9rZj//6U8cNbWQ2nwidqo4Vt
 +XXTFSQXJ63CFWK4ZI/z4bM4X+kcHjrOleNHfPGGSzvW+ldH4Mp6wVQgoW6LL5dv+80U4rS/1kp
 w3IFNhxOeE8aozjcK456nBOx+CYk+IzpzpKvRcORmQSfOoWnhI9RxTcZ5icMCwo//ywaaRWwJhu
 xBcgLKT9iWG3GvjxOHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080166

In several cases the drm/msm can cause an SMMU fault on modesetting (due
to the display controller still scanning the BO which is being
unmapped). Fix three cases which I stumbled upon.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
Dmitry Baryshkov (6):
      drm/msm: serialise framebuffer pin state
      drm/msm: fix framebuffer pin refcount leak on prepare failure
      drm/msm: release scanout framebuffers only after a vblank
      drm/msm/dpu: clear the DSPP pointer when no DSPP is assigned
      drm/msm/dpu: only reassign resources when the encoder is reprogrammed
      drm/ci: mark pixel-format tests as passing on SC7180

 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   2 -
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  34 ++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  17 +---
 drivers/gpu/drm/msm/msm_drv.h                      |   3 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  63 ++++++++++---
 drivers/gpu/drm/msm/msm_kms.c                      | 103 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |  27 ++++++
 14 files changed, 221 insertions(+), 43 deletions(-)
---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260902-fd-kms-fix-smmu-2d4baaf460b0

Best regards,
--  
With best wishes
Dmitry

