Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932926;
	b=OXb0WLkEm0aohbUGdSzZOQd79iIrHitfUSlFQX0i3o+0x8Pnhua8610n9gqHW8lcaW4N
	 d37/Oy6uMPW9RW9ROqJKfF2RCsTowqOjxc9Mx3k4lyKJdHPTUyfrYUDYl8lCv1wVogjDF
	 m/G7nKZojdnUpUF7jh2g4QtZ/56M6R4Mh6hJs04bxr1Xpmn546XznO6H6IO5QNwA3waRN
	 HzARrYqzvGf9vOxQ1EvURrMoFOING9YG38T8gbsdEbEjxIPKQAknFz2nUtG7inNO9afmS
	 wailbLud9ZAkegbdyvfYFVBWkhBlZ/V8W7lwoPWL9FA69KMANynYAoMjsLYteYY3YyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932926;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
	b=wmbd+HwSfG73I7hTTXCD1XM6KJAdnDgkaqe1opBWiuod9MY7fSDjUbvWIofIspbCchoQ
	 qRE8I2O3mFa6fIrB+ezNvJ81Qe1dtzSxDL1nAZfyZTy2X34PJpkEYsMajWTW6iH1u9sbi
	 x0qYXLxWFJgchOsOeEhOxRGQZH3Vjbw1CqjMTizwghCitGHX07xvdpwivB1v0UT7QIwXg
	 bA/6Q6zNLwnGzKUJXkLYW95cbvk7iJ3Nz9TLc8VsDOudAM5uuAw+/UjhxgS3U4hLLGk2t
	 JXUzHvXGsUFf28/0J6Pxl5ar5jVqN80Kpyvz84hYCzWfpCeE2Ia47PcCzaYgfwaGUTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE1606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 02:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DE1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bffd1e177fso153000e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 18:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932924; x=1794537724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
        b=qhyu4ftfKUZ7kGAKdPEkK/150HN71nlJW0H2DcEN8smM+iL3ir+y1mcUpE8Atdzb/1
         4kpp6jZ7DwtM4AkZCO1kJPAk4d8wlq/Gi8Azl933vgHO884DkvYgPYvl4H9134sAhH/9
         ePs66CbaINp7bt7gYmUWgGu2TIP6O6TnxC7nCJZuSJWmUruG5vxL4/FBMHe2DPLqX691
         R/gtVwtR/vucyJtwvmxrslE2eCLykgQGG63/vHcd9pQknF+J7AroYPhhIhLpkmKCkHL4
         sYzh7sTn0oZVwPxZwsCV9SS2W7VimGFxZPc/nQE41FgbsLjBSrTaaQPeWKsSP1y+074f
         u5qw==
X-Forwarded-Encrypted: i=1; AKwUvBwDubrBhDcJJl0iv8YaHg3gpqcr8xzG8nE1GY7MozRFEzAoIQxUyrNUrHrfmHr/gAJFOwxoJOdurPdNkGAr@vger.kernel.org
X-Gm-Message-State: APuU4Z+bG3dgCnQ9/ZsTbiwE05tzpJzuxRGxhTZmTwzelgdhEfqQfSsT
	KO8Nm+6yNvu+xJd6g0iAzDrkn1TCgZALKH8QC32ahWy4kYNHex8wMVui8Tg0l6h9Wz6zJQ==
