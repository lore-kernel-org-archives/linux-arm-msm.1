Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25E92BEC52
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785104456; cv=none; b=JAOeZpDbbrkiPDDwq++Gzu945U8fp8GSFGqCJ71qPr4Bj9TY+CR0TxHvSJ3K/SdUu8qWeI5ApJWh9Qm+hmvkVgoCtx49pL9iJMMU7Kc3kVJ5sda7ItVeV+rjvrNMEwpG/qShNUywJZ2HfYAJ1JybdF+izRynNRcJ4kI8NSZLNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785104456; c=relaxed/simple;
	bh=R8j6eBV+UdD1g7eXVCfMDbakYZoNCDVSJKVtPfAu39c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9LlDuAd3gc+29HeZ743o1avl9yw+jMyTInp264F2ehlLhzxQ1OTU/KQzGb1t/qNPaBYPdoxANZJRdoXQkqxTLWqYTkiqlpmObHaGOvrccsXFu/MLN05SK74OPjBP/KC5FNEaC9xx6fjBwXJHCGhNP3PL1HXEjCXdiqXFj4B9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nFVezLuC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nFVezLuC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so524720266b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785104453; x=1785709253; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Havq3+W8NHvvrT9IGeQuks/YcxvMGuQejowI96vAV+8=;
        b=nFVezLuCIKj6Q4Vbp/zgnE8ytUkWteW3RINKX5ynDpd0s6h50GqsJiMhtly3ni82YH
         mi4j1fJjFQAK7DgZmX5uOkX1AACJ6LbBJW5pYdZ+yFGZYPbTWzVlDNM9tg4ZQTOMOBdr
         e95vEOKy5ho5vCUqbYTIU9WPh5kx1ta4GNYME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104453; x=1785709253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Havq3+W8NHvvrT9IGeQuks/YcxvMGuQejowI96vAV+8=;
        b=PfdrMndSffHQIiAj/YZULtYXFGpGjW0CPxfB78a+1m1ls63cgnKS9TJZPN17XYFcCg
         /3LXxzWNVndxsNNqzJ1vy3lL2+EiDtWFzYCfh2jjiZ4IibV1l/VS2o1WEV1VTw4Qb8f8
         U5tts+qKfEptCOiAfeSJSUqDlec36vQFKS1f61C6spyMdFnfXMEBpNAVJIUuA2qOjgco
         S+goaoz4dxrX0rtvnpzLRqKeY+J/iT0fQNI8xyiztPPHQd4QfXtApAYApfLjtEuQSJHq
         vqYPVMcgZMWqfE1N8yZkVxSaB2zL9NSlev9b1wxnF2sVzkhcOoLmY0Of+JUB8f4ztu6P
         VUgw==
X-Forwarded-Encrypted: i=1; AHgh+RrBlmiuVXLzUuA1FyV5i8wgnigga+e78M+oC65juT2vrThSEsR0Xeea6dJL9xjKqwGCWcD3Kwly9a0ZSGsi@vger.kernel.org
X-Gm-Message-State: AOJu0YxOv51Bs1UiImGsRqt0Cqf283FUGWmEapRHqrUMjFVEJWxCq+7i
	EkMeR512anqpyrek7Q0VHRhTtjvVRee98LTvUF9Mk0Ibr3965pK7Bl90ORZFwZNGVusRzA9UY/c
	eUmtyaw==
X-Gm-Gg: AR+sD11ou0ABXjRTTUQDCHMOFNDXVVwebSU/bLmV2XRFiPGYAdVu3Taf84UTNedKwB6
	zqP1mcq6Bx7m3EiZmEJitMAz5dK5RH+LDTtCTvT4+U9GFF+yaN/BV5y0+M6EaaDMMT9JGyfN61H
	llEi44ubHnYDzgJg1jCTJ50sOUGnL2cJ3ymAckcVQ4vMcMcEDITivY2soE9grG9L/M5DY99IcoX
	f/Pksw7DrMT4nG7P9UWBi9840/UC9fgEyKU0Nbf2mmpZdhKB9rRxq6MmZL0yZvhaqDDiYL6ab8r
	vmgcsK3VkpARM5IjMauKMhK1RZqKomtAGfXP6j+mxrDwPAexrNiQrQVqOFxcGogBRriwHzpVS8R
	W5PuK3K0P2I+I4eEoz1Gbu4/kXR+KPIvcOUUQBTk9QilYvAFHBrYqHxSkKVlBYQcPJnAiPSiHjQ
	eVzflakR8AsVqij3ECQeoSiJkPmbwjYRfm89hjmoc=
