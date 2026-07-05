Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92F258EE9
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278872; cv=none; b=klSQfpap/yv5dqzZVUGoeT3kYsmWSfsOucfIzq/HOBjGfQuZMPIDgQObsW+g/zUM5QQQ64BJrU8F9Qy32VllBa46770rKOs1KbQKzTd1yJoIYaDXMLZbHYL1W5wP5WoDHSeln1psc592vtaQ+B9QjmTufhIcP+ZN3h3LP8K5HL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278872; c=relaxed/simple;
	bh=CTSVd/0edKxTFOAN7N2IneJxadcZY86l85ROlQLsf6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1QWzxCp5NLfpcwvMJCwrjFrQOsxmjnBKry4M7Mp3CPVTBvu97sv7vkECn8F+cQMZnMGgvIsO9LXY5A1fW+IAT4fSNYPuvRd6mVJ9pXAi42TplzEqjwfUwD6O6NThdrysBMRclFZAfq8ehYkrjjqtVRgvHwpnadkuz6gxASV4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDgFlUYu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDgFlUYu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-471eee9b7d5so380255f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278867; x=1783883667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=;
        b=cDgFlUYuB4w9Jlitem81bhYbN7rFzvcwnHGU6i0V6jW2DkDs8ix8BQUeraRduPWs+m
         LQzlifTrGyibOyLDUnQOrD2bxJa7kgQSx7TQAlcGp8D/vT9P3s2igx8H++ljt0g2ukHn
         wHgirOSiUq5AaFJ08tVUy7c6GkLLZ7HjWsOghXMGvgxMlJOxUQqysO42lyje4WgMGlMJ
         SlOhr9DD6u43tyX1nMi6WsyRUqT4K0fnfb9NhUvnN0ukAHGXuOhLBW+9Wh65ByIlKcx1
         n6GHufSoZo7E0aQQzUUipw2vWctQdtf6VgOhEGzh8xdyINJbci2UvjxCiM5DlUgsNH3c
         ARTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278867; x=1783883667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=;
        b=hw+w1uWaCz/L79Hag7ikSgOuKckib/mBDKZ3afLJfuj+TT1VUWVdOFTfhlYQJP2zj1
         yPz1368lnK3ODY7ZBoAF8DWwEBkWPuJ9AayyXN5BSO8u0i3PXJy0H54VEHtWnLRhLAM0
         KzGWurXKVqMik2BqElkHfUK0CNvYY/flcEs/o4kjDc3MJ+3E/P0gasVw724ok06YBvS2
         0D83JkkZzaeG0XyPFo8s6UP9FEaklTw0r/FOWf0qW6nR870BbGn1loG33y0Ed0iJWvjq
         EX4pawoa4iyFEvsTMc0sxZr2YxQGuVRv4t7QblU+TG2HirLE0lO7R9iSpTnkV9J+jsXH
         XpQA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1bt0nyTjYuCOFSXi0Ee6AMszm98bzKmnOBXqGf6fG6lqUnR22GDo9qkswlsA+WhwX6wZPG+PgVXGF/iTF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84ZsE9Uv455S3I4Md0PwRbLU9egSvWm+sjZLtGjzYtAKjOf55
	T4GxLr7zHjnn4IyPVQQWfhVRBq38+Vs+kvO4sl+e/ChSvT43jF3YpR8=
X-Gm-Gg: AfdE7ckuHzhXp1hcH/D3ORYQcIEUdlkwJn69BebPqjz55jiAiKPgnDLof/Dz+AiqHFd
	fk4qvHwT04jdvNPk7q+mbGDEk+ToBZLQ8CJfWdLz0J8sKRgCS7f/c8oLTWDDA0ubwOvRPtEmYW9
	Ns7HFUDfZPGXH5mohRA//dN9tLxzcsITdlYDnYYTBEIK7QeWctIEz8gubqq/GWVjpmpAlubNpGm
	CRD4pjNoZ4cpWEsEKA0Ap5dlQKl+prxDC9UYSOUzqjlkN8hXhqW4G51R5h9AQ/DCaXYOpuLDLwV
	WNET3XX+QCYYDWEoPOxr8U+MLL9rjxvMAVMuZXxjVkNpJwmlswj1vsjyry5Vz4jE54333/cAO8r
	E6h2auxieknxCKDZJfJvp0+tjCzd0luDaQTXIRsFa7LP7zGy5oFV1ELPAqgLwUCCleTGIIBUQ3A
	RVx1rvg4UGJCQhzp4cwduu2r+SLspXGQ==
X-Received: by 2002:a05:6000:2689:b0:477:6874:542c with SMTP id ffacd0b85a97d-47aab487abdmr8336510f8f.22.1783278867370;
        Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:41 +0200
Subject: [PATCH RFC 07/13] iommu: arm-smmu-qcom: Fixed mapping between sid
 and cb for gpu and lpac
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-7-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1792;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=CTSVd/0edKxTFOAN7N2IneJxadcZY86l85ROlQLsf6k=;
 b=N1CzOkGooWs0D7hEFfO64qs+XczQExJuyhhzPJnlf0WwJlRgmpU6QS/Q3PibSJHKmN1K6WJPv
 WALfNWTwDnSBfYHo0sDNPhrc2jlfRyjKisM+ctCA7C/dwWocYLjvP6b
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..e605a535f328 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,25 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * The GPU will always use SID 0 so that is a handy way to uniquely
+	 * identify it and configure it for per-instance pagetables
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_LPAC_SID)
+			return true;
+	}
+
+	return false;
+}
+
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -312,13 +331,12 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 * switch pagetables
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
-		start = 0;
-		count = 2;
+		start = !!qcom_adreno_smmu_is_lpac_device(dev);
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 

-- 
2.54.0

