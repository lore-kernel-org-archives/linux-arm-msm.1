Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1841451982
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427507; cv=none; b=Pnzxc5htIFGCkuyGN+W0WGXwLg0jL7FrDzoaU+RyV4ZfsPYbgwmHzQMXkewNQf56dqdJB+zaa5lsQdIan4lbWkWOHei6YzmV43WyRvRzvoJb9VOJ4B+4XL5dMNCC9eYma+JFvZ9whQhYG/p/A6OqxRjcUMr9MtryeYbD8Kg12qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427507; c=relaxed/simple;
	bh=YMHA00MGVdMnlcJxJUco7AZri2HHepPYlEdrPa5Y7M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uK0uWTx/f9bNFDS8PqnKyGKVpXWkH3Mb8mP22bppIsfWN7YIAFQCBGWFQgIxJbmxXyB56t/xrrCbJvKV9rZJ7SFC9JNgraHDo4FoWko0v4JTTE7svgnMviNE/zQpSy9x+Nrz0oShjzvgfyHQ9uLGGcRkcJTiXR/UuqgldILxIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P59Y+N5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATJkcZWG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P59Y+N5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATJkcZWG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQxFe1023460
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=; b=P59Y+N5L7cVuDVWt
	zuGX2bG32jSGlZ0SovPg35dI0f5HBwFVcTOylO2/2+c0jWwVxPe6hLPbUzca5YpW
	m0bVcOX1RqOi5WQscJW8y3z5r3DIAV9/b00ZallZvsOmpPLHJvgPK4Mk99MH50fF
	bR3/G57+apjiZKrKSII6IgvcW6NcKQHgCndt2bhKx37reFi0e1N3QhLAOyEb0SwY
	uqJEq7TnZQKJwC09dSHbYLXPwzwIFwpAfc7mwHc9aYFGLFbLcvf23nVn1AQ/aoZr
	zhZoyN0JphAcyA2Az3XtQvSE7dUC9+oRmboSwakPqFwq2+nvg4FwYi+ueo8TXJcy
	fs/cSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n80g4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:05:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso25419101cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427504; x=1786032304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=;
        b=ATJkcZWGUcQSfA7i9B00fXpjmS+MS0s7rxJev7UH8d3c4uvoJrJ7FJUk/6nSAvELrg
         sDi70r5jCoQdcxGPXP4ia91LPzJTXYPzi5baMhloO2tyYwFV2fzt+FvYMU/8jtKy5T0h
         9aBZih0TlZY6v2fMsoRtVoWEE7vOuksYqt+ShNetLplMqUJ+Th070YQTV27IWPH8Mcdd
         RD4Irk+j5B/d5pxGwbm/6d1ejwIP4JQMNRpBtGKO0KEREx80HwUHEd67pP9b+dPSToso
         XjOF1TZRNlmgK8aiRCqenw1kLt2zFD1q63PGevL5KXfjFrGmnUO2NMPeJ5I7LyPwvyDR
         dNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427504; x=1786032304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=;
        b=ZU0eBVteVtn4sqn3HM+Y9awo/DhtSMIx2+Hf4goBvsmEXwFAaghoCIGH+I6ZLRGXDt
         qGFmwgGZNADXCLVUfgpI/H+hxCmkEWIAjf13v1+y8YjHeRN4NgrkNDUXbyqDRFIpHJ3f
         N2QzMn6hyp2MVKkJqT+x2U3bWJ2AsIQqJBIqGkqB33aB3LQkLotfOiS6tEAIRUhH+4Y8
         nVR9xGf3VFXCWwsFu7oMcKGeTEYlz6jl0EnoDZ23SGoCQTRLKbFZlQnk4Kx3mztvDhlr
         n0mn/J5gsqYjp6D5x+/Su2cEzXfbxHWxS6f2uNpGBiZiMUDymDYujPC6KMQWkLkFi/c8
         vsVg==
X-Forwarded-Encrypted: i=1; AHgh+RoiIWcnY0xMmPrC1KxxSBS8af9FUXY2Y7SEVzloG3Rb1DAP8FhoHiMdTcFIg3loUer4adO1KYeTJI82/DMl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4b1Yc+JPZccLQs7JtipGZsjtyR7QEyta3Oshk0bMJ0Zv0GxmN
	sO23p3dOSE8TU/TUXaQRoYdZxTO987iNa972VMcAL0cIj2fH9EelerbiH5Hv8Xg9pb9EsTJj+GX
	Z64JYgs4V/cQk8Cok+JnRnh/x+pp2ATrAmv5oEL+ZIXwiPiIL7iVxaXrtnT/LFlZvUSsh
X-Gm-Gg: AR+sD13+vgnUJ0MyhXJTeiM/a5wp3DUUAJrFi0uH7yZ0IQBGOpsOuZqQjZyYIcIkkM8
	/qbqREEa3Bm32T43hPNP7A6XPb4nIVTCId0uOEiT4L6GXYhl83TcdrHwy27Mm8lFoF7gcQAKcNM
	xJipUCPUJVtjrSUreNA2/a2HebZxgcKcAAVUIaXigfAxOn1Oz+3Z9z/02L05JYhUcsfkBkxrqIX
	gZ2XTEoGBU/C/Z65BbtBcRbU1RjehUmrZk5ddKijXwRNQgH4n27ZKuxvOpcTicT4ah70DOe9y34
	FTJNDB+z8fH/CxX6UvzGbdTfHDDNDaqFvpJ8hTLwDgyxo+PMhjyjUfY/2ILfj5HscR78D2s2gxs
	7kDJmOX/dtWgeDRuJ21c0Nd3sd13IC2RJHYAiaEq5c0QvXz6gQVHL4S5AJ4Dx2q3aLlbh1fXNE4
	5WftsAnBRa/0aRvQ==
