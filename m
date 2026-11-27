Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774466;
	b=XR+3/3UvFieI9B3tEgHfZOeRYdkxyrqGdTJ2FhVwPrC7bX3+CBuUAKceqdv8dK+E3FOd
	 x9PcQL6dWgukFF3u6doFYDV3CNDqPpCizk/woTZsNzEtm+Dynv/nYtm0150KxevtskHC7
	 aJZ3LkT5M3sNNlfn4WjEMIDLqtjwgLc05gRMxCuiidZerQsriTOzDbLuXv+Q9ldKAjprx
	 v0uywGWH7CEqiuonnD9yBPGC7TlguALjOfTnM0IK3EjIIgyk3vLsKTd0Je9eiOoyYwMia
	 Ef9WkVFAA87uMvLXaeEF09g8H6SI9eN4NDkk81r+L7MNekkmVvfNUN21kpElOCCP1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLyO4AhRjnRtKKiwchzwSdvyP2jX085GcQOLd7xPquo=;
	b=DGfbPc3g2QcYL/gq3Lx4Ahvj2d8EEjVrX1xRdLsi7DDmLQzfEbSDHozMAAuh+P0WmmiA
	 mge8BlAP/i+INHckSmqc8SQXHVzJ3X2m3HUHvZ1fOh/4hCtudsU8/nviUNpjwluNpSrOh
	 R/ACxQGGAvo8h9ueb8fm4tksV0ueafd4/nVVhnHREViUpEMPyK89h+Lsj24O73fjQH2MB
	 0LHw5qZxd6EDr72oWFhwjJ6F+TC7e1E77r3BJ6blDwo5vTLp1lCF7aCAFOqIBzpV9Tw/I
	 7c6J0yh5i7fK3Kpl4fqsXb0drGg5i3nviqSuhI/ymLl1VFMTN4pdriU2C8hsY1P15Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uw7NnkGR;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5C606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B5C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uw7NnkGR
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a357b1c649so4559295f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774464; x=1796379264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLyO4AhRjnRtKKiwchzwSdvyP2jX085GcQOLd7xPquo=;
        b=Uw7NnkGRkLh49953F7eE1v7yBLfV4URKaGKqNm+8ZwSGyjtZJgJk/mOnvMi9aXzarC
         4LCZWbGi2zaNQRRVI4qbR8eyi+w7ewRwBqVgE9W/XsrGsOleq4WO9MJjl5BBHcitY5O6
         QVImHQ9MYlgLndgxNMbIQtufvb2tRdaX+05OYqYTnkRbUxGFlNd+MdzD0oZjWf8Uyo87
         HyJK7dHL3HXgx/NBrjJz49C/FFSefMirzHoj1Bx6yzCAHIkCRZytmLAPqsbYYCLurXQr
         HQ+UNkdqqxfYwGQN02jaGLjSUlXCS/0xnsRVcfJA4ZvbC+9YnQOWI+v88BQbPwdja2YJ
         E3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774464; x=1796379264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLyO4AhRjnRtKKiwchzwSdvyP2jX085GcQOLd7xPquo=;
        b=dZE4csbpcX0OAQDWVgpM6YpcmMD5pSjo8dWmVIvLF4QAhRXs/DNSxNu6o3WnTBdM2T
         dM11Xp2E2KH8kpLtgWImUKTEhm/9FNXCyJ98MbvtX04DycTTyOpKCOiKohcl3kZGqyQ6
         MQrk0jnsW/AAQmZMNVNmnvyn5xh85F2rGBSFwBcPm6JszhPpHyy1AHJI4bIeSQmfRBGT
         3nq76iwHsrVveZ0G07skQB2E8nREx9CFPxW02Dxlm+7ReY8gAe2WSNysjV+xh8h3wy1R
         lvCXNfRHSra736eThgsNTI1NGuVscAWRDloMXpAOW8Kk9VtIhvxzt8Fzgz4bguWjb4z2
         T9EA==
