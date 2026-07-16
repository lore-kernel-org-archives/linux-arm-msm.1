Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DB3CCFB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189606; cv=none; b=p89RMHf/bNrygwDSle64KikrYR4EM0I8kEhaD7fk2Q5J4QfAJ55oZA8OQ65jXIl8SXRTmmvOciYe558EJvp+GPK2GpEFQ/nAmHCHo5PSWkoHx5+fz/PnjgpFSgs4AKIuF+5loEGaLKUQthFXR1XzleP2AnD6BJ+HpEMi3b5IbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189606; c=relaxed/simple;
	bh=BHGXzZt1d8W8ecIZ1QwyHNFQkiYMz+073p25eXAQcz8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=fIK30pv/W8QEfZqP9ESaKdYM7tMhd7whhylCJBoAXqOeDVMVgdkN7d9Y74aAEcWK+cq5qMgeFDtkXwkl6EuDKpdAcMcko/DWSEl03nKV4O+6Zv6YrXC1L6YuP/pOO+y/n5pCMC2MuUIVDpCIwgMEW8GW6CfM6cJ0gAET/3yrMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GiCIbKKf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GiCIbKKf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15d111ca99so625331866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784189602; x=1784794402; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeCiWXObqZMn+CXaMwaIUj0LKi01F1mPNxBE7Xp9sFM=;
        b=GiCIbKKfH1g/0PW3SwLqwBJftZrRKlH/J+yXbaV5gbzNkIHdJK+Fpx/Ty0keVU5IJy
         W4lgrg6qw9wv08GZoCakp/pRhvfKVdyWjyrYClrx6UAo9QhPwdAlgSN95sPWv1bhF1Qb
         lmKalNUi4vJY20bGREFx44Wgkj3UDu4fW562LvAzS15TDSBH0Bw4Uq+Gme0iBnyi6lVo
         yaMe8bexFwHJD3xR5bnnQ4uX3IICh/TeVDDo5IM7tx6GTnA8CrwPRSUldeJlxMHMwd3X
         tcJZg93Ueq5JQ3UFms48G3sKp7m1QX66ZwE6ATo8UbBcHiKYGhp2AzLILeDSaYDQFHbl
         dsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189602; x=1784794402;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeCiWXObqZMn+CXaMwaIUj0LKi01F1mPNxBE7Xp9sFM=;
        b=ZpNjRktTi+5OhoSAn0S3+2jhj1soW5RlkXOZk0mwSRZ24kntjHIUlkXd1ioaxWKCyl
         Zrp3wooceeamlf5gkaWdm4o2OMkprLiJBQ7YeUqGGJ0Y6NCvDgxJFR6jdlHaN4DK6KxE
         ER839wpDkKqVlLCeY6e22h8FtEdTC9J2O65/CgCmV5DFnBz4hkalGCHxNtgPi81VR94V
         88EpM3hRqRdb1WPkYoWtbgghDGiexdihgMoPq5zkME+tePjmUEpQK1d3zsFs0rDEGotI
         s5pEJwx74Sio2F/+2u1//brOgJhsVFOojCJLi6HWw9cfBOiqidU3OQTdGpmsGsRPkJYZ
         Ae5Q==
X-Forwarded-Encrypted: i=1; AHgh+RopyasMyHmOkGLSVIIn444sMGXmRYbUd4FU3So8SG5uOhp1DleFjuxhYX9stwfsCWz11II8wYyh8opz5f7C@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVOf91QzolH9+nggsYEBiyRrq4/NNbMGJO72qsVSj+hqYz+th
	gSeOYV5Q9/zmoIgTWAkfUmt5w8JLapDZXxDiWiQbZowarn8Ar2ZE1tFzSrnnXT1h12A=
X-Gm-Gg: AfdE7cl7bQqHzxlSTbrqY9I/jjGdmima1oIG07s2Luc6ErbpjGhX3j+sg6alUPnUp/Q
	k+1edLUqatE1YGMbv6opsPmaCHddlT4QsSnNiQUGr+goo/5Y2V12BGKA1pNgZgWbpUmqPcaSuQ+
	Ec7lxx4L9dVm9c1i5107qmjRo689+LmQEhJCmnHcwiIyrrI7ouarC6aAmDrcj6mVGD+SKeP0k3v
	fbzpcdHqoqew0cTanNZvhUNuloHDd2VncHNav7/Ye6IywjR1se6lgyM5XHRTHOpEtdSBPnS6wTR
	P7FnITFfm9xO4AWtte8avPz1aR+uCw5ON0a43Jt8Zvge3+59EbkAEndrU7/QYfEKaXxSKdPk8S2
	YaKtmp3+HYYaW9CRijrWAj+1l8Gr2sBoCHNEcSrda1W5WmbwVKKNtjbzfwFaKz8P1wD+JY58VzI
	ldNrxL9xc3IpaqIQw5zVebXSV8hzlBanEpUu/i/m/3AIyVbxU=
