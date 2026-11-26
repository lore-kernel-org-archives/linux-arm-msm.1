Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674269;
	b=uKJVtBXgOgsO8m0QGA+ioHg4VTZVX6ei3/Xp29siRvDOxg7XYlXNKHDatTxmhJiyDCdY
	 owB0+utHmWKQQ6NAinZIXNlIsAG1p3s8Q7wY+pIBEkG7+7SDzttPjiuOze9fGaNTd1uPz
	 1NuwbosAX9vjdUF3gxJeauhXFx4Ptq/xuKXR6YiLlSKEbGMqK0NLWHlx+SnGVe8DfJu53
	 fagfDy/RYM+Ce1tY273C3oJEmVszX/I+SJeM/pUl6bJNLhAc0BEAnG+f42SQPqcmc8hfU
	 drO2YBGRhdu3VTFl9ASFG8gn4GSql6yY3T04VWjjgzgG7/CO8OlE/6omFwg30gE7Qgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
	b=NeYAvPLsQzYi3UfSJMzAQT3OjE+8jPAAu2QHJqntouknV9l+hI3MBCntNEWAkGEuEdXK
	 tIXa6djQK0yJPWdYxt/k5tgbJ2EBKI7nsw6E6z9aHlBbkoRfYuZw+/XpSIwQ+m/ZugoCl
	 O8hIZO+NfOe8EGctpWBrDWTX2PRECYZyNrK3NM1j5PnmMpwdIKW/UC0Gxh3Po1r/N9WhT
	 QYbrz3au/mZgTR+6kvd84MO7+c07TlRUWOBhxDaC3gsfBdTmCW7l3iDhTYPPzPaCc1WX8
	 vBUT3Xc8zmfxviIcZ2Ka8dGdCe5fg+WcQhxw4zS5I3iEkWzK8TPQD8j5R5JPp1UGUAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ltL+DhQ1;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5332606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5332606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ltL+DhQ1
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5976399c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674268; x=1796279068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=ltL+DhQ18GwagErLqFPosKgi+goNKBOfMebH+bAYkfSLOK4/+WFExtNh+fbsL9OkSf
         xdOOI8uDEoPf+/dWzyOMSzMi8bRoT+i7PTOwdyHlmnBdOkHAU+zCJoB0BjyOwgMxlwKl
         c5xiUxGNXWCQvcHbzP5SoijhOFhdyRE6FX4zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674268; x=1796279068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=YlJ0t3t3WvipLEHS6ug72VBxiPLChxtfRTuKxllvESXwdRJsv+PT0O7+I1pUuIQc0O
         ryWhAlrGF9k0hddcNFk9TCuUjN4qvykjWXyFvD9D/gb+aaM7QafuLgJxIcZF9DMGVCmb
         gYFA8qYGFi2nPgBsUTR0REz67zvBT2PIqo8TTbobYN84Cjz9W6ZEb2FTzZRf5uXn8h8L
         S+KbzRoPVTj2aLrm5jEjIG44jQb4K5d2Fi6inU7hw60NJeEopIz6wp0Ww4pm5/s80VXz
         IM9B8GGEYnU6ife4LpQ8pXr6oliCSf6zH3hPf4fa0X5Xlt8xvsLzWpmCLBvoy9KvQhDL
         IaNg==
X-Forwarded-Encrypted: i=1; AL+hErGh8pfNeF/VvHNoQk0Jk9QNfVlIV+trpoghCCPIPda5vGXK722/2b2DWQccI/Q3vGara5pYXI61PSwNKTvG@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yx6P9tW4MdCmGGLmjzRK3iZRwNEIq1uVI9/7PZhqkjTCrKuwR
	kHHSBq+M9CGW+NFjnfR4pJ+R9d8WqwP77pDFwnM6OMYuI3497J1Duq+nEOAJQH14ocfaRxajSLq
	Uc9gi1A==
X-Gm-Gg: AZFdTZcMHwLKvu1Glnc2OfbtBkaGW+eBxoaSBnMvXvzZMLCGm1p4C432vBxGMYGcyrH
	iZj1P3pwsN+C1cKLOY1N0PPnhRZNUHGun6oLmUSSZDFz+39uf/JbYDjpz87WyyevJV1VptLa9bU
	78d4yrpn8wL9ryUoRxe8U+PwC5gsSUcCqlbanl4SCQyi4YJ0Z1XUoJGLCzCXrqKmuxwJ2tXJzQV
	3ALMQVuZrcyWGYHLd2UAB1eIyaJTee/tPNjSGmqL2zzn4myD1RO64Wwem/DO6hztX1hOGeaqgtu
	rGy+lzdBNO5rNNLNlaGG7mmBfeGbA0cuS2qTO8L4TalQyItGcMyd6/gxjc4uAPIEHoM9yVtuTOf
	m+dQIeuWtpxwPZYTWtneQApHuP9AtC7iNhL6mZmROI0WKv9RfAnjtY7NKDJn9U4C/acd4EhptQD
	MPd68o8wvVHeIMccF4bC7/3J/HqoNdd7ys+FCra9NjCYpQ6pNiWZ68Yr9xyHvrt8+Kzn77LcTl8
	iUTdhv5Qy2QYmeTTkrzBa1En2KceoRbKTPt6spry5o0DNrrH6cqgM0HVqP/2MfMWOg7vn+I/KgP
	/7S47Ol6hennbWH+SWse51ckKzBraol+6tHUU6LcAWgXpEYe8ZvydhJEeepjVQ27hkvCa1/6Shg
	Ma+oXhX7m4ohFBXsRDfmGLQ==
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr19652296c88.4.1795674267942;
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:43 +0800
Subject: [PATCH 1/8] drm/file: Define drm_show_fdinfo as NULL when
 CONFIG_PROC_FS is disabled
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-1-7cb1d1a5d6ef@chromium.org>
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

Define drm_show_fdinfo() as NULL when CONFIG_PROC_FS is disabled
(matching drm_compat_ioctl() and drm_gem_get_unmapped_area()) and guard
its definition. This prepares for simplifying .show_fdinfo assignment in
the DEFINE_DRM_*_FOPS() helpers.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/drm_file.c | 2 ++
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b302..bcc1b47616c0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -961,6 +961,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
+#ifdef CONFIG_PROC_FS
 /**
  * drm_show_fdinfo - helper for drm file fops
  * @m: output stream
@@ -1003,6 +1004,7 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
+#endif
 
 /**
  * drm_file_err - log process name, pid and client_name associated with a drm_file
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6ee70ad65e1f..6fc3d7060f30 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -525,7 +525,11 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    const char *region);
 
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+#ifdef CONFIG_PROC_FS
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
+#else
+#define drm_show_fdinfo NULL
+#endif
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 

-- 
2.56.1.839.g22a8290db9-goog

