Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E66041D629
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388736; cv=none; b=ELCzMI+978BLgaQGz34m6srbfPZES+6GTIAm5R/1TgxLuTSEnEZTwtkk4GsfYzTcD8dZxGif5pSp7BPU8LfDLIdleMYp1iW8MQL5jT4xKwNqE5CzEaDZkMU8vv7ZQRPu5I836iaahnEZW8GfzryiC6BW5kUAqIOZlggNxT4Z1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388736; c=relaxed/simple;
	bh=cymvFEU/9VGyCs1cbUHMtwKPaJPco1YvO8JiThoE8wA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uMjbbw1TnwTQ1QsqCFhmgzJNCrsVcu55mqqNfPpE9Gc6NrGwPa1eIo3RtxzHR2H8HM94ouK0piXvWNQrKWtjQYEVLdrxlqUQozaSnRT8y2ltP+SI6UXGZqzin01lFVCJJYyjjrC9/Gl5CqUaarHIoep2TACS6UOurqjOyxyR0ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quhuuf9x; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quhuuf9x"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so13985245ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791388734; x=1791993534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0+BzHHJX5mfmFv3lfMeqEtJTStmMvjEmJulVgkK3Po=;
        b=quhuuf9x1wNo1qFT99iRrRUZ4DKsUwXTmWwR5QBqiavW1Xo0g0QauLJHVWSbWQg26X
         cjqYJ0sytL/FZ8fgP0vywkcZPr+c3XC1okymKi3/Ntra6GUrnWQNqmi37kxkx0dsJJIG
         eARIvkxHYNT1CZ+xUzv/o8krNajQfk+Q4mWG7UOUWMTSkJoEfIHKdgS8OcLadL15Uyjh
         sM7sPWyWw1moiiZ4ZR3qYKzFkK5uwvI5B7lDJ1QAvK6BqwxVY8S2KUB0i42GqKPYVObr
         JjCKnptrwaaEOzKX4E9W/oLi3xoXgVzPOLwUDdkgDV2LuW6/pJP7W5+//785VbfAxP0L
         6CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388734; x=1791993534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0+BzHHJX5mfmFv3lfMeqEtJTStmMvjEmJulVgkK3Po=;
        b=EClGkkcF9G4rqZtjvn+jx+Uwjj+WRnx7zU9akOgo7+yxQ+ji+I5wEh9neLk4aERmSt
         nlT3hCrcU1V3Jkr7pnfdEjPTRzMbiinXKSABA0nyuULywd+cAFHJHJ0aDk7+91CGwhhg
         7B/JSARb7ZjnWqK/88zNexthlXcNCXGaQ19mOTX6r8Xw2AZTOLwkG8h/WNq75IBiDA2I
         u4MYYrYf+VTNytEpUVN45cIRLLVGYj+wLleQVjQBzArCKYRNLf7OXT8dC4XpHfV4e4uP
         w3vHf+ikRtfm0CFr46aN18th6W19GqLWix5VGfmhippoULvJ+6chEnOyqhS27W1eL6bP
         jHOA==
X-Forwarded-Encrypted: i=1; AKwUvBxQc94dTsfy0Hk9VXFFJPSdRhLGrtyvuSOOCKJWoSC0UH83Fidj1t0AtseUbUUukXwss6Bj+oCVN+hwjlXW@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/mnUGwZ/+dQwHdhwwlpejnybXFsr1DP0ZJpQgXK/MTsGbjkB2
	mfl0O43QNdOu3GNfB3aUpqnKw4LqAEqV0jXeKwu3Q5hvHymaFeZXPYkS