X-Received: by 2002:a17:906:ef0c:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c167921baa3mr388583566b.6.1784189601892;
        Thu, 16 Jul 2026 01:13:21 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm156110066b.17.2026.07.16.01.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:13:21 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 10:13:21 +0200
Message-Id: <DJZUFFHFXZBK.3S5A9OPE7XYEZ@fairphone.com>
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>, "Mark Brown"
 <broonie@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Mohammad Rafi Shaik"
 <mohammad.rafi.shaik@oss.qualcomm.com>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: add the Qualcomm WCD9378 audio codec
From: "Luca Weiss" <luca.weiss@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>

Hi Jorijn,

On Mon Jul 6, 2026 at 9:22 PM CEST, Jorijn van der Graaf wrote:
> This series adds bindings and a codec driver for the Qualcomm WCD9378,
> found on SM7635 boards such as the Fairphone 6. The chip pairs a
> WCD937x-compatible analog core with SDCA-style function blocks whose
> built-in sequencers handle the analog power-up/down; all control
> registers, analog core included, sit in a 32-bit paged SDCA control
> address space behind the TX SoundWire slave.
>
> The driver implements the TX/capture paths (three ADCs fed from four
> analog microphone inputs, three mic bias supplies) and is modeled on
> wcd937x, reusing the wcd-common helpers. RX/playback, MBHC and the
> SmartAMP function are follow-up work. Register sequences come from the
> GPL downstream wcd9378 driver in Qualcomm's audio-kernel-ar tree; the
> chip has no public datasheet.
>
> One dependency outside this series: the paged register map needs the
> Qualcomm SoundWire controller to implement SCP address paging, posted
> separately to the soundwire tree as
> "soundwire: qcom: add SCP address paging support". Without it the
> codec enumerates but every paged register access silently reads zero.
> There is no compile-time dependency, so the two can go through their
> respective trees in any order; capture just needs both to land.
>
> Patch 1 moves the qcom,micbias4-microvolt requirement out of
> qcom,wcd93xx-common.yaml into the codecs that have four mic bias
> supplies, so the three-bias WCD9378 binding in patch 2 can reference
> the common schema. Patch 3 is the driver itself.
>
> Tested on the Fairphone 6 (SM7635): handset mic capture through the
> LPASS TX macro at 48 kHz across reboots, including UCM-driven use by
> PipeWire in a Plasma Mobile session. The board DTS follows once these
> bindings are accepted.

Many thanks for all your work on the Fairphone (Gen. 6)!

If possible, can you share also dts patches with me, so I can try out
your patches, and provide at least Tested-by?

Also for audio, UCM and AudioReach topology if it differs from
https://github.com/z3ntu/audioreach-topology/commits/fp6/ or what you've
used to test the changes.

So for NFC, speaker, microphone and magnetometer would be great.

A git branch with your changes also works of course if you have that
pushed somewhere.

Regards
Luca

>
> Jorijn van der Graaf (3):
>   ASoC: dt-bindings: qcom,wcd93xx-common: don't require micbias4
>   ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
>   ASoC: codecs: wcd9378: add TX/capture codec driver
>
>  .../bindings/sound/qcom,wcd9378-codec.yaml    |   76 +
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      |  122 ++
>  .../bindings/sound/qcom,wcd937x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd938x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd939x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd93xx-common.yaml   |    1 -
>  sound/soc/codecs/Kconfig                      |   19 +
>  sound/soc/codecs/Makefile                     |    7 +
>  sound/soc/codecs/wcd9378-sdw.c                |  495 ++++++
>  sound/soc/codecs/wcd9378.c                    | 1382 +++++++++++++++++
>  sound/soc/codecs/wcd9378.h                    |  246 +++
>  11 files changed, 2350 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-=
codec.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-=
sdw.yaml
>  create mode 100644 sound/soc/codecs/wcd9378-sdw.c
>  create mode 100644 sound/soc/codecs/wcd9378.c
>  create mode 100644 sound/soc/codecs/wcd9378.h

