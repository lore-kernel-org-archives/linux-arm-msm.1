Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2FF4C9010
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323212; cv=none; b=V2CTav0xw8Q5FsMgZ5ZL1uHegwSBS90Kwe6c1qaulUG6GhF5k82HRJGnP76FmpDvwqtoC1MIeSQhj5WY8m79NxDvfSd1lHn8AYTb1AojnhKR8vgXxD19PRSo4BxdmU5vqXv0WOT2BTJYbL6Ece86ldgcrDkUzimEezYd/L0DGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323212; c=relaxed/simple;
	bh=GH8nQshyLLnzmePPkdHs/dNDNb7kP5GsBV4zWI8Cxns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFWoVRstZhX40yKrLeivrUyICDozAGYlzSSHerYck2qaLqlwyPckBzC5ISdgxPlUWcYLmfW1SS3EGUCVlPgCc0d2DcZjLbMuMKzxqFSzTbVPckwo4X0uPVASa9q1JRg4kXqMq8FEJqjFXuwIEBhgo8VhOTU/XH0gFRAvtqz9JbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdiZxrCv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdiZxrCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9E01F000E9;
	Fri, 21 Aug 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323203;
	bh=R/wr3BnRW2h74QzRjCstkBDHB0wUDUGJuBpar7/eCTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TdiZxrCvFtfaw9xpHwriBbLhIYxE0duk+8PUQ5NliFJUDYcQ2YRYmLXxxKhGOrSVe
	 dkH+3k3BV9L7xc+0tiWB/Xq69+N9BKQilXrArDztqR8dbxcc+UKQK4kpxR4p74ZMIG
	 gnmLyf6qh+7BdRPThoov474crWd+BKY26dVlIou9h4KWG5PBWFrGWROuF/PYb+cByV
	 NxcEw0jHcAUjmUFhduzUmhRn/deFbv9Jq35b0lH7f69qyfG9uGdSCulxahyEPVwHj7
	 ka4mx/pkBgMn0Fw+HwuKCmao7qUUGRc3yfGA6wk5vsXhORCaBu1daQsgc1DIqPrAEo
	 hiX6yiKJleDTw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:38:53 +0200
Subject: [PATCH 17/70] drm/msm: mdp4: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-17-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GH8nQshyLLnzmePPkdHs/dNDNb7kP5GsBV4zWI8Cxns=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdSf+r72xud4pqf7eGY/fen/LpSt+jDyffae2erXvoa
 tETvQTfjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARMVXGhg/1ZTN2v76eOI/j
 c8itU4minZp2V+qt/ijP+v5FVneD3gKWqgMcm7f/DHPlOSV0/ML5YsaGuTInqtluHY5qfF23tfP
 klCn6ZzbturW0pXi9KHvNLHenmZsOu7dwSH3aEVn7y6Lyj4ECAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The mdp4 crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 57dfce58450b..93050b3c3548 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -475,11 +475,11 @@ static int mdp4_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 static const struct drm_crtc_funcs mdp4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.cursor_set = mdp4_crtc_cursor_set,
 	.cursor_move = mdp4_crtc_cursor_move,
-	.reset = drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank  = msm_crtc_enable_vblank,
 	.disable_vblank = msm_crtc_disable_vblank,
 };

-- 
2.55.0

