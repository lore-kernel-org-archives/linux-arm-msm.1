Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774477;
	b=MdIYmyUjDa0xZFUu8EWZ7ukvOI8f9vn72aIFWESx2skAu4GljTPjTGX407a+yBNDwb47
	 +fzAHpHeZdfS+GiyrMNfk4gNRMp7BWIrVdnSOpjcWxWSJujGO7LlRjk1jBiTB4tlmtEEI
	 zTYVoJlyK6k4KA6oSJCX8xvgbXgCAlAMiLkw311W9NwlQJ2j022Fv0WDHYFcVSIj1Q62B
	 YDzLR+fc6CoNTQ97J7a+mh6l9RnPGH0gJRbtBIoQdZTvODOQIqpVJY6HoASgeMdIScJhJ
	 pa/mUrZ+IMQsOunczXpzmh4Rw1Mepx4EHfz75YebG5yhaTAH7fssEgShqG3cNQXZM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t/dAbzSvsstuhujmLiw7vlm0P1E43aM9T0PU2JqXZ2A=;
	b=WWh1WiEcycYjkDRAB6pjWl0/PCZZ8fnEtKTK2+OqYKZc6SJnw3PHavEwWI9wJYvAxlko
	 YzBUxIDL6Em2qyrp+UEEi9VB2x1lPn6IU34rQNkpfd4YVPnGu6ADGeTyfUNEwwoCG7NRx
	 X4VKdrkw/VUvrFuwPLpvjV90b0QkF11oq32xtiCYSMI/I0rmrGGVoDwJy8hWKML3wPvPr
	 YWrcKUjlTATzCWo9poG4Uu0LKBQV0v7K5Kt1wUQ09LtitDEn4GNbyMhDjfoOU2pc+L2iq
	 b+gVdlerBdakYrmUkhRuR4rViu5R9LxHjC7yLyhIdez/sLkwp/LyBh9Jc38SFOawoWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Va3cve+c;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7960A6F53
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A7960A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Va3cve+c
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a32576da88so4576529f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774475; x=1796379275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/dAbzSvsstuhujmLiw7vlm0P1E43aM9T0PU2JqXZ2A=;
        b=Va3cve+cF1AIfg3mCnD+fkbzmAm9PV2NRBVfKCjTMolZD+YHkE+VfDVXna/4BJBcyS
         Byd7drVEw+YJIp8Fg2DNygPdBOFByl/nh+OwqMKpwH5ZLYINMoFbQixVd03boz42vlis
         Zf3o2LwXFKaiadrhhWUJoacWLenY/7LjGlBW2fCxgYH+2K/YGdFSdacerv9tRM5QUPzy
         IuhnC9dUK6M+BYCxDdY/0qj4uIdjzH+5CZb0qHPt+Xt+rLSkmrjRacFOFZ2+lhVuvYLn
         lL+rslGAcvRb4mbTkodr13asmFIrtSZK71osjHd3JmGgzpOx0vYazm/GZbyOjoeAgGAd
         RouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774475; x=1796379275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/dAbzSvsstuhujmLiw7vlm0P1E43aM9T0PU2JqXZ2A=;
        b=V6SC04zbGhmXEUM1mUJcHv772z7ikIUr6n07r7TZpoFjaDeh38H52rnF9dd2pBMvGU
         5BFwq7PTi/rEwT6EF5spSwLDKG+m3sCx4py9sTVJh0b95OGcEMdue0hZ4wukmkk7IV7D
         i465amoxh9eEP4dZgxrRFzP9Ix/0ThgTl5PpwVDuXJSFOrqG2FveuPY3wfmqZhff1GWH
         Tj4GaxnWWJotB8Gk0prrvRpLWwD/IheMo+NgqMaLWQGNXdyepn4ar2smmBabGp52nFOm
         gwHLL021M+1NDb2wFgWR6cly3M6otOZDigmLhRPVI+UPYmqt/IRV0pb3y9rQCIZU4rz3
         HzAg==
X-Forwarded-Encrypted: i=1; AL+hErGFY3Tn6pw8zJV4wVw+EqMP9CqlInvDE2F+pP+4tLl0zVMk+pNhSnCqBTEXQBOLSfp1zdQ1Qf7VoW62zi3V@vger.kernel.org
X-Gm-Message-State: APuU4Z+H1/vWa8a0Bol0DO2vc1z2JD2sdoaCIGPpWyLwVAJeLQjmsmol
	u1F2sBOAc9qmwVDuE9dCr2N1zQz7LoWYbF4LXeej9jdHLKVo+V2eTsg=
