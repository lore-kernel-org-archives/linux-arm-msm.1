Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFD496D32
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946425; cv=none; b=BMRewsu3iGTlKJiegzxzDLexVwBok8H6MafPMjA5F/zRE+3cIJlejqnmf9C/y6pQMek8+iR+YOEcGGe1wJF9nJuq2qYPNFu3wvfqSIDR81skfLjsK2eSNhDrJwxns6KyapR2SmxTTIpzrluclCTLdhUnJRizXiLC+xp87MFEjCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946425; c=relaxed/simple;
	bh=+5GIIt20Q3aLB8bSV44atJq4TQmo8GHA24TKF7BxpuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sixOVrq2gIukieOv3OGhdHV0bRiLxRE29qn020F5DxVRu+jgY/YI3WXi33Y9s0YOhK/aD9d+KE3B9tYDDbvf55DGujg9vkhpQztXvCFoElIKpTeP/UmCLBrnueTDbUdo3zyLXm/uLRNpuD7xBnLbAd8JUV9WE+l691Yar1zMd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7nsCaO4; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7nsCaO4"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bd597d68so1814436a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946422; x=1791551222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DY2cwQpDJccuyfdSvxswtfH2eyWbZEDW7sPjJNa4T3k=;
        b=l7nsCaO4mF9NI93mpB2LEp6EM/NsUOnMJxU/XpB+BhoBKZc9IGPvK2lsISZm0xW3Yy
         UaZs3nYcpLsrscfoHIpvZ865oNfu/g14f7MiYGjuqG6oT01zh+bPlBdUd9C8Wiiq5/Ff
         c5eIK3lkDQxVUzY/Z2jlgS3nbw8kRruqEJIMEcQJjqauVMuLbMxhZFYDuEy4OwYMJyUG
         lyk7401OmanKoGC7ecFvyJc1HyBVxleMKw0lmyUs/N6fGPAoPGCCB3NhPPDLm0q/roxl
         9NAezPow5TTxLtM1Tcb/XIUgdB8/AK6nLX+V77U6qRKclbg83Qard2SxAsu9enUuv5ZZ
         m9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946422; x=1791551222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY2cwQpDJccuyfdSvxswtfH2eyWbZEDW7sPjJNa4T3k=;
        b=fU6ln1yF42Jl60yuyj+iK1T1CsDmC6qmi6W0AwXPT/+vcTh4LXnmS4fL3+PvZy+SoU
         LbGRk2ZJAnsix49OVCkNxROvqBng470jwtZ2vkIRtEkUPzE3Fmr8sWLZH6rhY0T67qH1
         GjN6BgQE9Ah7gE3kUIHEroyzEfT+SGW2CA7fzGtYOUvshaIQ1bukJrq9Sy2/vC2JwrY1
         oGSqCJ5pwIkqkcCHcXOnmInDhFGA7VXVgfLBbIK0Nwl0m24PelCxr3PUUEzeB4soGdY1
         ztKXiNWMHNUY4240fA6AI6BICvLZGVYLsd6E0C0cmHRUpbAl9bnYLQOKpsdNay/YeB2m
         QPRw==
X-Forwarded-Encrypted: i=1; AKwUvBxFHrfe/OhojgqqqVzTzG9uAS+v6zxpeoVfAdX3sFPYy62Y4karR0/Nws83u/QSjLX28OtUzzYQYitk0HnK@vger.kernel.org
X-Gm-Message-State: AFq9FYKp/6iY/fXEQivXCSdXdi6edGb4EdtUOX+BiuFJcOecrk4I0T8m
	OsujYYyrx0WuR3+qU/0yu8D6vceIoMspaRggIqHZgFWEo44ljvh22lxn
X-Gm-Gg: AYBFou1ptfStJRxsIwDA8G7fitk62yNguxKS3z9lY3qzF5NNpkG7NwDALsTiOBg9/9B
	4HaT59iKH6M0Jm+CeTm0pEWGbY7VdMRPI9dNputdWoXTPVKnqHrF/SUb+gkFHZb8KOGPQLmBsri
	uArdOegwfGEMELe6YyldB6QPf1bL4MoCFmZZ6VUKVsU4BOswZIXo/57CLX/zDnHFBYyFjjbcyRk
	qeRM5hsPKYRaSIMM33+1GvWdSR2h4+1icRs2sR17Qcxq0orIQiJD570ATPbzpFt2/khf5t1vhgk
	vvApZxeTdiYrm3OY9zFXO2UZRoOi6QvEojuxJk8GV8jYjapKoXIJwl7CS49rFTDvATfmusTrC5k
	E/U96KbaqYDeGdYca1iBpEselEmatPT4LqCb8DuD6K3Zu/KMbz5CEJuZwTEtAXjmcs82zoXewFw
	N4DUQQx4TLLKKqDDHpSpSJhxNsaEBdAekgE6FN7M/2sfo3soO3GEsvQjw0QLeGSucyrPnmF4DTl
	j9YVcznzoMDRA==
X-Received: by 2002:a17:90b:4acb:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3a6ce95932bmr2677617a91.26.1790946421716;
        Fri, 02 Oct 2026 06:07:01 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88e4sm4474906a91.13.2026.10.02.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:07:00 -0700 (PDT)
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
Subject: [PATCH v2] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
Date: Fri,  2 Oct 2026 22:06:56 +0900
Message-ID: <20261002130656.50577-1-26rote@gmail.com>
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
Changes in v2:
- Drop the code comment that repeated the commit message. [Dmitry]
- Link to v1: https://lore.kernel.org/all/20260929130633.977-1-26rote@gmail.com/

_dpu_core_perf_calc_clk() walks the planes the same way; it is not
touched here since I have not seen a wrong clock vote from it.

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index fea173e37464..9fa55904dba1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -54,24 +54,19 @@ u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
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
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
+		crtc_plane_bw += to_dpu_plane_state(plane_state)->plane_fetch_bw;
 
 	bw_factor = perf_cfg->bw_inefficiency_factor;
 	if (bw_factor) {
@@ -131,7 +126,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
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

