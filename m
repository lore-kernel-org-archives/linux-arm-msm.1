Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1E43634F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418179; cv=none; b=LjXXc492yD5CVSKGkE0/5QtYt7y7Ne9M3DXO0f9KOoNoIWq/nhnWHtypy4rajMLVvDJUHdg7BL3fApcl/fNiz3Isqw+eq84X5WmRAy6hiHlpvPmECzDAaoxkMsP0e+kVRcnmpfBblufCREs6Du7VVWSnc3w1BCXtqLw/PMWSQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418179; c=relaxed/simple;
	bh=QeuOZ/3E7srmsN4kZYdWvz+jVIa+pIBlQp4fMxk0c0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bTMNscY46jAQ9jIKVd5Pd9FA0OPcafxP3C+XMq+Yr1z45GIThbved4a0q3XvDiuYflR6HGNPnPnBoX5BXbM0pObpPiC1VdKoD0uON+oIdZvVy9KYYG/FzcTNr08vbTuLuNuH34nEQtgo+SWsIPo+UasJyYIspEuK3/6c/+wgJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1Ki/nu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfQyQgIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1Ki/nu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfQyQgIn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDRxu427148
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FrBxWxjqRXZNRvOm43VwxP
	FxRLqKBA6+pd4WCL/GOZE=; b=W1Ki/nu1aVDuyPmM9trr6PPb7poeN5QDAOHsEd
	jbhxiSE6nzIRlG6VNHVvOWDlxFMQViG076Bqb32lcOWyDA11SbzoNQuFcWndSZMR
	coFq/pFW78LlK7l6/SU8ZAfJEF1kqB6mhymB891IP2occB8EOuORh89+Z3umwfiu
	3nJpXOCbyDIlG2AHNzAA9xVamUUf0z+LaE5AXSPC3N6D3F37fh7gnq2WekrmZEbv
	jU8oNIbAamDOLMHLdYipWTirAWXO/57+xL347zRIFM3qABSy3Qz8Ww0ucD33k8t1
	HnqTJiKpmwfYcme6ZpzR2LIkHopmHTUrYZ5P64P3tutXgW+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tyh1h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so31816961cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418175; x=1786022975; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FrBxWxjqRXZNRvOm43VwxPFxRLqKBA6+pd4WCL/GOZE=;
        b=BfQyQgInvrqpatp/kurRga2Xfac1zregmpo1T9+7zuWd7mrmRYYpY3/JmUxhvHpH3N
         ovfJyZ6XBrTSrGrzvWn4cgK1/sVIQnxpY2nbLKtr6mEv6rxcSVUP6hVPs+qM28Pvrpim
         iNZJxjrANBLKxsRROnlhomho7qJiHmwMYXi6F35WzvNrEZqhmtkc8g/mBnYeAe6HBrDL
         1H7J1hxAlsV01VYzKxnoRk4Sbagp39xYd+FbX2qm/BYT1orOhHA/5xK8X0sA+gT/P6+R
         bCc6HAZdB84rO6d43zT8rHgMgES+wwTwYyaV2NwrjHFrvY2+tiYtHrWh/zxX0KuC8nIr
         TVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418175; x=1786022975;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FrBxWxjqRXZNRvOm43VwxPFxRLqKBA6+pd4WCL/GOZE=;
        b=n7bd5k0KJ7OjHtgHJORjB8SjP2+hD/iZxux3+qPGnRCNWxilV+6nZdkUFgV4mXU9TC
         sWA9R2kxbIlE8cSGKgmlUxrKW1wr/L/Fjgib+DdQBfMh19Bb8KvXv87P3Lr5/ELVtWVb
         ET1eBbASqFOWRWSCmKRZ4Tw/IKZ/RHLPWFKcKT7QRzepGlXJOU6/SEcRulVdDv0I/ZI3
         AyL3aBdTkApXVweYaCCbnzubF/xxmS4qfbiQDHg4W2tlH7SoIdMkiejUakv36DO3v+7f
         uC2URsP3e5iOuewrwAst02WVmcV5fqXl/a6RkSLlZQCZZ7yKXuLl3KwaF72yQg6t/xd2
         gqSw==
