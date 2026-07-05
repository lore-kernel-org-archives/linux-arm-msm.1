Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3839EF0C
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278872; cv=none; b=kxx96YAU2CciNqPg23rFTXJ6qMCvo0UGOlN8NR26mw7LhdGgh1v6QBkjvBXkXzBuenA5GLoszhNftMPWKMlbQCvLcL7pzSqPEJLVJT/ESnW6AyB7z1K8ry63RpUUnH4G0pNSqn+4K944So0ONEDEJNMY7Nzhb+YhjsTCjMqDPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278872; c=relaxed/simple;
	bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTCCUFZmYUeoNueONAzVEv2j2GDOh1Deo82vcWq6xuNg26UERbFwgkAJBnqm9lDkPZtcEhO2ukaPLMV5VLjDhZwKvBdSWwLkIaedWIYITD7EPF4M92WpExgV7rjGq8A+2BV8ytVHjHr9Q/E5rMo6r+fnETrgUYq52I6rOQr6uSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agg2jxB5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agg2jxB5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso381567f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278866; x=1783883666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=Agg2jxB5IlhXlRYo3Gh1DvIdJCTUI1429cPyMjdFgNzObJb7oQPQuZHJWXZVzYQ1pd
         E4mO+4QGppNKgAZzpDb/+vuZaijpR6W252WOd1LNB9RQbu9GhBksSLgDS/fw4Htrwtyf
         eNME0AnRTKTK2iMty/sPvcmAMcmJbgzEq9QpU4SpBOhbE66FLLXHYorcGKF4k1HvAs81
         8+0uBfSOyZMBXz2TYhcwDx3/DLSvY1qKNCNY+zbDY4OEF6iKjfZuIuytVvReFuxSkkU8
         xoAT74ey/kcmOd/01Tt4A7L6A9GoFr/GwrONUHtqxysp6f9HyekmH5Whr+IhSQ1GbT2X
         jKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278866; x=1783883666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=tETtoeO3kVH9lmQVc4+y48tbf8d/KCIPGpst2CDzby0gZFykcaLbgEGYyuR8bpbmJB
         CGu6IzS5+qnzUn9V5/lR2Kbyqm/+z11FLT5pGOQ7bX3b2zvYokU/iij/SrkDnUZb0FyI
         0e2fBJZbkqdXmRVKnD9qSRdHctBaZgZtO2+AfXa1YHjkxW5SZ121PlJS5E3iXCPu7Fxr
         IBcsu3OT4+2fBlGQV96O4VMlPxLu457uhPSpTg/2w2sde/vfXDERIQS2GdP7TUBEH8ef
         a/200/MHe1PpA1JzSrF4jIGtWZntNkE4Qjt/sLqtLIilm/SEe+uILC42PQzSMywGMVHy
         CzWw==
X-Forwarded-Encrypted: i=1; AHgh+RrN9YlpdG12G6kaU7u18VLqDC27E1qz/GX9mBADKQkW8qd6Xu6CcTHzdoRdxQk9EdcIXwzc2SYb4FbAY+L2@vger.kernel.org
X-Gm-Message-State: AOJu0YwtovtyhxYMo28v/rCnajcIPUR8Lrbny1u2qEQI9NTka/rlqsLe
	Ux1aprb0zopbTdl2RCj9FEni3ORhuftPRZskpH4y81h7eO+M+Hq+5l0=
X-Gm-Gg: AfdE7cmdbJ2Fo4yhekTmmlLCjpFLcZeO8Xqfxmyf/jwTSp1XLyIK/pjWESeKOEC4kO4
	MOnzGErlZUWkEh/lRhUJl7xveW+v7pQI7NkX6QhA6N9OSNZ+a1++JpwiLOIdKUa7YoTE9/WvkHt
	HXIDPPhXeWto+W0gD8BscWs8gaiYIO32kZZXkxklFRiao/ktMMjayWewN2GttuXLIB3oR98Bjzv
	K+PGWV+OXK82fkP5HpqnhPXVZ2t5V/k9LmbmxK7VZe3FRGdsaJSEV/OwdkxRCT47rP96r35SuhB
	AESoJ0rgLOETG2J4Te98yC4F+8T7+R6FTsx+MoV31BEbtDZ56eAaydAVB/xrYOIovgByn2Iy+Oz
	y00xYURoLQ/D1oVoWRsJQSO0E3HAoLPkQJFhvLrtj0vMI9xpP+YVQuekwjtjkgXZmyiTeze6JcY
	7sJ0qx7uCkfmYNEx2jsxgy8nXSy8lrSg==
X-Received: by 2002:a05:6000:46c4:b0:470:3edf:e2a7 with SMTP id ffacd0b85a97d-47aaaec02c4mr5836740f8f.37.1783278865571;
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:40 +0200
Subject: [PATCH RFC 06/13] DEBUGGING: print contextbank and other ttbrs on
 fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-6-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
 b=M+uiiUBR/lmMuad/SAHrKO891VirOTvBs28b6xreWN52s/uXJnTXUgzkAI4/P/yddSN2TXP4j
 AH+AF+T02UICCWBKtKMyVk6fvecJCMlYT6OCGtiT5he3yQ4MXqiVKBI
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Faults can now come from different context banks so print that
information as well.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 include/linux/adreno-smmu-priv.h           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index be374cf209f4..6a48e211fa3c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -329,8 +329,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
+	pr_warn_ratelimited("*** gpu fault: cb=%d ttbr0=%.16llx cb0_ttbr0=%.16llx cb1_ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->contextbank, info->ttbr0, info->cb0_ttbr0, info->cb1_ttbr0, iova,
 			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
 			type, block,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48a590aaeb5e..ae6152bddf8f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -136,6 +136,10 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	info->contextbank = cfg->cbndx;
+
+	info->cb0_ttbr0 = arm_smmu_cb_readq(smmu, 0, ARM_SMMU_CB_TTBR0);
+	info->cb1_ttbr0 = arm_smmu_cb_readq(smmu, 1, ARM_SMMU_CB_TTBR0);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f..5d6de4b4de06 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -32,6 +32,8 @@ struct adreno_smmu_fault_info {
 	u32 fsynr0;
 	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextbank;
+	u64 cb0_ttbr0, cb1_ttbr0;
 };
 
 /**

-- 
2.54.0

