Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC3403150
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468273; cv=none; b=evYALh0+DDwZBYvyo0rWyguEiN0fIrcdEtejHIP4dNmSO2zhEKcdGEItjabCvbgSXNtMNvoGIKX5UrBl3CtZKdYNs7I8PSzrvZBhj3EzzEIcb0wfNrFZN0xYPi4F8MInoI02asQ4mUN4Q4zGGMD2PvluMNctzb5DH+Ys475CULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468273; c=relaxed/simple;
	bh=noeuLZIXVRXsRCbzRnQYkNYAovbQ9XV2d4lF9JBUQy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbSUxFJgvhlK0J6sIS0VOjLyjzzlY1wTP71mXghqaZLxYSK7O/yeUeWwL+iwn/k6dbFB/StBzEbRNim5QoHPRyC+DuWKuipZqxDaXbwnXttgwu7cK3r9W4nZwaiKFBVdDG4EWWEK4T1TiPSx8T0GaPq3jFbs9dcQQ5XmxgZHaxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lSRxJv2a; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lSRxJv2a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=j+nmPh8F0cdvE2cCJjOLedVMO14AmwK+Bi/Xq5bnlbw=; b=
	lSRxJv2aQaihQ++qZDfeWiXq01d3LUKxpS8tw+lhab+nL4s9WbwrlsYxYoVh+DaVXrp00QIoLogob
	2fah4hxKX/Hp7qTSVCMHQpD0tRftJbjW1KYzQn+b/Fp4bKrhX/rOzfnxb62zU5y6eDJ8+kiqwvnyv
	UytDXjBuUwtum9XFxhdPwzz68MkAPhTwTrS4AtoPnBsFCOH54ov9LBh0JaGcxuyTaPyFzj/8NXN9v
	FX4WY9vlpbFrP52gp38B2YlHjHZV6WQL7tv0IxfNMeOqBtEWkiry/KtrtEs7n+wFoqIsbgoUPk8GX
	usoxlBjiCHIknuYm0AN7hliPmPn8146vnw==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpzf-00HH9d-V0; Tue, 11 Aug 2026 19:10:28 +0200
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
Subject: [PATCH v4 07/11] drm/amd/display: make shaper bypass mode cleaner
Date: Tue, 11 Aug 2026 18:45:56 +0200
Message-ID: <20260811171011.184964-8-mwen@igalia.com>
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

Start shaper transfer function setup in bypass mode, i.e. tf->type ==
TF_TYPE_BYPASS and let the helper checks set it to a different mode
according to userspace request. It's aligned with current blend setup.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 450a1469d0fd..ca9e43e81edf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1666,10 +1666,12 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->cm.shaper_func;
 	const struct drm_color_lut32 *shaper_lut;
 	struct drm_device *dev = colorop->dev;
-	bool enabled = false;
 	u32 shaper_size;
 	int i = 0, ret = 0;
 
+	tf->type = TF_TYPE_BYPASS;
+	dc_plane_state->cm.flags.bits.shaper_enable = 0;
+
 	/* 1D Curve - SHAPER TF: find state */
 	old_colorop = colorop;
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
@@ -1703,7 +1705,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
-		enabled = true;
+		dc_plane_state->cm.flags.bits.shaper_enable = 1;
 	}
 
 	if (lut_state && !lut_state->bypass) {
@@ -1719,17 +1721,10 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
 			if (ret)
 				return ret;
-			enabled = true;
+			dc_plane_state->cm.flags.bits.shaper_enable = 1;
 		}
 	}
 
-	if (!enabled) {
-		tf->type = TF_TYPE_BYPASS;
-		dc_plane_state->cm.flags.bits.shaper_enable = 0;
-	} else {
-		dc_plane_state->cm.flags.bits.shaper_enable = 1;
-	}
-
 	return 0;
 }
 
-- 
2.53.0