X-Gm-Message-State: AOJu0YwMnRwW6bkhPXXD+gg9oxZHPYcDsCc+Mzwx5xASxNOajHCDQ8+i
	AlJuI4BP7+hHmE9ybaR/skD7co+oDTIHPPdpZ7YgCPy+qTT512ya743lkioaBsEemaJRdYR5k+P
	eXByC+wi4wOT4qJsTnMIMt5Guh8THc64vm1SurPEnCi9WviB6LuAS0aERneI2Fc9BicD6ZtZKky
	SBShw=
X-Gm-Gg: AR+sD11GROdeZUWY2I4omaLZCJeVTXV+UX7DsZiRYuD4j2rcXbMukXZgXpLDFz+LlGs
	XzWU/SqpnDcioDcYDdAq81/6MI8lN9iohq1b+laktppINpI9Ixr3vJHFolnfnC06SKtkKxnK5I0
	qTnV0H6cJh9l4LjqC1QqRjn4XZnhnbLVVrTW5odjYA9FUM8FiPy4togvZUf9YswUoQ/Q39Z/G8G
	8wPstIoVrsYmv+82wlmu/+WPfATWUFmacdID6ZsmjFYZciU6Fqr4ykORenDAqK4SOW/2XvAnedK
	jfznMZc+gPekodP9t8mHjSxCkM9nL815d7VqWNK2jkvlQb2u55XCU5vcXEvHU7xZqf6P9rUbDY3
	QIbPc1SobFp41k4FjQsMhm4Ae6prJ+sHAac8VpexyuQQp7FkiR2i+nnJqyvnVpUg7fLsfUXYx/P
	0EgmxCzlPbue6wfg==
X-Received: by 2002:a05:622a:1aa0:b0:51c:61a:50fa with SMTP id d75a77b69052e-52b385eded3mr25658371cf.39.1785418175014;
        Thu, 30 Jul 2026 06:29:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51c:61a:50fa with SMTP id d75a77b69052e-52b385eded3mr25657711cf.39.1785418174288;
        Thu, 30 Jul 2026 06:29:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acaa009sm2976631fa.34.2026.07.30.06.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:29:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] Fix GPU and display on ARM32 platforms using the MSM
 IOMMU
Date: Thu, 30 Jul 2026 16:29:30 +0300
Message-Id: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpRa2oC/0WOQQ6CMBBFr9J07UQoUqBXMSxKGaUmBekUQkK4u
 wWMLn/y5r1ZOaG3SFyxlXucLdmhjyO9MG463T8RbBs3F4mQSSEyeNgFRjM4IOcmaPKiKo3MW1l
 WPN68PUbg8N3rc9PUvNCEXfIlPI5TDIUT+3cU+1UcuaNkvKYOSpNmQiRtdZO5mtNd02hCiG84G
 xTrcQlXpymg5/W2fQAr4Tap1QAAAA==
