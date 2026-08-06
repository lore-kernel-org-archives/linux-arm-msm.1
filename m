Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3C3AA9E2
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786029000; cv=pass; b=XZBsEzjzpaRYItTSOWWrkkJPiQgYMMUD1ib65IeGuUqaMNjGMlZqyUpdFJB1uqLNxiCVYFlvVQP6osIBtttQIWI36xuG1DR0u3EoJ0AzEjhaVKbf/ecmr9hpqG4uRDI9ewRslzvx/3Hm52LYGdieVqOZqgxg4vpNMVT9JWn/Y/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786029000; c=relaxed/simple;
	bh=jYl3DK3BhBK+zFOv5DNY1Gfw/aQFs8lC3p6XWAnxYrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVqcUdBaAW3KSE4JTD0ZK9F823GsTfVAO7t4cJ25k3CcdM/nsVva/ti6gB0U5t9AFYIOibYMdpeSXN970bLq6HhiNjCWQoVEcL/4wa/sOAbmdO7PXdCQmyF8oM1YOXBGSM5OMiVNhsfRQecIqOqlIFgzeak707z3r7kDoK+IPzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnSWc+aK; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnSWc+aK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso3089578a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786028997; cv=none;
        d=google.com; s=arc-20260327;
        b=EV+I7IUrJhwc2EU+yb5MR6Z0zP1Ubd49TnOIzTGuBkDm5lahMrz4XTH2UiSkdwvZtL
         Pa9G3ghJOsBOIBp3QIN0uFwDpi4chhmAgydG+L8TAyeAMxePZdkM7kLTQc+9CqQAL05o
         /Nz4ZaAgxwQb/wm7aesyFjAT/BX3uaWQKO9A3QZiZCrNUMDJWQp7/gJFJhsg+euguOBY
         JrEngdXQxIsfGvmbsJ6JzmYuiuQEXiy/OtmE5d5P4FicqJJxKcRCBDgQVJ9ixCBnJTac
         8rAoNbIvca5cbmgq5XyJ5BPv8iXilbTaZzXQxxhBq1Dacgh282jDigcAMn5Wt8FTlBys
         Ht5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OxXOttn4/6La1ScFYSzgU2+AyGQ80Sk79RUTUfXbg7o=;
        fh=q2BlkVQtNf8aHgWy72AEXxdS1BYxv54RsYpS0hTCA9Y=;
        b=qIn+6jFV009WIGCRt5NtrmI/bdbGRaHZX9Fovj5xDU6AGRQGE2leUfMZgSWnMS3Cux
         2LR+hPvOGpJKaTpHQJPff0gJzAYDSLxNV+x4FCFbkwbFi3k6y9SuaLVgtGuhcc9S22VR
         2zx0F4XaCrLcLb+vo2Heen13rUpkOe5AXi150rNysOqYRLRcRJDWeGEPKta4irVfZY38
         x5o4bB1c8DBad+BsAJFsIboeJZi/IOeKQj6nE9PbuSYtoFtigY2wB3iHpXa6EdPrteCO
         Iz4NAynpSXQ/eThjsGjnfaC6bWO1llVWt97qjCqlq9KIEwGO1zm7IR0n70ggZREs23nd
         Ev+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786028997; x=1786633797; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxXOttn4/6La1ScFYSzgU2+AyGQ80Sk79RUTUfXbg7o=;
        b=wnSWc+aKD1e/Nuo9a3hxDKWhykMYFg6XyEUOqI35qidiSvqc6xbzen/J3fbMo9nVzy
         W17tXru2Ov6XiJ23jIjkCJQOaLhj4vqiKfc6fdLZcPH06MwlyniVBxZjiiwiMbPhdgfV
         OFMPJUlvqNHT2assZ06VZj3hAPviyDktq4LfGGfmS4K/G8ryrPywUvAY6cY+FldfFTpb
         /URMrvVaL0GeRXooojdABi3+cOzUBZJmDKAJB/mOUAoHORej1XVOYiMPgHX9tzNg3PaT
         7eLsduZUx8uYOip2PY38RYkhkARRb3+mtSKVvKW3qorA/4hM/thm0O1SEkP7iVfFWNKK
         DdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786028997; x=1786633797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OxXOttn4/6La1ScFYSzgU2+AyGQ80Sk79RUTUfXbg7o=;
        b=qoRDydiHZJ9aCfgHwziv9N4sVU4UmkCms6H/J7O3QVBbUSd5ZNdoGQbXybDBZ51Cjv
         4JjdLL5n30cxuhmzUZ0swRu69Wsu48JspBlT9Jp2Ax7Ri6thVCtb3b4I3Wtaohf6bEP8
         CZqSyZOkUj2tLaaOxzk0k7eWzzqilYOkyzRB9JfXPuBpjJ8qke7ObRcxH/Pgznl7j1kh
         GqxxXvKIk1hAoe88GZ3hQvO6bxuFIrSfDqfNfFi9yJ8z9ZQYWMhuGCeGnRl9yDI3aYM8
         0qAga/QJuTB1QBayS/KvSkGhnBMhkwEs1rDtVumiq22cIU2geIcb9tTYVoM1BT0bb9lf
         EXsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaO0evlUzckvBn4MqOxPaD83dIAarB6OAJ2f2RUpBl6gRms8nd3P4gFz0PwTwVrTZibiipV6Wxymp67/lK@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPufVRIBUuls95Hqo9htnQBoNwgc064ZlBhFjTxwgWVyVMy+p
	0HMwT2konQJfAurBvGTUkLL+nCOn4sRiZvjYTTGZ/yz5YGLC4MqcACR/b8GKn2MsbRLqhhPR/kt
	hVDLHsr0d299mGeW5cGPATqRbDtFk+a5GWZWp6Cff0g==
