Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064841;
	b=FjWWbJdZb4SiKh0vaTFOyylNOKI+0ppnfeQMQjkidRbJjGzUebADY+hQiSuOwnhdqrHX
	 w50X1cgUtYk0emySZtHrCTBS9fQkFme3GPAHURFFih6x20Rq0aNTWUv6+FiM15e+tWtZt
	 sFVyavY1lWXJu9coM/HHc4JcgiQ18zx45jmL4Dq/ikECdWzQUPFOLyAJeNc5qj3PkFq0+
	 OXYmQEej6/OocQi24ZvNZMkAUSpIXD96uUXf2ZmDZWRonUJn2qSwZIDciyFoiHP3cKkYh
	 davlkYahQEDfanRqVAkSiAuGBCgGg0QNX4TyrWKFAOVDh/B3Re8U/gppQxP8kRBZpkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NyHt3TXoE90H/OgpR8OuCuu32+Xh9oNMFhxW/sVa1aI=;
	b=USOO0XSbJc8yPr5TJtmRdMgUCUtJvxvwI5xOa+2JB1QnYsekEiqazVniudiKpU8re2lF
	 VPVdBVEoIHONs3LtRXq/njdwnJV8kgV6y2dad3vkUmdValsEVf1VbVESwBId/spr29/8S
	 8UHSt6ZOQ/Yw2lsYlBouIT8VLEoojCXXjGSjS1sG/AK/Hn0MY3UDqlVWTmHaQYFv7tCqC
	 Okb4OE7SflQycZ0xmQ9tcEAnn06Rt3q+DVT3hiOKBI7HdJClPK3Sw09+wmNlxLIhGN5f2
	 24GZp1MgAGWGIUM/XB8fKUfEiLsdhgDeoHWV9g4PaxKmVifXd/3XYaWdAlGcCp5C1hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeGmgB4L;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394A606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1394A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeGmgB4L
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3351936f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064839; x=1793669639; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyHt3TXoE90H/OgpR8OuCuu32+Xh9oNMFhxW/sVa1aI=;
        b=eeGmgB4L2NeNKK3FaB6ENeHiCW1XmWJRp4zyAXRGxayd9/Edm6qwP36LehDZNkd0VX
         4EwTSAs9/bYYT3113LHqjVS2ZAzyJRa5E4amKyXyCepUkEa6LoWSPnvxoReUNqvXSPF/
         8MgYwlyEXQp+oaCQzqzho8mN9wsvNPrcgue/mbHuhCPRZU2ta5LpP55tzSgMmqIRAa1g
         fCxvMvYe8Q0HqgWa930bOR07V4TWvCtB5Bv8nx8NTmQUlWZQoh5O/3WZ8v4Nxmqql3dH
         zk2An7+f1HRVpMm1ey/ro0fUyyFyuyocAiHOKdeHDvvn9KNoEVcWGyueF2E3qHze3+Yq
         1Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064839; x=1793669639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NyHt3TXoE90H/OgpR8OuCuu32+Xh9oNMFhxW/sVa1aI=;
        b=n/b8ewlxuVhQGaoATUWxdswPLxHb04fawy4K9l38jKEifbERRQAj7OrJtsMCkboC66
         Pg2usKnYG6XwVM0shI0iHRKWm/phVnhNxZEjICnYFckOWoy5v0TqXodcovWR8/SbnWuV
         W0Tlnz5JwabSKvGbycufL+dAFp3678c8WWS0M2ZqKIJhXrMzCmXIT0fHaP6zONBwF0z/
         A9s1pHU7Ypm6QfxRcyzSE9cd4yp4smihDY76y0j4FsV4hvA3tCDd6ImoUNbeSMYeMKo0
         awnrIqoY2x14iI31DLhWKCZgZEGMXntM+9NFoKoPA2oUAFkprdVdQ/ZWI9qNcf071rjo
         2LhA==
X-Forwarded-Encrypted: i=1; AKwUvBw4seN4gkY6T3VsHHmi5mS1UDKDYNgZwU9VpIGJ4jov+xwY2Gxhehz/HVXjIgUyi4mgcDzBGRxl0YlfK63a@vger.kernel.org
X-Gm-Message-State: AFq9FYLuSHkxgL1GfJ5HRssqRTfH0n8PoUEiVZH8TFxASEYdfZOErox6
	siikGkMgyO7rUUHrP36vNZc6Lvt77+pM8mL+C0r4st8p9tFUWLvYtNuXapr+SmzXpgQ=
