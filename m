Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413342;
	b=Z08HwbZVYDmAXt/qYunwCI03LzKSWhUmkNT7KtJWrrPoOlbt2m94L2PN9Nsvg8la6WqN
	 5xB4diVW8MKCQrNVea3yQP5UB1aVF+huPFqI2jni9+ZeO39oldm8HtzudCutUW27gZ9DG
	 SyJ+/KmCXyEJpQuOArrKd/JFCJmCr3TVeKuCEpzEDu67mJWbbTJAFtxGHCvB80ZH7PAkj
	 McJtYAg4x5tXDZkDXp0jZkRk0Fl3fF0a+I1lK6ZC9f3BtRyULOstr0TfooUN+QUH9ZxEy
	 RsAgMwDwVnoGm+lzuHyC0+04Qm57/uZ88+XZPZaQyhciK5daFKGbmMPIKrWX40Y65Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413342;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EF6YJlWcMIKeRWjHSiUzXMiAlNQMPhIfJbX3+58lWy4=;
	b=bBkaigvlE7Bz67Mlwwq/3WNUIFjPpP1kmTioQluoCt8cryCccdEVKL0qXAlhB83TnegB
	 Xq6NNRRAIiO2w/SRNQeN/XM2DoTPSkUnKGmnoJ4LkNQUmcHAbBR093upkz+M1lJQBGimq
	 0YbPAiIl5xwr2kofPh3q1AO3fp7WM45L/PU0jpqT4wOjnQMCDlLNaysWhVG4MgGn4qPQh
	 o3aKolhLWH8jHGVAFurDwFuoLKAsxYVz00X4n2wT6gMkIHhKTgROTZHV0bN4FLmW/hQGJ
	 awtSyHs8SVlnF3sAY8AbgJOf7icX/tUsIC2rEDP5C8sLyh92nuIbTw3CAp8r9sZB/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=AdaZNSv5;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296D606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5296D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=AdaZNSv5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=EF6YJlWcMIKeRWjHSiUzXMiAlNQMPhIfJbX3+58lWy4=;
	t=1794413342; x=2109773342; b=AdaZNSv5AAxC1nnx7ICI770rxv0HTG90sWdCZaSREpEKPH6
	JjxSF2uHTgHRLz1hZ6f5/++oHYn4qzvorBxE1SXbP/5A61V0rSytU/8QmIedn2dExN6rp2Ylq86eS
	5msgCQeiKoeKGufdlOpuSiIZT4JWYjGC5y+3QV78AJpen51OMXn42T+ldeswolZN07i47mUCpzPbH
	D75yW5OZXLaAhlquI2oopkwmq2pLwNjCB01meLjHUrr7hiqNiX/Kh3+LC0h4shzrYIdTEJITSDBL/
	tCner+t9Uv9nDZ1XjpCOjay6/YV/u0Y9AiIQD2ht+8eWxLMFPbmSi2jh+6W4UaYg==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsF-008u8Y-Uj; Wed, 11 Nov 2026 17:08:36 +0100
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
Subject: [PATCH v5 06/15] drm/atomic: reject colorop update from inactive color pipeline
Date: Wed, 11 Nov 2026 17:05:19 +0100
Message-ID: <20261111160814.21326-7-mwen@igalia.com>
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

A colorop can only be changed while it is part of an active color
pipeline, or in the same commit that activates or deactivates that
pipeline. Enforce this contract by checking that the colorop belongs to
the color pipeline of a plane in its current, new or old state, and
rejecting the state change otherwise. Do the check in
drm_atomic_check_only() rather than when the colorop property is set, so
it doesn't depend on the order userspace sets properties within a
commit.

Link: https://lore.kernel.org/dri-devel/20260519211111.228303-1-mwen@igalia.com/
Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 2e82c06166be..36c9550c2749 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -986,6 +986,71 @@ drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
 	return 0;
 }
 
+/*
+ * drm_atomic_colorop_check - check new colorop state
+ * @new_colorop_state: new colorop state to check
+ *
+ * Ensure that the colorop in @new_colorop_state belongs to an active color
+ * pipeline, i.e. it's in the chain of colorops set to the color_pipeline
+ * property of current, old or new plane state.
+ *
+ * Userspace is allowed to finalize colorop's settings in the same commit that
+ * deactivates its pipeline, and the changes should persist for when that
+ * pipeline is reactivated later. So changes to colorop in the old plane
+ * state's pipeline are accepted even though it won't drive hardware updates.
+ *
+ * Skip this check for duplicated state, since all colorop states must persist
+ * in suspend/resume regardless of whether it belongs to an active color
+ * pipeline or not.
+ *
+ * Returns: 0 on success, -EINVAL otherwise.
+ */
+static int drm_atomic_colorop_check(const struct drm_colorop_state *new_colorop_state)
+{
+	struct drm_atomic_commit *state = new_colorop_state->state;
+	struct drm_plane *plane = new_colorop_state->colorop->plane;
+	struct drm_plane_state *new_plane_state, *old_plane_state;
+	struct drm_colorop *colorop;
+
+	if (state->duplicated)
+		return 0;
+
+	/* Not a plane colorop */
+	if (!plane)
+		return 0;
+
+	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+
+	/* No changes in the plane state. Check current-committed plane state */
+	if (!new_plane_state) {
+		drm_for_each_colorop_in_pipeline(colorop, plane->state->color_pipeline)
+			if (colorop == new_colorop_state->colorop)
+				return 0;
+		return -EINVAL;
+	}
+
+	if (WARN_ON(!old_plane_state))
+		return -EINVAL;
+
+	/* Check if the colorop is active in the new plane state */
+	drm_for_each_colorop_in_pipeline(colorop, new_plane_state->color_pipeline)
+		if (colorop == new_colorop_state->colorop)
+			return 0;
+
+	/* Same color pipeline as new; no point walking old. Colorop isn't active */
+	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
+		return -EINVAL;
+
+	/* Check if the colorop was active in the old plane state */
+	drm_for_each_colorop_in_pipeline(colorop, old_plane_state->color_pipeline)
+		if (colorop == new_colorop_state->colorop)
+			return 0;
+
+	/* Colorop is not part of an active color pipeline. */
+	return -EINVAL;
+}
+
 static void drm_atomic_colorop_print_state(struct drm_printer *p,
 					   const struct drm_colorop_state *state)
 {
@@ -1869,6 +1934,8 @@ int drm_atomic_check_only(struct drm_atomic_commit *state)
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	struct drm_plane_state *new_plane_state;
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *new_colorop_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
@@ -1885,6 +1952,15 @@ int drm_atomic_check_only(struct drm_atomic_commit *state)
 			requested_crtc |= drm_crtc_mask(crtc);
 	}
 
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		ret = drm_atomic_colorop_check(new_colorop_state);
+		if (ret) {
+			drm_dbg_atomic(dev, "[COLOROP:%d:%d] isn't in an active color pipeline.\n",
+				       colorop->base.id, colorop->type);
+			return ret;
+		}
+	}
+
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
 		if (ret) {
-- 
2.53.0

