Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575572;
	b=sA2vyQoNDhs9pjlM9xX0rJku1ujoCq0vX7er5QwmMy/TSxxVbj9sqCOxrmOQeGg82NWH
	 L7e40iSY36VAqlfRtHffcNUcyheVXv3SHmnC1AV3ZlbUNRVk0YsZ09mD611x+4di4+vdt
	 d8iDakewlgKopAumlsdE/vrIAtV947r9X7jzH6V2uALbfXczmGKyZLM9t1XRGe0s+2+nj
	 Ue9BvSb3dx+GcZ1RTdq2DDETyMwbiEIbY8WU4aOsB6u4m2GGbQ2Xp5Sg58VaPNTCVm0I6
	 SouZylUqGqFoRlwLoRW0+fMohfGGPRwew3oD8JZK2E2P8cNN9RDTT7V/Q5jGtFzX2ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575572;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=70XoP1PPly+GjGagYXdlQ+dXmkE7+Msm/jKOrxVn7O4=;
	b=JabjH7yw5+Ym0gsQ0BtOrc7+4S0VqQylEm2OgN2f0gdDBRK7tJZTXgxBj5RA1kLlntia
	 Wokak+R+Bk6c2AW8Tg2Ve9pt++Sr0u2bCFA7hsnIOk3T5t4xdBEB0bIBF+KSTk/p0MqDH
	 Zl4nn44bt6okyjz9YDvSdvD1r57GdnrM36hRc075CYDfE4dgdw5wPhjIwbFAn1XzYZik9
	 R3hjToPLywy+/mjTxh1ceg2MYKTZU2/8fV/OaJ39bw2q+OXio7qn+CEGTrVh88q+ir8xx
	 zzQOvFGDcPp17rlThI5sea7muQIKMncpLHu9k4MdE51z2xWDO/xZ0HSv2WpvQXW2uLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYrMRrXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAFF606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYrMRrXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E571F000CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575571;
	bh=70XoP1PPly+GjGagYXdlQ+dXmkE7+Msm/jKOrxVn7O4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dYrMRrXOZVPwE87XkUPFnPIL4zmTNwGQTmXPTW1tGLjj5zzr/JSEZi9/JeI5ucKDS
	 +3hxNVxIymcCknzQICkVDEGBJyq/CxOzkShV0eu9eH+67dguFCjW0XJMyy9xb25Zgh
	 8P+8LNu4JL29pzGpphMN8Dl8RxsjFJyYGdv8mylCzqyyfaA7NjutYmOSntu8NTut51
	 Ak4aQYFHnHrbuXSiK/CRqS7jdeXM2OmB89fB4UpJq4DP7Cdq7uL5gMs1Ycwj3HfcFE
	 8qulKn4mhHeVYQw7OZxua1Kaa8AsAyNrCnPLpCRIYhhAKUUJoOSjTuDtkf0UkrI3hd
	 RY/msqjehUlmA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so4460721fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhWzbhUoP72vcbSbaRVWtNqSUkLtL4qoA5wmgbLRspiZIHCSigmCRBh0rF1XlRlHijeVrRbJBr83os7xSV@vger.kernel.org
X-Gm-Message-State: AFq9FYJZIWOLJ4zoPm8h0cDlNXefC88/znMV95d98W2IgpvZC5m9oMTB
	UKg0HBEmCZRjdfT10BUYh/43YBYdEQU41+DKCBYL5gpuNz2uZYJCf1Pm6KFZhVu9tgDVPgh666j
	IrrETO5HfhvzRTzKFFEA7vH2oGSh4VQsnlbOZXBVruA==
X-Received: by 2002:a05:651c:1986:b0:3a9:f130:aaa8 with SMTP id
 38308e7fff4ca-3ac441c09e6mr4586711fa.8.1792575570271; Wed, 21 Oct 2026
 02:39:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 10:39:28 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 10:39:28 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com> <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:39:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc=to49PpyCf0Lj=07uuv0CirRcTSYbUHvHyQy0SgKe6g@mail.gmail.com>
X-Gm-Features: AclHuK8rSP_D9_qUQP4SAxDy4Yr9zguQHwEm5ilA5D5ZiTUzh7Xtkyk4UtmqBsg
Message-ID: <CAMRc=Mc=to49PpyCf0Lj=07uuv0CirRcTSYbUHvHyQy0SgKe6g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 5/5] arm64: dts: qcom: nord-ride-embedded: Add
 WCN7850 Bluetooth support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 04:29:20 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>
> The WCN7850 module on the connectivity adapter card exposes its HCI
> interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.
>
> Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
> describe the Bluetooth controller consuming the PMU outputs.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 916f583b882a..6dc405ed7ef5 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -18,6 +18,7 @@ / {
>
>  	aliases {
>  		serial0 = &uart15;
> +		serial1 = &uart17;
>  	};
>
>  	chosen {
> @@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
>  	wcn7850-pmu {
>  		compatible = "qcom,wcn7850-pmu";
>
> +		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
>  		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
>
>  		vdd-supply = <&vreg_wcn_3p3>;
> @@ -583,6 +585,23 @@ &uart15 {
>  	status = "okay";
>  };
>
> +&uart17 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		max-speed = <3200000>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	};
> +};
> +
>  &ufs_mem_hc {
>  	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
>
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
