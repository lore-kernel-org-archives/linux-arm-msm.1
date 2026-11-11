Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413347;
	b=Dd6R1RqIZ4UlgRTFHyzWSjOrKcRiowGYOkbY1nAKcQaaTk/UbGz1++LyruBpoowt5Boa
	 hZ7mnimMyEghvNhh5f7EZDVdRI3F0Tdrp9nHZfFoScsTTIANkBl910/lEPQuVDfuJbv+n
	 h3izDdNy5vf6F/dVu8rPzCvpJDTeYObzK+5UP1U5I0tzBkkfal9BeAEf7zrl2FiK/vOTN
	 2q9mDcwLJvoIrSEA1q7HISq2cqE4PWbl/XslJf12VYxFaFvhXtiu6e73uJyudOEMZGRJs
	 c0GHBD9Nw53ahjJH2diu/xQREcXiNr1WbWltQ5KX1fGgliO7ITF8Z13fdzpq58vV4aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413347;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vhJpOnyWAz5uiZosJGVLwxlp+dogNJrP1/dgdKqGrCU=;
	b=LSeEubzhvrmNY7IR1B2RGpeOv/3X0fCEKtuzQocgowDiCu1HYy1IPGtUjYAJub9i1UfJ
	 b9rerLHqcFhJpBS+8H3eAAGmkX6XJLlq1YNJuMaxXQTwSNRyynzhVyHbV+jDel+tmdvOq
	 xlTdPXOZTQJTuySw4I4oHgnx8PqA5/Yxoykpn3Z1gHXaUwJfn5kk8A4ow0BZnVZ+aSevu
	 lkbD6KqsMtrAYZhDTVuYnxbmpd9Hnsqu0XjW1aoZX4rQPR76qwgTnMgZifKa0Lr/GgXe6
	 64FG1+ubFNVWT3VkTTcc6ztdwKhlb/UPhHhcpoK6KXKhxS/VtAGyYntbtqxkI01PIxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Nw6C7f+d;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B7606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Nw6C7f+d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=vhJpOnyWAz5uiZosJGVLwxlp+dogNJrP1/dgdKqGrCU=;
	t=1794413346; x=2109773346; b=Nw6C7f+dd5cFMopEjjuWMW0edrB2BOUQjbhrm+kt3lqUHz3
	RHR5t12MdOfhg8zqelqb7oVGqpyAL7OEphQKC49d9S+0VP1nFgo2wAj0hvg6psTU7NE12HUlWntpX
	43mAawsI47LWVVG7s3B0iozBjhoOiIcdXaofaEy+odcYnALoLzdVzG4z48v2PxwU+EaUxnjdBoJEO
	t1COi3z3kj3sDsNrf6fW2LXrioA9HuqrT6Uckxt16qCesbdXtpI5xLWESh6JNzQsipgc1y39dRk6R
	R/OfpJg6zFB21xkXkAfnNZg4ethglpDnG+aW8JBYS2p0p27KkM+rztLTUfoMgumA==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsL-008u8Y-D3; Wed, 11 Nov 2026 17:08:41 +0100
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
Subject: [PATCH v5 11/15] drm/amd/display: make blnd bypass mode clearer
Date: Wed, 11 Nov 2026 17:05:24 +0100
Message-ID: <20261111160814.21326-12-mwen@igalia.com>
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

If userspace set blnd colorop to bypass, AMD driver just skips blnd
transfer function configuration. Currently, this is not an issue since
dc plane state is a reset/default state, but it's not fully correct and
doesn't mirror shaper tf helper. Make bypass mode setup clear by
initially set tf->type as BYPASS and let the helper change its type
according to userspace requests.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 6455898e2da9..686f718bd155 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1938,6 +1938,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	uint32_t blend_size = 0;
 	int i = 0;
 
+	tf->type = TF_TYPE_BYPASS;
 	dc_plane_state->cm.flags.bits.blend_enable = 0;
 
 	/* 1D Curve - BLND TF: find state */
-- 
2.53.0

