Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774470;
	b=vcIHCWttq7hyPY2HcDeIV5d9JjjCvTcYk2KnXjSdDru9TSrzA67JhAFPozEkeKzoiIpK
	 SMzKmAlYuXRWxzzhCSKOQyAzKZMdvm74rg4ZdJvLn9GMK6wcv+lc9oueO1n7Ptu4JvuQL
	 V8qyH9iYSNAtjqxYviDD1E4DtEcQFCR0KLyxNm+AvGV6B8udm2lmyWEuVueBGd+pE5wEu
	 WVEiQvL+rC5RBTD+I1UeYANlf91u9eS9Njw44QSNI2b7QNiHudnFRxoTg5W/oKWC81B7n
	 Gygxv7mhA2jmZ3ODbJ6j4OxFO7MoMmYnMB/YuWIS/bg7D3w2wS49bHRAvUjNY3HmPUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mgx5cNkPMPqWVvWeuCS5VO4HsywH9BFvEOT6o0QcnWI=;
	b=sIVmvXtVwqDaSEgA2FTn0GnpBQQLBA8Ir+etgdLQNHR4keT8BY7FUjnGT0g+7rkXXkx2
	 47AigsMP810SZA58j2mhboVt7ohizTbPqYCjZyuTaDUPDtW8BZiMFDLkgZNehn9agK2S+
	 P3GAfkFv0oniWsfvLFfpzvUCdOymXlcvvKQUN0ZXnZWPZpLQ5viY0jDRBf4Xr2C0ulE4S
	 u6ibY6v45F9hGmOnCecIFpblOlkRuond5a/Ll3JX3YrlCOSc3JWxSKBnzL0GUdUH9joF0
	 paJH6yHYamFSACYwkLK1xQK4ztAhvg+YJ7dJNwtcCYacWkaQp4EcvAZdw/9WDVkcobg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArnXgH4K;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D776076C2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D776076C2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArnXgH4K
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49465892f7bso5790816f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774468; x=1796379268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mgx5cNkPMPqWVvWeuCS5VO4HsywH9BFvEOT6o0QcnWI=;
        b=ArnXgH4KVgo8ZsjzHE4ZEUcblsNUSn5rGz2IsOB2VH27OS3HwIcZxnKaToB+RtqbJP
         MhJpxb+/7a321SykO+7kbw2lxM01U2LouQn5lvTYs3r6HdWKYVszgvlyq/Msl0ySEzfL
         cl5wZPWiWGiYCkbaBQ3CRKQ1koMVb1bkKWhgiTcHZfTCcytoKcLmDa64x3AmNMKLIMCD
         Z/SJ7QlDUPQMOFVKIycfhGgd/KGX3h5HdkKvbL6dD8RZ9+w0kicnwSq3+dku04tkd6C9
         OWDDqgyy4xvRhzxqwcDY/3yiXzC4UlLPqm1pP3x78psiyEvEqKkA/OqPp1jIlavjnD/Y
         jkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774468; x=1796379268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mgx5cNkPMPqWVvWeuCS5VO4HsywH9BFvEOT6o0QcnWI=;
        b=qemHiSjy2Nek6JsTuhEVTrDBdlm0iz5Kz+lQf2JQax5A5lnDcJQ6fPuPWk4llufNOi
         2irDKzoKdxjPkOHP+4NKJSy/4aQx+GHkCTSDPzdqvtRUbyltMplHWo6iqTipoFxy2z2Z
         uz6xuDUW3lAX5zysCgLQb1lgKqt6NjJvmgTC/jGj3cfja8OqvdwvT0t1X9vWnJirVNs2
         te/0bQdQkRK8Bx9c8MUmRU7BiOK3hNb4TwKShIsZ5wt73VXgK4S1SamjdI2Dtmcws13X
         h1cQtclsC5iQabunudu3m0iTHJw8p9StYIAzL2l+GZb3lqyJgag+WMiYuaMfNjQn1cKX
         sbnQ==
