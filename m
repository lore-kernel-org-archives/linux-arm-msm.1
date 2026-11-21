Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297286;
	b=125LLH/khSHVlSYJBLf6ejk8aTt/763fbbevze1J1HCpCPa+IoSFzzRNYav2ZIXpMLLO
	 m8pA4NqjrgdxOL6R84VJ/42slE1MOAGhDyKsGwjQrJJS4je6JrX6YoMuINhqg0BnJA9Nu
	 T+RxdfyjEwL6evE/neyBJ19nXcEpJ8VX1NwqQhvEjq7v5h9Z+3OCf7o1D/ASShEinrsrf
	 zraLF9fyL6sGEx11oJzXGy3vY7pIOuwlyZro5Cd/Pyk4/Nu9r8Delzg6koG76Cgw77YZN
	 pWn3/ofT8B2KuSSAq6UvYq7JgihQVp9TBxtQBkaJ6+rj//5owsHrnSuUek3uHmwFK8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2njdU2P0o0owSxMfoiGpvysc8tEsvleUf6yxLSSSXCM=;
	b=v/Jdbhps+vgsIc8Zyygc0oEuwRmk0PK3tTgw5vXR/nHO/Zul5EvWuQB1fdP5qrNeE6Ty
	 mg2HaMtOPyGew9i7/hwFv+qOOEEzxl15KfkBWn0/GxqAPOxl3584gGp/SDTOfniNTZBzh
	 tylBBTES6FhjYPTvuU2iBcnj/XWmwWR2gXm9On7Hv+4cdBEgpO2TSI6c6aa8M3HRwnOz0
	 eGRYQ4QTTyrhrUUedEbZ8n+BLf2MFs8xBtOs020VLNaKNmetdlmRPK5ohWtJ/eEBI88cj
	 mprFu9CZbxDR45JLv1Ora05hwxuzYyUuBlV8sthW3B4xT1mPvQ70rlg8LXsB5kcZT6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sw0TkCc;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87C606A339
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E87C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sw0TkCc
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso14433125e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297284; x=1795902084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2njdU2P0o0owSxMfoiGpvysc8tEsvleUf6yxLSSSXCM=;
        b=0sw0TkCcEve5HC15tE7aSCGs5k+TgF+IqmDqLSrIGuPjkY0IohgPsgQXUA1YlVRAue
         CxjO+ak9gJLRlJAWacPg2xCxx06ZxhxUuPMdcY9WbPqNl1qRd6zLZ82n4KS4I1P1zykk
         BWTFfJNHWYj5HRI/5DtkImzmbMTKaVk2ivIFqXRwGonreIV1E4XzHJPjlUQUldqhtUq6
         B4xf1wtAJp5CziMO2uDfG8T84jLrEQU01wIg2+DAuxl/PDfi0ehzWD1e8zmGd/dFjSTO
         SNneaNksu6jmMQuMFkQ26VPlZmsnf5oaH6iToA1H9C/pppJ5t8l2v+TbRxAdIJcNUAjI
         VLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297284; x=1795902084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2njdU2P0o0owSxMfoiGpvysc8tEsvleUf6yxLSSSXCM=;
        b=Bkmo6qzUB/Gu3J5A9fzjRsgbX5SLVccDuLWmv5QdDDhMzzjivJzL0lHJMtRlxazxil
         ccet52y3Rt4lN9hxOoID8EVFnRF5pZfkN+2gpC0K1RCrl6wy86rnSO2lyyC6GwqmoTzt
         T+sZS8N8N6pMJRiwqJvWSON0Z4sDp0/JpIzCK/emvhsXRzgDxHy8IOV6DMs/IIi3DM30
         MC1KnDggA+pQZEhP04hQuVHD7u9yU9ggiJoLZFuwTmdGU8AVVlAzWuGb9TQw6cy9A/R4
         4PLjoF3FW4eKxjekoo2RNb4BJLJEQfd1RmDnxxH4qTfrFxtmMurB52FNhfQ910a5PSj4
         BrVA==
X-Forwarded-Encrypted: i=1; AL+hErGrF7OuPOgaFc2YEheJ9QNC9B6F7ZeLHt0aNmSoRPJBoDbWUXHXVcRzcGnduD7PCakuqdxAHqE1tvV5qJt4@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Bk1/zRoFSKtMZeb2PHv0yc+phtqBwE3wzdMrM4/s3KYQkH5j
	TxJWBwc3yVY6N6bxvnKW+ihBqjzI55MSJFHRlhjCDzeFS7+xe6TIzg8=
