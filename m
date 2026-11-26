Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712751;
	b=0TDq9rEYN7ZWY6EQbc8QMpKhi4vaPg04QiGDP9oCYMZIdH5rNmLxWXTovGFdjEwG8Vg4
	 CtDfTJd3qZZazZUO8nVQBR7JbTLl4G4BPb5WhjAGypbfDHx1gemFjC1srtTkEEs6uIWU9
	 LtvPoAHNoRhpEFwunydPl5Tfh6iQLoFfwajmKM2jeH055cPrlc4H1PHcM0o6JtvrLAiU2
	 hvBEoZCAVOQTQWZfg/V7oqJT+eJtUoGQU2Thg1f5WRl90sNpg0SPF9VbxgwRvGmhp7g/S
	 ywPKdewidzyHReayhlSSYT42tUAogCt5VTUkhT5lc3ML+iJ+oDPLysGqxMp28q1lNtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712751;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yg65JGwcrMTp4Xs9zqZhDkeQCmvP3MpmYYEyFpYrG2k=;
	b=qeDM/9R2nqreJLCTazVmuPRudbeKXjVTas+/J5ulwayWTjXmhbW1zZKd6/YMUijUsjjU
	 WpoSGjgWyi0sovidTd+GVsNmaQH/ETRfF7RaCbF0rmkVgqbC0og0bts4qRvxHQ9tD3vFs
	 57fAqXqqvlk32NNNElKehie9AU70V4NCzKxxfXKIyAm0ANMxH2RtBgJGeA3oZvBLKh47Z
	 yrlvG6XAKpMV3S6RQ88O4ZaDtGlDXND3r58V4zOl5FcbxHbvxUtrwWZq+DfebzOWnnIUL
	 1rA2rJHHbQSxEbY5S9uf2rubFDqZaGFU2I1yqAPX/usFP2Ew8qqPloR9lRypuyweDHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHuJDZsp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC4606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHuJDZsp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAD1F000CF;
	Thu, 26 Nov 2026 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712751;
	bh=yg65JGwcrMTp4Xs9zqZhDkeQCmvP3MpmYYEyFpYrG2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JHuJDZsp/nrZlLIhLJ1ChA20B2YYW968lb/mW+tT69g5fQTAfE287+Qa8qHJcr/gQ
	 jwKwbHIZ7TvWfaCgPL6PjmGiOd41mUL29ofABH0BvUb2HtyRzPjsAd3bt5Hyo4dsM9
	 5Bt+ukKOkoIbjVfSt6rGMq6/IsJW8ice9t1GYrKtMa122yKvGogFq61KF6EFtxdRMu
	 U3BFZrTSnH25rRjWekcKrhT4/E8Iau8SyaJ4W1dqcBKPHzsb0OqUuGYSOuspRcoeTh
	 eBTDU0feJliNAUuK41mT05Sivpfz0nxDcyVLCCWNumUBit1p3gWaeXwCAdOLKgjzO8
	 GKqohEcJLruDw==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: fbdev: Add the missing VMA reference of the framebuffer
Date: Thu, 26 Nov 2026 19:05:35 +0200
Message-ID: <20261126170535.361985-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126170535.361985-1-vz@kernel.org>
References: <20261126170535.361985-1-vz@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A VMA reference of the framebuffer buffer object is dropped on the probe
error path, like msm_framebuffer_cleanup() does, but the reference is
never taken, and the VMA reference count underflows on the following
deletion of the temporary GEM handle.

The missing reference also affects a successful probe: the KMS VMA is
torn down, when the VMA reference count drops to zero, which happens on
deletion of the temporary GEM handle at the end of the probe. Then
fbi->fix.smem_start points to an unmapped address, and on fbdev
destruction msm_gem_unpin_iova() finds no VMA and does not drop the pin,
unless the framebuffer is prepared for scanout at that time.

Take a VMA reference before pinning the framebuffer on probe, like
msm_framebuffer_prepare() does, and drop it after unpinning on fbdev
destruction.

Fixes: eb714953c441 ("drm/msm: fbdev: Use a DRM client buffer")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 25e55b5c5ecc..b5ced6ede19f 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -50,6 +50,7 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
 
 	msm_gem_put_vaddr(bo);
 	msm_gem_unpin_iova(bo, priv->kms->vm);
+	msm_gem_vma_put(bo);
 
 	drm_client_buffer_delete(helper->buffer);
 	drm_client_release(&helper->client);
@@ -144,10 +145,11 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	 * in panic (ie. lock-safe, etc) we could avoid pinning the
 	 * buffer now:
 	 */
+	msm_gem_vma_get(bo);
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
 		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
-		goto err_drm_client_buffer_delete;
+		goto err_msm_gem_vma_put;
 	}
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
@@ -183,8 +185,8 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 err_msm_gem_unpin:
 	msm_gem_unpin_iova(bo, priv->kms->vm);
+err_msm_gem_vma_put:
 	msm_gem_vma_put(bo);
-err_drm_client_buffer_delete:
 	drm_client_buffer_delete(buffer);
 err_drm_gem_handle_delete:
 	drm_gem_handle_delete(file, handle);
-- 
2.51.0

