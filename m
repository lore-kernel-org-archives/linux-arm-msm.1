Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413354;
	b=Ih7h7GlAN0Sm1QZ/907nNYfDUOhjEg5eW5Hb0LxLBLqk7dj9t0BUPoQXrJh5+v0wXMWK
	 3WSsksoEXKMaiyIF54oVoH9Hk8x/XPghZMk7UwLTPbsd1eieOkkFBa+HoKhI1BXpY5/cD
	 YEPJx094yA2PsmW0X/XO5Ao0Ou1Tuvna/SUAjffZvMa1/Js44nuOMYvNu6rOn60WthXt1
	 DWB/MFCUfA698O212/gHdQsWbDD6UxIo76RCfLKkghVEeeOULx5XXxbMYkJ9pbJCuTx7h
	 7fhihXrtVWmXJniiZeLYHdGB92iklDst20vHF5+4xZHzPG1CHQ2YzODvZp57uV+pLsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413354;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OaihiIEMF7+13xBp4Kj+CfcOOd15OQoUSx5DNDHnv8A=;
	b=qKPV3yGqPGxU3VxujFQfL/MWPqXGMl9/tdqwPHuX3J0n4XhbAnTALIMl/atueTSEk23s
	 JLEQtQHLdYZg/ELe2gc5sPPOvH1Q8fMTJYaG5DMNTfXxjxY1q5nRD6txv2gFAEq5lYkRb
	 mQWQiA0KBOdSnuRBZISVaFesvLLMj8ug4YAQJkA/oGioPm18Lrjf9nqDgVE0A+0O1Ba+R
	 A1Na77WOh6fLlUmeN4q/jfwEHWyNk7wI0o3W15XvGPrMd3bURq6herCXsAFJsdOey53Y5
	 mO+Q2mcetHB/dVJuBstlrOR4BZVKO6GiSCOcAqWcIAI3dFgtzAZmIVhYHI+xfVzoIoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="Ym3QK/2u";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B458E606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B458E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ym3QK/2u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=OaihiIEMF7+13xBp4Kj+CfcOOd15OQoUSx5DNDHnv8A=;
	t=1794413353; x=2109773353; b=Ym3QK/2ulU1mEygm3X5yuheieSp51hOipKLACuFyGmIiaVF
	GMw1gTOg3xEi5LMQb0nSj5s8oXHccjHw7I3JogbIzv/aDtDCTpY1jsbM13XGTMEpcYJGHk5yfVCYb
	bMHDSm7BhfTKRZn/5qhNW2KqMzqdy5Pn4IPzyf3KZ+VNqguoDpEfGy2OyP6d68qdO8PZguuPwHXsb
	pUxJKJlvH35PPJJP9UrWdO2vhVMqeYy6m0v+o0GyAf9kQfO7LxSikrunAJXW6nGTebVmBSLoDoPzu
	F4KUqBDwTf9d8ehBDtconbs+XDXXNtNFCdzH38ebNrky1Q4defs2pgW644oJU4ew==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsP-008u8Y-To; Wed, 11 Nov 2026 17:08:45 +0100
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
Subject: [PATCH v5 15/15] drm/amd/display: distinguish colorop setup error from no colorop support
Date: Wed, 11 Nov 2026 17:05:28 +0100
Message-ID: <20261111160814.21326-16-mwen@igalia.com>
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

amdgpu_dm_plane_set_colorop_properties() returns -EINVAL both when the
plane has no color pipeline selected, where falling back to the legacy
color properties is correct, and when programming an active pipeline
fails, so the caller treats every failure as the former and silently
programs the plane from the legacy properties, leaving it in a mixed
state and userspace with no error. Check if plane_state->color_pipeline
is set instead, so the legacy path is only taken when no pipeline is set
and any other failure is propagated out of the atomic check. Update
AMD KUnit color tests accordingly.

Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM block")
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c |  8 ++++----
 .../amdgpu_dm/tests/amdgpu_dm_color_test.c      | 17 +++++++++--------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 7332c8874397..3bc4cbe820c6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -2009,10 +2009,10 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
 	int ret;
 
