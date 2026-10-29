Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281983;
	b=fnQcCYzVLsRHtZw+QACEGi0VRGdd2bC6Mbv65erChvju1/65vXGPoiCtQ/SZ/Ba1xF+b
	 LW9ixUn/pdeq/Q39jbaoVk3H1gX/0KTsR3oIbyFy/5gfaohNt17dXLHtg9BXxrG88mAAn
	 vDqquHZ5f5GybutDv8huAFTkFR0yv3XKwmC+8xBq9O5B3yyBugLJT2TOYpgcwFHuVr+Dz
	 FkFIYNJs2P1YLa87MfhTkmk+q+Im3RSSqvPe5AaR3tg1mB9Z7bo2AnKhgzThIoxNR5c3M
	 I6JYfUHmkx5pltIWnFScXX4V6tamEdJOXeN7VGuB9virSIUtBUc8vKb7/hD8V+L7COA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
	b=cotSi2k3bQpzcL8nO1ByiLlkbV1CCM3oa+gt6wYzXycl7vKygiE7c5t2zw/3uWjHQuV6
	 9KbMzQYKP4xHPL8BmbMuozBn2HuCn6kH+O9A5XE0RAJCzJzbNLJugmwOBeXL6ox/Zjrx0
	 3560ziPmAnAHHAJqVEvmbGAZFmbZ1iEnbkxrSUewlh8EUsE99biArgal6rqWNyD/NNUid
	 la+REp8MDgWXQT+FLY94s2rMcEONpYJcfZIIX33A5MUiYXg790RK1jwYIRQSrDwpATlk1
	 A+kevOKqQeADyUvteChWRM99kdNv3qZeyBBpFJKulmUDxTBO53aUvzyIGWhmYNWGrOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHBOXQLA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC9606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDC9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHBOXQLA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so14251965e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281982; x=1793886782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=CHBOXQLArqfC/kYwkg2z5vBijPZxsFSY/d7UHnyTZhCtyMpUYiXHDpdVgyIT/vkK0Q
         XajjYDO6pv5Q6dlNIzEuWeqnqkLtUNAr6dqiUgfyOZar6xRzhb3eW7hsw3PiYc/VD+5Q
         GV6YtxzpW2SNF9YRpZJbDdyo/hkR5nap0QL1/AeUzMZS80iltJpcNrMw8rt0Cze5QZ27
         K0xglNQu6uylBYa2ZblI8TGrJ+owFcp9Ze9yixdX+fyupq5zhylvAYWM62RKpocav+eO
         5lnDojSz2zcvVIa0carfvx136wUStQntxTF0jRiwa9Syhx9wYuPwLMzXoncAaFonEJdC
         yf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281982; x=1793886782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=uPs1kThMVn6lQk5wUJw2yV0NMIrok0wTT2SLtIQdEMdXH46Sn3rkPYQz5kTxPR0iB9
         RtRMXfBWklWxAWcIZd2PufsIAUWJN0P765fTVQ8pp6J4t95auw6RK6dWjd2+5h+LYXXn
         oRrgXWrVQk2XyP4X6G2r7EYUHCWayLt+bWFW1wQnuNRW6o0w2/+GjypD1MV6QsThPIFJ
         7HX/W6jrotCXjnlGf5Ly5LU5Vsb7BF44IWvIfTdWLZIKOVW3YZSJST4ltAK8z9nxMksK
         ebWYbW46WnN07BGo1YDIh7fXwtEossSXGDBwFLGXhj3hF2OnPivK5nw+PA23l2m+7xyT
         8IwQ==
X-Forwarded-Encrypted: i=1; AKwUvByR1i1Ricfym38pAZ68u7lyU0tD8b5+ked3iOV8Xe/QIrBmDgONicYGjQFQ3KqS6mIOjRwPk767E/RFHdOX@vger.kernel.org
X-Gm-Message-State: AFq9FYL3lkcq+gOqLy/54dUuKnHCv5PZdUckxY/+tybtpyF5K40wR3yr
	2vMJzr6y8LwAAPXGZFgQDuSYlCubukVLZlTag8cgoBQ+2Eai9CcZoYA=
X-Gm-Gg: AYBFou34LM5bTrnYrI3dzfQKlqKHo5NhfRine3O+8JPrAtSSrZ790qXvbWJsAta8Mkj
	iC2OeF7dLcashe2YSt5BKJIZB4968v9ISwll8cjZN/flJFaNhpxyjQgNsLE4FEELWWZYTrutqJA
	GuMounIP+FbzANTT/pN7qzQ83irSIwMN12bGswZVB/UY/Cc2JKdvjiFwjrvP9pyH8HgbSPs8Egi
	sgECMXCoW1rL1Q3WO5KUE/kIwJnlqBsEUO+X1ko++UjGd9MbNZCQsz85x5SvkjWBH/T1gPrKZhZ
	eDwQWNHtil3ttA9GNIKxImljmzIjn2Yu7LKXLcCWraV3ZNK2kw5B4apCPCOn9fFM26bTCBHIDsC
	TuBKxavnrcoQGObsTj7Y1q6VwSy9ldIILWtroViPNddZmv8+gtyaCF/1p+3HrP02E0tDho8R10O
	zIfZJkZaLD7TOraBSAzaIQ0STyogrn30sEmXur5MmjdFqAEcWSx+bXqUSHWA9rsPEYjPUFc1RbF
	TritEaGOcoTQDpSvLPSNm+o//BzCngW9T4h+teBsI4YsNLqoV8vDgn0cp1GAQc7C01+OeYFNkd5
	yyJliHw3Mhuv4ens2h6S41nNRyd5rPaZ96lxZI0oYNTQyQ==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr86595655e9.16.1793281981611;
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:38 +0100
Subject: [PATCH RFC v2 01/14] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-1-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2309;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=NJ73RVOWEiPlPH9Z7PnLGwHMRejJoPZBM69o25lxk5E=;
 b=gj8sBR9N8QG04JyrcmUt5R2oXuziVAr6kQLdSMm6i0TlFKl87Gop8V8EHKny6NTxmbotiGmJc
 fs65LYDtGd6Dd5piBIpN6ZzqbLECs9zGbUWlcBT96BceUkWcOkEDLhv
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want the context bank used by LPAC (Low Priority Async Compute) to
use split address space just like GFX in order to be able to handle
userspace submissions with per context page tables.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..48a590aaeb5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -35,6 +35,8 @@
 static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 	{ .compatible = "qcom,adreno",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,lpac",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-gmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
@@ -217,6 +219,7 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
+#define QCOM_ADRENO_SMMU_LPAC_SID 1
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
@@ -230,7 +233,8 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
+		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
 			return true;
 	}
 
@@ -305,9 +309,9 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 1;
+		count = 2;
 	} else {
-		start = 1;
+		start = 2;
 		count = smmu->num_context_banks;
 	}
 
@@ -394,6 +398,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,lpac" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },

-- 
2.56.0

