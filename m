Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282015;
	b=UV6Cj7PZmnUd/S2hFs+n50XHj5NKdNR7xVJ0+RVx4/1hok/gyIG3A2rxHHPbv6UKou8e
	 9eQOLvZjuorzd+sZjgVKf+vn6rCIiNlSY8NoJnfPjArHbs8ZRg8QugXaSncdJb/iyW/65
	 +hZ29JYxmKe+3vTmv/oNEv2XqhSvlnVRXCDKM19zbYa3EcNrcCcZrBLOYtX6TJpPt6apg
	 AYnWnsSoiaFfry/D3iIlf+5ezvLvVPChXkoLbob89/Xd1FqkK1rn2cTHBWvimLZpHa4Ch
	 LTHGMw2eS4UnN7PaIz9CCTiQjeX/YXLjKLUI/lzwz14x6Y0k9l1oyYSHmQ7KH6Ro8mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
	b=hI1NuPd0fcpRRRVwFhurz1e3LMZygBhsdkRscUQqfuYMbYOc5cJRU0aLZlWY8yoFSCuK
	 9S40bxofxUmJjvL1sn83kzDNUmCwSMSziVRx/RO9Xv3E7kE1lNLoZa3zSRfJAu/8hmOCT
	 Mwnrr//kf75R7+Vtx0EXEtqlfjeShDO4ZIok/fqGgyJmDeL9g4ffoFR7PAyTLg9g4Ty/G
	 Y0DWciDd72Wjci3ga+MXMVlzUvRNQ6TS8VXKnav46IoftSzOE858KbKsKIIqBHkReBVjv
	 tHWSF21SU6/S4EYHLsUmKnqCbWb++Yw5A9Mm4xZ8Gom0MHcFZcgpgRN0CkSUMaL8HIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA+IduUU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2587A60A2631
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2587A60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA+IduUU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso15190855e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282012; x=1793886812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=jA+IduUUd+0hPug1YrCr2hXnLaqTuQd1EZv9dP7d4Sc8lmFIx2vkY+aa9kMfSFwUYr
         eurhjOp0+aypsWUWPZn884DphWWF7ztUHl4GwspHS2YYjZyHRNZRF0M9YVjkmLDDn6H3
         8tfdykAeOkHCWYqwf0Mef/gNymZ+4U/xnV7I9HLX4G9xOezzU3gbAUH2+ditvx7X3n56
         Fz8c/IV3qFpCkXIGkQmO3IJTeJ3O0223lT9P3mZsewgSRVzlU/lyCLaMMwCkkqi99fL/
         ZqOhp/OZo+ewreqSL9tmfITtu6nY9T66VGVBr6Gj8RqsfGT3lciOFidl1wvy84/+xrap
         yWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282012; x=1793886812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=di8FFXt+7vH5gfYVYXteeo4wVuKU9N2jDIanPPy0lSg=;
        b=Vvz7GHqDc09GxFbqavG7l2b03I9Jmc+i5VCcLCjudpfnSpHRKdD6Muv5YXLmXHihRH
         RtFGm4ZKZiMIbfMWYFpi5O9+yzb7dr/9ZMACv6XnY3Lri2u10znuyCbkaQkfo6z4Tccw
         NT/6SsTVO+ir4d8s2RvqkSX264daDHqnEXAI773OFdSRZyeoravpB+rBeMn/Kobgzb8q
         q6J9W+OQY/EMFGb44lrsYQF9tjI002GHhaU8/PecKHcHF7SD4FiPe3goOUxlKMCQUD7T
         E/6BA3XLkdnMFqrxhOcwpFWwN0F0w/5mbv5dbqaoyIMqn72HR6oc6O2yOcOcHSA4D7ea
         o+qQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7DlToQPAwK2Po9u/VI+pbEI+4ZcM04oiJGKkYytL9gn7uyz1osqFB8dFeq5qRp+iX4BoyZAo/R3P2jRBg@vger.kernel.org
