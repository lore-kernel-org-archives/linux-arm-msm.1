Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108253;
	b=aVF0docWMiEeTAQ0ev7C2VTYotXt9KHSSRrBbJfS85hHZBOmSF+Ycw3kLiBF38r8Kagw
	 MaHxOQFMYgIaibroaQXRKcnuT2VTfzf5qS4IROF1jvgiy6P0iaZNamLHBW9Pojr9Zyn/9
	 qsQ9puskiblvnhsov/voEVvCXihqEh/7Wy5z7OJQvmrRkTjIaTVXtYFNtKqbX+Dg3mEWM
	 gQdPEGyQqTX/3NkwBVxRYb7GAovIvL1sv6Rnh1QxX+0ga16SNtz1g8G1mnTyloVmwcafm
	 InIwhiVpM5/qkFjnhPNWqyeK+oh8NNFMqovQMc2kJFDP4+KKF1JTV2czE3sfMx2aNmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
	b=wHN5ot4Zd1e9Cl1ZwV7uucPWA9bAdn4VVR6vgDDA+etkZyIDsn/bPdAgaQN9hs2F//1S
	 s0FKRQEBT+OTmsa4zfw5YHtfLsFEoCgCiD2JrOY5zHnB4k60nAMLGZ3ywqRR21NYvhanK
	 S39q+rnTl16U38103KsZi4XWTy0ZMnHFyWL0QApE3Lw18yks4Qze86bWlnm3fsxt96VgG
	 b4C7qEuGm2+sYULJi4v/0AloPDcePbJW6tCYF4k8ojDgGU3ZJ7bDbeVGSU90fW0opa3/N
	 HphGUzyetgRQ+XUY9vas3uwA10OP1f12QzclYigo0bovDZ5PrSwV1yZuR4NYgkI3AaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mG9gi0mV;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4EC606A62C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4EC606A62C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mG9gi0mV
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a72bcd6599so50282fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108251; x=1795713051; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
        b=mG9gi0mVOhmiIBP/3pgBNO492dK6aVTffHRtReNQ7WB7JaI9vKdxZordBybyCgYi9A
         zHlzeJxPxphp9kXbZLUbimVG2STDS139JM4lY3nWIEIDtJ1WYFL74oMGqtaEqHse/c5S
         xVMbTDAjwRhjfSUti7+Bvv8ufMOp6qxOjG6Nldh8XeAG4DVeHoxZ8m2lWPya+dSR78B3
         Z98raV0qXLFy7qNzKkmWZEyQEoVRe8Mgy5ge5uj9HPDTVwx2fyMgcgIE7uNGMZ0bTRKy
         LXBmdx6fKdUb89TsXuHbPvV91OOtl5YQ1QGdTEw2yfd6YBebaihJgs2LrBUiHrOo6Gfj
         j0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108251; x=1795713051;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
        b=dYRM260U+aRch3Ej2IwKu60hLKVIKNdUuhFWvM7C+fCFmnt2iT1+V3bYDshbRwIQAR
         JYetmSfY0CtpZvSuHSMkMnjXWq+8nnb9rzQJYf6J5Z7LiGRTAIZ2NC0+zMZDhXhqf+qi
         LsYt2McJLArtxYSd+5wqG9LD9rZgy/9Q9w3qlXZM1hbB+pVTYpx9pyYJna22oEzPsp9R
         KF2oEYLP2bUBjRZbwCFgpdomKLWWKCWj66ZqhtRxWZJsxZLmT8An9rTbX2PQbLzYKBee
         7qnXI4Xm8bFSze2vWgaoEh/OYSsMJG4K+4WM3Mhn5v0PnYtpTJcDFuMltRQ62KYfXZLx
         Hvzg==
X-Forwarded-Encrypted: i=1; AL+hErEcSYGvfIs76vtWIbiGsCbpIT6zIN5HcnMh3D0u332Yy059cgfzVipVkah4ahf16zJtdiwZagFq/COUrlQh@vger.kernel.org
X-Gm-Message-State: APuU4Z+hV/z9U5XMuRWb0YR5MhPbeOzP2pCBS6ozjacxiYdzJhQR+3ms
	SnOHaaTn4efuEujR5swgUBFQUtdg9Uo+oMhxTpWlH9x6FbvwbIotpOU2v8/cCNoqLMPTjnC51Le
	FQieR8Xkmjw==
X-Received: from oadxh9-n1.prod.google.com ([2002:a05:6871:ed09:10b0:4a7:1cc1:e72])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:b14d:b0:4a2:47f6:3cbf
 with SMTP id 586e51a60fabf-4bc7d56ee04mr238017fac.8.1795108251216; Thu, 19
 Nov 2026 09:10:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:46 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171046.1536673-1-irogers@google.com>
Subject: [PATCH] drm/msm/dp: Return MODE_BAD instead of -EINVAL from
 mode_valid callbacks
From: Ian Rogers <irogers@google.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

msm_dp_display_mode_valid() and msm_edp_bridge_mode_valid() have
return type enum drm_mode_status, but return -EINVAL (-22) when dp,
dp->connector, or mode->clock is zero/NULL. If a mode with zero pixel
clock is validated and pruned, passing -22 to
drm_get_mode_status_name() computes a negative array index and fires
WARN_ON().

Return MODE_BAD instead of -EINVAL in both callbacks.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building drivers/gpu/drm/msm/dp/dp_display.o and dp_drm.o
with LLVM=1 W=1 (-Werror) and -Wassign-enum; not runtime-tested on
Qualcomm Snapdragon DP/eDP hardware.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Fixes: 05d001352733 ("drm/msm/dp: use the eDP bridge ops to validate eDP modes")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0c150e2c575..51649b584573 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -759,7 +759,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return MODE_BAD;
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index c1e4147bfef1..dd4e8426cfe0 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -251,7 +251,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return MODE_BAD;
 	}
 
 	if (msm_dp_wide_bus_available(dp))
-- 
2.56.1.708.g77570a6a1d-goog

