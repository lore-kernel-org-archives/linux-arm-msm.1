Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281999;
	b=DSsrhpIez/qR339q+LxHEeaCw0xNhMkptjUQKWHj98n/f89x25whi8rq5CIKt/yQixpS
	 G6yzhURKPnXWejpcDmVz84ZCOHsEoIDaV8dqmPxvbLRf+ECxPghaoxPoD3r4QSswvM13f
	 RjHBcxhCbJ/vs2q03HNtw/Q1EPthc/glgxrEWJPCFGacQv5iN8z5VJfk/+4v+KiukEIZd
	 05oKGycyHqYHnlHwcOsK+dcxPtIWpm3x98qnGq6XeheAH0g28oYs1K6n20W7289/ikaVz
	 zXezK40BLk6ju1o9uXa5LNvFcYVhVfTDfb/kyn9RNzdMC/N/Nz1ofvvIhqpI9IL/n+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
	b=FPE2OxEAo52aeyOukPvtTnk6C+SUNapLCTEnK2PwI66Gpxzr007soGchPi94NS3M64Ue
	 4I9A+rwYMxMoIFGWdW7NMrRAO3E5KHZMUzZbce3l/sNkhxnpVRs/EXwGCOXjESuwvRiEf
	 agQXwa70Yf+Y6bSoG9LppfWYPA0ibvvxdLgFHO+SvhPVaLsaK6vpf0XTZM3V9wLFltoqe
	 mb06AMZ6PHkk9ETHvUEgpOrPByHEM7Swhbp0795dfSesbVCcskn/QYLLpp6VQmToFIOiH
	 2fm/NtVdWUFtRB9XW7UrZglOqb04R8OabD+0w1vT8yq5QOeZ7gF3nlMN0fVcMNFvyhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRRfYxUF;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271560A3838
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C271560A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRRfYxUF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d1da913so523156f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281997; x=1793886797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=gRRfYxUFQqwTkUT2oyeXYOUkBjicevEGc3PmbdOaYe4q525sM4GW1KHH/GZLMjZqxe
         cfIPkORDTIG6BYAy6VV0m89jmebmE4y5YMRVP55FKwHQf4NSXd0tGra8SfLioopUOoPa
         ORfS1uUt94DVUdWZA6okIiPnR1Ud85iMh+TC8ns0LYMrPETP8MW8svSr7lO0OrylXIvQ
         0tEhcDm3kkGY3aF1ZM+v+RjbQgMKbOsl6iEuxvBgtUpITXwjGmUb7AxYhgTHKAJuWpeO
         HQu3X4rwffKavXmno+LcnmaOq0Z4ZL/UZpM8D0dPodlH/A2LFz5fH+sAoashAsLevwSS
         GPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281997; x=1793886797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=UxaqaSeRXCin85JHF9Gsrp/W+qbV94GqtBHLnRnfOsHpEOKwbrqjjC/5H1j+l+NxG4
         aSV53+J5o7Y+EXb5u8hr9GCsqx5G1rrHu7Ou0EqUUEojkV/UUBeKHoa7I/+b2qpxQRpu
         CzVPmWdNwP2xX5vILLkq9n6YypoDs1jWzWc2v8shMlGpUVUrSOGtqHhowmCpmYUmyNvd
         O7lSTpYUDhKi6xRzfSZe8JFvqdGr0Owy6YJ4EcRPsGjVJZSy/7X6MfvRbcTrvQTiiRBJ
         FZh+X9lC3nOJ+jQJOpN/eyH3LIywlyiiiReTUOnQH+Lh4WNIJLtdLmzsF8gaGS8k9Ts9
         FvUg==
X-Forwarded-Encrypted: i=1; AKwUvBxmaqp2Sfvx66hleIQEIH3sCKw06PYnSQmb7UcgrqT5I8kRcXC7x/Em4TrejvhAtSDwQrXwW/XH/t6M1gtM@vger.kernel.org
X-Gm-Message-State: AFq9FYJuun8Eo1G68GQZkA4pDJydMdrwozVWlU73JSbZ9MAX1GojrbVj
	QAlWL8VZ5hzD+J3J7m8zr3brU9QndrsU5JHxfHHGZAohBpE1AFssaQQ=
X-Gm-Gg: AYBFou0a+dCRLFGPHTvPF73ofcE+19wd3Q+l9Tb+3SHGj4yhlnjoZs1Q4HSDGS/DFNZ
	f22j3xv/zRJ8W8NN992nsRpYUN67Y0GSEsUGIEkEr26snw/sASp9yV/Gs/x4X7Ufaj/ElHt8VPa
	a92giK8x3JHAbUIUdTFpUQw2dp05pY3sHftIX3GDiAbgK7YYU4aFHUalgm/NHiEqARZ2WPx4viR
	aXIWPk7zQ5u3GC7wVgDG+xFKNRXT995hS246SMokBvaDRltStDuhONEF7lZ2d/OR6vXNT+Br79c
	Z6i872IZKF/XQGa6fn3NTRc+y1m7blqe8sjf6SNO2B0xDFLPXubweN6ETpophR7fpZmcyWpMA/6
	Pzr55EA02FLKzGvbSK7R/jwESoou+c2uTypLiWl7FKoZQeOt6MxOj0bfYnmSi3+aYya1hKnxazN
	HCCOCmzWQmWyw4Hx1XCfSjaaEUIwSvq5ygEDGfOSoxHqsG1TbaWJ9kmoA1IVpd8hdJ4+URHMfxC
	kNRGkvGSaiiMgChgkkGOyzmlNGyW0HY2FbjkFFVtIl06lj0vPtUT7O7lh7zRO0NLnVi9EZkBvDl
	7aaKPHVn6scJKer4Qh35v+XuOpnY3mXQ+zTRhC4s2yI6/w==
X-Received: by 2002:a5d:5b91:0:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-48e649933c7mr5094994f8f.17.1793281997067;
        Thu, 29 Oct 2026 06:53:17 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:44 +0100
Subject: [PATCH RFC v2 07/14] iommu: arm-smmu-qcom: Fixed mapping between
 sid and cb for gpu and lpac
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-7-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2537;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ddmhwqAVzi4UvZ7es6VT6qKlZqL0nH2dFG7G9BUrboU=;
 b=bSLxcYA1Hg7TlJKZ47oBfv1YRksocS8fOUT+GDiqsMJuS2PEP6fGuu8UQ7sr0kvqrRp2ErWZv
 hi5jOvHNIWgDaeJxu8pdrMCwt9FmVwlER2SJfgdk1R9+hQIkj2UjR5Z
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 ++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..9413b748e79d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,24 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * LPAC will always use SID 1
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
@@ -237,8 +255,7 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
-		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
 			return true;
 	}
 
@@ -313,12 +330,14 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 2;
+		count = start + 1;
+	} else if (qcom_adreno_smmu_is_lpac_device(dev)) {
+		start = 1;
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 
@@ -363,8 +382,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	if (client_match)
 		qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
 
-	/* Only enable split pagetables for the GPU device (SID 0) */
-	if (!qcom_adreno_smmu_is_gpu_device(dev))
+	/* Only enable split pagetables for the GPU and LPAC devices (SID 0 and 1) */
+	if (!qcom_adreno_smmu_is_gpu_device(dev) && !qcom_adreno_smmu_is_lpac_device(dev))
 		return 0;
 
 	/*

-- 
2.56.0

