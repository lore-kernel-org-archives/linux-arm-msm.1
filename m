Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674302;
	b=D+W5YBAyBSSlFtROLOAG+OXvdyT6VGlmB2RBtOJijM7AIJIfSCGhImynRgbVn+ctR1lL
	 HhhfUYcsazxSSLvUPJJdEWiURxaxbnPt8vD0+gzzzHaYE7MoNLOQ2WHO59wVchygmOygO
	 YWi5Y4PbJVbyvldYsKCDGgjs7fSc2Dw6/q4D+BesCpufbqmFqibTJBFmoMy53ASgziaOI
	 0YKfKOuopP0vb7KV/yrSMFfb4xTDUKiHW75vA0WmYxgM0SO4PDA0jNhIffkT4BYr0ikuk
	 sDqQHfCNEn1Lf8V/MZjm2kHO2RqSW2AdMDHqpVlD1Zyfe6s77XVJM4uzuEPX0yTEOCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
	b=H2cQUWyuNVBuI4E+5RMU/doQdX9oQ3WvG7aPaFIOlALUSrBal3joELszgjB/+t+/yzuT
	 lAhCzLrmI4cxNhVAkcFS1pd3ghb7EfiD3eW5dq3exWeYFGWjN1UGPZB5lbaxZ/GJkKtME
	 QuB9hPtCH/XZ8FxYECaFG4FWSPZGh8G0PBK37dbsBW5ZDrXlBEmNZcKTYKQhJmdZjWOoX
	 jEvQoDjNYXEJ3gjxQ8GUkwG2ZitmaLYnS5PIByTaf2GKdSj7VEw/zfL+nx6/NlcubIGMm
	 re4CSPRn+YU8mp01ACsy+/pVYodl/RngKhTko9q/U9Tu8oWigM3Av4vO/GcoP5VWwGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MkeGGUmr;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E21606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MkeGGUmr
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3477928c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674301; x=1796279101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=MkeGGUmrDtWCtIDeZrHuYM0LGN+o2+wCauGzhPYqwLyTs1hWJ0vY0IU3Sb4/mJViTx
         dgrqV0l154cwSUqC2KbqA/fjRIFh5aeQf/SyXeWtGg9uBRaNvjzobcx+bKA7SbrzVoHt
         +5o2B5Xx30JIHc1sFojJY6negcqhwL80Lm/J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674301; x=1796279101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=dM5noPBkvecGhVuPaHMLoP8HM2zGC8XEpaDEFRie7DZBceOAMNaadcHJ1rkrxXPQXK
         iDxNvn+umGOyo2I8qaZFcx8ZzrhgnpzqLVIpHajkCYppBZeAYwbEinqLlm8mAzRdfcuS
         PvIu1wj5LAQ39vtD1coGrY2PwJ522ztOg3ntfCpT0ir2F+MW8rEJXuktNFeAI+CAe1/q
         dQWyKdb55KpmTLhhxszE+Sv05uBUDjEEDS+qwRwza/4MY4oaVATP90Et58xuyMQkY+KG
         UCrhjpaYj0RhkCQGeAltdrSi3I9WzidhGviMs2t25GLQvXugy2gRsueKBDiUUJE9//AE
         VnSQ==
X-Forwarded-Encrypted: i=1; AL+hErEncfioaTn7OxZPpzgobuATZf/oBfgEB9dwd58afXMWoXv4jfrnEbFtutISHZUPvs7vgbB7C++kVXIGHRB6@vger.kernel.org
X-Gm-Message-State: APuU4Z/68AeWtm300n0BIQ7egqSp76x33xsnQxs0WrJdAbrqdYEZydNh
	+5pMWMK2M0X3mEuG2vz3qDEddprdxlb05H6htx/3oTFOupD7hLnQyZ+y32IR3JsvHw==
X-Gm-Gg: AZFdTZcHunIkGOSebxSs0SVX+UO+IDZ9zJR+XQBF8RVuu0PezPxaaRaY6wU83g6Tyab
	PhCxGdzyjdqDLuyCbpKnQOW/hc+UXYgb5so+fQe/GjLygnsfG2wqBKbgyJFGb99UobOsGqM1j9P
	1yJGCXyv4EcINMVE7Rp3HzAC5GbWs/Ul9qQsEgmyGPt3iwJIaskV7jrCmk3p3cjUyBitOyfSkA/
	4Q4Za1h42Z09Ml2OjZjDAWyT44wx13lPkZSEKc+G1kCvRH+JnVzD6TWPz4G8fTTj/tlGzNf2WmZ
	JyQhiRSFy1ov3f8AFY9HA8r5zuKzCFrJfTQi1CuVBN2sA3etOAKEMLF4WCIbA9TYYpJE7b8DjrC
	qWjWVq+smq8FIn1VEJrvd1dTtWRZ4zX+DSgMs0LvUoFFhPfpsRIo/AX9GTKe6ArNoEzsT7WBRVW
	mO3/auLkm45AWVfyjV7ODInxrFkdWhw98jI9fDqtJq30i7Ggpwj/0CBZK/KcO82JgsiwcAxCaQR
	BTK32h8z/cfwPqLmL6jGmwT3j033+gNmNOFnWCSm3dKtg5STDaLZrXmuh5Ig+gPPyS07c3G9qYe
	THmQPfWj9Z6/nQkFhOeZ14LIpTgIKU40Vyofj0xEO1eFotCC0nCKbLO74jAnLADkIH+g5VTns5L
	kzX2ylfbi0AoHS4vzLGF5gg==
X-Received: by 2002:a05:701b:2603:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b55249484cmr20664343c88.7.1795674300778;
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:47 +0800
Subject: [PATCH 5/8] drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-5-7cb1d1a5d6ef@chromium.org>
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index eeda113037fe..205838513379 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -789,11 +789,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations panfrost_drm_driver_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
 
 /*
  * Panfrost driver version:

-- 
2.56.1.839.g22a8290db9-goog

