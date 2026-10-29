Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281987;
	b=NETgLbgvtLZ4jwXaG2lvhcwmwjhbSScN1ataj39DZBNwRyhIGo1BjibNg4AJNICHjIZS
	 47RvIJFzjq60NRJGz5yawE57mKqtOIGYMWiBiir24e4atGgdnFB8OBdvbTvWfwTMxB/lH
	 BKAJKLJ5u19BMzEKQ0ZlmcuBJWAbh+n16k4QbLC5zfSVAv1dc/YJ4WDvAB1QjNSO4y8fn
	 mvw9HacGA0Y2jsrHoLOJnIfPIMz/6ponMjrqaOHv9IBHbJJZj3x0GGSSTUCeRkHcXm+xM
	 l1+zHg56ghQU6bcYdav681dav9RIU3aGWQFeKxmY39rByrOwyfiLJnK+C69RhtkXe7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gaJ4+9mmPD4lBBlHsni916fB1brqPSLNtulQU+Q8NCs=;
	b=jLdMGxd5j2kwbfxqDT/HwNtKZ/X3EAprkxaiSyUuroAD90FBl3zb/wq79pGVzFWCAj1N
	 gIQH4ncs+A48f0cMPjjr3hixgNxaAp77Vu4MkSf/Pw5lFy+1G8wIk6JhwUZ8hPAacP5fa
	 wI7B5A7WtgAQwPiGwNcjbODsJWcUpl0ecUEw5Dfz0clF5MDOAUMAYmEI27Lwz0jhQJQgF
	 IJjPxMXNDaG5364rkGsqdXxH4ViBXKc9k1JB6US2FhIDCvW8gyeYuvCeqO5bF52RmJ18t
	 5RnPplfW9HEHAqdR6yhA06zBaOSkS+dx7F8E1Y9FfMYoefyZRuIopbmuLJbdnPO/CrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ndce/g9J";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2860A2618
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F2860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ndce/g9J
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1000697f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281986; x=1793886786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaJ4+9mmPD4lBBlHsni916fB1brqPSLNtulQU+Q8NCs=;
        b=Ndce/g9J4Oe2VVJFSgQ2IQsZWr3ydkH04o77/QHfkZoQHeD8Yu2I6SQQt7hXKrPj40
         eXrGq6RIpaw9ZmyJtLBIuGYEcHhyN1DdClqcHEZ+5qg51++Jag+ep+NjD9HJ8qLSWLy9
         NWVL+gpV4Quh96YINe+ezGZaaJ9oE4nm5UgH7zH9ZdkqMVpenHGaaa6tVgsh23lT4402
         /TSOSfmn+WYKGBhBxUg7TjJ39M5NfBwRU0lf+zC9fuvAO+Xke1PiiLWcrCnPU1jqC6QI
         Mn7B3jDP1MTpNZcqf4ntVSJ5gCHPV2529wER5Q8O3MVqQ36LeZN2VbRDxiD+tLbvfhYF
         DJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281986; x=1793886786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaJ4+9mmPD4lBBlHsni916fB1brqPSLNtulQU+Q8NCs=;
        b=2c+ipGQaiy3wYqc4LujgpCwFCtEWnjWzJbu9Htrzuw2EZR2xh1fak17vVuHaniHqz7
         OohwF3+1Zi+VhxImQ7i4w6DlnXHGaiY0VxNrRYK2sCV189f2A5BHTVjkbS2+f9fhWZrj
         9t8sR9j09ZmGuWwBy3CrGgHawaZYYRfofbugWQZRnvRdPydTSrwA8ZWNvtBbHwx9pUHe
         6NDXwCtJ04RMG3BbRiYPmKjz2hUkMT/u3gBfD4M3TBKuDY9sY5y8OE7GBfqWEDL1kcPy
         rO5j5Gr5PgGAeVWlFe8kKeNSgNSfr3lkoHZVL7k74dSd91UZnM/BQBvmLlmGWxs9gVIy
         uO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIReuIbSqi3LeiDjrF8hUPBGslT6u2sIvkPdy4sDyQ9pCqqB14K9JU4/gRroZpffEQ3Vh0gpoVkRULcCOY@vger.kernel.org
X-Gm-Message-State: AFq9FYJL8RzFfpjJ1XP0ZgIBgSFpyt1wHkT1YO2eTeAIjnGByBZsjeK/
	9viIwVo7Q6XUHsndgTE/pVyglY1nY+y0jami39PvJj1lkBVicxrbgnI=