X-Change-ID: 20260723-fix-qcom-smmu-b5798c65d689
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QeuOZ/3E7srmsN4kZYdWvz+jVIa+pIBlQp4fMxk0c0c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa1G8vHFfUkazJpdtkfWB5qcSLTbcR9WeggcWK
 ZnHvv659nSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtRvAAKCRCLPIo+Aiko
 1Q4KB/45W5IuLGMfukDxWtAm4Kn8WpvsrZCG43DTGKSpOFCALq9XgwWFi8s9keLSIB4kYrYNe06
 XtyxqMCC0IkQ0FM1E//oevvm9bvqUqL/VeNT9pSZykkGfRuEFxlwC04OkBZMAY86IHws8iYgGeA
 TBNi1Xu3GnAMhqtBzcqeHzGdVUn87pGMjczIsbbM8CX2dT+xSCjA1ztwD6ZIPhEC4eeYw8XhlyA
 Oew1C0tmhzqsF/zcB37ma81WyXwpOiLc7RGR66XnWNPAIvKsmhyC6UUHLA9v7La6w5GRi890tNo
 uTB4CSpg9MoHUsrXHeKMbwt/nxWdl1Z0ZcaMEM7DxFp2bEvp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3r9_ACrmAEY9ACbIMMijmgqW9xdntJ9V
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b51c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=shkEvlnnkTupmQYayisA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX5UIGSEGsD6Wd
 k7Q+ynDjcaNA6Mvo9f/nVYsP94RSqPHpfjMB5kUZ2ULa9di2BrMvE9A8LKXxefeJnflxczgngiL
 LCWdOuouHVMl+t+xYTvuFqL4Tz+Ibz4DL5uvDXaHEhiYr/RnljSj2WS/oljm1a4YMDwIwriQpRV
 QqaQ0bTbl+30zIvgwYLJ2lZao7R62udTw/GJpWOy7+Ht8AmhWm7SCuqkGieuvASGjE8BuexQJuj
 npsWIiFqTVvBD+0XioJK4R4aD0XQAwbYO6MY7kGNTVOdzmhF/6vRq1nHATXTx9VpXlbK4xW9r8j
 Jat6um8ntT0qrmIFDOmrfYQ44CpY5GoCTjROgtICvpXZLIkJWjGSZfxHVnYBdo+uqJdTkXIefGC
 HdbY7Xew3k8hegIo77o9M/fJi7B/b7IVGRZ3xrRcL8lrJWUd9vrG//BafBHZWb2oQg2IxWSBwXU
 W29I18K/ed36EdXQmGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX/ootI9rutaIw
 C7XKEdpmLK1SCpGpaZfZzxD/UIWeHe8p40I39yyYi/WZuuEjadmiD4Nb14JjSTht62oLLaJ21MW
 fM5STIGMD3PKw99jj6XTvuJexEeycyI=
X-Proofpoint-ORIG-GUID: 3r9_ACrmAEY9ACbIMMijmgqW9xdntJ9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300102

On apq8064 (tested on the IFC6410 board) neither the GPU nor the display
controller comes up in mainline: with CONFIG_ARM_DMA_USE_IOMMU enabled
both devices either fail to probe with -EBUSY or take the kernel down
during the ensuing unwind. Three independent problems stack up on that
path, one in each of three subsystems, and only fixing all of them makes
the board usable.

First, the MSM IOMMU driver does not handle a device that is attached to
several IOMMU instances, which is exactly how apq8064 describes both the
GPU (&gfx3d and &gfx3d1) and the display controller (&mdp_port0 and
&mdp_port1). It keyed the per-device bookkeeping off two mismatched
things, a per-IOMMU list and a per-device pointer, so only one of the
instances ever got programmed with the stream IDs. That had been merely
wrong for years, but it turned into a NULL dereference once the IOMMU
core started deferring probe per instance, so today the board does not
even reach a shell with the display enabled.

Second, on ARM32 the arch code gives every IOMMU-backed device a
dma_iommu_mapping of its own and attaches it. drm/msm manages its address
spaces itself and cannot take over a device whose group already has that
foreign domain attached. The other ARM32 DRM drivers that are in the same
position (tegra, rockchip, exynos) drop the arch mapping first; drm/msm
has to do the same.

Third, arm_iommu_detach_device() undoes things in the opposite order from
the one arm_iommu_attach_device() set them up in. An IOMMU driver that
allocates its page tables during attach therefore frees them with the
IOMMU DMA ops installed rather than the direct ops that mapped them,
which ends in a NULL pointer dereference. This is trivially reachable as
soon as any of the probe failures above unwinds, and it is what turns the
GPU probe failure into a crash rather than an error message.

The three patches are independent and are expected to be picked up by
three different maintainers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      iommu/msm: track a context master per device and IOMMU
      ARM: dma-mapping: reset DMA ops before detaching from the IOMMU
      drm/msm: detach the ARM DMA mapping before attaching our own domain

 arch/arm/mm/dma-mapping.c       |  5 ++++-
 drivers/gpu/drm/msm/msm_iommu.c | 22 ++++++++++++++++++++++
 drivers/iommu/msm_iommu.c       | 27 +++++++++++++++------------
 3 files changed, 41 insertions(+), 13 deletions(-)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260723-fix-qcom-smmu-b5798c65d689
prerequisite-change-id: 20260723-msm-fix-crash-8c13220d9465:v1
prerequisite-patch-id: 3556d41e924ad64e8e9c06cc5bd1972c66957f42

Best regards,
--  
With best wishes
Dmitry

