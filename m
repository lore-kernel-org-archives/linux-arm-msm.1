Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674310;
	b=lEnvN1hz/Ca8jXcYUPlIH9/Bzz/FzPF3c9wZO6PornDH+TNvOQkzJktJt+dleqvW6qfr
	 ACbsrwzw62tAOB+CHl8PSQVVu4uNJ17a6o29dYE4o3aPipB8K6f+RSkMemT/vquzUsoP2
	 2NW0IMzzYNMMhGh/CGW+awN0ns6SKq/AYXE+Ct420QCQCkHURCetz3Dbz9Abn8m5Mn/lv
	 J0okDUTs+ftZFK4IOUYJpSAclxj+vyWy8HRJkHwIqOg8IGYls5kKEIcfy7OG144UDlvs3
	 i1p4dcCDzHwFEMtj1lojsDIiZsGPMLuH7oiGr12ybbqOqFdaBPhjwlD9APM28MTERLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
	b=jYmFtCuZItY9JFn3TC1kvwc7xBZwpxqU+T7NZ9kqAY+B7TfpiPGGALjrdb7CkLWXRtrN
	 6usOtjdFxy8cWQM2mno7uzWeTcQ8MHhMGhBlwbMHmqcs03eJAcRRhBx2tHLxIlbPrcL0o
	 D5rg6+CmkzwMrqLwTQr4TV1ze2EI8ha3Vg7YNIMvfNKAdr25XFegYyd09ztLdsoI9IfDX
	 3bL61fAbm7tOgJX1D9pVCOVdu68kj6t8TUsS5PVsaBhv24OsKK1vMfNF1cXseAZ5Q4J0m
	 QNAw+TNdUugs2cbXM4xOReKSbqVAJnKQC7mQqPCZw1sfTVLMA5F1sSP/pspQgoOVZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M4YeWuw1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2A606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E2A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M4YeWuw1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so10346706c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674309; x=1796279109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=M4YeWuw1PxXm0MlRnq22rrdnvINCFUbNrfgDVZakNVVXvF3/qJB8hQZDVX6Z6HgS2T
         RzZB/unnyym9I0arXNNUrzXui9lx4IhyWgN9olICYuD6TwsUTWOkOqqTKwcAFWEToNI7
         FiyiT6MHHIBJ8O7tcs5Ko751fgJDWPZGkTH2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674309; x=1796279109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=xFsIILT/t/inKG/gpV8udqbw0bznA3RExV8Oh4q9dKvCT1rYj43amobsGvAq2wr5o4
         Fcoz5GxOXMrd5FoymugQOAJmyWWVYWKCIvhehmOwdBsXwR8hd5pUy5ZlrFNAQI3saZQg
         kQ/mGsi5q81630doNzzl8PvCzyWS1dclB6umY36Yj2gApkqxzgaZpYY/ZboI8C2Bxi0V
         peg4EmKxWtt/B4V5rZrf/K22Veaojen6l1mRFXPgJxC/9HEXWAREH29U7K1n37jRVDMK
         2ItpwtTO13qTRmb6A0Omk6K1N9x3uyzzk6Uk9Ngpg4fn25MjdQFyn/7AW2KLaO6za+6O
         JQpA==
X-Forwarded-Encrypted: i=1; AL+hErHjDzakuJuigIZ+xttA9ujJN4YmwF7Z92TiLw8VxEm3kJytCvMi4p2fp2oGmXhC3g4elZthDpMedxeiunyQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8aOoHUODfQLCb4VmXqEOtaHbXMcnGnRsHXFtFM0XOeNddIQoC8
	XEq9J8JRL4ARA+MdnnM/gzm4tUZbAWsrstbq+G/qDJKSMIqxaH2KjiSRspmLdno3Cw==
X-Gm-Gg: AZFdTZcrOIn6xsufIyZNg4V+FIOJKPwBJvMecqcU5ousGGkFOMNcl4MobgIKS7mwxRd
	9E5zhMME+1clcDlnxaMXkhYoORDSy4ywezaNVQbmt8+ArLSy5tggPrraYbVQkgl+OdkuTs/NUgy
	5q32P2yksJ5qvmqXxEy69+MrQgSroLScc2adNewfz50pbVIFhrIlmFTxfgpzXAz9Sj2lNcIJ0Tv
	znLGmpkJVT1ERCFDJ0AXeabxStVug1I2AuHecEwf7p9AwA48zCxgKln8u1VX/vwwA6a68R+oMDK
	08GVuXxMlToVPRIvuh+JiBXZorByinYIv1DEj/Xa0KR2Cn/vORQhx4qouAfqV6SCpk/PXdRtYKy
	nqj3Qc3ptSNZzMIzwbxyin9xhLlkPV2m4eVDZSJ6Rm4mtwYrn8iD3m6PjAt+mz4lfrmLeZs05Ba
	O7Gd9oZLbRAFVpyXgdRA6TyK/OpEj9bOcmkmmEtnoX0KlGxO2zU+T7kAfpbKN1sC3uoPzHge6dl
	XfZqzFxQBMmLZ1+cT3iqwQFhjxwKBHV3e45ifQ6znEPVCLzd3cPaJk8xI/sp8Q/HwHUqm9Nt1O9
	CXIolbJxivJBM+/TR9PCGdFaXSjf2EnQj8Y0Qk2MAO8KTixAKaUpPhKW5QZNBEt8zhjshzHr5Ts
	bVMvy6zMxnX68i9WaGzjMNg==
X-Received: by 2002:a05:701b:2918:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b570d52afcmr11431758c88.40.1795674308955;
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:48 +0800
Subject: [PATCH 6/8] drm/v3d: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-6-7cb1d1a5d6ef@chromium.org>
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
 drivers/gpu/drm/v3d/v3d_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index b790be8a7fac..bde3561c0e69 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -240,11 +240,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations v3d_drm_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
 
 /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
  * protection between clients.  Note that render nodes would be

-- 
2.56.1.839.g22a8290db9-goog

