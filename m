Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202456;
	b=vIkeP+t6nc4BOx9HluKrePX5go2algGijOP47GtC8L/a1j+XVSashSL1Nt9Ewpo7zpmw
	 0PO3sbODuGeXUSb0dAH+aMa7ZVCps1Q0OdRNcWgPHSCrQ9WZCGa0WJyx03GSlWB2V+6tS
	 KBjS+IAx9BWVQSBV6zN3UJ0OtxvrUfyPj87V75rbXoWfiCNkGLOMrc46A4hyIMS5Bl0tu
	 dhwHjaGljCQ32GKMdFcACRLlMaj3JTjiRqLpL64eggsSRv0eZU5/rEMnGpNtU8bUfP3Bw
	 yKfgN77gW+i5/6Rt0Qg7fR1zsbFxUceQ3A6YSzwNhqEYqNYuQAffS0SKgD+eouaZ9HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5xn4C6Gwtp+D5V/nlSsDQf1o0XJ2+OFbQn76n9amPzk=;
	b=0VsUydIUqjbcJSE6FpyKXgOQVxECcDpbn+cLrflMeipNnS5RCsuC6L4P/INDdnVw0b3G
	 URgRMviDzs5Cw4xqF4qQ2TG3Mr/qGQydX4QMT6C3/I3SxpAOMT087gYTn6YeZBtZy4K52
	 EiqXL7JjbhdbWTaE1AP3a6ip9W/DJa9VlHQ640RPJ00ckOIWnrpYoQRyKexqbdgmyax0V
	 wImOMVTePS8EeZzZ4vGrhr+yAyhewZPjd+WeD576VR9ZH+eUdU2v3Ur0ll1gwoaudFtwP
	 PXys7T7HcJaIc75wQcAyHvHT1hGpOebum5j50+pjptGGQEScjicli1Nqu3xUbb4W34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBKTzH07;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A602606A6D3
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A602606A6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBKTzH07
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55ade1de0b4so14473421cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202452; x=1795807252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xn4C6Gwtp+D5V/nlSsDQf1o0XJ2+OFbQn76n9amPzk=;
        b=gBKTzH07dnN062EToHVNp+izG9QvHqNQ+NVJlreNNEy2LZ9+T0mMrQEJkL4hSkK0ps
         /0P9t9gfC3HtJEpXZIQDL1cIR3aJbTSOwNZAkh6D0DI4raIq1IbFX/D/FhYuXWfKaWFf
         FUYJBCPcSq6NjKyL3CMUcUBbweFu/LL15rUdyU4xplf3oGV9cExrqHuwAsSWpp4Km6n4
         Usr8bxr4glD4xMIl8mYZ1kizPM3Njm85/H/g5osTnGKGh0ixYT48HEL1CQqfsW01uFpl
         tO7J8RQNsydWX94iSaffsyi88FrAar5uJeW8R3JuZZ8ZgP5cTQ8lZaxZGRp42qqIVzOQ
         4VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202452; x=1795807252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xn4C6Gwtp+D5V/nlSsDQf1o0XJ2+OFbQn76n9amPzk=;
        b=e4XPpAywtVk4isAsqyPXs/yNNfDepLRh3I9uigVZGC6pXpXoQPqS2rG1L173wBTIPb
         OYJw0dV+5uqpGeB9ur8LTZ8OvPiXy+d1rCmO+L3q90yIHH02LMxtU5ghlOVpJRVvi/MA
         ydTgwOnnWV3wT+jjKpByRpMXCPtMWLK/4BonlgkEYtpllWpQeC0/+byts3aUK8qykw9y
         7gK9Gp9cnobOfrFHzrrQGM38rJ9n69H/VEwEJ/hMKypnmDC5LulrsybMqlmuY90ZZggG
         A+pjILsAEc4XCwELGfLJtojRtNZdpDV/bJnYUAdhX4B8bFa8Pn+uoCZAeMw/d6hseLaZ
         snFA==
X-Forwarded-Encrypted: i=1; AL+hErEYxxsfDRxIUBjVVzSWVf1wiotJAv20ozdePTM2c7J/P85pJtC8W36+57IXA/djE3GTpiNKO5eD3aEOa8a9@vger.kernel.org
X-Gm-Message-State: APuU4Z8760tSkM1wEwNt4mG1Jflc5jsO9xYK3H4ZTnHulaOGWeWj1ECT
	lkpL/7VetN5pHQPFsS0eOLa6XvL4XlJWDeEG2bNUHoKja0GYeC8u8jvd
