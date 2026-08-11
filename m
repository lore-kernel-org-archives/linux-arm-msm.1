Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E2456E0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468273; cv=none; b=sGWnv3vsTOsBoJHr0g9jL3FKvuGFwdAdCFNtfMuUH9r//XzdwptBvVV3adl4U54QjS9rh4aHSw887BVqFkqMZLruKEKZgnENuZqJMIEF2HRf6NIiw59sqgxxr4JwaL+7woQIrm3fPvJv+fBbq1N2IB+i1Z7fVP/aOn79TSpZmGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468273; c=relaxed/simple;
	bh=hAqnVSGeFvSCPbqnrrIRmCIzgUVJdNPsHjG3Q95y97E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRiRyBgZuwgbtRCboJ60OFE0VuXBWywOzDP/AbOzRZwiCaZeNI/1XlvIC/4FyOUzYHVlovVsCRBdv7C83n9wc2DgxztaY0CvHY0CG+5TVeomi30dTMWA4PoZyJuhq1Di9wb+DtaDrSvrOl/BZN2Yzmqnzr7x3vzDIex8XIiVcKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UZIIEGTg; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UZIIEGTg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=bda0Lh4v9eJfQJw99E+VaUr/c6HRbFqZS/qIDffVjYU=; b=
	UZIIEGTgFyj8hOPYWSf7VFsUSKOZDCdhSUwIr/jXmCy8sb5kQI4ujvvKlkom/NVUa28p1GR7dccWG
	k0B8StYDKBfV4HpY1qQlXbvIzU8qc0SGTAzmGmljpzJsmO3p05lX/TwFOUgUOCTHjipBpduy26I18
	IBuDDBRcDXkyRqGwzR9AT6xDlScZcW694MaC6X8P9IfteU4cwqBSS0Cj2/LawQlWpc45w4B7aEJES
	1ZFd11+By9fIgmvscbMWxCXlEi5A8traIcuWUD5/0jpXgm/5vXzOaSK5cSbrGJcOMJLFCKkDK79fM
	47xnfGNEf/alnpblnlLnz0323t6zGvWFWg==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpzX-00HH9d-V5; Tue, 11 Aug 2026 19:10:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	alex.hung@amd.com,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	contact@emersion.fr,
	daniels@collabora.com,
	harry.wentland@amd.com,
	louis.chauvet@bootlin.com,
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
	Xaver Hugl <xaver.hugl@kde.org>,
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
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 01/11] drm/atomic: only add states of active or transient active colorops
Date: Tue, 11 Aug 2026 18:45:50 +0200
Message-ID: <20260811171011.184964-2-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811171011.184964-1-mwen@igalia.com>
References: <20260811171011.184964-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only consider affected colorop states those that are part of an active
color pipeline or a pipeline that is about to be activated or
deactivated in the same atomic commit, i.e., colorop is in the chain of
old/new plane color pipeline property. To cover color_pipeline
deactivation, remove the condition for plane_state->color_pipeline.
Make drm_atomic_add_affected_colorops() static and move to
drm_atomic_helper.c since it's only used by
drm_atomic_helper_duplicate_state() now.

Acked-by: Harry Wentland <harry.wentland@amd.com> #v3
Signed-off-by: Melissa Wen <mwen@igalia.com>

---

v2: define a macro to walk in the color pipeline (Alex H.)
v4: make drm_atomic_add_affected_colorops static and move to drm_atomic_helper.c (John H.)
---
 drivers/gpu/drm/drm_atomic.c        | 105 ++++++++++++++--------------
 drivers/gpu/drm/drm_atomic_helper.c |  43 ++++++++++++
 include/drm/drm_atomic.h            |   3 -
 include/drm/drm_colorop.h           |   3 +
 4 files changed, 100 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e5c8ef06caed..f00df28e2051 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -892,6 +892,57 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
@@ -1671,62 +1722,14 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
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
 EXPORT_SYMBOL(drm_atomic_add_affected_planes);
 
-/**
- * drm_atomic_add_affected_colorops - add colorops for plane
- * @state: atomic state
- * @plane: DRM plane
- *
- * This function walks the current configuration and adds all colorops
- * currently used by @plane to the atomic configuration @state. This is useful
- * when an atomic commit also needs to check all currently enabled colorop on
- * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
- * to avoid special code to force-enable all colorops.
- *
- * Since acquiring a colorop state will always also acquire the w/w mutex of the
- * current plane for that colorop (if there is any) adding all the colorop states for
- * a plane will not reduce parallelism of atomic updates.
- *
- * Returns:
- * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
- * then the w/w mutex code has detected a deadlock and the entire atomic
- * sequence must be restarted. All other errors are fatal.
- */
-int
-drm_atomic_add_affected_colorops(struct drm_atomic_commit *state,
-				 struct drm_plane *plane)
-{
-	struct drm_colorop *colorop;
-	struct drm_colorop_state *colorop_state;
-
-	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
-
-	drm_dbg_atomic(plane->dev,
-		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
-		       plane->base.id, plane->name, state);
-
-	drm_for_each_colorop(colorop, plane->dev) {
-		if (colorop->plane != plane)
-			continue;
-
-		colorop_state = drm_atomic_get_colorop_state(state, colorop);
-		if (IS_ERR(colorop_state))
-			return PTR_ERR(colorop_state);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_atomic_add_affected_colorops);
-
 /**
  * drm_atomic_check_only - check whether a given config would work
  * @state: atomic configuration to check
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 285aac3554df..917fd0594259 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3697,6 +3697,49 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_atomic_helper_shutdown);
 
+/*
+ * drm_atomic_add_affected_colorops - add colorops for plane
+ * @state: atomic state
+ * @plane: DRM plane
+ *
+ * This function walks the current configuration and adds all colorops
+ * currently used by @plane to the atomic configuration @state. It's useful
+ * when re-enabling a plane to avoid special code to force-enable all colorops.
+ *
+ * Since acquiring a colorop state will always also acquire the w/w mutex of the
+ * current plane for that colorop (if there is any) adding all the colorop states for
+ * a plane will not reduce parallelism of atomic updates.
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+static int
+drm_atomic_add_affected_colorops(struct drm_atomic_commit *state,
+				 struct drm_plane *plane)
+{
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+
+	drm_dbg_atomic(plane->dev,
+		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
+		       plane->base.id, plane->name, state);
+
+	drm_for_each_colorop(colorop, plane->dev) {
+		if (colorop->plane != plane)
+			continue;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+	}
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_duplicate_state - duplicate an atomic state object
  * @dev: DRM device
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 88087910ab1a..0597041bde04 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -921,9 +921,6 @@ drm_atomic_add_affected_connectors(struct drm_atomic_commit *state,
 int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
 			       struct drm_crtc *crtc);
-int __must_check
-drm_atomic_add_affected_colorops(struct drm_atomic_commit *state,
-				 struct drm_plane *plane);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_commit *state);
 int __must_check drm_atomic_commit(struct drm_atomic_commit *state);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 224fae40ed2b..568dfcc4dd63 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -457,6 +457,9 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
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

