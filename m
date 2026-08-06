Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6BB335067
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786029217; cv=pass; b=gJ7owK05CE00jg8FOLcfoTH2Y3gj4DRVAbhUQ1t7bAyWYlllOWqT1LDgb/ziLZxWu6S7nlfzucLpbCjy/oXNXjVI25k2yv7GLHYJsakvxaZsWXxHpohKruyeliGLUE669dvgO0n8pmmUl+fPwKOyvZP3oZY+5lMw1rJRDgWTUE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786029217; c=relaxed/simple;
	bh=AkyQ1c6CzPInzcBYPfh1GkCQm/9EGkY2qVu21m83Sxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTfI2RnSz244KR+2KO3Y0fi18HkeLlFvEDHGmaSkFSywpuQoEW62Ynvhxr1ZlaCHAzeQqhw5anvIKlzO4jtAeOtUv2bpCUHNTdoldiP09Bi1395/Veh43r5xydL7XLzcnQaPn53GoDFVFQ16lZJ+VL7rX2tSENV0rYPgIIVbaKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OzVgbX7S; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OzVgbX7S"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so3249787a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786029214; cv=none;
        d=google.com; s=arc-20260327;
        b=f+DMPNkI640wcO71kQvJeb0UxPIA6h5l38eIKXTtBpmtBjqKTwgdenE8IEG6VWvlL/
         XPFoL3QmtwHVpvwvO8SiZMOsKWGX8Gx+swZ7wo8piMDBAfRqr0dIt1WINSjvzndCiKHt
         crSnmwG8TmUdC9aW3hvay+QPVZsOOKs+F1/EP3b2Z0Z1p2MwA/zM4YxL/XnGpy+5t6rF
         8DgtM9x+0hokoeETt6k0N8a7E8cOlkgGJBYL5CS25BoIx7NeSYhncf3aDmG5B85hOm3y
         TKBg8m2ZPp18yLf7WcymFjCSh8qQC+Aq9lF4waFInaPDPUTUCoovC0nLVyTyflsIYNam
         o1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g15bHaQyrtJn5NpT/q2wdS6JcsWTqFslcY8HTn0xjjw=;
        fh=qBpKXplSqD5huCEDyEXUOfECF4GIOvKDuwoTyuLo1Vc=;
        b=L/JHbc9asiLgzG4uEdC1nqc3FjSJxWcluXylzy+wfKUw1kuAn4/7nbcJgdKNtmRPnT
         YUsYtN00LtDX8sxOW+7JaIJi3JAw9mYy0+Lxmao0A90rrth3CP445fBRg8lBRhqGiSYx
         G3DrQC/3Y5/MvucsXly+riwHU/ikLavn75kIIUaDCuYDpxmHX8Nx3urbGn7DXIt8n6L7
         xDayzfnwp6NZWf8cCcakuRD9w2+KFHEWxVls4fklye5S8CL62prj5KZnf/B9ytIn6KZg
         g4/LaiiVV+U0C7WtMhZQy33ZXjrN6X1eO4+B5hXrhaPa4zq3RoKI1RhjHAKa3EwS8Rn2
         a/Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786029214; x=1786634014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g15bHaQyrtJn5NpT/q2wdS6JcsWTqFslcY8HTn0xjjw=;
        b=OzVgbX7SrZCaWh7Kkc5spdANW3gm0yKDifXhglN/MytuL6kphSA/oGk3oHc3TuSs/w
         pkgfo66rW8Urz+6Tucc5GqXaO5bQF7c5H19v/n84kts5K2PEoFh2nst63K8PaCxmeSbh
         YD+HPjnKfdDyI0J8Rf3bcyNmQwLKN1BA3Yzwai0IScwDky0P2FXnZqIhm14fQilRi/t8
         s/6M7sVNPQ2NeAnQwMt9pn17Oz3Q6jnKnQzd21sa6wJyw2qXnJaVdmikbOGndYBoj7o4
         Ty2xu2zMkPlYPxxQ8M0c2LfSXWTJLDfSHb7xlDBUHP5FYAMZba68Z5pBPDMpnocIW7ET
         9Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786029214; x=1786634014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g15bHaQyrtJn5NpT/q2wdS6JcsWTqFslcY8HTn0xjjw=;
        b=KQBVIeTI/E3FsV3MsGnbP341AUuVivuF9tq2C0kwR+X44hJNdBPSX1C4Waw9Fitv8F
         JvtW1GD9YsiUFLIJI1Rro2pACY776xkluI6id2+QdCfM52tvsq20e7u5LB7drCXq/Cmj
         f1uO6OVVcwt6PuVbzvGwXvjo0brT2IjCYUzUh16SerhIUBr3d4yJ8D4Z8FfzutiJBMzT
         jkm9kjHyfySid7aYhJ7e8atuqEfIzozaoqMvBKOXgcmCe1C0n4oYPMiYa66xrC5dvucl
         +6/yvRuVFd1rIq7lKS717egFmmFR4EtrYAQ1OQxXC6PlZ74treiQ2LYeK9HGzOxXO8IX
         7+Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrkCWPPR66qQRrJcgQeHk7IYqFwyrHnlONjDHk+L66m28ltgFSEWB2UGhB6JF+lK9PahvGL742zu+WSkeML@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4dYYcftBFxX2TVMM8rP32/lzaC2mMLlC/saou+1t+QMUjycy
	yrB8VNxUi4lW+j43edlpR/5vslQQZiAs2rvQptv+51Yj58+fdxihB2WajEM2NIlbMoIjfZ282iS
	UGFVjlAcG8ymk3eRdRC6d9yS+WS0xzzDV5NntS3JbIg==
