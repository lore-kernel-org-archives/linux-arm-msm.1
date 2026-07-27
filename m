Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB83ED5C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144815; cv=none; b=lo8LXuIt+Q6nS2VYNxO4K+sXwfi2gMpV9TinrGX7ZD/m4vOzM2cMadr/lO2meb0rfb2Pe9JsVHfIALx5NZlVwLSjt2oxY2/OjQZMw1Wmr04qjlMuVg8PKcqYlM96JRwrBjjOslDyQuly+05PneaFvxOeb8IkbOuDBEWLN1BtQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144815; c=relaxed/simple;
	bh=oAehaYTvNUxHoAHW7YV3qNflhAoJOg8Amfq6ui6gWPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZT+FY7ev/YGbhOh/7cl2owiz36G0tnTC9um8KJFZUwXRhQIJWM3I2ITBnHWRzTS6/xl0T+Tq1zEU6KAFUTkjQj6V7HOkr8Gdfw1ceLBjN15/I/yR/BRJwIEYAwS1tzovwFtJUA28waX9d/9GDKcKSEUVOV1XFnvlW/+hTePbEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRCnqgQA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRCnqgQA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ced3386430so25247005ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785144812; x=1785749612; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9c4kaZbQfmlefk6vHYiNCfLDryvBZ0j2Zvc/OM54idU=;
        b=bRCnqgQApQWTjRuBzNVo0JrpJyQhW83g7OuVWdaUybiEgRW6OZR+xleaW9Cvhmi+Ew
         DzJDAm0iaB+2dJZfPfyeSZlGTp8WKxpnk26gsfiZ2iySMZKopVV6V/nX658rNdJlkiLp
         RK3edGcmqi+xaZFHtGwXyoE8JwIpgQuNOdEk85SJ6NKKbXP9lHbcOMqmeXw7CvCduIFk
         fKTByCMIH0xb3RZQ9nEOx5QICiGGicmaQ6Kx1nAjtgxYjaRn4wOIGoTXw5ah9SeUIVyi
         IJXlcX5+7EIR99Xnd6aTx9sVTP7IpQD9GpUISsLuVQjewWfXHnwV4+nUqBE6ZA0OcP//
         35fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144812; x=1785749612;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9c4kaZbQfmlefk6vHYiNCfLDryvBZ0j2Zvc/OM54idU=;
        b=lob8FMMoXA2G2E+0QfydD/hxp0eaRcPSmAsr4v68MYPFdiKBAC8xLIohjYB6+XcMC/
         FM7oKbsj5I7v600YIrIlDbB1iJc/6gkxMgjVEQZaqg3kz3GZViKykWgF6y5bdXPscBGi
         csUnynP/KVtH2jCnWWgiSfvgeDL5ID+/OEfxWUqsyBpS0Fizr4gxz3hAIoxPl/BdKR5d
         W/GU8qPjH+eH3lNQqJAhaz6aRLA3oSUEoLX3ri7swYWz/wNwguOw0KPFco4zSTfLEt7i
         Pxs7Cb8sxBAZ7k4p58P1T81rNax+fWGhq5qfbxAx3FdB/lBh8mLqQhmrUlTPq0iR+Uau
         oslg==
X-Gm-Message-State: AOJu0YyzTZ7aslWWvWX14Fn4/lnxY/kDgdCa1BrQ31wggm7/kIwUqgaU
	gYp5cB328LTeWazgSA/UmRyXMXjL0DbtFheg+JA/mcj6BTD1ktNntx0+ZqEiUOG240boXCZCta8
	Nz37po+Y=
