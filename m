Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915084;
	b=bJGbgrD6rTde6X1Pb1iEM6hPX0lLUGwNYuvmpdDDCEhdrY+v1vXgR0yVc0WYIjINCeX7
	 Dl0QYXRK7HXTKqt3nPunXyy2lkWzl1B4mvQtJJL3Y4XkRn7WczdqG1lqfFF5uQDwXt0RL
	 KxdzUkR7KU6Hismr+UZBcbvu2z3qkMQyrrxZcZknrvxrR6ysf9U1dhPQz1y87BPvpmQZe
	 +VU5kXR+38ywIVdHOvxFI4SVRj2x59llutYcM0C58uHa2fHBHloziPojfG91KnDvfjwnf
	 RowKOwfVd1vkh01cmzv8uHjVSLYlrfTcgRlhFD8RJb3vIJSmCycepb0Qe0XuPUPmwTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
	b=29be4oKCv5cePEFltzQ6yuA/iXtCSKVJrlt0EkcvH33ngaLZabDe3xtWMiNvu/+uOqHM
	 nOm8xbGS2j2mFvpuYhsDiJYXxJIMqLxHBszC70CmRRQWHo/9eLna5Ph45UvFKd6LD2Ky6
	 YXwB+OcihMBMXR3Ojyl9zNan93h0/jl6UhdLF8Gn7kR4r3aFrI6x0XAaCRZfbTt2t9uY6
	 /x/JXmX9SeEMZRhjEYEzWhj5jssf19Z1czbIGy8FlqSmCkt5HBF9R6aPqtDk6cCKQA26V
	 XzzaSoKYybma7YdKD5bQ7wgbAeR9AjCuW4EkcRylCqrhRW3zFWxBFUqAQ0Y335IU8ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE7606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25AE7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40f29667e6so795861266b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794915081; x=1795519881; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=m8IY2WoyLPfitWWglS6wqI0ATW3+TpbTj9ibHg8nvn1/DrViKj9QNxHqEYqIRERZ6F
         Na+e3jdV/rVSS7ALdanwyCzuGzZMhejKsuMydwP3XJOnpEbcc+xXa3/9+apBe6B1fg5h
         2iQKAF0w4njd1P7NsCgck4NNFKfkXExe6AZDyOVw1TUYD2WyHFbAPW3+D4/kMjokiOT7
         dxU3ryPxLIHk4mx7uofmiAXMiGS+qWMD29OWpTpQ5WOWCCX8Op/qJbTPkfTkC1kkgTmX
         RfVSoXsgINXsUIVSdH0RXqA6RxIHK/tWBUitp0NFP+nnnn1+OPuPqeuomXE8YN2MV1/R
         GFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915081; x=1795519881;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=A6aVY2PR9vU2S1REeQBeE6VG6P/4zATGDzGrONztJZo79add8lydd/SN+jT4v0aFT1
         +CHb8ORcEiKLE8FnpF2+8JiaMXlo63Tlbuy61JoUB6xz+sNusWz4iO6O7UgM6+wxti0I
         MEx2f0VfWQR8t5qXHiF4gWsA6DJ+dHiqTm4U9W930ES+XzCVzQk/67yDtfZ0e8CMZX6d
         8oEjUACqUp9NO9EYWABOklCmeLO3gAVlymIorKRI++S2vlux5LzbyjAZvmQkA1od3Fp8
         7WN6UR0rG0Hfpl9QPhnsg8GMkgRkga/9DUYRwDNhXRNVNRJzUhX6p1w5d/2aZH1e05SI
         1tIQ==
X-Forwarded-Encrypted: i=1; AL+hErEhhf01FFMjdX44KOPuHq1VX6Mf/Jk3M0zPvKW8ZGs6ZF26QmgpEzA6ImvOD8byA/7DDH+BU8ACcqdA970Z@vger.kernel.org
X-Gm-Message-State: APuU4Z8NzNUBr/oa1zV/96rwju0zKGa2P/KO5mDcQbsgW07NjJ+pM7G1
	RlbzAulKN7UCHj/Zd+BUc++ZUtHrCwjCHzZMCspJl8uNl54OFejsJpMTV7CQgh9Pchg=
X-Gm-Gg: AYBFou2wn9G28yZ4+EHfJpZADMxUs0JTK/Q+29AU3oaNZycYXXg67T19YJk9Z5EN9cn
	x3+bSOk2WE/V0zmypfqtEGm4aHeOGXFjEQfZTL2BwIYwaad5DRK5WLvssSLGkimpnNr/eeTuucm
	3tqlI0cjl79cgJEjvgZIICyYzmrZI1vGfS3Gl8MrtnkVDH3FNxqWrM5An8k18dGVhbcuj2OVirX
	GqGUYA/tm/XBLJXk5lEthbwwk81hP9bwufkWCBTNMxaYoqMc9Og4ItX/tbdVSmypmtERkS3Im3m
	MfAvmniJ4kSaTr8Y9rkkA4yTjUv+WeC89MHOaGtUqVfgtYdHlK8C3FShcza3+jo4y9DDYSmb9Fy
	sCUhX1cLz3ze2YhTuvioymzaeGiI6flmk0KTog9XLHGjBfmgxsx1RS+ENW9AcRAtTt9PVnOXFHs
	tCivIDjTIBbqWk1lGgPECY9cFcwA9zv+6pJSsLCK5vEfohvrxEHCqzIDTomv+z2vL8UIS9JQYlF
	epsVK9mDJnoEPhFHZNzkn8XQe4hIF2FYrgAD561eHh3+wA2xc7ykZ7gn5qpQEgExXquwYZaqb0E
	SGkBDu5U/KB4rcRX+fyz8RDb+Gih6SCd1uKmSp7Tiajpkt7I+icIdgLNZskkZRRF8+KiJvoW+w=
	=
X-Received: by 2002:a17:906:dc89:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c509642fa78mr1153445566b.38.1794915081033;
        Tue, 17 Nov 2026 03:31:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79146sm519632666b.68.2026.11.17.03.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:31:20 -0800 (PST)
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
Date: Tue, 17 Nov 2026 12:31:19 +0100
Message-Id: <DMXGAKCZ1Y9L.3IO6O895BMH6@fairphone.com>
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
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index a393b7533ccbf..e8808865bf6fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -68,6 +68,12 @@ memory@fe901000 {
>  	};
>  };
> =20
> +&adsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/adsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible =3D "qcom,pm6350-rpmh-regulators";
> @@ -291,6 +297,12 @@ pm6150l_bob: bob {
>  	};
>  };
> =20
> +&cdsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &gpi_dma0 {
>  	status =3D "okay";
>  };
> @@ -316,6 +328,18 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&mpss {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/modem.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &pm6150l_flash {
>  	status =3D "okay";
> =20


