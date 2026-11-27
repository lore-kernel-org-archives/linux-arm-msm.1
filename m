Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774468;
	b=sJj7qBWWEjBbrsmVEFkCpzHnGM3MTbG8fasiRgTnjo5keEC2ovZsfnOZGEl+wKb5Ubvu
	 I0sWYpcrbkSZG+egLU5Oxx2jPBDf5JFa5/mNxb5Wa/ZlPfauxVsXdWrxsdw6ccNDxXJj5
	 UG0JEDeUgbV7F3PniVM1OtMomhGZfz62s6IWFnc2VKXdol56DxUgIQZc5sxZ5jIFhC+it
	 cSf6EZA4cZYuqPPjv0FxVXSH25GluSMO8hXK/rL/HyDMUi8FjN3HgUjyElECsJ4rrtloY
	 uhR6ZvmPDhqN5QdvtJAATUaxTG1W/wQWQ9pCyZhYYIn6rMTYZzu02XYm5k9IpYR0lOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tA+J6mGbIT9WLOmGI7WGSCcbG+FEuLz9DTzxi1U99nI=;
	b=ErHA7odW1+a6gCUutqPjtXGVBoPHhk9OUhXGXQX0sAOkHTjc47PSqT8a9c7FBCsL9VPs
	 0CGZrN3NgpKML7USn8jt3OXk5BAOoOHapUnacspUhcSbzVStJsWX96EFQzWBqauEYMyxc
	 bzd7OH2iCZWkkqT8lS5bC0z3NwktSOx41IkxzId+l/7+Mj7eoXzONs10VzLf/j2oN+ruF
	 bBQCiU5lHKj4NzKOFQ3ooLTQfhcxCmaBkcmFIi/Qw8EceaF7oZJVibiCB/7wdDrRFs4OH
	 1tl/7m+JKAg+XFrH7ixebhbwE7gsZBRt27IN9dn5PpcaWr2rbQyQvy2ir1n81HreA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DROkTdgs;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F73606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F73606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DROkTdgs
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso6954805f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774467; x=1796379267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tA+J6mGbIT9WLOmGI7WGSCcbG+FEuLz9DTzxi1U99nI=;
        b=DROkTdgsIXxvIEfby6vSOcPU3NgZLmXOd3CwmJz0216FnmWA8Lf667aB7N/zKVKTpp
         vteBHX4RpS7u7y5UAxiOrY0tatlv+JpuWDO4R49gDD2M8T+Nm9RHqsVemylmyi+9Y8Iz
         DkkWLfUFPn9sE4wZ+mZ88ftD8dvDrgaQjVmBCt9nEbIKlLXpZAdNsmLxoXoPemWnRHP5
         l/NzPJYIzGSka/2bynBrfkXsv7+A52vARD2zwjKB2I+Lyo8wNqYgTUyEa3gdVV2OOysq
         dwgp5WNlWiaKvXIDuk59jAVswjN0zvYnsq4auphsPB2Q6dWWXlaPR395cww1oA5sMjvJ
         WKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774467; x=1796379267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tA+J6mGbIT9WLOmGI7WGSCcbG+FEuLz9DTzxi1U99nI=;
        b=hyH7tfSf2rIXfcCiftfjYXzzsOdJ8g8r40GhzTzsqoACCBy5OcqNccEJIv3rudxYJ9
         3pAd0wvHynSZr78+SoaPpYkkFC8bqaaTdbqwutGpapR6IUDPVRO5cCr+ppWf1TFPrLnz
         HXCBkBhRnGDC4EOIT0Rs5O/8D1A7/zFRTfFdt8cgkB1QdWc1C0Vg42S46fKH18Qla+q7
         QEAeGOmuqQzHN52DTG5BMfqWnyt18hZv5PrKFcpBgTtKbdP523Yor1hcF7TUXXss6hW0
         53vOoCQaht09u782LITjP7u8MFmP3k7NkD50CRiMt+WScl050XnV0QQwx5be21Pxruzz
         JB3g==
X-Forwarded-Encrypted: i=1; AL+hErE6wvBgmue68futHIAC5u8ildb01e5BBi1lLuWPtqJH0INMu2W/RNf6rXR7gZZrl4O+cf/aI/bbdTTvOMJe@vger.kernel.org
X-Gm-Message-State: APuU4Z/bCMfXA1dYhja3I360vJv/8CW+QkNFHYIqXgLTB9y+lUAIodeh
	1peMVKO39OP59PBG8+LK1h+4c3DvK7ntCYHAH7Oj5pjbis/Q9proQdQ=
X-Gm-Gg: AZFdTZf8vtzHpzecwOvnlC7mz/hfVekGH80Vro1Q89lYUB76VkC1UFJ0goVlnRQTS4p
	Q1Aa5hi8Psr7XoLO0DXmysf3tC1kEuU62LIvkSruAtbNZzSnDlS8tCde0wpxwhFuBxqEKicA2Ed
	Lr78o86Xa6yGxnppANhywwYIWayWxGOO/ZPIBrjxfuRa+Q8+PyrYAd75hH+UJrCQq3aLa5BNdGN
	NJvFHCZNX3ID5PB9CYCWsiXdKYmydEHuDmLNjk3UCuS2TOXc8CTmmGgxirz8ROXCyo2YaZYOlNj
	Fxi2tHwtIfY+6WmZUDkopAb1j28V/XgeQmbZiDUNPL4epMWWEIlT8At+TwPV+dw+MZI3+XTkqen
	gqQktn7NQl4Dq9AAh+uRx+KqYHFuWClmwRbbB5B7E5E05h02LaBiGg0C2dOOXFAIzaiaaguyCPj
	eIfgZOIwJOvUAT8MMP7B9esia9sa7Z7OV90kAq+XLugQlqG61WcgBDzxDp8fE3BomGcIit1530k
	0PO95PDThHZzBS5q3Zz8RjzqJKLtdkR+19g+GmyeY/Pv+EOtb6vKl4k2lGcTubStcgspbKCaPsy
	U2C9TNs3LpezRL3nrqXAkXLAbqv06h3WswZjnZrd6YZPqLstHWQaXDl79O409Eokja5zu2dWqLv
	b4MqPDlhVABM+W2keqi+zZk2f2tNxKLRXC3Ld6wpjnr12nXZ+MZxVb7e/330=
X-Received: by 2002:a05:6000:4014:b0:4b7:ae36:5493 with SMTP id ffacd0b85a97d-4b7ae36567emr25594210f8f.12.1795774466728;
        Fri, 27 Nov 2026 02:14:26 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:26 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 03/10] drm/msm/dp: keep training pattern active until stream video is ready
Date: Fri, 27 Nov 2026 11:14:10 +0100
Message-Id: <20261127101417.24303-4-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
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
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> # x1p42100-lenovo-ideacentre-mini
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

