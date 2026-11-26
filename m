Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674286;
	b=BrljFFhrftLOga1CE7tmHhv4sYFayjGH7zJ0HLt030QgZWg67B+1FwFMXmdcI4C7ODxO
	 isbg6v+teZXyi+5Kctp02hNQrWk1JjNHgtbYwuUlWIqSyIRTvxS1jhg9NPg+4HJxMVu62
	 XFmziLTm3fgZ6eCRjzb7qsAQqCg/2VL4ETxFCL7HG/eJusXkbBzOCzZFvMfR26TSOfWDL
	 byBqJejjjkltCVuiO9XME2qzwgxQ93NWwvBu6ba+i+sOLX73Ampg9sh5MBaJjGJoHQPzE
	 SPUu6eKMDKM/+CdqBMXlr8e8askZpaQj6r3yT7mQ7SS6hwLWduWAtZ3z5Vjc4nYSdEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
	b=o5pccJp5U1GzndvMgrSS7xKHxWieWvD8Cg5tYMiQBIcMOYhMaQMH4RQvZt4qUZMMF+b0
	 NdcNIvf70LgLjWM/frw5PzIxQBUxz8bWYUN/RsBbyPhbbVfthuMxQuuKeFfqTySDpHI6q
	 1akWHjanqgs0+YP6qcBZFMee9NefK+dPethFmh0l/353NmkAw0e4ZfyK2yzWcwZy2j+Sc
	 3kjcU2U+Jumfgywe+zlHOyGvhTleCs0N/RcOpi/QxiRE1XqP7u43TXMHEYkhXvKGj4PWh
	 8CW28DUT4Z6R8GvPa/J+1svFvgpNQaRuf9OsrBMlV2Sz4fL89QhZG7tTftAR+9y0Ehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NmQeR3Yv;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D0606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NmQeR3Yv
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so7385218c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674284; x=1796279084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=NmQeR3YvouSPoejt2/ltTFEZkJF4kWAkE0yu1LWqRtQ4a58YTZHG511fPlSYFWNhSH
         5mxMjd0Hn2LLHkU1vAcLnQ9H+6+4hArdJm7mJdXuyBzMoyhg60WnT8jB6voMAIiwCSqH
         L5sWw/UymwNVK5FuApsHLMjth149Wa9arOt8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674284; x=1796279084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=LVwEnYCht2SoXHgYgShJ/aJ1gMlPpNCuYIdDdgh8IzuIUyBaSKX63FNFmIir+0AeCj
         Kcen2ForXHtsLwYVPwr7DiT7YacIUsB91A1P0nL25pIVcZyjXfUGCxxkn7XOPw+OJx6J
         HmdZZT0Bj+vNLL2xYCngk/o1gWMw9blbrth3bh8oI0QnbIaA5CC9R++hFT5SncAVHf7p
         Cueubyug4Pf3clm3zlxyi/IFMgZdf2MRegrxKzLReX/X4bDVEgBPxXBLLD5V++nYSemj
         jL3Dxcv9Vt3Yo7WgIF9tx1m9ZI+1aegrWX82sJv9RADFVdgfGYiJG7W6kVS+kAMzYSt1
         bFgA==
X-Forwarded-Encrypted: i=1; AL+hErFwgHd9d4RsSeTd2OqoyeZV+Ayld4C0VBpimPeT5VjytRpgDq9Kb0KLkQH6CJWcNSGRanoV7g1XNsgyvX5r@vger.kernel.org
X-Gm-Message-State: APuU4Z8XR2VAmRGie2Frb+iryUO3eZoYVDftKPjh4D1IUWBdBaZnMBSO
	AVJn7t9GdkJuvJsh6JPPMZXVXXiZC8Vy5jRmsQcumKwWa7QeX9irqqxdL2b+d8wfdw==
X-Gm-Gg: AZFdTZd5PSeVP29Ss8Hv6WyZxNsQVIuS0YCL8uxa26gTvD0AUf5cCzDoIUaXdtqi8Fp
	TlsRDG8I5Bpo2OcPFp4eVAWuQ53sCw+ermiFVxh+1RlgXU5pl1elQsBcElg5bYq/AvO9L1mFOrz
	nalg0mUEryqSYu2jkT/mN4UN2WcUbaFvewPxBhBq/EUmQFM0NgigoDMG8KCWXal2/DaVbjEheTF
	hk3F4KBdyjr7sMGNrBiowt2ClW+SbrrrqR94FklCz4J6OHGxYfwuVZ1RVPzOcq6f3x1gbkyibhI
	smy2shhjl6uslFFcUPIOXfvjqm5HnTnieKdzpx9gmmRilkZR8XeVYfCCsrckg+i7tK6n0hu/5Ks
	hHpXxBJemJ+Z1+DMFKVbDRQzAxxrTaOyRdK6spsOfXIc6efq1Ltxe929KTcMv4OOWQEg8pY3Cos
	/pZtSdczJO1NdYlnQh9n07ftdCignxR9lCwoAAp00JZ5prIy44zoYwBXIwCXTuL21nlhvfUShHN
	2oHrKyNrEuDwlwC/3pnzMBk1e5adoJmjGYxBHFw13l6k+7JboQ/lM0kpy0uK/3D+k2NBLKHv5wt
	FwWMef+U8MGzJ7anUsZ80N2d+38LWlfe3kFam7howtJgM1AWau6alF+/az8zPK0/u7RUuNa+jGc
	dBnus3wEZlfjCvtNhzTWeRw==
X-Received: by 2002:a05:701a:cc82:20b0:1b5:5a81:d388 with SMTP id a92af1059eb24-1b55a81ddfdmr16361341c88.4.1795674284302;
        Wed, 25 Nov 2026 22:24:44 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:43 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:45 +0800
Subject: [PATCH 3/8] drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-3-7cb1d1a5d6ef@chromium.org>
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

DEFINE_DRM_GEM_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default. Migrate the driver to use DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ec1352c1b09f..93869e8f3f96 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,11 +494,7 @@ static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,

-- 
2.56.1.839.g22a8290db9-goog

