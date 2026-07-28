Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFEF43B4AD;
	Tue, 28 Jul 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244880; cv=none; b=rqbIGNoRKuRyl3HPbUPy71i/eolhylczJMvt1I/9N6BHmsbga26EbcXC18wxHsOnlceOhuQnh+IdSon5uY847HjpjJVm7UX3+t0SHhYav6HMYKG7SsHIhzdoBP/Ltvod82ufVGeUJKJ+S+DhhL8kzawdAP5knE4xHOj7EH2mxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244880; c=relaxed/simple;
	bh=2RKQ264C14OD/lDZBhKsAmPl2RMvmmYLQ6nZm3WEGqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKLrbjNZLQcY5DzKlkFLO31yaPNrWHFjLuL69Rur535sh96s7OCBBzTp5xtvVm6JDWwL7WZa+RaLUAR2X2pfR63BR19lLQ5EtQeyom4mn25hSKWmZ0jTwhMlp2KRqrPFFLHhgM+QLAHb1+F41hhMv+0pZ/g4DdB1OAcQhmxAoYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GH/MoWob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GH/MoWob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF9B1F00A3A;
	Tue, 28 Jul 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785244878;
	bh=UkaySPbO6R14pZqLamkgEmCGH3jDKMohFVrrV3zXE0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GH/MoWobq7eSgWcRUefa4NWx5AZb8WLD9TEvw5lQaTtpPBZ2juv+sbSZ8eK6HAKUz
	 4n55j/mLSPXQL+xN7NtHMuT94R3Jhp4hGzuTf6WMfWM5apv3DRdnAOIU1SlcB35zLr
	 3/VzNUEYvRs9dqmGSblbMHvjDk02a9gVyTa/I7w8z3Sx+/akV/KN70K/X0stX2/Cw2
	 wUXI9YsymjO3lF9jRL74hw6bKfPjhAR7bRtvinkW/xa6e78DQ94agCwhBhaYpmHfT4
	 L4VXA9V/ccqBSD1ziZmXc+mYHKNEsPI7ZZH7zgbmOPmmuehVnEnGFNuL9Rxw6VmeHu
	 WP6EvgHoA1DkQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Jul 2026 15:20:47 +0200
Subject: [PATCH 3/3] drm/msm/dsi: Drop dev_pm_opp_set_rate(0)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-dpu_power-v1-3-e7783b859a70@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785244852; l=1150;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=VD+ZXgF1dIQP/JgFkoMm5g8EhdthFzlelG4tHhgDFEw=;
 b=kODgFzDE5Td8wuk1N5UY3XrVPcUpe87T5FwtX6dM4Yt/Lu8gQ2tGguIj65VPBq3vgUae2Uma/
 7gYa6mifRB8DQIHvZsQim/IyYmZM0cq3FmiYh02K9GCLq/eJxhruW4U
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dev_pm_opp_set_rate(0) removes the vote specified in required-opps but
does not actually park the clock, making it run without the necessary
power backing. Drop the explicit call to it.

Every call site of ops->link_clk_disable() is followed by
pm_runtime_put(), so the power vote will be rescinded if deemed safe.

Fixes: 32d3e0feccfe ("drm/msm: dsi: Use OPP API to set clk/perf state")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 59125d342fcb..7e4e3718b536 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -550,8 +550,6 @@ int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host)
 
 void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
 {
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
 	clk_disable_unprepare(msm_host->esc_clk);
 	clk_disable_unprepare(msm_host->pixel_clk);
 	clk_disable_unprepare(msm_host->byte_intf_clk);

-- 
2.55.0

