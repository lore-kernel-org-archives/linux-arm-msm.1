Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297288;
	b=DRW1l9MSPtdPppBe0qWDVgjJGbe/nwe+33PR9rOQTHd1sMNiKHZAqg3VtxGqX5RQRqLO
	 IVE+E6piBIydfReM4bMnEbJvVE4LmnAhvPUBhZPxni/PIaz8G2DiFJCgSfML0/Fq1/fwb
	 Jr+hAyeCeFbJPGr9i+5Ct0tt6dK+N5FyMP1B1DWq8BwOxnMocaK9MFbMS0JC+RxdlFHHq
	 7f8JjuMyTwOmCDvZ45vcniPbhxHT8WimtDF+jTHNrInVIzb+kRN84aBRLfXwPeDa6mGRF
	 Pd5V+kNXCl6SxiZpovS3bOR5PESdYr9BgQn5ALvbuS5VebT9QZIKyu1KBoujehTF2hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/I60O6m+DFQriN/q4lolCJJt5ab8WOxlO2aTwkK9VZE=;
	b=k9HtiZ/eybWRwffjqx5lzZFvZO1+hYuSKUeQ0FK47MXm99LkrR7AmlAj0RH2zSZ1YDEU
	 iPyF8VS6hMsRZjU9qoXkyJwahufyJYSvyIAX6L+HKDNq0TzK8O+mZDwBVMnbklraYiROU
	 yAhXizlDpMrEKp0lAPyeHFjaRbmMNtkEDsys8O+45X9rpg82EDVrFk+tEHbYIyXXN/UiS
	 TMgJ4k2QqtLNc683FIrjAF56mueV35QYiIRBfem3XIhn2FZinrkbMPKYWGVIvk93oKjX5
	 4d+07XF5xUsnDvkdz7k4PUIJTy1x65HtGNeKRD578T7ogMZ1XWKVcyllZ5iyQ+pBRuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uy6YUXOK;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C3606A335
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40C3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uy6YUXOK
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so24136405e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297286; x=1795902086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/I60O6m+DFQriN/q4lolCJJt5ab8WOxlO2aTwkK9VZE=;
        b=Uy6YUXOKot9d9pujQ/L3tSdPnWAQ6p/To+Ky2j8VKWwF8ITWHGbEAzGXKKtnJzTfGv
         DV6kmg8QCT1JLHKjA/CUmlXMyD8aK9LdYPkcnE86a6+DuG4rT7amEq5ZRS9DKDhX/bjt
         Knq1GEY5Pi/dAofXoFYx/174Qe2iMk9REWfLbYoLD98vEfsD1PoRgEgQMzbGJE+25i3o
         hp17i34Z0mafsDLw1vI4TxDy2dCbe2NdpfyFmLTlbJPj0LHaWY0eCOBvQ2EuvNEDbgiw
         HqK6ILrk0RHMQmtKCcg0AgnlqfueUKBqoJJ4NRtyzoqIepbLbdmrZJ7n7Cz1lEEblvIZ
         zmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297286; x=1795902086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/I60O6m+DFQriN/q4lolCJJt5ab8WOxlO2aTwkK9VZE=;
        b=Vxfry8T9HK3RiUzoNb1iuQQJziNHaFZH5qaTuuSmnjy3m6nWK4N219HJ9O+BuKHfZx
         lPGU/DUflR83cEVwxyWDNFrnSD30jSg8blTV9pwU/mVaGhkq+99NH4+zzSi1p/rFieIF
         OgUBYza7F7lH2tFbMXITQLEG91rSaCF7Ge14eoDS4N9osaDP/bJ22qHRNZf/FZk4U0ge
         HPjQSDuqLjJFkf+WDNGhDnFSVFzexFsKQnpSyIw1lEzeis2rArgXlO6Z9A9UWEyPW44j
         q98XZDmTMcSiI2Uf8OLo79j03sY8Pywdu3nqXYyx2z/tdNmOWIqzWAPWMNddd8ZAgYCd
         Cy9w==
X-Forwarded-Encrypted: i=1; AL+hErGF7M6O3X5gBKo6lXecRNotwvh/mIZ3DIB+MtpRfGfgkenw0se0eA80bNfvW70CXVw1SOy1enfzMp8ds0F0@vger.kernel.org
X-Gm-Message-State: APuU4Z9/hX5CW6z9yTyicRGUtamv/C/H7bZUbf69XqwzXVsoNAJJrwRD
	SV7jrRhaGbptNCHyNiGiB2TFyjOaKQ/7dtY4Aw4K8z9l5S/KTZNVqt4=
X-Gm-Gg: AZFdTZfSDV8CAM9049POhoqmv6HiI1ZnHjwWUGb7bUFGxBl6MBEai0n61rlF/J13I+o
	AcF+l/mt1cqIu0U477oY79Ps+UD2mKrxYAHMxxcjJuMbZBY8p0YTXcgCyzGjrupPdzb2BVGRmbe
	hQ91+UWotmAOR3E/KLUp2Fs3gf9IHwJ3iPDaOeomAQo+i/vGUxULs/VWfT3KW7Iwn/c+8P234nV
	KyPFlfNvAooMfeMuB+7cXdPv/Jn8DSxdKKm732Ojex25CowP606oIOCCAIzSL6AeP+TcSrbqhag
	BQnP3zRFZgxTlDrlkssHovSdQRipoIloxFPykvsRuz+KFSvRU1QPVbYbuowlG2152axSIuo3Dx2
	pIFmmgY5/mx5sNKZKbNVC3dqZTpKbil0oUjmJ5hveGpwXL5NVeEzStg58H2VwNZ/8FGYgBZQ/W3
	o/HsrtLDmc6RbT+k/loQiSHLf01CQt/wA0oFHeAQRPZBWZ2MRoC+VtDQ4FxdaCqRhNvTOU+dOst
	yB29kaw+isrMPsOvBOkcVuuTHfLg3Z+doXv+GXXIU9ZowogBffw2tQ/gblg4HpIQRmUtwUgmCu2
	L1CT2Vrg+HT7qakctd/uMbasarvgtdeQCWEib4o=
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr161230565e9.1.1795297285984;
        Sat, 21 Nov 2026 13:41:25 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:25 -0800 (PST)
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
Subject: [PATCH 4/7] drm/msm/dp: restore source params and reinit video_comp on link maintenance
Date: Sat, 21 Nov 2026 22:41:02 +0100
Message-Id: <20261121214105.32596-5-gianfranco.mariotti94@gmail.com>
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

In msm_dp_ctrl_link_maintenance(), msm_dp_ctrl_setup_main_link() calls
msm_dp_ctrl_config_ctrl_link(), which resets REG_DP_CONFIGURATION_CTRL
to 6 bpc without restoring the active stream's BPC and format via
msm_dp_ctrl_configure_source_params(). In addition, ctrl->video_comp is
not reinitialized before waiting for video ready.

Reinitialize ctrl->video_comp before retraining the link and restore
source parameters via msm_dp_ctrl_configure_source_params() before
switching REG_DP_STATE_CTRL to DP_STATE_CTRL_SEND_VIDEO.

Fixes: 0a19867dfb8d ("drm/msm/dp: split link setup from source params")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 779f743f9418..0904893bd529 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2094,10 +2094,14 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
+	reinit_completion(&ctrl->video_comp);
+
 	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 	if (ret)
 		goto end;
 
+	msm_dp_ctrl_configure_source_params(ctrl, panel);
+
 	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
-- 
2.25.1

