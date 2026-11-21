Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297281;
	b=nFpv8ox3CYW8TlSYKXMy8HyctwJFpbQ/LB9sxB5fLWyPazdSg5Ig3X4ouCcDDUrwt3Xi
	 YVno1iTjjFnMiVQqJsSBTSZc9nB+cdBmdQy+JKX42Px6HdnvGunZWBz3uwxSa/NK4YkQA
	 EoXDzjQJQA7SuEMNFLEfFF4QBHuffZNFqUzOP9/2YhrsZemg20lAQxS+isNfkAtdqhEiu
	 Z2wXOy/9dacQPSB7lmKF3xUpVRd43xUTV96aNpm5eghkJvaZqjd1SUZ2i0nW8Zi1SDuhM
	 H0FQO/Pi50qWP4VUJHGjzlvHM7U6xWuj9fdSt+bL8mFNfBY2/RYR1UgsIzq5BxgmtSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ti/nEM5Oev2zA4xOj8Dvky3xyrMI3QYm2yjdgLO6vuQ=;
	b=Dlp1JXDyK0YrU0C0MHX3ZFb1SQgOvbWuPSf+g41t/wtjgbbr4M51gqR4Ffo56FrJIsvR
	 JKbPv8OJ2Jfv7LoQ84ZFNtABy6sV7Y1g/NdEOunes+tNd1bQAxiMyeAmvDkJEOVLXnnis
	 ApTjg0laU2EM5NXHSMIiSBf6CvvZkZ+o08biApwn/IUdW6KwQIfDFLo4lV2lx3tZ3D9/s
	 g/GZBwBW46JJJ2MEzdNGy1aXVTeF+yAo7d4I4TBqUm64kCkGt+Td2Wre7L3+FLJoPJ0ny
	 aTyqcv3yrS3WD2oComt+m+aZUxr6fc6nyVoZWX9Ie0Nu/iSgVlIwysNqbC6aS5HxUwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=letoMPww;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7D606A335
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E7D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=letoMPww
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so20058015e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297280; x=1795902080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ti/nEM5Oev2zA4xOj8Dvky3xyrMI3QYm2yjdgLO6vuQ=;
        b=letoMPwwDeGLKyc5HvD0m8wd2OjA64tloDcoSrrDfVAAA2cJu4sdNKZjk1HATb007b
         vwl0uOrxNj+FYuEp5JuAlchsGdMlQjFfpy2HxPFjq0lTWKp+DUJiolOJuH2Pz596fZYn
         ymzBmjQVwtJEDVp4ZEmtFReKZdY7j6JIxzrRkwToepUqDUoeLQiZZo7bd5lHVB7gkk1G
         DJgEODZsNPEDZ8JNcAWL2YkWQKdCI9mQbAtOR2NgiGemIdQpz4hpiAlq6HHUX67UHR0o
         wPcPs90W1TYJuCvihevmv++WJTw+mewJWdv1Vd01c/CkOdbnNqqbwo3uEJmiYzLznF/J
         IDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297280; x=1795902080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ti/nEM5Oev2zA4xOj8Dvky3xyrMI3QYm2yjdgLO6vuQ=;
        b=X1zqLJzoyekO3ClPHnQHR/uGhN1FyAbCiOqx1Rs34Cfb4WD1BUrWpfFm9qgfhXRQ15
         ChaPLHEXgnaHusWVOcBBkhqvR9c96hEXQKqCU29fcXocZIZwvUZjZsSsYl3fhSjFWzq/
         jXN4/yKA9fUDANIyG1iTUWrswmGEVipUxXg3fu2ANn0OnttXOveZmYFUoO7jOoPnAKig
         vBypSQ5qhef1AwC7foUYmu2d0mR4CRRmmvGuGmwAtGK4lGa83O8NGg1FfSW3SUCwdavj
         o0dG6ekm7y9312Xf2PyH73KwN8925rHupLMWMPZ0m0yWUXk4ZEmTiuOcIEpmIuM7Z6aM
         v/CQ==
X-Forwarded-Encrypted: i=1; AL+hErH6ZOFUns8gIfTF7LXlEBM+Pnd3L0pTvsMH3Wkmu+iQkDdpENvV8p580LQFJEGKHM1apRHUXTNJSM/0owu4@vger.kernel.org
X-Gm-Message-State: APuU4Z9tltpAoW39/yFNCFISu0rZqTv4tHvbFBpTaYjJ6IGNSbYFH1p5
	36/UvzjDaHmGasq6iVJpeYkD11WzL5Ok3Sbw5DUv/9Qo59E9YNw1H78=
X-Gm-Gg: AZFdTZcgOOkqeMnrUhN6CydhfO2nNSxQwfnljHt6jwJNgstHhrvvhcJ7Q14FV/xJKdf
	oIrg02bXgTwVCB5gS+cFrQQuztOOih5lfhoPJCQOf0S4FwxZJq8bQA0AYrTUJHzFeuTFxWYwVRf
	Nremr4gJdDEjEDRJNlC2wxvF+6rPwRzLmvjObcyqUxk2RWx29IS2dD3e2oaSY6gNOvgNYox+zEC
	SWlGTVYhwDTp1Ao6/w/V+O/Xk8+7rM4tQQRL/goEvHEQDoJ1wS/wkPCcHujM0ZoSicQ9znhw9z4
	Jz+6JuY7kAqU+5NWlgYAYR4GP5YVkJ+7X5+kKIWAc+f7wefmqmmFPRXovqTN6vs/OXY2go3yCLC
	6RGZEKW18T+llvpHnS7EyDnuKR7FTOBMlvj01YA0R22cPpoUfxO5NKRgwrIENz5zSK3qKvCkDCW
	o8Bg0Rqeg1UpQEpXBhmm6B163AWLgMrFWbbMjKd20b8KIHn0j3tP9IOi15qvEj4gvX/I81I70+U
	84Fcf6E00N0kuQXZVRHLCxC0gbH6+1HpDGMhs5oWSLh5NnmNCRlBSUgFr2T2c3fTQKzTWhEYqr6
	GxUmIQFsSJHGHNWV5H5CBgLMfMEUSmhbCdT+NN0=
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr174211755e9.10.1795297279908;
        Sat, 21 Nov 2026 13:41:19 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:19 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/7] drm/msm/dp: configure voltage swing and pre-emphasis for all active lanes
Date: Sat, 21 Nov 2026 22:40:59 +0100
Message-Id: <20261121214105.32596-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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

msm_dp_ctrl_set_vx_px() only populated voltage[0] and pre[0] and left
phy_opts->dp.lanes and phy_opts->dp.link_rate unset when calling
phy_configure(), leaving lanes 1..3 unconfigured on multi-lane links.

Populate phy_opts->dp.lanes and phy_opts->dp.link_rate from the active
link parameters and program voltage swing and pre-emphasis across all
active lanes.

Fixes: b4745f741e79 ("drm/msm/dp: move phy_configure_opts to dp_ctrl")
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

