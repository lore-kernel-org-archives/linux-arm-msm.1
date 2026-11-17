Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917107;
	b=J5l3ZbYje3SIe83zz5gLQ+mZnjVrzTjscri18hHnOgOz9XmEnsMa/HkMD6uBDoWTU+jm
	 bnVRpIeqSHZ0feGUqV0csJP9HumujXoAhZ4VhX1oKSCjuzSot9r0rMqfJmiTMn0/c1cW8
	 qJdP9QpgYqiU2+lcrPp6pU+BKfaf67P5MTItpgfOSx+1r+/RTcujC++Mbn4Vni0ixwFfV
	 rvdwocN/20vuXZi8//Cr9hpelpkbpXIpv4dRb/nkb3iHTXbSzak9CG7yZAO1mbMIwmrZV
	 xtqn5VND2v4JNtF3vn2vWvZH8aWeofARZXQCnpGd9NcHgjqWr+lR6hagTjj+qDlbTaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
	b=Eu1btjbqPBywidyD4TTwH9uw9sard9DFZF+fK8EdM4pXGMjsS2wnu8DaQdJo3VTNdp7X
	 MINaTRSw3OLnPbIdxwQhaoRKQN4iSytX/AgEXzKXRpX0SvMWb6ysh1ptGg21FtKcoq7C8
	 8AS7OUxLY4uewQI35bKyPYHdaRTKYmfDPEi9i4+QwQVlCzxQEB7Wf78AER49MUy5im+9R
	 as9Gx5lFtCZ5rLCAqhNFh8oYsmI6QIaMZf/LnzyK9RNz60HM90gd1Yp7h+OSYI6c4KxxR
	 mDCTpYFR8IF7t0ugeQdUv6ilhXpRQ5EqAyDIbuXwpEmG6u0Wa47dAFIHjG2L2hyufaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE625606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE625606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c505186727fso270610366b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917105; x=1795521905; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=ORxEYea6MFxGoUK0zCYHQMQ4RmiSZrwT7i9g46mYc6HzJwZYI6lz91n7MsJPSHP8L2
         VZgyKrSF81qlVHLJ87tuNd6qYCMfEm3kU+5hfW7eWUWEhoNOgJE3l6jJrMlMOPS5TnJg
         0p3rrr9O54Vmmq4wZXZ5jqs1z97LwcxxAAlZarRSVP1RgYMfRBjx/5PUjw4eRa8nH9qz
         56Bj2ghXjjD4cRETMZxMeK6F5BYd6JVmrmeDY8qcXqfRZqEosxGBHsCddrljWXR/OuM/
         tOWx2c7TEhSq9DR86A3bC3rjr1gVceVg4mDHCZoN5A1SWGE0B7Y0HcPOAkzSO/vs0NpX
         2VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917105; x=1795521905;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=Vc6k0WNZW/PMif7VVL0jk00XhaVEdtdQAfkgrdSC+kBijGf70GB5j8YMSAro0QkQPr
         6XccwXAWxKU62Tw4etep9kwUOexjbYW9kTV7+/AS0Z3KEjtU/2PXxL7O/M8nFjrCXVF8
         nszEbO9CdLyuFlgwmMQAgLcbZ7c8HSLFTv2AxtucqTQr/Jx33/Ngu69jiR+A28CrHm5z
         n19Px93gtW4IPSPJMxbq5+dJF4GLyPYxcr5o2BLjoQjEXDk1yzrcaLs0TXHMgWPAMUqx
         fR76UTz2fYwrLZNJD7uoiObEtrpvPAPQRZ/rYFSNgkBFuxhOM2H6tEGlRuS0718SJv0u
         HPag==
X-Forwarded-Encrypted: i=1; AL+hErFmt3GGWbLpqEE03lg4bjqQzY2eQx73Xyu02Nifijjoz0CIynUw+3fPrBWz24TdMAGOIvzgvg9Gp66ocZ7l@vger.kernel.org
X-Gm-Message-State: APuU4Z/897jkO7Y/TE+DJDV/l2PGy2g4IhpD83KVaR7feX3CkDgTstHE
	V0frFwL1oJ6DAsUzgS5KHPp9FrPgHBNUry0r8BoqTgR+OjthTKT0PsBSBPCRFlWJwjs=
X-Gm-Gg: AYBFou1Ytr0KT4AH7PGqlMFlrTyqAqLuNnNo9ZA/vrBfO2xCMjAmlGE5NFPZHUX5Sov
	W6qU95h91kshIS5ma5KfHeunGwMJg2UYUKYU0bBiXOIGPPUHW0NXFnApk28QEvmOmOZItLYnUL4
	dQGoTcvFuzJgZ/PeUEjZnMo6WLJ/GWZ+EbaZwEUw3RHOPOuKb4MiYKwzPFsaBUK36OK6JTDV9XI
	RkWLjwT81Bv44Q3975MHCOuXQA6yv1AXSMYbRer7wz80zj7PV/v6Pfl42lqq/0ZsMO9dlYAhGac
	ELvy43scKtC6vlY4rsvEb+rNhWCWTQqOD5ZlMKZuVc9WRlhCjKxNRdLGGf8vBjgoAbemWaO7dYD
	5g+4lSDWalZQ7rxPvhDGQjs+VesyUte4EZoV9RFVMQNn1o/LNZWp9ntUkq4YB2a0/1PgS77CMHx
	YwFkUAv6MZMAaSAat1QqhltHUXzgmI4vtTdDtAKoI1d41fyZHeQzdAKJP7qOjbDJwVza1VPX9Aq
	/AVXPKuHxGq5ucAkViwejNjj4zG3vYoj28SUxGdXmJwB/C0sVSLBYYFzogwIKjNA6JC1zlnluEt
	Ozeg6K3K2DHlAeW5BgYdrZ0uobm1k+H09/XloSCaf4p9Vmge8bgmrsaHT2ieQ7t8RNgqyCjshNc
	ZQoYp355mLpJ/ijUhm9A=
X-Received: by 2002:a17:907:84b:b0:c35:3880:773b with SMTP id a640c23a62f3a-c50963f11f7mr1200537766b.45.1794917105150;
        Tue, 17 Nov 2026 04:05:05 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm473472666b.11.2026.11.17.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:05:04 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:05:03 +0100
Message-Id: <DMXH0E5U7WSG.W427836YQJIS@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 9d880f6baa531..697e1cfae72e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,10 @@
>   */
>  /dts-v1/;
> =20
> +/* PM7250B is configured to use SID2/3 */
> +#define PM7250B_SID 2
> +#define PM7250B_SID1 3
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> @@ -11,6 +15,7 @@
>  #include "sm6350.dtsi"
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> +#include "pm7250b.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -372,6 +377,49 @@ &pm6350_resin {
>  	status =3D "okay";
>  };
> =20
> +&pm7250b_adc {
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "charger_skin_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@4f {
> +		reg =3D <ADC5_AMUX_THM3_100K_PU>;
> +		label =3D "conn_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pm7250b_adc_tm {
> +	status =3D "okay";
> +
> +	charger-skin-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	conn-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pm7250b_vbus {
> +	regulator-min-microamp =3D <500000>;
> +	regulator-max-microamp =3D <1000000>;
> +
> +	status =3D "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


