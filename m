Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413342;
	b=n4ln+a1RatUcbUYXAOVW0aIgd2MJaFAmIzn+uRQvPLkkd+0DJoRtXx9KfzGXk2jlaPMU
	 CtTUlZ7xBhDieV7TfMfQCa8zv9wfm/BmetQEKBsfySfQXu3uMDL9g5uPpEczMeNj5k/Bi
	 Uj265XfrqggN8dxuCg1DWklX5fwQ6wqkDXXgCoIT2Hx0hfJ3VCZEHk0bH7orqJUTlnNhK
	 DtMBq7g/xJ7lfa/CBuDqSaaZS9TiQ+Q+0v2M0xuSOm5CLXv9DHTXshWtwlQcKzyDOf2rm
	 fphX07LEMauHBjZTbDYhZ3UBVHDT1AVlMiihuhHv2lGnuacuEEi1PMneCVLQirnxFKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413342;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f/cZaduwWh9lNBTtL3zVDM/TEsIs0K5OI4ynG53kQso=;
	b=c74/ZNZLiPd1nCuD8XlCrW0f9ed+C8+CfEx2s3sLj7K0M/Cf17m7AkW3czyGmNkCYQKw
	 twSLmOyebQJUQAfZE26OH97AvbXRTIBHY7Fb1ClWEigIZ78X/SKzDBQnEtSShq8o80pZ5
	 L2pIg9IAAyGNxExIa7g+WvrJDNAD2mz/EV6KKZyT/XN7dWwkChoTes1l++J25qZ+2z44O
	 X9BCkjCR8vWQpd6oveaGqdtsRaDTROlf8ECw6g5qJqLvOE8HHSx4Gj0UoGHheGl7LJBoz
	 gyTS7I5Uuoql53gvK3dT188Dg7GjLdflrxF4/HsXHl553gVhbUdAKbN5zrnQ9yXcWuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="a+UbkL/m";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68C606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D68C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=a+UbkL/m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=f/cZaduwWh9lNBTtL3zVDM/TEsIs0K5OI4ynG53kQso=;
	t=1794413342; x=2109773342; b=a+UbkL/mzENETQ35G9YzGXh+P6dnjC1nwI8ig5UqkGOGdZ1
	3S8yAjhJ27OY83ZthHlStXQ+rtSmjCyjBFkPjXEXuIJjfkXZ8Ys8A7vDzFeOX1B6TxMn5nJCxkIu2
	eqEnqTE4Bx3bbeDrB3y6e0N7AWdQECl/JMqyGgK0bKUzq8qL94JxVxRJ0CpN01cVQt8ERR9Ovxi9T
	LkQzzQKSZTSQpLsOcNgRinGmUxJANOPhGlSjkg+V0NIlSvuKxglpduQZuyzvV7OOtEwXwmTDYjF/i
	z4D6N227r2wsfpIzZqLXhtlyI7eNAJEzzWtdFXgZ5ezhB2cf9FW6h+A3GJ4Lmt+g==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsE-008u8Y-SW; Wed, 11 Nov 2026 17:08:34 +0100
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
	John Harrison <John.Harrison@igalia.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 05/15] drm/amd/display: only check colorops of an active color pipeline
Date: Wed, 11 Nov 2026 17:05:18 +0100
Message-ID: <20261111160814.21326-6-mwen@igalia.com>
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

dm_plane_color_pipeline_active() iterates every colorop state in the
atomic commit, so colorops of a pipeline that userspace deactivated via
plane COLOR_PIPELINE are still taken into account, even though their
BYPASS property is irrelevant once the pipeline is off. Walk the color
pipeline of the plane state under evaluation instead, falling back to
the committed colorop state when a colorop isn't in the atomic commit.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: d3a549f4df78 ("drm/amd/display: Use overlay cursor when color pipeline is active")
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_cursor.c  | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c
index 8204ad4018e6..a026610e81d9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c
@@ -236,14 +236,28 @@ STATIC_IFN_KUNIT bool dm_plane_color_pipeline_active(struct drm_atomic_commit *s
 						     bool use_old)
 {
 	struct drm_colorop *colorop;
-	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
-	int i;
+	struct drm_colorop_state *cstate;
+	struct drm_plane_state *plane_state = use_old ?
+					      drm_atomic_get_old_plane_state(state, plane) :
+					      drm_atomic_get_new_plane_state(state, plane);
 
-	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
-		struct drm_colorop_state *cstate = use_old ? old_colorop_state : new_colorop_state;
+	if (drm_WARN_ON(plane->dev, !plane_state))
+		return false;
 
-		if (cstate->colorop->plane != plane)
-			continue;
+	/*
+	 * A commit may change only some colorops of a pipeline, and only those
+	 * have old and new states here. Telling whether the pipeline modifies
+	 * pixels requires every colorop of the selected pipeline, so fall back
+	 * to the committed state of the untouched ones; it's both their old
+	 * and new state.
+	 */
+	drm_for_each_colorop_in_pipeline(colorop, plane_state->color_pipeline) {
+		cstate = use_old ?
+			 drm_atomic_get_old_colorop_state(state, colorop) :
+			 drm_atomic_get_new_colorop_state(state, colorop);
+
+		if (!cstate)
+			cstate = colorop->state;
 		if (!cstate->bypass)
 			return true;
 	}
-- 
2.53.0

