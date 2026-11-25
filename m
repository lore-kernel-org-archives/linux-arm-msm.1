Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795603364;
	b=i+9bU4e3Ft2BLclCEyURw7NyQckbjycMa4AgGehrnOAwceo2uX3zfdsi50fLsFMl7uXX
	 zc5ScQhkOTAEoK2ZHuv6vdhIpe5bXUAhA6SglVnJstI3mqYdg9qhRUutCGqC/m+MOjFCv
	 aQzP4votMm8eaQN0/t5g2ILlP8Ll+ei6jrx5RDbun4eUOTy+ND6i8ZreKHA4Tj450v914
	 0IkO7G0D4Sn7hkQFrWYsESlXBulBbEF9d+x/U39YgudqD/w53nd2Wx7k1BAbHjqjaA20x
	 9vJEFxiA/eVTlIDvRM9bLstt3BC0LIoyGEuIc4jsn1FvRDx8UFHuREYKxvNocgk5ZeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
	b=C32KnMOJONgPKscsaIJOoovLuNKw92bay/SYnx+O+dnYlDLLXbg0EWSdCDZ2aYuD4B7s
	 ull/Gez8pvZQelyi6NJW9xO8/yH5AQuP9Y5FAQnZnmUb77Kz8qivEdVTf1h53jpMlBFGQ
	 I4eJvxzlmiLoKhNSHorkCViP807t2FHJGPB81TNO7Pp231JCbe4FcKmzOJpkp+s+nDLq9
	 pnmDXGJHMGCjOh86/FvGGe7EuNiyB9mRtEgK4REt/njExlm3JuIPYBa2N2z3Fwp/2QxJv
	 TCFF2EvDKld5hAqfDRzW9MTGbX1nlrBg4I+6PYX9rKCQBTfWObzXrg/J31xdOhzRHOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnXw3m9d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6660606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6660606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnXw3m9d
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso3271437137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:42:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795603363; cv=none;
        d=google.com; s=arc-20260327;
        b=OQEG0TgOMT2C5R0+W7FcUlMBPn78yAz0CNkiIfNm7C/PN0hBcZO3swMU7AKrl775+E
         hVynnTRS8fKpKt+v7rafhta6drg8naxmTLnTJEo0dM/YKv/P6bL78505+ss8zgoe7Rq6
         ys22JOqRoTm9Ck/AiGGzBKkb05QVldKSUY1ClSevAGAQd05raURbPcdJHDIio7QcPkuO
         uqm/5owwoNp6qgksa9MVXFCrR4ZwqUFIhTo9a++OSrE7FBAx84AzIQYZAsCg2JP6zVkj
         odijRViyOLf2UFX+pw5YB9G1ldVMhyC9qNfRXnfjHzsuXs/b6GDStPzUvYTFY2yS+a6z
         upkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
        fh=2Xlw3t08ltv3KQUwrFv2w8yOK4Fja2jwUQ8968/eSXA=;
        b=pmLFxmz6l37JkPEudUm+BkWTtv9dWN2qLY0NLjxgnkOkiSALLafi7kny0dBJ560WNj
         X4EChBLJPaVdWWJwPST5odQrfUvAncAL39KMCS2AbrnxAfv0xuVTdMWCG8VZ5PPNfAol
         CWesgGuYjDVmI30a59reW5LnlL1fWmCZwKjWjLzgmgmWiCNMa7RBTSTfh4ZLpgQwtIbM
         8uY63PdcY+gg2/y4ahBPuYZwbq7SxNzHonIZjWN/1r7d1LIMsHuhwNdhI9jXC6PUjjeX
         HNaobZYtw+cEuIDfr3SEND2UXvkqePO/6JEQLLo9dTDowVkYeXKA6sJyyLP1i3UKsN6j
         2iWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603363; x=1796208163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
        b=DnXw3m9dleWiRRvXuQdPPMYTcl2aHpNDdv4pbjJuIGDXd43kSZCwm2q3KbnFlwS9NS
         EY938TrH2p8VGj0OJ91g8tKeDrghXE7x49Nk5Vvv3DJGYWywCPA9Hdqd9LFV4LMoEWH7
         M+mN/wKucbiUlikGRb6916jXiDKNverknlBtF3Q7WdosgGfYrxB/H1G2hvDOdEbJFkqr
         7rSmj4sghoxWCnbp6KlCvRJUfs/4xMHdCGJboAVkwQkaHEvivcXb7fJCAGF+xtMlIYq8
         q5XJMcAMhDsOI3m4Dl8Wspn4HBN6E788VLCBvovnHcEwAzSsC17WzzBwE+wiswyqWoUx
         kPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603363; x=1796208163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/a/ZG6zKgHMqLc4mvHHEORZFp2S/0ZUiRBVyNDZzcWc=;
        b=mjrGMI+mdmNSzd+2GmWzrfluBOtbcwOj5vkZzDiol9CfgNpVHbWQ+2HIwH9T5eAaRO
         gRnl3TcDKnlO3xBPkc0rYLkZaBimuSbYwq17wce94kE3i68mpsNRw/9DE4OFVzNGDl2r
         Gm7MCIEL+SZFC7mlqLp36qlrS19D9lpMP9NFUWenhjkihi+Io4w9+jfyi4hksCw7x39x
         eRWdAwf38w1NEEzTX76SiCsrKyqH00XAqzUfQuHGj8xWxwCQ52OlcMLHsXnVy8uZpR4b
         X2i7wqZfdpMGhUw6YQBhcxbzexMEgzvLhAlomU5A6gB4Hv+TltpMcSGo0jcU/6ei/utA
         L4fQ==
