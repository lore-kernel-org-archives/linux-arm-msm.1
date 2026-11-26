Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674277;
	b=A02C+7YoawFIvseUKeT4bvSifJn/x6LvIaei5193yTH474iSsoZ1Usv5rYhYBhzzy3R5
	 4HwWHh1+9LsHXlc823XzCwSdRz3IQu2eZu5IjgA9KI3LhNJKOhy4vA4zyRH7OnpQIx4/U
	 INmqxlVgjWDTbIsJ9H/MIA5cFLc/l3uUgv7C9ZsCODilJsOQwlRhukFTeDtvS7XU+L1Ko
	 lPKicqhzEDiUBgkR80LQniqHopV7fjlHU2gbrTuz+2o0g1WCEdnrhach5Z1tg6D5DtR/W
	 Q8lgSnmmgHLaf8sCVT2jLHayMBpcM6mWr8sehDezgONpaoKKEQytNRS8DljgriNav9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
	b=PikERZNF4cBoGGdbYqmpkPkebdJnvykkUOc4TKKztgxC7WYwPqoO0m+UbF+ZGkijlLNJ
	 LE06Lr89nnCj9OZpAyMngtjk0kMoqyiUJWmY27lgDTmWyPpvETJYi4oBmGs2Gsdfkb3wG
	 pjYn8/DtxhJH+no1mf3FWWBmkM7eOghgepgUm/kyQkQdwDRoLw5Wogsq0eDgYMlTdO1BM
	 BFCPY8zWOIQR6nYw3i2MYhTH5t6TS8KIza1P0dPVOgk3Wl0qEsoz4xazr63Mzo2sSAhfD
	 Tkf7DVmz+WuZTVmS3St4IhkNgJ/F8pBdGLob0rPc7s48uEMXySq0Oo3eSsD6L9QzGKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LIFvDPvW;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1468606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1468606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LIFvDPvW
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5039749c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674276; x=1796279076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=LIFvDPvW2Q4ON1mtKt+ZrHY4wmRlqR2atzM4VLHm84GX6Qku8c4P6LPdMzGT8DC0nt
         /ADAmiUX6bU9yPCxYv5OEqNFmqGjUFTUcvnltlMi4LXrEA2MpqkVDjBum0wEG98ryW8p
         TXxzTa2jXLitNUANDtOeucYsxGa28yDAY2GS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674276; x=1796279076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=zAM+8y9H91Lk5CNdCmzEPX1P0iJJnegY8EXHrJTPmeax7VdqKyoihoYpiEVQ0UNgP0
         2+GDFPxuLgPe/WuVydt+CJhQ35HO4YpyL15AD/+4ztXv5gX/YEvP58JdvCP6+wiBWwct
         V7ODBjKTAW5SQYeOyF4ItoWQALE5SFnf2IlWFSDp4KPSnzRbBQgniBD4o5/CHS04sz/U
         rTVKeJ8aajubrOiQwyL0UGzRx22c31R+tyf721fFMEG7hTrIRmYD9ECYt3JMwZZbNR/0
         PlyL0FZ2XQctyx7LOwe7mnDGudjHfwMv3uTfdbGxY+1gk8gFAWfTkjnhWV8E53Y3acYa
         LwFQ==
X-Forwarded-Encrypted: i=1; AL+hErHi8rfGzaz7F4/K/LYFZUhfRTLXRXoFYnaklzHaUenf5NQLp0OiaQiJ85hCHeLI6M0eWynbOXSmemgvHbPF@vger.kernel.org
X-Gm-Message-State: APuU4Z+4ssM9KkEVedUdtDO9pf+XxtGttiRuvlDMyXovf7rTvpyBwPxc
	xagjIUFrILP2v9J2ubHHa6VtL2mR3QzwwTYMitcq4oXIm5FHViOBcg6VJJBZTPThBg==
X-Gm-Gg: AZFdTZc2QGqscE0AK9p8aNI8bSwTcpgwP336yDvaNXnOXRd7ns5iJaEoX17+c9jdnuF
	d20xaqyKQWL7EXTSjOFwGfk7pg0cb8xxh/nq8rS9gzoL5IBl8PhItHemNvJDCN25A6kKmlKQVMr
	4Q6uzgdiSEUKuc7ddjYQPRcfK6ZtYu67FtNKq9McYL/Vqz+jRWjUKEPuKYb3mzKqrYy0ojXKBfC
	NwHi5H9iGMT/LKuQbWNhAcBa28L4Y5dBulA4SswHWMwiKRcx/mMv2odKiNyKv6WPCfttKIC6hgw
	inrl88rx57L9D+ORZ8vLByDUBIE0QxhmsXnaHLTbXhLF5qo1p3q3IZp079kNkWIiSmJ/Sen15HA
	Nz1LIGnquT6Iudz87vTdejHRWrON2cTJLKAb7c6mldNcKwDBGwuaqrFYrwDwvCA5NbhBVDRSbpj
	BwJq5x1hp/Ra0Ok1jHAJG0eAjjCTjrWw3C8V4JCKT3IBqFa+ir8T7XOmf9pthtqySaTNTFwGpBI
	sefV1vkWpnLTe4uyLTuO8duuOckv9HnpyUeJ1wq7vIeB/KeXXHXdXO2194vnkGxCGD0tKeVDHPw
	oLG2c7Gqh7uGBhFPHH6LN68wnTrb8BlHDJD48B7sP1BjfhLFSk185uhiptehll0cusQVkv7n6bD
	fneAMGY6UrtCrINPpBxQg8Q==
X-Received: by 2002:a05:701b:4585:10b0:1b5:8f22:9803 with SMTP id a92af1059eb24-1b58f229b6bmr2042435c88.1.1795674276127;
        Wed, 25 Nov 2026 22:24:36 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:35 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:44 +0800
Subject: [PATCH 2/8] drm: Wire drm_show_fdinfo() into default fops helpers
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-2-7cb1d1a5d6ef@chromium.org>
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

Wire drm_show_fdinfo() into DEFINE_DRM_*_FOPS() in the DRM headers, so
drivers using the default fops helpers support showing standard fdinfo
out of the box.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 include/drm/drm_accel.h          | 1 +
 include/drm/drm_gem.h            | 2 ++
 include/drm/drm_gem_dma_helper.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 20a665ec6f16..1f3088002e52 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -48,6 +48,7 @@
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_ACCEL_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #if IS_ENABLED(CONFIG_DRM_ACCEL)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 56dd15921c7a..d0c30bf23e58 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -43,6 +43,7 @@
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #include <drm/drm_device.h>
 #endif
+#include <drm/drm_file.h>
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
@@ -501,6 +502,7 @@ struct drm_gem_object {
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_GEM_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..3fc22b426070 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -267,6 +267,7 @@ unsigned long drm_gem_dma_get_unmapped_area(struct file *filp,
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.show_fdinfo	= drm_show_fdinfo,\
 		.fop_flags = FOP_UNSIGNED_OFFSET, \
 		DRM_GEM_DMA_UNMAPPED_AREA_FOPS \
 	}

-- 
2.56.1.839.g22a8290db9-goog

