Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674293;
	b=koWAzIQOW28wSD8bdKuD253EzxfA50Og2ttvLnD35hoNcY2fi5NyVFn1PvxyQVYCXqpz
	 wSlr1zGz8jXcDWWdzZBFdKykbT9KZ3yYKUhOSXLo10W1+aGCkhdRCiM3AQ1pA/fnzqBTU
	 iURKz3IpIQ1TptDevV+wFINPSXDWOYKtcFjekNx3dHu7iSXEIilzerGIJfqcjhUe+VcyV
	 kQt4jwVlEY8R8P5m0726XL+EsAcmTERyyKhuUnaHj0Rqz5g5P7bj7+bENw7pKQBhnkMfc
	 Ak5KeH0uyZw1+zrSh2C14MdZB7eZGTDc2/ZQayl2qSx99ANta8YHXxq2pPkFBGmRkdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
	b=XUIFhhC8VJYwFjn3zO91/JiaCK5WBfN6eTE7A7UbMcrMrmZQJ3cNv9QUjd4e0g1IVNij
	 TXvB24VzCABU8dg3GYsWGU0T/qq7uEpqKopsDjR6xYJEQfIConOz9r9F2N0cztqPP8fyZ
	 n25tTHVk45MQsrEBiBBXkw+WdUyTnjE2fpMGXZCBEdwsBe0/DDYfr5d8ZTsJOAguLMXi7
	 dAAFO4QHlXBRB+990saGkYcV3oQADJwe3cvZI8wh3dIMtAPmhI6aPBosood5TYdDRXbju
	 LC7ZhH597fOKMp8AMAlQJyih2KMIMZc88EvpvtZXT/WFjXsYq3kGDUKtmg6RMfjDVWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XtULAtt8;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B52606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B52606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XtULAtt8
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890166c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674292; x=1796279092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=XtULAtt8TBolwO52rSCfEzc2VkRPEHCOT/iznBtjLcvMR/qVj2R8v/ETU8qHmSDso2
         BvZmQ4JCW83Fpe3nDuGrJ1yhogm1K+b/CZtdvHIYa10OHtwF6y8fbDuGQMVcdK+vxCPK
         MD4xbRVd0jQPgWHcz7I9b9mr31qk6AyvAO/0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674292; x=1796279092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=s8DV6kUfnIb9UW3qsSLpbuclOCbzNuwIdlDf9kgX4Z5pzZNwOMcD97HpEOv4u6y+NX
         vzYXteXgvrxTnz2G6Y1t7DrmoLPEAA/iUuejKSaTyIv9cw9S39sONA7n5PuHbNWH4WWq
         V643xcvjEYZ0VfGygLzI4URPw9f1oFNoFvXBqgNziT6z+tV8MZIrIit8o+XdOwv+8Dqn
         owXqK2O0vK+OwoD2RlyRfb4P2nCvKQ0xeubVMqi6vOTATjy+jopPrMoQ3T95oHPJu1bK
         mMeW6zedKqZXrJnE0+EeQtDc/nmDlQAPLRCpIR8FcmHw/Q8i8ruqvWMkICNxRbioYFL3
         GcTQ==
X-Forwarded-Encrypted: i=1; AL+hErEm+IBA8QHNHPD5LrTtZWzRrKbn3t++Y/42f6m1XcZZST+ixCkvRD/vMrbi90d8euYEETcIUmD2u6td81Im@vger.kernel.org
X-Gm-Message-State: APuU4Z9sEq4O7xz9ADq6TqtC6Fuh0tiHGSTC/AchyReqrKZeJo6iYsU1
	DCZoRyHxBLV9ayeO4XZC/N3jWOlyVQwqAbHZjG2XLAvEU8e1SlcsQX2K7l+OO/k/ow==
X-Gm-Gg: AZFdTZe8t9m2oklCg/16ktcOfqgBn7Bm6q0Jh7O+qEo6HFAAAQMGKf+7jnY71rCZrRj
	TGOwcYBzZWzE2+/g+MbqMbd9SFklTv1ekr3IW0fPSSUwsvvGFi/hC20uUk6YIQ8tRwBJAc0oDqR
	ZRT6mdp/IAO4yCiJ4DHaTOAO6UPHT2KhYtPWkQcYb8XUu6xMX3Ydzd17IbZ5/rpQ+TBm209BFpx
	VlM2jpg9DZSFStgXSGwy926uqGsvhyUlKWPf3EcRN0WzM9i53/raeDP3nqsiloyo9TzH4c/YvZj
	SUqaRaPB96BqXL0irAPuOWqGa6YeEvpFZnHF9c1l2bJkAxpYGH/PNGHf8ekImla5h5+j03icTPH
	n1xnDPSitGxPvQHVWfBJ0KEju8DcC3dq93IfDs7dwtDt1cyiq2NDHsC6JylaLc7iv/wJfk7pOpU
	O8wRVlJoh+jt3wcgJzlCNLDmR23CElrLkNqs45OHt/keZ/z84XbtQJBJ3AHeHNyAQEW0H6SKxsQ
	ushvfTlLy19EmeHnI5q6IJW1EasZKDU59a1bpSTXobACA2siukDN37D6H/G+O+hDYeBJaCB27mJ
	ggVdnAr1H8GgbN0qAjQWWW+k155T7kgj97knyYySYnCSdwDwRcVen0X0OjKr3E+OYUYqK63tSCd
	XAwrQRP5C6C2SxoRPAmBiqQ==
X-Received: by 2002:a05:7022:28b:20b0:1ac:f84d:4036 with SMTP id a92af1059eb24-1b55686f9bamr17794762c88.9.1795674292446;
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:46 +0800
Subject: [PATCH 4/8] drm/msm: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-4-7cb1d1a5d6ef@chromium.org>
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
 drivers/gpu/drm/msm/msm_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..06d997a7a237 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -898,11 +898,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 #define DRIVER_FEATURES_GPU ( \
 		DRIVER_GEM | \

-- 
2.56.1.839.g22a8290db9-goog