-	/* Fixed Matrix (YUV to RGB) */
-	if (!colorop)
+	if (drm_WARN_ON(dev, !colorop))
 		return -EINVAL;
 
+	/* Fixed Matrix (YUV to RGB) */
 	ret = __set_dm_plane_colorop_fixed_matrix(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
@@ -2194,8 +2194,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
-	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
-		return 0;
+	if (plane_state->color_pipeline)
+		return amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state);
 
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c
index 8e00da61a04b..61543a3026e9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_color_test.c
@@ -2539,7 +2539,7 @@ static void dm_test_update_plane_color_mgmt_colorop_bypass_pipeline(struct kunit
 }
 
 /**
- * dm_test_update_plane_color_mgmt_colorop_missing_multiplier - missing multiplier op falls back
+ * dm_test_update_plane_color_mgmt_colorop_missing_multiplier - missing multiplier op is rejected
  * @test: KUnit test context
  */
 static void dm_test_update_plane_color_mgmt_colorop_missing_multiplier(struct kunit *test)
@@ -2560,13 +2560,13 @@ static void dm_test_update_plane_color_mgmt_colorop_missing_multiplier(struct ku
 
 	KUNIT_EXPECT_EQ(test,
 			amdgpu_dm_update_plane_color_mgmt(f.crtc_state, &f.dm_plane_state->base, f.dc_plane_state),
-			0);
+			-EINVAL);
 	KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.shaper_enable);
 	KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.blend_enable);
 }
 
 /**
- * dm_test_update_plane_color_mgmt_colorop_missing_3x4 - missing 3x4 op falls back
+ * dm_test_update_plane_color_mgmt_colorop_missing_3x4 - missing 3x4 op is rejected
  * @test: KUnit test context
  */
 static void dm_test_update_plane_color_mgmt_colorop_missing_3x4(struct kunit *test)
@@ -2589,13 +2589,13 @@ static void dm_test_update_plane_color_mgmt_colorop_missing_3x4(struct kunit *te
 
 	KUNIT_EXPECT_EQ(test,
 			amdgpu_dm_update_plane_color_mgmt(f.crtc_state, &f.dm_plane_state->base, f.dc_plane_state),
-			0);
+			-EINVAL);
 	KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.shaper_enable);
 	KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.blend_enable);
 }
 
 /**
- * dm_test_update_plane_color_mgmt_colorop_truncated - truncated pipelines fall back
+ * dm_test_update_plane_color_mgmt_colorop_truncated - truncated pipelines are rejected
  * @test: KUnit test context
  *
  * Covers each pipeline exit after the 3x4 matrix while all present colorops
@@ -2640,7 +2640,8 @@ static void dm_test_update_plane_color_mgmt_colorop_truncated(struct kunit *test
 		memset(f.dc_plane_state, 0, sizeof(*f.dc_plane_state));
 
 		ret = amdgpu_dm_update_plane_color_mgmt(crtc_state, plane_state, dc_plane_state);
-		KUNIT_EXPECT_EQ_MSG(test, ret, 0, "pipeline length %d should fall back", count);
+		KUNIT_EXPECT_EQ_MSG(test, ret, -EINVAL,
+				    "pipeline length %d should be rejected", count);
 		KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.shaper_enable);
 		KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.lut3d_enable);
 		KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.blend_enable);
@@ -2810,7 +2811,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut(struct kunit *test)
 }
 
 /**
- * dm_test_update_plane_color_mgmt_colorop_3dlut_no_data - empty 3D LUT falls back
+ * dm_test_update_plane_color_mgmt_colorop_3dlut_no_data - active 3D LUT without data is rejected
  * @test: KUnit test context
  */
 static void dm_test_update_plane_color_mgmt_colorop_3dlut_no_data(struct kunit *test)
@@ -2851,7 +2852,7 @@ static void dm_test_update_plane_color_mgmt_colorop_3dlut_no_data(struct kunit *
 
 	ret = amdgpu_dm_update_plane_color_mgmt(f.crtc_state, plane_state,
 						f.dc_plane_state);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
 	KUNIT_EXPECT_FALSE(test, f.dc_plane_state->cm.flags.bits.lut3d_enable);
 }
 
-- 
2.53.0

