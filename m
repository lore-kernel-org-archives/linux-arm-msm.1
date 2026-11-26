Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697373;
	b=T9rV+Xxw+NmQi/Dun4X5L6CrpZkhiOyP4/vC10/4rK4NWtVr3qOFuby5otCq+SouJuWq
	 VxYc9/Zl2ZzW38UaPkai3uYEWNeiJ3pLHmsKejH338nKrObY2FicGh+PTPesiuvl9MrvX
	 7GGbnY8RtuCwYs+pBEjkTXYqInqkpJ52rvG0rRRQm/8xOz+7QPXilM0WyqIdKCa2iNpzQ
	 NJmkspKk/FN3f655H+EmPyaehf4T3r/CTkjfkYiWliZVAemYrkNROVGcssCn8f4B0Niu5
	 Z9CuYzIrYseUxJNOYv+iRnFlH+BP6ntjN2slbeHDF873/rYUJq2CgID9giDdWFGPw+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
	b=KbgYKbTz1TeLw3h3j591IZ1frOUwxthAkNO3BFjE4gk8qiMX0DCMion8V6BzyLJ5yTvM
	 syHo95DAaDabn83ETTtd3dF4J4QJPAxjuA4GfAR+WrVWy71BzMfO62sY2Z6Jol8bIA6sG
	 sdUYbkaccCH7DI9/Co+GD/bdkfIft1Lzz341O7G6DDlmhwsULL+fNCAWPkiGQ1ecPq1TP
	 HDKu0u27ayVg5au62PpTVIUqC0ByU1+knkHNTaFRbtVMv2Jd+hPOmcvjYNOhGKE959eOo
	 vYLAS1wy1F+fX6hIyw4y493yBzjJQNpjJy8xOVuIO/BMnOvxCFpkkk+D1hmci/dhMgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvyXLUsN;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA2606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvyXLUsN
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5437388f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697371; x=1796302171; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=bvyXLUsNIqR6c+7zaBgO00QS5lwpt1s8YI+73qDqEW6pwpGMj0ZCG4Ele7FK5wO/1F
         JdRPOi5I+Fe2iOvU9908OPnaOE4MvdcMKW0PujeyKAPTN0o2kyInJs3jSZ9Xic+BULOV
         bm6WMOIz40qlEG5XsT8W48Bvt+uKsoXlQ/ezrqjetJxoFvgtGTjfgOMA1xNc+Q3wIxfb
         ycf9DbfZQstSMiueaJkccFvkEyp147oqwStk13TtdwdKbGfpGc3TDViSipTZzXAVDI2f
         upaPR2+y15YGvAFLwww3+uQWuarmTPJMp9bZANDRMXwB6953BI0WpUmF7Oy966ac19uL
         m8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697371; x=1796302171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=pMyld3BkbyGYA2IvSZZTg2s9rhy8z90tNmZQu1xNSzQuuZZAXgofUoR16flujitiMQ
         tTv+FvEt5pW4VzwfT3fL/QdvhwPbQIpXKI7TQ2sRaPYxmXGQf8t2Xdny31wIthXm3jsX
         MLNqo6XyBPxbJ4BeQXee+k3x81K7gG7ev+Nc5Cjliz6BMohrqcwra6eIJbFFTqvGioFL
         VBexJ4UT5V0QaHZ/5zDnCJrukapaTGJgHY0M2EUecJZbqEolLUtBEwR2bNHiZmMbea07
         MOde55qvl4jiYMdSZ9TVSXQ6CFFR5QQw2ObqPEp4gjgioi8FPLk2zQH4hK0qYb9fwY4P
         KMfA==
X-Forwarded-Encrypted: i=1; AL+hErG5A/MFAvUkc4cG35iZDn57zfM2OCnpAzEZlFjOaRd+vDCN2BCDoZTM1QfoPDk00chupceuQkDH7X3G1rkU@vger.kernel.org
X-Gm-Message-State: APuU4Z+SdAxmyXYD3pXU2Fgq0htJihKJzkVrDR4Z47bWs41CK+X1ed8M
	dNGlNPHsEFZU7TSo9k7sbD0x84Sw1Mg0MRel1VJPRoX9RFv0c8rzYZmR9LFSb5YoaTE=
X-Gm-Gg: AZFdTZe9HBqFI7WNrrNvVN1/KKBm8/xsPFcSyrKqpxyTPuOtDbEom2Dw8HXcVpmE+Mn
	YZi361rjh80jRbZdUcUhT33pOdgQDHxWGqpbC48IhOoR8mB6kt497YO77Z4nWW23eKmrbMBxe++
	GMD/qeT5fLHStgqBTmJYtL0m/352ZnHIMnQvRzFxLFw4GEpiG6h0pMqFosBvmjv+ut+qUj4xBhZ
	wU7PfxxaOg2kloddmMTvxXZfUg2b5vGL2O0VwWbCIpYioww232B7QUuBnvqXtkflwikOkjKzAf/
	fnWlCpA9S+kbgLIu+paheKg8l7pAPQo8ypw0nbroL8AwlVxw1/cub1qd3WY10OU44Nv+Q3Vf7fn
	/+0oOhqfTfXbFLYe90WrmcICD73tt2gDCQQ0sfzrCOEeAkcVCGNxppG15MzO+J4c8aCC3dMHwKl
	yK2qtU2AGgxyBHxHxEUTcc2ANMA6djQNhwMcjmkr/tRR8mkIW0SGZugZ3icYWePWEeKAWBqP1zq
	/9HmFI/5eAmtDlm09c9KqviM3aJe39k5ai7T2HwGgdGVmWWYsS7AiDfP3T6CCqIXqNxGKKcMuC7
	nJhRUGbuBDcMX+fyYj42S2rYlQt1vnUkNg==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr32707915f8f.53.1795697371481;
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm38969506f8f.36.2026.11.26.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Message-ID: <b1d73b2f842c8827e6a2a0ed6dcb1d0b979265b9.camel@linaro.org>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, Sven Peter
	 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Peter Griffin
	 <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, 
 "linux-usb@vger.kernel.org"	 <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org"	 <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org"	 <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>,
 "asahi@lists.linux.dev"	 <asahi@lists.linux.dev>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Nov 2026 12:49:47 +0000
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
	 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 22:59 +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>=20
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>=20
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> =C2=A0drivers/usb/dwc3/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++-------------
> =C2=A0drivers/usb/dwc3/dwc3-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
> =C2=A0drivers/usb/dwc3/dwc3-google.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-imx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> =C2=A0drivers/usb/dwc3/dwc3-qcom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/glue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A07 files changed, 27 insertions(+), 32 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
