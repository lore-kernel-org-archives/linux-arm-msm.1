Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EA741F5C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529163; cv=none; b=KJ0XiW+uqK9WuhYDXcDI0nIhmU//kfCIVbI+IZQilu+Uy6ywb79HGRvwgiv7JjPOutPGPhag6nOBFg3qy2+CnR3XVWe6WxtpAIh43w0AR52y6uKWyDY7M2xPggQsE8z39twas1bgqp1Wi1sqE/1YT4o4IvlxoUIoxGepf89/JXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529163; c=relaxed/simple;
	bh=zRVkXvGLzxZ62yvueEfVVjtvPkZXtQlKXDr5boXzW0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a7voMqUi+EvBiF68iutRu1zGGBNIbxLM7YIx14XRD4OKRc4gZ2y/NcYWc3MFNjTfKDUUUfZkoE1idMNjSSUzwWCz6AOlM2cuYsjVYv/Ci+gZrwQbwoin9/ZUZgh99nsACSzLjdRlaNs7biu8UvhLIZG9yaSpbdHvkJGgRDXtdnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=UhYXH4XK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="UhYXH4XK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso7542745e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1786529160; x=1787133960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8lTgpZKYeMDewjAwTo7awtsmXJS+XkKIAXMlp0xZDk0=;
        b=UhYXH4XKdcd0a0B6ytmc9IaTrZc4S0KW2al2VAoq6+fl+5P/E44JSnGWAwU1Z7DWUe
         azLbug20rRPqt/NFBpYJykNCYkgcxQDFCfhzDgefW6HQEAuMa/hHBjECwGtTOQ6R0j3E
         6eR1h8YDEu6RiGNdJpjUp9Zf9Rm9lB8Tk2RtwnJqJl0O7oenTcySQ+qw9EHzguNpVPJy
         cfmQYICl8XaCqqSeGr+fra6uCw2bs6P7nrlybClS/otz9Eb55SoCokXu44keONdxiPkt
         Sd3+XYrA0k6gXZQXHusp3w4oDNPuk3NUEbevcXmeW5pqKWjEz6BVBlk9T3ZjEuMAbZoM
         lVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529160; x=1787133960;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8lTgpZKYeMDewjAwTo7awtsmXJS+XkKIAXMlp0xZDk0=;
        b=PF3zgr9L3AlXC5P76h+AClXQFCOq5WRq+Tfbu/3WysUXu7VdXP5laJ1uRw/WZ5MMTo
         jUHQsi4cNb9hBlgJwzHqVLWaU5rOktnSProAn0NLP0OMA5q7u8IaJ/DuLfpdF/LKszE1
         yX7Z4dFqoA+IGSaWCZ681FCcvJj2nlcWparnGzfpJSunPQ3EQDlFL9gRaYpUQZhS57yp
         XdeWaDyIsJHWCto3qfr0ovT2W9kizmFW7O9GBaJ3CiEqLMxB7OwUrABjrlDx2mmAe0NC
         KtzjOhVQ4QyX6EQEeRu6liwHXKFKOSal1kIs2m+ZttoEhxAqw38I3t7zpBF85TXBpuwc
         2YLg==
X-Gm-Message-State: AOJu0YyMBvTa/ZfqIIHMFLkAO19Bqin/TuGvj3jeY2beoZbZNHDkVhWG
	JPVgG6Oz26/i1RHUNABrl2Jh/f0Q+n0n2rf0352ZuZB8x5FCheC/W6ucAo/5TqZbcIs=
X-Gm-Gg: AR+sD11aH3VtWezYMVXQv82++FQTwUSN5DAvbssPq+i4QcqdKPWJi7NCWZ/b1OU0aVw
	B09MdaZPnDtk9cNJ7ywpNDPCaxNHLKdfAgqqcR8c4wka1fCPNF6C7CaSKPQMfEpoQI5P9OqTaKq
	jQS+goSnZkKlTGqMrSIIlXAt1CP6W71VMby59MAwr3bmuJhfJXoafiE8Gch9aQUERSdWJQx3rgv
	+DWfpoumoK8JPqvEEXhCW/NxjODoQCn2b2ounj77gXqeONe9P7viEGbQ0QgmMGjpu6sQkQ4igQC
	sZ1sCpU5Bl47p5Z0EuRc29WIh37kW8xQkABXCbhjQ3cKUYA9jYMKSlAXNXvPZnQ6fKu0itnECMC
	u5UGuoMYx/PYmR7hYeM2Z4k9owUqRRINNELofdrl6nJxxvY+kiQ+4R5gOe9SV/uiQN/heOwqM1/
	busa2Yr82NF/XHALf34lXqvVvMsErH50qjA7AzGCxELvMuhzNwaKUJxxphzkoNOgPcZWkwbMpUQ
	su4Htc2O7AW4gQdWfsvmClqa+YIerCapdLzR/yYGCjgZS5RUf9UNXMsdapGew==
