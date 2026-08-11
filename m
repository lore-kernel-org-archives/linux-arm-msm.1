Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13D43F4C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468272; cv=none; b=gdWEqSbHEvX0NF0nGRDmrDkLZIMRnsMIRZf+nMxRCgyH8tqMueHYkr+Zt3Q37DdMF8FwRh3GunVvLBa6L4XVXpVjPyy1zldIVDZkorqMP9Kex15wxaQM3OJU36/sEQIDTxgi+Mm7M+ieAqeM8TY+45kc2w8ULTf6RRk18o1KHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468272; c=relaxed/simple;
	bh=mgZ2TrtH7JQ4ATTCBVz7YkOO/NUYZ6+oVMVfWrLP8FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOOoS3m4+W8+qtIqJ7AeHae/xw7hMtDFxT9PZy/vHh63mR8QpsRsoITdLcJas58K3EeeGvCxQ5wHeS+AfeTWGkzEs0pIMwdSUela8kdMp9mOVsz6iZywHH5SWRWysppmAhXZsFruyEeAppWaYdrQvcnZ7/4NCudWqBD39w7OtAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pJJOfwUu; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pJJOfwUu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=6wxTK7P3jCamLVB45nsIDvg8qPYN9Nhe8EEXCEZBTOE=; b=
	pJJOfwUuAGtJGShl0Zl/0pSmWoMIdAzezJ2HbK1PG2Zxwj0mJQ3TGuts96EBPGqs10VL0/Oxz9LJO
	x/CTwBCtVpYwXjVdv0Mg7cHdRVPiRQdp1Xhc8X5ZBVdnJ+Vwv0C1LGFZvf4XnAWlCSgWWMLytB8C/
	Cs5IQiUZBACjNObKFJNc8GO/huIo3dhJfvLQNZxCR0khxaZg/QYOtM3zLRQ3rDRgP+gkgbn65yIn0
	voF+lYvNzCW/jj/YUJJDzss3t24k5Icm3zMhnOQXkHu+6lx/47k1cokyDtzIqK8KZWjqvL4+w3D2p
	Hy1Q7H96aHzjtvCMlRMiHb7cZyKKxBGHog==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpzh-00HH9d-A0; Tue, 11 Aug 2026 19:10:29 +0200
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
Subject: [PATCH v4 08/11] drm/amd/display: make blnd bypass mode clearer
Date: Tue, 11 Aug 2026 18:45:57 +0200
Message-ID: <20260811171011.184964-9-mwen@igalia.com>
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

If userspace set blnd colorop to bypass, AMD driver just skips blnd
transfer function configuration. Currently, this is not an issue since
dc plane state is a reset/default state, but it's not fully correct and
doesn't mirror shaper tf helper. Make bypass mode setup clear by
initially set tf->type as BYPASS and let the helper change its type
according to userspace requests.

Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ca9e43e81edf..ad67106c6435 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1837,6 +1837,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	uint32_t blend_size = 0;
 	int i = 0;
 
+	tf->type = TF_TYPE_BYPASS;
 	dc_plane_state->cm.flags.bits.blend_enable = 0;
 
 	/* 1D Curve - BLND TF: find state */
-- 
2.53.0

