Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674327;
	b=ZieZbWEVG48G3ZQvRd0nwiwfbm+teN5GYySzaQJuHv43qfN4xtwQol1D3MqSQ+xmDTR1
	 byiqZgcdWAckVsdRQrGNGK1YIP8fGoVGN/aOC3893fQGHPmRc0+cu8gcNotYzkTJXI0lB
	 TM8aKmbjAGStdPnhkKJqahHTF4stWRCFVFmtfIRURMxB+xgjJaIkNblA4a/rnpVkdfNhG
	 X84CTEyHLFumo7eXf6lGrEqT54MsuIr//adRYqxCMWOaBinnbA8Ue5oTlAYTpzaQ9AmSX
	 70hIBv6XjNpWAiNjuRMBpcF65XiA9nj17BTZCBORCYCo1ex+JTUokgu/Tu2/c4zYplg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
	b=rJKA+US3KUWRrmvoU1e8KxrANZNFhVrJAeyZNJJ5VfdVyrfJAd2MkAaUBWhmwlBGmk6A
	 HVurnTIYFCUcUlG5KzUeNgVMb8l7sodJa4uVKFLQ2QZoaPj9naIigFtrr1CxQ2P30DDr6
	 ngqWjlKJ9MQowZxquphma/qrBMXEqAhS0Fup9WRlLqotHKcclMb5EVn42rjcoB8UdslPk
	 FUXPpnmxPrd7IArfwSVQ5CHUhFtItyT0CA1udksML0AEpadaNWEEZCOUwz9Mu9uSXMldb
	 o7x3UnAO5CxLncjh+Bv5khSu/WoJYnsqnv2e3eVMBhNbYCyApCA5DGyQAhw5Nbs+bhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K4at5neX;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E39606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E39606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K4at5neX
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so7385844c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674325; x=1796279125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=K4at5neX7QHiToiVo/vG/UxC2yV/7Yyw6zsQA82iUfKQrk0pXd18XCW/Jz5OlUkgBC
         tXraDsQJx5DtuQXoSmD+cpIkWBviq1m4Pcz2UwD3CShAnXXLmSOK5MP/mtIe29M1rtTu
         ibc/L7X5xbVH/fWOGQrBHfZcevV3pnZSDweRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674325; x=1796279125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=YmM4siB25Lkwlt22AMEwMI0+ZtrazBnE3GTy9vCV0IcNQKStbtKzifmFZgKkZQvfkv
         24Tx+4+YTfZj0glyTVnQnMLxIrLzXXc6qBfRkuGu96gk4lWFuLU4D7AmC3SZQ2/presA
         fZuRfvR9IcISQKzan3EZqx8fYVEJzgKcr2WRIXszbo5Cquj+O0uyRuSeR0yBcLg0zHrH
         7WhCh/Rif0KLqm8yPHkIdmWuYLts6EegOV+SsMarIf7RSH6QOxKiNgrn1gSTlmLQIUAx
         SD9m2668pzICu7N1x5LT8cvZGVzvlmBPtEn7xpyr/uKegWoGS7etLYVbcLnUa2Arqppt
         CZmw==
X-Forwarded-Encrypted: i=1; AL+hErGNdrdc07fgpCU37jZ3YW9LRmtUYNOPB748KYBM3NkDYzgtpdDZ709ghOH/e/IM7FaXAgf5236CLbltobCl@vger.kernel.org
X-Gm-Message-State: APuU4Z8032xzJeC+hyv7pg5W8uWZf4SuhRjIOekP/EqoBzMiLIt9YVKJ
	Cr8ZAea2eYikbRo1mtfwHvnyHeK3A2cXzi6JFAuscZoiAUBzKw8lbLtYUyLn/OzHfA==
X-Gm-Gg: AZFdTZc8j9YDSxMRE0Ivcr5qDmqC1ss9ovWFe5Jgb5acAQBIiBGLtmViX4uAKlkEubS
	wUt3CMtKzWltY+SuQ6UmoTAnO6YooR/fCOtJWHzI8Jph8ciVtITJCrccCJHwEf7lbFRfsm3ZgU6
	hkOIMdClGHBWto/XbPTpw+ZgsxsQ193yXvIDzfTVH78tANYxnvi499gpg2P42+mVImqU+D1V02A
	H8rq3H1Hj2XCSkSui0vqF9+Kr0jb+KGotp1rZmWvnJTSb7zrBXDjR1qeiXaMtUScEL3vjbWGfcp
	cqlC3BV0zFWRTJ3/KQ74lRRxrhOmJl/sW1GshZ8lCVF7en4eqLebfyKLD9SzgoHVF5SNt7XL0cy
	2ARnF558tp9UFtJu2huc3LGK4fu712A1YIGcXo75AWqQbd0cK63/zsGnMiJt963HFla84m6yx5q
	CXmMkR8KM4T+6N3PalUCTAJyXpFm5SERQqMAn60PDRz4BFGFc2wt0nClKQZERosEd6/TYOL7w2c
	Rtb21JkNQMfp7DEXb9Bsz55o46ZWJbco4+UMJ6jS6VHKir/noW4QSSady5V5HDkSXJrA9JBW11c
	8WiqMVdAMMr+Vpjz27PaJqaz5XX/s7PE5JKjt4iwzRcOc9xdnG5aYZs1x09FVBSfnwqfDO8Wewd
	h8/KOzlquiIiLNdBoQ7unbg==
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr17922707c88.29.1795674325489;
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:50 +0800
Subject: [PATCH 8/8] drm/mediatek: Expose GEM memory usage stats via fdinfo
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-8-7cb1d1a5d6ef@chromium.org>
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

Set .show_fdinfo to drm_show_memory_stats() to report standard GEM
memory usage stats in /proc/<pid>/fdinfo/<fd> via DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..9d646740c468 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -607,6 +608,7 @@ static const struct drm_driver mtk_drm_driver = {
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &mtk_drm_fops,
+	.show_fdinfo = drm_show_memory_stats,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,

-- 
2.56.1.839.g22a8290db9-goog

