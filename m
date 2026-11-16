Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843833;
	b=F0/BmbixyPYfWb3YqsQcS/njgZxMkswHJ7v8Lr9EMbANVXP549agU/U4VfNus343dK/K
	 peezHicXnmJpAzt/5q2tSDJarg7w6l7oIW/E7GmK5ofeHScrwAVBxjUMR0CnIMquOFhUF
	 MhnnaXOR/Acw7hvAgo5iA9sS6jKvLAF+cVFM9kxwg8RCMKppCsRT20JSkO9Usg9jza2rO
	 i9MhC2qA9/fBQ91sJt0e6IZMsC1Yszkl4kCJydM3Gh6h3PWa24v0k2T1b0EI3fOBwn5+1
	 3UAjfsK+MygCJF3sFGLwYdf2nawmB8ndWHCiE2bqN5lKbgQGFKlMtcC9xQMwfcpHpWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
	b=bKrLLp4wgkMtqHoWCzYTp9UmjbzL6quJ9gDax6UPseUnLz4GGQ+JiyQjXu1W0ZGVQoUq
	 Bo48lSGzsU+pJQbtu7VB1ciY+b/dkPoeh5uZsTXOn2zWFAba9h4Xm4igEd1B4/5y+3D+N
	 samkynPXa+wPLCrncBKoXX99YNND8RcwnvIMMXdsnlrhwvLwlm8Dflc59fDZK+MhLRZ5F
	 zCejc4BXwJmbEDpPA4PDQ9qeJlW5m8Uv78ye7ka42NeOvP6pZJQw95uLPoqMS/V1uETcG
	 /eWGIiqu8t9dUD1DHQfZaKc2D+5ZH2rjSEFx3fZOEwUyc+8qFBXPdHkX++3s97SwO6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638CA606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 15:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c468bd799ecso531361866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794843831; x=1795448631; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=l5yFnpD8es3PZ8hErhgAyB6jNHgRJQL2UrqaB+35VDA03JWtWhtFRjub4w8iKrO77e
         FcXuh9bolv6SYa88Apk3Cj+9S5ZwpsJlBdiFSEej53nktGjQ0LAsYndjgYq4DB2bD0yl
         Nyiy5scYIfhVrAS4QNSBaNJydK3icLZBN4M0F1B1L6Waj2/CbMjaV0UG6L7lgr8aVaGD
         pXTH8mr0Uek6+QgkGZxJY+7f0zkWMqOFQHSdN9vHIUiEuWSmJok/yRbEEZJRUESbTGNj
         3zjw9jYFXIMQVSV2tbewdyiO4fsAHVQXDakxoF3J1EzoW4EzlIXY/FZ/rBxt0ZFpDLkw
         9Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843831; x=1795448631;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=Wkp1ryQysr0LzeOczcbRvc6iCArHYoyBcErcEEFTV8PTBpNjOs6pjVOW586cnTkkCE
         uEIO5ac+9YtEMq1aV6SQMWQvDvSKJGIwQWepqkuZMQHP7UhO8Pw5gcrSqNrAZ8lPmWzh
         DrGL7kUTwrh3yAfcm4Emk2GX9WSkn6QOm6Zk9ASQ2imzZotXUC/x4gCEO71JBKOjwtSM
         rT3iiryIFDVVSQwvca9eW8oyeGIz/Hm5cOQNtHaRqlYdz0NxofOt/wRgPLEns1kCpqKJ
         DYvSzvFDcSdrQK4SNOunOUDNvP2cVjaI1l+BhkQnoi7NdeA/3F9Q9xzmvlul0Dy5VjUB
         g3SA==
X-Forwarded-Encrypted: i=1; AL+hErHwmdEpHLJWDM8IBZq0VUv/vxPPLJ4CHLXt7a/l9Zngf/fCVXMSq8UNKZRil+D0Ugk4s6/w7aHtpbc35u05@vger.kernel.org
X-Gm-Message-State: APuU4Z/HCUzMlGlcwulzEiO8MkjiAWoEpw1BM7+AcVW4VPYzEK4Obked
	ZY5JzsVBoX+msX3RIycCASjVgUApHKi6Q9W40g+g3t87XPYpXRpdWb2uXZUj2ammkdw=
