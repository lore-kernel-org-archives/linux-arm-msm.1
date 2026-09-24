Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955234A386D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273593; cv=pass; b=k/d/DPe6TAOfy4t3DXH7YrAzBherza0sc8PFV29ct8RQ491jRdLByHP1YvvwZqK1D9ZS3vFcU0Y9E6bgyF6xTVGYxdKO4+69ZRYi56HBwX7LYgfaTlsRf7YZNVCW1PTIGEuHUSzJ5morMMVqNuzLMHsOWxbKK71q0wAfTDz0mFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273593; c=relaxed/simple;
	bh=obM89duV/YDQdOLprqIx6ewSPHAr0cjoNZPC7dSU81A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEU4YtnVSvrLrjDcefUywZaMxaZom+A/mEKPnGOZL3LYE06EkqZrSDxM49KEVag9/UCoFeDeF/ORTKP4RZDakg+ha29x7Pige0NsAeFB+uGj4C1ky36ry/++jqgEN9fqukpJMhd2ck4g0yipAphuPMSoWZ5VITC0YSMUad+iZp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbvzXo7h; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbvzXo7h"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so313950d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273590; cv=none;
        d=google.com; s=arc-20260327;
        b=pD3LJxISFFc9RL8C412WsGg1KSBoLQZUTQrhqdl7ZYJKRHuqKkxPImVLxzgyOyfpSg
         JrxbIx4Gdtx925rtcIJ6Z8d62l14YfMsZIMf11Rj3foE9Okb1qdD/Jf0rGZysl+YXyTi
         8WR6ZUduQGvsP86cYHtqHYfPM9zBFwZJ7FnNrH9EgVEL2tXP9hwXoT3rfnoak9tYV1Vl
         07sxb2a4Izn0DHai7ySAUX/5P5bEmkWyoOHw12n7zY92qjGwmHO215k7gNgzYoJOmtqk
         Il/RzcYfd5Wusd6RHyX0FNFK1GJEq4a3MkbdCI+eLQm0gKRr+AAGEyUG7UkpeJHO06D0
         1beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        fh=SZOc1vXNXXxOGzSYMTRaNer4NMVw17+ysyqN7tFdHcs=;
        b=S7M3KotVEF4hW0OtOiem8rH4SMegw6JuT0574u8+frNY6yW/stRNGMFGeDl7hYkdOc
         eWQ0dEyem65PEYT6qbsZg2gNC9hT0ixckFTwEmAZtQnV8QT0RvHvZ9BXF+QDV3CLDzma
         fW4fJhCi1vMRrO3appRUspl6w4IejzrIX80vSxcPlAdmQzAQk6zYLPhmgeF3diC5HJdE
         e30UypIMUx1+vt6v0AExOVbkkK18hU3oHVWBm3r6mciU1jKmKJzhQicI9d5BzOR0JRQq
         5SoDwyRIpf1okOmGbJpcrPA7Vf3NKWwECzQHXQIIFQ1JfXnOE//TQWZogfOV4MmF/Qhi
         ro3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273590; x=1790878390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=SbvzXo7hrk0G6IauEmNn8RcRTFDhXSYqND3iYB+yTSkk/RWTVAJUMeNbgREjaGaJht
         dlN1Eg/3m89JfwDHLE0FluvYhAG3q3xdg3l7jNZUUJrO+l21ou8qZFzxUfbvYJvzQXOg
         5/+ygTJVT+uaqLti+EfJmQA/N2W5pjkKps/R6ID31PGjFY4W5cJ8VvClXQeU/Ck/ZqAQ
         Y3WpYCjClKYmTsfxbbDWMvEQMJKv2FtuUgZQjWqydKctnyzYsWgzRtVwS8KSrcokkmr6
         KIqzntdUUlJs5UMpLtcBj6DmlwlgqYUD+4o6vaTavK6EWNOGL++xcPWaQBtsgV/s5fPB
         y9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273590; x=1790878390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=XHak2mvmkJsfyhvslIl2dnVRBVdKkjWAvPHpnqpi0z8HNtx0kYd2OVtYLF1pTTVDuM
         +6s57Unk1kJKNm3ZR6xNM1HavR/6hdZpxHm0xAICkF53ly5sWupqKX+V4m+MfnuK3RkI
         Ho4iQ7sRvXsY3RWKLXujGyIEpWN0AF02/vxmD2YyBZUoe6FNHK3g/GODJNXSmLyqfw7Q
         PgOccpb/SutK+XwDY9W9r6XVazNiOdB2fMFm1IfdddsY4/spW6/Q1bRy3iRHKZ1NnTJt
         50O3FnIQDQI4bsRm0zHYpyp/z96SDxfkVmczvekoY12wK9FUZa1xln0raZE8xynkE2KZ
         8eIA==
