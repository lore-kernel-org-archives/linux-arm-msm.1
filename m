Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564597;
	b=VyKilXUQwG9pCtVkmcjDqAJLtsb6hh37vNdGTmvaljrIx3VQXDw1w0vTtYfEJvfe5UXJ
	 PO1oNHOWvs7r5CbUIggHPJM8x9pM1rOHCONfmx+ZRS7C8FvOiH8ghtkKNvwoN0pHxtQ0W
	 jku4RlruCvVfXQFg70uDJqeMpRMQDyn5ZYV6o17tyTyGy/W1JdOYN4Mpq85Mv/VHfp4JN
	 bdMjyxEV4r/0LZS+8RAuODFnsTjwSu0cM4v56SMP6FDiWusqGVdFHaELbfMirkawqW3xG
	 pFM7J5E5AuIAluICgTFAG5iSDgaT+X+2RJnQ2XQQEsDTYs9z7uym5B4UCqLSqIO8p3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
	b=MZRWYIvj4y5EY3SCAunm3j6qTTSxSvFnFrBLaRhRbEZByOPZ3wwqdoPoS2jLmz65l62n
	 LlZhFUDcKT1pLR07Z4FSUHcjmugdzQykSynGCogXJJUDWw0p/0kPMwFis5y6RP5hdGtM7
	 B/sPNfVRU7B26d9RUdbRh4yjf32eNdeMg/XrQ14qCjBvJhasQWpVUm+XPkd6KCEdKUDdy
	 sI3Kn5oVCpLT04Tdu505Dndeuc46bE9YeXBM6zjq74vo4o+UC/B6qOKXQzIZYPwvgoi5Y
	 b5L49pX65mBLqjKMv5Solo5bZ+ml0YAssP7nHKje/ybCGPZ5ln+V5ZocgnDctQmYCdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=p6TyeFko;
	arc=none smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869B9606A8BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869B9606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=p6TyeFko
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c504c069dcaso50671266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794564595; x=1795169395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
        b=p6TyeFkoVOUeZsZn+YShv7EPwTXNl4nm5v+8cd6w4mNijv/76ZHOonPgnttdyGWHSZ
         uIdexMvZ9JRZBPffyXh2pUxZFR4jWSuGrFipiIfD+EG+eg5YTLuoEOXo9FEdqpooZBMC
         rGdSQVMdhAxOa9pGZzVjc3efrhntuBZexoEB+v1b8dbGr+vzSeRSe7zFJnaKeTpnx2Nt
         B590OHIZSOAFKWdHE3H1S5NCMDILzqfTkV77AkZBPtflgccLep9cwQb5FK6Zf+L4F30k
         ry/j3H8g59MVDo+3QQxIWzqBneHeP5D97A/+Jo1ZnDLPRw3bPwE4QoZEeO2FeUb+zx5l
         PJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564595; x=1795169395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
        b=JHo0ZZtrkHJkYFnekJcpVMqR3PsuLpidqSegp/2QThyHfMFE2U1bVBgeWPYJtuyTAi
         65r2MxqeR7BA4fIhekrPh01IC2khrxcP02DcwIUmyALOx4qvQY8Q04hl3oqZ+aESN/2s
         YufaFiGfI7NEzMQCMQ/Y9TYUDdmGu+fli/cZhntXM7I6Z/2HR0B+2KTtoO+nbw/UzJf5
         gNvCPX1j+yH47HLUCzZ72+JbB2Dwc2C7U686riOk8vnR/aDecLrYeN8cOHMljsHgiAuL
         YdLQ6deg6FzdebHnGg4bpODJWf/3ZjgMnwX34OH2h60r25OYA1o/F/AC3NN2/JVrhy5G
         s+Fg==
X-Forwarded-Encrypted: i=1; AL+hErFN6WdkeiqvZft58K3dNxMWA7kyTTG8ajLSsYl/vPCgF3MxuHZgRtbvW0J4sl8NjpbMC/EpTqLxTJCHgDEz@vger.kernel.org
X-Gm-Message-State: APuU4Z/htGScPdOFS5nVozFyHPcQvqvR03KK4+OnwhMffwdXhzLwZoRi
	XjGz7SOVzAevd3nGfonvVqYgqiidC2Yd3tWvLB2sRWhWbL2IPb6K/fSxsC60Hy2LgZc=
