Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413347;
	b=EsGRWFpJGTHuRjP3p69gVUedljLLIv8iMtNv+rceUXrHRu6SKXVABzz6h76K+jjxasCI
	 u0EhLe5ntZkGc4wUjJv1uwTRr+000m1KRsArqYWWMeEziu7tldYh09AiTCkPvyZT3Ohnc
	 S6FlfUJawweMnnDioZfK63gPGX/5DTsZ8PaOvFtrJt34yK6tYh2PcCbvU5yScTZdLzAYX
	 VjlRddfC51OkGd3nT+mI79e1zg8PBBwr/ye+jkQcrie9L3l8B3yoarZRxcVCeJ61yKPbO
	 lyTGxrCiXcexgxGzl/P9vrX1omAdjH7vlSvjx/4l7P0X3WC/HGPjhbCV0eodN/fQnpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413347;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7iO8yRKiK2KoQa6hRzM46vYrUp4atmnTKqY7wydsfBM=;
	b=Pxb95TqwS4zxd/L2u9QF4rkzlAEuMxezzvB5bF5vSXmqvLgRSUrBAlOY/K5xF/lvUic+
	 pf4Iq8Msd5ZXBoxzY8r3agbzfV4jmafuHc7tTEMW3ll6TZtL8vt3lRmBbsOFGkks2Ghjr
	 Heb8qz0Dxery1gThB1Cel7iI4wXMK0ag4l9hV3noj079Cbp5RPpGsjBfjX/LPDSiCrSnP
	 JDTKgc0/kzjj1f/l6qDcIwC2dlpoltV/1ASMuecm6KM9HXmt/HNm0ajZzTe47+2WQI91F
	 k6XoWpeKaQ1oTw8VWWDfFXERLHl3Nj2/9rgooeuUqeTHX7fkF8ohy7AW5NuHk8Ugzkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Hql1Vptp;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACD3606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACD3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Hql1Vptp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=7iO8yRKiK2KoQa6hRzM46vYrUp4atmnTKqY7wydsfBM=;
	t=1794413347; x=2109773347; b=Hql1VptpiLMSTweK7/Vyxn6Pomu4L607jNGFbqwnK5hXLgc
	vjtlG6FUMwq5wL3joT4mSwiir7s9eeNQGkQGURbtwNKscHDKJ3nay+Xh9gs8dYLPWTnCjNP7WGfDf
	JMViyFb/PZbTXZ4k0+FTepnJKv9lbemfH+eLt3zh1h9z7dVcuVBUMzXfvqPt3bfstOtSk9FQyKlPO
	IP7KPakiomHRhRdxqgeCLgoZS9kNs2B0/CqZncKdllk3LKh/xw4a7H2JDIiVye5q2o53LeUK1G1Hv
	Q4LTakSXTLHawxemzSZYMlXBGJbY8F9wJIb22TcteXhKkjpQ53V0jk7CNfdQ0Sgg==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsI-008u8Y-8x; Wed, 11 Nov 2026 17:08:38 +0100
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
Subject: [PATCH v5 08/15] drm/atomic: check if an active colorop has a blob if its type requires one
Date: Wed, 11 Nov 2026 17:05:21 +0100
Message-ID: <20261111160814.21326-9-mwen@igalia.com>
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

If colorop TYPE requires a data blob, userspace have to set a blob
whenever enables this colorop, i.e. when setting this colorop bypass
property to false. Clarify this in the documentation and reject the
atomic commit if colorop TYPE requires a DATA but set bypass to false
and no blob submitted.

Fixes: e5719e7f1900 ("drm/colorop: Add 3x4 CTM type")
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c  | 22 ++++++++++++++++++++--
 drivers/gpu/drm/drm_colorop.c |  5 ++++-
 include/drm/drm_colorop.h     |  6 ++++--
 3 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 36c9550c2749..d8b56fa47d45 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -990,8 +990,13 @@ drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
  * drm_atomic_colorop_check - check new colorop state
  * @new_colorop_state: new colorop state to check
  *
- * Ensure that the colorop in @new_colorop_state belongs to an active color
- * pipeline, i.e. it's in the chain of colorops set to the color_pipeline
+ * Check that a colorop whose TYPE requires a data blob has one when it's
+ * enabled, i.e. userspace can't clear (or never set) the DATA property while
+ * taking the colorop out of bypass, since drivers would have nothing to
+ * program.
+ *
+ * Also ensure that the colorop in @new_colorop_state belongs to an active
+ * color pipeline, i.e. it's in the chain of colorops set to the color_pipeline
  * property of current, old or new plane state.
  *
  * Userspace is allowed to finalize colorop's settings in the same commit that
@@ -1015,6 +1020,19 @@ static int drm_atomic_colorop_check(const struct drm_colorop_state *new_colorop_
 	if (state->duplicated)
 		return 0;
 
+	/*
+	 * Reject if colorop TYPE requires a DATA but set bypass to false and
+	 * no blob submitted
+	 */
+	if (new_colorop_state->colorop->data_property &&
+	    !new_colorop_state->bypass && !new_colorop_state->data) {
+		drm_dbg_atomic(new_colorop_state->colorop->dev,
+			       "[COLOROP:%d:%d] enabled without a DATA blob\n",
+			       new_colorop_state->colorop->base.id,
+			       new_colorop_state->colorop->type);
+		return -EINVAL;
+	}
+
 	/* Not a plane colorop */
 	if (!plane)
 		return 0;
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 95da03d6c65c..842fd7dc31e6 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -55,7 +55,10 @@
  * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
  * &drm_colorop_type documentation for information on each type.
  *
- * If a colorop advertises the BYPASS property it can be bypassed.
+ * If a colorop advertises the BYPASS property it can be bypassed. If a
+ * colorop advertises DATA and BYPASS properties, BYPASS can only be set to
+ * false if DATA contains a blob. An atomic commit that leaves such a
+ * colorop enabled without a blob will fail, returning -EINVAL.
  *
  * Information about colorop and color pipeline design decisions can be
  * found at rfc/color_pipeline.rst, but note that this document will
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 11a88e9477f1..952c30b06d83 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -283,8 +283,10 @@ struct drm_colorop_state {
 	/**
 	 * @data:
 	 *
-	 * Data blob for any TYPE that requires such a blob. The
-	 * interpretation of the blob is TYPE-specific.
+	 * Data blob for any TYPE that requires such a blob. The interpretation
+	 * of the blob is TYPE-specific. Whenever @bypass is false, @data must
+	 * be provided; otherwise, the atomic check will reject an active
+	 * colorop without a blob.
 	 *
 	 * See the &drm_colorop_type documentation for how blob is laid
 	 * out.
-- 
2.53.0

