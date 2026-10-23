Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757127;
	b=WlFBbS+uIaIjuZj0d9Vuq93jP3qBblsWNkS05hFweQJu2WbpuQZmqKhpAqkgLNKey3GK
	 n3sfJQqxCpd0WepLvPS69K7OuoneWriqTrMVg0DpYFKtjh1sxC30M79/VjMt2Q4x7VtWj
	 OJqVzutdBJzNAMfBd1Rw/cLhB3J/8KVkLaFvJi2LVUA/LmoKkCTNCX0PuhckmUHLGRQpa
	 UfQgCx/DN6b9pl4lafHLgpfz3QOSXjzQg63LCgOW8Oh2Kr0R8PQyoR8/v4mKWjbTO2I/W
	 vFgF8PBNitpGsY6e5R62Vt7hAoQhQncDBLmcd+abkr97+k+4FcYrFI7jBLqt50SHK4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
	b=z4kIrlFFnP3Aji+UoOAfIVj+3LLG73YtzhT7TMndPqh/fbinTRNPegSIwORWusiSew0N
	 t9B5bIUmhTlODHoUNTAbFxWBLSOHdIauN5EXGJuNXFf2YR1FdzmnG5Qkj7dbz+eOiXE7u
	 HD5Hmv1qwYRVwe+LOUh7cx1oaLyfb6JkllDY5juSaggy4Hil6rqtF8rhpE3O/80aN9Xa+
	 zCJW8onvbFnI3lqcRD7bPWBhE4g6dsEoeO8ZYzs1pkxeOiwZVowQPCeVo5bOUFHRxFb8b
	 qfW3t52nkK4SaS+hQ0sUwxD2kKJUGGCZ6f4yD1e/Xk6LUG22seGpd1XYdxqJ7Evgffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="k1/9Upg9";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A9606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9A9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=k1/9Upg9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso8706665e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792757125; x=1793361925; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
        b=k1/9Upg9OMvsI0X2Fuy/4v0AkHqITUFT5daTMELi4Zwjw72wGWcz0z9FO2Va9/UV/R
         +Ddwew7njKOL33BXKFygaXgek1OeO8qXu/pSMmBfhBlCWHBshfFos1M4mFvkGELkrWiY
         SaO2feErS/9QyPuqKTrswnqiKm2DBJf/Qb/QRrilYyBvI142O0hiR9w+u9xPa/bYz+ur
         ZbdorFMzHoK91jfZSgLS58P0HXQ1CFCKhpMo2DMzZyfuBsO1AmGpopssAuy+U1q6sEiw
         akhv/JdsMJY6oFQjZf9YPcpLZzZ9pSn2XjyKDTRciY+ZJv/C5b4LXaakuSh1fyb1j1vO
         ehzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757125; x=1793361925;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
        b=sUwGP4rjjOV1nMvh5mS4fWqOyDe4vgOx4OcOUTRyA3UruZLblvxTc7ap8hRmuzWlxK
         HdZ7F2PTH2TwdbxMMZ51AWNE2xtwsVSlJZtsEqru7t3dvBJvbQh+ulFnIgu0Rg5Do0jG
         W3A2eML8C6hU6NSNIEvrK1KJMJ1M8vzJnVnoyAbEBM/G9ZVJCbBMMtReXCHJoZFGRSUT
         IRRnoJwiORCIxUpUdl7A8PfjTX06EwL3mpEb4GBcvC3GmQdo03zHKjANOo2OL3tewnUv
         aqNar3l4VykktkezhJ48x2Q6Zx5GEup5b0nGTw8j4NUh5vfbRBK7M7Lnf8FhEpIHon8A
         TEoA==
X-Forwarded-Encrypted: i=1; AKwUvBx/x9+5RJHjxODN2ORLpefZhIGdDNcs+EqNpPnLesBzUjsLtZicH9MJ5RSvYfZ58h2gUGNoge7ibZpWB4se@vger.kernel.org
X-Gm-Message-State: AFq9FYLYZX0OVHOg4Ynf6W0sVGXQW1uZiO7v4/MKuZ5LyAPU8pOgXy8M
	JdxCP0byrSTXKMJBk92KUV3gi/75dYZanf98O+10pTzegYvNnD23UorUQ3iGTwgG4rI=
X-Gm-Gg: AYBFou3jIjpshdtyhcYftkN462effk2I/J19QQRkDt/pR4l6Z5Gfx8KsjZdq5066AN9
	f6wBs/m1qHH1SO1ddmz9JpeH5CE/vtt3M14NWY5hAl4ZrIXr9WJBTUbzF2Fio02UWGiA7PwxJQe
	LOeqr/dgZgdRRWrUfh8S49JKrehUGfTnXmvjsdVBRNxykqQhKCQ2tRV7dRcXh76ywXR9NAGB04h
	2RywrU3XNbGQmd5WTi6PHanCdeqm5+WyhCob9hUHL8GHuEjQwc4L+UJQFaCDED0A9ZOy1c88d6S
	MgC6QaUKkRSk88zmvigwg0+XIcJwv8PBubDY/mCZn6XwMDxDX1dC1VwoCV4fdnP4BRQ+V0N2reA
	ASHSbfGVknempaiLp/es3hnoHuIZ0k75+9Z60d/VJhm4FR7f3uYnyiBiRzmJQfOPM7tWPQjChL+
	9SV5L9VzsMj6GFnXA+EzLNDEMOwz0YxUWbWKKj3S7ruvj0IccAQ8goc300CWnm3CI/E6Xqsttw9
	AGCOunGBWrjUr1EG4j1rQBa9Go00ybjJSLv8rqoO6b0xgTSGTVZdKGggQ==
X-Received: by 2002:a05:600c:1c08:b0:4a2:16c0:f4f with SMTP id 5b1f17b1804b1-4a216c010e4mr22298145e9.30.1792757124684;
        Fri, 23 Oct 2026 05:05:24 -0700 (PDT)
Received: from localhost ([93.123.20.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21544dc5csm28563925e9.3.2026.10.23.05.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:05:23 -0700 (PDT)
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
Date: Fri, 23 Oct 2026 17:35:06 +0530
Message-Id: <DMC7CT2C3AZ5.2SEL62SMKTXEQ@fairphone.com>
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
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>

(re-posting my mail from Sep 28 because apparently I forgot Reply-all)

On Sat Sep 26, 2026 at 7:30 PM IST, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 79aa2521aed40..0ef3e9e239786 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,7 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -54,6 +55,22 @@ touch_en_vreg: touch-en-regulator {
> =20
>  		vin-supply =3D <&pm6350_l6>;
>  	};
> +
> +	reserved-memory {

r (reserved-memory) < t (touch-en-regulator)

But it'd probably make more sense to actually rename touch-en-regulator
to regulator-touch-en (to keep any future fixed-regulator sorted
together as well), then the current sorting makes sense. Maybe add this
as a patch before this one?

With that fixed:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +		/*
> +		 * The rmtfs memory region in downstream is 'dynamically allocated'
> +		 * but given the same address every time. Hard code it as this address=
 is
> +		 * where the modem firmware expects it to be.
> +		 */
> +		rmtfs@fe901000 {
> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xfe901000 0x0 0x280000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> +		};
> +	};
>  };
> =20
>  &apps_rsc {


