Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018404;
	b=cVDZQFfIi8taHe/LuD8XD+2CqOiOt/4Nzjm4PQEp4przoBBhaEpQT4Qdxgji7AJIoztm
	 UPOWC/gNc8GJ+/X5mOWj6P7gAWIl4D8hhVB0oaESNyz+RXRcEQ9VwIYlqBLWxhJDN87+j
	 zPT4u0MTYWpLoEfl37B91lxXj6oJ4vaf0a7KPZyeLEgtk5v0GhPrsBDREhd3TfuCW1A7l
	 4PxPr7D21u9eWLJc1aEjOns7An/pAmrEjobYe4QEthT+e5voqff/K+nJ2igYbEcZF3p99
	 FFz43rkmxGyW8NDT6oLhR55JVyIZI6KryNpPLToAfoqULg1DqjIysXJwGsI5u7z7Sag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
	b=ItRNV92GQCoYER6keIt9K2ct4vFGQChpwmU37tGp60CjOmWbvCXoxoqMaMbOH+eKI05n
	 SKDZHFDgM2Q8Lvs2w9WaYTGGHTsIledEGqZ4Vl0lNCoLN7CQ1HvjkM3hUfsKaf3eBG57H
	 F2Tk6BPMuTwOQIaE/i51/nQ7CWVhtTdOHlH0URn8nlGDO7qXwOp0JSstkgjZXM39hw42R
	 yEDWpw8Q6gLCQHtftTLW0J1LB6ufU6Jd/dFedHrKuKqU6ZqF0uNueytGc0HU1mtPTqvJd
	 urosCie1xIC8r3APOVpJSscIIBPuSgpKhDy+Inbek6IGuE2FQpLGxdtzPZy3hjd5BnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FV0bltX0;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A643606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 16:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A643606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FV0bltX0
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso1047116a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018401; x=1795623201; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
        b=FV0bltX0oekj6/9f3wa9B0/l8zl9COMFFyQ5EAruEn6+3u8/cdTM5/fAof+ws1va0+
         9V7ZDTR58f1agBhb7jH2ZL23CYfYjNxO9GWe5UnzWp/TDmnnGY2nLr8Kic0Ewgy0cvoj
         0YFwCl6ZFhMviqdtHWJ7uNUE7iVBQ9qja0BQtawatKhVTmELVv/qTlkkbMn7FFPzE7+t
         eXoRoWgCAjRLWh80ANeC3KOnPoeMh687hvXa8XsLwshJmADDY3F0N9ej++7BVjTBWgni
         JzCzrJrBRgmsz6I5zgmhaUZ9e6xoF5WOnjD/Gel1Oxr/msrr91dJmbK9CBW/d0LiXQ9B
         CBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018401; x=1795623201;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
        b=uZ/XgD7xZ9Qqwy9hyfGsnDO0Z32RrJw1uzL330yvFM3jgMzl5Ui+LE78mK/Gc3Bk+M
         1Otzn04FTsXwcRLB8M5M2/bYSdRbxjPIRPBjfWmC6jvXMzWIMx6uV4X1mcewNzb77OxD
         qrxqJOIeJMH+q+q1PZIqzKY/dOZrw3j04Aw61SEW4ky5FfoD0Bu5FXKW/GD/uj5JtDUf
         z3Yauamf7isJAuXNEQZLlucoSTVQJEHS/ioiWW5/i20zW6Hi5gXWP2lYx9R6mP1/qQN1
         Iy3UyHYuKaRj3W+aMApsx9wEX5EOZUPqV5b39z1yGSzoxWB4IsTyENQR8WwJM13G73qk
         HM0A==
X-Gm-Message-State: APuU4Z/A44okRCAnt4pYRCHOKnDRj4oeyMRvbgb4Q7LqhX4D5TyWPpWh
	rP96a9lDNpjFSJ9AtKbz1gpWD0EKJm7WY3Z7yanOkVtphDigz0KQnfWkccKwq0CkrwU=
X-Gm-Gg: AYBFou1kBckbFAiKYVqzsBb+xr8dhZk3+WFkHCcyAG5dQ7GLet9TP0iR+9gzJ7luATr
	HtOVacX3TM5O4jnigcsqFXmPi0/ZEFEpc+T6bgR/2SYuXT0xNkvf1IMoIOpZ7jyVLldMFllErtO
	0b1+zqZWXluruXtyFoeGDcE4IQmhPdRyZZ1+l4wHfsvsMEQa43vHTrz8+Y4YiT/CIaDttNj8RrX
	qBnayjbX+oHZYnaweIkigfqsyIZYpGq8ZAGU3AiWYT76Oz46/3zvrn5MvP7neynjVp6kD1hkPl6
	CLlyhaGvUoJ6Ev7XMO35m5fDtBhZAWB7Yy/09ryk5hkbZuD/mLpV48r/Nh3V/6g7bBF6TpVLd+v
	UC7PJUP06DiT3OHg6xPxcwXvZzObsM3DwqrEaXbokvcvj7tykMl0zFMIdhw81+4yKw73RWCZqEz
	zjT35yoh1Wn0WGjWM3HQOfRs+dwzQr3Q0PO4ISMB0bY9MMAr5cp0UitHionaHxDsGJq8XpT+fmE
	3Sm2hsCwGYIYWgnPLBjQyqVjkKQrVQJlorMY7RrGl8XvFmOuuaDbyU4RMoB2W9lwMFSFXS27+bU
	s7rcLBa9IBDkVWtQVDgA8dmlJkJvpT8zGlxZsAH83iNJu00Dkm2z/zmPezx3jbiqPcyNCEbytA=
	=
X-Received: by 2002:a05:6402:693:b0:6b7:5712:f13e with SMTP id 4fb4d7f45d1cf-6b887e9a998mr2171788a12.21.1795018401363;
        Wed, 18 Nov 2026 08:13:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a6fc230sm1256698a12.36.2026.11.18.08.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:13:21 -0800 (PST)
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
Date: Wed, 18 Nov 2026 17:13:20 +0100
Message-Id: <DMYGX16XPQEY.PD4MUZN1IINL@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:58 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Worth noting, that all upstream dts files that use qcom,wcnss-wlan
(apart from msm8974.dtsi which is getting updated in this series) are
already using IRQ_TYPE_LEVEL_HIGH, so this should not change behavior
for any other SoC.

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>  	int ret;
> =20
> -	ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -			  IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +	ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +			  "wcn36xx_tx", wcn);
>  	if (ret) {
>  		wcn36xx_err("failed to alloc tx irq\n");
>  		goto out_err;
>  	}
> =20
> -	ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGGER_HIG=
H,
> +	ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>  			  "wcn36xx_rx", wcn);
>  	if (ret) {
>  		wcn36xx_err("failed to alloc rx irq\n");