X-Gm-Gg: AR+sD11iayXIE9v3Fn58Bxl9qewynqsYmFGZweYGbiM8ywVE+JkLyIMd4JdhXke2FlN
	+NpVeXSVAf1AyqzH8RSHW/3Of1r4GQDRiQ5UiaR6+RsaNk/0sJ72W7rXy9Cq+XD4zqT6KVw72TC
	Cmw79snPMzZyGcXEz43mINbqfBANOIOp7eyabAfkIk9zDJ16qJCOhaYwmcXq5/fLDjRg3Lq8UlX
	6ShdMevlopCpxft6erxl+91wKkL91/gSfJhCUG4a+wod/dfwF2DJZG36leHaiqwFuzFUtY+eGTC
	ZPeV5mw/h7sdZB4cw75gXIk0zNeIra6UIJOj/HtoIMFlD+jWlDMoeK/BzZPY3IxOJXjkKpEksyl
	D2IYlEivl9//lSrSV+ZJ3W3ls+ajf5+ugCkDREz2Kb4SS6Yq9fLu9DCts/J4g9yowyKXtLw1ALM
	uB9Q==
X-Received: by 2002:a17:903:1aa7:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cfde8a5229mr72055585ad.47.1785144811597;
        Mon, 27 Jul 2026 02:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b5b6sm32082525ad.14.2026.07.27.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:33:31 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 Jul 2026 17:33:26 +0800
Subject: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOUlZ2oC/43NwY7CIBAG4FcxnB3DDAVhT/seGw9QQEm07UJt3
 Ji++6KXxpg0Hv8/839zZyXkFAr72txZDlMqqe9qINxuWHuy3TFA8rVgxElxJIRLuUAXbiP8Xq2
 HIQ0BynBOI1hnpFNBxOgFq/Mhh5huT/vnUPMplbHPf89XE+4f9QdqvQQOKjjltdrL1tL3OXU29
 7s+H9nDnVAvFqFYs3S1pEaJUnuhhHy3zGIJpDXLVKuJ0ZLjqjVGvVnEF6tBuWIRBwTXYvQRG+4
 0vljzPP8D3FQNjKgBAAA=
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785144807; l=18511;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=oAehaYTvNUxHoAHW7YV3qNflhAoJOg8Amfq6ui6gWPM=;
 b=hexTFbE1wqg2Ko7ajA73DE2vJDirSC3jrTCbb8oWJiWD+8zEEKuNQfzSJYkyEUe/Z+ts7JmKM
 htz6NW2YGsFDldk472x5bRVkQSUprTHEBAXBmfnyIaprujogfrIwuvZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

To support high-resolution cases that exceed the width constrain
or scenarios that surpass the maximum MDP clock rate, additional
pipes are necessary to enable parallel data processing within
the width constraints and MDP clock rate.

Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
high-resolution cases where dual interfaces are enabled for virtual
plane case. More use cases can be incorporated later if quad-pipe
capabilities are required.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/675418/
Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
2 or more SSPPs and dual-DSI interface are need for super wide panel.
And 4 DSC are preferred for power optimal in this case due to width
limitation of SSPP and MDP clock rate constrain. This patch set
extends number of pipes to 4 and revise related mixer blending logic
to support quad pipe. All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

