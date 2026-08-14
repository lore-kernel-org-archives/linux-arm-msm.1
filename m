Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132364A13A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734011; cv=pass; b=XOnc/FGzul1VBxV0+15swfaneFphWQ6rqUxV9NVfzQaponEKhJi+HrYN5aV3mJyktv/yTWr1fknddKB8Io2yHS+BEniXYNe5GrInVKieir6WOjgQ9YVB9oTfVIF5SH0wo8VCSUDXGkBdS/foSNSeQmgnHRKOxrGp0nXD/qx8oD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734011; c=relaxed/simple;
	bh=8UBhrC8HpfupIaiQ3+TwvErJNXgqZnEQxZ8thuF/WZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBMDnL2k8acpF8V8Ir9feGNNiSp3YS0xz0GuwSxl74SBgpmITyn9MUJluWldkINKD4Eoe+ov8FcmfxpJrrnHe8BKAiqZ0ErZBNuR8a9r+4L+oAs/JUGTtsBqTTxkmQq2BjbpD/PHieOyGoCMaFYppG9uJnYxuCy3Wwvbn97qWXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZvQ2UWp; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZvQ2UWp"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39f1ac13687so8763601fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786734008; cv=none;
        d=google.com; s=arc-20260327;
        b=MZi1pLg91dwhR/0269Jueie4BrwQZwqZTzKvhkS3GcPvCeKBCz6+fY5pCr8o/5r1qZ
         +fNrdGZ08IX0iPGbuEYEZQwPch5x4pJSEo3Lf/PGTDCfI6UD32vtOYGAHBiIRceqdFHD
         XYV61z+Tgss9rwWsPItIUcopUW3vPvFu/NQXO78UxWl/KwiuVXCmTQLKN/Ah6m2feFsH
         4URMxdD77uaZ/jrpxS0NL8av4l3BzMMjt7tw9FKpYyOMmSftxCPNoc83rbfp59zD0Ug3
         nJXDZEw5JFozQlSJeYvhgFtrgNFFY5t8k9w3StrAUy2rgcJ+1EIhmShWoAADp8TjNIer
         YS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIcL3osXcruiiQ2/mmC3QiYhtHMgSVCol/+yb35Iqlk=;
        fh=2X+uHksvAVxNeFpr4DI+/m7mXk6xy4DP5ah0IzqIdVs=;
        b=K//IJTxEiCa1dHqKy3YjNudDlIjIm0Pg2Cp4UkXzLRsgUMRWWOO8qUgtdBOfJQ8R62
         YxuKERZVwEHXiz6rsG5MjHQ3baFnh7I7jLf7Tjv69F2yCJi7VyAykBoIkrFHmL9w7ebW
         gOiG+4+iinOof0Lq5M4dC37gB7b2biBG5++5D286TDrsoR6bBa3lILj/DdMYte3woyIh
         JdyQnhby6S9YT94lpSKVaCKemMwNzorBQf9x43Dbi92NvKzUGwF6cguKqCZ4Nfxvcdlw
         ZrKjkHPllQkzEByTstDD51xl3cTRMQ+YpLE1WO4lUJKPnAKeaa/P4KJR4CA1jGtnBsR6
         ADZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734008; x=1787338808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIcL3osXcruiiQ2/mmC3QiYhtHMgSVCol/+yb35Iqlk=;
        b=hZvQ2UWpAQh5qfAD2DG/55wnJLouRvAM0LR6hwf9A2Sr7a25sJv1gWS+et6t3M1Fl4
         MmUmDxTf7/gAlch+Gdn19G9KA/dvGmMZUPO1FUwd1tB4gnb0WeLbv7XtxIDzzzz1I/ml
         7vlhWEWeFiqDZbS6DQ3TdMx4qIONZWeB8Eq+lkl0BXrg69SIZBnJLbJIKQYDL8NkW3vL
         3rM/JyvRijRpBT8LlhRNU+pSdXSwgDP6JL3k/+3eGZoeyhQj86RPBSA3Hg0TEGFzukqS
         PTdRyimAA9ICiSe0gJ+px/jQVC/9nk0dHsZfay3TqgKl/XKjY2c4sAhVw3yyKW3tqzzg
         SYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734008; x=1787338808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIcL3osXcruiiQ2/mmC3QiYhtHMgSVCol/+yb35Iqlk=;
        b=Tly/R//bA/fudT4XFg3fZR3LvvMIvRBDcZDwpIPsB8zac8XdJ2AKJgdtST6FHKjZ7M
         k/mpJC79vu17VYSgWwNIeVlXJWtRi6FWxFZloiu5/BmuAC1SfWuxHdBuGsqC168ntvsF
         fOcPbd6fkqKCwGRvZlfgK2qKE5BkLgTJQ9lxen6G8Q6pf3LgP2F9ivapWRfFrPD0IIUz
         xc0rsuMwgNyYpppggawR9PuP5xHLqRDQdx3E8Q1n7gsoxWXsu/oMwxqtMGz/l8578jlT
         Ww3Q85U52cT2Zzfhu9brqRi5EQU/Yg0LebjyHZ6qBptyTpuwqUni7OvrWWWenyqkNmw9
         LKkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUZZ3/CT6Iw16LMFwSoMRZZYA6xTHMFezVW6C/3cFtQXTlC6IYTFH6m2OEEK8l3NWgUIcUcCpj0Dl+Q+FE@vger.kernel.org
