Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA688437878
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418186; cv=none; b=dlibHuRIddmYCcgJVgS+NlJTAf06LatQWhQhSBip2h4u3qnvI20iMzzcLvaQl6XTHWQvLBhSVgEurcBWEIuw3UhhPihsQr1OoRJ55QFXyzjnNZl3BZCJDpJ+3uGJWF/pLqyTfKhKnmfhb3OV7gYNQYKwL7w8LrM8LlA0asKvzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418186; c=relaxed/simple;
	bh=0nxp1o2ipBKscUADiWjzkVftGYkzppsXEG9Cty/+pmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdnGOMv+GScUv9HaoHVoygd2eFnjJTcHtMpYAYK18iPgGBOoArpzaCoW8eWg/RDMZoX36kcGDgYpnrywOE2tptF18wi3Rk8sI0xS3CU3C3kCchZEd1U0ui53o8Wlhj0RLdLoGoBSgZcSYKo3FtBXhEoUZYtxdIlfWJw/q1iAKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYURgvp1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fS2PivVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYURgvp1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fS2PivVU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDEHd1106509
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=; b=LYURgvp1IOeS0d3m
	HJGWxB91RSgH72Uo0Wdct4qEB0Z5w9mxpcC7DbYvvYgDuF1tehH0if988qoHbQYq
	Le4FvAaQhwnLlpAhDjC+Uf2YdruL91L9z3E/sI6FTdT6/uBoD8ABT8NfEreerjze
	TUut3vh+uCVTZltfqpNOLy4MeoIYwudZua9D0jXR8J4tbo3jB1qBLkpAkJ22i2zg
	UudXYyrIDWVIK7zHsR4SQ62EX7OnbzzAQEWXvV1kRqS0fuY6ClwmX62gWdItC+ed
	zMIWYBBCVSmlxo21fpgvXeVO9+NLYuIDXOtl9x+2YmLOxlS+lWoJlzX9vsL7aOqL
	LzdfQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6xk05wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so36208481cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418183; x=1786022983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=;
        b=fS2PivVUlYqmHcopBBQY464GD0UTv+ZKNTd+Mo1moiYu7ZaCUmmRecBGhV47sqzsN3
         4cT6bnBs7WHauLYfcRtL3v7HLedjA2j9MGaZUm+Cjt+3YgQbb/tFUN9VaDakQ2HJlBuJ
         RNiZr7XkpO3DO4D1SDi7TvGLCeGJgss+HL5qzh/7WqGgw+CNxoSDLaHdSpcOayLpzsXV
         iDmINqePWBTiKbJr7uBgyzqCG+4uTeAU6bGmEiaP+0Z4XyyiE5q5zcFuyyaulX5Q6Kwl
         ygERCtBQGp+KZAUS156IcOfPDHysuD0kZmrAju0vPdlKGx6FD71C3qWjAaCwHwVhb6aa
         rE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418183; x=1786022983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=;
        b=eUPhKwuQkW3RfY9tltCfzFmLW1N2rO97j9QXFLajsO16DCy7Fn/Ds+IXzaARg9KU60
         D2db+smCDsUJoO2eLBSS9hmvO3FhrpHJiBK7CsyZTyqk2a+fs1F4huynLine1DeI5R+u
         c1QBfaMYiijr1z20eWHw0owCw0SpbBN574GmTPnfXzb4OMVtbj6LdRqWWfIjK9GvYRrV
         gCDgckNZP6LiVe2fSS8P9KNUc2Od+aOnlllQXQoOWVsWpArmgcyVtJiEmB9TxQDi2XNf
         NQn56MGbUtyYrHp3IpSrDkdolUkKcxx4eQ1ILeci7qUlzR7uBxgUnyonivrPIjPrRHpt
         yJRA==
X-Gm-Message-State: AOJu0YzVjF20ewwMjP/Yiflb5/G4U+fkm8iSa425CQDu+jDIYfVytZcP
	mbsj7O9FuhQjk31GmDJqJ77m1+4J952/DQzVlWj0O/OmpieHFQ/vvZ010XNOIsUYahaG67e1c6O
	+gP/+DQ3j2lC+OC1A9N8aUbHgAI2qNSV3u4WOheeF1Abt12gLZXjUeWo/uOktY/7V9ttNPkiqIJ
	m80VE=
