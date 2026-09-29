Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6C526A84
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687201; cv=none; b=nceOl++uDiiPhBP4rdfy5TcyILl3RAhM0ay9wooOC4frMwVPmhbxe4dercks7t+Pgq8aS8csJ76nRH61ZThqoxdhSJFwIi8qs8yFMxazVBi1gI7bFMoFbwFkSkHhQ7JJaE2mGZqUs3x2Cj4gR955sGj9fuTsB/Kg6/bM4LglSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687201; c=relaxed/simple;
	bh=KKlXeG4EWEHG8V9wWhgZ48hd2vq9Tr+1FGJhYZ4ceaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hR74r3b6U4TSBfQQ6zkyuJa7a4y+o2vg0TxDViSsVo09jbT2dnjFnEPwFMSjS4nKXYdWSs2MR7t5RLlGp5wA0WmQe3UX5vWbwDDdU1yu/qYCGwp+B1gq9foel0N88eL0wD20FbMABh7KyyY2yPbo48PNEdUK7PiFH5huT1p1uC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agoL3X0R; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agoL3X0R"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2d747ec6185so17969475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687198; x=1791291998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGEWCLC1FPZDP0SnOnB5resnwfxQezT/YHoUyZYHjyE=;
        b=agoL3X0RXteHgriIWFkSkCROwdLI8yqHUfJeqEHW2G63mf84CludM5UQD2lZN1glaV
         1HgJed0aGEy1KuaUZ/ZahcvYx71uxNjwWbocEohKTfnjH8GN8Jb9YI49g4pAcbWLVFjp
         MiNijWsrkCBh+UGuybIkC5BNTnZ7z9Mn1PTVFb6kUIiKR0+XVvmK7UcFkDWoQMU4CKcS
         QEKfMoQ251/Odye8Sk5BM7swZcibHSTceM/FV2LO+7WEbuMJK0mIEEBJk0Qwlh/Yyzuy
         rWuF2Dc6ei5vRyiS1kOE9PKcWPgfrHteQeSgWbkqZ19U28CxvT+Vq7d4SkzxkBpo2S6s
         m1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687198; x=1791291998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGEWCLC1FPZDP0SnOnB5resnwfxQezT/YHoUyZYHjyE=;
        b=uoh0MXuHFHsm0+k7ys6UHpRp3Z7yjKSqAo8qGAyvX5HkRk4MUVS2NQNsZBpToMJiTs
         bWFGQ/VJq/WkCIPa8bmsy1UUVxeuzwlaXzRZzl0SfKWDlWtoIQcejLXuf1RT23GNYYHh
         laoIRD371VM5xd8oNTZ0KXyGpxUB7l+x6PBvr5RA2nUGK+P1dgVI1v40YUiaVTfRJKaw
         ctsFBPV2Q2d8BmhOzf/WVFByQ7SBck9+6jg3ifyrwsVgd6/RtmgHSuPBtwPfvH0d/Fnx
         0YvFocdMkxkg0ZJT7/sMBa1QJdpfkwA6+Gn44quSwNf1ZQXMQDu8I3t0hEGy7yyVy+oA
         wavQ==
X-Forwarded-Encrypted: i=1; AKwUvByYOYDRAyyv2EJGRnEdUOSZfOKgd6eDU0WRmgWZeAUFEuKxtEnjo6McS9mAwDCILSuFAznNjD59WOBtNF1v@vger.kernel.org
X-Gm-Message-State: AFq9FYJFcdSPQvf/gZqVTwB8V1k03+nr7PSSG8ZDVyqVOybr85uW/y6/
	ujGegX4TqgMLbov3mvvgG9c+UcA4XmjSFYRbtRG2GxLLZrTKvfHIB7vt
