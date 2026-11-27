Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797648;
	b=cCqHt4fooMN0a3z/zQNHhI8tS/94CE1JTpRUGVpuHCS+LGrhz9RbgfY9ack8YPNpojIn
	 I+g4skUDnQtJqcP1+xcVQIdj+98KdGBCGePlTTZ0qMsqP4iBzqWZs0/56VXEwqOYeSxsu
	 44ePdooKVn4YY2F+o1AqjmCk+OujX4TNM83nvvwbk9rZek+LaR4zyAEz2kvZ0G0r3c8/y
	 1Oqxs71N1Dn7pwblmESKQy6tC5jSJ0VLROdubKMGnX8oNV8s/lbk93M9pN9lpNqykvEEF
	 c4idUEvUJTxU1l++kp6WZQ40WSO2SOHJeWjZAsa6JESctIDYCdVYTye4hr/Tfd9CawA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
	b=TW+T2v+7hozTmHzqpbLJxPBLngsjqpvxSoBEFd1e6h/275p6Q4U3xJoWE55DgH8/AKBP
	 p5ebRNjHSBtkRzTQwGPTYbUNXeGK+hAe3Ra45mjt3CCXBBM19UxAD3r+wLX1ShOam55Br
	 P2704jUfa1IKa2xyfK9gQSbwNNxylTdGx3bLPUtL2hENZHeIm3l6vrDvpbB4eDPuvTUuG
	 oGf6FbLWqmX9PxEXT8zQk0TYtKvQavAOX+VQF6Gyw1KIQ4fkzr4RT358HUuzAOl48SNDk
	 G+qXZWHJhOyu7adD+RN4FqzkDt7lEspvZRNS9drgPNJUUbfTrCCNoGWGzvOBEmQ2GXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXpGyVUU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DBD606A691
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31DBD606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXpGyVUU
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-949680e6d83so742270785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797647; cv=none;
        d=google.com; s=arc-20260327;
        b=VRp4IkdC5HfC5IiX5ifs5Eab2xPCfvhBTNdzT1jhhzmPOY0Sh0JC8FGMyj06/e9uPb
         UBCx9X1ZUJaPOluRuI3FMOMIqjOzfdPbN8qD5tdTXInTAEtwq2q97zHzzlxP9KKNHWAb
         Qngnu3SDuPCkA0UNPLTBCQhoUWfa9HPRfgpIFwK0Hcu+ZilkHme6rjkXN4HtPud3ot+w
         deP+4EfhE1PNjkBeE4jVvYlKPGfe8vXeAHyVsQ1IQjleSTINRX6mAp0P6oIfdECvIRk9
         q9vfYPk8l6oDy0MYEEnkOXdvhPcxDnumWunX54FMtDsxsr9DnxvOZBtmi/c1omvUGUdg
         mTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
        fh=eEquWk2rz7lxhvlQnoCACgj8qrnaPU+L2e3N63yfB8M=;
        b=pUMkns8zS2xTmGpCmkGujJyDMm3iPG6WgEJzOaQJqCpCk/6BjI1XelN0PD9rs+gAql
         Ii4V77IT10fXJJOR3X4MXB373lOOItTtzP8fU+XrOScP/fSonyy05dIVJ5egovjnEb2u
         CJIeYvMvsEy+2vu9l2H3xZawAtWtqlzmjyGyYcVVzYhvTem456B5Nkh1B3zBgmJn5ANs
         7DYGgRm5pRhZpm4w1VlJpJQ9aMgXg/jkP5IouwjVUwgYJ7Q/mtehF52jdbI1+3RIF6WJ
         8gBhgAeLd1X4lvfoocZmZJj0IhHw/2jOFtjnspRcglfW4+to3E2BZKCemAX0vakWHICI
         1jvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797647; x=1796402447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
        b=uXpGyVUU+HT9/mcL1vE5JHKOo8nLBz/gaz5KEYZt/mIPeLtFYLgQkFSNcnvX+KiV0d
         EWzuPZ5DghT0s9dbZY+pdaalvx+Q/M2KO76wP5hUbSkXqpI4gxU8wF2py84L90CLac2b
         a4uQcF+UTl9SH2PT8Zp/90Pk7IJEv+uErh1HgwPSJjnifwCDM7VhJrpWeZ1JGpsAQ9AP
         Ar2PPJ/k9A2Dd7fcfZ8vy5Rq4FG+GGpN8kxw0WxtW17yklKlDaQnB4oMFT3zYnJx7GAa
         O6/yRfvw1NIJa/NvHiTdF8tMNrLWE/7SpAGbBt+sMm/PL6BhjTwvzJr88SnAxUrK5+zR
         hnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797647; x=1796402447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
        b=mfZzSHdUPC7P28JPXlkfHGhUNhYjj1/STNwXnFUOHifrf0JHq8PTYYCC2pEdcqU+Sn
         OYG3k59c8DD/4zn2/165ooVqg26i3faD8ifX+dKzpS8bS2fwjDtRvsprEw829PC69EO4
         hANQtBDKvbVkkiKqTBUR00uI4k3ypB5t6QdRx7XmZyb45fHyDUy56wuQJp91Y9xmgYb6
         Xporph4k7XF7Ozvz+BibNAnsw/iRSTMJNF1mcS4CIzbmujgWDDHi1yNXMBheKVs4lQRw
         10LHu3+JySV5SiIBSuDcwr/lTgNUd86elOsUlW5YkDhNBzmE4lwmC0S51m8arO1jKM9B
         WgUg==