X-Gm-Gg: AR+sD11AHmvRfr42CMbz800aYcbj8iHGuwOKSXwBSixAt4HCz9caXkVxdsr14ix7gY8
	qPUfQcTpDDFCpQXgv6420K7ojNXlNk5R8wsa1mT3EfCfhHrez3MR1DdoMHUpBFNyBfi/ZZte9hF
	gG3BNcG3rR7i4CFOuEhT8HZ5ZWbCiycwXyWIaW9PrgXIMWLvXJzwpo2U9sGBhfT0paQaYaRZ18l
	qvF/md9xuKnbICVLWD3Mi4Ssaeme6xlUC9dXajju2l0bx8ZJDgcWoKgjSd8btc6c7UnYB21kuV0
	9BQYJSu0TPQA9hmeysraQbt9sF04FLLnTRPSxSx+1G/G8WHoRbrsxnolZoljiikArtbXHnLdOw6
	AwuIGOaI6NOncut+4OTlmDTjA4ub2k3Ct4kr9ofvi4Kidbc7cmqoUJXO78RwJD8znWP609Wt9Pn
	HHMkM0RMEzV2YivA==
X-Received: by 2002:a05:622a:5ce:b0:51b:eb55:2916 with SMTP id d75a77b69052e-52b384c4702mr28152751cf.34.1785418182498;
        Thu, 30 Jul 2026 06:29:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:51b:eb55:2916 with SMTP id d75a77b69052e-52b384c4702mr28152121cf.34.1785418181713;
        Thu, 30 Jul 2026 06:29:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acaa009sm2976631fa.34.2026.07.30.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:29:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:29:33 +0300
Subject: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0nxp1o2ipBKscUADiWjzkVftGYkzppsXEG9Cty/+pmo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1Z24J6b6wVbFP1Dv968/8bQ87nekTkSTCwmWXuZJ85pD
 0p7dd+ok9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATYZZg/5/7tEvjz+Qk7vJX
 k3zOtPEfveHQZOPl4cMrqnnMZovt2isnJ07bw6x5j8vBskrclyXQJOLU3mYN69k+OdufMkn28yd
 oXdC4vNBQvF0jvuL/n/j/7K8ND0z8nx1RFSH2t/XxES9nFumAE3fvXWXY3DaTe9kqjnu9bZuNdo
 dLV1y6baTwef+y11rGEiq3b7B7s71kDXk0Z+4zrVfqWba7mTbLbGKtv2mh8vb1iVWJ3zx2CRku9
 i18yJBVJC0nkiZqmZ1xIevEvNvmuSaTanI/pWr3Ou90PDhR7LSPW+8h1VfV63zFRHgmWO5Su/0z
 ZW7YKlWpl857L8hvdYlhjq6SKXyqyHe6lFEr5nTGR6P5AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfXzMbU4nDLdJQw
 grN/8M1v+JuHaPmDbDV/48BaZzRKvJK7wFYtA814oQaiy4IrVU2ZBi2F0rSBHev0YcxiZJ9sAeM
 4td8haf1UyfS/I0jQlysjVIcJb289Jg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfXz/pMuBP/xALu
 3MAh4KAgwFfs8Dwh8YDNONVRQ3Dndu10A3tvUYa8aajC62XVVyhit6bXE5L8w92tD+gLchTX/Yd
 ai0ceGi7eU+3o12TnKhf7Ib3KckJ2wJBujNpRBWdhC1zrqgtz69o+e/TP293zE2jNd3nNxco79U
 oR7lDGrYs3mKyqJEdl0SniAIQgKPe86FN2Tmp0oZevkmhYiMgY83hiylqFlbUn/NEXlDRbFBDTB
 YCrD8GDhgI5bMzAReUMTRWeomUulPsIHIbfDmMzs3dar4W2G424mBUUhBuF856vVEk/3p9DXkih
 4xipxyvjtfT/O8H0JjSubj32nEiMMocFnRBiMmZttciF0xkYxEE20FW+QFLIJat2wkj0+HPfBF1
 N6q7rb7OzQOEvfbUabsaTQffgqVdhiiayR33eP0WZoLkrnFg3g3MW2fkT3JBJm8ncf7NGBpfiL9
 ciMAPBRe6lu99P08iIA==
X-Authority-Analysis: v=2.4 cv=ToPWQjXh c=1 sm=1 tr=0 ts=6a6b51c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=epCurf6C53ZFYVxhAokA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: URB8OGJsqBjCsyzoB4b8kgIyWxM0YWaa
X-Proofpoint-ORIG-GUID: URB8OGJsqBjCsyzoB4b8kgIyWxM0YWaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300102

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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
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

