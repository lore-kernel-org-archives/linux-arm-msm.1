Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C063431A4C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468274; cv=none; b=eL1pQDbiMfN1apkvQCxI1XS6qaXtMaQIdF+kEQw29jBfKtM7iNIDdo+Wgna8hFx1fFHSKrSK/CJJiuOXDB2n3UDdG1InxJyoCslqjkRZ4GRRnPqlwvjQ1E5A1aXONQq89uf0fQ1XtTtAVDMsPAvNrsth2+0w/Qu7igDyhGJVHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468274; c=relaxed/simple;
	bh=Z/WTliNJvLTvOcXydJZI/zrqtG/jf2HyvEojNZ4b3P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgaw52zHNxp4HazzlhyMuxIoTvY3aHsVHGEa2V14HIKbxdlnlzz14YRDEThYx6kqQh0Hw6F6oTQQLXVw88gCSGArY083KosJbQPXRRppcuiTjG3KfH2xEyvsE51/UUXAnqVy1e6GyTieXSAsieDFLo0dTyYf/txRP+VMYF+3om0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BoR16pZR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BoR16pZR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=0R/8QSF9rsUV/I2X2ZO5JMNGHhsVjujX7spy0FNwWEY=; b=
	BoR16pZRNeh5log75rwHefDmF2Ws3yJfCVs65hGz9E0wCCjGWjsAqT3G3oeId6SVxXSXC8VbDlIgF
	dDZiUoD/rdC+UR6VSN5QEHKs3guAUEzaAKReYUP/QsrR/fx8EIFk2qBR3+j2WIzda/aBvo+q2DxY5
	h36fiYfkOyhRr+azUQncUfXEeUWQ9RO40K0ww2oYijmgmuEx3H9sVDyFcM3cG/yDgidpP4+l6odaj
	nybZzs7HXUVkOzqOlTILAGUbiLQNUYm4Lflf/16xZKOlpoi7cuAWEG9hbasvT9gEvbR+8oVYn59x8
	6W41kXNdz1QMxAchSm8f+dW7YPYgR9eJIQ==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpze-00HH9d-Lg; Tue, 11 Aug 2026 19:10:26 +0200
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
Subject: [PATCH v4 06/11] drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
Date: Tue, 11 Aug 2026 18:45:55 +0200
Message-ID: <20260811171011.184964-7-mwen@igalia.com>
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

Latent issue as the driver is currently just skipping programming 3x4
matrix and hdr multiplier blocks on bypass. Reset to default values if
the bypass property is set true.

Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c    | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 357c7c5c85cf..450a1469d0fd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1595,7 +1595,13 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
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
@@ -1634,9 +1640,13 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
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

