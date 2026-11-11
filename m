Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413340;
	b=t2qoVFVWIFR7meqh3biR+1ti9jFE8vSbNyDmjQoeBzlK9HcaRd4Uffqt0MEFWaaI+aDB
	 DWiMqiSEC41CDBuJZwsUwUHLbdG7oP1kutsl1DObfHst0j8spZouVUnENawLJjrsaGnHY
	 94CcoTXL0RGiO8Qukc4UWSpV8YHuViPk9NzF62Rma0JDpJV1y9nWFXOfvgeOSoCpmiw+1
	 Oze5a35+73/RlAkCJvslkNrqVQb+rG3FjpTBZSS5NQ7uUdB3rXz0ls74XPk/Khwvzp+xI
	 63LRuQJijpTVd8Uwvf2kpqIXiNqomaSg5VT5hsKfzD7khpu55RCanl+vyZLPtiFB8gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413340;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/0hoarigVh/hUEDnhZ2/FihBCw3WzRHplsuscVyCxGc=;
	b=pICzOk5lzbfhOrHL8mQn2/ZU55T8r2Qt2f+Q1JmJCYqSCQg8LUv9U4VoQUgF1cCg0Kh2
	 9RUNuOiJqATU7I1a+D/MnxkGMxHtqxevTns6BYSo2Q5pZ3tsqXuLITfUHB8mK18EHiJLx
	 yAfgFLJHJ0ZkqBKG1rEbsN0kwXZJdj2VyMYmPJ+M8LMDm4ZE5btqD9DmTo+mX6vCyjqFH
	 HEv+7NoWUGEO/62i5eofID28qifjyrZORlaE3/ESkqyTja7rIaJ69d0FNZNfCGG1axw14
	 qWyrvR9P9NrXwnB2dCV1AN6KXXg/zDcsiNsGAa4mVp0YUwAw7Rj5FWB9Qkqhzv+52dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=QkaehTk6;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A041606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A041606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=QkaehTk6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=/0hoarigVh/hUEDnhZ2/FihBCw3WzRHplsuscVyCxGc=;
	t=1794413340; x=2109773340; b=QkaehTk6rOUAztyKmuts/AsdoJlp2nPujLsxWxIx94JXppw
	5ZPI8ejwrwFpf5siseBndNTvAN5uPRv3TcQO6XHhMvtPZHw2k01HadvQtkGykhEc/B47CpGVVbmI4
	kBwymAfswTw3EWVAtm6w2WaTdMkvffNjs0da7MVGZOMsF+OILTnNTvaNBczIRve9OWgznpACADkGa
	HaoRuiV9xGAG0wsKYpEtS6555bsEzEST8xGdRQxd1aCRmRPuqUOs0Bs4z/W/DdNuGP6cuRlh4AMYI
	kck8Stlt+8P0oFwLEuoNunhGtgiUkQNwuh7BHldl1tnkEIQ0tImcu2SKG3zX68nA==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsB-008u8Y-Cu; Wed, 11 Nov 2026 17:08:31 +0100
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
Subject: [PATCH v5 02/15] drm/amd/display: add missing FIXED_MATRIX colorop to AMD KUnit tests
Date: Wed, 11 Nov 2026 17:05:15 +0100
Message-ID: <20261111160814.21326-3-mwen@igalia.com>
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

The new FIXED_MATRIX colorop was introduced to DRM and this is now the
first operation of the AMD color pipeline, but KUnit tests weren't
updated accordingly. Add the new colorop as expected when testing
colorops of the AMD color pipeline. Also fix the colorop sequence in
comments.

