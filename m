Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F7B45628E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468273; cv=none; b=rivwbNPgi4kkCEhOMDxht3z0twDWOJtpQDwvQCr9D4+r7zi6pCUA5nH4IlBIMTA3E5XbcgNLRjZH4vj2oSD/zb8f2khldW00qEJ9qKaKfGHZwxjrhxVeBjHSKfJ2MgPYlo55thcYtC3yug2wlwwnF0YpZ8gKL0F92gJOGQ99PEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468273; c=relaxed/simple;
	bh=KsForbYhG2n3oTB5FrRNKztwvTWudF/9R/D01SuaT8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9T0NrtdpA0z3fhNig7hvl47hAyP+Lm2Mp1z7ownaJTPmU5RqFFJ1+bpU1yjFzT8qZ48U9071SOaQEKbyWMkRipX+ZFgEHCz2Q9fZsL2vOe210MrLCiZy0vN+6x32wgEF7sfwe8XAPgBXx4QbPmpyZZ2Wmb2oIcs4b0qcXWQhYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hDJYm9RZ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hDJYm9RZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=mJCoRC5psha18dGd3NKJz4LTeLbCvuqhkA2jfFjGv4A=; b=
	hDJYm9RZiBdeZtQz7XnKpLjOLBfTr7WFdXWvYK0Jt0jHJhGgh/JSOUo3b1vkD0/uwSWDUPb5fP0Wh
	AozwNpE2ZwZFnMOfAM47DlCg690ha/oD57jJ5EBBiJJMRJ/7z1vH8ucZRWgRCguOlOP+H6+tTZTX0
	5VRwHCzIfXhdWhz50+PKMzPotjp2C2bSUP4dYQ4oFNtx3tIcWHGYVzowtVGdFo2JaeiSgQ5GVDdDJ
	rDhwuQMNQXlNBUhtIRDhCskybcAUX2vO9DGR4SkynXWHfx0VNMaDcOfnIflvH/dUnabxtLium1IZi
	2NO8AlfCTPZe9b28lHKCNS4PCn7trhiiJg==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpzc-00HH9d-2W; Tue, 11 Aug 2026 19:10:24 +0200
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
Subject: [PATCH v4 04/11] drm/atomic: check if an active colorop has a blob if its type requires one
Date: Tue, 11 Aug 2026 18:45:53 +0200
Message-ID: <20260811171011.184964-5-mwen@igalia.com>
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

If colorop TYPE requires a data blob, userspace have to set a blob
whenever enables this colorop, i.e. when setting this colorop bypass
property to false.

Fixes: e5719e7f1900 ("drm/colorop: Add 3x4 CTM type")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 86e4348cad58..7b9d52cf87d0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -947,8 +947,13 @@ drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
  * drm_atomic_colorop_check - check new colorop state
  * @new_colorop_state: new colorop state to check
  *
- * Ensure that the colorop in @new_colorop_state belongs to an active color
- * pipeline, i.e. it's in the chain of colorops set to the color_pipeline
+ * Check that a colorop whose TYPE requires a data blob has one when it's
+ * enabled, i.e. userspace can't clear (or never set) the DATA property while
+ * taking the colorop out of bypass, since drivers would have nothing to
+ * program.
+ *
+ * Also ensure that the colorop in @new_colorop_state belongs to an active
+ * color pipeline, i.e. it's in the chain of colorops set to the color_pipeline
  * property of current, old or new plane state.
  *
  * Userspace is allowed to finalize colorop's settings in the same commit that
@@ -972,6 +977,19 @@ static int drm_atomic_colorop_check(const struct drm_colorop_state *new_colorop_
 	if (state->duplicated)
 		return 0;
 
+	/*
+	 * Reject if colorop TYPE requires a DATA but set bypass to false and
+	 * no blob submitted
+	 */
+	if (new_colorop_state->colorop->data_property &&
+	    !new_colorop_state->bypass && !new_colorop_state->data) {
+		drm_dbg_atomic(new_colorop_state->colorop->dev,
+			       "[COLOROP:%d:%d] enabled without a DATA blob\n",
+			       new_colorop_state->colorop->base.id,
+			       new_colorop_state->colorop->type);
+		return -EINVAL;
+	}
+
 	/* Not a plane colorop */
 	if (!plane)
 		return 0;
-- 
2.53.0

