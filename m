Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243722;
	b=JYCk2w7xg4gByg3tYBEnCZOlbcTVd4npn1LLVfByTX2535FBH2/NH8lvkCgnXQt6wiWh
	 gThlsobvvmCAvE2I4hY8ZUtnZLgjN2OxfSZcrZQxbdRyzrmTCEro7Kf2tkLlakRn/q00P
	 eckNSHF2FC+pwozJzzB0sp2PpfmyyLGU4O8XnFfG6hoI6IJPhnD2Msz3wPTS0T1seDwgi
	 PDuHMUcpvMC86qJt2p70D99FJ87qSCO15r7/eYuS8odnvPOm30VAnifKjlFhqvqduwn5e
	 zIELkptqYPU/4UC3ESrsIHigBFVPYdW7bjygnQg6RDdf0GAK/BEst3eA4nt4l+l/LLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243722;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=oG2TQCsxpY9LqxmAzIoNvh0i+sGuT0ezlKI+pPVi9Lk=;
	b=P66E9BX86+Sp1ZPZR8XxnQaz5OV2uwgp/PC0s2sIokL6jRfe4dIRKLlhzNaOdwugYXDA
	 gZDQn/cJaZ8XSL+vAm996a4aoDTX3d7MvDAog5QnMqsYKOGyZgsrWOxNRfbATed3K4r6/
	 YzVSZlfOofQqsMJaGtiHaJq9bBVkkbaV3JhsxlbqgCgCg0GLkdQKAnE4yDUEjWnukTyuo
	 wmFRVq0kvvSchZDHrrwws+HMYoJHiVcLP+KZiDFDCKYd92iwTDRhnJE0821IdshOyUltG
	 F814hhEl5aZlVoJ2H5qiIlgb8S7muCHoHp9Jxn38wp5MbmaXHackk7sUwl2nFAspsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b="Zcz5Pw/K";
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202B606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5202B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Zcz5Pw/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794243718; x=1794502918;
	bh=oG2TQCsxpY9LqxmAzIoNvh0i+sGuT0ezlKI+pPVi9Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Zcz5Pw/K/Nb3lm/LjVL2d3V4Czp5fRaoBS8WWx4EAednhE+aadDUSA8XzrdTKH4H8
	 IMUWYxKkcKrq8Pcc7uVhFZfdOK7aAUEfTNYwrIHy9alzBX8rO2N7WFHE1+cVitlIrp
	 1lMlR5rKPJAbVtNsrCZw8v/qvO6tx4otFbLd4zv/NqpfWB/T5YiocbYaJqex8tnSMT
	 ra9aRsyOZw7BcfIUhrIpYamHV3jtOq8SsQhjbyw06GBOa6F7ds+GYH00uk6x1Aj1mu
	 Hwi4Voenn515X0j6MHHxKI0dZblI1BvrzJpty55OuNQtxvem9kdsdx3oxh/IZZ/Qdt
	 q1BxQ+xZD5sMw==
X-Pm-Submission-Id: 4jNbfr2WvNz2ScWs
From: Michael McAllister <me@michaelmcallister.org>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: avoid an unmatched fbdev IOVA pin
Date: Mon, 09 Nov 2026 17:01:51 +0000
Message-ID: <179424371125.96483.2462884435294600442.msm-fbdev-pin-leak@michaelmcallister.org>
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

Unbinding the display on the Moto G10 produces a pin-count warning when
the console framebuffer is freed. The fbdev probe takes an IOVA pin,
but normal teardown never drops it.

Use msm_gem_get_iova() to reserve the address without taking that extra
pin. Scanout already pins the buffer while it is in use, and the CPU
mapping holds its own pin. Drop the matching unpin from the error path.

Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Hi,

I found another pin-count warning while testing display teardown on the
Moto G10. This one is in fbdev: it takes a pin when creating the console
framebuffer, but doesn't drop it when the framebuffer is freed.

I tested this alongside the other display fixes on 7.2.9, including
unbind/rebind with the compositor stopped. It is independent of the DSI
command-buffer fix I sent earlier.

Thanks,
Michael

 drivers/gpu/drm/msm/msm_fbdev.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index dd6d6c507d..c3bec6719c 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -137,12 +137,8 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		goto err_drm_gem_handle_delete;
 	}
 
-	/*
-	 * NOTE: if we can be guaranteed to be able to map buffer
-	 * in panic (ie. lock-safe, etc) we could avoid pinning the
-	 * buffer now:
-	 */
-	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
+	/* Scanout pins the buffer; only reserve its address here. */
+	ret = msm_gem_get_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
 		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
 		goto err_drm_client_buffer_delete;
@@ -162,7 +158,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	fbi->screen_buffer = msm_gem_get_vaddr(bo);
 	if (IS_ERR(fbi->screen_buffer)) {
 		ret = PTR_ERR(fbi->screen_buffer);
-		goto err_msm_gem_unpin;
+		goto err_msm_gem_vma_put;
 	}
 	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = paddr;
@@ -179,8 +175,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 
 	return 0;
 
-err_msm_gem_unpin:
-	msm_gem_unpin_iova(bo, priv->kms->vm);
+err_msm_gem_vma_put:
 	msm_gem_vma_put(bo);
 err_drm_client_buffer_delete:
 	drm_client_buffer_delete(buffer);

base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.39.5