X-Received: by 2002:a05:622a:2512:b0:51a:bec0:1040 with SMTP id d75a77b69052e-52b383784b6mr31060921cf.12.1785427504028;
        Thu, 30 Jul 2026 09:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51a:bec0:1040 with SMTP id d75a77b69052e-52b383784b6mr31060261cf.12.1785427503397;
        Thu, 30 Jul 2026 09:05:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db8a3bbbsm455174e87.0.2026.07.30.09.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:05:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:56 +0300
Subject: [PATCH v2 3/3] drm/msm: detach the ARM DMA mapping before
 attaching our own domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v2-3-18e0daf2d836@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <jroedel@suse.de>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YMHA00MGVdMnlcJxJUco7AZri2HHepPYlEdrPa5Y7M0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa3YnaPFREPHCdxSgZcp5fpVW9xlJ/nlVPFcVS
 v0UUSRLrMKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamt2JwAKCRCLPIo+Aiko
 1VQHB/4jV3KN0jQQp5q7JC3OLW/+7/9QYHQszWWEPbzovZ7YSoVIaUjgRZYI/1ctEi+wcrpzaAv
 Va5WmD7hjl/D2fCOXFhNsDNVitwbyzMoFcySrFAP6HHiFtTWfb0LolQS2OWn1XDa6L78DNFut9s
 fJJlX6ARuf/n9NgAbt3aVC3gHG+EXDp7uX0Dgo5NNP72nh/ericsR62eeX3/BOo2HjazwEyDnqh
 76tcLP0DlMrGzVG4djvTwWelXB6ADuZvwe4f2F8EtHfEzsw0GpbMok6Z+pcijQJU69cv/8GOjvc
 qO76MtdwYmfE05Nk6nmAJJcIncdyXlN+lD/MqChGEPSB6DSi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX6VyloZMtQ9Dh
 qFe3WoG/R5XJTaqjri387L3DchC9KNAF1c6AnXscddiM0+zJPCpWBR4CL+lB/qgzAYriFd31zlC
 uyVwtTgMLOL+99sB09sCd8cJvbFx3a2op8ymO8Cnkm+Y57GXloamOhuZ0fLq5/OqkrWsXH6+ZnB
 FKh5D9spJQVstT4qJo+gXRVjri4jRqe15ujXfg7vG0f8XsJGzOUil4armj5j5Woy7LF/vCqzg6K
 KYqlBEafTrqrvEudXZqfb/7Oy063WdOf1nmmtnhPeiFKuPlbSw4StVomXFNKHMVpHY0C4tp7NR+
 FYNBfM/ukt76xv+pPrDynMEl9KBysjN0jRxGty0SBYdK+kJW4qKJgWVWIr5wOBxLPdPgjJsNW+y
 KP/Dw9romGmKpUtuyu2mjIjvMEBds6uSNkefz4iwLRzYCaRx2qLPNPveLaAACn0gCihcmy8SZCm
 rvKw7F9k9U8/xYSsdjQ==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b7631 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=epCurf6C53ZFYVxhAokA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: nMk4xQxCvKelbznU0akTd11CHf_it32V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX8LeOrfKoQ9Sn
 HM7cEcF5WGQw1Ua2P7IHmWcjLiJLaoRZ77bTJzUL8r+v3Hheqw/HWgdCKsASloYgoKV0lB+W0LX
 +vxbfEJyi3EA27y5OUi4mo83pPT7yjk=
X-Proofpoint-GUID: nMk4xQxCvKelbznU0akTd11CHf_it32V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300121

On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
dma_iommu_mapping for every IOMMU-backed device and attaches its domain
to the device's IOMMU group. That domain is neither the group's default
nor its blocking domain, so when msm_iommu_new() later attaches the
domain the driver manages itself, __iommu_attach_group() refuses it:

	if (group->domain && group->domain != group->default_domain &&
	    group->domain != group->blocking_domain)
		return -EBUSY;

Both the GPU and the display controller are hit by this on apq8064
(IFC6410), leaving the board with no GPU and no display:

  adreno 4300000.gpu: failed to load adreno gpu
  adreno 4300000.gpu: probe with driver adreno failed with error -16
  mdp4 5100000.display-controller: [drm:msm_drm_kms_init] *ERROR* failed to load kms
  mdp4 5100000.display-controller: adev bind failed: -16

Other ARM32 DRM drivers that manage their own domains (tegra, rockchip,
exynos) drop the arch mapping first. Do the same in msm_iommu_new(),
which both the display and the GPU paths go through.

With this the GPU and the KMS device both initialise:

  [drm] Initialized msm 1.13.0 for 4300000.gpu on minor 0
  [drm] Initialized msm-kms 1.13.0 for 5100000.display-controller on minor 1

Assisted-by: Claude:claude-opus-5
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 897e42c8d5c8..da6782fca6bd 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -7,6 +7,15 @@
 #include <linux/adreno-smmu-priv.h>
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
+
+#if defined(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#else
+#define arm_iommu_detach_device(...)	({ })
+#define arm_iommu_release_mapping(...)	({ })
+#define to_dma_iommu_mapping(dev)	NULL
+#endif
+
 #include "msm_drv.h"
 #include "msm_gpu_trace.h"
 #include "msm_mmu.h"
@@ -749,6 +758,19 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 
 	mutex_init(&iommu->init_lock);
 
+	/*
+	 * ARM32 attaches a DMA mapping domain to every IOMMU-backed device,
+	 * which would make attaching our own domain fail with -EBUSY.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+
+		if (mapping) {
+			arm_iommu_detach_device(dev);
+			arm_iommu_release_mapping(mapping);
+		}
+	}
+
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
 		iommu_domain_free(domain);

-- 
2.47.3

