Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31DD20010A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387811; cv=none; b=SeYqSZSycUqeS+KdQb1aJ1BYeEHYGOVUo0oIA3RecTItPVjJS4/VcmLsErD/emi7PUYi/aQK9Y8KtByLxKZpdJiF5tpBgMNZYrl1p13CaNx7m4Y2wMPKrrgqsFONN3k3vBh5mAVhr/jjcdXFWC7C5yowEOF2IOCp2MX05z750DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387811; c=relaxed/simple;
	bh=4uq7E7hb6S9mKSdM9uNBZiVt9oo2tWewHPIMY/ljRHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5z0pIZOuIp4nZlGMmcnJnPMI+KY1Wjfw1nRzrK81Qonrbq7tgjlAyEXc2IFlhDMzC9lq1cWVEJY5JN4jEHlufn3t9qUET5W3+DjlDU6tV2sjUhL32wf7GgXArbraWMgKJ6AvmUG2eZvOjYAH9+Q+wXte++e/fICLi5d16cpH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJARDjqz; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJARDjqz"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1021574a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 22:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387808; x=1785992608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrJirBdTraCwj2DppjafVIyYOTXPcd0fOGRdreHju3Q=;
        b=XJARDjqzwbVsl24KRtTcLlhB+x6L/CqgWAnu6S7HgWsg2LJSeenSnM58B7Jnh9l93E
         EMGwI5cJkSKZoX4Q0oo60tNdF6EfdpNwarRJaygsG6nEe7MtdDzaCloGcEMhtJviqZso
         a4BCIymnb0ehs5R61DdbISC33UoiYf9cXO6eBjIgNCwUxtYPV+n2UokoPFU08JMZAxj1
         HrHDAYUJq1gp0YMfKWeZ8V3ZO6ca2sYWYhujSyVriKqjckYmLPJxUt8KvNYkxc+sPIUK
         Y2DOI0GM8OJ9Dj+TMv3PzrvMpUBbKVKst7xKhxK/HfQh95gn5FvaJ4SnnmY81BVeYvp7
         o2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387808; x=1785992608;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YrJirBdTraCwj2DppjafVIyYOTXPcd0fOGRdreHju3Q=;
        b=PddHTVfXgkwye7WkRdAC8u5gl9eJ/RfLrwLSV/AwFQfND8bc0S6CMsXmm3L8HUX2Ph
         5PB8DqzrQj4TMTVWk4LjMw5RA/Oa1H68X6dFhxCfylml+5NxGa7ehFh+w6or0ItPTGlU
         PbmLGqq8t9PQlM0bVbRXaLL81CgqXpe6tSt60DqrMct9XE/a8YwuiO2nFFMwYIF3/TXY
         et2/dHi36qSRk9ahgsbqYdjG0/vNXor/A99jdbsgm0xhoxoL5A9WvYkzKQlN0TbdjYSL
         4TNtp7vXVmT51BuxErgMPKATabRTWAU7dLWL9yX1w/jCCDKtQBoVrhcd6Ql4Ojy/Yma2
         c+ew==
X-Forwarded-Encrypted: i=1; AHgh+RpOrEOV76jnae05V90wq3Y8UQgZC/oYkUYXpyxOyzyLeMd9VnB+67muNhH8A89tMIydGwy2jNrhve+c8gbW@vger.kernel.org
X-Gm-Message-State: AOJu0YzcsHdo6H0fy+Su0wLRWB2TWX4yOmR2cHaBU7ZxW104uOlmpg3x
	N6HgG4DVEjlI+Xxp8NE2HiMwSNpxrdji3tyb4Qp/70o86WLIcqWn6sSJ
X-Gm-Gg: AR+sD108g69F+HD/KjpRUvix0mwi0M7N0GsGXEpX9s25HiX9BPKNXJBEpvGVBi5jnvz
	0a1Di8Dfk7y2glfiBOru1xBYBNrItUcHEuKPzfDZTDl3Xbkv5HsFhJehXNpES2lzbdMCxcZ8cs9
	46CgC2n3TuH+pINBVzqOymBexDJO3nQVxSkgJsNi4WN8sBB2SZzmesURiRXr9sIDr2FVk6JCyKp
	dTxT7wzN3jhcOpPGWZn6Ghwd8r4wQiLkyRnZPz5ytkkdgsXpoDeSsQQYyeL13mLZhYt3DXK+jiE
	v2hQlh7kOEnrwTA7VCBTuqrDyPLf/HmQtpVVvtyRCXEdp/91bktB6VY0rFgDf1LkIJha1vRXMOA
	SMA+30EWbQ0FDxtjD0fbkK9H7qAODc7cA5kacxNzBFjcTagEHCnpuE8JOSQk0r8FxMY3CneNpvt
	z3kgiosry18Ur7GpaGJzmIwqZdXUfO1bQV6+LSzSJLd+xi8RguxoLB1PIet247gJetC9qBFWd0V
	VW9sOIw5hjabEJfK7FuCDorBgjxtOEN9N6AeBdcLlMX64tV
X-Received: by 2002:a17:90b:2dc3:b0:38f:5869:387a with SMTP id 98e67ed59e1d1-38f9bd6e64cmr950536a91.8.1785387808118;
        Wed, 29 Jul 2026 22:03:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f8154619asm898584a91.4.2026.07.29.22.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 22:03:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b7e5b66f-1f27-4c3a-a66d-2100a982aaf4@roeck-us.net>
Date: Wed, 29 Jul 2026 22:03:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] watchdog: pretimeout: record PSC reason on
 watchdog pretimeout
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Srinivas Kandagatla <srini@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-msm@vger.org,
 kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 avaneesh.dwivedi@oss.qualcomm.com,
 Umang Chheda <umang.chheda@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260722-pscrr-reboot-reason-v2-0-495ba3005953@oss.qualcomm.com>
 <20260722-pscrr-reboot-reason-v2-3-495ba3005953@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260722-pscrr-reboot-reason-v2-3-495ba3005953@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 08:13, Faruque Ansari wrote:
> Update the PSC reset reason by invoking set_psc_reason(PSCR_WATCHDOG_PRETIMEOUT)
> from watchdog_notify_pretimeout() before either the panic or noop governor
> runs, so the reset cause is committed to persistent storage before the
> system goes down.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
>   drivers/watchdog/watchdog_pretimeout.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index 02e09b9e396d..ea48d4eca4aa 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/list.h>
> +#include <linux/reboot.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/string.h>
> @@ -103,6 +104,8 @@ void watchdog_notify_pretimeout(struct watchdog_device *wdd)
>   {
>   	unsigned long flags;
>   
> +	set_psc_reason(PSCR_WATCHDOG_PRETIMEOUT);
> +

A call to watchdog_notify_pretimeout() does not necessarily reset the system.
It only resets the system if the panic governor is active. Given that,
I think this is a bit misleading. If the "noop" governor is active and the
system crashes later due to a completely unrelated panic, the restart reason
will be wrongly logged as pretimeout.

Guenter
>   	spin_lock_irqsave(&pretimeout_lock, flags);
>   	if (!wdd->gov) {
>   		spin_unlock_irqrestore(&pretimeout_lock, flags);
> 

