Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413348;
	b=bnQkCsfgwxxxdEuOtX+31gxnYoGYKgtptgkedeFRQYmb8fsFI/5+2uz7dp55Ry+QQV33
	 HQfCwbRFUI7uzI6s/5gfMBV0tx+K6WUFnp7CqjiEYBwnlVfRbWoH+Uj+IGghWqtkflguH
	 /XEB2Z3PnwgoKnj5al33xolnxIicpDnDzWKjpRLIDh4txj1PApdiElFeRWa928G1Z6abV
	 5Myg4isWwRQvlxyOaTw3QU5cXkL6TqgIKsumdn/MCQ3L0kdBFsAw3gEnYt2+4hkDgWGzT
	 n4AwwWyHsXsVCmlcROkiMCjf9/z7qd/womRudJloKQb/ZMr28uFoV+YvBo8RidZMOyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413348;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/y5qYFZc99vTFQFHCcGT764DjvoopXBmEK09vTZo0IY=;
	b=FjInl43JEHOV6fCQWudjmkJPK7/BkSxeJz0ojd20BuVim9EpgDCK528nj/cXJGPBreA5
	 uZad7yrYFv4nFK0O02hLOXYgXoIwgOO1+iVyLGJC906sLLAiHX3B2WR+mxHmydN5I/Cs8
	 ClY7RVUW10LAtk2gcXicnQFZDS0m0Y77/SAIUe1ZkkOnwED46DxrUgXNvbrE+DrqHu15q
	 LuGYLXW5VksBXfMs1GNA5SoJaZqbZjeGfgugzQT2io/VefJMWNHLj9bklXLx/U1D6qqHg
	 ZUes1QVCYjLU/3gRy82ercQ1x3A/ASSpoXeYCuG0x+HzFTEOxDGWmfxSpz2AEO3cYpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=cuXt76bC;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF60606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF60606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=cuXt76bC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=/y5qYFZc99vTFQFHCcGT764DjvoopXBmEK09vTZo0IY=;
	t=1794413347; x=2109773347; b=cuXt76bCfOrBJVQHPiAG5mua5WFwyCbx0ZnRWM4U/oyR6jH
	caJTVRotgaaA7B56WaS/Uw/1dYM6cgnAhi/caIe0sxzEfodSgjeNEeRyQCLNoS4x76Dsl2tYlLyhB
	qpm44yEqZneQYU2zPDRPsuwQusNkrUQZdLt/KNQRXpXgfCeSzUq403Tmfe5MkTntu5am/Na1+7Yu0
	+sJCVeZR6JVUmz3aRqMKCBt3+s2VZ4oT/Q6g0bHRol6zwR59GPF01YxcsQFEAu83mdd+rPf9g3blt
	HroGbStHLTHvEX+ET9qDuyj5D86I+7rVJDvirHCfIr1K50scwMuF/8KnHtjbR8aQ==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsJ-008u8Y-9m; Wed, 11 Nov 2026 17:08:39 +0100
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
Subject: [PATCH v5 09/15] drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
Date: Wed, 11 Nov 2026 17:05:22 +0100
Message-ID: <20261111160814.21326-10-mwen@igalia.com>
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

Latent issue as the driver is currently just skipping programming 3x4
matrix and hdr multiplier blocks on bypass. Reset to default values if
the bypass property is set true.

Fixes: 16e0f785b87f ("drm/amd/display: add 3x4 matrix colorop")
Fixes: de0b0eb2e045 ("drm/amd/display: add multiplier colorop")
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c    | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ebb05a20aa0c..59dfae5a4a26 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1693,7 +1693,13 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 		}
 	}
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
+	if (colorop_state && colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->bypass) {
+			dc_plane_state->gamut_remap_matrix.enable_remap = false;
+			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+			return 0;
+		}
+
 		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
 		blob = colorop_state->data;
 		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
@@ -1733,9 +1739,13 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
 		}
 	}
 
-	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
-		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
-		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	if (colorop_state && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		if (colorop_state->bypass) {
+			dc_plane_state->hdr_mult = dc_fixpt_one;
+		} else {
+			drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+			dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+		}
 	}
 
 	return 0;
-- 
2.53.0

