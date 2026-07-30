Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343E3C0621
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448189; cv=none; b=AUgRUsh/TT20OnkW/LPzSGOnMI4SjNM6gB4B9LttMEs/4KJbq2gNtDY47B+H3uvjpHJHrSzWjP/QlR5tK7PKrx0WqYQlYVexDbXIvkx5MNEtf9ggGHUpPa9Pi6rhLKHVm+NXVF46RinPHN3THyM6m548DvKmNdE0FMZp4X7qAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448189; c=relaxed/simple;
	bh=lx0FGf5TmIOgBSRTo5B2LdRy2tEopY15uCgKfmlb5gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZQBJsOlbQrZ0ZsvFAhsjtCK/L2fxQv8WDz3JmIpmZR/INz2yXp8Qr/n3QNvfAAaW8EFhSNwuSk91jLRx+GT5F4nsKifI7l54Re9lsZ5Nb7jk1AZ8yw1BlysWmzkuh7vdytmEFCtnUkhX4wBEnITjEPM4iqOLldMRG/VDytQ36c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aMaQIOkF; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aMaQIOkF"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfdbc68bbeso121394e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785448184; x=1786052984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tad7KNNYJZEBGqiqlpXRjVKHZPLRhBKw+ZwCMBqoTfo=;
        b=aMaQIOkF9OWPOotIM8FD1ZdqTOm5/tg5jDeef4zUp4Z9eMAC3RXZOLevXznMy9WwOe
         idllwxtYxG8pUwModD9gRwKmROO35ZTmaQAeihjpnaSL9ottYRYbtmIVqPUbq3G1HPoI
         /wG8MJ6FLMywqVczc/BawCQLB8kBrO3/PGxs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448184; x=1786052984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tad7KNNYJZEBGqiqlpXRjVKHZPLRhBKw+ZwCMBqoTfo=;
        b=flKYANiirHBrooCXHkSXhr9MTJTchFPgMCIt1r2GMj9UHPPQhVmedoVw6toEVj+j98
         RGLBvV1wD9d4CvBoTv9IVMjXyNQ+4+90+PZoBzYyrXvaIcoYk2za821z718bTLg2tASc
         7NpSjWO7qr5/sjoJGSKKvgW+7wddN7QuPyr8AS9p30w3cEywM1NSILUUM5+c+zfK42eZ
         Y7vHg9cM+onOoyharPW29AgmxLOyck+/k3gh6EmvmaC/sVQ1bVU6Zpx0Nt/PIJsJU8Pt
         wMcNEfqmvXw9L2O0hY1CPp7rMP71OMtb2ct+O98J5pGGqVEkKT7K+2/TRykntzPoEBXF
         cHew==
X-Forwarded-Encrypted: i=1; AHgh+RqjotI6zJo3dFRWtJftm1q9z9tgrLs0SiaL6on6Geb3bHysgQRBTGVvMKCYllqoN6MXNUgdhDvS8gC8nE7d@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn6VE9vWZARg7Y7UtKKq4EdcZMTg86ejuIRpe7/zvHmlDnMcQs
	BKdMz+wwimXiWK3UTNY27+UOxRyFrQbg2UMymNebL5tQRCk2HHeYihma9Z2AG+zMS/uE0seFqqF
	TxI4=
X-Gm-Gg: AR+sD104VItNYCGMPOOzWQ0+qcXiTiPw8Xc9bcexEP1ur9CKT8CNJVW1+KCwcw8wzB2
	CQ6Vq820RCbMeqTGeDnRaytSo6lTMyrMOTTqEy50ESi4Bij6bFVILsaELegs1mzSibuZ2BdxXTX
	OTguRnqOxzj+Ns/PGwkUhFGJ/ufybFPPySkfxSMGVgSc0WqQ85JjlLN1Y6+fd5LdWe93C/GRVav
	bOIlmF8gGO0JgtaNL0CmkX/S3chJrLuJrZjp3A2dJj49Atv6t4rHH70e97ntv8bmsd4a8OCV/5z
	goFelCjMbplPVhWhp5+W50rd0Xi8t3pzkChCOMYXGJUyIqnp95sn3tFdDOpXC+cuZGlOUML9Uw3
	rajtid7wf7p+M8qQ5zrMFdQcyY/5u3s0NPg1NLdkFhVVCFFqct9BaNXoGVbpALtOomeIpDVXUck
	9opS3ZPBY1Xb9n2rUxnmoU22N6O/6QKn3WT4mx8mgHJPmrGXSrf35k6sscJxtMYmtkxJImSoSo5
	RD5jRZd0szipJUTpRGLEPzpU9Y+