X-Gm-Gg: AZFdTZcixFdMSo3NkWoldFA5oyBByAOpVxNYnN1ze3NQLCvZddFYtLZMT1uPd3ZsZ1X
	95P34VIUlL3hPdBhBk+NRYQWL9BVe3p9TCiQoblfb8e3qr68jU8mKN2+fMc16ydboUI6TbFHe4H
	v+3tEnZVsvDIEQTkBwCYoZUpntXihRKc2Vb20Ai4pzEdMZIL8o8jYZEPYAJ9r6Q/YBsoiwrbgsa
	8t0PM9ljVIhyvQshA/2nsZ2g258Z1L2rVT3Imygmig2QOuo92lLxCD3fEvAfzsAahlNjWJP/Z8r
	OcT7ZuMvim3EML8WBIWwl9zu/loJ0njuvIYAfFJqKjMyZOm3ydrqDPpXA74sUkzcVXMgFiSu6xX
	GoVnb5w+ohNUAGb4Sb/79+bQBDXR1Mt35tRoNY0eZJR1kDIhY+iW92BVe7nvLZ4nlhstaZeRrXx
	41yZyR0ivVbf2C3sNT7yx19qnhTDjJy9+v1qHaF8aVxzBi6xVk1iFfj2ROBPDF6DZBPkACcqqiC
	PWib/lszVsfsLxPvjuibiFNETz+S6uSpT8gi6FSuNYs6VsX865kk9+LrqozGJYghRRh8CMFu/8b
	C4jLvuvcGr7dstX98wbg2wgoA6bsBZ5Gd1r1mZ7i1q3PzDSrCgsv6i5E66bFbbuWE2ESksagQ18
	S7BfKn2fNw1mvupWJmZICCxhV5gP5YTWnOXyRpMQQDVIJxYSP4yyxnVkAVBY=
X-Received: by 2002:a05:6000:4809:b0:4aa:842f:5f78 with SMTP id ffacd0b85a97d-4abb759e947mr44997485f8f.46.1795774475027;
        Fri, 27 Nov 2026 02:14:35 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:34 -0800 (PST)
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
Subject: [PATCH v2 09/10] drm/msm/dp: re-read EDID on demand in get_modes when blob is missing
Date: Fri, 27 Nov 2026 11:14:16 +0100
Message-Id: <20261127101417.24303-10-gianfranco.mariotti94@gmail.com>
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

When a DisplayPort connector is forced off (DRM_FORCE_OFF),
drm_helper_probe_single_connector_modes() clears
connector->edid_blob_ptr, and drm_edid_read_ddc() returns NULL if HPD
plug runs while the connector is forced off.

Since commit db6f98b9515f ("drm/msm/dp: remove cached drm_edid from
panel"), msm_dp_display_get_modes() only calls
drm_edid_connector_add_modes() on the existing edid_blob_ptr, so
re-enabling detection without physically replugging the cable falls back
to 640x480.

Re-read EDID via drm_edid_read_ddc() in msm_dp_display_get_modes() when
a sink is plugged in with a NULL edid_blob_ptr, and suppress the false
"panel edid read failed" error log when connector->force is
DRM_FORCE_OFF.

Fixes: db6f98b9515f ("drm/msm/dp: remove cached drm_edid from panel")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d3f4b5a9e723..fd9d5f176329 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,7 +290,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	drm_edid_connector_update(connector, drm_edid);
 
 	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
+		if (connector->force != DRM_FORCE_OFF)
+			DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
 		if (!msm_dp_aux_is_link_connected(dp->aux))
 			return -ETIMEDOUT;
@@ -810,6 +811,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 int msm_dp_display_get_modes(struct msm_dp *dp)
 {
 	struct msm_dp_display_private *msm_dp_display;
+	struct drm_connector *connector;
 
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
@@ -817,8 +819,21 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	connector = msm_dp_display->panel->connector;
 
-	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
+	if (msm_dp_display->plugged && msm_dp_display->link->sink_count &&
+	    !connector->edid_blob_ptr) {
+		const struct drm_edid *drm_edid;
+
+		drm_edid = drm_edid_read_ddc(connector, &msm_dp_display->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
+		msm_dp_display->audio_supported = connector->display_info.has_audio;
+		drm_edid_free(drm_edid);
+	}
+
+	return drm_edid_connector_add_modes(connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
-- 
2.25.1

