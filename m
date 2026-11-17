Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917473;
	b=3U24zg1tuJDotqO5gQRHjyrVI8WA0b85tMogkPOeYqP0fBTejOrwgcJH2NvDie7+iu5c
	 vhNfmTcT+bnI7CZxuhY+gALBFKVdIlkhf912yUm+GEwE/y2NKxXT8AlJKbh18Mfh7OtI9
	 WpHaHXTMo4mI+msKvTaaj5qonprR5MdbqojpG7MDuMz/ER/CraI4jkz4iUrcdQfMkJ+wA
	 h9/74xVZjZFQtwUgDAnTHU5mQhcximdp/f62E9AgpOH+ggZZNd9YkWWuXYLHn6wVnG0Wa
	 vUJ9yqcCObWkEqHhP1aJjGgG+nE/6IOxu+QVs6C+utyGdMkTFOhrNUacnCm61+H38VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
	b=1yVusLqQpkPyQ3lAV24+dC3I0fvf4y2nLyv/v4Bfr5LKur+CA+8mPCQ4K/weIUdrKGCM
	 0Wl8JEXgGTf3gfPfyr8spQiMDTeMvOCXKzfi5zqpZbI+Efdn0KIr/AtWVgul+4z8IU37Y
	 hbQsP5Q8vYfVSueA4NCs38zsEtY8Y49G9h3W0d0HUFATR7rLkzRuGSL14v0tw+skObE26
	 gSeZccC2r096c0FfuLpF8FK4MTzzc3/wIXz4o66dfCNDs0Uc7igfAENiXQla5/j6AU+N5
	 al/bRkQ5LJjC05Eaco28tg9jLKQ+0mWZah2T2v624KYwnbKalZ4e0TagEcMNOfSeKiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7840D606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7840D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=03gGhD1o
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50cc7540b7so368564266b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917472; x=1795522272; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=03gGhD1oXvzdNQ6GMOGFyWvweh+BeNUIH1kjQoSj5t5WVt6fEShCorX5Ah2vxim8jl
         HZaxxotQyQi12H9UafUZsOniourPI+skSJUdnXsxuxLgXXTgKNDvqDylE6HEaWDIL6/L
         FYZ2ES5zcAVUbYujkR8v6B5sdVmJR7LNi+9jbHBYjytKkGzh2eVmTI2hmUlmXjMlN7aN
         4uVGgaJb0pn1E7+Kn//5pEJi3l1fvxcASfG87z7AjBqx2uiS2WbdDl/+d1o5mro4aMv7
         sOR9ro+k/qlVfbs9479IMojiXwNER+sdygJQwu8tMzKsAsNf231XkXmmq1u6qrDUGtgP
         f/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917472; x=1795522272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWtgHE8VVeVY+BSW9SOQbCd+UmjyRbtL0IM9idnQATQ=;
        b=VgeujyHvdqu4Eo/8I5drR5u8hGAlppQsB81W9M5k1r9OrdepdweJIpln/DtpLpyPgo
         oUk4QoFdRpRrk2XNTasObRMzDQStWI0EKQTUBtCNIiiGfLt422tl0c6SUoucW9bp1l2r
         3h9YdSNYZZGs3Tv45N9j1qbCYcV1+AeFEC8Gs/GP+eUOFtYYimJQMYgAh7I+9U3TUx3e
         YYDCXRlfGKMVaLOxDqjLEDVpNrlkXkrKCflxOUxpn50TIFxkBvkYXC5tjoKcWfpgsFEB
         /Sixg9fYw0WwEam7dt8PE9zXTH/YJbY/QgIYszJPu3pseKq64BQPH8ODtny8AtSlZtrB
         uZyQ==
X-Forwarded-Encrypted: i=1; AL+hErHO9fejAdk0RS5O4ZaA13x4FENhJjJpccRWMGpzSoW5ysbFJWQpGbQIwvk0RIGAhMua8WMSd1G09jeCdLPT@vger.kernel.org
X-Gm-Message-State: APuU4Z/FqJ23hjJHd50ROEVaTeeHvnjTNHJTieMHvdcYNac9kUrKiEi+
	xKz0VTGRWA1SCb5Cch3iRVLjP+PZMP3aWTHPeaB14i8RLlO9epbPj7kNAa/AkzOHfKI=
X-Gm-Gg: AYBFou1JAu9g6EXL5+bRMAewC2n8JUWOSXyulctyTSU/zQBvCVzdoxgWKmloTOP0/ew
	VAXXmZiNDTq73ciu6ymDl/VsEczPLgbsTZTf64NDMUDq9elZHyDu+cTKipSui7A+TOmnhKa/FHz
	PjAjoVEmU4jCOjH6yY/fJCgxhlTmAwXkXWcZ6NeYKAZiY9HZ7qxaTu1UdM+4d6A9kLARypCa+Ki
	+q0Rpjx9Xo7eBGopt31F2I+EbHLG2xxa8a9WxjxRdyJ5b0DltmrSDEsGr+kSe2OYCyK8b25pG40
	gx5aTci0NmZDeu/4Fdz0/DGrqMjjIslri7enW8X8QiP2A3a7eSK7eVJYX7V21W5GQpWcLj39w0y
	wJxe8j/I0bE95n5z/aruf/xyNRYOalrSAXnRI4vsJOycgPuWX2xCm1NqiCb1BWSmGwYZQeGa5LB
	uumvwLI+lQXOEKmJTVP5V9KaEXwCmRjhuDC2eFbY6EwQTIWi7AbanA0VfXLFfIkVUvWWTIcvtxM
	wARS2/bg/8CPULLsR3Swf0gfDqIYRpVpZNo4SVkolInAY4Vm2gz1RsG0jngt2hin8CQvjYL52AM
	3u7ScixPV5BqYpPtqN8z1/kPwwabOLgCFntY4DPyvIw7x0MBcpJyv9JgiFUL19PKmjqZoQQ2Hhn
	5wuc3ASz5t7NLce+y0/g=
X-Received: by 2002:a17:907:1b06:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c509633f436mr1276035066b.21.1794917471802;
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c00fsm532002066b.3.2026.11.17.04.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:11:11 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:11:10 +0100
Message-Id: <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable
 remaining i2c busses
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
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts   | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index b19e76b3c1a75..08647584af0ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -438,6 +438,13 @@ &gpi_dma1 {
>  	status =3D "okay";
>  };
> =20
> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";

If you resend, add a newline before 'status', also with i2c10

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +
> +	/* PN553 NFC @ 28 */
> +};
> +
>  &i2c8 {
>  	clock-frequency =3D <400000>;
>  	status =3D "okay";
> @@ -455,6 +462,17 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&i2c10 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* SMB1395 PMIC @ 34 and 35 */
> +	/* AW882xx amplifier @ 34 */
> +	/* Foursemi FS16xx amplifier @ 35 */
> +	/* FSA4480 Analog Audio Switch @ 42 */
> +};
> +
>  &ipa {
>  	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> =20


