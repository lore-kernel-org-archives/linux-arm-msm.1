Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC215B135;
	Tue, 28 Jul 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244861; cv=none; b=W2H+/e184wWYbU8Qb/hLKWcMaNEUrJDWbnSvBztWPaVpzkaizK03Xb4DG/bPzL6JYVCCbBu7c/4ywuVtuxNvipPAiAHb1IEWlsMTTdea2a1k4D/XzswUve2yYKlsuwcbU1mpuIEY3qeUzIc0D3WoFZt9XtbcTe81Tch5fY4snvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244861; c=relaxed/simple;
	bh=DDTk0H5cNvK8WiltkuOC+5GnAZO1/0LoS+J7bv4xQsw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CVewHFuZBcNRSb/49AmQDGYuca8CqP00oU2IQkbrPhtLPE7ynhgU0bdiODioQbJ1uDTvGvCMNVhGRa7Lr/1q223Ay/37Sw4D2E6PukcPLt+LlIbt5WeXkGpGJM36uJ2DzS9fWD2OLThtDKgRIM+fuTTfrO9XzTtex03LFgE3j8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCX90AJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCX90AJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3F41F000E9;
	Tue, 28 Jul 2026 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785244859;
	bh=5wIfZ0sm6CEy7MJilr4iQeAgvnopeXOM1phyT95Vzgk=;
	h=From:Subject:Date:To:Cc;
	b=FCX90AJi2Tbai/riSjra6VQYBMpCeDvQ4iLopY+0oZbAQgHSgeEYL75P4gHwRpuXw
	 P4b8TOTGuabvDniChxKuoYA3XnjakS6g8lYcr8jcvNm/w3NhjAlRH+3vZlutiObMqy
	 S5eSnftlxkwsOUKnzLVmxV2HGwYU/sW3roGf4Zi72Zm25csgp+H7/wxoNnferhFMS8
	 f50IQ2UNKYfrNBBg2RLx3LjlIfaSbruLmHHyb9kbOLhyt+0m/u+H1Gqz8tWeB7+xfv
	 Cvk+Ai7/XVy+g+TFp4GyCRhXydMqh+vAjQA4tT6K5t1feMcHFWdixd0fIrO/XYAgXb
	 s9Yc4k9UY7/fw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Remove brownout risks from DPU
Date: Tue, 28 Jul 2026 15:20:44 +0200
Message-Id: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXR+ncVEaEGY6FNq0jE3RXLb
 /HeBRYNoYUquMDgTpbU6sHDAOTcrRMyGrxBRCKLclGwTWmSbNCu1epAw0Q8piWPe87LBHylDY5
 0fse6+W1dv6Dc3g3c9wMbMtZScwAAAA==
X-Change-ID: 20260728-topic-dpu_power-23f5913b1194
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785244852; l=994;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DDTk0H5cNvK8WiltkuOC+5GnAZO1/0LoS+J7bv4xQsw=;
 b=+wjZYMXr9We+PzarZidZZBP6SyD/jlQVmwX2lbOnKcsuZA+MO3K9ry0Off/ndM1O97MtGcGCn
 ETFFMVxYf8MBMeT3GqgDbduIgj0GxW5MDu60xA84jVN3Pfaj13Yc8zp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Things generally run better when plugged in. That also happens to hold
for clocks. To ensure that is the case, remove calls that drop the
performance state votes while the clocks are still running.

This helps Glymur devices not crash upon resume when a display
(incl. the internal one) is plugged in.

The DSI patch is compile-tested only.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
      drm/msm/dp: Drop dev_pm_opp_set_rate(0)
      drm/msm/dsi: Drop dev_pm_opp_set_rate(0)

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 6 +-----
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-topic-dpu_power-23f5913b1194

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

