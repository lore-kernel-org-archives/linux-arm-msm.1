Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCB344021
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386990; cv=none; b=PjwzqSsJBfgAFHQwdxIna72hjuxtS3NAnwXVv4Cea5A/qaLrc+A0mGuxpONMVTne7WuvG53qpKL7brEMGcqHsm93SKaVRZsdHr3kcFlmvFEmw0MY2VV66OBJ9xk223mFj5GBKCA+av8T7zNEjFHDBlklx2HvED8jwB4nI21qgBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386990; c=relaxed/simple;
	bh=fhP1wbG3d+ulOnMxYIqs1V3WpHngKveC8jngYyjspSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekw8Fx227O6eQgTYYtAkPRjATSeLMDlFan+uMMgbcdplEff6SWavK3hB5g8jEEAaHp5mj5BmC+ODYHqN6HSzJpmo+y8To/jsREaZT5ArwD7nIvTdNpq0+LPqaidnSuE5ibNT91iZ3ICG8aJEp04gNcMbhYiE7hnVMyA0OA8xkDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXFNJ6h7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXFNJ6h7"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a3166398so1447963e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785386987; x=1785991787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noDLu52YW31HFzyavdKF9a76RS9zMi0V29PPmiJzuHo=;
        b=dXFNJ6h79KOaDvge74toyTzo7CSY4ZLfseYS5AmU0d5n3P19d4gBhN3H2+tOx61hjZ
         mPMzxd6OA1VnlYUlhg4LcJdjGE5y/MFqSIZ/wa/2zYVOvmUBvFT+iZiKXldklrcRkn96
         pmqBpZhnnrS2htx/vr9lB39MFoubN27qCXRtAF+8uNm+7KJOmJHpCKDBCeJlav5hGFez
         8e4DBNITuEuBt+kpRdDUYVk0nnqZgn7ZjMGaLtURYMMevAkZOQRgVgp3iQx/on3v6OUX
         ASBNhoaYH/5I590eQPs/C76Lsn9XGQKSQ4xSB4ubZY1Vw7O6dwGfbTRhudzXe3WnBkIb
         2CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785386987; x=1785991787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noDLu52YW31HFzyavdKF9a76RS9zMi0V29PPmiJzuHo=;
        b=hyWWnL63NwQb4TfIeVo0ta79C9BpjOlY7iUIqZU2Y+yneTcp9EG0ufnEYfGpYPiYrq
         GC5+DtpmKTPIKjm6+nKdBtaSGKn6Qa+xhJwmkTa2LKw0VENbfVdQKhJ1VNAVFBo6jFuq
         uoRQgRmFSH2NJaq79WOy7NXbzxFWfnF/pxiykzaCYEAStwRBhKCEtUPv57tU9uFhxr5x
         CpnmDuE/hBeNxjhkfy4iazA6qgwC0tkxstPLdGCUTJf6mp2S+injydpMBhj/OozjplT+
         9JtwXFmGdG7jO5V3fwd1iqB43oC3Oo/EZ2oEnfdCUe+7rG9OVYyGjRPvakwRGLmpMlDg
         gQ4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqSK62/tF8ocGx3KSadOARQWgeurldEw/nIstVYOBIMRoEungqrpT0GG1w0s2eg94u7/FOdVKQD2Lptid/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5qjn9nQaGkgzTcgqgheiZAO7C6LgXkGrICn+Z6wOMYt8ju/g1
	o4M8N6xYbbFX9a8LTvJtL9Vcr/wkwwkZ76REDGu4Bv0XSQxgimGqpYu6HratrG3MPYM=
