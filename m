Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA142A152
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323297; cv=none; b=TI/yjii5Jc/lRfeQFDszQTPyCAJKDZOMkDS+xppHvmFKItDwoV0WG5LrV6DI7biIQRASR1kFbEoOyryJDtSPXmc87OifGq53+H+FIBndpNC7259IYI+28rGzK1PKO4Mm5aPdr354AruZJI5AXdRqkOkYY/N5ww7up1DKZippWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323297; c=relaxed/simple;
	bh=ombmf9hpe+qDj55uMlu1rOHBFFNn3wz6F6EzTnQXKFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oGzG22lGnPITYdC41hajkxSzGklEo33q/PMjS6uEjHS3VPlF3wrhjDyNvImZ93Ov7nddrEPsZ+Ep+YTSgWoMafhCXDMA9qaPozBbaQLy0JPc0bwi/xTVNblUorWW9waeCBQJdv+QHlCm0M3HzDg6KY+/NPcamT+30QwlcKDX10g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqpZKhTk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqpZKhTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8E71F00A3A;
	Fri, 21 Aug 2026 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323294;
	bh=exY7e7RcKMPMMFW0ncO9ZMzZZPCMaL0Z2n1EqU+RGwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eqpZKhTkDq/sDg7WvNetDO1uUsJIgg4+8vF4N1mFh8uBbY2mcq6N32PqYyId5GErl
	 qJsbhWdMp5mjeMfV1IQyHvOW6zcOnEtZaHrBiXs6lDj64D1kLt8vijnbqFqxNAiOi4
	 z9FwFBIfwKOtNopnh9QmBEGsadWgiCb0fP7B8xz+js7L03be3DByTpUpVTyw9xYw+a
	 HQ0H1GZ5IJzzvZms+UHGrhBo1uoGKioPvj9zGE2lFhTZ3DfW0u61FtCyhuSPfZSWt7
	 SnVqnCzPC7J8HCHMlHP3nf86k8+ozESluMBtCUgavUMOQku1mVNUeU4IyyQrOZd+UO
	 UOKuyL/mJxadQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:31 +0200
Subject: [PATCH 55/70] drm/msm: mdp5: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-55-fb793475c05a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3164; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ombmf9hpe+qDj55uMlu1rOHBFFNn3wz6F6EzTnQXKFU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyQKtTHelgw40VIi8kpzDfHL2wQk1/TM+O6yVV3tl4
 bLecnNfx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIFAdjreiH2HPGXbvNZ5Wo
 /Y2ZUyfasDFnr6begm1PDqRyN3St37LHk0nvxrsT4lfmvL1RfubuMcaG/celFi2KDRZIOB66Oy9
 /tzv70ctii78vFnLS38X6vzV7Ff8Ln6K163pP2CgcCng0vfkpAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The mdp5 crtc implementation provides a custom reset hook. However,
this hook only allocates the state, initializes it with
__drm_atomic_helper_crtc_reset(), and frees the previous state. It
does not perform any hardware reset.

Since this is exactly what the atomic_create_state hook is meant to
do, minus the old state cleanup which the caller handles, convert the
implementation to use atomic_create_state with
__drm_atomic_helper_crtc_state_init() instead.

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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4c4a897fc1ee..1e1fff37380c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1126,27 +1126,27 @@ static void mdp5_crtc_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state
 	__drm_atomic_helper_crtc_destroy_state(state);
 
 	kfree(mdp5_cstate);
 }
 
-static void mdp5_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *mdp5_crtc_create_state(struct drm_crtc *crtc)
 {
-	struct mdp5_crtc_state *mdp5_cstate = kzalloc_obj(*mdp5_cstate);
+	struct mdp5_crtc_state *mdp5_cstate;
 
-	if (crtc->state)
-		mdp5_crtc_destroy_state(crtc, crtc->state);
+	mdp5_cstate = kzalloc_obj(*mdp5_cstate);
+	if (!mdp5_cstate)
+		return ERR_PTR(-ENOMEM);
 
-	if (mdp5_cstate)
-		__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
-	else
-		__drm_atomic_helper_crtc_reset(crtc, NULL);
+	__drm_atomic_helper_crtc_state_init(&mdp5_cstate->base, crtc);
+
+	return &mdp5_cstate->base;
 }
 
 static const struct drm_crtc_funcs mdp5_crtc_no_lm_cursor_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.reset = mdp5_crtc_reset,
+	.atomic_create_state = mdp5_crtc_create_state,
 	.atomic_duplicate_state = mdp5_crtc_duplicate_state,
 	.atomic_destroy_state = mdp5_crtc_destroy_state,
 	.atomic_print_state = mdp5_crtc_atomic_print_state,
 	.get_vblank_counter = mdp5_crtc_get_vblank_counter,
 	.enable_vblank  = msm_crtc_enable_vblank,
@@ -1155,11 +1155,11 @@ static const struct drm_crtc_funcs mdp5_crtc_no_lm_cursor_funcs = {
 };
 
 static const struct drm_crtc_funcs mdp5_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.reset = mdp5_crtc_reset,
+	.atomic_create_state = mdp5_crtc_create_state,
 	.atomic_duplicate_state = mdp5_crtc_duplicate_state,
 	.atomic_destroy_state = mdp5_crtc_destroy_state,
 	.cursor_set = mdp5_crtc_cursor_set,
 	.cursor_move = mdp5_crtc_cursor_move,
 	.atomic_print_state = mdp5_crtc_atomic_print_state,

-- 
2.55.0