X-Gm-Gg: AYBFou2ee+608h88rGhBENG2I4p/CKcv+/aBsJ7hM0rqgDo9LjuwBHPBjJqFaE1xA+v
	ex2IpoOShTCkyRcbj+DW/Nfy95QwSK7vDsfb3JBQE5ZiiVHWUxgq8E9w9NbOeMzhWZ1g1viv3bD
	2Yb5+gb3Ooyhs7ZqrhST5UW/dyiKQ/HXtQwQb02emO6Z6aI6bGHkewntdXHFzkKE/ah6Bhl5A4A
	3b9WVfKcgEs9xbNWKy45rfL82UG1zJmxKVLF7XsCAqByqJHSiJpjEAbyuGUlu53Dskb1/g4nomq
	TjmeNyNJGb6UnZJe5Pw2UZ69TyMXON+0pQyIqRbQTNGAPlcs2LttyV+ymjIOZ5hc6j4KXfG84al
	ucE6g+iK3+6oZEr5b0W4qufFttj0REe/8QQ/4Wxmq8BslJVvwTm4FRytSM6psSsPDKO2AltOsm/
	7iHawHB2FQ+6nnjEQf0ZEIqP0vB69oDrGhp3Nr1xEPCCMCe75kfxXwzmE6OiHX6FBSK1QieH7iQ
	n1tQjzt8cdskidLXjNv8HPst+j+YhwJVDsYhNnPx7bVSuGbkdbGb13xMTHduuULQuSKCyJ8FAlp
	emZ3nJH5HMXhirtH1kpL0ciTdTbPCkn/GfmUvHkqGxQK058td6WTRd4WRM9USzl19KZoL6BVHg=
	=
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr844840566b.16.1794843830845;
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40918sm439294866b.39.2026.11.16.07.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
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
Date: Mon, 16 Nov 2026 16:43:49 +0100
Message-Id: <DMWR1CJJRHMF.33YRRRDXPMBDW@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>, "Val Packett" <val@packett.cool>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
 <20261113-bat-temp-adc-v3-1-743979a8fd90@fairphone.com>
 <avc5rnvIAEmZbyE1@ashevche-desk.local>
In-Reply-To: <avc5rnvIAEmZbyE1@ashevche-desk.local>

Hi Andy,

On Fri Nov 13, 2026 at 5:24 PM CET, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 04:56:42PM +0100, Luca Weiss wrote:
>> Add the BAT_THERM channels with millivolt as output, which can then be
>> used along with information regarding the NTC in the battery, to get the
>> actual battery temperature.
>>=20
>> A static lookup table in the ADC driver won't work since different
>> devices have different Ohm and Beta values in their battery NTCs, for
>> example a NTC can be 10kOhm & B=3D3435K.
>
> ...
>
>> +static int qcom_vadc_scale_hw_calib_therm_volt(
>
> This is broken indentation. Was `clang-format` being used to achieve that=
?

This is how the rest of the file is formatted, I didn't deviate from
that.

>
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_uv)
>
> result_uV

As Sashiko pointed out, this is labelled wrong, the result is millivolt.

The rest of the driver consistently uses "mv" for that, should I deviate
and use result_mV?

>
>> +{
>> +	*result_uv =3D qcom_vadc_scale_code_voltage_factor(adc_code,
>> +				prescale, data, 1000);
>
> 1000 is odd, can you use something from units.h or combination of those
> to show what this multiplier is for?

This is converting microvolt to millivolt.

Shall I use "(MICRO / MILLI)" as used in plenty other drivers? Two
drivers in the tree also have "#define MILLI_TO_MICRO 1000"

Regards
Luca

>
>> +	return 0;
>> +}