X-Forwarded-Encrypted: i=1; AL+hErEkdbjxtOrMkaa1uKME7UUw1tJJAKEcuIuGKvwqYmmCRewmblUt1mvOwfIVtjz4DwybwsdGEhCo+UBm8srC@vger.kernel.org
X-Gm-Message-State: APuU4Z8qvw8AU+zTP912uQZJXF6lybMGT2fcAeDn7OijN11H6Q8rMCeG
	wMIMceGIU9+WlJuvhWbWbBnkqdIYlGgIkElOfQl8PFLlTThbq6gS1JM=
X-Gm-Gg: AZFdTZe/f0fpaxJE3xArY/gEhxmxn7Aucjz9fHypdY0s+0nH4QlnIF5S7G2inr0t5a4
	s/tragESCr6oyeyerXXVaUu4R+Pxz8aGQO1ujsTfetaXJpuSLBPZegkYwone2PgoS/YnQ39CWF9
	l1S0Ox46uBzwMZJcWoFuZU6jrn7j8jHWxl/0d/C3FYGYdFQkf63angr27gttgj5JPnU70dRDkQr
	UL6cipd+Nz9ATdaI2Gq8G1G9y39d3i8O+iWKHBDeXtGRq3ajHSwxpiJllyOCw5+VpA0oSLfXXua
	yJLeG+RJULyB9aVg+jPxwTvPNxZlUYu9bw0+585yVucNS0Fq7lpvvtYruoRFsrHcqCXx4AiCurR
	A6/u2yCR1vqjP9EkPHfoilHkhjOKV2N+rjG0PZwqfBfWSZcYiB1++R8HYnpyJuNEUFnycuPRh0v
	UUvI+DYnZaihfR4RzoNf0J9EMfySLjSKbPhD6G4jXHARLL/kixiwHsO/pHxd8R8SBOTgfmnVE1z
	nVVl7J371uaiNwxqn7eRFus1x16pPV/gaItqQWwI15OrPFivtl0V1h+DHB1g6ZjMqG2lcokq8g/
	6hovM5E2OuQXtTuiehcAd/gM+glbXZlClkKY7wL288sj6hU8R8LV843ilrIOIyPSuwDj236rCxZ
	kZ9IXK2UI7KFyZ+l/RxtvwOUneC5KeioY8ervOu6r2XcRtfZdH0j/2NRh0oE=
X-Received: by 2002:a05:6000:2489:b0:4a5:8f40:a644 with SMTP id ffacd0b85a97d-4abb1baa9eamr48914855f8f.9.1795774468069;
        Fri, 27 Nov 2026 02:14:28 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:27 -0800 (PST)
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
Subject: [PATCH v2 04/10] drm/msm/dp: reinit video_comp and guard stream state on link maintenance
Date: Fri, 27 Nov 2026 11:14:11 +0100
Message-Id: <20261127101417.24303-5-gianfranco.mariotti94@gmail.com>
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

msm_dp_ctrl_link_maintenance() waits on ctrl->video_comp without
reinitializing it first, causing msm_dp_ctrl_wait4video_ready() to
consume a stale completion left over from initial stream bring-up.

In addition, if link maintenance runs while no video stream pixel clock
is active (for example in the window between msm_dp_display_prepare_link()
and msm_dp_ctrl_on_stream()):
- Driving DP_STATE_CTRL_PUSH_IDLE via msm_dp_ctrl_push_idle() without an
  active stream times out waiting for idle_comp.
- Clearing DP_TRAINING_PATTERN_SET while REG_DP_STATE_CTRL has not yet
  transitioned to DP_STATE_CTRL_SEND_VIDEO re-enables the sink
  descrambler against unscrambled TPS symbols, and waiting for video
  ready cannot succeed.

Guard msm_dp_ctrl_push_idle() on ctrl->stream_clks_on, reinitialize
ctrl->video_comp before retraining, and return early after
msm_dp_ctrl_setup_main_link() when the stream pixel clock is off so the
training pattern stays active until msm_dp_ctrl_on_stream() enables
video.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 779f743f9418..7201b7b513a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2089,13 +2089,16 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
 
-	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
+	if (ctrl->stream_clks_on[panel->stream_id])
+		msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
+	reinit_completion(&ctrl->video_comp);
+
 	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
-	if (ret)
+	if (ret || !ctrl->stream_clks_on[panel->stream_id])
 		goto end;
 
 	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
-- 
2.25.1