X-Gm-Gg: AYBFou3xhOAR/Wa8+LPBXbq7kP9vLbtynSJKEzhGFf/JpmMfGT4ji8fNdxSS2cC6NkJ
	IW/kmYoYXapzB2SP9oLErzkgPvJuP85tFZtiwlIcnpPNvb+zFNygGxn5IP++4GW7dz6JZG/IXjL
	6hn+NEDVu3M8gFgqO/F3VvlOfs2azJLKrbo/g0ABdmVZu2r97fSdVHGLYjKJnHBIlblS3Jthr5a
	PbNTq1itqulQrsorxX0SM93DC3oDLzf2QhaQTvyl+5xiJOs6Jc3/IL6iIXYpwIQpOvU81ofEc/y
	Don8FQsieJHvfIpg+tCsISS+bPoN3IFEJtW6HsBetS0KseNC0k1odSNvd460crHxujazvBBWgCA
	eiko1XaCw3SZAwSqTSIH1o3GgwuMTf+dnSrfNJ44m5cgi3dFqWuy1S2fzfY7PbgyxE9/EWBTppa
	zWYFqhRvWxP+IAHK5/DMtu97hbyj0waTJ5lGQKR6sOmh2kMcggaxMqWHm9KAS0QKYwag7+xwc6g
	XAcPP81XJNA2k5TI4RbItt/BfBaKNE0ymyLykLBlEIVAzAed7UfwieAj6Q8wVbbkAVvhTsCg5WY
	+k3FQHO71JqlblBU5zrkJjIomBwBKMzWeM2ks1NOhSD31w==
X-Received: by 2002:a05:6000:200c:b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48e5d567e85mr13366844f8f.1.1793281985638;
        Thu, 29 Oct 2026 06:53:05 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:05 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:40 +0100
Subject: [PATCH RFC v2 03/14] drm/msm: look for lpac from dts
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-3-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=6436;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=XpQ9AteTwMtLcsxYohB2gJNeRwk7JfV+tvwdBjYtlVM=;
 b=qJvSiqvDD9GrBlIaJ1RKA9o8A4IaM3JohySZtd/JVEOLdgV49X0tKEgfd5R3pjwNDTF4Zh1r/
 nkMzJe2orBYCYxYltUajmFOI3R3Mior3UrbO69vtb5EGuRS9UYNb5Ry
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

In order to associate the SID used by LPAC to it's own domain and
context bank we need a separate node on the DTS.

Add the code to look up that node on initialization.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 36 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.c              |  6 +++++
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7f20320ef66a..4d22223c3323 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/of_platform.h>
+
 #include "adreno_gpu.h"
 
 bool hang_debug = false;
@@ -271,6 +273,12 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
+	int ret = 0;
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret)
+		return ret;
+
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
 	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
@@ -282,6 +290,8 @@ static void adreno_remove(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 
+	of_platform_depopulate(&pdev->dev);
+
 	if (priv->kms_init)
 		component_del(&pdev->dev, &a3xx_ops);
 	else
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f3fc7032fadc..1dedeb19946e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -11,6 +11,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -201,7 +203,9 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev,
+				gpu->lpac_pdev ? &gpu->lpac_pdev->dev : NULL,
+				gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
@@ -1187,6 +1191,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *lpac_node;
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -1200,6 +1205,18 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
 
+	lpac_node = of_get_compatible_child(pdev->dev.of_node, "qcom,lpac");
+	if (lpac_node)
+		gpu->lpac_pdev = of_find_device_by_node(lpac_node);
+	if (gpu->lpac_pdev) {
+		pm_runtime_enable(&gpu->lpac_pdev->dev);
+		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
+			dev_err(&gpu->lpac_pdev->dev, "failed to link to lpac device\n");
+	}
+	if (lpac_node)
+		of_node_put(lpac_node);
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_has_rgmu(adreno_gpu) ||
@@ -1221,8 +1238,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
-	if (!gpu_name)
-		return -ENOMEM;
+	if (!gpu_name) {
+		ret = -ENOMEM;
+		goto err_put_lpac_pdev;
+	}
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
 
@@ -1230,7 +1249,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	ret = adreno_get_pwrlevels(dev, gpu);
 	if (ret)
-		return ret;
+		goto err_put_lpac_pdev;
 
 	init_completion(&adreno_gpu->fault_coredump_done);
 	complete_all(&adreno_gpu->fault_coredump_done);
@@ -1241,6 +1260,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
+err_put_lpac_pdev:
+	if (gpu->lpac_pdev)
+		put_device(&gpu->lpac_pdev->dev);
+	return ret;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
@@ -1256,4 +1279,9 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 		pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
+
+	if (gpu->lpac_pdev) {
+		pm_runtime_disable(&gpu->lpac_pdev->dev);
+		put_device(&gpu->lpac_pdev->dev);
+	}
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..20581be10ca7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -963,6 +963,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->gpu_cx = NULL;
 
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
+	if (gpu->lpac_pdev)
+		platform_set_drvdata(gpu->lpac_pdev, &gpu->lpac_adreno_smmu);
 
 	msm_devfreq_init(gpu);
 
@@ -1032,6 +1034,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
+	if (gpu->lpac_pdev)
+		platform_set_drvdata(gpu->lpac_pdev, NULL);
 	return ret;
 }
 
@@ -1062,4 +1066,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	msm_perfcntr_cleanup(gpu);
 
 	platform_set_drvdata(gpu->pdev, NULL);
+	if (gpu->lpac_pdev)
+		platform_set_drvdata(gpu->lpac_pdev, NULL);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e2291dfe3ca8..271956e7f870 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -172,6 +172,7 @@ struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
 	struct platform_device *pdev;
+	struct platform_device *lpac_pdev;
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;

-- 
2.56.0