X-Forwarded-Encrypted: i=1; AL+hErFSq/2gDcj3Zkidfr+ozWHl8jd7CZp4zr8SCtUqQpGllZeAIBLME02gC2AJypHfwdkIs7ZDRKd+czOMckA0@vger.kernel.org
X-Gm-Message-State: APuU4Z8c4xpHIpnxzCTuD+88r5bus2RAVAe0m2rPHLpYcTG2BIsBZWF8
	e4pFDQEJexTW+qyR16UEaspH5FQkO0C26cNktu/NIKTa76D/sT2PWOjuXaB/1+4ynFSKa9g8mck
	6GlRUR3OpNoIioJ61XxjFYFpeQkF/Wg==
X-Gm-Gg: AZFdTZf+GZpV2SM6Bd0Cow40ApRooTHVyNDazSgS7rugam8Dostd4CN1nlDjhdMV9Z4
	Hs2DtMaPHfUSIsxdw5MQm+n4om+ns+Lc36etf0YJtUNPKs4XZvHhqihsah5QXd+UCoTDp80184T
	EsCAwy2vbxvGmPTYrdCuACEpmMr/hmoR1accR2Hssp20C1AUu5nEgb5PqNCcjTFcX/UHUT2FeUx
	F4cYtV9/ZRxJ0MLNY8z/hZbADefc8n1iumY/aUgFlLXJmYAmxDPwc/l7aWLQeWH0zIG1dbQv83Q
	C82/Lt70/VI105CaMB5osjIdOZ0FUrSxOZbXBpSUNsKqh3FQolwzvz03uAZffJY6Vocxm89amCy
	eOiG4MY7TDJSQbiQ+bnA1LTmad0baFJcV3ZbbjJlbVtcH6+MCKTwsOPnAXAsIQTZIDheWOw==
X-Received: by 2002:a05:6102:3593:b0:7d2:cf82:1a5f with SMTP id
 ada2fe7eead31-7d7395d2150mr8740665137.24.1795603362685; Wed, 25 Nov 2026
 02:42:42 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com> <6298b3d0-db8e-4342-9abd-4c104bac8e27@oldschoolsolutions.biz>
In-Reply-To: <6298b3d0-db8e-4342-9abd-4c104bac8e27@oldschoolsolutions.biz>
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Date: Wed, 25 Nov 2026 11:42:31 +0100
X-Gm-Features: Aa3M54roFIr0PhnlmT_bXjlKsY_WD56KJINpDz9vkucYv15wjRk7DGwl6xU0iag
Message-ID: <CAAX85RvitbgA09Qj+-LfhpKJ5p3HP-8QCDG5e4U69q_xrZ2V4A@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/msm/dp: fix DisplayPort hotplug, link training,
 and multi-lane PHY setup
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dale Whinham <daleyo@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

Thank you for backporting and testing this on X1P42100 across both
the PS186 bridge and the LTTPR dock setup.

While doing additional DPMS/connector-off and branch-adapter hotplug
testing on QCS8275 (plus addressing automated review feedback on v1), I
actually hit the same post-link-disable HPD/IRQ_HPD pulse behavior from
an active DP-to-HDMI adapter and found a few edge cases in v1's HPD and
link-maintenance patches.

