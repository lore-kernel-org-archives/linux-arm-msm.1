Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282017;
	b=tw5k5r4PwjqQs5OTrjVluzr1VgOFpunsL3tKIWnm8kBZbOcxnlrbkNnjDYezBmvu7Np7
	 wtdjFEIXbozRZK32eu5V6pI4DaCcr3wR6wxydtEcA99Stj/3xCSDu8iDWBvWAz/tlm9W8
	 lluxboE3c9u0ijnoAvFcWApLvJZRlPqe8gMCaejd8uMP4y4rI9NmBn8PSQ3L44hMXy9vM
	 NNKlho08vQezXIVc2bPnbUxvW/nQBby+5Eq2X6Gfy5pdnjugnV7JOq+vQnE5k0gwqcp21
	 EAEMUYJn9nnnH7Gshnh/AO9p1cyJ/ZTAzUm02HqrElWF/x+/2mBoAbaq2Q8djf6SV1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
	b=HSo+tUiGwbuDT0Ibxaj/QkbUlVo8YakG5JQaf8fWD3tLKIJ5TJvfaujRKyQGQllwwWmr
	 +eVr4v3wNC1jtKRMkSP0kJKQWF+nsE62DmiMee6tHXYmTLqUztbJrGtTpiA0KDOqGkZFJ
	 D6HvloTOYJDbbYNLKPCmmZK3RPg1JyokleqdK4IFwdo31XbC/xk0h+CYG46M/eo99qDWf
	 auJY3qhRr0ptC0CEaAUMWfL9qK3suJ5SV7H5XhboduYyY8hbSgPwA2gi0w9XHPJq9mme/
	 K/B9s+gl5ARPxp783Wspc1u/GeYeSVVMSkictRkGFJIpZTkSRWj3w7MkVG4KS21KCPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hld8WdFU;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CC606A82F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605CC606A82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hld8WdFU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1601508f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282016; x=1793886816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=hld8WdFU8iJeyCtWh3V2Ho7fyvq2bd03nxb3Nx3hWjyDrA6+5fRApkMZc6Uct2VfyX
         f70kgogI9V+CHfRJ1i16vKgQ+RmwJ4bwULneAe59C4t+etSmEk1JX5IBD5arLxiu4yvs
         kLcG4jH4XkqeJBpodUgbE9xnrb2fwwBBFxpKnm1Uv0P4P1x9wC0a7mm4R8N1rWI4oszC
         c0pYM7NN0sVZP37MD2AQ3hAlklOonTajnsGRh2rqD4VZNXczAr8jBovQZfuawAH1+i+T
         H4KgDlPghGW5iWJrZrAE9I24pysLb5rGZwkYdwKZkdVXdAyTsLi7BtkdAUQgw/h4FRdz
         clBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282016; x=1793886816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=aZXYEtdtYBopPb77tOzQIUXvp2hAzHNIp4QcLJFv0dIkf0tbIhoenpHrgmDZuyjVFs
         xVKFmB9WkzL005IOa5zMpkQsTSowWBhO1GxVrO6HbqZMKRArSPyBZLznZaKacPT1i0Hb
         r6CCbVt+Vr4F1cHlXbj3lP1r0yOvjU9qKszgmNv9V+VwFd3zWfx2wDSo33I1uj/ca3Ex
         1Wf9BTZIXJWUXJHRVvehBtmXaViDeA7P1B/Pd91ObOicaQuYdG/hslvvvNiXjR8QT12X
         Fpm7K7KJJ1xzy9JwPHtked16WCfuS8MVbdIAWBXzxG7caRdbAgJpv/OSqXyG4frZZVfu
         G6SA==
X-Forwarded-Encrypted: i=1; AKwUvBzCep/88sDAzh+Fy5awYXPbDUnI3lG4fUXZkV3qXw5lzwA1/hU1DjY66OUFJ6AmlIL/rVhKmhl+whxMoKor@vger.kernel.org
X-Gm-Message-State: AFq9FYLWd3vczzBXIMDKr12ggxSwqWpPx0wTaTifl/0qqWDlWLKZ4u8Z
	K5fLnIyVdHZTOhU7B2uIjjvKNUnNdbjLnoW1YYp/ID0KZZ8bvVH83GQ=
X-Gm-Gg: AYBFou047ZkWiilxKaL0WGosEWi8aqROZtbTBuhHNUMF2fI93G6QtbMhjceCI78b12l
	vUPde7eK6lWwpiWoAciFYv4lwKJu6kjfVQluPsqupH/GiMbvILT8AW8AnX42waofXuandQzKQf9
	IJbV2f34LVxk7oy/5i/Q2YuiDq43xdfjX+IMZa6la91zspaxosTHlhlXFX8vBB+bHnE2tce6vsm
	zIyHYvkGr7+FUiVsF73BUh28Naz8jcHaamzbM189a5U/0SiO6U4R3Uj+WSxLpcAbM6O/fDdNfCD
	rbX3bNOEjWk6q7QMIkAVuaSjO/ZJbbBagdYWpejDV6KhxNqBpO1K7kIU1KeDBJbh6pIKIaTJATx
	gA7RfjUDnDk9izHY0ByqIp6QB6V5fJFCxTWDDxxoeOx8lWdZfmKaJJTYv5a1l+2JxLxbneSyYi7
	OnCPjUOogp9vd5iYyXNH/0QgOf1O8uh0FHWY2Lhx2AwtyzkSloYJMkDav1itPQng6ARiM8xetia
	f0S8mCddzN42uXIHPwca5EDhR7LWL52bg/V97HHLDspA9eA+24UEpOYZjCJ/7ZKt70Z/dfYux39
	EgYL82bjJjBvk8Gc/CEvYqzGbxdhi4C0mSa3mcpE3T3GaF0pYyYPKIlAAIgCCAOT2eI=
X-Received: by 2002:a05:6000:178a:b0:48e:56fa:9645 with SMTP id ffacd0b85a97d-48e5d5cf38fmr12439039f8f.29.1793282015845;
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:51 +0100
Subject: [PATCH RFC v2 14/14] drm/msm: enable LPAC on gen70900
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-14-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=982;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zftBrxFOdArPW4SDW/zPbLM/dW8N0ZZjr0f9slsMd44=;
 b=drJK44c9MU6MO0yKK3/YNJmZlff0GX8bkfJNHj78s+gEdYZMo0J9ar0ZFCpDUnU9s9p/mTv9U
 QEVDlUzSQ7wDLCQ28Hd4GN503IJPB36U2UQmXnTQDK6NcMLz/o9Mfkc
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

When the enable_lpac mod param is left on auto (-1) LPAC will be enabled
for targets that are known to support it and are known to work.

gen70900 (Adreno 750) is one such target.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 5ee00eead14c..cd1bdb54429d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1591,7 +1591,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
-			  ADRENO_QUIRK_IFPC,
+			  ADRENO_QUIRK_IFPC |
+			  ADRENO_QUIRK_LPAC,
 		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.56.0

