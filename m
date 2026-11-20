Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202459;
	b=tEFeIE/L0tkYUPDCw3g2x8cOq2JnT/nrYEG9AcsxN51eXV9dlBro8HhCxFk426BXpNNq
	 Lk52MGv4WmqtexKeqDjnYxbt3LvvufLyb+hkXfhIWM6vlh16tRTTpPuSXgrjXE9E76Sy0
	 QY6Ch3fKwH8QYFaGv90/fMTlU2ZwoZNZEJC+KVRNQh9mHsBtY5oxfhDJ0pOjAAp1d8TLG
	 R/F5YNR2QR4oI1dfW0JnVM6o5lWBjp/Q9gtpMhHUPhnr5CXvZGVjjG0S/IVn4SLSadaJ4
	 rTjgF8mHEHFZi5O2gXbDlxh/uKJZ4F8+29g0Whfec1y3U46kj7Hla/rZv2o0TFq+c9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JzigroRRK1EKbCrob1Vqde61idCw6MMlemAEeFuskd4=;
	b=zFUiesFntiye7AmA28YYgVEeKsX47Vm8F6zUUFBuOFS8J/kLXCnQRz1tmb92vWy8MGjP
	 T1Xzj/xTTHJf9wvplWuBuvprDpIZv0I/KPsKnh9oiqeHZuBP8kHis4t4y3M8+BBPQW0j2
	 mlaRXGho1mpHRT/vU9nIzOrQkWGG0ILUWk2PBlhkWSNOQjjLtXO6P5D6TLG1rIG9bu2uc
	 UaRiR1a8NsoxO64wjacDNyfEMzG0JoXSWKWHPRBujiDnkUKdBlL+WMjYM226bh38wzxRe
	 ee+hUN+5QBhkaDYjXpwEZ6KElsEu6AtPGwpv7kGGGTM9gai/qsJUGAJLjMKL1wr2cpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zf6DpcyH;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28B606A6F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF28B606A6F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zf6DpcyH
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55d2b4a99d4so14622201cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202453; x=1795807253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzigroRRK1EKbCrob1Vqde61idCw6MMlemAEeFuskd4=;
        b=Zf6DpcyH4lpu1wQePVe6xNyOmZR5hsjXSYys71pERhjTfm+sbkmAmsfFYrW8ulzYA5
         pUHFJQ9Tu+CS8dE98hHU4y9ooP4uI5OdtnYxz5oEOzM2T0Vii/eH4wqFMoBN7plS4AEq
         wy/CJTMk+a8BSuxshEwkFiY4rMf+3NTrs8ECVVllpkQB/Fjr0h9RmNe5rHgk9xDXy6+T
         0Kujq3GC3iYVjzxqUJYfkGWWQxbBCvA0pAxFusqP4GnYbdJtAKXLODkfQMzL8vnv5Jeq
         Le9L/JDJeAGAJN+Ol8yvQ8XvBJQRAsN+LuFqulUM5iL721lhhxSPlzcmbywDQhs69BZM
         QUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202453; x=1795807253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzigroRRK1EKbCrob1Vqde61idCw6MMlemAEeFuskd4=;
        b=FU7Ho8lK5oOLsTdsu1mY+nCwCpk6Sgcr2uRnSu11yohrRroj15WR43NXx58dEaCHEV
         9SzE02B5/6gNsf3PZ5WaoIgwAZm5gsDXWhbWYZ+3b2W+heXlCe2de0hvT7Hehfn+5bq8
         +BD07tsHZmQLvELt8pIuWfd184ymDkHOcm5PikCzm30Me9wXfpnSW7UfikoZoQ8DK0iq
         LgfiFcXwqIcUJ0Q2UXIjv6SBtaox5mfs4nRWbEME/CdLsrlQ76HlCUQ6dgx0Z6G1lEjh
         3H9MfN7RuRcQWxMvQ2GWrRLXcGLbAaf5mUq7GgQE9+2XcP+kUu763UgFZsoFH7mBxmfU
         Ycog==
X-Forwarded-Encrypted: i=1; AL+hErGdFjdmwc3dSEsbGwEyxFBD0Ita4JboaDPuEymupbbfgZSo9SDUp5xbjpuC4vueRKtDDR5o78+M3sknmKjE@vger.kernel.org
X-Gm-Message-State: APuU4Z/xT+XN/s9N53ctA7ThZ3dZmOR/rU/zNq7XB1Tn7cwd29JHyuWn
	GygLfbWJ9OHqlGqQIujhFlXP/QzDl2u8/mfR4HuDrhxN+JxbBlb8vQvq
