Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413343;
	b=pK/dXZtyVPgQ91RqNAUkPTsVnvtiSRwLI5XuvMbbJa3Whg92NZFys2Wttr+Yq0h1SHfm
	 g8xTai44IY5n8BRIeFaeXo/R2fW4LX/fp/d3Nz28WkmuFjSmNfZaWCBA65O1RXIxeDI+R
	 Sb5NBfPw7TiNouoXFkg1kafeb/RE7KKSo5RPveillkxtFT/TG9qQGTisrdL+pvioRw2aJ
	 mQ7qrHYyoK3QP4fo7p1JJ1sRUTGTvQTaYw2PoEvSB+fRgXabEbBjll6NRdulFkSCL40Hw
	 4oLoG1g277o/RLXyot56ZNLkBuMuJFhycFhWGsFMIc533fKniLu39hgcTeLz9TL13ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413343;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l8ufin4b6JTIr8GwZJXnQtcoiPIiiHXtK7fdPA9GJTg=;
	b=ZcxAGPzG6sg1Gf5fjk2hM51OtK4LAdXKRED8HtQKhPAPGxMBnfxiY8MSHQhiuEBuz5jQ
	 jJS6ikeHQYq66wH77bFstqn2iZnFZAIs6rT0jhq+1iMZVeo9KdK5ATXsfoW7IWsOthsXm
	 PWvIvRiX9jYOzY98CfVi6Br7cTSd73UD+4zymzUmdKDKecyh2f1zpbYLCuDw5SxG0/gTz
	 yI0+g5M29ZcRxeOFqq28icLQ+b1tR0O+xlDWMhC+EmtY4uvcBvA3vWmrQ/zvIoICatp/v
	 9nA/ENN3vo5gUVJXrk1H0yzhRceOXRxyor1ha87LpvmwhPdkNbWGE+lo3o+B7bOKRVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=N9f6IK3T;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52952606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52952606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=N9f6IK3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=l8ufin4b6JTIr8GwZJXnQtcoiPIiiHXtK7fdPA9GJTg=;
	t=1794413342; x=2109773342; b=N9f6IK3T1ol1LZ4vmT1oOc/BwYGa2hnokdfXLk9SP18MO+V
	CKqZU+nFyvQaN+Qen4wFOTsrIoyroAAbesuGAVuzF31tuKwebiVwxRdPEgd5UzXnWxoBvbEsMJvXp
	ubMabVnY66wzsb37mozw9gTcsTXM8LHFOLIxCt5qSx9Ig8aLoCRWCfqqph2NoaoilubWbU09APMkl
	nL7STujpRbJzGVez78KpbvKm85Y2ceGaGfvB7lKD6FDELcfEYLohf8jw/XviiAeudySd0oDN7RKvf
	7iGcLFYDoapokM6iZZX2WydzEitCJkYiNzEYitXtn5I4CKpY1HXhY8FWUAvEGUHg==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsD-008u8Y-Ox; Wed, 11 Nov 2026 17:08:33 +0100
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
Subject: [PATCH v5 04/15] drm/amd/display: add plane to commit on KUnit cursor mode tests
Date: Wed, 11 Nov 2026 17:05:17 +0100
Message-ID: <20261111160814.21326-5-mwen@igalia.com>
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

KUnit tests for cursor mode were also taking into account inactive
colorops where its color pipeline and plane state weren't active. Add
the plane state to the atomic commit state and activate the colorop
color pipeline by setting it to the plane state color_pipeline.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_cursor_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_cursor_test.c
index 2212451043fb..c1765dababe4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_cursor_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_cursor_test.c
@@ -179,11 +179,43 @@ static void dm_test_add_cursor_mode_colorop(struct kunit *test,
 	fixture->state->colorops[0].ptr = colorop;
 	fixture->state->colorops[0].old_state = old_colorop_state;
 	fixture->state->colorops[0].new_state = new_colorop_state;
+	colorop->index = 0;
 	colorop->plane = fixture->primary;
 	old_colorop_state->colorop = colorop;
 	old_colorop_state->bypass = old_bypass;
 	new_colorop_state->colorop = colorop;
 	new_colorop_state->bypass = new_bypass;
+
+	/* Colorop needs to be part of an active plane color pipeline */
+	fixture->old_primary_state->color_pipeline = colorop;
+	fixture->primary_state->color_pipeline = colorop;
+}
+
+/* Add plane to atomic commit state and make pipeline active by setting it to
+ * old/new_state color pipeline.
+ */
+static void dm_test_add_plane_to_commit(struct kunit *test,
+					struct drm_atomic_commit *state,
+					struct drm_plane *plane,
+					struct drm_colorop *pipeline)
+{
+	struct drm_plane_state *old_state;
+	struct drm_plane_state *new_state;
+	unsigned int i = drm_plane_index(plane);
+
+	old_state = kunit_kzalloc(test, sizeof(*old_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, old_state);
+	new_state = kunit_kzalloc(test, sizeof(*new_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, new_state);
+
+	old_state->plane = plane;
+	old_state->color_pipeline = pipeline;
+	*new_state = *old_state;
+	new_state->state = state;
+
+	state->planes[i].ptr = plane;
+	state->planes[i].old_state = old_state;
+	state->planes[i].new_state = new_state;
 }
 
 static int dm_test_get_cursor_mode(struct dm_cursor_mode_fixture *fixture,
@@ -447,14 +479,21 @@ static void dm_test_plane_color_pipeline_active(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, new_colorop_state);
 	plane = kunit_kzalloc(test, sizeof(*plane), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, plane);
+	state->planes = kunit_kzalloc(test, sizeof(*state->planes), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, state->planes);
 	state->colorops = kunit_kzalloc(test, sizeof(*state->colorops), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, state->colorops);
 
+	adev->ddev.mode_config.num_total_plane = 1;
 	adev->ddev.mode_config.num_colorop = 1;
 	state->dev = &adev->ddev;
+	plane->dev = &adev->ddev;
+	plane->index = 0;
+	dm_test_add_plane_to_commit(test, state, plane, colorop);
 	state->colorops[0].ptr = colorop;
 	state->colorops[0].old_state = old_colorop_state;
 	state->colorops[0].new_state = new_colorop_state;
+	colorop->index = 0;
 	colorop->plane = plane;
 	old_colorop_state->colorop = colorop;
 	old_colorop_state->bypass = true;
@@ -488,13 +527,23 @@ static void dm_test_plane_color_pipeline_ignores_other_plane(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, colorop_plane);
 	other_plane = kunit_kzalloc(test, sizeof(*other_plane), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, other_plane);
+	state->planes = kunit_kcalloc(test, 2, sizeof(*state->planes), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, state->planes);
 	state->colorops = kunit_kzalloc(test, sizeof(*state->colorops), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, state->colorops);
 
+	adev->ddev.mode_config.num_total_plane = 2;
 	adev->ddev.mode_config.num_colorop = 1;
 	state->dev = &adev->ddev;
+	colorop_plane->dev = &adev->ddev;
+	colorop_plane->index = 0;
+	other_plane->dev = &adev->ddev;
+	other_plane->index = 1;
+	dm_test_add_plane_to_commit(test, state, colorop_plane, colorop);
+	dm_test_add_plane_to_commit(test, state, other_plane, NULL);
 	state->colorops[0].ptr = colorop;
 	state->colorops[0].new_state = colorop_state;
+	colorop->index = 0;
 	colorop->plane = colorop_plane;
 	colorop_state->colorop = colorop;
 
-- 
2.53.0