X-Forwarded-Encrypted: i=1; AL+hErGF6dqVHqspTPoG1sYijLzSTP8xuR53uwH0faoUXT0cMIbNxLWNjQuRsZ5QoGD8QtnMoi571fofnBsTa4C7@vger.kernel.org
X-Gm-Message-State: APuU4Z9w16BSBhbmYGk6TmG88mU1FmheOxg2yG2cBQcNfWDPqMNsRPZm
	E/csL83HWerICo2zJ5DKDegPXU8gNCPMfJdpwKZDzS73pqkaEuB17Ctsno/S9jvXS0/KXGYRl4v
	m3yKpVTUIWnXwdPdfhNSPFhakP9ELZC0=
X-Gm-Gg: AZFdTZeQPxU7ewoxA2DmHQCFPvfgKj64XPV6mzOcVAH8RdtkIZKgN9b6XOz3231vdHr
	87yfOYaAUg7pAJw9Yq81NTUaNSAyKWHm2lvZ3RxkpFPb5G3bFT94ao8gCmFrP35js2wtaMkd0kz
	x7rDvUHNCHj5iozusdeiJGaEDZ5bQs1t5dIIbzUH3IBjnovoAo1YeA85eWkO1Cs1hA8toeuuzuF
	YbdZpCGgmIkZvNelcN+rSZZJn3QB+VBSDIIXWzvsMX31IRPW/MgB7mTbCDroPuL/+QuRT2/1Vwt
	p4ZSr9/wK2M8+CIjGRZeywj1C8ikFN+roj3jngxkYm+i2tOGF4O0t6JhGFvTbSw7QbB+2xIeRfk
	xBwgpmjteoUM+6lXjFa7k8lcnUPDBPbS3XxB8FuTDQxWw493ehrmv+j+iOYyI2RVoStWsN/B6Jv
	sXvTxmXasbns/W
X-Received: by 2002:a05:620a:4556:b0:93e:c691:a1c with SMTP id
 af79cd13be357-949bab3d32emr4186387785a.76.1795797647019; Fri, 27 Nov 2026
 08:40:47 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
 <20261125123146.379057-8-hikmahgumelar@gmail.com> <eae86bfe27d119c6170b25de5a917df3@mainlining.org>
In-Reply-To: <eae86bfe27d119c6170b25de5a917df3@mainlining.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:40:34 +0700
X-Gm-Features: Aa3M54psm_9QUNpDWsKD_Jig5hkKXFvslF5p_cQzzBmVdpcTVqPaadJIGqde-h0
Message-ID: <CADA=zOMpnGjPuH63CdPKNMyVVmO7Rr7fB+EP=3MS4825kkgdtA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Barnab=C3=A1s,

Thanks for the review and the notes on msm8953-xiaomi-tissot.dts.

- I will add the blank line before vreg_cam_avdd.
- Noted on OV5675 variants; for now this series focuses on S5K5E8 and
  OV12A10, and OV5675 can be a separate follow-up later.
- I had already moved vdd_l23-supply into the regulators node in newer
  revisions, and I will double-check its placement and parent supply
  against the board DTS.

