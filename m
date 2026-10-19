Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81163B442F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386916; cv=none; b=Uc1vYVxz1zdExBvGGIqT3504jpDgk7/tEn+qUw7HU/qEGihxJjgSUNABV34AIrmTU3watzdQnWv5d6Q8M07xtjWvHIZ/tOsmzN8wQeU3JnUL/k8UQ6DRAGrkrYCB+tMYk1rIbw7jnkNFXKc9BZdNsJhkrc0eZ+mHlLVp4TZo+0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386916; c=relaxed/simple;
	bh=yKBiV2TVmIrIrto1nX+VHaD3QQAFX1+y3fbKBijLtFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/aW36RkO4OTSP/9OzRx85hQO+7dDptLxpZzsyTc4+PVGGiJtwIWPhTctkfUaQ7QF5zgQjkCAQ4pa3/qNxPDlaGPzGJk2oAT7PEHwfGtsptyX0HIqdmio2RGUKPW2YVDVjFjnnlAfaddQFw/8eI+YfYeh+2GTQ98IscsuvGAiEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3GkocEZ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3GkocEZ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so2538441eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792386912; x=1792991712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHIoBpNvmoiyE7kQhE8I3uJMHpFmjXu6J3zrCSHKMP8=;
        b=S3GkocEZQIloiestPJSmOvSFrAx/orijOrO2lzdmkVBKLiTxaoZhsmGfdJS2hq/tbX
         d4RhO2K7dEVIyjlCuCiITjdYAiLaw9oYHTbsCkeqwZPtRlZROg/SR3Rlplq9U/LWKaBl
         dFr/Mvo9lNJZDYUk0tD6yPwgmmpqYV4JMBd9eDQbaKDs0iEQ+DVHgSmHQZfonkNysAbE
         vHm869iPaveBQcYWZI6RYvWHy3socBOBWjBc71vl+Zt02QlSw0P5Z/a1i7TmgcjOta35
         vnPYO0uTS/bb5J5p6AoXz0cTVIP6sKiY8JsNDmrhXd1WvEV2rnFY7N1p3l5pg6vON9HQ
         yrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386912; x=1792991712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHIoBpNvmoiyE7kQhE8I3uJMHpFmjXu6J3zrCSHKMP8=;
        b=M5KiBf6QHhADJF+EyLZYPqXGTAtBYW6F2NajPpgMxOs7sCTeJzm3ODJKxG75rdYK6Y
         daQfhYT6rBWyayuteCYk8C1O8uZBmpUGuAzYdwMgyrfaHp3fCD3lUZfzIoIh1QSL9GPp
         ndawehWVFpdnlbWQoRPYTwhihcJ0wCkN//vdoTA4KlWgSujl/VRmzOnCRf0+5IM8uOrv
         vwaNNbpbKGJsv6PdI6CpKwJnfEC7lXcL92g6/1qCCXt0rYpDcwW4C9MvcmRX3oRc4QZP
         OrclhFIa/gaE0meFDTUNrMpGAiv+4eh+j0XIGOl+zHnVuG+p21zmiDXOOD+XzpYtkXob
         rkiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGNsUWVAcPTpa1Sxy/8DPuZjS991CAquahO0ZokonJQq+9CCzEbooIHJ48hTekE/WVp5QTIebfJrbufAD6@vger.kernel.org
X-Gm-Message-State: AFq9FYK7I4ZnSFNujDtTI7UUi5I94LGXnnrfyjosisAbPzdo2Cx0sjye
	6Vz6tndcHaE3wEWe7gdtQc6mJ6zC+UKu/lyaWUGyy3j0aLMPFPPzc5X6
X-Gm-Gg: AYBFou0vPLqL/i6ewEgs0vDGx0qRthxnGxWUZL9sooSb3T1ymqemfuYhT6VZXGYFvyE
	eQOv4q9y6vbCDYz96ypSU4CvvtwqUdsCiaDTsL0ejYzEeJCzEInaQJ/sxLcr981k8GFd9gAVDzJ
	ZhchC/0oVHG6QxkWM3tciub1Uqt+SsqfDcJLZ9koHY6RJ9IXpHmyg6z+YEdvGm92enLQV+V5j4Z
	DNAWnLUPpSwOUWFSCuyVtmlzfq83r+Oc++hUXukhDUb3Tb1tUwB+pvL0Dt/sZi24eqeQ4lj3qvD
	dy4kqKt4CdD3kiQNUAoO04Nlhyz7BTypFOPo/Fgvw88FyfzcuB0d010idjvCMWZWgC2Z7nyZqRB
	XIUF82w9N/VRWxVQn1hRSUgoW+KVl4CMD9oi2wolXpUKnkf2a99PA+6hWPeaQNETE6sFoGbw1Li
	J9GBuLlktueb8hGklabKjTw15kPqsrBFXhhfgE0XEjAAbMCRLJLkC9/2P4/bqpAuTfag8GT/YBm
	ArtPCA068C1ykkDxUaslNks4yRi5T9Ep47O0ULshG9xv/9CnUkvhW1k2LFN0vgwNgRCqEq7D0Ia
	usQkcFIaYmyZYncSPxl2lnGoDVbGMbBctPBD6mta
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr9965350eec.7.1792386912356;
        Sun, 18 Oct 2026 22:15:12 -0700 (PDT)
