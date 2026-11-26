Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674318;
	b=O6zCeUe6BgI7vqZaUavU9HnQZvdLLAXuW35uVr6sv1B7L5eI2A9wMhQlulwOp3d/GsCv
	 uheFjm9ZRsjic+K6VztZriVxOI/db3+1qSB65OzwNjo3a+GuM/L1ycmc+HnL3op7qShrL
	 X2fmyHcq3e5nTUn4c8IMGrayvFfEQxJvgwACQhUkY3Q1V6r5MByyOk6Wif0aJ/cDF8yHD
	 lc5KkAQcg2nGr2glfcP/+LhdrCxwMPxHEhBlQiOPpJAX9X/v1ZAsblcDQ1Lsp2IU/ZVtx
	 Zq/9rcZxbtQx6R6ZDP6kuEfXJSXtzqff7Y53pYtaglgDj/BQELsUeMGJnZGqr4q3Qkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
	b=0cuq3Lb+Ro8+wNv7tAL0EbOlah78N/GeC5m5JRGHvRuh56//FkDyhgKK49vkLsKowfam
	 3ZrcTEyVxQeE5VulwlxJwi1/fCA6AkYIFbvelnPjAMgxRUHbzjl7QY8Fx4VFoCs3QuVpa
	 /MwQ1YmllHCfRVNFqZocUoIYO7uEzXox64C0kArvaRSLVYYrK6YOXAMN0893Q7MnCgKLp
	 0otMKjLUTur7+bsj/cQvckhVggCVz7ueuMXdEfB/F6452pmyaec6RUj6OkcARg0MFJgd7
	 xhZVsTcKiWV/PCZk2h3ICP1e8hX0gjI6KdMuwp17g7L8eAbSwxrA3W+y/Pq5ibhSpqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kwwZM801;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF4606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2BF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kwwZM801
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so10090347c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674317; x=1796279117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=kwwZM801xwY2OIuhFX6EGU46pbfEvMYve2UtJxsXKahMtppPFbmsogbWGtMrnYDdVc
         MkqiRHAKH8ft1s6KUT0PXPxlPEAOV38faYLXe6n5JYu6Htke0YbaTE8HLngPKG58wJQW
         6Csmja8VRmmYoK1gzjRlIATHGv73Z+cdim0MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674317; x=1796279117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=ATLpoKGOttbYw1c1jApqPVZg21K7xpX3J7825AkLp9hZmklB7uOYz90/NlFa/Mq9xR
         fT8h11yJ30a8PvCCj46SAxG9Q2m5Kf1DTrdYPpirnn5Wyv9z9x92Zyh/UE9BE7g3CeRx
         GAOkZDdtGm83ty5bB1UooPuEwBBOp6rDyz05ioqn8Lkvo6kSQPWuqBWOQSJQ5yr+BG07
         SEzF2mrm+T1lj+lGKmvCI/DBaVY6CVxr2fO4Y6YTrhMJy8Om7cQ7mjgveUS6aUTQGUV5
         pez4a22MQGI607gXiTgVu3mqqUDIYpb1YC0YSs5hGy+NRUzjPHvDHvqeNdNBC3WIpFfM
         V5uA==
X-Forwarded-Encrypted: i=1; AL+hErF077uq0XN6ZJNQ72vc3WghvI0ekdsN6AAnLGndncqYl/QBirJ0JKDLS3dXjDfalyVkHQgrJy6OV06qdJXc@vger.kernel.org
X-Gm-Message-State: APuU4Z+SumiQ9hRQ1xf6ts3/GPET/1h2qOwdeSAj9LNyBNfCJC3ZJA7D
	V/ei9F9T4PORaCTLKxtQReUVGe2WgSSsupN5U552GeUUdHiFi5Rl2i8j+K6r1CuhOw==
X-Gm-Gg: AZFdTZcf/m4uygAfVp77UhE9zZqaufu9ITH2oS7HWgjTt9eAY9ja3GMz393bQBScMy7
	g5dw+jZrgyN5lrChsfZSFwSwt8xpnXHp467/qQQm7NEXl3zyQuhsBGqnpPowlSXoeuAsz/vD9xF
	4hOoewLqSSHGUxMwWbNTr1zLkQ6KbyS39ede5NbWK8RjjvlgvEWiqnt6oO/YtjuXBWQ/eyZLYpc
	CR1WwsrEFK9yOU4E/Nj66v1hCjnXDCrOZIg+XzAqi2wQ6+Ze0P4Z2zwbGrUIthtu50rAonkNosv
	oTJEORlPyt/ijK70q5cfQbM2l8hCXgeHrgz9GVamFu9S/+DeFlVIG/HQ2wyDq9ESENosrR0LwYm
	QyqjLmbPQ+F6wVhWg9PNCNRZTG8iZagJ3JDEy4nz7nzBl7ZhiOLL50GU54pChphGQ/QhMDkUnKi
	U80F+YDSRBdUXhthoa/GvkR9ubg6eEYdEVfDvezHlrbaPMYWQZNJyoQ2hpnmPY38iOGuUeYr26L
	9z+1+BHXc2nGcqNOTu8GowX/bLvzgl4OaSbG0bbeDS0+Sw75qOgtI33SWP3vEvU4/OfVH2ISi7l
	iPMr2aokGyyjxLlE5WY8Xgs66hAHxFpTwnPCc3rRcjKdnMJyjYAVVYUPhz7/cbzjHSY9oVm6q9T
	SbpEpqzowo7UjRIOnD/4beA==
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr20072859c88.34.1795674317094;
        Wed, 25 Nov 2026 22:25:17 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:16 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:49 +0800
Subject: [PATCH 7/8] accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-7-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0

DEFINE_DRM_ACCEL_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default (evaluating to NULL when CONFIG_PROC_FS is disabled). Migrate
the driver to use DEFINE_DRM_ACCEL_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/accel/ivpu/ivpu_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 28cb18dcfa9b..933edc272f05 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -609,13 +609,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 	return ret;
 }
 
-static const struct file_operations ivpu_fops = {
-	.owner = THIS_MODULE,
-	DRM_ACCEL_FOPS,
-#ifdef CONFIG_PROC_FS
-	.show_fdinfo = drm_show_fdinfo,
-#endif
-};
+DEFINE_DRM_ACCEL_FOPS(ivpu_fops);
 
 static int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
 				       u32 handle, u32 flags, int *prime_fd)

-- 
2.56.1.839.g22a8290db9-goog