X-Forwarded-Encrypted: i=1; AKwUvBzIdFTfnv5sCeSTUR95eAMTF4BkyWFT/xhIqgR5C2/M49+0QmGYWbdam4DBTaUscOkChy/o45r5CnnIJcn6@vger.kernel.org
X-Gm-Message-State: AFuF++k6bVEKERubP/NCTz0a1s70q6BQzCakv5x8y//VA2lXMeBE+XhZ
	TvROPnZUczeO/ya8RaJrOT9oygYkqw+jAl6tnrmPwCg/oRsTFHji6rUprViemorlj49MK/cFtIT
	h/ObNXf0Mpz3qoGBkcZ1puxmfJ5OIWEI=
X-Gm-Gg: AYBFou0Pueq8FgDiIKIAZa+losQ524jKxA3vDMQmFccOtKftr2UU6l2zvzknGmixkrg
	OnymIodo7xfKvllLbRB+YOQNRsEZbfPgqNdf1aHnJm440cHZ6SyjaGhQ7X0LOCs8eA3yoA7xHoG
	TB2VTlvvl5nZFbqDaAkRqvQekfx+MXbjSafaI8koE/XZADLa/DoT72t/rlpPJiTdUNo3vIdbDTe
	lvNcwWKfSkFGQOewlu7ZauHjdWKKl7vLMLCGeaoJdEjNuOuK5HHMFa0aTY7jSmiCkOmt54KolpQ
	MER24plXKGdi4NR0+A9Ou1Z0cm4zds9PFLj14zMEp/veYJHFZGI29KK2
X-Received: by 2002:a05:690e:418b:b0:671:5ede:96e2 with SMTP id
 956f58d0204a3-672ed2603d0mr2064645d50.8.1790273590483; Thu, 24 Sep 2026
 11:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Thu, 24 Sep 2026 23:42:59 +0530
X-Gm-Features: AclHuK9xd3dlB_Cgp98d7h2ns81HK8suGpMur6yXKcYJOLZ9LOtfHEkjox28BFY
Message-ID: <CAJ9orWTDrTTRLqwnwu9YMQQKt0k2g7qZEpH6fDcMFcTbTs55KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:42=E2=80=AFAM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
>
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
>
> This change significantly improves the readability of kernel logs and
> dmesg traces during debugging, without introducing any functional changes
> or side effects.
>
> The cleanup has been applied across the following PM subsystems/drivers:
> * powercap (intel_rapl_msr)
> * thermal (cpufreq_cooling, devfreq_cooling, qcom)
> * cpufreq (bmips, cppc, qoriq, s3c64xx)
> * devfreq (imx-bus, imx8m-ddrc)
> * power/supply (various battery and charger drivers)
>
ping for review request on above listed changes in this v2 series.

Thanks,
Sumeet.

> ---
> changes in v2:
>  - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
>    for *_probe() functions during review of v1 series. This will be done
>    in different patch series.
>  - Here in v2, reverted the changes for dev_err under *_probe() functions=
.
>
>  - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4l=
inux@gmail.com/
>
> ---
>
> Sumeet Pawnikar (5):
>   power: Use %pe to print error pointers symbolically
>   devfreq: Use %pe to print error pointers symbolically
>   cpufreq: Use %pe to print error pointers symbolically
>   thermal: Use %pe to print error pointers symbolically
>   powercap: intel_rapl: Use %pe to print error pointers symbolically
>
>  drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
>  drivers/devfreq/imx-bus.c                  | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c               | 3 +--
>  drivers/power/reset/macsmc-reboot.c        | 4 ++--
>  drivers/power/supply/cpcap-charger.c       | 4 ++--
>  drivers/power/supply/intel_dc_ti_battery.c | 2 +-
>  drivers/power/supply/qcom_smbx.c           | 2 +-
>  drivers/powercap/intel_rapl_msr.c          | 4 ++--
>  drivers/thermal/cpufreq_cooling.c          | 4 ++--
>  drivers/thermal/devfreq_cooling.c          | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
>  14 files changed, 25 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>
