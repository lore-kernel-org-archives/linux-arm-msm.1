Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5334562BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468273; cv=none; b=uA5WlzC2eGZRn/celiicyU8KUC7VREzNnszB6PXqehrLxOYIJhKPHC2kvtw3RD4M5COOAmqIHYCUFCwEVpAQU59qZ1bYmth1a6r7iAgEDBwE0TDZDiKC6CpLxnUc/dbZ5buL5eg4qbwnRWLTU27HuPIsEMtIMzbho13RF5z1Q1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468273; c=relaxed/simple;
	bh=uYD6Tz9obLu2ZVS6EEmug0Z1TU4ExSmG6g7Wx3ci3tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9U+sXme0wAWNewzqfiKF3KiUdrsv8DLMgcZyHJ9cZdOZsYExxxGrdPweyP3wjMN/zvDFSPNvZwFFCvHU/+ccGCB73UY+c+uAL79TljUPx35TyWMgwfPANvV/06Sdhzm5bhef+khFOEv3VOeqJ090U3SyPN0VJelh8CDLVtESGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YmPl7ouN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YmPl7ouN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=//TxnqmlztwKvjmOKGcBYvIodU2Ir5/N828O7glJey4=; b=
	YmPl7ouNJi7kF0nPGlB0RlbDSuiODNB02o1DVUe5KCyvAaEFI0c6/1utb9lMx13gjzyqFGQa3v5VK
	d9ARCmcdWNQlv2VGUFAcWuHhbpSiVjf1zaXku2vCyc5hGqv06NEocxNrKFMGzV/M7WH2xUNWiQp46
	Mey8aY2Sgum8vfwJUWu1gqRbBr85apPWfucg67q8SsKQePOeZqobIXOvugFClh6VQCRVNaV/98yqu
	Mm0pC1F9R5CI0froKw2H21MeE/BLGvMkHIqSk1bqypRK5cpS3ZAuq1seBQKmWJU/hRRUBGPMAtK15
	Dn9PW/BRg6roZgf568Jr2XeJpA1F80qyOg==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154] helo=killbill.Home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtpza-00HH9d-Qb; Tue, 11 Aug 2026 19:10:22 +0200
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
Subject: [PATCH v4 03/11] drm/atomic: duplicate state of all colorops
Date: Tue, 11 Aug 2026 18:45:52 +0200
Message-ID: <20260811171011.184964-4-mwen@igalia.com>
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

Userspace expects that colorop settings of an inactive color pipeline
persist, so that, when the color pipeline is activated again, preserves
the values they had when it was deactivated. Colorop setup is expected
to persist even during a suspend/resume. To snapshot colorop settings
correctly, duplicate state of all colorops in a given plane, regardless
of whether color pipeline is active. Depends on skipping
drm_atomic_colorop_check() for duplicated state done in previous commit.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 917fd0594259..11c67bb808f9 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3801,12 +3801,9 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
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

