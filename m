Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476540;
	b=ig6mjjtNaxbQRLlUOVy1wXv1EALWQEZa1YyG9uXB2SBa5s1Rv2F70Ghg4fPTue6Yq+wB
	 6Ap/GjcJMnllaM9EhVe74PzylJCZU8BvuKztZ5wncPbnHjVAGUpdNMNblCSnyySwVvfYv
	 RmezkrG+6WOKFtFPxt9DIqizFkaY47PykfZySxL6wd7PfpgHBwH/K80zHGn4dKANhWscn
	 E44Jn0rVgdUqVztFXi384k8T+eL+6J955QK2BW+pzbXt+0JIYdZq7/sIsGQpRAbf/cNUL
	 wOeonzAoUR0tKIvbUngsDofkA76zt4p2+0q7myiawAxWsYW1RfpUUPCCGoJM1B13G+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rpYvPmxHqeKMEWXcXjP8ETFzglI6N3DO0hpa9d/C1iQ=;
	b=citdMNZL0HsQi83QbhCvZ3X1dXvclk/3skLZ/B9KZzNvCBZ3AwZ+4ACKh/XqomZ7LKFs
	 7PQH4sXX/eXPFEqICNY06mBk5LYnAYzVX/R6VtbIRJ8MW2VqZhJCHs94pHlLzExCz7cgN
	 KwJ3xVlbLtR5feZA9F3CO+3GJ2wj+GPLAk3n736BB82o8boHATQH9W55Jtwo+zs+MJhVX
	 NskBrlF+xF3ADjflvj7gE7Dthq0+Ujti61QuH5Xjis8rdn3PTByLiICfCq3t8Bh1cWSSg
	 Bp6OeKvbNLfGA6+cDKjVaLWedNUY1MX2948+eKfFzbPvDEq9zBVdIuWxFD0yRIASPTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YjnyPR7Y;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 23:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YjnyPR7Y
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so6201615a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476538; x=1796081338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rpYvPmxHqeKMEWXcXjP8ETFzglI6N3DO0hpa9d/C1iQ=;
        b=YjnyPR7YVly0s5R4EIOAOSrlZqToBo6tlCbIW7tEFfNO8XxT+kAql+AcVaCHqX8Djv
         +TPIaDD/OrWeK6+xp4GGl1PcwY2AgorPwv7WPoZCJEk3d/mwOr+hNeylYg03a9XKXtGm
         Nye6IMMtXFUt71NOxSeCwoELF4NXtW02hF57U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476538; x=1796081338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpYvPmxHqeKMEWXcXjP8ETFzglI6N3DO0hpa9d/C1iQ=;
        b=ZcPZpIpwaa8OF6pmjtgkBBVE5VxZuZjoqUZuJZsMS6+9aYc7A9N2s8CpG+352kZA7s
         W6T5T2wHl168i+NWtLOwa+UG45BZcQPyo/0gcGxgqJ0s2mllPGG+tt+DpjeV3y9zyA/R
         L4Nm4CGc59jeI0MLj5HiBwMWCaUxjorWbfyNXa180lop/bx7FX3N+GUj6sLNKZji/x3d
         djoHsfUiJEKkHU//tmF34wUt5p51ginxty3vbLWw0NJlmdIh281bDutT8tvbV+ePn8ir
         7QgZi08XJPhP3D0v6z4ptd0jCDe0k7z8XXvpLGTNJA51fP5yVnt+f2m9LLEHAoswBTgm
         x/wA==
X-Forwarded-Encrypted: i=1; AL+hErGGyoiO6C5oGe1PmSK94sUka0ohY43i28YNQ/+Lri0JhaMK4RT/sXvYYzum9HaugoZ2N/CYvEidn3OV+eaJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+jyR4ebADaWMZASl0H84H6Sz2wkg5OFXTSOlM7D0f/bVQvqfNQ
	7vYhWEEdx1lep4JwGCJgrF6q1d3YuzqQjVUGqlaXcY6WcfuLw57/rudsSJqh4GWB/pXTTKspMqq
	gQTBR5ByN
