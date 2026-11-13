Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590639;
	b=h2HYxqhSrbic1GNCXZ0aoiaTa/a1xAKCN2nTxuDIkbvXDrXKsm1JcEX/uf7CwXPKKEXD
	 +AkZrRm8W5aC5o0j4NTRLiCLr233z+VlINb/6hamXNlpL2//x259vGB25s1pxjGw2DC0l
	 np5GxsrYS+xLAEJvF3cN/iwdIfgm13uJ8ROOCXZWHHlIYUQEgsiC5zGr9StzNZmzbwgit
	 7p+jHA2mPuPYe5Gshrqwx9o2W57dbBVbWLVFLgqMFqcJdDx9kkJ6eKl976bPHUCITMuij
	 NPJduOEjW6zgba1eNe/OmCDMZjLkp+XhtPadnorpo27YxCpRJKLzELf1zJ4JlWDCo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590639;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NMDZysfT7XZcy4Vr7EExZgccS2DkId56v85Kwhm7tdY=;
	b=EAmI3J9VZbodElvZVkRwyJVTZ9Cg1mt9zd8Eseeus3n/Uw9l2vt0Fpl36WUCBxk+uO0l
	 LSWu+kt9xyAz3PsmJ5rvga1rEB7nBRl031Zr+V/Th5TioHPJFcFmmG2nK9Hkr+OyoVxAi
	 HullSmvNd+d6yOk1EoyTvU+hS7ssp5DsS/dnRTDjGbYZTfc1Dly+kLTzHdUZ8IZ5rF2Zp
	 WR+PpG313+mulajhE5OFhJPIKIB4iLXnYrpOumVNffNIbMIOYPZOhDgyKYu+ZRxYrdeNB
	 880f1aIqhSEe2e0Aqbo8OmqLHG6IsiLW6aiDIGjvt9L7WWOMmBoSWnQJ3Y0FXxiqafA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=4+QetiTn;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D360A263A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811D360A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=4+QetiTn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794590635; x=1794849835;
	bh=NMDZysfT7XZcy4Vr7EExZgccS2DkId56v85Kwhm7tdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=4+QetiTnG+aX2TZxE6bU9DMiGMtNKo/HdPNtutcXNz4P6tFfGIAyjhy1BB2KUcGc4
	 hegf7JEySkjUyXagYmUxQOqjvjKXfaAJFIEjd8iIV75xeeqQT6JzBk5+wEHyTTHA2G
	 9J8tNrGtr6Nc+d+CtgWm3aOqHQq6iPIy5AWCZiJGEowxWRoPd5fz7CRuVAQeoPS7dX
	 c6d4x6S8v1qokmxvWr/NYloOZwwenDLVzGy52ecaZB5ZYyommQKTvwYeF875ycHTmC
	 3MW3BceSK2IgkE5OzRKw/siR6uWEriVNcxJR3vtzmLryDEqdWnieYhQdDiHjQyAvDk
	 IEsgfwaVfAm0g==
X-Pm-Submission-Id: 4jR3yJ2ND0z2ScX9
From: Michael McAllister <me@michaelmcallister.org>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3] drm/msm: release the fbdev IOVA pin on teardown
Date: Fri, 13 Nov 2026 17:23:44 +0000
Message-ID: <179459062437.56042.7618212515796640496.msm-fbdev-pin-leak-v3@michaelmcallister.org>
In-Reply-To: <179425722110.3461.10554987541005946397.msm-fbdev-pin-leak-v2@michaelmcallister.org>
References: <179424371125.96483.2462884435294600442.msm-fbdev-pin-leak@michaelmcallister.org>
 <179425722110.3461.10554987541005946397.msm-fbdev-pin-leak-v2@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The fbdev probe pins its buffer, but normal teardown never drops that
pin. This produces a pin-count warning when the framebuffer is freed.

Keep the setup pin and release it in fb_destroy. Drop the object pin
under its reservation lock, since fbdev destruction can be delayed until
after the KMS VM has been torn down.

Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Hi Dmitry, thanks for the feedback. This keeps the setup pin and drops
it when fbdev is destroyed.

Changes in v3:
- Release the pin during teardown instead of removing it from probe.
- Unpin under the object lock so delayed destruction does not need the
  KMS VM.
- Keep this patch focused on the pin leak; leave the mapping and probe
  error-path changes for separate follow-ups.

Thanks,
Michael

 drivers/gpu/drm/msm/msm_fbdev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index dd6d6c507d..29f5dcabc5 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -47,7 +47,11 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
 
 	drm_fb_helper_fini(helper);
 
-	msm_gem_put_vaddr(bo);
+	/* fbdev can outlive the KMS VM; release the object pins directly. */
+	msm_gem_lock(bo);
+	msm_gem_put_vaddr_locked(bo);
+	msm_gem_unpin_locked(bo);
+	msm_gem_unlock(bo);
 
 	drm_client_buffer_delete(helper->buffer);
 	drm_client_release(&helper->client);
-- 
2.39.5

