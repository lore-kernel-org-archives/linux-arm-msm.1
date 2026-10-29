Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282012;
	b=UeCuogyDAVpVt+Q+pd/87s0O/Qm+7/LCDCDA3clxn+tP68fmmuD5j5fH1BvsRJQOqdDI
	 tkYElY6Ui5Gs/3dRmlIJBoUunm33oidv940M75yOJL20MumNk4e6QKBJVeDMEJg6cdOhX
	 0x5AT4lvJ7EEpuiCAwIznxlP+2KuzQwq/55bN21+ddDed9fcnA0EfBa8vJ1hwDy8JMUWC
	 lu1M+TMkKHAMuf5G5gwWUIrgbNl5/eklJ2SQD8tl9euSie0MQj4RVULQ1S2CN9vtryUl9
	 Ps2VkpsVl7Utv1e7CS9hWH/yZCIcFCtN4/UxJmOHqbXR6+ZB8coMkpyQ2XNh4hYppAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
	b=CveigTbOqEF7jkkyEgAu/0fG/oK0HfJMdif9Bwu6EyXy+XMaN9xT5wm8aPphrfePidO7
	 02P6+Wt0GqkSvMGUwyamJIyJftHInuYtlnywJ8HIJlXTFc+/CZqccMCt/CZVXCBfT+t3M
	 CtIX22IkEY3Ix90cZONsczRc/IINeoN67KFBL+vUBmLl25P2hOPbHjQOvu2iONvhe+AHK
	 ZhCrfaazvrqOIh6OijFWOJNchhbm5+2QGnfH8HKZjsjjI/Ds5rGgSmI7MzyFOJQWFq9HC
	 CtxcU78RIVGgHrYRtxvC8r5tgHwmXu6JMRoKW6kdDRPk30aaV15QBFuTtpz2dsH3dNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR4Hd7na;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519D60A6F5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1519D60A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR4Hd7na
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1785401f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282010; x=1793886810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=nR4Hd7naazS+EkK9BRvkvpfhgyw1W3iQO0GoGhlyzRDAhkR91gO70ou7fj8Zwvlvi2
         X36owXIE1LnEiBPs9k//KLqCGNtFf/ulBJUskzvUAlt3dPtpnZXVSbApF7mcgLlJ63ir
         sNupJ/IIOFs0TwPlSaTn1rVLw4TzwJIFg955pGYb+u1+6QDa013aeXu2tkdGfkSd/pXZ
         DRoUGXd9mJOREyXl34hED5FWrL8m3MJ6B9ERpKLixvj9yZHV/vYad3A4X9Zdnk2C2jfy
         defHRAvr3An2qcAxtjS4gqQsJDEf8Pq8RhqQvR5Zd6HK/rSQpjkbWMIFofgLg9k/5xGY
         sS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282010; x=1793886810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLv91LE6Hr8ep188oveO3sPSclyk8z8F6MAQFei+jPI=;
        b=fI+nJU3Orlwt6h4JTOz7ieyYVq43+Ldn2O+9+URHRpO/lxy9asY6arM9bRNK9+a9wZ
         cmiDHFzn/8vvUCUSxePHGRIgnKimhATjfGj6BKwyeUBesFxiOYqfswfLgkb420y0jwSa
         dZKr7MZfv5HzEMwpgKPUf03RAq/CUhgvl+QV/kq2tD4KyMdJhpKUN6hfdIzeDkuoPvId
         uM6V3UO7vLRWQmwlko+u/DyftZcKjhugvboFIkuhaXEISCbAwjooQAXI47G276iI8m2s
         9pyiIpVaHxCVjOJ1B3yAB/LZue9u9LegaFAgYO0U8IJQe0i8wqyEojZCzuPLdKr0huAr
         qZ6A==
X-Forwarded-Encrypted: i=1; AKwUvBxDlKftUah9/Jo5dv95rbNK8bYRq5ohjGIKONGm9FpyiXFkW37nCu/nga+3ZoEEm5APlAz3G7OhIz2Saw3i@vger.kernel.org
X-Gm-Message-State: AFq9FYIEPLW2vTvpd3P9wIExP31azQIpQpZ0aCC8rnls4Eq3JSOyPHTN
	I4mL2WB3oFTGUGsLxXuHYTz6bRUgdlxtwGF8RJXzxcFUbBcp6ZhUXJw=
X-Gm-Gg: AYBFou1ltDbIpnwQlfGl0kke5/bmblvcnN+StgY2bAZk8yBXMA2LiH5rRiJDEzRJ0XS
	2ZW/KZG8kquoxplx8JvK7cGRdYTcFHsj1eHHIOSuDc4xzSLh6tndcnI6JEzd3xl6dqaG7OTA6eE
	wM4CgO3IwWV6SZPpak3rruN1+/OX81vZalOm84P3+Kt4MeIGQwLj7aSsgf+hMPwzZwuOdUFigbs
	PM3PcMH/11AtU44DrpzzbdkJ5cYQveU9HD/3JX9b4JGc2WPXB5N5No87UpWldDdV4Bq1PUMja/S
	R0O/2V6wEoZPyq9PVZXakevMwjhXFt57/DqBisVU6PySgg/39JRcbIaLAmPm6q+ckgejt3f6KjS
	5UkEVU4eq6hzOjoGfpyuxlO0OttqW/P55CV3gr0ixNWRGf6Fs0wmStbCzHCcSMo3KYB9FPZztVt
	0pmPHD4S9Hye7YIBXtIGbdYQHDbq0VhvryjAd2OmiRm5Alobxxq37GYEGJVETLeii8rzRteTUwZ
	EEWmp2G0xkpeT++c6O8dHcb6LRuLQFmu+bPvDc+19aIv8KD7bbVn4+TrB3SPY4t7Hf3usrb9YxM
	rlRJsEA+uh8azZrYNTgiFxFHaJCWhKEgLCVRpyo61m8zXQ==
X-Received: by 2002:a5d:5e03:0:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48e5d468159mr13722390f8f.39.1793282010340;
        Thu, 29 Oct 2026 06:53:30 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:29 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:48 +0100
Subject: [PATCH RFC v2 11/14] drm/msm: set ctxbank and asid based on ring
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-11-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JeZ/oDOWBrzzXnhSTsaX5dWsSADptm5HwF/DPV1Xv4k=;
 b=4M7VMbDwjOepIjZPrdycOsvEBkNuot2Ltb1yMKAeV6IZ8onsZj759zJ8VBrGw6EwZ2ETpsOXr
 1DglU23L6d5AIGkk239c64rud6FZXnrAbBlSSiEjCojZ/rkF2k76XQ0
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e82d0c0bc10f..57fc4035a753 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,7 +247,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
-	u32 asid;
+	u32 asid, ctxbank;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
 	if (ctx->seqno == ring->cur_ctx_seqno)
@@ -256,6 +256,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
+	/* qcom-arm-smmu always maps asid and ctxbank 1:1 */
+	ctxbank = asid = is_lpac;
+
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
 		/* Wait for previous submit to complete before continuing: */
 		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
@@ -313,7 +316,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
 		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
-	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(ctxbank));
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.

-- 
2.56.0