X-Gm-Gg: AR+sD10iCtPyQKyiTjk/mDoilBpbSHrQOc9wg9lgynwWrJdfEYXhI9XYrdX8hmG1z1V
	jUNN/9NWhdlwXO5WmIoFnP0ii1TSixZZjj8JJ93Wz1ZaICUTxJ0me/Rf3lZ6cMDh+U+OMtuQpBO
	A8jqDH2y/7LXBayo85TLRsUYJZ0dptbT+Y0g6XYQ9QIhGF967rsOpHNu9VNegDLH4V6M7m/bwin
	gCRtZkYgPLZpqzKIOjY85vSa1GhXh2cdmDVY3ahBi4h82IBo5HlOYhSLTAI4AbpMbNJk80Yo9lV
	EpAs7IxsHqjv4ZS/q47IGSUfr6aQbLOqs1dlxwjB/DqKKXlUINDuE4R0g3VQQrsoVGIQlZrSjYd
	Zi67U7w2sySdhP+GAFaNf9ovAimrCe0CIPtiDM+j6L+zupH6RTX8rbqWtVcI7zJn4f8kVyzcWMG
	W2MmPO+UB9v2hxpJ95EKGxyaaBtUfRnbp5bQ46Wj2T6b/dGG2oNjlpJoOVB5dxiB8hTy4Re/xvl
	hTErKbbKZMX7kOPn7dFaSSIwm9tVdGcYYRg0Fs7pd7WFQ==
X-Received: by 2002:ac2:4e0f:0:b0:5b2:a885:f3b9 with SMTP id 2adb3069b0e04-5b2db36d8c7mr167808e87.35.1785386986590;
        Wed, 29 Jul 2026 21:49:46 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acb1167sm1267961fa.36.2026.07.29.21.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:49:44 -0700 (PDT)
Message-ID: <98e65507-3084-4948-8096-4e2d8d20dc81@gmail.com>
Date: Thu, 30 Jul 2026 07:49:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] power: reset: pscrr: add watchdog pretimeout
 reason tracking
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Srinivas Kandagatla <srini@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-msm@vger.org,
 kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 avaneesh.dwivedi@oss.qualcomm.com,
 Umang Chheda <umang.chheda@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260722-pscrr-reboot-reason-v2-0-495ba3005953@oss.qualcomm.com>
 <20260722-pscrr-reboot-reason-v2-2-495ba3005953@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260722-pscrr-reboot-reason-v2-2-495ba3005953@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 18:13, Faruque Ansari wrote:
> Watchdog pretimeout resets are not recorded with a dedicated reset
> reason, causing subsequent boots to report PSCR_UNKNOWN and making it
> difficult to distinguish them from other unexpected resets.
> 
> Add PSCR_WATCHDOG_PRETIMEOUT as a dedicated reset reason code and
> prevent the panic notifier from overwriting a watchdog pretimeout
> reason with PSCR_KERNEL_PANIC when the pretimeout governor triggers a
> panic.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
>   drivers/power/reset/pscrr.c           | 7 ++++++-
>   include/linux/power/power_on_reason.h | 1 +
>   include/linux/reboot.h                | 1 +
>   kernel/reboot.c                       | 1 +
>   4 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/pscrr.c b/drivers/power/reset/pscrr.c
> index b5906f127e88..5b107c62fe82 100644
> --- a/drivers/power/reset/pscrr.c
> +++ b/drivers/power/reset/pscrr.c
> @@ -149,7 +149,12 @@ static int pscrr_panic_notifier(struct notifier_block *nb,
>   	if (!backend || !backend->ops || !backend->ops->write_reason)
>   		return NOTIFY_OK;
>   
> -	set_psc_reason(PSCR_KERNEL_PANIC);
> +	/*
> +	 * Do not overwrite a previously recorded watchdog pretimeout reason
> +	 * during panic handling.
> +	 */
> +	if (get_psc_reason() != PSCR_WATCHDOG_PRETIMEOUT)
> +		set_psc_reason(PSCR_KERNEL_PANIC);

Hi Faruque,

I like the idea of adding WDG pretimeout resets in pscrr. I am just 
wondering what makes WDG reason so special, that it shouldn't be 
overwritten while other reasons can be? Can this notifier be called (now 
or in the future) so, that there are other reasons getting overwritten? 
For some reason I think the PSCRR was designed to be able to store 
multiple reasons(?) Could you just add one more instead of overwriting 
existing - or should the check be more generic (to ensure the reason is 
only set if there is nothing to overwrite).

If I am just completely lost (which happens), could you then improve the 
comment a bit to explain why WDG timeout is special and shouldn't be 
overwritten. The checking code itself is quite self-explatonary ;)

Anyways, I am happy to see the PSCRR being worked on! Thanks!

Yours,
  -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