X-Gm-Message-State: AOJu0YyznlCSK3j9TEWGhEtsuzHFeXTgoJ/NWWayUikcDqFobg7c4oNC
	fxVETDwP/8PzNotpmCLwIdGbVQc3xL9wZV2MoUl55UCgAIeU2yTdI9EKUdImNN9Z0648dA9R+9d
	/f191oqlsfuK+wF7vYfJi971p6i417yU=
X-Gm-Gg: AR+sD11c03NXB43h3UWJlk7276AP2qjUPO1zZ2ksA78RfTznFIPcBno0bg/5fsCko3t
	srCts2w2BVk2j+0yLsYpRKuSFCQ14btDBILmV6TA95FZibxrcILHlHbdbH+tVmMZpk0n7Gjz6nQ
	Q+Nr4PJuxyFDyzlHVlErPZ4C3932IBQoZIBJUuZZDPlyVItx6EO2PSTvWifFjzrKA6IiQMH10Ql
	EGIeaaCvg370spytFoE2aTX7s9h00aTKSuvpUN5wxUH49l9PqFWnu0zcvu6uOyRofXTDHO56g8I
	910MK+pXvU7kB7Zdla+QV+BnnC0cLzhPNPyhxsKjENYnq+Jn34zYApvwiSyexG5PmJ/cg7utEA5
	efACU4qln6cs+8EDGLsbxu09NhBq9h8Xj+wb1cETd
X-Received: by 2002:a05:651c:2121:b0:39f:ef56:65dd with SMTP id
 38308e7fff4ca-3a1324cbb22mr7387531fa.24.1786734007812; Fri, 14 Aug 2026
 12:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com> <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
In-Reply-To: <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 14 Aug 2026 13:59:55 -0500
X-Gm-Features: AUfX_mxdr9Sak4hscLfEQL-AM1RV-cvbPThBZrgyITfD6EmLr55pvDtGjrDohKE
Message-ID: <CALHNRZ9c_+ahDALiQos+H7nWOz7HK8dOfWg3_vnkX+k4=vSp4A@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 2:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Aug 08, 2026 at 12:37:57PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Retroid Pocket 6 is a high-performance Android-based handheld gamin=
g
> > console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring =
a
> > 5.5-inch AMOLED touchscreen.
> >
> > This is based on the support by ROCKNIX, however their history does not
> > show who the original author was, so direct attributation cannot be
> > given.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >  .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++=
++++++++
> >  2 files changed, 123 insertions(+)
> >
> > +
> > +     vdd_disp_1v8: vdd-disp-1v8-regulator {
>
> regulator-foo

I see these are inconsistent, I missed that when pulling the support
in. However, looking at the associated AYN series, all regulators are
named foo-regulator. Using regulator-foo would make that inconsistent,
is that really desired?

> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_disp_1v8";
> > +
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +
> > +             gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     vdd_disp_2v8: vdd-disp-2v8-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_disp_2v8";
> > +
> > +             regulator-min-microvolt =3D <2800000>;
> > +             regulator-max-microvolt =3D <2800000>;
> > +
> > +             gpio =3D <&tlmm 142 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     ts_avdd_3v0: regulator-ts-avdd-3v0 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "ts_avdd_3v0";
> > +
> > +             regulator-min-microvolt =3D <3000000>;
> > +             regulator-max-microvolt =3D <3000000>;
> > +
> > +             gpio =3D <&tlmm 144 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     ts_vddio_1v8: regulator-ts-vddio-1v8 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "ts_vddio_1v8";
> > +
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +
> > +             gpio =3D <&tlmm 102 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +};
> > +
> > +&mdss_dsi1 {
>
> Out of place.

Oops.

> > +     status =3D "disabled";
>
> Isn't this a default? If so, no need to repeat it.

qcs8550-ayntec-common.dtsi enables this because most of the variants
have a panel on this connector. So as one of the odd ones out, this
needs turned back off.

> > +};
> > +
> > +&i2c_hub_3 {
> > +     clock-frequency =3D <100000>;
> > +
> > +     status =3D "okay";
> > +
> > +     touchscreen@38 {
> > +             compatible =3D "focaltech,ft5426";
> > +             reg =3D <0x38>;
> > +
> > +             interrupt-parent =3D <&tlmm>;
> > +             interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
> > +             reset-gpios =3D <&tlmm 14 GPIO_ACTIVE_LOW>;
> > +
> > +             vcc-supply =3D <&ts_avdd_3v0>;
> > +             iovcc-supply =3D <&ts_vddio_1v8>;
> > +
> > +             pinctrl-0 =3D <&ts_p_rst_default &ts_p_int_default>;
> > +             pinctrl-1 =3D <&ts_p_rst_sleep &ts_p_int_sleep>;
> > +             pinctrl-names =3D "default", "sleep";
> > +
> > +             touchscreen-size-x =3D <1080>;
> > +             touchscreen-size-y =3D <1920>;
> > +             touchscreen-swapped-x-y;
> > +     };
> > +};
> > +
> > +&pmk8550_pwm {
> > +     status =3D "okay";
> > +};
> > +
> > +&remoteproc_adsp {
> > +     firmware-name =3D "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
> > +                     "qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&spk_amp_l {
> > +     firmware-name =3D "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin"=
;
> > +};
> > +
> > +&spk_amp_r {
> > +     firmware-name =3D "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin"=
;
> > +};
> >
> > --
> > 2.54.0
> >
> >
>
> --
> With best wishes
> Dmitry

Aaron
