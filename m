Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917284;
	b=C3MFHmK0h2scS0QnI/tRqwxoUY1hMlhnmT/VOY9Awq8Bbrs4IQA+Sp+S5+0Zh/Abl96P
	 AlsEdmNcNOax1iOz39HOq1YCsCdbZocrcTe+23pF7Ov8XAdyjBc+v58Ixan7XI1w1fbb5
	 19/HCwuT/9d7lMsyredDU5CwZsoc7MJEXZKQAsdskSmuKONEPRwncbNfkhHSkwREu4Vre
	 wssl2+X5gOyXcqdwpNlWSbO6ZX37O2LcnlihK/D4ceoFHdIX/b4IBS+71/N90J4gvi1FM
	 hiWs7OZTVOtJImaD+9+z2KblrnItPi6Q3F/axE6JXLqcIttMJo4jl6rU1ITScmKGjfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
	b=Y86owO1gP/siMZVDe0NCAgLp5CneO2RY/5xirJrwYNJWS1KFXDHjn1T2R9yOvIG496/R
	 P0jBSbAptPbHwEdnRgMvAOHMd4vin4zHCJJFm4fhTcBhU52ZsfaAmX8W7vmDpwER9Bgt1
	 +aaxtFrO5DwG/cPmqrsbazw2Mg+Z4a/N5S0+v/VW5p6LKhabv6HOVaugZYa+al/ZEkziw
	 Z7DCwsh006M4ZF84sXiEy7K36WXva2TL4QGjr1I/qlrfB71XNVJk+9AQZdyvM9/mZcrxQ
	 qPNh0mPQkH31U/Y6pXkyOq1Jrep0UzWcU2kj5BzGM1qcGYY+stH+vWJCtC1MlCebNIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C7606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so462526666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917282; x=1795522082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=dt0iCOV8v9GvAZFTt50yVBbkG2wg4ZbVorZMsiO2KekaDCip1lwFjGMCgnT+pTmn1s
         PyD96HT/urX1171AawiamygQPsZM0QOxGRVjmbzF2ZVvR26mtxc4OFKszLYGJMhPUlBF
         fLbReExtNhC7bOHj3TDuqeIN/ptRUbNXFQG6hqNZiaaiYL0CVQ8/YYUxaWnje3peW4do
         8BD3nCUiO748ANhh9WzZFJi9cmyAbWbmeVxJzA5swoFc5cxLnTSZ8oaMsJsoMcMivURr
         klv6TPVEXsjCMpxns4NpXPrBxieCaZrTg9xJjRaybRUunhjrdWpTjo3OcPmHfRtt/i4O
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917282; x=1795522082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=iUP0zCAReTfb4NEHP+uYvJM5CWlmAr5l51ab6ci5VHjUdqr3fQYkYSM0UE8slEvQ4L
         Vdzs+mrq/ARYt69gJUfK8y62k7AVPWY1Kv7Dqy0J0u6rfBKsXFz2uGI7mV7aTUjoop5n
         fZA0zvLfDhJGcA5N65/j+kO2sOHfIxtLJIg6AMslygmE44Lu7QdeuY8jDqAx+5ZM/voK
         9vIGbMy6NI/ve72VJMaaUpyokYYY10HfXQ3Z5+C8eZhjnYyfvsTv4Ho8vyI2wLaR9FF3
         7E4pqk7hn2GOGpZi+G7tYDcIczKmq7FLuuDnHd4hxkXvfNv0ScPSWBey752aBxhFPt3c
         6fZQ==
X-Forwarded-Encrypted: i=1; AL+hErG2NM6hk9ni4jycs707BT2oFDMoT/y8gCCf8ltqofXszvcIo88W11cWD1cfcGYshUtSj9qRcoboRZIXKMg+@vger.kernel.org
X-Gm-Message-State: APuU4Z98FJs23IuUBm8C9qiZACaiwKXVYvCoOxxensvKD7Qxmtp32Bkx
	pWI8qRnJakGvyltvKds7S4e4OalM61VTSqC6eJHGUDMoQjTMjK8a+eWMWVOv4DTR4rk=
X-Gm-Gg: AYBFou3lw/wXkwIAKVjiUvQLJQpRnFRnTLDpFd/T9C1nQnpL8xmBUZXAMj33xonI/uD
	cplvO4QIzsaFVwB3XrsZBQG34w6gjx4tnaBtGBqIyaqa0QcGTmQOchXrRd/AaB9DXoPp865dAUO
	XzmvNK+on4H02tYpyZHKlYfosnWBP8l09Oq2jRUC55p8bLpQzrZEXeRMYRlP4z7XdE1s0WnOeeY
	0cu44OIQGczjgkVM+rNqhIvgXh4O9xLf4WTCgOJPmpmM+e05djeg3sgN9fvdkU7RqDaThh8Rtlt
	KVrIHQRIftcwxbwlVfbi7SJ+yMnX1CWUcaRWTNw2PQHb2jcWGSz7H4BbUNIu6P/RiOJCq154gUy
	leg5xRn5+wsXkXnJSxffrBWi0Kv0mY0/mnZBDKIuiTnqq3F4kghbnXmYKYCuIowyOWMAG6L/hu7
	QXqHXq+vbqBnyzPw0xYuoTj4BNWCO8lkMUXTPudLvsM0A/RKHhhxqDDjmMPWx7JXI3UaQMG4Hxh
	aAdcl3GLXIP+IrOFaL2ghUqsgnQpmtBHMfSIIa70Bb45NtLj9bP/JKNIUokdKEJcLTa5tzfDQZg
	s7MzbiCL4+FtCkpMYypqTiMG1BeDNsT3z21pRAIZsBM7+1B/X8a9e/JMDByLjj6MMImwdcX/fA=
	=
X-Received: by 2002:a17:906:1f4a:b0:c50:aa10:d898 with SMTP id a640c23a62f3a-c50aa10db4bmr727613766b.26.1794917282269;
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8650fsm525227166b.77.2026.11.17.04.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:08:01 +0100
Message-Id: <DMXH2NN4W05P.20N2ROUFAX0WZ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the xo-thermal thermistor connected to
> PMK8350.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Same as pm7250b thermal patch, could be squashed into "Enable PMK8350"

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 +++++++=
+++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 0bb714eed13f4..b86fe11fd5296 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -105,6 +105,18 @@ active-config0 {
>  				};
>  			};
>  		};
> +
> +		xo-thermal {
> +			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
>  	};
>  };
> =20