X-Gm-Gg: AYBFou16wNlr0b1guRrFwoNCKQbXrPFj4WHGqWvGoG5McKjyvKfe/uVfKlmRBfcKYqa
	UuC37JUmd5DqqKHFT1mfYLY+0fn3r+GDURvn5mIoI7/dEchoqPEREFj/CNe1MXG2+e28rlt+kY0
	DCxgaAuqHysWwBQKvzgYIqxlNtsh0AbWEW9faIGhRIB/QT+Cxa3gJsOmkfZa9NFZcHKVNeX06Gu
	BknCEHhWzt6I1V3PzowogWq1mQV3QN57yZnqq/2pCUHloJ5hnzVJQPdUfsHc+WzN1D3eZTigYnu
	+JdlEBYFo3lEE3xd4ET153YQmxiQK3z+LDV04v89ZVh9nFs6U8l9u0VSlUFm1vix/ifM5V3MokS
	7vLiGy66SWBBxZBka7EaXluiLCsf2DGqj+wfSnWXY325B9n3QZyLvXnPfBFWPPCaxVHlPeDNHSK
	oPzfRdi/sRwJpexYjfrRrFGcarMDbz5wWiioZ4hKSbhBEsmCrkO9KFUYBkbMiASWn8OiAv5Xr/f
	kUbGjaNNrqFgzRG5KddHmx92iW3dSgIpnsnCYD2s0ghJrrhtbppF0Epdcb0uOmOX+6vfalCr5b9
	kWxttN/QiYr7UZU8VrQ9+Ro1AShwsELp0dHGRZNJvg5ywGXZ+orErnlVscv8k36eHb9t/akxNdN
	PVykRsxDx+xicIHYsLIPjsOC44sxPQFMqyuOCAZyc9USfywFvOhg/kI7/N/szTH88/84qgssbt1
	7TJ0h258ko5IxCOULG7PMgkKTLY+g9AwXfQBoWpMdiYXDJpBzKTJfgpaOrssuJgcw6nOd0Ls4Pj
	OC57UNjMHdizn/2w2gJVKXfLXn286gdgBNtkTLwCDO7mA==
X-Received: by 2002:ac8:5a46:0:b0:536:6bbc:6187 with SMTP id d75a77b69052e-55d76a4ffabmr77548281cf.31.1795202452871;
        Fri, 20 Nov 2026 11:20:52 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm31475921cf.12.2026.11.20.11.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 11:20:52 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jim Martin <jimmartin@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dp: carry the eDP rate-set selection into the link parameters
Date: Fri, 20 Nov 2026 14:20:49 -0500
Message-ID: <20261120192050.73315-2-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120192050.73315-1-jesse.casco@gmail.com>
References: <20261120192050.73315-1-jesse.casco@gmail.com>
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

msm_dp_panel_read_link_caps() picks an eDP 1.4 LINK_RATE_SET index and
fills panel->link_info.rate_set, use_rate_set and supported_rates, but
msm_dp_ctrl_on_link() only copies rate and num_lanes into
ctrl->link->link_params. Link training builds its msm_dp_link_info from
link_params, so use_rate_set is always false there and
msm_dp_aux_link_configure() never writes LINK_RATE_SET. The rate-set
branch of msm_dp_ctrl_link_rate_down_shift() is unreachable for the
same reason.

Copy the rate-set fields along with the rate, pass them to
msm_dp_aux_link_configure(), and restore rate_set together with the
rate when falling back to fewer lanes.

Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 47647fdec..c8d097d65 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1596,6 +1596,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
 
 	ctrl->link->link_params.num_lanes /= 2;
 	ctrl->link->link_params.rate = panel->link_info.rate;
+	ctrl->link->link_params.rate_set = panel->link_info.rate_set;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -1712,6 +1713,8 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
+	link_info.rate_set = ctrl->link->link_params.rate_set;
+	link_info.use_rate_set = ctrl->link->link_params.use_rate_set;
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
 	msm_dp_aux_link_configure(ctrl->aux, &link_info);
@@ -2407,6 +2410,12 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
 			panel->link_info.num_lanes;
+		ctrl->link->link_params.rate_set = panel->link_info.rate_set;
+		ctrl->link->link_params.use_rate_set =
+			panel->link_info.use_rate_set;
+		memcpy(ctrl->link->link_params.supported_rates,
+		       panel->link_info.supported_rates,
+		       sizeof(ctrl->link->link_params.supported_rates));
 		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
-- 
2.56.1

