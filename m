Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413350;
	b=TuFQcL1xGObubM1ov9eJT2Kgoe6iKd96aaWYJHDbIvwzPuanw4PRmRECeY8/wC9D2/U1
	 LU4hr0RV6AE3ikebsYgsQRQR3pKhEI7Xd1seTMS5GWefhaq5f9vVqj5PKlIWBBx1hdxZB
	 lMsRkmgnwS2H0IokPxRP/sXW0SX+SBAnMglmOMta9sYzjJuCcRzPmAW4uz5e4w/YsixPF
	 +38ZuLgrED0XKNowo91Ov6xGoN7jm4vbRKwBXTLpKdOJUx+Ha8rJTJzHnbVblqHX1G7Cs
	 mOlXVfElGddJLUppQaXVVzhs+PedeXo61TLgFmxhI35dNz5ikwB69X70Rz+mVcpCDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413350;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IH1IrCh1AI5My9yEGrI2C/SDhX0IyneiDvEbL4p4nLg=;
	b=YUEMLa/GGy3VaS7KNQsG6jhu7jMfLEqrM97ge0Rr3SqUY2xy3Bd1pd1889Suetp6I27n
	 tP4ll9iNSQ5kuvFJ9c/9lm+SO2EDcRUwAYKHdylyaMavnmwMtBKiXLM0CTbIAEaNQsrnG
	 w6tcaNE4W0SQVsstM5aZOI7aM3/mC7VElvDbgdo1rQiGjxrQSz+IXymRiz0tWYZIg9kiL
	 WVhKqv6yLQhnntHXtrDur0ZI1XlMY03ihi0YMmTo8KoF6GI/wGK473q1wqIc7s2UzT4mQ
	 Dv7Q9mFqyvuAtkHpkvKjRciaAP5+DkLMa+muOvkEdP5F0z152ZCT3qDS7M6HksRBxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=jRZ+R50p;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2D606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A2D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=jRZ+R50p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=IH1IrCh1AI5My9yEGrI2C/SDhX0IyneiDvEbL4p4nLg=;
	t=1794413349; x=2109773349; b=jRZ+R50p83kmy5XySsLe771q4mf3hGv5RcmmrPScULh/j1T
	Enk7uerbEDVKRLggabG2MUV/kJx/BcjdHU0Arlh/zxvs97+uJXdVdTePg4ncKLDc98wU48bVoPBli
	kXuQohFf3qQK5b388z3VrUhg9Ruf0KVp52NvKXXKqAfW7OFj/mHK7ELU4dKt76Pz5yFrPrL2Gpvgg
	YTcThwQLOq0Uy1P4vK28gHtwaeCUQiByuQySlN7xbobxnJMlJbciAFyDScbW+SqxO3qE0IwKowKXS
	zDCXSGkD7VYpQ39R7gXLWNpDEndjh3ncFQ+t05Tv+BI/NFCpg2UKy4il5zg6VvqQ==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsK-008u8Y-AZ; Wed, 11 Nov 2026 17:08:40 +0100
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
Subject: [PATCH v5 10/15] drm/amd/display: make shaper bypass mode cleaner
Date: Wed, 11 Nov 2026 17:05:23 +0100
Message-ID: <20261111160814.21326-11-mwen@igalia.com>
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

Start shaper transfer function setup in bypass mode, i.e. tf->type ==
TF_TYPE_BYPASS and let the helper checks set it to a different mode
according to userspace request. It's aligned with current blend setup.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 59dfae5a4a26..6455898e2da9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1766,10 +1766,12 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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
@@ -1803,7 +1805,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
-		enabled = true;
+		dc_plane_state->cm.flags.bits.shaper_enable = 1;
 	}
 
 	if (lut_state && !lut_state->bypass) {
@@ -1819,17 +1821,10 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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

