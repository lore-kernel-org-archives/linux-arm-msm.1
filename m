Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431832;
	b=uC/dvXwjgeKNfUfr8AjFiCxZ1msjtCZeC2nrRIYy1Pn9DHEukZxCgStUGGNKWsjrfDBI
	 lEZR0xwxa8SHLtT3p4gX+fEibX34O5i8RQ3PUcb3DHf+zPPfTDxrdP1oO63lw6TzlFM8O
	 9cxW+mt5kw5/eiArAEyx2I1F81e1W9RXJXwnfnBU5I/cuog2h2QMYBi77rgSrOqhUpjgR
	 if6w7cN2+XjeN1+T8a6WFSLkoLQKcF/zPmTjYHq00O8P99I1gcrlwhSA6yzNWTTBEU/89
	 N3hkn0IvhxfrILkws2x7tYy9jT1zrtR8JBaQzIkVbI8fKOIyN95r0sZwqRcD0P+wRoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431832;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=Hk6rTRz6/QNazFIRGMhV7PaLo3a5ytEMm3RVpwQoqok=;
	b=Vn+riANrzdaOAYKRadh9lAZAm5TUm33c7D8jGPhsJ6b8os1N90sb7b58qv7Sgnv0jce3
	 jqdnlCUfLys710NuXw+hJlkBHXzqGAso5TyQa9ih47XiL1UMMK1M2Fn4ZrJvhvho6hjO3
	 OPbuZUFyJp+4lkGlTXtY4Iy+2geyqLZEIRS9ZcMZrsAA7Yx6JdkKva26XCkhu2zh+ZxL4
	 9c4Jm9vhcbQEETi3NkbMh5Ti9ShlqcPwDfL2g7vAWG4Mtky34DFP6NpGKbJ3ynwcLDaSP
	 0E9gsoAQ8AhMZSE/WdXftm+yQwayGyYuN2Zn2Fx7FaLtY2XCEztfraVgiyWoz53QyFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oldschoolsolutions.biz;
	spf=pass smtp.mailfrom=oldschoolsolutions.biz;
	dkim=pass header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.a=rsa-sha256 header.s=s1-ionos header.b=Pw3Ey0tn;
	arc=none smtp.remote-ip=212.227.126.187
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A9606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5A9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.a=rsa-sha256 header.s=s1-ionos header.b=Pw3Ey0tn
DKIM2-Signature:  i=1; m=1; t=1795431823;
 mf=PGplbnMuZ2xhdGhlQG9sZHNjaG9vbHNvbHV0aW9ucy5iaXo+;
 rt=PGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnPg==;
 d=oldschoolsolutions.biz;
 s=s1-ionos:rsa-sha256:puZLopWvXSyZYN8OcZGW66EjIId7
   Kax0CC67OzxVUZDo9NxSW+DR9nIXPx7WVyAtvT0cuP2Hva1IMR5bUOccvISnUsNYApOB+OiuYtd
   1TpPe2lXRXXlAaOLY/MOfEZJCuCF9XFegk36eLkRk7Btc7PxzXDuTYlWmXwbafgYOlP89vp0sV4
   34wMpvovRxAS0npVqUusSLcY59l/Z4kTI8S7SUIPLJ6ohw/g6aUch5eNuuD9KGffJkNYvFJKbrh
   90XZAzEkWUl8dwxsOVS6XipI36x/QKfyRm6UAEBzU5Y1gv0QmId80x2pCPRdoCBTXBBEXQcMmHf
   aAyGR6ITQF923w==;
