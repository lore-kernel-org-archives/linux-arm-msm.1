Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916941;
	b=37lTjvFJ4d6dF4UT8x++b9ubHZ+SiDp9Gn3o/PTlp4aMILX5JFbV2CKgXaCE5zDSZ+oA
	 CY8jWhDDvDJPZFczuAhUeXggqYilFcgsTT3WKg/w7twQXxDMo84CV2N/dh1/HIIJcFB1E
	 A4IhFLO9jKv1mLNMR3hRdLbOEZ+UWMTNpIFpl67+3PYiRx7w1Hcs+JH6l6FSD6BGpex46
	 VtGoKalVquOuyZFDQ3xNI+9Jo2eLcNpWoGqQW1Gfod1+2yvQSK8A6x0G+uV9CEUU5+QSJ
	 iOj/SWBeg7IUI8tSokD2QwSAtId+5vaTMn6MPu2reRyccY7ZxV9d85SPO8E4ePeey6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
	b=U65jq6vrM9nXTJ2HKV1Kf7R96AFZc9NkKRke96BVF10FEyXZR5rT+8bIKpSPOo3DVIHA
	 0RWtUEEQar51deGsfFIlUFEqV6EgXYF2dSmMoY/DrrxIpRTpVbMRn5eT0aTmr/H48qbBJ
	 B3FUP/RvTydD7D/WKFP7ECeRilAPYOeGZY8Y2vCHXmyhe2TGfC7u69VBKUqkoybmov28/
	 5Ht7rsvW0+yvjpUALUATCjYixGo4jVUDkxlX4kJ5kvZZ8ebWWrzZIQVyMaPphdh8LQ0H1
	 JUOGRIMl4MgKY/V73DKkqcCUmTSD8lUpI6Y7/80gmRtFho51QGj2ivdnDi6xYeIJ/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F30606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F30606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so800901966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794916938; x=1795521738; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=Th827p32i0l9D3dCfJvt6t8pdkgOWmCvul17AhFFjNuJukCtmYruARt4sMdL3QUntk
         /xQ0yKa8WdJnizBI8kqOWfBgMNq6peVRv+Xyu1951YpaUa3jZkxEew2xfVNuL/MfPQq6
         kRRmIVNCcxJzMVkB1BkWWZNvwVkCe6IJ8PsgAm2g54nH9NV60iMV4OcOzq9MZAwtncHP
         d0vXcrnAVqWEOqsmcrHftcwvPrz6P64ycSu9vSt1IWtiKjIMRDEcaHlSk9zfNQ4Rdyo5
         uRHppU4E6d3q2a2sG4Ggn+5uc/Ex9NqQld4G8hPB2xtYg+21jWoFWz3bMq/gLBal5A7I
         ZhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916938; x=1795521738;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=asx7WbrzpUpKGqGKxXy+b70E2gco5RpeZ7Ky9+tso/J+wHL9BKWmnQ2LmVuaYRvpy/
         3Oo9puob6/FsVo1LtXGWIO3u8huuKVZUW0OI3+UBweMSkXVUe6Bnffh8lt84u6ZFtDHH
         E1jNa/MfQGG9r4JANrHff2yf1KAfmGGIJfw0uxwzXaU7r1NP6vF0AxewBqg6IBMOZWkC
         iV+8LwtkFksbTOMiOZ8MuWMJqiTdD9d8dQMnlkOtbjClZPxN6RdeJAHHyiLXqWsXyWG7
         4TZ7RYHg9HAKaC/EAh3vnHSJGEKY+Ldba5GqNhHpBntDnJC35diC0UHWvd4NzRcVBA+h
         Wlsw==
X-Forwarded-Encrypted: i=1; AL+hErFc8Cdn+fFNn1m7h08bGEAH4xQAfpXeFVMb3DB6rzqkoljIH+4YQoRPznaRPGe43x7ZFnodSBcKEbe+3iAX@vger.kernel.org
X-Gm-Message-State: APuU4Z/nv9e23zeIQ+8g3MYPCdUiQMueKdkqCFQRAE600J6DIsYygP+j
	SdxfikTS+3PvQTgDnTrm+tHFwsT0qbykT9vKxGA22JYJBEnkKEHWgfu5gpp6u74vCx0=
X-Gm-Gg: AYBFou0sv/B5kp8tspwf2mrXw+/OVG/03TKqnMX5upP5M9SRXGIwjB37wV34oQA56My
	/Z8yLTxdX3678yQ5OEHcRNTXXwPq8I1BzgAXk/F6DbGItTGEoKhdqoMtCrpC73Gcqv5GBs2Ut/y
	14VqYF4JsgDH5Xk2r8zCkjtPjcmvyq40zzP7m1FFxNutVFnHScpq3dU2QLUszWjs1ZfXZ5587j/
	BvFOLXNBtzy1Wl7tGZ6DNHHjU6zQEdzDtCWvYGtDng/7EwFk9Xfyz+ICyqSGZAm3VCDZi67bI82
	STCDQFek3PNlrFm6kOqdgMJzU1mVOTcrpfjTSfBjfQsK73dG0arUxpCOUETQUZ+q7Kujq7QxOUc
	/8dxKOSfU6kyO5U/UKEkqY62AoW5qwlm2YCCz6GKlfR/p6qmc+FWRr7/4m31/zbpsUo8rPQMUHd
	zkAdN1mKJF6RRHTCZqQ0XYBQ8rJE+JDXnycUBkAB0Cq/hI196ogNCqunSCRTBXuu/JV9Y50oZQC
	65kQ8koIwffH4NLF2hFSRJRCarXpz9DZCJX7X8y61/kgyU9Ntr+s77OMWznp1aQB80JzCU+vNPA
	p8qcb2zeSz69O3/CnJNR3N77aaZNgmYX1nzqdIBxTUZlerYm2/eX1mure5hldlZcueH6Kj13lA=
	=
X-Received: by 2002:a17:907:c06:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c509674081amr1060134066b.49.1794916937935;
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50efdb3471sm115816066b.87.2026.11.17.04.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:02:16 +0100
Message-Id: <DMXGY98BB06A.KWBSBPSFMXJ9@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
>
> The phone has two PMICs which have a PON block, disable the PMK8350
>  PON and keep the PM6350 PON, as only one should be enabled.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 697e1cfae72e0..50a235d6fb6df 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -8,7 +8,11 @@
>  #define PM7250B_SID 2
>  #define PM7250B_SID1 3
> =20
> +/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0=
 */
> +#define PMK8350_SID 6
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -16,6 +20,7 @@
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
>  #include "pm7250b.dtsi"
> +#include "pmk8350.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -420,6 +425,35 @@ &pm7250b_vbus {
>  	status =3D "okay";
>  };
> =20
> +&pmk8350_adc_tm {
> +	status =3D "okay";
> +
> +	xo-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pmk8350_pon {
> +	status =3D "disabled";
> +};
> +
> +&pmk8350_rtc {
> +	status =3D "okay";
> +};
> +
> +&pmk8350_vadc {
> +	channel@644 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label =3D "xo_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


