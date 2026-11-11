Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413343;
	b=DcwGJs2aKcYzEzFsY3oO4/gNAXPwrryrgPFrJ2OVJsEWHfwdB2+tQ1TihOvKvB2bAMag
	 y9KI5S8KG1EbHKQF+nA9XnayByP9TSYBs7CdWAtD5vubQ4cjxLVhrUJoEwQ29LMVS2hm9
	 qVXGeTvF4ogVzRGI+IZQkeei6BpkkBrmt3GnF5BtfvaplieKw5GTR8omg54LvG1h0KaA9
	 mwBgPkqydbGjsIFU+GbtQiqiOOFlcQXEGhGZYEHEMR91YhXqy2zzb4ykHUhANx9+eYzIF
	 h6epPF8tzsr4zBPh5MLZMDDSZamC4RYJVjzB3Z2GY6qr8wCi3HL1uyQFuLr2MblGVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413343;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5V9JPEyXmx4Ck08XXdEaQ0TsoDd90x2aTAlF0PCEJS0=;
	b=5jXAL50YhkPHOYIrLb+PlMVgWtsU5d2TIANCg5s6zBr1RO4fBOAKGnKXvHI9RR1xLgvE
	 YMPSig9Xtb7Px0kcurvzFfDHNOM5TYV3wMJBPUQqWSS96t7yKMt3uH58gjlFrRcoJ3lLA
	 hRGVHLKvrf792TwBYKJXzSkwLx0OeZsC6NrOQyeBlS6JxDUUlJP9oNyGCjC9XMTJgy76f
	 HpxaxOd4as3A2pU4MQFfrcwmOooFrh/a+2mwWduSy/HgCm/zeX/37dtMc3sDgh4IhfQRh
	 e/+iJpmu1cnPnwB8iAOTn38dzZ6DEOOFlwPJcVzH2b9Ng9/vuz1XFUdL87AJWkPXf6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ISkcqton;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65043606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65043606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ISkcqton
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=5V9JPEyXmx4Ck08XXdEaQ0TsoDd90x2aTAlF0PCEJS0=;
	t=1794413343; x=2109773343; b=ISkcqtonQhSNtVqEqMbnTfQERoQshDl8SbRgILzKmvmnNIa
	iEDQijutCMs2YpuhL4dC6picY1NZItgHlawHypjywfIwwGCdzKzMAy9bzwT7Or6DnDdnbG1D59yrC
	T44cjEJHFD4nBnOL41F2ZlUDwXTUwcdOYKPiXg44hKERaXQxVkJ0n7sJIdOVzmn9UmYLVqFgqhHuX
	35/7Gq3F02Nm+jfDukJiQoQ1UZw/VZvEdxnbEjmb543qnxFtMnc+Ii+uKzomn5ByYy7pl+HihzPEz
	c3N/9RegHk4bitA1nYZNcOi6A/lJvVimCpSXoZrDpF+jwy53prWRiHzQ3SP7d0yA==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsC-008u8Y-Il; Wed, 11 Nov 2026 17:08:32 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	alex.hung@amd.com,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	contact@emersion.fr,
	daniels@collabora.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	mwen@igalia.com,
	sebastian.wick@redhat.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	louis.chauvet@bootlin.com,
	John Harrison <John.Harrison@igalia.com>
Subject: [PATCH v5 03/15] drm/atomic: only add states of active or transient active colorops
Date: Wed, 11 Nov 2026 17:05:16 +0100
Message-ID: <20261111160814.21326-4-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111160814.21326-1-mwen@igalia.com>
References: <20261111160814.21326-1-mwen@igalia.com>
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

Only consider affected colorop states those that are part of an active
color pipeline or a pipeline that is about to be activated or
deactivated in the same atomic commit, i.e., colorop is in the chain of
old/new plane color pipeline property. To cover color_pipeline
deactivation, remove the condition for plane_state->color_pipeline.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c | 59 +++++++++++++++++++++++++++++++++---
 include/drm/drm_colorop.h    |  3 ++
 2 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 81591173265d..2e82c06166be 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -935,6 +935,57 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+/*
+ * This function walks old and new plane state color pipelines and adds all
+ * colorops in use by @plane to the atomic configuration @state. This is useful
+ * when an atomic commit needs to check all currently enabled or about to be
+ * enabled colorop on @plane, e.g. when changing the mode. This also avoids
+ * including colorop states that are not part of the atomic state.
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+static int
+drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
+				 struct drm_plane *plane)
+{
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *colorop_state;
+	struct drm_plane_state *new_plane_state, *old_plane_state;
+
+	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+
+	if (WARN_ON(!new_plane_state || !old_plane_state))
+		return -EINVAL;
+
+	drm_dbg_atomic(plane->dev,
+		       "Adding old+new pipeline colorops for [PLANE:%d:%s]\n",
+		       plane->base.id, plane->name);
+
+	drm_for_each_colorop_in_pipeline(colorop,
+					 new_plane_state->color_pipeline) {
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+	}
+
+	/* Same color pipeline as new; no point walking old. */
+	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
+		return 0;
+
+	drm_for_each_colorop_in_pipeline(colorop,
+					 old_plane_state->color_pipeline) {
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+	}
+
+	return 0;
+}
+
 static void drm_atomic_colorop_print_state(struct drm_printer *p,
 					   const struct drm_colorop_state *state)
 {
@@ -1746,11 +1797,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
 		if (IS_ERR(plane_state))
 			return PTR_ERR(plane_state);
 
-		if (plane_state->color_pipeline) {
-			ret = drm_atomic_add_affected_colorops(state, plane);
-			if (ret)
-				return ret;
-		}
+		ret = drm_atomic_add_pipeline_colorops(state, plane);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 26ef67c835e2..11a88e9477f1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -583,6 +583,9 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+#define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
+	for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)
+
 /**
  * drm_get_colorop_type_name - return a string for colorop type
  * @type: colorop type to compute name of
-- 
2.53.0

