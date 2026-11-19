Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079592;
	b=iatpHxitGpLcotXL7Uf3Q5ewymUe5Q5m/4jqbR0RNOrRyQY/E6PPGsCOtGUzcx204hIb
	 DFn0BCkYi/5w0wIGJKnjgXseowwurx6X2s/4kS0SUorf9HaniVptSe8M3x4DcTQraQQTF
	 cK2L5HTEEBYHjTRJbpTsMc5V0prO+m6GVwCt4yVeAIzNQKMKK2TIyTNOKr7sj5wOTZhLo
	 e+wyTF6lxe5RCf6vCr3Q6OFibvS3K5uZHe11UH8Mw4SM1MJB/YAOy48DXuUFJsSD8w0Ht
	 Nkc3UsWM8v7jB2irhwOcoKGWS9D0F6OobO8G7RQ5x28esT1POj89jgwsx4VmzPX8gPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
	b=ub5KDHZQlWDFkGqCATQv4+S1UVImfrVIU6329xOf+SgZENIqCSOvjf1CWVxrP1kpqT1R
	 r7YgAWcDfnIFBvIkUl5y8OQVlX6B8cMlWVndzTvYHA1uf06N9ichZIxe6eZ1KDMXXq7S/
	 YnmEB7RU9wIfZrnA8GRQh2Uk71Drang75IrDgAwUiK9wwFwcaOx7lTF6YV+t5o6qEZSHB
	 3poBMU/cakcjCgxG8qJ3AZGE5cHCJrsvXGt8f5yMNkRte1cBQoP3EGbKlfSPVbkmLySIo
	 sl4qUfH05eOI45h8YzNtxDZKtHQBX70bU/DEeoPZ7EugyqujRPT2UEhEUkVLvOwRmrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084BE606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084BE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so318035766b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795079589; x=1795684389; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=cyYxEfasnJ1RB3+F9HQ3kC+3x1Suvkc2D89LpTI8+pw+eAAwycdhqJavNg6jfArG06
         7JOCKyjIFZw+nr/clzS/FlZF0tkW/tGCuolgw1y+hnhHah0vaD1owxv/OtpdlF+et24+
         5L6UDEJTNVsrLK4J+ku1kAWCSku6cLc/TckT9iAM6R+oPGnlb1CUiB3kUc5/c+MqFRyB
         stqsA0fzEfvyMaiEWLDvydtQsTclnOH9ybTAeNhVohSNOZyB0c9EwQfXP1kwiRFNT07A
         zWt7aKVRGzi7F2YU/x0W/Yt/TXqrDRWJJU0hid5GcWy+qSpR7k1tulgob5DMl37cK+Wq
         ZePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079589; x=1795684389;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=NoM/YYI0AMMlM8KfGHOWlDRa5/FQLAHabFbd3fXO0P55AKT5f4S/2P9eZGgHtimDNA
         EOl8yny6IK0Y4iVUYVi8BT7i2C17T6NZ3oUzBbQyO0jpx5mYZ7J4MLtZDPptX1WzGW9g
         cjBL1tfvbIojnXAXtTCAb/Wl6EPwek5O54NY4GhXfhbTKAjeFkP8BQiPv84hUn5r93tv
         +flLwKp93OL9TfR51/DfLoYs0YDyIrOSPcrUUir5OrOTQUjghsj+RK7tewo42e8Nc5/c
         daHgjpzwc8D2ydrCMzrTxu2AxcK0EXj+7ddvSn1g3bCSaCrFC/DYUaIQiSIxh+mxT8tQ
         x1UA==
X-Forwarded-Encrypted: i=1; AL+hErET+jXRH10U9EnrVmR0UXdiSFlUk8lSwvBtwMMj1cLqjtGMuztv3X+1VrrvfGuGWEh8niTTCwV9PLrvY7q/@vger.kernel.org
X-Gm-Message-State: APuU4Z/UluiWjfLlSQ1tDqDy9DEPoW1NSjq9J2/VhdTbra655/o3O6Ju
	Hjx3A4pQynfHYFVnJ42uiiz1kaAkM4OHAwEPTGWvRL0TCbHtBHqel86zgR620ef4RsY=