X-Received: by 2002:a17:907:846:b0:c12:cb91:58aa with SMTP id a640c23a62f3a-c1f1fddb140mr287426966b.24.1785104452650;
        Sun, 26 Jul 2026 15:20:52 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78260sm557572566b.6.2026.07.26.15.20.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:20:52 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1600d040e4so292352866b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 15:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RptvS7DhMcBwz4PVpwmVhKMO0spI0IlJzrx5rvlnDBKbhRevS7hlvfyb8jhmJE7rOHBTjOrS+wvdJtoOLGB@vger.kernel.org
X-Received: by 2002:a17:907:6d02:b0:c12:6280:33c9 with SMTP id
 a640c23a62f3a-c1f1fe12aadmr259561466b.28.1785104147414; Sun, 26 Jul 2026
 15:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org> <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
In-Reply-To: <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 Jul 2026 00:15:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>
X-Gm-Features: AUfX_myD67rv6_r1pKzI_bPb2NSRPK4fvnxMW17kw_fG6idlmXoKI8O_nXVfpxA
Message-ID: <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
To: Faizel K B <faizel.kb@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Sultan Alsawaf <sultan@kerneltoast.com>, 
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Abylay Ospan <aospan@amazon.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Faizel

I was not on cc on
https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/
so I was unaware of that proposal

I agree, something like this looks cleaner and removes the sanity check.

My patch has already landed in media-committers/next so you need to
send a patch on top of it.

Regards!




 diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c
b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 83dcc9d61ee0..7cb544fdfddb 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -97,18 +97,14 @@ static void vimc_sensor_update_frame_timing(struct
v4l2_subdev *sd,
 {
        struct vimc_sensor_device *vsensor =
                container_of(sd, struct vimc_sensor_device, sd);
-       u64 pixel_rate = vsensor->pixel_rate->val;
+       u32 pixel_rate = vsensor->pixel_rate->val;
        u32 hts = width + vsensor->hblank->val;
        u32 vts = height + vsensor->vblank->val;
        u64 total_pixels = (u64)hts * vts;
        u64 frame_interval_ns;

-       /* Sanity check, pixel rate is fixed and fits in 32 bits. */
-       if (WARN_ON(pixel_rate >= 0x100000000))
-               return;
-
        frame_interval_ns = total_pixels * NSEC_PER_SEC;
-       do_div(frame_interval_ns, (u32)pixel_rate);
+       do_div(frame_interval_ns, pixel_rate);
        vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
        if (vsensor->hw.fps_jiffies == 0)
                vsensor->hw.fps_jiffies = 1;

On Sat, 25 Jul 2026 at 06:23, Faizel K B <faizel.kb@gmail.com> wrote:
>
> On Mon, Jun 29, 2026 at 11:30:45AM +0000, Ricardo Ribalda wrote:
> >pixel_rate is set to VIMC_PIXEL_RATE_FIXED, which the code expects to
> >fit in 32 bits. Make that constraint into a WARN_ON, so if we ever break
> >that constraint a kernel warning will be triggered.
> >
> >It also fixes the following cocci warning:
> >./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >
> >Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >---
> > drivers/media/test-drivers/vimc/vimc-sensor.c | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> >index d125a79fec8c..83dcc9d61ee0 100644
> >--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> >+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> >@@ -103,8 +103,12 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
> >       u64 total_pixels = (u64)hts * vts;
> >       u64 frame_interval_ns;
> >
> >+      /* Sanity check, pixel rate is fixed and fits in 32 bits. */
> >+      if (WARN_ON(pixel_rate >= 0x100000000))
> >+              return;
> >+
> >       frame_interval_ns = total_pixels * NSEC_PER_SEC;
> >-      do_div(frame_interval_ns, pixel_rate);
> >+      do_div(frame_interval_ns, (u32)pixel_rate);
>
> There was an error in the data type of pixel_rate. Actually it is u32 instead
> of u64. There are two changes suggested by Geert in reply to the original
> report. v4l2_ctrl.val is s32, not u64 and using mul_u32_u32() for total_pixels
> calculation. We can avoid the sanity check also. Would you be able to consider
> these two changes which avoid the warning?
>
> -       u64 pixel_rate = vsensor->pixel_rate->val;
> +       u32 pixel_rate = vsensor->pixel_rate->val;
>          u32 hts = width + vsensor->hblank->val;
>          u32 vts = height + vsensor->vblank->val;
> -       u64 total_pixels = (u64)hts * vts;
> +       u64 total_pixels = mul_u32_u32(hts, vts);
>          u64 frame_interval_ns;
>
> Link for the suggested changes
> https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/
>
>
>


-- 
Ricardo Ribalda