Received: from flyingfox.tail3d542a.ts.net ([2402:a00:163:2ce9:6c87:7904:21fa:8675])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm47588803eec.28.2026.10.18.22.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:15:11 -0700 (PDT)
From: Vivek Kumar <vk092kumar@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Vivek Kumar <vk092kumar@gmail.com>
Subject: [PATCH v4] drm/msm/dp: allow eDP sinks without DP_SINK_COUNT
Date: Mon, 19 Oct 2026 10:44:41 +0530
Message-ID: <20261019051441.2835682-1-vk092kumar@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some eDP sinks, especially fixed-format eDP-to-HDMI bridge chips with
no downstream AUX-capable panel behind them, do not report a non-zero
DP_SINK_COUNT even though they participate normally in DPCD capability
exchange and link training.

Treating sink_count == 0 as a permanent disconnect is valid for external
DisplayPort, but it breaks eDP probe/enable paths in
msm_dp_display_prepare_link().

Use drm_dp_read_sink_count_cap() in msm_dp_link_parse_sink_status_field()
and set link->sink_count to 1 when the capability is not available.

In dp_panel.c, msm_dp_panel_read_link_caps() still reads DP_SINK_COUNT
for branch devices. That read is left unchanged here: the sink on the
tested board reports DPCD 1.4 and does not advertise a downstream port,
so that path is not taken.

Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
Assisted-by : LLM
---
 drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
 drivers/gpu/drm/msm/dp/dp_link.c    | 30 +++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_link.h    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 5 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4dcbd9b99d06..2ae4dafd755f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,7 +290,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 			return -ETIMEDOUT;
 	}
 
-	msm_dp_link_process_request(dp->link);
+	msm_dp_link_process_request(dp->link, connector, dp->panel->dpcd,
+					 &dp->panel->desc);
 
 	if (!dp->msm_dp_display.is_edp)
 		drm_dp_set_subconnector_property(connector,
@@ -506,7 +507,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	/* check for any test request issued by sink */
-	rc = msm_dp_link_process_request(dp->link);
+	rc = msm_dp_link_process_request(dp->link, dp->msm_dp_display.connector,
+					 dp->panel->dpcd, &dp->panel->desc);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
 		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 34a91e194a12..f7f25020cacb 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -715,17 +715,25 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 	return ret;
 }
 
-static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
+static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link,
+						      struct drm_connector *connector,
+						      const u8 *dpcd,
+						      const struct drm_dp_desc *desc)
 {
 	int ret;
 
 	link->prev_sink_count = link->msm_dp_link.sink_count;
-	ret = drm_dp_read_sink_count(link->aux);
-	if (ret < 0) {
-		DRM_ERROR("DP parse sink count failed\n");
-		return ret;
+
+	if (drm_dp_read_sink_count_cap(connector, dpcd, desc)) {
+		ret = drm_dp_read_sink_count(link->aux);
+		if (ret < 0) {
+			DRM_ERROR("DP parse sink count failed\n");
+			return ret;
+		}
+		link->msm_dp_link.sink_count = ret;
+	} else {
+		link->msm_dp_link.sink_count = 1;
 	}
-	link->msm_dp_link.sink_count = ret;
 
 	ret = drm_dp_dpcd_read_link_status(link->aux,
 					   link->link_status);
@@ -1025,12 +1033,18 @@ static void msm_dp_link_reset_data(struct msm_dp_link_private *link)
 /**
  * msm_dp_link_process_request() - handle HPD IRQ transition to HIGH
  * @msm_dp_link: pointer to link module data
+ * @connector: connector the sink is attached to
+ * @dpcd: receiver capability DPCD of the sink
+ * @desc: DP descriptor of the sink
  *
  * This function will handle the HPD IRQ state transitions from LOW to HIGH
  * (including cases when there are back to back HPD IRQ HIGH) indicating
  * the start of a new link training request or sink status update.
  */
-int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link)
+int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link,
+				       struct drm_connector *connector,
+				       const u8 *dpcd,
+				       const struct drm_dp_desc *desc)
 {
 	int ret = 0;
 	struct msm_dp_link_private *link;
@@ -1044,7 +1058,7 @@ int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link)
 
 	msm_dp_link_reset_data(link);
 
-	ret = msm_dp_link_parse_sink_status_field(link);
+	ret = msm_dp_link_parse_sink_status_field(link, connector, dpcd, desc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c07e9..217fc5eb0a68 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -113,7 +113,10 @@ static inline u32 msm_dp_link_bit_depth_to_bpp(u32 tbd)
 
 void msm_dp_link_reset_phy_params_vx_px(struct msm_dp_link *msm_dp_link);
 u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp);
-int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link);
+int msm_dp_link_process_request(struct msm_dp_link *msm_dp_link,
+				       struct drm_connector *connector,
+				       const u8 *dpcd,
+				       const struct drm_dp_desc *desc);
 int msm_dp_link_get_colorimetry_config(struct msm_dp_link *msm_dp_link);
 int msm_dp_link_adjust_levels(struct msm_dp_link *msm_dp_link, u8 *link_status);
 bool msm_dp_link_send_test_response(struct msm_dp_link *msm_dp_link);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e76dad0f6663..50e278286e09 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -252,6 +252,11 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		return rc;
 	}
 
+	rc = drm_dp_read_desc(panel->aux, &msm_dp_panel->desc,
+				 drm_dp_is_branch(msm_dp_panel->dpcd));
+	if (rc)
+		memset(&msm_dp_panel->desc, 0, sizeof(msm_dp_panel->desc));
+
 	bw_code = drm_dp_link_rate_to_bw_code(msm_dp_panel->link_info.rate);
 	if (!is_link_rate_valid(bw_code) ||
 			!is_lane_count_valid(msm_dp_panel->link_info.num_lanes) ||
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4519ac374220..e52847474f16 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -31,6 +31,7 @@ struct msm_dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
+	struct drm_dp_desc desc;
 
 	struct msm_dp_link_info link_info;
 	struct drm_connector *connector;
-- 
2.56.0