X-Gm-Gg: AZFdTZcrF5RGPt5cokIVztBd0n/i3cWDeyuy88EAhawWK5nV7ydZVcUvTj04YQsSk4l
	2YcZrwmgF8BZt/oJ6JukCb3yUNbULGubqECvHAS6HxFuA5cX2uEZqrVn0Hj4Ux+Iv2sTx/kD+OK
	M400wf/0VFc2XM1RyTbf6hGCepvY0ORmWmHv688MFHDWg6agX9MGBnrbz3F7zOTKfdNA231Vcrv
	w/bT4iRhNH0icaCgKoLkJkcAJ1cf48YREtAm0klW4jxI//H3gT/DcFYtR1RLdITXqbUrgzc6hVe
	3NK8+W9fOLZIHV9mqmoaIkSd84butV/y9yexKOF1HasTDklE+AlJHzqtsoRqmEGSqRGn4MksJlf
	0J2HNEgsl8ygJH87Mkwq3mdiKup0RaRBHMJkDEQ38hOl+IJ9hw1hj4WfyGKAOJK4DEFSMrztB1U
	h4rs4BkEPAZ+1QViPYvCaiHrPbYaC1FbUdrqkP/zBUBmgglJ4U6WF4pHhjd9rVTitxTiQvGN4Ms
	8x1HcxybG6btLkwQYb2PzPRBn2iWtu+yTueQMlbGFFCgSY70wFVd8v4+cmHXYjoaqWC/Y0Cflyd
	6d9HM1T1hJ1X+mhXhv8q97f3aO4aPs4xMgOucFxi
X-Received: by 2002:a05:600c:3113:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb88816a53mr166279085e9.21.1795297283922;
        Sat, 21 Nov 2026 13:41:23 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:23 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 3/7] drm/msm/dp: keep training pattern active until stream video is ready
Date: Sat, 21 Nov 2026 22:41:01 +0100
Message-Id: <20261121214105.32596-4-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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

Commit ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two
parts") introduced two regressions on DisplayPort re-plug:

1. msm_dp_display_prepare_link() called msm_dp_ctrl_on_link() on every
   prepare (even when power_on was already true) and unconditionally set
   force_link_train = true when !power_on, causing
   msm_dp_ctrl_prepare_stream_on() to immediately re-run link training a
   second time right after msm_dp_ctrl_on_link() succeeded. Only call
   msm_dp_ctrl_on_link() when !power_on, and pass force_link_train =
   false to msm_dp_ctrl_prepare_stream_on() so it only retrains if
   channel equalization was lost.

2. Splitting msm_dp_ctrl_on_stream() left
   msm_dp_ctrl_clear_training_pattern() in
   msm_dp_ctrl_prepare_stream_on(), clearing DP_TRAINING_PATTERN_SET
   (DPCD 0x102 = 0x00, which re-enables the sink descrambler) ~45 ms
   before msm_dp_ctrl_on_stream() enables the pixel clock, programs the
   TU, and switches REG_DP_STATE_CTRL to DP_STATE_CTRL_SEND_VIDEO.
   During that window the DPTX remains in MR_LINK_TRAINING2 transmitting
   unscrambled TPS symbols, causing SST monitors to lose symbol lock.

Move msm_dp_ctrl_clear_training_pattern() back into
msm_dp_ctrl_on_stream() immediately before DP_STATE_CTRL_SEND_VIDEO.

Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b896196cf244..779f743f9418 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2616,9 +2616,6 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl, panel);
 
-	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
-
 	return ret;
 }
 
@@ -2663,6 +2660,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
+	/* stop txing train pattern to end link training */
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
+
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce641d7d893..b8373740275b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -632,7 +632,6 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 	int rc = 0;
-	bool force_link_train = false;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
@@ -650,17 +649,16 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 
 	if (!msm_dp_display->power_on) {
 		msm_dp_display_host_phy_init(dp);
-		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
-		return rc;
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			/* TODO: schedule drm_connector_set_link_status_property() */
+			return rc;
+		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, false);
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
-- 
2.25.1

