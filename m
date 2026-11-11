Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413356;
	b=dfAj5wn4/548b1tB7cocqID2Cu05I4vvKzu9e5cxA1JbMejoRYZjl9Smi2t7B7N0xQ6j
	 Oc83JMDzTHiDAE0cOx3rP5anXi0HuoNSlwK/OpEz7hEKMtQjq5g+8HL2FObQ1C5uw4qax
	 Lf/G7k6EL7jOWKymJzAcUHi1BqViSa/z1lFjL5+a+UvWfE1+iKXJIqof03KMHYZOdWTrh
	 V1v52R/q1p3RPKSJ4DD1+HCuSGSPLRm7ch61rSfDFqUzcJIvEGW5XN7BMVSEfrbN9cnG1
	 1fywgwcI6Q/lPYtVELse06ndkFSE13ldWzkm6JzmKdSJ3rAtEZVOce5PCrnU8GT+neg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413356;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BAE9idnwOD10qYdzSWIYNdE/NfvRDU68ledfePCFivU=;
	b=qOOBIVv9comRuM8LrJ+LW0P7fttgyTSZQO5pwfQA/Nr0pF0MzXxW9PKATxdn3FIx1jiM
	 pNrcXDMxXfgOPfr/QMuZbNcwo4+QEq2+MDBpZywrCuAl8Mt45+LN1czAGpcfrEI5K4qcd
	 8yzc/RubbDhMWWGfG1A/bUXezn+WxG4hFWPcY9GgBwzvnRkpi25LFiQn6DfbXu2PLeB7v
	 cQiLdUoefpP8G03yZAZpcmE/UqNbyXsA9HOy5FY8kS0celSH0dwfRZ6u34RFKQtM9fFj3
	 57fT50ym6xTZJ7sb4Cjp5ShdFLVjoEi4GWVpU6pcHatfRDIq+7VPv36fujWx20JQkzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KS+ssnCc;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABAE606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KS+ssnCc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=BAE9idnwOD10qYdzSWIYNdE/NfvRDU68ledfePCFivU=;
	t=1794413355; x=2109773355; b=KS+ssnCcI5q1n26hhU4vsW93fRjL3rybO20gC1TFrQzEbEV
	PHsIdC4sCU5EUZ0aCBPgEngge4Rmrcs2A0H9MuNzDCjNONYo4e99Du0GYE6Snftkt1TBwvl6VMNmD
	O7C+0Zesu1yN7F3iW2Pu9SGsesdNwN0TxUZBzEs1dibP2rRqLnpSV+iQbs+yl+v5bLq0Gf4VyvlTl
	mG7WAP4+MYuIOJF0CU2RP7eFjEQggYfZoUqLG2KQt4aPRpf1NlRWh3V8M1v4W4YZrHjrAMw0Of8GA
	8hzzDLMbzgPWzwKbFXIGdDGrDgeOQZynxex2Q1Uwz0Cor/7uvbPDfLKT3+X/Gaxg==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsM-008u8Y-G6; Wed, 11 Nov 2026 17:08:42 +0100
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
Subject: [PATCH v5 12/15] drm/amd/display: don't ignore failure on blend colorop setup
Date: Wed, 11 Nov 2026 17:05:25 +0100
Message-ID: <20261111160814.21326-13-mwen@igalia.com>
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

__set_input_tf_32() can fail on ENOMEM and let the blend transfer
function setup in an unstable state. Check its return value and only
enable blend if transfer function was successfully configured.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 5ed78b44e4e6 ("drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT")
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 686f718bd155..f53228072fc8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1936,7 +1936,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	const struct drm_color_lut32 *blend_lut = NULL;
 	struct drm_device *dev = colorop->dev;
 	uint32_t blend_size = 0;
-	int i = 0;
+	int i = 0, ret;
 
 	tf->type = TF_TYPE_BYPASS;
 	dc_plane_state->cm.flags.bits.blend_enable = 0;
@@ -1971,8 +1971,10 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
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
@@ -1980,13 +1982,16 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
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

