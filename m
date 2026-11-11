Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413344;
	b=DCTU+zJ+NkF2HVoEI87bf3sx67+zmY2wtJMyYCPMemVaW2gG48FRvoxLwqWwbGyz325g
	 OXJPXvOPhl2izTCx5Z8hfQHewSJUF/IPSVdt/Kd7LzaF/3hFqB69Uv1rnXh+dedpHyhOZ
	 KrzwJ9vKPuK+n1/CEriFZEnkUBM0Hz0VxExHIVlbpOq2Lnnkzl5qf4OK0fvCyClJ6VttS
	 hz+NX7YJ5gCciYi7tv+vE1qDPnx6sPrAu65DZ4lC5cyEhEfBDnPJmeVswzjW8JlYgzXhs
	 tLU+T/2Yeimv8G8nhgF48gCaG0jwhG0vU/sSpDZIp0nB+NbBSWRCdTnYc7vq2Arxi6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413344;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rlH4vov5RMimytemQtB5DfU12GPz12p9a3viIykG/aY=;
	b=pWXvvVI6GgGoIkgnTodT7EjYZaFDky0aV24iGn7rCJFJFfQonbuEn6HH9e0QQsP+3UJF
	 8zJuEQmtrtJBxeDmRpUvo1Dl1WhnlnZe1y0cEEH6OHRDzXPA4vzpq6kYerfWtLSi+Hj9T
	 bdzXf0joUMuT3Xf68iIuRTwuCI2q9BALc3d4QrzA/tmw6rsonF4DivpvaUcZD1wmeK7J3
	 VY++XxKz3Bi2E7XAjEThxjlIp9ajiny56sPPuFRPojozhv5gJCYBM4sWm5dt8Kos20SIc
	 ydUBmh7Vqg/GWMCwqXurLr6F8hOzZAG4KfNuYj2fUkFlCUVI+uM1C/A8yPO9zzFwTWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=b4y2fYSP;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3725606A33A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3725606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=b4y2fYSP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=rlH4vov5RMimytemQtB5DfU12GPz12p9a3viIykG/aY=;
	t=1794413343; x=2109773343; b=b4y2fYSPp7+i1DtXpeY+0NMwC1UOYg1CMCQEj4mHIX4iCu1
	B3sVW2k949ZgfItXZ8WBbbPxK5b49fsXH2dPz1CaSw1uAlh+qy1LlIVBwcVoMygfR2Hy0T/Hqo4ta
	jV0f1A8a6Zz/7rUnDFww/0BYOObclvruCYEdJQt5/k9MUSmo+6UaW92RyZ0RuvOT/+nHelWZtspEq
	bS/N+yrT377yz3MaxnFK2Mf7jRdY9V81RfoTcfF886ze49pZc4cyyJQwjPzSevvViZ2mkisNpFDpW
	jJ5D8v0lAFABAlq0E+D1yKnAQNFhBvYh7aZDDvigUK9khLPPY61rs1wupD5lmjug==;
Received: from 193.red-79-147-123.dynamicip.rima-tde.net ([79.147.123.193] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRAsH-008u8Y-2d; Wed, 11 Nov 2026 17:08:37 +0100
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
Subject: [PATCH v5 07/15] drm/atomic: duplicate state of all colorops
Date: Wed, 11 Nov 2026 17:05:20 +0100
Message-ID: <20261111160814.21326-8-mwen@igalia.com>
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

Userspace expects that colorop settings of an inactive color pipeline
persist, so that, when the color pipeline is activated again, preserves
the values they had when it was deactivated. Colorop setup is expected
to persist even during a suspend/resume. To snapshot colorop settings
correctly, duplicate state of all colorops in a given plane, regardless
of whether color pipeline is active. Depends on skipping
drm_atomic_colorop_check() for duplicated state done in previous commit.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ccfe3840d505..60e69061faa9 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3758,12 +3758,9 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 			goto free;
 		}
 
-		if (plane_state->color_pipeline) {
-			err = drm_atomic_add_affected_colorops(state, plane);
-			if (err)
-				goto free;
-		}
-
+		err = drm_atomic_add_affected_colorops(state, plane);
+		if (err)
+			goto free;
 	}
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
-- 
2.53.0

