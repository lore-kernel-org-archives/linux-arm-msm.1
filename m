Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227536;
	b=sJn2SQrhxXy0f9zbESRdV9TIyU6XcLLCKjctFhf9kionK2iPJbPY0Cb2G8an1YHkTWHC
	 SdynWKsu14WkX5qHN+OiH6ktI8lB1jauOyigMqeVk7nhEx9yRa1/qtTrno11VJhQD90fA
	 K+Vzj6w9vnqCWa3ldGQhfraS2A/F7HsZrKAD/5VyVYHd5Fi4H6teEq7Qmypc0dHt3XVNF
	 Qc/Nk2JpORnbhSatcTjM3N4RRficVUaMCP4mXlDAgl8McXZrqJXsOo+H270Y9WdnJ1+x/
	 a3ZwrEvqtfnQErTtaQgagFcR667gI1ykcim+yrAfzoJ1C6OLFRw1W+O1U4kVcBpACwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227536;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eerlHc+2nw9LU1blteBgbDf72O/+xt2VeIxgqcPfxtY=;
	b=3zuabJhmi0uwMLtEbNlhCpvCFCX2+b2upDExqhrYxZHfQs13kRTb0V5Qa0fkWRksvArB
	 TRoaodqmUoUE391I8AihCybm3yE56ILWawA/IQJ2VwBB5hvXCnrAiL32WOEyajuQB/gk0
	 G/TWusCIRoM2Q63XSi/di58ROCZAkV4BCRdGq/r8StSAO/cxlui9mtfDz8aXAjo/TVj09
	 56HWJdGRC6UQigI+tFhQvPmEbau129DJqONlfkhzrrXpxelIol/xYiJdN5wCERUfIvq2N
	 WOolJSxZ0Uwjt4YA5zYemZh8W+/UQnCERANYYTfU2T8iQvCxQcV55eMSBOfFvY0DPZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5MBBv6Y5;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18234606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 12:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18234606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5MBBv6Y5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794227533; x=1794486733;
	bh=eerlHc+2nw9LU1blteBgbDf72O/+xt2VeIxgqcPfxtY=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=5MBBv6Y5HpHr3wguQtHSBZaHetMylu67S5tbrJtq9xyxFfFjNu8/uBGd1+RNzDsYl
	 MjN1jdQRTG8BMp3We6zvMpRGVYYq1FA5lmyE9gEiKOFPf4ILHQm23xhGIl3wz26Ej9
	 x8QTTpJYMBNWAqOJchCYkaMyyD9R4MP9lsDuhSGIP3hEcj5Qh7Eb3xqmceKyfXOMm7
	 aKGkXW7/NW072roRpMqRcoAB/BUx1QnMX8NguugA3OaP8qazwGbBR0wxRhnROUm0nf
	 JDclYc0VCqAAqKNTz5bDFh7+F0Ccf8o6edAX3zjuWP1pByPCSxbxmKf2yhzZ2JQMqe
	 o55mTh2+LBgMg==
X-Pm-Submission-Id: 4jNTgV4YVsz2ScQG
From: Michael McAllister <me@michaelmcallister.org>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH] drm/msm/dsi: avoid pinning the command buffer on every transfer
Date: Mon, 09 Nov 2026 12:32:05 +0000
Message-ID: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
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

The command buffer is already pinned by msm_gem_kernel_new() when it is
allocated. Calling msm_gem_get_and_pin_iova() to fetch its DMA address
adds another pin for each transfer, while teardown only drops the
allocation's lifetime pin. This leaves outstanding pins on the buffer.

Use msm_gem_get_iova() to retrieve the address without taking another
pin. The allocation's existing pin keeps the mapping valid until
msm_gem_kernel_put() releases the buffer.

Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Hi,

I ran into this while testing display teardown on the Moto G10. The DSI
command buffer is already pinned for its lifetime, so this avoids taking
another pin every time we fetch its DMA address.

I tested this as part of the G10 display fixes on 7.2.9, including display
power cycling, suspend/resume and teardown with the compositor stopped.

Thanks,
Michael

 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d92659d80f..64fc54dff4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1428,7 +1428,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *dma_base)
 	if (!dma_base)
 		return -EINVAL;
 
-	return msm_gem_get_and_pin_iova(msm_host->tx_gem_obj,
+	/* The command buffer stays pinned from allocation until teardown. */
+	return msm_gem_get_iova(msm_host->tx_gem_obj,
 				priv->kms->vm, dma_base);
 }
 

base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.39.5

