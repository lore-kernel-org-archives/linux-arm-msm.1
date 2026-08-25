Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283E36F8E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675563; cv=pass; b=jFmOvppati4LHt2l5gN8ZvDmddoGynjwoBdkkikEeyEbreieSsQ24W5coHpWL5KNgVKBGMtMSgGK5Zjfh19HcNXxufANLR650hNrqfGONQ+p6ucEPAqgVRdensJc9xOKKE6i69alMXP6Kt1rPCnD6fNBwspZnUnY+7pMXJy9ar8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675563; c=relaxed/simple;
	bh=/k84j26bjqojqsGkVOowJ/WCefrkRCst+f+Jb6wWW6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2HMdFOLLZQOg7ELspo6T+1uYMtb69UWs58U6kiizMNVd+VnoPE+3FL2oDfG95k2BBZNAkWJgSfMSI9pt150bXnoqgXjcFD2YRKp3D07AK9mAutiDQ7u4TnDqKG3hTn9eGmACr50cdW6hH5tn+TLaPndWURPh08k39TdH+Z84Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdvfAcjJ; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdvfAcjJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1671ec8692so711741666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787675559; cv=none;
        d=google.com; s=arc-20260327;
        b=c0G8hyvQ5DSIJjgd+fWQnMzyV9TWERrERW76kXvOmWwoIkZ/RdUV6O+plpdQ4I4Uyn
         iNC/7B/hso/odeKMmmm7A6HAjJPSM+dFaAaMY8rUQ8X887ruaOn7+eM03uDpVVdcsMmS
         3gzKTK4sKDNaD/ZgxXvHQCVL3kZOTr/luKJS3ggj3re6u0iIVqQWz8UcOiSqg7kwJk2+
         l6lSn1zviuKBzO++iPR37hrtMDGr4ovVVh5gIdC4PBCqyRbs6dPSBOplhNT7B0yJCycK
         Zz32neViCO2WsAjNsNSQfBsvtadkw+YK6Z6xl57+/Vfbktx5Lc9u69HDV3pHtrZF+yTA
         /xAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RLh6vm4k5z6kpwU5Bc9yLeQpIHWI3MlaI4Wdfs6kBDA=;
        fh=IzcRXfGG6SJI+MvdR86qJEKZ8wZAqTswWTyCDvFQbp0=;
        b=n4vgSvhqk8uQp/b+O1L1rLepbgOb9q8P/dRLJnwDaBQysbUKPOUbA1JzAG6E6Ae7SH
         ahIdbLcpbqO3SffhBQOuNBC1V4WtW7rlovZSq1ms0kyeB5X/RUR/psLG8SzwMCceXnkQ
         +Izh88w7cfIlkp37dapck08S7SjvhHwS4XGrZge+1FP7/3nICAPX7pUMTYB/xE8waV5F
         g8A2fUCsh9RCU2K5rMjcQUV5cptOqn10Ht6jyCAPj7UW5S8g/qnDoIf3AYd5ph5yXQQR
         P6IQYp0wpMXibrbShkP+OiFOKplokDaW6IYtcY+72Ngh4q1a0bg94mAXZut83QBaerj0
         d8ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787675559; x=1788280359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLh6vm4k5z6kpwU5Bc9yLeQpIHWI3MlaI4Wdfs6kBDA=;
        b=gdvfAcjJQbRqhDQBdk/RdtckY/LBCPDDoLoED0WcGvIHz8otCeBLL29taUtVc16DOJ
         gs+iTP9jWIVfsQJmRM8ILa3ps5lVqgoTvyZvQNMHQp1fCFa/+egZK/H7G8NKpA1iO/pt
         uR8zkixBz5qTbaMtjSAfN+53V8fUOmUm5bRXzfFG+m79PB9THidUsKi1pnlKzqo1k0LT
         jWuC+CPKpGNpvaeFXoG3MIEtB1nRBQsHRzEXR2MRBWGbTMN2mD2DYQ1iOA4NtShapDLa
         gl4hkvJT0xJ1cABgstmzsvQfJSy2HWjisDfcHijEc9V9Hd5Y2iwxi5QoOkRReTrTkl1V
         7gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787675559; x=1788280359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLh6vm4k5z6kpwU5Bc9yLeQpIHWI3MlaI4Wdfs6kBDA=;
        b=CDEhgSJTNwYHYZ6LJo/FXkMKw1aoQ1LvYoG0HVVbuROPAb5R7BHlO2GXnBaDn5c5vn
         QF0FI2DYQq/H7okSm/a4ST6frQ9yl1zBEhGaiL4yER6qLs96QoWdD/unfonX01uHitN0
         cC2o4lpTJOFxGEYy8oIhXWeJ7WIE4x4tf24puYt4o6qmhWLYQ3vca3ECRMQStCAJpKKY
         mXObXU/DK9eAaIWQkhPH6nQUOOkKS1r6PiXBs+J//dwJNEqatTlNNtdXRJQ1HpBZavB7
         BdsaWZvTFcYKpP5+UP5UnbVE0ntzVW+YeiA8F565ziXvJMA0nxfBxlhsfcU+DCcmnHC4
         8vwg==