X-Gm-Message-State: AFq9FYLl30iRRowvHtsk52DRVJq9mdALaKNlsPSp4Hh1X1G7tpA+Wp1t
	gIBXyA3KsjyTz+aCNn4qsP2dP8Yxmnk78kKZcWiYuj8FtvVT97lcE3E=
X-Gm-Gg: AYBFou2LUmE26r6t/jwqi33gX2h2WOO4RTy4xKBtXD3R75KCf12aIVjDBSUXc/RjYLb
	68/sGPabjLoS9PW57fSPxcHHSyb+kvuiy7i/WdmSG9PEz4lkC4WZcpaUN6hpDE7nOnxhENLiIRH
	Z/hs3YKH/1KNd3646WB1xSWq2Z7tpjsE4hdERroN6Owfsd1NBEBUWKe3rMCkCv0eJTAm/A/jE57
	yg9SDdoXIdREvgfq1xXax9iwyrYM4m+FjNd604ylRVd4jiB1dR4w/6KYoHQMFvuqDXz6agrqTcS
	5NtJoIbljBE+/Ndj32GZUQRoFziZBoJEFcUIRELFiFDrNXE7JSrC69tghDd7C8Wi+LTX4aWGOG/
	oS1OqXUBJF8DLH82pAYiuTMya8BiSiY5mrOGBy7cU/Ab/s/psLfIvGviNga2RNzb4TMIjs9boMM
	Q5b3RjLnwZw5wYtqugmIsHqCnzhCg1zi6nrZkMxpk0pXlBZ5H0jFYv7X2oe70wzwNVVqjt1WQVK
	0q+v+iZDPyTCW5fYLANpB14I8lLDA2hjadG57IPomZQs51kFKHvlzt8QcrQK+/RIDETUTvHBxkO
	Zl73ooXXdgyGn3xuB/Ls4oEWWlBv8z05pRgneyS4On7vaw==
X-Received: by 2002:a05:600c:8b38:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a966c4062fmr131340985e9.14.1793282012331;
        Thu, 29 Oct 2026 06:53:32 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:31 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:49 +0100
Subject: [PATCH RFC v2 12/14] drm/msm: add lpac ring to devcoredump
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-12-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=SjlYjQ7B06EmsCE9KnnMd2bONmqc/uyNMNAcvp2x0Ec=;
 b=Y4u2ENL4nkbD0aM3WvJ/ELGPfCSRXNJvoXA78hkmUU4GFxXHhBZNuc0iEh6bPVi314GSCwW/2
 pbbFXwlzl23AkJnsI3vrmGEICHfTAEqdZf+4MgQRM3PA140b5G6lp9N
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 085e1b9044bc..1ce172e5f73a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -785,25 +785,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	ktime_get_real_ts64(&state->time);
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		int size = 0, j;
 
-		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
-		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
-		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
-		state->ring[i].wptr = get_wptr(gpu->rb[i]);
+		state->ring[i].fence = ring->memptrs->fence;
+		state->ring[i].iova = ring->iova;
+		state->ring[i].seqno = ring->fctx->last_fence;
+		state->ring[i].rptr = get_rptr(adreno_gpu, ring);
+		state->ring[i].wptr = get_wptr(ring);
 
 		/* Copy at least 'wptr' dwords of the data */
 		size = state->ring[i].wptr;
 
 		/* After wptr find the last non zero dword to save space */
 		for (j = state->ring[i].wptr; j < MSM_GPU_RINGBUFFER_SZ >> 2; j++)
-			if (gpu->rb[i]->start[j])
+			if (ring->start[j])
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			state->ring[i].data = kvmemdup(ring->start, size << 2, GFP_KERNEL);
 			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
 		}
@@ -1004,7 +1005,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 877f88ef90d9..6b05c2d45bb3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -640,7 +640,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.56.0