X-Received: by 2002:a05:6122:2987:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5c365fe14d2mr1450583e0c.1.1785448184005;
        Thu, 30 Jul 2026 14:49:44 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c36673a58fsm2448463e0c.14.2026.07.30.14.49.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 14:49:43 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74aa416ebb1so102351137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:49:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrdQ7phFvxG6X+IceDXFkJu5E3K9CN+v034s3yN5FX1gpqp+igihKiPGvz3X3ZPp96IJmJPeMzzXOPlM0L5@vger.kernel.org
X-Received: by 2002:a05:6102:3e85:b0:73e:9fae:5841 with SMTP id
 ada2fe7eead31-7575057a17dmr1646770137.29.1785448181666; Thu, 30 Jul 2026
 14:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com> <20260730-qcom-wdt-nmi-series-v1-2-3aa86d162914@google.com>
In-Reply-To: <20260730-qcom-wdt-nmi-series-v1-2-3aa86d162914@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 14:49:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+nrmtK6FJ2G+LGnvxkLEWMR+2A253-gQ2smxf9LoEWg@mail.gmail.com>
X-Gm-Features: AUfX_myzYDcjOimdsQMJqbaAJeswgkX9PwwN6ZxD0rYVoVz06zk8N3Y-SCHwA60
Message-ID: <CAD=FV=V+nrmtK6FJ2G+LGnvxkLEWMR+2A253-gQ2smxf9LoEWg@mail.gmail.com>
Subject: Re: [PATCH 2/3] genirq: Export NMI APIs
To: mrungta@google.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 2:33=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> Currently, request_nmi(), free_nmi(), enable_nmi() and disable_nmi_nosync=
()
> are restricted to built-in kernel code because they are not exported to
> loadable modules.
>
> Export these APIs to allow loadable modules to register and manage NMIs.
> This allows watchdog drivers configured as loadable modules to register
> their bark interrupt as an NMI.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 2fbff2618a1e..fb0b8da32f4c 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -766,6 +766,7 @@ void disable_nmi_nosync(unsigned int irq)
>  {
>         disable_irq_nosync(irq);
>  }
> +EXPORT_SYMBOL_GPL(disable_nmi_nosync);
>
>  void __enable_irq(struct irq_desc *desc)
>  {
> @@ -833,6 +834,7 @@ void enable_nmi(unsigned int irq)
>  {
>         enable_irq(irq);
>  }
> +EXPORT_SYMBOL_GPL(enable_nmi);
>
>  static int set_irq_wake_real(unsigned int irq, unsigned int on)
>  {
> @@ -2080,6 +2082,7 @@ const void *free_nmi(unsigned int irq, void *dev_id=
)
>
>         return __cleanup_nmi(irq, desc);
>  }
> +EXPORT_SYMBOL_GPL(free_nmi);
>
>  /**
>   * request_threaded_irq - allocate an interrupt line
> @@ -2342,6 +2345,7 @@ int request_nmi(unsigned int irq, irq_handler_t han=
dler,
>
>         return retval;
>  }
> +EXPORT_SYMBOL_GPL(request_nmi);

This seems reasonable to me. One thought I had was that we could
possibly get by with fewer exported symbols by changing
disable_nmi_nosync() and enable_nmi() to "static inline" functions in
the header file. That being said, what Mayank has here feels slightly
better to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
