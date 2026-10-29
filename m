Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282016;
	b=RL8BPwnla760uYLfSKXJvKPMXVF+M0mLmE5BIDXtzGFSFe8qGPCw5WKtdjBG8xgosjGx
	 n5SLfO2VZ3MkLrgSgt/gQW38xR1nTtdaATzTuxYmINBZOjL2Yckczph0MXpJaH/Tu51uv
	 APYmbpHITTIqh9nOIQpLIy+v5JSnYnjd1Q8yIy+LP4Li9kmQP72ZocE0n3lZB3YFe2wJO
	 wyyABYPR1ZdYNab7VR5MWqLbWWxt1EN+rowJdmleK2jQK6e8li4U8HgCxLTbfKd5QHqVz
	 kwC2Sz1cwq+o/fAfHa4o/zhioZTiEght/TvgY6voRfYmOtNCj4QNj+sIQfG9OXsoOvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
	b=0mNLymlGJ5aOAbEPFxxmSnnarqTZ5sJt6UQ4Jbh1LHtDpsdE1pleSJ6reoY+IC2lcgen
	 9jMhMIDEu3TbNRhQFR+mhRnXs05A2uFmUKnrNnMTb7jHoakvB121QrXpy1etTMPOrygck
	 EMUkbr6HYQJY2Bjl+zAgngawYNgBpBD1CYjNbmhnxn4Py+whUVE1s6q8j2jN1H3g6sAl0
	 oVt7HUtW88/PeHEQQ5tpCL5uQM27ebIomsA5+Ffo8yAz+BqaXkihh3dxFdJj1erB/zebW
	 sR7IIH8Y1eXw8mfQyL4FQBNSSOUhwdwTAwWYB2NoMqGi0/DgRHuc8kUsZ34KlU0vHFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+vHwzI+;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F81606A815
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F81606A815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+vHwzI+
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so1448538f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282014; x=1793886814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=h+vHwzI+H9X2csVamkSfKUUHbALtnKDHtUUA24TsKBK5H9ZDQZfHU1FQwXDhmLEtPE
         Dr1BA7GbX+S/GMv1HE5p4KXcvVuMUEBO3nAjpaCQFQb6m4TdIWHn/w1E0RVpiLfzQflN
         nAez3m7HSTCeoZAuuBMJeUPwzNfjYmKEqJBWEXWF7E+4AD0DDcUTj1jIS740Hf76uMjz
         fOmJWWt6x1qIx11OQM6kvfNdn1re4sfj3X22rQXNoEuHddWn8BOFmZvnzH/mdhdTY42T
         qpQrN5/tchfxVBD2umWC8BqYUsPBegGq6yOEnKgC5Pp8OhC64QoKMrFABH6NGHzXMdCX
         tTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282014; x=1793886814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=YFWqNqs3yft/jSM3KApGUCXZqALVqCdnhCyszFjv2fCbZB5BFcThbMdYWblnYF/+nG
         Jm4Z4Nkc1cmfIRYejM2bSQ72c4TQz2nNvzute4AoJzJejuxeS2l0ne3H87Lsn1iRV6qg
         qKYEaVpdRRMwKoY1w2P72E8hgFnHFZwzUGFDXsTZF3/GWYeo7K+pGEVtvDB2MyAhtnCZ
         gmG9EvhcEKzfeK3azw6F2bx6OYr225eFAZVOsQwrPrKW7s3nF/Yq0wgMGXgzVWBf61EM
         jBK9xxfHBkTIsSf2hnTNLcyZCNi7qCHdlxgE4pPXLiFyzgNjrb7NMnkGSu6yThUTwVDJ
         iHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzacBIcXsQMdzUV2+m9iLVdyrBomzvn2W7xPvmbJ8pzz2LQKa7Q3iaCi69zJ0ysYMgt2ueQ332DE0qmvTRu@vger.kernel.org
X-Gm-Message-State: AFq9FYI6N4A16kPE/6f9DNLFK5LX9c67m6k9o9CebC4c0EC2WYqteqbZ
	HG+3qIzTlD8o5lqMfjfVhX6a+e4PrM9914cX4ckaKpyjOpZYFW0ksXM=
X-Gm-Gg: AYBFou0V3bre+waiyCffboaRX9/8TsRdjSjoxu1KYtRlqWIAreGZUNHnJZ732TjYwXA
	1eg03z23rrDj1Rtx248xWnEWogVx9/yELFP+HOaTqmSJnNV2+JTheNf1Bzn0kWRrI90/Web8lTi
	FqXMHUEpwgAXP0V7fudnABhHuO8KjZ3aC8zh7autsHgokzHcJatRHFki9RzLNILGzyUx9geCkLL
	iLZymG4Wt5r7CN/nKifiBc6dN/t5vfkHDnfig3Ynq+jvOKnmq/j440hdvDB6hx2L1DiBeLqN5g+
	6GBKFoyqRLbHIEiRFObMh8dzuEr2C9lzV2ez8S9TlTtspPJD/FiZybLZ7sv1N08hU/p4ptPlSuU
	YhDtUh2lKRU6Wv96U+jDPi2bu+enV8GwviOEjEK6uTHPV4oVUm6Ur3D+v7xrxS+FVyC/fIHaeuu
	6MjGf8AXQf6nPB2YLcDmzBEHC7Eg+R2v54PHAgrUfXnY2g8o7Djx4L2opZ2weCe1oYVY2QcATjP
	+uIsA6alFhBxdi9LkfWtMrd031CvMyFoq3WSC/TcFZqHyl/vGkPVEBWdsj+LR9yCq4JTBWRJpjq
	FL9POwmhi+V1lWnBHPYziguzIfB4xyuYiQZVrPf2nQweAw==
X-Received: by 2002:adf:f491:0:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e5d5909aamr9182569f8f.18.1793282014126;
        Thu, 29 Oct 2026 06:53:34 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:50 +0100
Subject: [PATCH RFC v2 13/14] drm/msm: gate lpac behind modparam
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-13-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1928;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ZEwODnTsRSIiQzAvYlWfm8pmWhNZkrTmOspw3E7UZvA=;
 b=Z9dhvvnQgx4S38zM+b46UTdfg9SThPOIVSdAoOz7EGATYLcY7dL9exHHWjN9XuX2BOku7wLrT
 FTPWSEv0DrrDpKLv4feGQ8Wj41R/cQfHXOM+Z/TSHsGDJf0un1xYOaN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add a mod param to allow initializing and exposing the LPAC ring.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.c              | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6e2333466d7f..51781a2e8a00 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -30,6 +30,10 @@ static bool skip_gpu;
 MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
 module_param(skip_gpu, bool, 0400);
 
+int enable_lpac = 0;
+MODULE_PARM_DESC(enable_lpac, "Enable LPAC (A7xx+ only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_lpac, int, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4244d9324cda..f6927c797fa5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -889,6 +889,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config)
 {
 	struct msm_drm_private *priv = drm->dev_private;
+	extern int enable_lpac;
 	int i, ret, nr_rings = config->nr_rings;
 	void *memptrs;
 	uint64_t memptrs_iova;
@@ -1012,7 +1013,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
-	if (config->has_lpac) {
+	if (config->has_lpac && enable_lpac != 0) {
 		gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
 
 		if (IS_ERR(gpu->lpac_rb)) {

-- 
2.56.0

