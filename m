Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917418;
	b=O4LreDVYnlzWflY+mh0EWg+mnQaACnJGTGq3T+5vb9JhlXy7fxlmufYt2h3fWdffZTm4
	 BoL0r/ASEkMIm5a8wfcbg2SEHwd43DDMPmu67bwudZAFUp/TKE7Mjj/aMbgXlqAmVkmF3
	 L7tyELX48uCuxUsAS5jbuGcKQS0mSlKupN668VddkYlOu76Xb2ekg9fwH70/GDtho9ufx
	 VlLj2Zeq2IRg8FNyZ7QXWnjBpW8qtIZ6PwE1CSsPF+T+BJMcx1FNZlhmr+t2Y2p7cWDBV
	 QkeOdE+r6qYq9G6Oa2psMbagIZVCdjLv48Dv26K/cZaQFQTvXpNYezMTAZcgjhT/Q3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=dfaypAa6ppfXfClsoWfeiFIIEjS/QTWnqdCEZYeNYh8=;
	b=x2dnx5By+t13aDo5q1K0pp4BS/SLOlOTOOF+7UAGv8v/5gf4gRydZAsX1Rwt7WOdyUn7
	 MTVGJ2GUuTdHpJEot31N8G1eFzeJrOaQiwzuumLciLNE9R+HwgMgvTxkGgpvOCIYadFa9
	 F2q7vjnczE4ghUD0GL2yfhJWelzeKuOUdYt8De0uHexpbgQ4UBSLTaLBjQLjzY9MPvoOr
	 x42nTI/glBVZH+5EY82M/E+EawmIFoqozm+JJmbEWAlAbRJsja3nzARZoZfPv56iqJBms
	 inn2/W+W5trz9SvMn1tb8IERncd0qTELqwgRdbQAVN5nGACmEScQ9atY8lG8ytGfGIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=r0YTNcD3;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86C606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B86C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=r0YTNcD3
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so7001720a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917417; x=1795522217; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dfaypAa6ppfXfClsoWfeiFIIEjS/QTWnqdCEZYeNYh8=;
        b=r0YTNcD3IlklysrapoNfdmqdrM8LOOK9EMn7Nsy+6hzp4drGhZ5dviCBiP+Znk8coK
         +i2GYMy+6eh+IyQCb2yIih7T5pgtgxYvpxaHL7ZPDRtlwKiZTMWVQgZHaX/jI+SJaUAQ
         JbucQOvhMd99aeRNtPvV6jc3x7fq0LQQbHRsGXiQz8DDAV8FtMf3YLS2de6eDcqaYoRF
         6elq9U85D5Q33IrDX735kH1qsA0vxVs0AnK9TlyQ5UeBbjhmalypF0nerwB6gH/NMHSe
         Tt0rNN/oyfGbjbN9pmH1gs2B3EAB3bWdm5J1rTbR8ccpjK/kY/v/XPIj3GCkPjqabgPq
         z1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917417; x=1795522217;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfaypAa6ppfXfClsoWfeiFIIEjS/QTWnqdCEZYeNYh8=;
        b=myxxTXJ9WKfnhWMs1DNnmQ/cwSPdGC9ijnTtGsyPaB5bgjyCPbOnzzqpsm+Xjjhoif
         +wJxsK8YO6lFzttC50wQEP6Wus+gj9A88QgMJHTGBjRtgzlH4mzRmncGyHfdTPvkdYUg
         kpaZN2qG+vl7aSf7eRviUP2CUq6NJ0EV9F63Z8rCWQfvu6JMPkZw426Fl8Xp89xBS1+o
         KQgX51EC6M+MpY8ldqhxJapGhtQwYsLnfNrQdSDto7lw/c/HnM5jLGgQGREOFNEGoml6
         B/9gwXtby2ruvCspZ4DZhXHvNU49O9I0y6CEeBETrHdSEIsyRHI++gugLKKE6Sns2mzc
         ooIA==
X-Forwarded-Encrypted: i=1; AL+hErEX7Nood1X/7B5FugHR6jGBB2seVf9WUoSqw4qAph9aYP8+ZqKerk7+jOAPondFjlKNb3Mjk3fPpyscQxoP@vger.kernel.org
X-Gm-Message-State: APuU4Z9MyseLyiIQ+WJmhUKj3wzcQwluvm/jCgkQCtU9dlx6Hu7ETK0K
	eO+POOLVG6xlUCXAA/KeumywBoh4mfDOvwoF45+TetsR4N635dkXV+E1v2rtlgCAfbs=