Message-Instance:  m=1;
 h=sha256:
   lqNPRz6NeQZHbjKq6rg5bpdcpbAy6mQOWMisYwDH5qQ=:
   Hk6rTRz6/QNazFIRGMhV7PaLo3a5ytEMm3RVpwQoqok=,
  sha512:
   aZoLGV/X4KFS+geZSXtlouKnUe7sIOZB+kzVe4M/DwCK5E80JIfcSyvJABveQIoxHcM1Mq8Aw8MjxVr8WE5Hog==:
   qBxQPoOSL+IvUaNDS7i5l2FOqPVzP8d2UqJF7c/VI6FUMZfRKmh9yipoiiY5VEuBczH6usGgCieXByTKjz45YQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1795431778; x=1796036578;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Hk6rTRz6/QNazFIRGMhV7PaLo3a5ytEMm3RVpwQoqok=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Pw3Ey0tnEjoPomYjr4IqYFc4/i1pOH8V7opyhZ32oXe6rIpGngU3o7qmBLrNLiqP
	 fujzeX4mS21d9BRxMJNvd7hgdKB9pMhgiZ4wyFUKGIMSF0xNH03NiqGypQaPLDVdH
	 GoO+cfIi6RxCFvbl+bjV9jDRln28TGe6Zid2b4neVU1P+LnVMA9SG7YPEoW+1FG8i
	 Lll1Lz/yJ6diBvHoqW9nEC9XTVpbb7+jqML5Krpf1TGR1n3RS1cw0BR96Ftk1B0QY
	 BrBd8eFVsQihJG1IU3NnK0ysPW9fybEFjxQkr1xu1coVUYDmKWQP6k9mvr7wxnUGv
	 r0RLJu+gbY6kOFTOhQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MF3Y8-1xkr5l34oa-00CMz5; Mon, 23
 Nov 2026 12:02:57 +0100
Message-ID: <6298b3d0-db8e-4342-9abd-4c104bac8e27@oldschoolsolutions.biz>
Date: Mon, 23 Nov 2026 12:02:55 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dp: fix DisplayPort hotplug, link training,
 and multi-lane PHY setup
To: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dale Whinham <daleyo@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9NpQ9UOLW0+S3urrZosyOPkiAsn7T16Tq8t28v3DxpnaZnKc1AY
 VEqpfwb+U/gubW7i65oR9kA2JYLGCOyM8MptoAB0gj9V/jPf6jguLNrIZMjP3WNPXgrgDtF
 i8RiS+2mNPam+z4Oxcdt/+cYqo7UIaYplPTMFJ2riMQf0dIJrUJsFE9MvX4kQtYv0L6xYpT
 b0OuDCzQ64OKFCQhNR0CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jVxgy0I/4IY=;lxRoizUlv6JcYxOH4mx2X4fddCB
 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
 YafQTso6I/fg==

On 11/21/26 22:40, Gianfranco Mariotti wrote:

> On platforms with a native DisplayPort connector using direct HPD
> interrupts, DisplayPort initializes on cold boot, but physical cable
> unplug and re-plug cycles leave the display blank even though link
> training and stream enable callbacks report success.
>
> This series fixes the underlying PHY lane setup, DPCD link-rate caching,
> SST training-pattern handover, link maintenance BPC restoration, and
> HPD / runtime-PM state tracking issues:

Hi Gianfranco,

thanks for this series. I backported it to 7.3.y [1] and tested it on a
Lenovo IdeaCentre Mini 01Q8X10 (X1P42100) with 50 rounds of DPMS
off/on, first HDMI only (Parade PS186 branch), then HDMI plus a second
display behind a Lenovo USB-C dock (40B0, DP alt mode pin D, 2 lanes
through two LTTPRs).

Before, external displays behind the HDMI bridge regularly failed to
retrain after DPMS wake on 7.2+. With the series, every wake trained
once at HBR2, CR/EQ passed on both links, and video came up every
round on both outputs. No "already disabled" or PHY power_count issues.

Notes on the backport:
- 2/7 is covered in 7.3 by the link_info memset from Anthony Ruhier's
 =C2=A0 172c1648222e ("drm/msm/dp: recompute the link capabilities on ever=
y
 =C2=A0 sink read"), so I dropped it.
- 5/7: 7.3 already routes native IRQ_HPD via 216110888698 ("drm/msm/dp:
 =C2=A0 Handle IRQ HPD as a sink request"), so I only carried over the
 =C2=A0 pm_runtime_put() change there.
- 7/7: 7.3 lacks 1bda647ce61b ("drm/msm/dp: move link-level teardown
 =C2=A0 from display_disable to display_unprepare"), so the teardown still=
=20
lives in
 =C2=A0 msm_dp_display_disable(); I applied the dp->plugged gating there
 =C2=A0 instead of in unprepare.

One observation: on DPMS off, the PS186 still raises an HPD IRQ about
100 ms after the link is disabled, which sends a hotplug uevent per
connector, with get_modes reporting "No sink connected". It's harmless
here, but some debouncing may be worth adding on top later.

For the series, as tested on X1P42100:

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> #=20
x1p42100-lenovo-ideacentre-mini

[1]=20
https://github.com/jglathe/linux_ms_dev_kit/tree/jg/ubuntu-qcom-x1e-7.3.y

Best regards,
Jens