X-Gm-Gg: AYBFou3NweHejWzC43bH2WoIqUUBQSkrJFzyhlerRvEVUnPbR5nA2SsuZgrh2jUH1mj
	deBqyOoREePofFQG8IkYFSavRV0zRFfiHqO/T4F7udhyOmKIxKfosFfLIsaZHsD4hLeb4jDJdf8
	SjwV9n/gPrKqEC1890xxX7teeesUkjfWFPf3dn2Nc7pdtqOgHSWMKuMDKcdXnvIL/3SoxOBWg2z
	TSyixCzWDKjoNQHAUvdxJkkWb+i5hzfSBj7TKSchXnhk9xool1uSCpgm2b22IX9ycTQL031tgC1
	Zy24iAOije5cJFYpoo3cm3FFoA0t8MnIqG6C7gBCiYEcxvpxbnwIzMeTWd32CYI81t4lARA98LP
	P9Uc2PCefC0Ns+0flsy5y/SR+qGFXawDcdQpjjZfqojMoh7l2JHIIzIEx01IaXi+fAJ57lc/neo
	v7G9NVSX/Bw9oKems5FBoWuaixaFjylHTDvQN/7wHDJ72JO/uiBncUA6tAuVs8UYLrZD0t557wX
	Ery9yxFZknUJL2S12f3fkShZaHTV3Z9NYskQUCnqJZdqeLMKOnrumFybRw2P3KXEI9farpMUwV1
	FcgADUvXKG+R0C2MjH8Mqjkp0w15kozC1KYXdctzT3xMqQoqo0LNUo5kiEUfxl9b+Lw5YCdhig=
	=
X-Received: by 2002:a17:907:d40d:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c5096372189mr164295066b.13.1794564594691;
        Fri, 13 Nov 2026 02:09:54 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75758766b.5.2026.11.13.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:09:54 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 11:09:53 +0100
Message-Id: <DMU0219YWEL8.35KQSMY192RH4@fairphone.com>
Cc: "Marc Lainez" <marc.lainez@gmail.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>, "Danila Tikhonov" <danila@jiaxyga.com>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-adc5: Add
 ADC5_BAT_THERM_100K_PU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-4-val@packett.cool>
In-Reply-To: <20261112170841.2189322-4-val@packett.cool>

Hi Val,

On Thu Nov 12, 2026 at 6:07 PM CET, Val Packett wrote:
> Even though it existed in bindings for the longest time,
> ADC5_BAT_THERM_100K_PU was never assigned in the driver. Do so.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi=
-adc5.c
> index d57ba8526e0c..c27ff89429f5 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
> @@ -542,6 +542,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC=
5_MAX_CHANNEL] =3D {
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_XO_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("xo_therm", 0,
>  					SCALE_HW_CALIB_XOTHERM)
> +	[ADC5_BAT_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("bat_therm", 0,
> +					SCALE_HW_CALIB_THERM_100K_PULLUP)

While this will work fine for some devices, unfortunately this won't
work for quite some other devices that don't use a 30K, 100K or 400K
NTC in the battery - or when the NTC beta (B) is differing to the
hardcoded lookup table.

For example on Fairphone 4 (pm7250b fwiw), the battery has a 10k=CE=A9 NTC,
so using the ADC5_BAT_THERM_30K_PU with the hard-coded lookup tables
would result in very wrong temperature values. Even ignoring the whole
NTC beta topic.

You can see my proposed patch series at
https://lore.kernel.org/linux-arm-msm/20260220-bat-temp-adc-v2-0-fe34ed4ea8=
51@fairphone.com/

Unfortunately it's from February and I haven't spent more time on this
topic since then, mostly because fuel gauge anyways was downstream, so
pushing just this upstream wouldn't make much difference.

Now it does, so I should get back to it... Let me know your thoughts!

(Fairphone 3 with SDM632/PMI632 would actually be fine-ish as-is because
the battery has a 100k=CE=A9 NTC and the beta probably is close enough to
what's in adcmap_100k_104ef_104fb_1875_vref)

Regards
Luca

>  	[ADC5_BAT_ID_100K_PU]	=3D ADC5_CHAN_TEMP("bat_id", 0,
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_AMUX_THM1_100K_PU] =3D ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,


