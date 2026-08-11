Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704D456296
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468272; cv=none; b=V8DYF3sn0n9x6h9bV5r2d/G+FjnbNjkjAPABXYuggVzBdeWRtFnxKVdD3wTmIJt1uLhP3fI/xjDODlJ49yZr5wXZMGsplpdc48xAOjixhSGKxaTV/HOhzdc9lWkrv8yMupThsK8DYEWDQm9vtCl7fCxluVEl31uu9PUvPDnuc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468272; c=relaxed/simple;
	bh=vjjJ11DQHfq8HRl1GLTR9/0DnECVP1PEow161MG1uGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+ybYkLdLiKZy8EIlnjYITyY7Knnd6k+UqhR8JDIggcAt/Ks/2j4S3GVtQ+gvA/3DVJI2fY/5o0/e2iXnPpVhavr71t9Qk05AunizTrEGfvUsS8aHolmNmkMg90v7gZ/Ufc/NViallRRlNXKhC5z02lxWDEwccPIiMWnCEyl32o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CGPi7H1R; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CGPi7H1R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=LjXymtRRb6BWMpk7UcD7TFtGhe5or8FsGDX+VeAa6Fg=; b=
	CGPi7H1R+X9gH+PRBfOnnsWzZPTJrzHhkpSNF2rwDrb71Qx9IcOPdVmNCuB5dlowUDzoTWmveKCtr
	pTO/coDi/7Z6NvYvTRFqEf2KRZ0OHc4bz+0tvMGROXGIlmz72TbpL79ethO8jXu1xtIoeaekWTlMG
	IXhVRBvHr+ka3EN2Ne4r2kdfal7J6YeKCgK8ujjvMAtbgVPv+9BHSIneEdxJow6VzIxe2SWwD8i3G
	IWFZxCfwTa13UE1cHnVJgZGR3d1cGjZFriUXicjY/eSpHqmB2J7mkno8oYf2GTTZRHKiZCnnZHzMo
	tJ1P6v5Oe63rgIzxHmum1vIzEwTf4YrcNA==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpzi-00HH9d-Me; Tue, 11 Aug 2026 19:10:30 +0200
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
	Sashiko <sashiko-bot@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/11] drm/amd/display: don't ignore failure on blend colorop setup
Date: Tue, 11 Aug 2026 18:45:58 +0200
Message-ID: <20260811171011.184964-10-mwen@igalia.com>
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

__set_input_tf_32() can fail on ENOMEM and let the blend transfer
function setup in an unstable state. Check its return value and only
enable blend if transfer function was successfully configured.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 5ed78b44e4e6 ("drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ad67106c6435..c528daefac5e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1835,7 +1835,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	const struct drm_color_lut32 *blend_lut = NULL;
 	struct drm_device *dev = colorop->dev;
 	uint32_t blend_size = 0;
-	int i = 0;
+	int i = 0, ret;
 
 	tf->type = TF_TYPE_BYPASS;
 	dc_plane_state->cm.flags.bits.blend_enable = 0;
@@ -1870,8 +1870,10 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
 		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(tf_state->curve_1d_type);
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		ret = __set_input_tf_32(NULL, tf, blend_lut, blend_size);
+		if (ret)
+			return ret;
 		dc_plane_state->cm.flags.bits.blend_enable = 1;
-		__set_input_tf_32(NULL, tf, blend_lut, blend_size);
 	}
 
 	if (lut_state && !lut_state->bypass) {
@@ -1879,13 +1881,16 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
 		tf->tf = default_tf;
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		dc_plane_state->cm.flags.bits.blend_enable = 1;
 		blend_lut = __extract_blob_lut32(lut_state->data, &blend_size);
 		blend_size = blend_lut != NULL ? blend_size : 0;
 
 		/* Custom LUT size must be the same as supported size */
-		if (blend_size == lut_colorop->size)
-			__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+		if (blend_size == lut_colorop->size) {
+			ret = __set_input_tf_32(NULL, tf, blend_lut, blend_size);
+			if (ret)
+				return ret;
+			dc_plane_state->cm.flags.bits.blend_enable = 1;
+		}
 	}
 
 	return 0;
-- 
2.53.0