X-Gm-Gg: AYBFou1BPCADXjTKJ+8ui7Hp+ZbLfpN1dHyf769eNzoLYlh0OLhe8NrRKescGcuX6EC
	5iiLKmpYZXiXZTtjj5h5NQTxHCk9biltZnvzjWIOBNx9/Te18RUYZVfVuUFD+gYAP0500QTwjZd
	nxDlLHomf0Z7AfUqGiy1VpR75cToQ73e0dHzHHRf5Mfb9vFJt0z2gKUf1+YvMfJut5Pg0ieWIX4
	cnwZk1vvorVZfabCwIZVD6qPojzNtnEOWr7Af7NHJ0d9ExZiSthDVudK8rBcCrbp6Q8ft9L+0Ae
	7lSz6vkXjxBjCncooOonUsYwIqweNgPrxWdFpW/hEKkB8XosuzkSL5N0L6oJIJNUR9WGeIDkAE9
	GHMnysNAmommssdUjckLLc91m+oPWfaskkQXywOjMRak8xNpBzBN85eXmXJiCqNUH37Nky6agxl
	0YB5T9v2CnrHW2W7b9BpBcyvNFfn2QsyHzZSgNZJUXNH3U3PKedACqjjorDOH5bjRYPRKvfZrZj
	mkp0854SW/HXXK5AT+DNCifTkJvCxj8zIqlDKBEO/1o1TzOL3ddIgS4JUWP6Tc5by/wnQYZIrOj
	IAiUdhuZM2uk1/CIeKcJ0Ln2uB5hpoUXyV0JVYdl8m7sLtdSdidR22mLESFcFslSfKt2UZ8=
X-Received: by 2002:a05:6512:3402:b0:5c0:160:6dae with SMTP id 2adb3069b0e04-5c003adf202mr242040e87.24.1793932923778;
        Thu, 05 Nov 2026 18:42:03 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002c82bdesm144781e87.0.2026.11.05.18.42.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:42:02 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab53a99771so224051fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 18:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw1ElycygNQbyHe8wxH4GAYudr84ecBkq152/bVDJinKaNtHvMoPZD1mxTEfzu5787tmdCaOqNF1jyDORiB@vger.kernel.org
X-Received: by 2002:a2e:a80b:0:b0:3a9:db75:823b with SMTP id
 38308e7fff4ca-3acf3b2b509mr2161401fa.17.1793932922440; Thu, 05 Nov 2026
 18:42:02 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
In-Reply-To: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 23:41:35 -0300
X-Gmail-Original-Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
X-Gm-Features: AclHuK9yR1l3Ka6EneLFe1X-dNaa_gcGDfVBlZZtGQ6nC7Dgsgyzy5WyWv0PGgw
Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for checking the 1.1 sequence and confirming that the upstream
one is fine. I've fixed the ordering of CAMSS_8150 in the switch
statements for v2

Regarding Sashiko's note about the VFE-lite clocks: I confirmed it on
hardware. Routing the IMX363 through CSIPHY3 and CSID-lite1 to
VFE-lite1, the stream produces no frames and the clock stays at
19.2 MHz without the extra match. With the match, the same path
streams 10 frames and cam_cc_ife_lite_1_clk goes to 320 MHz. The normal
VFE0 path is unaffected.

I fixed it by making the driver also match the vfe_lite0/vfe_lite1
clock names. Since the same problem affects sc7280 and sc8280xp, should
I create a new patchset exclusively for this fix or include it on v2?

I can send the small media-ctl/v4l2-ctl script I used if it is useful.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:44=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
>
> That's odd. sm8150 and sm8250 are proximate both seven nanometers
> sc8280xp is five nanometers.
>
> PHYs are about converting the analog to the digital domain and so
> process geometery - ends up making a difference.
>
> You can get the PHY init sequences here:
>
> drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_core.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_soc.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_dev.h
> =E2=94=94=E2=94=80=E2=94=80 include/
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_0_hwreg.h    sdm845
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_1_hwreg.h    sm8150
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_2_hwreg.h    sm7150
>      =E2=94=94=E2=94=80=E2=94=80 cam_csiphy_1_2_1_hwreg.h  kona/sm8250
>
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kerne=
l/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiph=
y/include/cam_csiphy_1_1_hwreg.h?ref_type=3Dtags
>
> So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.
>
> Hmm so much for my understanding of how dependant on process node these
> sequences really are.. perhaps the PHYs area fully synthesizable in RTL,
> probably.
>
> Anyway.
>
> The one thing to do here is to please _verify_ what's upstream now
> against the tag provided there.
>
> If there is a divergence then we need to upstream a 8150 compliant versio=
n.
>
> ...
>
> Actually its fine, did the verification for you, the 1.1 init sequence
> as is upstream is fine.
>
> Just please tidy up the ordering of the 8150 switches.
>
> ---
> bod
>
