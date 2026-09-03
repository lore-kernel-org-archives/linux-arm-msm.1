Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65749EC7E
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436837; cv=none; b=T9tNYzTkZucyCS+39upT8VkzdmvyALs5TdpMTd8QrXZQqWOYDHs6Shgm2KYO2v7kF8zppwvtRmaxfISDG6oQTHNcW8MxKfr2WVKFxrTpI7swxxMw2UcpvvXqnu+s/0lbZ/CZYZ72ZPStmPxwzqd2VhbUTXxgbMKV29BSjPZg7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436837; c=relaxed/simple;
	bh=hYv0Tjkpm329P9k+TQgqKAPpwtzq68X7vpyHeYE1jHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3KapNVs2rT3trqbfinSXgAokpBFdXOxCO2z3AxgDxoCZqH0btVqrjxjvdPYmzh6NJ0lkU50zDBEAqnm+I6eUZoWpMtKtPNoOwQo1YeX0JLTgCxdzZEahoPnDLb1Yww7XZQmm3mIs1CcNWh4+juyf61efgJGw3dnhgRLpZAFz3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvjv7mTH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvjv7mTH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d7195706f1so24412215ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436836; x=1789041636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x84L8D3771uX1JRAz3DeEhkLMS/d3fFl7+pMbK1JIwc=;
        b=kvjv7mTHOi7YcvKmPL+bqdpCLBoTNMQ+EGYilMjh0sbYviv2xQSSAjf8/vy6wQTHit
         h7w7donsSKHUetTy+NaahPfjrD+YmvkwV2tLftrqmVAaj7zfIJeBPV8CuIayacxYFQb/
         JUeVX8l2OYiQDhj5x6qw16Bq1SJCv8jGfmrm9q6pxc2DB48BUR1egTlQ6NfZmoLIvul8
         GPa9ckqgbB6Dq7rYw1cM64qIQopLdoUWOFMNrTxMPAjytPcMobHcUJrR+bNKutlyjsq5
         aRqhP6Na+o90p7jYTJISu0qojHjueQAhSaT2bub9JDDttDxPMj9lqKOuqnbdObDSMoEV
         JP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436836; x=1789041636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x84L8D3771uX1JRAz3DeEhkLMS/d3fFl7+pMbK1JIwc=;
        b=UZ5Kksj/j683a1R+vqGJybN1sDEwLkCRQ32Gu81BuZuyoGqdshGnjhxZIbn22mFlEN
         jPUtQeuaki0yM/M0bPaRvknDWjCccMIA/HPhFGpogcBMnDtPxPm82BGpzP34BR+I6+Yt
         P/7xAX+d4KTuQNH3EAO2kyZU5bsYeUJw4tyd2OtH5DnTlfVSV62Y7BCgA6sCuNH95jwK
         NwKdnW5UccxADJO+p8zFiPpzOg7rekjPx2xMnVmu065cA0ZobcPHb/20zerNVigoaN0+
         EpZVWPQKEZ+8RkeA/XFQYqfSGoERNWlp/96hHoL8FLjytJ9Imu7Y4uy6xdhV9ziR/VUB
         /Iqw==
X-Forwarded-Encrypted: i=1; AKwUvBwmHBeuxjJFyIWzr+c7ko8WJuQdCzv6dfXoE5gQ08IAYaLwZR6wvtCUJ3Sup12l0OFAv1uae1osuN73et3z@vger.kernel.org
X-Gm-Message-State: AFuF++kuOlK8RJIhNr+jXmYMt+ut+22TAyCdOqdmWYBDh6m/XJ2VaDF2
	orlIhjT5eXkfUhI7IWzdqN4XJUkazo2mYoCTc0SbHP62tnBPqT8RJILH
X-Gm-Gg: AYBFou2qbmS/+X57uzhKCEIr+3IeGvJ8gEF+OLcVOHTPkLbgFWt2GRv6Ws2yC+5rEia
	SE4AmOk8UEWSrzU9rOaetNoWaJ3YaC6JxjbTOZ28no0IiHX80ZpOf+WXrY92yu93Q3zLILeXOFM
	ETQ8ioGayyagoxCOms8Pjlt7ajclyJQRI+pOsQLvigFlK+q38jWNaASQKD5Bxwki0Nv2yWcO0ZQ
	lKpcPpWIaPpEYpG+pW1bfdLg5xzLKCKjsdf3z/Q/sO6LWp+b7JWK0NIfA9dnDUkVi9N3KYvwiB0
	7qddB0xsb7imoRePNOjcpiuW2lTcpTu+N4QQWbJKNbjc9fmqOcgAieQ2/pAJv+h6gft7amWnxYk
	ZZBQiwFZrvOEKY1wgB8B9lhB56oINGK63XQAIFFNthYEb+AGGVO+WpVdSADY/92D9QKBb58Rjbc
	OAo3lp/u8d9laGgIFc2mOt4zoh2X2Pt+/O4qtVl0y9DhC/LiLk4mK6evaIODv3sVOGZIOc1eR4r
	sJPZHEwS8tAkWEt3ExksMoPswuxfIg2GIkdUgibEG4dvo9wjg==
X-Received: by 2002:a17:903:26c6:b0:2d8:d4cc:be67 with SMTP id d9443c01a7336-2daec73f1d2mr160598335ad.20.1788436835424;
        Thu, 03 Sep 2026 05:00:35 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db01c4204csm8037835ad.66.2026.09.03.05.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:00:35 -0700 (PDT)
Message-ID: <c00f266d-b6c3-4988-a2b9-72c5e0389317@gmail.com>
Date: Thu, 3 Sep 2026 17:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] pmdomain: core: Rename genpd_status_on()
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ulf,

On 01-09-2026 16:44, Ulf Hansson wrote:
> Let's rename the internal function genpd_status_on() to
> genpd_status_on_unlocked() to clarify its use.
> 
> Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---

Optional:
An additional line explaining why this otherwise unnecessary rename exists:

Rename the accessor to leave genpd_status_on() available for a lock-taking wrapper
introduced in a future commit.


> 
> Changes in v2:
> 	- New patch.
> 
> ---
>  drivers/pmdomain/core.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..6ac1ce18fda3 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
>  #define genpd_lock_interruptible(p)	p->lock_ops->lock_interruptible(p)
>  #define genpd_unlock(p)			p->lock_ops->unlock(p)
>  
> -#define genpd_status_on(genpd)		(genpd->status == GENPD_STATE_ON)
> +#define genpd_status_on_unlocked(genpd)	(genpd->status == GENPD_STATE_ON)
>  #define genpd_is_irq_safe(genpd)	(genpd->flags & GENPD_FLAG_IRQ_SAFE)
>  #define genpd_is_always_on(genpd)	(genpd->flags & GENPD_FLAG_ALWAYS_ON)
>  #define genpd_is_active_wakeup(genpd)	(genpd->flags & GENPD_FLAG_ACTIVE_WAKEUP)
> @@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
>   * @dev: Device to get the current power status
>   *
>   * This function checks whether the generic power domain associated with the
> - * given device is on or not by verifying if genpd_status_on equals
> + * given device is on or not by verifying if genpd_status_on_unlocked equals
>   * GENPD_STATE_ON.

Since we're fixing this anyway, It should describe comparing genpd->status with GENPD_STATE_ON, not the macro
which expands to that logic ;)

Anyway, nits only, LGTM otherwise.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>