X-Gm-Gg: AYBFou2+/h+KiQYZhq8B1E8Twwp8S7RL5gGBoLzIMgAIbcvJtda/Yk34TFGVoVQ8GuQ
	Et46C595/DTHsUgEOKMGjwcnrNGV35GrkL4If6D33PySoLz7WfJ4VRWMgNovwRrIf+n69bgVtBW
	jmubNE0z7H/hXDXdWQnAJBGA5pSJmZFigyxq1RMh/mcZ+sCIVHED7iEbI9iyiBZkxcw4hVSTQSj
	pN8Au5mePHziwki91K+6F0yC81Tg7sZfbzL4tqN3it6LfioyR433FuT+30065HY4c67qXHKwtpN
	wXhmNm+0GNQ7dABeM6gfaLsCpY32XNpuO9Jw7sarMw8mPdeksGogIRKYb8p79bAXMYQZgCTHtfG
	z2mqrRKfn1hqO46WX2hstT2bm2tS3NsNcpnCQ+iqnqfkOyDrOKJyPqjcvnD10JR5ikKTXnpyaD1
	K3Ol2ww8obXpFfCxyjPZei+FWKAe4VfTvYaOcNHekXawFKW8AxyyHnACgu0LZELhYG9IUGrN/lA
	vebhkXUCIuREhPOErw6Bx/snXtpXK49ffElLaN0AIRhOEXG+ZeQ/Nzst36HpxFfyyfVdhmUykAs
	uSfxT/IRMYahsDhrJKIFxoGSne4F5Ot9BAvhz6B0eWPsBUXqNGuBvGz2IoFhdq7HKinGi+4sR9e
	l6k5hP98Z0ZCqnuHf1kPNC4oUA3O5mjvfj0nsGLjSpIlousEPiawCxw5YwqrmLjeHyloOgMvvEZ
	XPTwnXU2G0HICtBrwtf7NakPWlTpisIcGOVcT0y6/IqCtckEcPVEz32WKoCpj2YvJCLHHiSYwce
	akWqhD1/Jc0byDfKUdk/iUmvfykE9WQXRwNM/e2474GUiif123jtTYHKZApO+pqgms=
X-Received: by 2002:a05:622a:5512:b0:535:1d90:ebcd with SMTP id d75a77b69052e-55d76a6f9ecmr76637611cf.27.1795202451996;
        Fri, 20 Nov 2026 11:20:51 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm31475921cf.12.2026.11.20.11.20.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 11:20:51 -0800 (PST)
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
Subject: [PATCH 0/2] drm/msm/dp: make the eDP 1.4 LINK_RATE_SET path work
Date: Fri, 20 Nov 2026 14:20:48 -0500
Message-ID: <20261120192050.73315-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The eDP 1.4 link-rate table support picks a LINK_RATE_SET index in
dp_panel, but the selection never reaches link training: only rate and
num_lanes are copied into link_params, so LINK_RATE_SET is never
written and the rate-set fallback branch can't run. Patch 1 carries
the fields through. Patch 2 fixes the fallback once it is reachable,
so it stops at the lowest table entry instead of dropping to a standard
rate the sink was not told about.

I found this while bringing up an ASUS Zenbook A16 (Glymur), whose eDP
1.4 panel lists 1.62, 2.7 and 5.4 Gbps in SUPPORTED_LINK_RATES. At boot
the firmware has left LINK_BW_SET at 0x14, so dp_panel picks the
LINK_BW_SET path. When the compositor starts and the link caps are read
again, LINK_BW_SET reads 0 and dp_panel selects the rate table, but
without patch 1 that selection never reaches link training. With the
series the link trains through LINK_RATE_SET (5.4 Gbps, 4 lanes).

With a test-only change that fails the first clock-recovery attempt,
the fallback moves to index 1 and the panel trains at 2.7 Gbps,
reading back LINK_RATE_SET=0x01. The lowest entry of this panel's table
is RBR, so patch 2 does not change behavior here.

I tested on the A16 with a next-20261103-based kernel; the patches
apply unchanged to next-20261119. They touch dp_ctrl.c alongside
"drm/msm/dp: don't fall back to a link that can't carry the eDP
mode" [1], and the two apply in either order.

Jim, Cc'ing you as mentioned off-list: Omarchy's arm64 kernel carries
patch 1 as 2367 with your 2368-2371 on top, and your 2369 covers what
patch 2 does. I'm happy to drop patch 2 if you post yours.

[1] https://lore.kernel.org/r/20261115000021.78869-1-jesse.casco@gmail.com

Jesse Casco (2):
  drm/msm/dp: carry the eDP rate-set selection into the link parameters
  drm/msm/dp: stop the rate-set fallback at the lowest table entry

 drivers/gpu/drm/msm/dp/dp_ctrl.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.56.1

