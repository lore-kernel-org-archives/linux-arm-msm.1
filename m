Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A73DD87F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967033; cv=none; b=O569oS3dEeLXpQhkjp6m1Vywc1IYxhTeF2g4c+wpHl7taSVpnUsC6SllelQrMnV3Z2T8H7/RKkXjHZkUXBRFjnfWQ/rGdpT4M4tD9lbbofg5DNctc2SH10+QBZgZbGftCuveUTOel5q4cm71xkpw067mGwBpXEQYVGhxWKQ7yRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967033; c=relaxed/simple;
	bh=50PWHOPz89VAgzShHbqe1+05LKceXOJguW/0waoh4rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmAfgF54wuvSGDYw4GLrPPk7OT1nzxEW6jmqJ77OACvffPqZnvTyllBXgZ597xXaffizY9riiYy0VEp2wx/3rOTsDHmplCk4hnXbLH8s1TVebGHUqY8UaHxXNzJyTC0yyFHOMl/ie1wwDtxKbUZYyLLmilCVoAIqAIXUdecPp9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso264059e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967031; x=1789571831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xngvRGlem5QBe9w72ZS3ISg4Zt8dZwRC6gUDQpCph0s=;
        b=OmBrT7hj/3TWQ3FvBe+GGRNSIod53YYMsaLaSjyG048r1le5OcSjS2zdvjGGSSEmQr
         9sRGIBobRYkjPommQrQC+qDiSMIxh4J2gnWg0g20i2+gcn6B5KbsTqQTPbJEzx6pLjtY
         LUOqG0gpxCjvzm5W7/wUXwgNtspAqBw/MP5E3dKOnIIrHdefrNFnXlMPQ6Z8UPCKdiut
         l9RAmPTxAXZYbHgO3mMhlbEX6BQh/75cnpcwZOJvdHaaaVCZmgIeV+PHsjD1EN1BbRsZ
         ZR0PXaBpW635/cu55wmKrfJCquo+IEVALqSX1OGZxqk/mszME3uiwBzjpqEXoVe70kHU
         HY7g==
X-Forwarded-Encrypted: i=1; AKwUvByUdIuUGxaZtIqwZqnahHuZPoXE+DmRT3y8LyzOf6mgBiXQhk2CPTRQfKaXj2SXqcs68wzrjw5QPQtxoUYv@vger.kernel.org
X-Gm-Message-State: AFuF++nNu7gig93w0E2M3qbBTrUvD5aM8D/WDy8FVoduBxQU2ZuD6HF2
	wfDlwfWshHUa0aYv+hshl6/FJIEV0C3er7Vmgd7CpBENx0s/l9dW4oCna79VXbRxgdxpzQ==
X-Gm-Gg: AYBFou0S6abwJCHeTzXPePz/yEQrKOsu1Du2CO4SULl2gwE6ZMu8krbY4AbcxUI72/G
	GqksrOYF3f5MGxJt//mDijxPwhfqHpgGKQcg5BakSXugsODDjDTHitnRDxu4iTw986VEAf8Vm2o
	m8ez4Gowq1EPmJ6cpif2O1ufaDnvJVJGRMALQ1LxLGLwI6d9jLuiCoS7qhHMfTHgJbcFWRN69ls
	BnX9IXSoytKb5eHjdBLopq+mvpQvZRjICj5QyOeEkERnJnnBwWd20R/E26W84Lrs9PMHPmbgi0b
	Y3bnMYopKdiBgiSas6+d5c/HNWAnJExM5AIoRb7F1RiOVjRuQsW6j0bB71Cnekbv0MeWbE8VwCx
	Tozj36shMRRd/3k8XBBraSp/dzLpDwO47WOrozrkgLxURXYVMHNwSEFUx5KkdbtC4RXMB5u71vg
	4mSWLsm9pEhGyznGVwcHzijaMZbTIpHAcKkIEFQ5zNJFetvpXc3bPgB56gWW4Jx6/9r+Aqky1Sj
	A3fJBujjeNRC+tAAchqWM4fDeVeASrQ3wSxIVvzT1jI9MSm
X-Received: by 2002:a05:6122:311b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c833635558mr840751e0c.5.1788967030940;
        Wed, 09 Sep 2026 08:17:10 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1eeaf3sm12814687e0c.6.2026.09.09.08.17.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:17:10 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so185006241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjYGtNjWDyGAh9lPav82tR06HpLF08AxwBQN3iOIQELHKRIDP/e1i5zrqmqsuBlqSreMX1ljrN0qiToXLX@vger.kernel.org
X-Received: by 2002:a05:6102:159f:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-79072bd65e5mr1021149137.0.1788967030503; Wed, 09 Sep 2026
 08:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:16:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
X-Gm-Features: AcwNN1VLF1S9VM_rAd4lsusMxTGZ8B-oUTaocc800YUq_Bw4xg9-nPCuVEjF4tk
Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
>  } \
>  device_initcall(__platform_driver##_init); \
>
> +/*
> + * subsys_platform_driver_probe() - Helper macro for drivers that don't do
> + * anything special in device init and have no exit, but need to register
> + * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
> + * driver may only use this macro once, and using it replaces subsys_initcall.
> + * This is meant to be a parallel of builtin_platform_driver_probe above, but
> + * with the init call promoted to subsys_initcall so the provider is available
> + * earlier during boot.
> + */
> +#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +       return platform_driver_probe(&(__platform_driver), \
> +                                    __platform_probe);    \
> +} \
> +subsys_initcall(__platform_driver##_init) \

Nit: The backslash is not needed.
Yeah, builtin_platform_driver_probe() has it, too...

> +
>  #define platform_create_bundle(driver, probe, res, n_res, data, size) \
>         __platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
>  extern struct platform_device *__platform_create_bundle(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