X-Gm-Gg: AR+sD12JgR5LFjjQTe9I4kJKd9QMh98ECCS6TKF/5cta8OmXPgemLqCDqvF7CyYoMbg
	/+8k3lvtyzXWDwhzpA9mq9uhRH/k1TILUY8xh7fQc2Jhx0BHBuOuk3AcwxxPULpzftbYcWt0mKn
	Q8EUpaygFWdlecMbd0K91Ttp9dGpW8cd5ZJT3wve+FmQH5yLLpz4ppP1E/PhnHz5CzCM6ixQugv
	OLz9PSRdBYN1vcKo93S6KLeO27OuFTehli2V0+IeUFn98xa3pClftsUo8DrWNod4SfnIRSdp78k
	AIUlqWK5wqSxBuyCfwl6jNgPIFwbVyDqS0SCZT6jIDQfS2zIsvsOoeIajO1UlvB6V3KVAXVjgfc
	xlA==
X-Received: by 2002:a05:6402:2353:b0:699:fbe4:16d0 with SMTP id
 4fb4d7f45d1cf-6a14f14dbdamr8626686a12.16.1786029214367; Thu, 06 Aug 2026
 08:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-3-sibi.sankar@oss.qualcomm.com> <7a4be9a1-4b00-49c4-bdbf-649268e78c7a@arm.com>
In-Reply-To: <7a4be9a1-4b00-49c4-bdbf-649268e78c7a@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Aug 2026 17:13:22 +0200
X-Gm-Features: AUfX_mzhtw-ZvLph0pkYv4PqdWHCuZY5IIkfX99fkhNbYYFfiEWfCWKcDT_XIqc
Message-ID: <CAKfTPtBoevmq8_Rens2Le=AGqMZRo56oD4eMGX2_2Pj_Vt9zCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/cpufreq: Update schedutil's DVFS request to
 reach the boost frequencies
To: Christian Loehle <christian.loehle@arm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, rafael@kernel.org, 
	viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org, 
	linux-arm-msm@vger.kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-pm@vger.kernel.org, 
	Ionela Voinescu <Ionela.Voinescu@arm.com>, Beata Michalska <Beata.Michalska@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 11:02, Christian Loehle <christian.loehle@arm.com> wrote:
>
> On 8/6/26 05:42, Sibi Sankar wrote:
> > capacity_freq_ref, exposed to schedutil via get_capacity_ref_freq(),
> > was introduced by commit 9942cb22ea45 ("sched/topology: Add a new
> > arch_scale_freq_ref() method") as a fixed anchor that does not move at
> > runtime. However, schedutil uses that same fixed anchor as the reference
> > plugged into map_util_freq() which saturates exactly at capacity_freq_ref.
> >
> > As a result, a system with cpufreq boost enabled effectively never runs at
> > boost frequencies under schedutil-governed load. Fix this by plugging in
> > policy-max into the map_util_freq equation, so that the DVFS requests
> > translates to the actual cpufreq driver ceiling.
> >
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > ---
> >  kernel/sched/cpufreq_schedutil.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > index a1782755efcc..dcefbeaa0702 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -195,10 +195,17 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
> >                                 unsigned long util, unsigned long max)
> >  {
> >       struct cpufreq_policy *policy = sg_policy->policy;
> > -     unsigned int freq;
> > +     unsigned int freq, ref;
> >
> > -     freq = get_capacity_ref_freq(policy);
> > -     freq = map_util_freq(util, freq, max);
> > +     ref = get_capacity_ref_freq(policy);
> > +
> > +     /*
> > +      * That fixed anchor governs how utilization is interpreted, but
> > +      * the DVFS request is free to target the current policy ceiling.
> > +      * Using ref alone would saturate the util->freq map at ref so
> > +      * use policy->max to reach boost frequencies.
>
> I'm not sure those two statements are compatible with the implementation below?
> util / max is expressed in the capacity scale established using ref, multiplying
> that ratio by policy->max changes the interpretation of every util value.
>
>
> > +      */
> > +     freq = map_util_freq(util, max(ref, READ_ONCE(policy->max)), max);
>
> Isn't the underlying problem that schedutil can't handle requests above capacity 1024?
>
> effective_cpu_util() caps util at max, and sugov_effective_cpu_perf() applies
> the 25% headroom before clipping the result back to that same value.
> Therefore the input here cannot exceed 1024, and mapping it against ref
> can never request a frequency above ref.
> Using policy->max makes boost reachable, but also stretches the complete frequency range.
> For example, with ref = 4454400, policy->max = 4723200, and effective util 640, the request
> changes from 2784000 to 2952000.
>
> Making 'boost frequencies' truly compatible with schedutil (or PELT/CAS for that matter)
> is a discussion that is yet to be had?
> See also
> https://lore.kernel.org/lkml/20250626093018.106265-1-dietmar.eggemann@arm.com/

cpufreq_pressure and freq_qos_update_request could handle the case
where boost freq is used as the ref freq when setting capacity but
disabled. I can't remember if everything was already in place when we
discussed this last time

>