X-Gm-Gg: AYBFou1wnzuLF5REbfV6RPQMJKus++gxb6r7EC6U2HlSCCkHkpkq/VeHhPKls3IbTf9
	vEYYrEVVT9j2Pj8/uHhreBLfxVJqAF12/8BfZymJXd2zPZ4ZUncoZm0UW+EvNFVEZbdZqbYyqou
	Ukp6Hl3lhgL9D+4oCFHljmRSuzZSXCsbxc9/GtC3Nfk3n+16V/WqKLDrQMZHzGN16kUK1XxgX3A
	tRQ2bG5150/KzOrKgCekkheGf892tjWiQnwtsOOaDZI9JDHd9+9oU5gYLfkGuzAPF0pEmxYHyTu
	dwDpsYmxxKgfCXroLQi0qiSDS44iPyUNEeho0p6znnBxvAkDvmn2gEn6/3/NGG8W/doiT5VnzV+
	yVzMzfw25eANKhDWBO+kMGMlsSQXSyEj9uw3JubkJWVWiS9rzrWn3QiCw6YJWxjBSJz0icETHT5
	GY+Kg3Wnawc496Bx3Voe3zfmllg6DNfQ71bVHKpypEDpPX650xCCMcvA8v2QsCFNaCzsS8mFAgK
	xEYurRGaFDVnlvqmuTrLgGEfgoaHwHN0O/4LumV4nrd2UdD3HV8sNPIx7xMY+xBW+zqc7C7oVkp
	sPM6kK9DN07i3DsNhpof7GTnG4H5MNnTL5fwa9dPvT34nzPeNgChpmb89bn5FKZQJUGcpzivcA=
	=
X-Received: by 2002:a17:907:94c2:b0:c41:26b8:c49d with SMTP id a640c23a62f3a-c50963cccbdmr1064546666b.38.1794917416774;
        Tue, 17 Nov 2026 04:10:16 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b685b0sm531579666b.60.2026.11.17.04.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:10:16 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:10:15 +0100
Message-Id: <DMXH4DEA8NRH.2HZPS0S9ASHN9@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
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
 <20261116-pdx213-upstream-3-v5-11-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-11-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the PA_THERM1, MSM_THERM, PA_THERM0,
> CAM_FLASH_THERM and QUIET_THERM thermistors connected to
> PM6150L.
>
> Due to hardware constraints we can only register 4 zones with
> pm6150l_adc_tm, the other 2 we can register via generic-adc-thermal.
>
> RFC_CAM_THERM is intentionally omitted for now and will have to be
> added once it is clear how it should be added.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 160 +++++++++++++++=
++++++
>  1 file changed, 160 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index b86fe11fd5296..b19e76b3c1a75 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -81,6 +81,13 @@ memory@fe901000 {
>  		};
>  	};
> =20
> +	msm_therm_sensor: thermal-sensor-msm {
> +		compatible =3D "generic-adc-thermal";
> +		#thermal-sensor-cells =3D <0>;
> +		io-channels =3D <&pm6150l_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +	};
> +
>  	thermal-zones {
>  		chg-skin-thermal {
>  			thermal-sensors =3D <&pm7250b_adc_tm 0>;
> @@ -106,6 +113,74 @@ active-config0 {
>  			};
>  		};
> =20
> +		pa0-thermal {
> +			thermal-sensors =3D <&pm6150l_adc_tm 1>;
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
> +		pa1-thermal {
> +			thermal-sensors =3D <&pm6150l_adc_tm 0>;
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
> +		quiet-thermal {
> +			thermal-sensors =3D <&pm6150l_adc_tm 3>;
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
> +		rfc-flash-thermal {
> +			thermal-sensors =3D <&pm6150l_adc_tm 2>;
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
> +		sdm-skin-thermal {
> +			polling-delay-passive =3D <1000>;
> +			polling-delay =3D <5000>;
> +			thermal-sensors =3D <&msm_therm_sensor>;
> +
> +			trips {
> +				trip0 {
> +					temperature =3D <45000>;
> +					hysteresis =3D <0>;
> +					type =3D "passive";
> +				};
> +
> +				trip1 {
> +					temperature =3D <55000>;
> +					hysteresis =3D <0>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +
>  		xo-thermal {
>  			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> =20
> @@ -392,6 +467,83 @@ &mpss {
>  	status =3D "okay";
>  };
> =20
> +&pm6150l_adc {
> +	pinctrl-0 =3D <&pm6150l_adc_default>;
> +	pinctrl-names =3D "default";
> +
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "pa_therm1";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@4e {
> +		reg =3D <ADC5_AMUX_THM2_100K_PU>;
> +		label =3D "msm_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@4f {
> +		reg =3D <ADC5_AMUX_THM3_100K_PU>;
> +		label =3D "pa_therm0";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@54 {
> +		reg =3D <ADC5_GPIO3_100K_PU>;
> +		label =3D "rear_cam_flash_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@55 {
> +		reg =3D <ADC5_GPIO4_100K_PU>;
> +		label =3D "quiet_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pm6150l_adc_tm {
> +	status =3D "okay";
> +
> +	pa-therm1@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm6150l_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +
> +	pa-therm0@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm6150l_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +
> +	rear-cam-flash-therm@2 {
> +		reg =3D <2>;
> +		io-channels =3D <&pm6150l_adc ADC5_GPIO3_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +
> +	quiet-therm@3 {
> +		reg =3D <3>;
> +		io-channels =3D <&pm6150l_adc ADC5_GPIO4_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +};
> +
>  &pm6150l_flash {
>  	status =3D "okay";
> =20
> @@ -405,6 +557,14 @@ led-0 {
>  	};
>  };
> =20
> +&pm6150l_gpios {
> +	pm6150l_adc_default: adc-default-state {
> +		pins =3D "gpio7", "gpio10";
> +		function =3D PMIC_GPIO_FUNC_NORMAL;
> +		bias-high-impedance;
> +	};
> +};
> +
>  &pm6350_gpios {
>  	vol_down_n: vol-down-n-state {
>  		pins =3D "gpio2";