X-Gm-Gg: AYBFou0ifcaYUrZRqj8w7MHtzhKoN/j2+hxseRMm7VtYXdotIW1Rsh50OcY2wDHqenO
	zUoEveyiqD3d2LpXteqhH4GfwqrzgjBgFVobN/egGBbIVw2yUoW/VvRHskC7KdmxmjIIGf1x7LO
	8yknGeGKJZq5QC+V+oOxesQSiExO/8LeDQGBQBChtDQNIIReDDFpYywiKFABfuYm0RDpkUqsJcq
	Wm/QeV8ikOcO9huC6RSaD1/0BVZvCmtzXXInHk4Qxq7zpAiO4I64qvd472j4E1BO9r+FS6wMpBI
	RmfCgvgNbKR4LiJPUMqtX5aTORFSy1RJSxxugdsBvjNdm4Gqbz5g1oB2OffUXJhgJek6qS8L6g5
	N6j23UThicI6XThnrQ2vXIB5BMMET+6ni44amuB5vtmtR96Jqy1o2Ayv6BOtWxND0/Y4uVowSMO
	kbfVisVyeIgWO8+fQBBqkyYG2XNUc2iye1ZtzlZFgV67ZFuTWlkrLzmaKEK/S2IGP7B5QZenp2t
	pgkqYqwNIg/4A==
X-Received: by 2002:a17:903:2cb:b0:2dd:ad74:6d16 with SMTP id d9443c01a7336-2e6004e58f8mr21696275ad.28.1791388734016;
        Wed, 07 Oct 2026 08:58:54 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0c1sm13631695ad.21.2026.10.07.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:58:53 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	yongxing.mou@oss.qualcomm.com,
	val@packett.cool,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Thu,  8 Oct 2026 00:58:48 +0900
Message-ID: <20261007155848.106-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plug handler takes a runtime PM reference every time it runs and
sets dp->plugged; the unplug handler drops a single reference when
dp->plugged is set. msm_dp_bridge_detect() also takes a reference and
marks the sink plugged, and keeps that reference as well -- on every
detect while the sink stays connected. On top of that, in the current
tree the plug handler runs more than once per plug:
drm_bridge_connector_detect() calls .detect() and then .hpd_notify(),
and pmic_glink altmode reports an IRQ_HPD as "connected" too. Every
extra reference is leaked on unplug.

On a Lenovo TB323FU (SM8850, DP over the USB-C port via pmic_glink
altmode) the DP controller's usage count reached 28-34 after a few
plugs (rpm_usage tracepoint), so the controller never runtime-suspended
after the display was unplugged. It in turn kept the MDSS core GDSC on
while all displays were off.

Make the plugged state own exactly one reference: the plug handler
only takes it when the sink was not plugged yet, and detect() returns
its own reference when the plugged state already holds one, or drops
both when it finds the sink gone.

With this the count stays at 1-3 while a display is connected, the
controller suspends 3-4 s after unplug, MDSS suspends and its GDSC
powers off on DPMS off, and replugging (quickly or after 20 s) still
brings the picture back. Only tested on this device.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v2:
- Drop the plugged state's reference once, after the if/else, instead
  of in both branches [Val]
- Drop the comments
- Link to v1: https://lore.kernel.org/all/20260929130627.959-1-26rote@gmail.com/

 drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..4059cb9dba64 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,10 +412,12 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
-		return ret;
+	if (!dp->plugged) {
+		ret = pm_runtime_resume_and_get(&pdev->dev);
+		if (ret) {
+			DRM_ERROR("failed to pm_runtime_resume\n");
+			return ret;
+		}
 	}
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
@@ -897,6 +899,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 	bool phy_deinit;
+	bool was_plugged;
 	int ret;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
@@ -910,6 +913,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 		return status;
 	}
 
+	was_plugged = priv->plugged;
 	phy_deinit = msm_dp_display_host_phy_init(priv);
 
 	msm_dp_aux_enable_xfers(priv->aux, true);
@@ -962,6 +966,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 		pm_runtime_put_sync(&dp->pdev->dev);
 	}
 
+	if (was_plugged)
+		pm_runtime_put_sync(&dp->pdev->dev);
+
 	return status;
 }
 
-- 
2.43.0