X-Gm-Gg: AR+sD12oSLGIBHuNSfrPXUpUb37Iv16Wxl1+1GEXT2iP4GKO6IncEcmEq6zrKfqcmlX
	GmvDCwg4ixmCPuQ4xKoiQIB8JnTF0lqVyiwHqaDBE+i7bxVURDkMlt/rCIsAU24uRZPL0Pnia07
	k7mmMKMo0BLlnuStRlwt9uJ3iMPA8mG5kG0qDgtioG8sZIkuD+i+XditZgwe3jwC5iLeD4c41Jd
	YXDOFC2nz0JZ21RjAgfazyaK9bB77sKKlz+8nf97mFihSAHpHdtmek95NV3CUiaYd3JYj6d1B9t
	zAbMYkHGCm63KrY8jORurT6MmKofjT8D4MuwRCTvGBsyTL5NMEg6v8Sh0+UDtr+yfAJxGvIbNar
	stw==
X-Received: by 2002:a05:6402:52c6:b0:6a0:a4f5:f4eb with SMTP id
 4fb4d7f45d1cf-6a14f0a1377mr7618903a12.4.1786028996999; Thu, 06 Aug 2026
 08:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com> <20260806044230.909961-3-sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260806044230.909961-3-sibi.sankar@oss.qualcomm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Aug 2026 17:09:44 +0200
X-Gm-Features: AUfX_mzSIdwShrQlXVdrDq69AdNorYGcbP_qqXwCDVJZiJIbHEn99nHYEE157-k
Message-ID: <CAKfTPtDQ+843t5fgknAMcfkYP_ZLxxYU8D+KJtx8QzMy=qMoCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/cpufreq: Update schedutil's DVFS request to
 reach the boost frequencies
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, linux-arm-msm@vger.kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 06:42, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>
> capacity_freq_ref, exposed to schedutil via get_capacity_ref_freq(),
> was introduced by commit 9942cb22ea45 ("sched/topology: Add a new
> arch_scale_freq_ref() method") as a fixed anchor that does not move at
> runtime. However, schedutil uses that same fixed anchor as the reference
> plugged into map_util_freq() which saturates exactly at capacity_freq_ref.
>
> As a result, a system with cpufreq boost enabled effectively never runs at
> boost frequencies under schedutil-governed load. Fix this by plugging in
> policy-max into the map_util_freq equation, so that the DVFS requests
> translates to the actual cpufreq driver ceiling.
>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  kernel/sched/cpufreq_schedutil.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index a1782755efcc..dcefbeaa0702 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -195,10 +195,17 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>                                   unsigned long util, unsigned long max)
>  {
>         struct cpufreq_policy *policy = sg_policy->policy;
> -       unsigned int freq;
> +       unsigned int freq, ref;
>
> -       freq = get_capacity_ref_freq(policy);
> -       freq = map_util_freq(util, freq, max);
> +       ref = get_capacity_ref_freq(policy);
> +
> +       /*
> +        * That fixed anchor governs how utilization is interpreted, but
> +        * the DVFS request is free to target the current policy ceiling.
> +        * Using ref alone would saturate the util->freq map at ref so
> +        * use policy->max to reach boost frequencies.
> +        */
> +       freq = map_util_freq(util, max(ref, READ_ONCE(policy->max)), max);

But this is wrong because arch_scale_freq_ref is the freq that has
been used when setting the capacity of the cpu and is there to make
sure that the translation between freq <-> capacity is correct and
consistent whatever happens later on the freq table of cpufreq. This
ensures that utilization tracking remains correct vs other CPUS and
prevents or minimizes utilization oscillation, which triggers other
problems

Either we enable the utilization value to go above CPU's capacity when
we transmit it to cpufreq (and above SCHED_CAPACITY_SCALE which could
trigger a number of problem while computing pelt)
Or, you take into account the boost freq when setting cpu's capacity
and associated capacity_freq_ref at boot even if not enabled. With
cpufreq pressure feature and the policy->max (not  cpuinfo_max_freq)
correctly updated with a freq_qos_update_request when boost is
enabled/disabled, the scheduler and pelt should handle that correctly
as we normaly take into account cpufreq_pressure everywhere in
scheduler.

>
>         if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
>                 return sg_policy->next_freq;
> --
> 2.34.1
>