X-Forwarded-Encrypted: i=1; AHgh+RrKTz/ds068dGlyQ313MQ07tE+2Woe7JfZp62i5NbQomjuYS3pXY0oLnaM1y8v5vldaPfh7Fw7Ke+0b7R8o@vger.kernel.org
X-Gm-Message-State: AFuF++nXgof3JNhg1oo4bZiXn/ZxWvak3VJfntKu4O+p/MbTqTn+jaMR
	GJzcTC33e8rsNYu07ic4T5/5Og1sFWypSogTyo7M8iiGqBYuH1h5xt38Bt+vHwgOdCmkpSzQeyH
	Px9nIX9a04SOGeJdfjSEWTsSWflTR+w==
X-Gm-Gg: AR+sD13hbbS1qnaBOS08oGu3vVvRHURj2a1otVsCSqC9whuWaNvh6PIa2DmjOcXd1fw
	2DYs4R/Dg3YhiC8DVXQFBha6CkUNJ9js1BH01C2i4Sz1WCCfEjjqB2d2FJUQmcE5SXVz8JT+rO0
	8k/PQMzXh9qoz9xhMixlF4hfqPg/wTX2xx5f1k14FVnB4QHRUNRN0abe1G6wCEPtK0vKEfT/0xp
	70jy0bBqsOyqYz299AZ/50QLeBJgm+nP0XKHpytoNlt1bTAQzunMvx0teZk5NMW7M/kC/XssY1r
	NwdVgva71y6AZfJ+AykXgVLz1ogSkC2QHbefZXvDb1IWQTHL8+Cljw==
X-Received: by 2002:a17:906:ba8f:b0:c1c:3b06:ed03 with SMTP id
 a640c23a62f3a-c24920e2f93mr3477526066b.23.1787675557738; Tue, 25 Aug 2026
 09:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-2-659cc4724d57@oldschoolsolutions.biz>
In-Reply-To: <20260825-blackrock-audio-v2-2-659cc4724d57@oldschoolsolutions.biz>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 25 Aug 2026 18:32:01 +0200
X-Gm-Features: AcwNN1WYzseF4DrN8CujPdJzCtFKwid82ijQDptCX4tlvVoNAotzNxH91_O73SQ
Message-ID: <CA+kEDGHSZmkch4Hs=U8ry7P0FzvE6gNC=sqQZ7noiy=T-rY16g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Enable 4-lane DP altmode
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 ao=C3=BBt 2026 =C3=A0 16:07, Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> a =C3=A9crit :
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Allow up to 4 lanes for the DisplayPort links on the USB-C ports and
> the mini-DP connector. Add the standard link-frequencies and move
> data-lanes to the out endpoints where required by the current bindings.
>
> Also enable mode-switch on the QMP combo PHYs so that altmode events
> can reach them.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 13 +++++++++=
----
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                    |  4 ++++
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/=
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> index ac22f44020a64..f5140d3985503 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -563,7 +563,9 @@ &mdss0_dp0 {
>  };
>
>  &mdss0_dp0_out {
> -       data-lanes =3D <0 1>;
> +       data-lanes =3D <0 1 2 3>;
> +
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
>         remote-endpoint =3D <&usb_0_qmpphy_dp_in>;
>  };
>
> @@ -572,19 +574,22 @@ &mdss0_dp1 {
>  };
>
>  &mdss0_dp1_out {
> -       data-lanes =3D <0 1>;
> +       data-lanes =3D <0 1 2 3>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +
>         remote-endpoint =3D <&usb_1_qmpphy_dp_in>;
>  };
>
>  &mdss0_dp2 {
>         compatible =3D "qcom,sc8280xp-dp";
>
> -       data-lanes =3D <0 1 2 3>;
> -
>         status =3D "okay";
>  };
>
>  &mdss0_dp2_out {
> +       data-lanes =3D <0 1 2 3>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +
>         remote-endpoint =3D <&dp1_connector_in>;
>  };
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index baca36b151853..1c8836c1aae63 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3692,6 +3692,8 @@ usb_0_qmpphy: phy@88eb000 {
>                         #clock-cells =3D <1>;
>                         #phy-cells =3D <1>;
>
> +                       mode-switch;
> +
>                         status =3D "disabled";
>
>                         ports {
> @@ -3807,6 +3809,8 @@ usb_1_qmpphy: phy@8903000 {
>                         #clock-cells =3D <1>;
>                         #phy-cells =3D <1>;
>
> +                       mode-switch;
> +

As you've moved this common definition to sc8280xp.dtsi, should you
also update the x13s and arcata devicetrees to remove the now
duplicated mode-switch for both usb_0_qmpphy and usb_1_qmpphy?

Thank you,
J=C3=A9r=C3=B4me

>                         status =3D "disabled";
>
>                         ports {
>
> --
> 2.53.0