X-Received: by 2002:a05:600c:8b33:b0:499:6a92:fff1 with SMTP id 5b1f17b1804b1-4997c1706afmr55104685e9.18.1786529159744;
        Wed, 12 Aug 2026 03:05:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:ee86:877c:752a:fac6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5eddbsm6568147f8f.31.2026.08.12.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:05:59 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Wed, 12 Aug 2026 11:05:52 +0100
Subject: [PATCH] drm/msm/dp: fix link bandwidth check when wide bus is
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-msm-dp-link-bw-v1-1-b0e3ce1190be@imd-tec.com>
X-B4-Tracking: v=1; b=H4sIAH9FfGoC/yXMSQ6DMAxA0asgr2spRIy9SsWCBBdMS0Axk4S4O
 yldvsX/Bwh5JoFndICnlYVHFxA/IrBd7VpCboJBK52pItY4yIDNhF92HzQblqVOU1vkytgEQjR
 5evN+D1/V37KYnuz8u8B5XqQvVkRyAAAA
X-Change-ID: 20260812-msm-dp-link-bw-99255c870bc4
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

msm_dp_display_mode_valid() halves the pixel clock when either YUV420 or
wide bus is in use, then uses that halved value both for the controller
pixel clock limit and for the DP link bandwidth check.

Only YUV420 halves the data crossing the link. Wide bus widens the
internal DPU to DP interface to two pixels per clock, halving the
controller clock. Every pixel is still transmitted, so the link
bandwidth requirement remains.

As a result, modes needing up to twice the available link bandwidth pass
validation. On the IMDT QCS8550 SBC (rev5 with CYPD6125), where DP runs
over USB-C alt mode where only two lanes are available, 3840x2160@60 was
accepted despite needing 9.6 Gbps against the 8.64 Gbps the link can
carry.

Use a separate link pixel clock that is only halved for YUV420 for the
bandwidth calculation, leaving the wide bus halving to apply solely to
the controller pixel clock limit. With this, 4k@60 is correctly rejected
and 4k@30 selected instead.

Fixes: df9cf852ca30 ("drm/msm/dp: account for widebus and yuv420 during mode validation")
Assisted-by: Claude:claude-opus-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..b2d6cb82a146 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -756,6 +756,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
 	int mode_pclk_khz = mode->clock;
+	int link_pclk_khz;
 	bool is_yuv_420;
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
@@ -775,6 +776,13 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
 		return MODE_NO_420;
 
+	/*
+	 * Only YUV 420 actually halves the link bandwidth, as wide bus only
+	 * halves the pixel clock within the SoC, while the link bandwidth
+	 * requirement remains the same.
+	 */
+	link_pclk_khz = is_yuv_420 ? mode_pclk_khz / 2 : mode_pclk_khz;
+
 	if (is_yuv_420 || msm_dp_display->wide_bus_supported)
 		mode_pclk_khz /= 2;
 
@@ -786,9 +794,9 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 		mode_bpp = default_bpp;
 
 	mode_bpp = msm_dp_panel_get_mode_bpp(msm_dp_display->panel,
-			mode_bpp, mode_pclk_khz);
+			mode_bpp, link_pclk_khz);
 
-	mode_rate_khz = mode_pclk_khz * mode_bpp;
+	mode_rate_khz = link_pclk_khz * mode_bpp;
 	supported_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
 	if (mode_rate_khz > supported_rate_khz)

---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260812-msm-dp-link-bw-99255c870bc4

Best regards,
--  
William Bright <william.bright@imd-tec.com>