This patch set drop the merged heading 8 patches of v16, only the last
2 are revised and split into 4 patches here.

    Changes in v21:
    - Add active-CTL constrain to quad-pipe case.
    - adjust high clock rate constrain to quad-pipe case so that 4K@30Hz
      still use 2 LMs.
    - Link to v20: https://lore.kernel.org/all/20260415-msm-next-quad-pipe-split-v20-1-bc1fdf140b81@linaro.org/

    Changes in v20:
    - Rebase to latest msm-next to add single DSC case into topology revison.
    - Link to v19: https://lore.kernel.org/r/20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org

    Changes in v19:
    - Refine the plane resource assignment to avoid unnecessary argument
      and operation for non-virtual plane case.
    - Fix wording in comments.
    - Link to v18: https://lore.kernel.org/r/20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org

    Changes in v18:
    - Revise the deferring of SSPP handling and comments to distinguish
      assignment of non-virtual plane case and allocation of virtual plane case.
    - Always assume 1 stage in non-virtual plane case when splitting and
      mapping plane to pipes.
    - Revise topology decision making and comments to fix possible
      regression.
    - Link to v17: https://lore.kernel.org/r/20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org
    
    Changes in v17:
    - Fix iommu warning on Hamoa.
    - Extract plane splitting into a dedicated function.
    - Defer plan splitting and SSPP allocation until CRTC check
      so that topology information is available.
    - Add virtual plane condition to quad-pipe topology so that
      legacy devices are not impacted.
    - Drop the merged 8 patches of v16, only the last 2 is revised
      and sent here.
    - Link to v16: https://lore.kernel.org/linux-arm-msm/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org

    Changes in v16:
    - Rebase to latest branch msm-next-lumag.
    - Fix IGT test failures.
    - Drop patches that have been merged.
    - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org

    Changes in v15:
    - Polish logic in sspp check and assignment.
    - Link to v14: https://lore.kernel.org/r/20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org

    Changes in v14:
    - Add patch to fix null pointer bug SSPP sharing, which is missed in
      the last version.
    - Polish single pipe check with removing loop.
    - Polish logic of SSPP sharing test in dpu_plane_virtual_assign_resources()
    - Polish argument of dpu_plane_virtual_assign_resources().
    - Link to v13: https://lore.kernel.org/r/20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org

    Changes in v13:
    - Modify the SSPP assignment patch for sharing SSPP among planes in
      quad-pipe case.
    - Link to v12: https://lore.kernel.org/r/20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org

    Changes in v12:
    - Polish single pipe case detection in a plane. Add stage index check when
      sharing SSPP with multi-rect mode in 2 planes.
    - Abstract SSPP assignment in a stage into a function.
    - Rebase to latest msm/msm-next.
    - Link to v11: https://lore.kernel.org/r/20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org

    Changes in v11:
    - Change function name from dpu_plane_check_single_pipe to
      dpu_plane_get_single_pipe.
    - Abstract SSPP assignment in stage into a function.
    - Link to v10: https://lore.kernel.org/r/20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org

    Changes in v10:
    - Drop changes in drm helper side, because num_lm == 0 does not lead to
      any issue in the first call to dpu_plane_atomic_check_nosspp() with
      latest repo. It is initialized properly right after the call in
      drm_atomic_helper_check_planes(), thus the later plane splitting works
      as expected.
    - Rebase to latest msm-next branch.
    - Fix PIPES_PER_STAGE to PIPES_PER_PLANE where handling all pipes, instead
      of stages.
    - Link to v9: https://lore.kernel.org/r/20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org

    Changes in v9:
    - Rebase to latest mainline and drop 3 patches as mainline already cover
      the logic.
      "Do not fix number of DSC"
      "configure DSC per number in use"
      "switch RM to use crtc_id rather than enc_id for allocation"
    - Add a patch to check crtc before checking plane in drm framework.
    - Add a patch to use dedicated WB number in an encoder to avoid regression.
    - Revise the condition to decide quad-pipe topology.
    - Link to v8: https://lore.kernel.org/r/20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org

    Changes in v8:
    - Fix looping pipes of a plane in _dpu_plane_color_fill()
    - Improve pipe assignment with deleting pipes loop in stage.
    - Define PIPES_PER_PLANE properly when it appears fisrt.
    - rename lms_in_pair to lms_in_stage to avoid confusion.
    - Add review tags.
    - Link to v7: https://lore.kernel.org/r/20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org

    Changes in v7:
    - Improve pipe assignment to avoid point to invalid memory.
    - Define STAGES_PER_PLANE as 2 only when quad-pipe is introduced.
    - Polish LM number when blending pipes with min() and pull up to caller func.
    - Add review tags.
    - Link to v6: https://lore.kernel.org/r/20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org

    Changes in v6:
    - Replace LM number with PP number to calculate PP number per encoder.
    - Rebase to Linux v6.14-rc2.
    - Add review tags.
    - Link to v5: https://lore.kernel.org/r/20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org

    Changes in v5:
    - Iterate SSPP flushing within the required mixer pair, instead of all
      active mixers or specific mixer.
    - Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
      interfaces case.
    - Remove valid flag and use width for pipe validation.
    - Polish commit messages and code comments.
    - Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org

    Changes in v4:
    - Restrict SSPP flushing to the required mixer, instead of all active mixers.
    - Polish commit messages and code comments.
    - Rebase to latest msm/drm-next branch.
    - Move pipe checking patch to the top of patch set.
    - Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org

    Changes in v3:
    - Split change in trace into a separate patch.
    - Rebase to latest msm-next branch.
    - Reorder patch sequence to make sure valid flag is set in earlier patch
    - Rectify rewrite patch to move logic change into other patch
    - Polish commit messages and code comments.
    - Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org