Fixes: 941222175d21 ("drm/amd/display: Implement fixed matrix colorop color space mapping")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amdgpu_dm/tests/amdgpu_dm_color_test.c    | 50 +++++++++++++------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c
index 8c2f7ab5f8d3..d2ae35bf550f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c
@@ -2495,6 +2495,7 @@ dm_test_colorop_pipeline_setup(struct kunit *test,
 static void dm_test_update_plane_color_mgmt_colorop_bypass_pipeline(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2508,6 +2509,7 @@ static void dm_test_update_plane_color_mgmt_colorop_bypass_pipeline(struct kunit
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
@@ -2515,7 +2517,7 @@ static void dm_test_update_plane_color_mgmt_colorop_bypass_pipeline(struct kunit
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
 	static const bool bypass[] = {
-		true, true, true, true, true, true, true, true,
+		true, true, true, true, true, true, true, true, true,
 	};
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 
@@ -2532,16 +2534,20 @@ static void dm_test_update_plane_color_mgmt_colorop_bypass_pipeline(struct kunit
 }
 
 /**
- * dm_test_update_plane_color_mgmt_colorop_missing_multiplier - missing second op falls back
+ * dm_test_update_plane_color_mgmt_colorop_missing_multiplier - missing multiplier op falls back
  * @test: KUnit test context
  */
 static void dm_test_update_plane_color_mgmt_colorop_missing_multiplier(struct kunit *test)
 {
-	static const enum drm_colorop_type types[] = { DRM_COLOROP_1D_CURVE };
+	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
+		DRM_COLOROP_1D_CURVE
+	};
 	static const enum drm_colorop_curve_1d_type curves[] = {
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
-	static const bool bypass[] = { true };
+	static const bool bypass[] = { true, true };
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 
 	f.dm_plane_state->base.color_pipeline =
@@ -2555,20 +2561,22 @@ static void dm_test_update_plane_color_mgmt_colorop_missing_multiplier(struct ku
 }
 
 /**
- * dm_test_update_plane_color_mgmt_colorop_missing_3x4 - missing third op falls back
+ * dm_test_update_plane_color_mgmt_colorop_missing_3x4 - missing 3x4 op falls back
  * @test: KUnit test context
  */
 static void dm_test_update_plane_color_mgmt_colorop_missing_3x4(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 	};
 	static const enum drm_colorop_curve_1d_type curves[] = {
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
-	static const bool bypass[] = { true, true };
+	static const bool bypass[] = { true, true, true };
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 
 	f.dm_plane_state->base.color_pipeline =
@@ -2591,6 +2599,7 @@ static void dm_test_update_plane_color_mgmt_colorop_missing_3x4(struct kunit *te
 static void dm_test_update_plane_color_mgmt_colorop_truncated(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2603,13 +2612,14 @@ static void dm_test_update_plane_color_mgmt_colorop_truncated(struct kunit *test
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
 	static const bool bypass[] = {
-		true, true, true, true, true, true, true,
+		true, true, true, true, true, true, true, true,
 	};
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 	struct dc_plane_state *dc_plane_state = f.dc_plane_state;
@@ -2639,6 +2649,7 @@ static void dm_test_update_plane_color_mgmt_colorop_truncated(struct kunit *test
 static void dm_test_update_plane_color_mgmt_colorop_no_3dlut_hw(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2657,9 +2668,10 @@ static void dm_test_update_plane_color_mgmt_colorop_no_3dlut_hw(struct kunit *te
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
 	static const bool bypass[] = {
-		true, true, true, true, true, false, true, true,
+		true, true, true, true, true, true, false, true, true,
 	};
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 
@@ -2683,6 +2695,7 @@ static void dm_test_update_plane_color_mgmt_colorop_no_3dlut_hw(struct kunit *te
 static void dm_test_update_plane_color_mgmt_colorop_shaper(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2696,6 +2709,7 @@ static void dm_test_update_plane_color_mgmt_colorop_shaper(struct kunit *test)
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
@@ -2703,7 +2717,7 @@ static void dm_test_update_plane_color_mgmt_colorop_shaper(struct kunit *test)
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
 	static const bool bypass[] = {
-		true, true, true, false, false, true, true, true,
+		true, true, true, true, false, false, true, true, true,
 	};
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 	struct drm_colorop_state *shaper_lut_state;
@@ -2715,7 +2729,7 @@ static void dm_test_update_plane_color_mgmt_colorop_shaper(struct kunit *test)
 	f.dm_plane_state->base.color_pipeline =
 		dm_test_colorop_pipeline_setup(test, &f, types, curves, bypass,
 					       ARRAY_SIZE(types));
-	shaper_lut_state = f.state->colorops[4].new_state;
+	shaper_lut_state = f.state->colorops[5].new_state;
 	blob = kunit_kzalloc(test, sizeof(*blob), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, blob);
 	blob->length = MAX_COLOR_LUT_ENTRIES * sizeof(struct drm_color_lut32);
@@ -2738,6 +2752,7 @@ static void dm_test_update_plane_color_mgmt_colorop_shaper(struct kunit *test)
 static void dm_test_update_plane_color_mgmt_colorop_3dlut(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2751,6 +2766,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut(struct kunit *test)
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
@@ -2758,7 +2774,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut(struct kunit *test)
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
 	static const bool bypass[] = {
-		true, true, true, true, true, false, true, true,
+		true, true, true, true, true, true, false, true, true,
 	};
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 	struct drm_colorop_state *lut3d_state;
@@ -2770,7 +2786,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut(struct kunit *test)
 	f.dm_plane_state->base.color_pipeline =
 		dm_test_colorop_pipeline_setup(test, &f, types, curves, bypass,
 					       ARRAY_SIZE(types));
-	lut3d_state = f.state->colorops[5].new_state;
+	lut3d_state = f.state->colorops[6].new_state;
 	blob = kunit_kzalloc(test, sizeof(*blob), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, blob);
 	blob->length = 5 * sizeof(struct drm_color_lut32);
@@ -2795,6 +2811,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut(struct kunit *test)
 static void dm_test_update_plane_color_mgmt_colorop_3dlut_no_data(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2808,6 +2825,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut_no_data(struct kunit *
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
@@ -2815,7 +2833,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut_no_data(struct kunit *
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
 	static const bool bypass[] = {
-		true, true, true, true, true, false, true, true,
+		true, true, true, true, true, true, false, true, true,
 	};
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 	struct drm_plane_state *plane_state = &f.dm_plane_state->base;
@@ -2839,6 +2857,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut_no_data(struct kunit *
 static void dm_test_update_plane_color_mgmt_colorop_blend(struct kunit *test)
 {
 	static const enum drm_colorop_type types[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -2851,8 +2870,9 @@ static void dm_test_update_plane_color_mgmt_colorop_blend(struct kunit *test)
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+		DRM_COLOROP_1D_CURVE_SRGB_EOTF,
 	};
-	static const bool bypass[] = { true, true, true, false, false };
+	static const bool bypass[] = { true, true, true, true, false, false };
 	struct dm_test_color_update_fixture f = dm_test_color_update_setup(test);
 	struct drm_colorop_state *blend_lut_state;
 	struct drm_plane_state *plane_state = &f.dm_plane_state->base;
@@ -2862,7 +2882,7 @@ static void dm_test_update_plane_color_mgmt_colorop_blend(struct kunit *test)
 	f.dm_plane_state->base.color_pipeline =
 		dm_test_colorop_pipeline_setup(test, &f, types, curves, bypass,
 					       ARRAY_SIZE(types));
-	blend_lut_state = f.state->colorops[4].new_state;
+	blend_lut_state = f.state->colorops[5].new_state;
 	blob = kunit_kzalloc(test, sizeof(*blob), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, blob);
 	blob->length = MAX_COLOR_LUT_ENTRIES * sizeof(struct drm_color_lut32);
-- 
2.53.0

