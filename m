Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917222;
	b=gNr/3PuijtgoTP5sGCv8Am4vnXDJnpGmc6o5Q9ChJBijoRoUWFoJQ5CbFe/7T25sJ1Z8
	 JTVVUaWw8tmFGr2EnkyARnd3rGPKqyTkmk+mDV7em8ToEl7h04Ton+LJlCShxJzhsXUdp
	 FJ5bWoFT1Ywr/6I1AsESWJBUeNzE2iOPdVghX2aSSXTQvcZOSFLuheH7jTGHxeo4CeBSe
	 x7w5eHZMRUjP9hz7E3hPQkpwDIEAZ+e1LKKBiK8roBmjTGOIs+pQWB2dPHWDTgljOgzJ9
	 kDkYdBpBZJhlWilujM+UvDKoIBTeilbSj4N7LgI1rXd034PK1BLjerCVMXfeLE8VtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
	b=JXzgqqSBC93zP/q6igFfLNHvhK8A7tiZVaNKcyO52Park3kKLdsidRmTj2vSOl1reTd5
	 kyJz/PV8MM2Kq93LYX6VY6jOFODi/je7e9xOIi2peb8Ppx4X9Xz+OG8hoSWkILWvd0dbr
	 vv1PLOSRpQCAvltusaMXw0A/02VOUQcLiXadefi7Zyhfdpd9MncO/tdUyGoCpsikbrOPI
	 Pg9cxMRyedbXTD3W9YJK4n3E+PJEdFDkIsVUvNTHXZdnaQRGrH2LqCcibBty2bfKbWBeA
	 Fqqh2BxG2s1o8eJ4fZQAWzLt6gmTKeGx/I7Fw+nfWurUvxLvOI9bfFoCAksLAVulz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="0SXH/KI1";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E216606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E216606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=0SXH/KI1
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso609313166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917220; x=1795522020; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=0SXH/KI1Y3sFR/g1FdVD4aywE7M953r8hni0T/LCpli6q19nDR7TUQ75KMweJVehSF
         yYRb5xKjPO/vtngq8ekpj5yShHNAARPN/0knvtzfPG9NWvsGU/Ahi9kyXDncp1CxND1Y
         StsB9I/AvGZOe2+fcbvcC1F+NgWpJh1hJmTOc06lJWbwVwU4YZ9Egeygy6XF3qqtrpGV
         oSO66+YyHJkUTXaLwZCmT+VOfuFUHtnr4Lwq9U2KMY+L7s6djeKeBl5w1DLV0H1j1sw6
         5YuP0JUF/7bntcWL6f9C5SQPyxsXJ7bG0wPEdSROPVT2945ojgBEVS27n8Lsx62x9mpR
         VizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917220; x=1795522020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=shjTiNG6stiL4m1fpz4X6MafLRiRGvJjTqf79HihAmE+R9fSTFgpx2RwBBbDoKXm7B
         N/+lh63xqMHzFsRuSGAm7sA3ASJuTh4kHvYrmCikgOyaM1LXRc4cvCWbnRH7sJHKbmNW
         rOo7ZT7afEsPaWSG3l2en/NXj181gKDc1z+6ZmFq9nimeMRBCc+lqdrFAo9cqjkrrZyB
         SGyPgESzxUI68nSf7/jdVpw66Pap4hzcLqGp41lD4qtH1tryGIU0ac8Jc/c4DUlSY/CI
         3ygtjJOw5dIW34KKgw4TNis8gschrdrPFoJwSbZNGPxkD7ZtTtpHSsRX5RHneQv441We
         ykcQ==
X-Forwarded-Encrypted: i=1; AL+hErEADvoBlnY7CVUpWElUGnWM2z6hAbVRQ0FdzeA0g4OSltI1gltMISojWvnwhBeErmqWCfYB1uUTHy4DpwSj@vger.kernel.org
X-Gm-Message-State: APuU4Z+NriQaNCD0xzOegIvlX4cZKt2zoJaPqJnLGmHIQxK+ycZYVZR1
	O5PiVejANbyBknIME298KoHEG6aGy7ODX24ilUTDbT8WCZ2BndCpBE0QH0y0kDIYEbw=
X-Gm-Gg: AYBFou0lr49RqdDfSbVECfQxooKnQ1t5QscGH4ggaqGJ5nSnhzKqAIFVEYXN6pOkD+Z
	LouoP6wOk0Is6A/IWFigqx+jUqTDgMF46KbvvZ9lGpoicOzbXvVw+7W4MJWPBhn8jZl1NnHTjr0
	o+iarEaLwqq7MGv0cqgmVPYbJDmsL8ofCCYu3+5TvgK3mgLInmXOFqXsBRgjZNByQtC3nKR9jsT
	E86J/8WM4+NwhptVcupTCvd/Mii2n77cacOgrf9OsXz3C6so3GPcEiJshoO7TeHpdAwL0k1ihoC
	dgvp/pV2UXbvO1XrDT0QkF+q/F8JFjBuAfyddQYoerD0MLbYZGN9gOHEsqPHZ8rJw7PiBLXQ/7j
	4XjvOrd+cgWzo+p/cqHo6uRq22OfEQwfmAhAEGo74cD0fLCUentDebO/ZsVh3E0cdfwXNiyVlE7
	X3HlwPhEBxgn4KBRAr7ot93omZu1ry/3TJZD3tI0nGMc5/CqGmlABPOI5mT9eGnQiUGfe8Jsn+l
	gH9W6jaQMZQyFyEote0h8vcGV1g4HPTAn106SfHLk3DBm4PsRQQ9zx3kZWiUqaawUbT8DLuogxR
	p2dTQsxI2ByyLke52KcsGMa55uwOldIFuz7U+jac+1i9Kr4w7mWhgssJJc0AmoE9vvg+DUIjRw=
	=
X-Received: by 2002:a17:907:6d02:b0:c4d:4d5b:4bd6 with SMTP id a640c23a62f3a-c509654df6emr1125503166b.41.1794917220010;
        Tue, 17 Nov 2026 04:07:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b51bcbsm522082066b.44.2026.11.17.04.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:06:59 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:06:58 +0100
Message-Id: <DMXH1UYFI74N.FT441QG9ND7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
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
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the chg-skin-thermal and conn-therm thermistor=
s connected to

This line is a bit long. If you re-send, please wrap it.

> PM7250B.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Could also be squashed into "Enable PM7250B" but also fine as a separate
patch imo.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 50a235d6fb6df..0bb714eed13f4 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -80,6 +80,32 @@ memory@fe901000 {
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		chg-skin-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		conn-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &adsp {