X-Gm-Gg: AYBFou22/wGEhWO8q1X18NF52jRBNnA8/yoyPfxjogeUvEVxoF8xpwrO5sG3kfyj/HM
	9lbHqWr4jAPSuwHK1x6RPZU4Dd/0vf4XfKMLq3XvwAqhtbJ4Taqc4TpKKxdQQjFOGktVnQtF0Io
	helNofBxKZCpQaVVymSmxfCOQYsqynTc+ctyX3/aYCGoyZZaw3Kq/JIl1VOflQUZvV3Bw6kePxw
	2UhxQ+6+iVEcWLirRd0t4NVGiCHj/btZo6kGpzXybmaTS/+MLkneEaBZGcpeNdWjAaCMnHagtdb
	FUeiI30YjEjOdZPMQ34LNqz4DXlnIM+ih0dOdFgSKHgucFgYeYXzb6+/dXrx6DTBc0C88papggV
	OlBQAZrsCSXVEUaAfHsAXBGA+2YXPad0CwWhS+O2i8oOHIjIeeTAvaVQBcETnrEp+6TsK8btJM9
	gQJhe2Bd6mVp6q29cfTa8BY5cKcRq+bMoXEVq5myRGXpSvpVRUCKfdi/m56bn4tcW4K0ddDdQ2n
	ycj+5e5KN/7gH3stPyp4PZd
X-Received: by 2002:a17:902:cec9:b0:2dd:ad74:ac2f with SMTP id d9443c01a7336-2df7dea09b6mr135005155ad.24.1790687197690;
        Tue, 29 Sep 2026 06:06:37 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df914024c4sm55838485ad.31.2026.09.29.06.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:06:37 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Subject: [PATCH] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
Date: Tue, 29 Sep 2026 22:06:33 +0900
Message-ID: <20260929130633.977-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_dpu_core_perf_calc_bw() is called with the new CRTC state but sums
plane_fetch_bw over drm_atomic_crtc_for_each_plane(), i.e. the planes
of the committed state. When the CRTC is re-enabled (DPMS on, system
resume) the committed state has no planes attached, so the check
computes bw_ctl = 0 and the display runs without an average bandwidth
vote on the MDP path until some later commit changes a plane -- which
may not happen for a long time on a static screen such as a lock
screen.

Seen on a Lenovo TB323FU (SM8850) through the interconnect and DPU
tracepoints: after DPMS off/on or s2idle, dpu_perf_crtc_update reported
bw_ctl=0 and qnm_mdp was left at avg_bw=0 (peak 800000) instead of the
3728793 kBps voted before, until the next mode change.

Iterate the plane states of the CRTC state being checked instead.
drm_atomic_crtc_state_for_each_plane_state() falls back to the current
plane state for planes that are not part of the commit, so the result
is unchanged for commits that do touch the planes.

With this, bw_ctl is 3728793600 right after DPMS on and after resume.
Only tested on this device.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
_dpu_core_perf_calc_clk() walks the planes the same way; it is not
touched here since I have not seen a wrong clock vote from it.

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index fea173e37464..343c41550637 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -54,24 +54,26 @@ u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
- * @crtc: pointer to a crtc
+ * @state: the CRTC state
  * Return: returns aggregated BW for all planes in crtc.
  */
 static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
-		struct drm_crtc *crtc)
+		struct drm_crtc_state *state)
 {
 	struct drm_plane *plane;
-	struct dpu_plane_state *pstate;
+	const struct drm_plane_state *plane_state;
 	u64 crtc_plane_bw = 0;
 	u32 bw_factor;
 
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		pstate = to_dpu_plane_state(plane->state);
-		if (!pstate)
-			continue;
-
-		crtc_plane_bw += pstate->plane_fetch_bw;
-	}
+	/*
+	 * The planes of the CRTC state being checked: iterating the committed
+	 * state (drm_atomic_crtc_for_each_plane()) summed nothing when the CRTC
+	 * was being re-enabled (DPMS on, resume), whose old state has no
+	 * planes, and the display ran without a bandwidth vote until the next
+	 * plane update.
+	 */
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
+		crtc_plane_bw += to_dpu_plane_state(plane_state)->plane_fetch_bw;
 
 	bw_factor = perf_cfg->bw_inefficiency_factor;
 	if (bw_factor) {
@@ -131,7 +133,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, state);
 	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	DRM_DEBUG_ATOMIC(

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