Also, following review feedback, I am splitting this work into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.34 Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> menulis:
>
> On 2026-11-25 13:31, Hikmah Gumelar wrote:
> > Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
> >
> > rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.
> >
> > Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> > ---
> >  .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > index fccb9c4360ca..87db6b18d191 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > @@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
> >               regulator-always-on;
> >               regulator-boot-on;
> >       };
> nitpick: add an empty line here
> > +     vreg_cam_avdd: regulator-cam-avdd {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vreg_cam_avdd";
> > +             regulator-min-microvolt =3D <2800000>;
> > +             regulator-max-microvolt =3D <2800000>;
> > +             gpio =3D <&tlmm 62 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             pinctrl-0 =3D <&cam_vreg_avdd_default>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +};
> > +
> > +&camss {
> > +     vdda-supply =3D <&pm8953_s3>;
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             port@0 {
> > +                     reg =3D <0>;
> > +
> > +                     csiphy0_ep: endpoint {
> > +                             clock-lanes =3D <7>;
> > +                             data-lanes =3D <0 1 2 3>;
> > +                             remote-endpoint =3D <&rear_cam_ep>;
> > +                     };
> > +             };
> > +
> > +             port@2 {
> > +                     reg =3D <2>;
> > +
> > +                     csiphy2_ep: endpoint {
> > +                             clock-lanes =3D <7>;
> > +                             data-lanes =3D <0 1>;
> > +                             remote-endpoint =3D <&front_cam_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci {
> > +     status =3D "okay";
> > +};
> > +
> > +&cci_i2c0 {
> > +     camera@10 {
> > +             compatible =3D "ovti,ov12a10";
> > +             reg =3D <0x10>;
> > +
> > +             clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
> > +             assigned-clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +             pinctrl-0 =3D <&cam_sensor_rear_default &camss_mclk0_defa=
ult>;
> > +             pinctrl-names =3D "default";
> > +
> > +             reset-gpios =3D <&tlmm 33 GPIO_ACTIVE_LOW>;
> > +             powerdown-gpios =3D <&tlmm 39 GPIO_ACTIVE_LOW>;
> > +
> > +             avdd-supply =3D <&vreg_cam_avdd>;
> > +             dvdd-supply =3D <&pm8953_l2>;
> > +             dovdd-supply =3D <&pm8953_l6>;
> > +
> > +             rotation =3D <270>;
> > +             orientation =3D <1>;
> > +
> > +             port {
> > +                     rear_cam_ep: endpoint {
> > +                             data-lanes =3D <1 2 3 4>;
> > +                             link-frequencies =3D /bits/ 64 <216000000=
>;
> > +                             remote-endpoint =3D <&csiphy0_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci_i2c1 {
> > +     camera@2d {
> > +             compatible =3D "samsung,s5k5e8";
> xiaomi-tissot can come with ov5675 also.
> > +             reg =3D <0x2d>;
> > +
> > +             clocks =3D <&gcc GCC_CAMSS_MCLK1_CLK>;
> > +             assigned-clocks =3D <&gcc GCC_CAMSS_MCLK1_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +             pinctrl-0 =3D <&cam_sensor_front_default &camss_mclk1_def=
ault>;
> > +             pinctrl-names =3D "default";
> > +
> > +             reset-gpios =3D <&tlmm 129 GPIO_ACTIVE_LOW>;
> > +
> > +             avdd-supply =3D <&pm8953_l22>;
> > +             dvdd-supply =3D <&pm8953_l23>;
> > +             dovdd-supply =3D <&pm8953_l6>;
> > +
> > +             rotation =3D <90>;
> > +             orientation =3D <0>;
> > +
> > +             port {
> > +                     front_cam_ep: endpoint {
> > +                             data-lanes =3D <1 2>;
> > +                             link-frequencies =3D /bits/ 64 <418000000=
>;
> > +                             remote-endpoint =3D <&csiphy2_ep>;
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &hsusb_phy {
> > @@ -154,6 +256,7 @@ &pmi8950_wled {
> >  };
> >
> >  &rpm_requests {
> > +     vdd_l23-supply =3D <&pm8953_s3>;
> It should be placed under vdd_l9_l10_l17_l18_l22-supply =3D <&vph_pwr>;
> >       regulators {
> >               compatible =3D "qcom,rpm-pm8953-regulators";
> >
> > @@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
> >               bias-pull-up;
> >       };
> >
> > +     cam_sensor_front_default: cam-sensor-front-default-state {
> > +             pins =3D "gpio129";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     cam_sensor_rear_default: cam-sensor-rear-default-state {
> > +             pins =3D "gpio33", "gpio39";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     cam_vreg_avdd_default: cam-vreg-avdd-default-state {
> > +             pins =3D "gpio62";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> >       ts_int_default: ts-int-default-state {
> >               pins =3D "gpio65";
> >               function =3D "gpio";



--=20
Best regards,
Hikmah Gumelar
