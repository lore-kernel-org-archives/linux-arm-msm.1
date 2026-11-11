Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413352;
	b=lDPwK9Ko7xU2fiw7J+IcQWUOhZ9AoM50P2Hy7gNaZ+vcSNh0vHZI/1AM4c4lSZQIyOvh
	 2h4n/dPYjjo/Ib7OAGd4hLVJCYJEAsXL4K/wu2hw0SCaLE5PCCJrnwRNZocKOBRBAy1a7
	 ZQv5d02O1Nr+bL3Inz9R5xIKv89DaLaSZH1rOBJ3ruazOxl9dPFj+ciftjE+agQRC5uyL
	 RI2IXgQvk9/ztUrg/kSwK73TkroSKTG9nNMtga+aebo1fcgeOM7k3caUaWYgsdz5z5wHT
	 MdB2ieNnIl6Sgb+5p3ylCoZPgTNH/Kw+RORtRY24cYGfECaYQpdWBZuZaaKvNrHoFvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413352;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KzLgvnnVCJQM8XoZgFKkHIxCpzTPL6wyxLCKsZPvLxA=;
	b=2aGA1Q9eL2YNs7VK3t0jqhVjMRLmhI7Vk8wtVwGfEzGYxViiiR44lbZ3iIW/KGjWO1/t
	 UhfczcOr3E3KfraRz1WU4HboP428b8mBrKtjTHFDlnacNyVw4qTqeUdNLx2EZ2PWrJOLW
	 iKvyDbkiBBd4K0iAIg/gtQD8GbyFEpFMGqB1Wh/i1SprOLdYVW8zSXJKq4HHToy7PILQO
	 81dIQ7PCg3uneeZp1QyHmeIZYqkptiPsrnr9Z/RMHB2a17HNAYfUXhygciOMgzkDdtWV0
	 wjYhqwAbof350w6tzzh2R/gXbdyJM7wG6C1avE/LdJ+Zv9oXMSK2fjK+pQaChd6RWUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=mnSHGCl2;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3B606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD3B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=mnSHGCl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=KzLgvnnVCJQM8XoZgFKkHIxCpzTPL6wyxLCKsZPvLxA=;
	t=1794413351; x=2109773351; b=mnSHGCl29t1dYxA4TMBWGfjk8rR/BDXpig1JuZHGsKqjgDK
	PE86uwrUW40ovYAAjntaGQhkLT9zcS/a6Jc8hAwF12bxqHUdad3NFU4SjH9tSU533ocIyUFyL26Tf
	PHC7V+iB/1jkqKlKaIPkXI3AcFpnuAZNi4srutktBMg+9zAd6iGIahv5bfhVv3VQBlNb/uLOI3ZY1
	iUak0p5RX5MM/vUmvDlRXt9jOhaoVjqQscXrHs0R6Hz8Ddw76SL0M/zFicOy4ObgrLn8mPs4rqGt5
	J2piuhDw6lUI+18+LmU0WSRuMJTvz4adLyaqu6Bdpih3qy/JoX1hUmDsSabaPyBQ==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsO-008u8Y-Q2; Wed, 11 Nov 2026 17:08:44 +0100
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
Subject: [PATCH v5 14/15] drm/atomic: make drm_atomic_add_affected_colorops() static
Date: Wed, 11 Nov 2026 17:05:27 +0100
Message-ID: <20261111160814.21326-15-mwen@igalia.com>
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

After refactoring the AMD colorop state lifetime,
drm_atomic_add_affected_colorops() is no longer used anywhere but
drm_atomic_duplicate_state. Move this helper to drm_atomic_helper.c,
make it static and rename to duplicate_plane_colorops for clarity.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c        | 46 -------------------------
 drivers/gpu/drm/drm_atomic_helper.c | 52 ++++++++++++++++++++++++++++-
 include/drm/drm_atomic.h            |  4 ---
 3 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d8b56fa47d45..821e05eb232a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1888,52 +1888,6 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
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
index 60e69061faa9..358b89e93620 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3697,6 +3697,56 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_atomic_helper_shutdown);
 
+/*
+ * duplicate_plane_colorops - add colorops for plane
+ * @state: atomic state
+ * @plane: DRM plane
+ *
+ * Add the state of each colorop of a given @plane to @state, including
+ * colorops from color pipelines that are not currently active. This duplicated
+ * state is used to restore the hardware state later; furthermore, the
+ * drm_atomic_helper_resume() function, for instance, resets all colorop
+ * states before committing it, and any colorop that is omitted would lose its
+ * settings.
+ *
+ * Use this only in duplicated states: the drm_atomic_check_only() function
+ * rejects colorops from a pipeline that the atomic commit is neither enabling
+ * nor disabling it; this check is only bypassed when state->duplicated is set.
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
+duplicate_plane_colorops(struct drm_atomic_commit *state,
+			 struct drm_plane *plane)
+{
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+
+	drm_dbg_atomic(plane->dev,
+		       "Adding all colorops for [PLANE:%d:%s] to %p\n",
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
@@ -3758,7 +3808,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 			goto free;
 		}
 
-		err = drm_atomic_add_affected_colorops(state, plane);
+		err = duplicate_plane_colorops(state, plane);
 		if (err)
 			goto free;
 	}
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 3ae35b09c0cf..1ba000e392f4 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -937,10 +937,6 @@ drm_atomic_add_affected_connectors(struct drm_atomic_commit *state,
 int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
 			       struct drm_crtc *crtc);
-int __must_check
-drm_atomic_add_affected_colorops(struct drm_atomic_commit *state,
-				 struct drm_plane *plane);
-
 int __must_check drm_atomic_check_only(struct drm_atomic_commit *state);
 int __must_check drm_atomic_commit(struct drm_atomic_commit *state);
 int __must_check drm_atomic_nonblocking_commit(struct drm_atomic_commit *state);
-- 
2.53.0