X-Gm-Gg: AYBFou36ZkUjQzNDwPKDLu5XiSjo444OEYomBcmGgcmFlvC09snydIZ7AkdmmaX+gHN
	tgYrF6x4YCcXteYyYVX5lctwDcLDON4cVtte0A19fLxUIRg0/CCdPAG8OHh9Hsj1PNYpeAC3ftg
	YLXx/C2Mv3v3O/X5NbMwKHhwDHKSngnlOD8mR71+UEAp7Zfe7Lk63ZzLKfMM/TeehOtI0ssgq0l
	J9wbDbIqIhhC7enUbypMBWEaALizErI15X0BaSZ1xPqEsoVx5lwtDf26pA/6itaZwdWOV7TwnIe
	O8DwdlBzZJbNVzpO/z64KBcmvmSCUjaLjsjWukTfUWOOKH75Ld1f57kPTP/D7G3k1DDJ4yFNy8W
	QZKWmaJoMTXTFcShLU41ALm2jxjj6bRpxqDx/8dpRm0tpJEkV5CcpNNpogZXVOqrpcJDq+bYRKu
	vYITaEzwEfvS+gPzbzjwM4LqbKJ5BflFR1VHKdLMY3UlcIkCXJJOWHMDFkbNYNrq4fIwUnMI2gI
	GLT3jcp2cOxFfne35Yks3mfRAhi4kG++73xDTPMbxOMMegEOeiQxWpz8n2Czx4d6fxJ3xndBBpv
	J0YEV++6tRqtpd9hir3UDiHFTYW3XTOWZvp+cJSg2f2iFigd2rorqdq1rPop
X-Received: by 2002:a5d:5d10:0:b0:48d:e62f:db70 with SMTP id ffacd0b85a97d-48e3eb9c239mr15675840f8f.48.1793064839418;
        Mon, 26 Oct 2026 18:33:59 -0700 (PDT)
Received: from [127.0.0.1] (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm20423096f8f.11.2026.10.26.18.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:33:58 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
Date: Tue, 27 Oct 2026 01:33:56 +0000
Subject: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2YBDTiVUoXMY46BdOSUREkd
 29sl2/x/wXKSVihry5IfIjKOxaYuoKw+DgzylgMlmxryDrUtbMNYTpx9hLRURi8aSYKhqFEn8S
 TnL/h4/m37sOLw3ZfIOcvSvucRXIAAAA=
X-Change-ID: 20261027-sm8250-rx-gain-70cba15f0c1e
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793064837; l=3111;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=1LLIvIxKK8oazO3+DYemZYW/4j1UaYx/PuHcc1wucB4=;
 b=Jdj5CJDZr6qT3qrVO0vPcHohB+X1JYMKCoNgczdlB1NftI/RM3iaAbV3iYAShsByLd6snJ+r8
 hGBduKrYqrkD8etX+SH7jSYXdRoRY08CXrckUZLRC3WNHYWybA8mPhV
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=

The RX macro interpolator gains ("RX_RXn Digital Volume") run from
-84 dB to +40 dB. PipeWire and PulseAudio map full volume to the top of
a hardware control's range, so a UCM device that uses one of them as
its volume control plays 40 dB hot at 100% and clips.

Set a platform limit of 84 (0 dB) on the RX0, RX1 and RX2 interpolator
gains when the RX codec DMA link is initialised, the way the sc8280xp
and x1e80100 machine drivers limit their WSA gains. 0 dB is the default
of these controls and the value alsa-ucm-conf's rx-macro init sets, so
existing configurations are unaffected. A control that does not exist
on a board is skipped.

Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this caps the RX macro's digital gains at 0 dB in the sm8250 machine
driver. I need it on a Motorola Moto G 5G Plus (SM7250), which I'm
bringing up on mainline: its UCM profile uses "RX_RX0 Digital Volume"
as the earpiece volume, so that the volume keys change a hardware gain
that also applies to the voice downlink, and without the cap 100% in
PipeWire was +40 dB and clipped badly.

This touches every board that uses this machine driver. As far as I can
see in alsa-ucm-conf, nothing sets these gains above 0 dB (rx-macro's
init.conf sets RX0 and RX1 to 84), so the only change for them is that
the controls no longer offer positive gain. If anyone relies on boosting
the headphone path digitally, a per-board limit would be the
alternative, and I'm happy to rework it that way.

Tested on the phone on top of next-20261021: the earpiece volume follows
the volume keys from silent to a clean 100%, in media playback and in
calls. The patch is on top of broonie/for-next (f3c7bee984aa) and builds
with W=1 for arm64.

I wrote this patch and drafted this note with the help of an AI coding
assistant (Claude Code). The testing above is on the phone.

Thanks,
Filippo
---
 sound/soc/qcom/sm8250.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 5866f1f34b3d..d776a17f1fd3 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -39,6 +39,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 	case USB_RX:
 		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
 						       &data->usb_offload_jack_setup);
+	case RX_CODEC_DMA_RX_0:
+		/*
+		 * The RX macro digital gain goes up to +40 dB. Userspace that
+		 * maps full volume to the top of the range (PipeWire, PulseAudio)
+		 * would clip there, so stop the interpolator gains at 0 dB.
+		 */
+		snd_soc_limit_volume(rtd->card, "RX_RX0 Digital Volume", 84);
+		snd_soc_limit_volume(rtd->card, "RX_RX1 Digital Volume", 84);
+		snd_soc_limit_volume(rtd->card, "RX_RX2 Digital Volume", 84);
+		fallthrough;
 	default:
 		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 	}

---
base-commit: f3c7bee984aa0ba2b48a44e16a6f3ec2c27f851e
change-id: 20261027-sm8250-rx-gain-70cba15f0c1e

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>

