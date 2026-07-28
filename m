Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155843A7F5;
	Tue, 28 Jul 2026 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244873; cv=none; b=lyycrPzHvJe8CFVG6HJ+07s+HMeH2NgTHsf98TalSJoiJY5AlRVNs/T+TSYke0UMriiAJE1USfna9sN4TvNeA/u5MhORy6W880PNLPtRmmYdZDyB7xzIs7xo/FUebNkx94Pp7cg+4i2h9PupgraASvpqfkOIFWFo1y2mP3KCTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244873; c=relaxed/simple;
	bh=nBRzbzjZgQ97bJd/UFQfw8744AlxXn/Jp+mgk8RhBK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnDy2sjvRkDhvOgDRSXHvQdTcoars5VZlDHRkfv10ECMom6QLZSsZtZVPfc5JKzcaExvnVXvbhGQD/NggK20VC1lg71ykEHIZxm2tGb/CZr/LKc5IAZdvWmdfUQXWRJUZL/R3fgRSCosc2zvGUtpjQSDvhjND/OqnmnRw90s084=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZLybfIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZLybfIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0554F1F000E9;
	Tue, 28 Jul 2026 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785244871;
	bh=twprasiO3gxSKmLz5pAFqxjHVAGx7BUZ+ykfPhsj374=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lZLybfICfBzA8IgGDed36dxDFiSFDnjCG5Wqi2UHBuQnSfZODXkbNkCem7bzoDDg6
	 HWcQkIaCgdCziKG7ms8w1bZNjDPkZPVI09QOZ4mAblYZeUQ2gpdQz8viS9khz5bqOC
	 clAQ7a5enAr13zDLUPQ5+GI8Tqn3/vIcjQEExt0yZvtLrauUgDuz6nbXLz+SaVjWct
	 UbhMyrwpKXwWSwSE/zojzDx/mExL5OXsUIYSvUrP/QhBb8XsRZlziYpg75KP8p+kKG
	 FKbQ+J4iwpDD6Q+xSjxWxiVCuDREiOBl//UX7lPwozfNF9BEhlnVWoxkmpYJyt2tQ/
	 2YBVXF8+SwcaA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Jul 2026 15:20:46 +0200
Subject: [PATCH 2/3] drm/msm/dp: Drop dev_pm_opp_set_rate(0)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-dpu_power-v1-2-e7783b859a70@oss.qualcomm.com>
References: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
In-Reply-To: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tanmay Shah <tanmay@codeaurora.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785244852; l=1915;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+LhFgGkJrqk4wZmByeCFu5tu4RH4SlmyTOEJtxcxmJw=;
 b=rDxoCi+JjFskmgLy1r9w3lQdtAaA5XXNk/VwqV3yR5d7uEwIkdAJ1H2TQ+sVc0Byw98yWa9qm
 j81is6eotLEBv4BarmU1VcPuVhaGlelSzpeD6+cyLVtTkPIfEpcXK6t
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dev_pm_opp_set_rate(0) removes the vote specified in required-opps but
does not actually park the clock, making it run without the necessary
power backing. Drop the explicit calls to it.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..e09924eae5a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1950,13 +1950,12 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_ctrl_mainlink_disable(ctrl);
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	phy_configure(phy, &ctrl->phy_opts);
+
 	/*
 	 * Disable and re-enable the mainlink clock since the
 	 * link clock might have been adjusted as part of the
 	 * link maintenance.
 	 */
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -1982,7 +1981,6 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2573,7 +2571,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 		ctrl->stream_clks_on = false;
 	}
 
-	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2602,7 +2599,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 		ctrl->stream_clks_on = false;
 	}
 
-	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);

-- 
2.55.0

