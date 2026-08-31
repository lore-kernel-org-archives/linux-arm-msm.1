Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2046AF2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200216; cv=none; b=Frhnc8DF16IOzvUvQualOgd3e95e2dv/R7FMSMpap4rJoLVLNUh7/AKF2cWlnbopqfO6EdgR/ekusc+07reKYZkmqpPSxMZc2gNq/m4bZUj9P0DAXKwjyBP6IS29yDzam5bzHO/l8xEWXMANrwPZt84KlElhH1+WWU8y9m8tx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200216; c=relaxed/simple;
	bh=xbw4b8lag8MyTeGZcrb5hN4Ez5F8B1eouB6Ym16ffLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbIzhlsDyhmSsp1B1zrGPk05H0CTDzhMhurs46rZwpapu9ulyyTjp+ujjjpZR+tgDhrxFXt1Ci5mOpohiqgUwW8Y4RIk3rRqLI2pDvKSHksp8gqq7z9y99HEzEnkRe5jZJgPbqUOnh8mRoslFai2QBjWSpXCpC86szIrk/Omm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n2JpxHYG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n2JpxHYG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a5f1d0af69so6025734a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200213; x=1788805013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QU1kfWJYR+xjkRuN6RGZEPHu4Juq/92TUoclvitOE8=;
        b=n2JpxHYGcBHZ3sgErlrlUur9VKt9/VUk+nzs9K4dq9NACpUKeiq0v3AeYS7wcpcrjg
         a/F9ErbUQWsdA+Xln5EBXrSYy5ZQ2qXXRcRRzppUeynCS6N856Xf73nR8kU0oDULLCV7
         X6BVnjuMOoDjY2xKM7KHp7t+RVXUrYCafPx4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200213; x=1788805013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QU1kfWJYR+xjkRuN6RGZEPHu4Juq/92TUoclvitOE8=;
        b=DqnYjHosI2GzGmNJXxoNNY5YedCRkLz5wmx0l5WVgfTBl9tftFF1zAAKnRNCN2NRYu
         ZKxx8bdPYSe1WEJrN23cPOqytOQuIMapAPFOKcfI7O4MNGy1HQYJ6MXR54ElvHITZ1Km
         RKlrxloZ5eeac9vLuNQO9glXLLKk/Nz6bnWG02QBZk+szDJwuJA5wNl3gec6y4DWM5l2
         RElX8PYmNSOjuGjha/D1dsz+uP2VXv3IJrvQD0uA/FZlzxdvgWxI7MZ8ShgRufTYXcQf
         e7pwxJq6Xw7IevCqxSUYCifWURsPiKJOIuGeffKYusfVRFAY8Uz28LMKmxBLxNcj3dhq
         tmpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD+oYklxIEArp0nko1C0NFBr9feLJpQVVaqvUfd74ocF2pjUkTs9+Dja+cKkX4mzDBtvzGtyM4q6dBBIs9@vger.kernel.org
X-Gm-Message-State: AFuF++nwvWlkPU+R1V9/nOQAyrsB+m/Qw9VxhhV6X+yTOWZ+cyKZrmty
	DT0y4nnmwYpMxKbv16WlA/2385+cudQxCcUFV/kx+GMBXd3SsPNDjH3zFxHXM3PUvv8wkVVdH2l
	JQBbKqhBt
X-Gm-Gg: AYBFou2Kgbd7ljySIUc26ZinhWXhjTBhxzY2/6QoJ1yxZSZxi4S5uNT4b3mhilU4qAp
	SKFQRvu9XZ3vrpFaQTcQq7i49OZKUh/orIxt0IhwdRL+RqPLJyMtsYZJa5C/US2jPvV0F1R/l0U
	sIf1BDXTPetbfPx2Se/9zlx3rJGOTY0ceN0X1dBepHr4tj3yzx8hSMSeZtWXRe1U3uXILiRvopi
	VgsLH+FEkBUKjc1EAvokwvq/VpDN2NP8ntocr0YzS0LP4cbw5bMWvAjN33hCIAqQN1rI1+RQVpd
	jwXPYrPmNbMUJmy9CXGR76JH/ULY3Jb0/m0eqmoE/L2IghGJeOpr2YGBZuggf83mNtGhHookEZW
	9fb6sPT6lN2qLFD7BGGjGgnVMw+StT4Z0IHaAJ0Fmc8on13r/JddO3WiBnsH3lTL0GBDRWg1YME
	ChUcnZuf5vHVJYLBGnLAuIAsyQJ6TpGF7FmWKHg+E4CxhUAJdIL9yf99GqNYyUYgDBgvlf9Uo9C
	KMsC1jRgPz15TS6ZYoA+qlyucA=
X-Received: by 2002:a05:6402:5111:b0:6a6:32f5:ff3e with SMTP id 4fb4d7f45d1cf-6a632f6015dmr9097413a12.18.1788200213199;
        Mon, 31 Aug 2026 11:16:53 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b675d1sm4068727a12.9.2026.08.31.11.16.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:16:52 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so29973365e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZa9kqtYq9N3hfT7j1KZ5zsp0Lj5yiIuKfaBZete7/uZ0dmzYMsrglZ089InmtD5lGlWjBrPgDdMl74qA4@vger.kernel.org
X-Received: by 2002:a05:600c:621a:b0:49c:dc12:2ab0 with SMTP id
 5b1f17b1804b1-49cdc122ac8mr48333075e9.11.1788200210130; Mon, 31 Aug 2026
 11:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-1-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-1-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:16:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VaDEWktsK5vNWJY0txA+YJZcjha-VPhmKQX=XS5pF+mg@mail.gmail.com>
X-Gm-Features: AcwNN1VV28U2KlLG_KwlvZN_vPKUX9__aF5EBSUQ4pSV3pF_j6BfJodMLb9TnQI
Message-ID: <CAD=FV=VaDEWktsK5vNWJY0txA+YJZcjha-VPhmKQX=XS5pF+mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> When freeing an interrupt requested via request_nmi(), __cleanup_nmi()
> currently tears down the NMI and frees the irqaction structure without
> waiting for in-flight instances of the handler on other CPUs to complete,
> which can lead to use-after-free conditions on module unload.
>
> Because NMIs cannot acquire desc->lock or set IRQD_IRQ_INPROGRESS without
> risking deadlocks, synchronizing in-flight NMIs on other CPUs during
> teardown (__synchronize_hardirq) relies on querying the hardware
> controller state via __irq_get_irqchip_state(IRQCHIP_STATE_ACTIVE).
>
> Enforce that any interrupt controller claiming NMI support via
> IRQCHIP_SUPPORTS_NMI must implement ->irq_get_irqchip_state(). In
> __cleanup_nmi(), shut down the line, call __synchronize_hardirq(desc, tru=
e)
> to wait for in-flight handlers, and only then tear down the NMI
> configuration and deactivate the interrupt domain before freeing the acti=
on
> structure.
>
> Also add a WARN(in_interrupt()) check in free_nmi() matching __free_irq()
> to prevent freeing NMIs from atomic contexts since synchronization and
> resource cleanup can sleep and spin.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)

FWIW, Sashiko's feedback [1] again seems relevant, so probably a v3 is
worthwhile.

[1] https://lore.kernel.org/all/20260829011449.87AF11F000E9@smtp.kernel.org=
/
