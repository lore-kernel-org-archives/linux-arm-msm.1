Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281997;
	b=zARbueKdrBLBV2ZKSaDdw4agO2y8FyFCGxlC09Jb1ALIAfr7kkD9Ldv1/Aeit+QhQlsE
	 l+/LLw4BAcLd9TomE5PZefmhq2GrEF3XXpNudR4DIH2+IlP2oe4310/hRcnXwPPBKWgaG
	 Dv8IamJEb3flWiJ7oZUlOQCc6SyphnZ+utupTAcW0ub0ch+Ntz67Rc/u7GnGoHnZoNs8s
	 930fGTfscxbHdNPsGXYJNH5muzqc+qOpyt+KHb9BkILOi88vPVo//iKU/zIqPsiVW1KoG
	 Teh2CKUP1/aB6SiflVORktw/bLA7pKw3DvgsUeQ7w2ai/+E32juQyiLxLVg1tM6ah6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
	b=RKiYRFseSvvcI+x+KQxhUW1yuOljs8d4v/Pbkqy5YKlUmE7tpxa7VVwUpvZCEzbdB8Rx
	 dRShZ2yGBRTGD3PKU7In/1HM/UwinqUZYmCyyDtIWVzSxG9GcVMdbYBrPRWUaYQgAnFC+
	 rYoLxK3OybW/obrKZg9FRKMJfF9LOuI91mbm3LVuv34RVFoVNF68/8vnW7btRNREL2oKc
	 dYsC7bP3nKmqLQwYZnXggmk3Go/0KoScP78jVhC+P08UJA7Nj3Gf1Px/Fb1d5o7qZv6xs
	 KhjuSNOrDrzMzMH7fvlxJapkd2FUjsEZiV38uyI2BhXp6zqEJgXNzHGr6LkBe8w60Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXI0uiV;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24692606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24692606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXI0uiV
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1000797f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281994; x=1793886794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=XdXI0uiV0ZwTd9Wa3AVe8BbXXAxv1zWCaXkMKoaY80znZIIZrzYEfmcCzvWj+5Zm4k
         ztmZhqI0ftUqS7EyiHCrspnfFV+wJCT3zsHo7Tv0T906QAxsHJlB6tcXUHyNQUadTmYV
         hnGXrOz+RzyfYvTy/TY+KHu6Iku22IehZklIyuUnj2W0Padnj7srM56WWTX28iDGeIGz
         gv45OgI4AkKWESn3MJqXmLxza+b4ml15fCMz2nhGO5Dg+1yAYxufF3hJD8NbEPppOYKJ
         HEFt8+buX3/ImND6YerrHO0wJH88YB1TmFlrNzB9H5pc1yVfF4v89tFBSrZ9Zw2NGOf/
         BZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281994; x=1793886794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=VhyMJSadt3/jh4GaDiMB6ZipxWTwOx6PpY85hR8Rxir41KAn+kLZUMK0IDqavn7ORQ
         icRzz9JYx/DuNSyTB5Nfj1kR8HdIUoytLkJNNdWEPFkZIS+Q7f0ap4gc3HoHcy5vbw9X
         ULcHeGwPsCNDRhSajszAsk1NrZRqIccui4TQs1i0kUGk1pIw4LvZbpHlA4TT4JkYJd/p
         KibuF6B70CizKSSbxYreuMfTQJyKsJ1cH2BlQJUTXCmaetGrCZAcaQvK8T48qn0XMOnd
         JrbxZNtLtTndAjKVH9EdalrIbcZmJktp+gaNMzw4G8nTT+jY7gkrYgAqflvkXIrWAS7o
         m23Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmFLbbRyPYEJ0dXuliweKK/QcZ8AG3GAi4v9MMoSdaulXdlB/YZmvO9HUUoK/QxhK9Ky2Ne8u/rkSCkk5t@vger.kernel.org
X-Gm-Message-State: AFq9FYL49tDFYep0V4XiuSxGN08IuNRNsEepj1ubnFKUuNq6FErbTk3h
	WUs125l6cmyb+wuYcjp3sFsPZv7nLXx65oSBcHsxhqd3WuTqQUS//RA=
X-Gm-Gg: AYBFou0LWfSos3Q3/kmmayj4TpVgfpW4xQaOLOfzb420RIyjoqZ2ULnZ9IOkyxs16lv
	AVhR3kBlyP9MXnZWAF3qy5a+8px2syhxcMXiu8NV7c74q0RfZ8ZqGTH1BsPKuT0fkQXeOCd141C
	Rjl5Mk+lygZ9sgpnGFIYL9wJvA95IngQL4ylF2fm4nkvpN3SLECIp3Kax9Wj+S+54MyMMLHQVws
	1IVXQQn975GPv2l/dCel3KhNzFzQat7/9y/F9WRw5DtoZJsacchy++T6MdNHOst32I4+fUXJvgt
	1ruesdYAAwfF+3pBAGXY8l5sZ0atExVYgC4FpZiXbPwbsCajkIcDG9B6Hy8gWQWUzy5GP47Otms
	PDFJ+4XoQ7/+mUsEjC6OONvF/gv1XPcbCu6ioTpgcaYPjFUIc+XJrHW4DqWaCcbUAFXtnu/1ABG
	vBRsd/Ru7vcTW5JbG1R8zS32jdauGL3ytukAYtx7Mxo4kjtpnUiYEFzrlO3JSuHtt1UW8uqKX/X
	UtG1CjD9EgG3If3Wfct7EF0jEv8yH73sPzeji9ZKSlXOKO6e7/NPC3z/+eoq5axxX2/x8pMTOSh
	Av1AHbsC8DMzEEHoNT8zpJRZbtV31ROXTAWHkMRoxRWH+w==
X-Received: by 2002:a05:6000:4715:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-48e5d5d16afmr13493554f8f.53.1793281994421;
        Thu, 29 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:13 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:43 +0100
Subject: [PATCH RFC v2 06/14] DEBUGGING: print contextbank and other ttbrs
 on fault
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-6-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=dH+it9hPPDLJzOx0q/+eo2IfgBzUDyQPf1+n9ilF6yo=;
 b=rSQ/TIKRIiV2aSX7/+jAtk7J1jcL0JxB8zRWLfn1sl11ELATT02XD6e/9sRnBZS+9corw6Stl
 Oo1uS/fWy8LCZ5C5THVWfEq4MkKG8/9Q7VkA0Io7j8QvOp628/2VM06
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
index 65d34d0cfc38..4389559e1d17 100644
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
2.56.0

