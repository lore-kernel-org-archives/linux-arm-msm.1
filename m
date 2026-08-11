Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C42442FB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450184; cv=none; b=CCleH2vHsn+aQYJ0a6t7rcXtcBVmpjbAjXrnOFYDUIerR34DG9QaEuqS60Mxv3ewGIsfMBCMSDC2UXZBdQaA3HvQH2bYvCbIZacjjwhQRZCuvXaz8jLcbaZIAQpcPOWCWmqxNDNwzlTvkscmOGiEYjb0fSVuzy8bH0tcsg+2fC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450184; c=relaxed/simple;
	bh=jOz8/RKCdao82EWzssvpPQu6MldBuHaOzLydpj3dJ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZS0aO0V6PIeO1KZZMGw1F+RtQ+OuRW0kxFekw/J8lw2VcZkEu2DF3Nc33uz+OVEbtOQEHw3FM4Tk4VcbUFcZL6KksGEAAe4Pyq0Ywx17Jd5b+M1BpQ3dMi57CgUxsxBU1FqC6Otv87tckq6PzsB8oICvRjePnEfjaHthy/nSBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so1212832e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450179; x=1787054979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uoVTJmbd8yKwYcWWlgS08ZgHIJGke3bvkQlHT1fmSY4=;
        b=YZBZRuqZtJiTHMc9+7cKSTuqp0LI6ZLgDbHbug0uEMg2gTQLM5uMHhkKYixBHEUD0d
         C8Q+HXr5ukgQo12umOl0/H/JRTbYkxgdBrjDicwYlHSrFZEwKviktKuXADy7DYUqL9xS
         3cJWxS7ak4MKWpNTHVCT3J4nmQLuZpYe9LRTPI/K7kTLAHwOOr4O7WMsSS9Ze4CHiwUW
         Z9EBmiR8gcOI+5G8fnEeHxCBuF6WtLd1xckxhW2DzRz5gZOEtlWUYK8s9uc1xKu1822o
         tMooysOUE0hxQ/bW6gQjHU1AGfeRy0CwlZN5RViHwmpX0fBrPZoHWOVlMYl/0JwU6KtC
         Y/yA==
X-Forwarded-Encrypted: i=1; AHgh+RqMqLFGoiXXd0hUssx833GU9byyENbIeSz3GRUZOc0JUY6Dc3WilxtSQC7kj15p+06xSgE6GWKelE2vLKLH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3tiT0Y1jGMI4O3dgrqR+M3G2FSRFVVGGFbhqDo+8ZhH+q/Q4
	puJz3fiI1YwHuN4dTnYdUv5gW5ChGXpHNjBLwjGssWDwS66UiQvDlsImxPtpk01L
X-Gm-Gg: AR+sD10iwX1t3DeIICGjr8s7vZO/oEO3PhmTx0nrxnRmDmdGKxm4OBK17uk5aL7T8UH
	iGob28PHE0ZxVIeG2jpiLsxLLqZaCmez3PmNw+JrnoPJkbfaFpMDuENt8xRGeDNCL94SfH0YLJ6
	WFGEslnFprXWu+3O0vs8Sqcd8w4ID+BOrZiW5HKLzY9YMTnnmiuMX9Mnlw6j6c71TTxkmG1LnnV
	32MEBsC9EoXwLOLP/36UPCyflvHSJ2X5ejXEuXXOghiyklBfuF14lAHHd/9TStA7w6UES7LF/uu
	6xRI/HCeekQwg5l5Q3XbEzYVQO0UNyydpM13F6kU49/YNlILPMiVOWYa3iDoduWC2lLkbvUpox5
	h1ImT3pjV1qL7yPQsmDoQvTaDYu/YIUe92dLNI801YSE8MlSkZAfnTqVrgBMWX/KP9pr2DIFiwv
	M+yNekzi+rC83ox+zRYJMEnHO1BF7DIsde88Ju5154ZWzS6yDVD3EITezvaZZCz7207/HJD/4JR
	1YeTPff00c+3U8BpSKJmCTaKg==
X-Received: by 2002:a05:6102:14a5:b0:76a:fc18:29bc with SMTP id ada2fe7eead31-76b559806c5mr614472137.4.1786450178785;
        Tue, 11 Aug 2026 05:09:38 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b65bb4fedsm429327137.10.2026.08.11.05.09.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:09:35 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97a1c419c17so547743241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rod/xvqFVxctMyhUjzmPAeuS+fneWhoGQ3Sz2ywCo0tQ6XSvS8ShYpSGrIrcEcN5W6B4VXPENni8YeTPzbu@vger.kernel.org
X-Received: by 2002:a05:6102:15a3:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-76b573b9e9amr650405137.9.1786450174738; Tue, 11 Aug 2026
 05:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 14:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
X-Gm-Features: AUfX_mxAADqzKHeccKVpUAgUM-G2gOwUTpW15Dago95Bl-ey6AOZpFlGkzHgs7Y
Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 at 11:04, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
