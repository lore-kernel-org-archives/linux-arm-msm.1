Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413340;
	b=MRgDYmuqM3TwPPRg5DNmeNQgGbATM4jlk5tVdXkdO6jEeI38jJ9YjtmcTfeso7u7uCrX
	 KxtDfcrA5WhHmfVO6yqAb8wHJCRfauvsO3Ku20ZKujGHCW5OQgG2wWO3nK4ZPc9Xb0pS5
	 QMdQIQl0M0cT5xPCBub+bGAKlOJ9a9zP1J72M3Wu2IhwkmcrrMx6RneaUovCBYu2GTZPc
	 WQ5Dx2vexbmXQbv7AJHIZ/G4F/YAkmGj1ZpTmamafx0vLPW8UaH9hFzsvfsOm84f6dl7t
	 E7CAIuvQjQtMU7kYj5/cZXBIr8VpK3tKTB/+DqcLRht/rMQcjVHKdTWGW/12Khl00ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413340;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ahgdmGX1NnxGKma3T6uHxi+lbLDI5gQToqr2EieprXo=;
	b=punOvUGej6s3QeqUiQSGvLQwRsfkQ9qbvYma4LPj4QBmPwuSnS57+uiBGmVOuw6nUG1B
	 +J302hlR+SpzCkwXqjku/mULyc5uKqLnVaLaN2cygKD0zX57HbNmp+7fJQmNxp1bWZ/Vy
	 xN2TVCClFTkl2qzqKre2ZI/dW3u0PMc5zOeGP+Nkqr0A8zsOj6rJOHkuApJ2hh8SeHPyF
	 Ficd9Jqph21FUir//FxfVxKzpEB9h1RlzHVMuSi2uq9NM/VfVr3JUHD6DW6RfLuZlYzNw
	 LpBZuyoMfMBOtImvh1zjxddaLLXYzFpK3DMMuQGD67XF2D/A5dueqoBamTL+LxT7RnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ynz7P+CU;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFC5606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFC5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ynz7P+CU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=ahgdmGX1NnxGKma3T6uHxi+lbLDI5gQToqr2EieprXo=;
	t=1794413339; x=2109773339; b=Ynz7P+CUq1d2Mdv1tj2pkvp9ofUU0v7DXMmUUlPLyoeHGIJ
	6TITNFDK7FjYuv5F8jjaT5PuDsBZKnmsrplfQELDMZIhN4Gb46QsEWCOGhvVBTR1/Rg+oO3/0ntAM
	PFP8gVzoWedMmyjqJKjlK6O/fYniFQCea0TmPyblqn9U49jG2dnZmFi5t+2y71ObCUCe0MttZxB1u
	TXwKYkvD+QIeCzzSf7nwpWDJdK2ka+T9A7gWuUWBLUpMfgJOFtLetLIcsLjl40A1UXKU5X0FOOiFr
	nlpBwhHWMI2nZ3GecorZqdjNwzkwCUb5wPjuKMVYPx5CcES1jKi4VVd6FUdBAjWQ==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsA-008u8Y-5A; Wed, 11 Nov 2026 17:08:30 +0100
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
	John Harrison <John.Harrison@Igalia.com>
Subject: [PATCH v5 01/15] drm/amd/display: Update colorop pipeline tests for new fixed matrix op
Date: Wed, 11 Nov 2026 17:05:14 +0100
Message-ID: <20261111160814.21326-2-mwen@igalia.com>
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

From: John Harrison <John.Harrison@Igalia.com>

A bunch of tests verify that the pipeline created by the driver
matches an expected pipeline hard coded into the test. The below patch
added a new op into the driver's pipeline but did not update the tests
to match. So add it in.

Fixes: 6d103ad11583 ("drm/amd/display: Add fixed matrix colorop to color pipeline")
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c
index 90cc5592ef5d..00f1d5b33b1f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c
@@ -192,6 +192,7 @@ static void dm_expect_colorop_pipeline(struct kunit *test, struct drm_device *dr
 static void dm_test_initialize_default_pipeline(struct kunit *test)
 {
 	static const enum drm_colorop_type expected[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,	/* degam TF */
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -257,6 +258,7 @@ static void dm_test_initialize_default_pipeline_caps(struct kunit *test,
 static void dm_test_initialize_default_pipeline_dpp_3d_lut(struct kunit *test)
 {
 	static const enum drm_colorop_type expected[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -278,6 +280,7 @@ static void dm_test_initialize_default_pipeline_dpp_3d_lut(struct kunit *test)
 static void dm_test_initialize_default_pipeline_mpc_preblend(struct kunit *test)
 {
 	static const enum drm_colorop_type expected[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
@@ -299,6 +302,7 @@ static void dm_test_initialize_default_pipeline_mpc_preblend(struct kunit *test)
 static void dm_test_initialize_default_pipeline_no_3d_lut(struct kunit *test)
 {
 	static const enum drm_colorop_type expected[] = {
+		DRM_COLOROP_FIXED_MATRIX,
 		DRM_COLOROP_1D_CURVE,
 		DRM_COLOROP_MULTIPLIER,
 		DRM_COLOROP_CTM_3X4,
-- 
2.53.0