Changes in v2:
    - Revise the patch sequence with changing to 2 pipes topology first. Then
      prepare for quad-pipe setup, then enable quad-pipe at last.
    - Split DSI patches into other patch set.
    - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 55 ++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bd0e720b484fd..d586825015906 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	u32 crcs[CRTC_QUAD_MIXERS];
 
 	int rc = 0;
 	int i;
@@ -1384,6 +1384,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1396,32 +1399,48 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 *
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces and stream merge
+			  to support high resolution interfaces if virtual
+			  plane is enabled)
+	 * If DSC is enabled, use 2:2:2 for 2 LMs case, and 4:4:2 for 4 LMs
+	 * case.
 	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology for single display
+	 * to support legacy devices that use this topology. Use 1:1:1 topology
+	 * if there is only one DSC engine in SoC.
 	 *
 	 * Add dspps to the reservation requirements if ctm or gamma_lut are requested
-	 *
-	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
-	 * enabled. This is because in cases where CWB is enabled, num_intf will
-	 * count both the WB and real-time phys encoders.
-	 *
-	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2 && !topology.cwb_enabled)
-		topology.num_lm = 2;
-	else if (topology.num_dsc == 2)
-		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge &&
-		 topology.num_dsc == 0)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	else
-		topology.num_lm = 1;
+	num_rt_intf = topology.num_intf;
+	if (topology.cwb_enabled)
+		num_rt_intf--;
+
+	if ((mode->hdisplay > (dpu_kms->catalog->caps->max_mixer_width * num_rt_intf)) ||
+	    ((u64)mode->hdisplay * mode->vtotal * drm_mode_vrefresh(mode) >
+	     kms->perf.max_core_clk_rate))
+		topology.num_lm = num_rt_intf * 2;
+	else {
+		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ?
+				  2 : num_rt_intf;
+	}
+
+	if (!dpu_use_virtual_planes ||
+	    dpu_kms->catalog->mdss_ver->core_major_ver < 5)
+		topology.num_lm = min(2, topology.num_lm);
+
+	if (!dpu_kms->catalog->caps->has_3d_merge)
+		topology.num_lm = min(num_rt_intf, topology.num_lm);
+
+	if (topology.num_dsc) {
+		if (num_rt_intf == 1)
+			topology.num_lm = min(2, dpu_kms->catalog->dsc_count);
+		topology.num_dsc = topology.num_lm;
+	}
 
 	if (crtc_state->ctm || crtc_state->gamma_lut)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 6eaba5696e8e6..455073c7025b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eba1d52211f68..058a7c8727f7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -661,7 +661,6 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
-	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
@@ -675,22 +674,12 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
-	if (dsc) {
-		/*
-		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
-		 * when Display Stream Compression (DSC) is enabled,
-		 * and when enough DSC blocks are available.
-		 * This is power-optimal and can drive up to (including) 4k
-		 * screens.
-		 */
-		WARN(topology->num_intf > 2,
-		     "DSC topology cannot support more than 2 interfaces\n");
-		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
-			topology->num_dsc = 2;
-		else
-			topology->num_dsc = 1;
-	}
+	/*
+	 * Set DSC number as 1 to mark the enabled status, will be adjusted
+	 * in dpu_crtc_get_topology()
+	 */
+	if (dsc)
+		topology->num_dsc = 1;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
@@ -2180,8 +2169,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	/* reset all mixers for this encoder */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 61b22d9494546..09395d7910ac8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers != 1) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ba04ac24d5a9e..b1ac84c0b52db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 0e65bf5ddc4a6..fd1f3e7982062 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		1
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

---
base-commit: a913d08e5ea9a491b806e64a24410f6722ddc9b3
change-id: 20260121-msm-next-quad-pipe-split-ab95b6e3ffd3

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