X-Forwarded-Encrypted: i=1; AL+hErHyhWKUYWxzYNY5hp9uk1Vt/JMLymuJq40HhckjWlg3r4eHJrp7Rk/ZjWs/ljjjPGD98qtklrle8adhnR2F@vger.kernel.org
X-Gm-Message-State: APuU4Z8/2iu5Jyg4LNFzF651s4Z+E/XbpiI+By7BOsBEaDtc6j3OR4xS
	J3diZrIg+8BPA6Y6ovf3rbNyaKrIN95k+yQymu+DWKSYjFzw+UlvJUw=
X-Gm-Gg: AZFdTZcAktsUAeO6ExQ2SRGdkjsbhaVpMwrhQoRwSX7/9jdsmbTHxQCKn/xmoJOtFig
	qOEKwZnvz5MsjrFA4rIDJ4O4thwUbvI0hoDNbM0l6ADmfpd5H3sLpbENgNOBU/aP1aqqiojGyYA
	RQQtjaJ0PcxuNn0mMapWpCmdmudzq4UTnZk3sC/ZhW/eX2SYYiyUV79oXlirHOKCXuKTX+Uj5S+
	zX4kG+a5iqvkEE3kOz6C/QMoXnVm26xeN48M7sEeVG4DB21JeEi7t5NuEzrPKgGlwz4KmUGJ2Hx
	W6z0jVpLqqHlvwWU+C6jYkdJ1OVX8Gtekm2j8KUjeBdTuMaeFcMX97A4FMLMOHxKNfGa9Ur+5M6
	W07LvjMHIdoJE4o43zCoeaKvcPtBK8BSOdcwsvNvKdcvjmnxY3MLzlQngeb12OXK6FB5HrkuBmP
	FOBfUZ1nYlPGtDbSbPZ5HUlaf+yUFIxj6UKvdKfzRL6q/RsErQLr7wco5QIBLidS+29m15rRUoO
	USvQLAtFRYDW7duhKDvC5A8Gc5KGZ9qk0TySjkidAfhVh2HWDqkSVvFH8eso5mBItKr/vZwNAfJ
	tdVGpmuQ4hHZ5o59ZmzfomDqRRGmoAM86KyB5pq6KMIMexlg2a/9U+50BC9U9O0KgPm1MS/hb2X
	YkBlWYBXQoaMdnERO78Rd7ScNvupmMbnzCUIIoFlW4SqcnN9pIQS6cpxZxlM=
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr35473305f8f.29.1795774463951;
        Fri, 27 Nov 2026 02:14:23 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:23 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 01/10] drm/msm/dp: configure voltage swing and pre-emphasis for all active lanes
Date: Fri, 27 Nov 2026 11:14:08 +0100
Message-Id: <20261127101417.24303-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
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

msm_dp_ctrl_set_vx_px() only populated voltage[0] and pre[0] in struct
phy_configure_opts_dp and relied on phy_opts->dp.lanes and
phy_opts->dp.link_rate remaining unchanged since
msm_dp_ctrl_enable_mainlink_clocks(), which leaves them stale if link
parameters change during link maintenance (e.g. DP_TEST_LINK_TRAINING).

Populate phy_opts->dp.lanes and phy_opts->dp.link_rate from the active
link parameters and program voltage swing and pre-emphasis across all
active lanes to match the generic PHY DP configuration contract.

Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> # x1p42100-lenovo-ideacentre-mini
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index abd3dcdad03c..b896196cf244 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1374,13 +1374,18 @@ static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
 }
 
 static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
-			     u8 v_level, u8 p_level)
+				 u8 v_level, u8 p_level)
 {
 	union phy_configure_opts *phy_opts = &ctrl->phy_opts;
+	int i;
+
+	phy_opts->dp.lanes = ctrl->link->link_params.num_lanes;
+	phy_opts->dp.link_rate = ctrl->link->link_params.rate / 100;
 
-	/* TODO: Update for all lanes instead of just first one */
-	phy_opts->dp.voltage[0] = v_level;
-	phy_opts->dp.pre[0] = p_level;
+	for (i = 0; i < phy_opts->dp.lanes; i++) {
+		phy_opts->dp.voltage[i] = v_level;
+		phy_opts->dp.pre[i] = p_level;
+	}
 	phy_opts->dp.set_voltages = 1;
 	phy_configure(ctrl->phy, phy_opts);
 	phy_opts->dp.set_voltages = 0;
-- 
2.25.1