X-Gm-Gg: AYBFou1DpmoMzMLwO18gAF4vKrVybipAQpgALZ03dUkktvM4+rnuFbzUuE4t9WpyQuc
	UPMkJ2b+CWzDuyyJY4OQkwOgIp7zyPAq6SAedqf2bo8DfhvmN4RIczkcCcoOyGtgghzWE0b652g
	YTbzPYyXrxzVNv+4Py4EUmEHFuNkwDqknuk5WeVvM+Uu8IBYt5yu/aMq5qUBG4gDsZ/+nX48psW
	MC9PxnuJeTAlIE75AH/rmvA9V67+bKzuLSFdr60r7lQxBNrpjS8cxnLhAh/UJF8VblaCVDRWXiR
	46SB5xoEUdJ+Di0BdI3+lP2YtuealittKx8iK46iySVmbnuYwLHjzI2Pyfags4XZFWexUa7l0bx
	RM6/tyBqDOWZsq46WsE9gkm+26RBykHYpKN/GMrx0Yi0gD0+WA0PiwByl7ltKkp819joECIXCNx
	7S8oAk/Z+9GdaHIBgGlr4JXPzWfAs0ntsq7V9kkOXc7q4gBFxCFQ6DXrl/p/ES1Z7pyk7gcDufT
	pHx2Zur47c3DxDjxYIMsFO1O+JJPorPEns1cI8gFNPdmPlrXfXkaWsIytmBEYKArbIndzJ3mR8N
	PnIFG6/NhdE7jSE8F2DOBqk1kDX25hWeveRC/7hCHJEmYCP5nKJ64ZDf85kB3oL8wNmZm03K3w=
	=
X-Received: by 2002:a17:907:7295:b0:c31:8cfe:9a25 with SMTP id a640c23a62f3a-c510e19d00dmr455876466b.9.1795079589464;
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512341e0adsm87945966b.36.2026.11.19.01.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
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
Date: Thu, 19 Nov 2026 10:13:08 +0100
Message-Id: <DMZ2LUM6AWXG.4IUB01OTC2NF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Laxman Dewangan" <ldewangan@nvidia.com>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Jens Reidel"
 <adrian@mainlining.org>, "Casey Connolly" <casey.connolly@linaro.org>, "Val
 Packett" <val@packett.cool>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
 <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
 <20261118164229.GA2892053-robh@kernel.org>
In-Reply-To: <20261118164229.GA2892053-robh@kernel.org>

On Wed Nov 18, 2026 at 5:42 PM CET, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 09:23:12AM +0100, Luca Weiss wrote:
>> Document the property to allow using this sensor with io-channels.
>>=20
>> This means that the output of generic-adc-thermal can be used as an
>> input into a different node.
>>=20
>> As a specific example, generic-adc-thermal takes in an ADC io-channel in
>> Volt, outputs temperature in degC, which can then be consumed by a fuel
>> gauge driver to provide the battery temperature readings to user space.
>
> But this is already a thermal-sensor provider, why wouldn't the fuel=20
> gauge use that provider?=20

thermal-sensors =3D <&my_generic_adc_thermal>; could work, yes, but IIO is
way more flexible and can support the required use case very well.

From what I can see no device binding (or Linux) uses thermal-sensors
apart from thermal zones, so actually doing this for another device
feels like re-inventing the wheel when IIO already exists.

Please also see the cover letter from the RFC[0] under "1. Do not
implement IIO device in generic-adc-thermal"

[0] https://lore.kernel.org/linux-arm-msm/20251010-bat-temp-adc-v1-0-d51ec8=
95dac6@fairphone.com/

Regards
Luca

> Seems like this is letting current Linux driver design dictate the=20
> binding.
>
> Rob