I am about to send v2 against msm-next with the following updates:
- Reordered the series so the self-contained fixes (1-5) come before the
  HPD state tracking (6/7) and IRQ_HPD dispatch (7/7) patches.
- Patch 2/7: also reset link_info->use_rate_set alongside rate.
- Patch 4/7: drop the redundant msm_dp_ctrl_configure_source_params()
  call (msm-next already calls msm_dp_ctrl_config_ctrl_streams() in
  msm_dp_ctrl_link_train(), avoiding unclocked pixel_base access when no
  stream is active) and guard SEND_VIDEO with stream_clks_on.
- Patch 6/7 (was 7/7): fix a runtime PM leak in msm_dp_bridge_detect(),
  track drm_dp_read_sink_count_cap() + prev_sink_count properly, keep
  the PHY initialized for AUX/IRQ_HPD across msm_dp_display_unprepare()
  while dp->plugged remains true (balanced across system sleep), re-read
  EDID on demand in msm_dp_display_get_modes() if edid_blob_ptr was
  cleared, serialize prepare_link()/unprepare() under plugged_lock, and
  keep empty branch dongles (-ENOTCONN) plugged.
- Patch 7/7 (was 5/7): skip sink requests in
  msm_dp_ctrl_handle_sink_request() when link_clks_on is false (which
  cleanly ignores those DP_LINK_STATUS_UPDATED pulses right after DPMS
  off), and emit drm_bridge_hpd_notify() on branch
  DS_PORT_STATUS_CHANGED transitions.

(Side note on that "No sink connected" debug message you noticed: the
if/else in msm_dp_bridge_get_modes() actually has an inverted debug log
and prints "No sink connected" whenever rc > 0 modes are returned.)

Since patches 2, 4, 6, and 7 changed non-trivially, I only carried your
Tested-by tag onto the unchanged patches (1/7, 3/7, and 5/7) in v2.

Best regards,
Gianfranco

Il giorno lun 23 nov 2026 alle ore 12:03 Jens Glathe
<jens.glathe@oldschoolsolutions.biz> ha scritto:
>
> On 11/21/26 22:40, Gianfranco Mariotti wrote:
>
> > On platforms with a native DisplayPort connector using direct HPD
> > interrupts, DisplayPort initializes on cold boot, but physical cable
> > unplug and re-plug cycles leave the display blank even though link
> > training and stream enable callbacks report success.
> >
> > This series fixes the underlying PHY lane setup, DPCD link-rate caching,
> > SST training-pattern handover, link maintenance BPC restoration, and
> > HPD / runtime-PM state tracking issues:
>
> Hi Gianfranco,
>
> thanks for this series. I backported it to 7.3.y [1] and tested it on a
> Lenovo IdeaCentre Mini 01Q8X10 (X1P42100) with 50 rounds of DPMS
> off/on, first HDMI only (Parade PS186 branch), then HDMI plus a second
> display behind a Lenovo USB-C dock (40B0, DP alt mode pin D, 2 lanes
> through two LTTPRs).
>
> Before, external displays behind the HDMI bridge regularly failed to
> retrain after DPMS wake on 7.2+. With the series, every wake trained
> once at HBR2, CR/EQ passed on both links, and video came up every
> round on both outputs. No "already disabled" or PHY power_count issues.
>
> Notes on the backport:
> - 2/7 is covered in 7.3 by the link_info memset from Anthony Ruhier's
>    172c1648222e ("drm/msm/dp: recompute the link capabilities on every
>    sink read"), so I dropped it.
> - 5/7: 7.3 already routes native IRQ_HPD via 216110888698 ("drm/msm/dp:
>    Handle IRQ HPD as a sink request"), so I only carried over the
>    pm_runtime_put() change there.
> - 7/7: 7.3 lacks 1bda647ce61b ("drm/msm/dp: move link-level teardown
>    from display_disable to display_unprepare"), so the teardown still
> lives in
>    msm_dp_display_disable(); I applied the dp->plugged gating there
>    instead of in unprepare.
>
> One observation: on DPMS off, the PS186 still raises an HPD IRQ about
> 100 ms after the link is disabled, which sends a hotplug uevent per
> connector, with get_modes reporting "No sink connected". It's harmless
> here, but some debouncing may be worth adding on top later.
>
> For the series, as tested on X1P42100:
>
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> #
> x1p42100-lenovo-ideacentre-mini
>
> [1]
> https://github.com/jglathe/linux_ms_dev_kit/tree/jg/ubuntu-qcom-x1e-7.3.y
>
> Best regards,
> Jens
>