X-Gm-Gg: AZFdTZdR8dVbGn+Dp3c6jKOTswPeewZ+wJwgLIIgpAG+WIqai+RDOj4rtFAupSOz8JL
	dzTgOne+crdyt+uA7S4MhPKsPUN+D1QKsnGxVDiwfZf1wGENKHrG0rCYQtnafZ97nzcEa0b6fmW
	nW5SnrN2tiwWKjJkv7C6cdcmCRt9JNGWVMgtP/lyVRm+FvmuEOovQ1Uc2p7jn90ubNL62WdcDZ+
	04owzWEkwzs84qMlDr4ZzY6JjTQ5S5jc2EZynGbsexsT6VoVcx+3bMHI8+FjDwmqXB274nNMXsB
	9s8HKtQ3RkL/XQj5+MFcOYz3gJB21+UDrg0KSGc5UHEoX3gobUylEQAD3TiiWleO15h+6UOMJGR
	ZdymBm/f1/IIqiyn0LxDfPGK52Nhp1K+kIcljf5n7mQJ4vF4q1ef2jyd0phR3U441fa5Znz1d6n
	AYVmG2p6Ih/8t5dOzu7f1eFeE749q8fN0tSB4oWWkQbPxnfB+hr3sSxnPCOS5QdtPKytqFJKF81
	SBiUssJZWfyHwHnEuBGcKZnLRjFLGRmOiO+VQeN9IDT7+BtRUZA8qeWxtRo341EPq3TemqSLVsP
	nQgYLiWe8HZR+CoIkCcuWiqNbzkw/5oap17n3jX7VHeNV2uwQbqPmoBOs++t6+67LCkp
X-Received: by 2002:a05:6402:3212:b0:6b7:28f:a3ac with SMTP id 4fb4d7f45d1cf-6ba37d18d11mr8643734a12.7.1795476538243;
        Mon, 23 Nov 2026 15:28:58 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbeb0sm6062461a12.10.2026.11.23.15.28.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:57 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49412eb1474so2479795f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9zeFLqQ384TfclwgJfQiKonwf8KIGr9Fya3+TWDVGwvN/1xyca3Bvry5hN/174IwQB+QGPbzWjsHSkJNt@vger.kernel.org
X-Received: by 2002:a5d:5846:0:b0:492:e1a6:90f9 with SMTP id
 ffacd0b85a97d-4abb3c37b61mr23717515f8f.18.1795476536084; Mon, 23 Nov 2026
 15:28:56 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-5-mrungta@google.com>
In-Reply-To: <20261112031629.396819-5-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U65s1rzG=VqbRur-UdcMf=6rcjMfoXbOBtyiw1jAyPgQ@mail.gmail.com>
X-Gm-Features: Aa3M54pAb5UUWg8n7puuFK8qjUeDvkCKqsnby00WFwsuj_cqspTt6STuvC8TlBQ
Message-ID: <CAD=FV=U65s1rzG=VqbRur-UdcMf=6rcjMfoXbOBtyiw1jAyPgQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] genirq: Export NMI APIs for qcom-wdt
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A . Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:16=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, request_nmi(), free_nmi(), enable_nmi(), and disable_nmi() are
> restricted to built-in kernel code because they are not exported.
>
> Export these symbols with EXPORT_SYMBOL_FOR_MODULES() restricted to the
> qcom-wdt module so it can register and manage its pretimeout NMI when
> built as a loadable module.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 073fd3595d2c..ace4d2796382 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -852,6 +852,7 @@ void disable_nmi(unsigned int irq)
>         if (!__disable_irq_nosync(irq))
>                 __synchronize_nmi(desc, true);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(disable_nmi, "qcom-wdt");
>
>  void __enable_irq(struct irq_desc *desc)
>  {
> @@ -919,6 +920,7 @@ void enable_nmi(unsigned int irq)
>  {
>         enable_irq(irq);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(enable_nmi, "qcom-wdt");
>
>  static int set_irq_wake_real(unsigned int irq, unsigned int on)
>  {
> @@ -2189,6 +2191,7 @@ const void *free_nmi(unsigned int irq, void *dev_id=
)
>
>         return __cleanup_nmi(irq, desc);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(free_nmi, "qcom-wdt");
>
>  /**
>   * request_threaded_irq - allocate an interrupt line
> @@ -2455,6 +2458,7 @@ int request_nmi(unsigned int irq, irq_handler_t han=
dler,
>
>         return retval;
>  }
> +EXPORT_SYMBOL_FOR_MODULES(request_nmi, "qcom-wdt");

The patch is fine and I'd be fine with it landing. That being said,
looking at this patch with fresh eyes today, I think it can be
improved. :-)

I think we could make disable_nmi() and enable_nmi() simply
EXPORT_SYMBOL_GPL() and then only lock down the symbol for
request_nmi(). This means we don't need to update 3 separate places
every time we add a new watchdog driver allowed to use NMI. People
can't (properly) use the other two functions if they can't call
request_nmi() anyway, right?


-Doug
