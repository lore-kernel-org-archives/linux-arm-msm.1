Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1E33E345
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273013; cv=pass; b=ANAgdBrKRALlCgj7QcL8eE293gT4do39C0Lf2Hzj5QVdcWvH3RcRTuD1B/Y/IK5+D8kWJPG186zMIAvfiuTs2bmQmDJ8suxPsrJimUzWA8fbe6UuvGm5D8wZvSbkVYo+BbKUjVJ8U8mM89YZr9/o2eqFMsFFSns/U45xDlYpP08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273013; c=relaxed/simple;
	bh=hO66QjvFvGCV1TK4yqeQYuxk+Mmmppj+GGDoeW2H4xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpNFc/Sz9BjkMHqr/bNUdwegPmlcRdXd+5Ne9+7QHQsV+CJw8HQ3fTPTvddVFs3t7tQL28XAZSF1PUsXvNqwLhgroG1qpS/uK0aBvYxxja0hH6L52DyywI22BvQqtiSbyyYFkPcjX5UWSwZaTqnDPLg0W5zBbcS6wNp7KqYSXkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8i0PAXA; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8i0PAXA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso6167039a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273009; cv=none;
        d=google.com; s=arc-20260327;
        b=LC05trFO7GM9wf8X0dlSWUjDzVjc8Qsj2FPZetRONLVpsMkon7XDbxVp73s1PIzVnn
         WDaRam9OtcRxWPLoeUbsuIDDHuO72OPh1RhDnPoCqmTGop6DCURek+MRIaqnbNw8YC+B
         JFQNUqXBknkRsqjUChoRG8d/kyVxeDXVp0mpvamvX4Pt1aufISVnFFyQkkyV/u3OF2hY
         QqNlkr/jKQUFIulBXl97kLZquqNCDHoZ8NRl1d2jENCdVyNBraLCPfofIY2pyxJjOt8+
         EEK9svziBq3U6NUW5ZRCJjmVrt5KnuThMZt1BY192CAIalp7VnQ/z57O0khoxfadVn4v
         7TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        fh=oPok0x2nOsJWV0tQ+IMcw+65qHTnwVpmalf7oP/Rhm0=;
        b=lqSjHVoph8sZYjfokxj/D3l4LGKj5i0IyiYTMI4zBY4X0gFZ2/G6LH6T8fWu45dGB1
         ragRWdqo0XsdNcnR2gxdX12mpQWpgBpnoBaTZ4ig+xNpqQhWakoD8sTxjuM+YRhyeJRF
         of0CDEMXlp+vckX21MisZ1ret9dSt+rZ13k9jZhUP4oAehdL7ux5e+Xs6YbqKrtGrUE/
         kk9CAif6tGTgOtHM45uln4nJyMHnZQlDzolnWp+v6fAeKeStAVrWSO74hD8pws8Okz7S
         HC7DFhuLQnbYgs60BCU9X62IgW3N5Wa9JvY4/Xxaj+/MBlwm58aOPecpKbKjQzsx59dq
         Fg7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273009; x=1788877809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        b=G8i0PAXACK+x6b7YMOSSEYqE2ah4sBav28gW8nzr517OMaqMhws4nSJOpQNNmn7zW1
         wQ0/a8VuGvLZTL6b+2OBf4bupxWVabAFolphncNoqCCQU9gtffm8iGSAep3sG+NJWy7l
         gyQLjWQUeNNL3lccKQ6eBbjTtkBycAD6f6cT6ei6GTutS1eK7Drv/VudGrJdjcEeE2Jb
         ii0TUU89Ne4TkN5HNaD0de43fZSand20o59WVIEEAWSH6kj9FunPEkcA6MkOQmqpRNsk
         y8rCYtMIXWe68PRx7aDWHhs9b5jvmRYqEJGx9lhOqmgDRIt8luOtxljjqwfWqJ2Vtc/o
         gsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273009; x=1788877809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        b=b7MLoB3htrU4Lqu3f8lOB8mIHHJyWPueO3znDgrbc1oNaT6sgm/7Y/C4JA5Wj9tDpd
         mGYkFbyNJSWaiTQFhgjTQ31Pw6U4twQOljc8WfFNISVq6AGhSG9TMBybBm7A7HDP7QhA
         q4j0ZQDZSoOjnO31TnbmhBr5qSDGB0Vgp3fN5an4MVdRv5d3XmGSUqb4txvYlGRGktgv
         DNAwSJJtiHfT5sXYZ2ta83vbprpWAoeBcM+h38lB+Q82jF8au+ZVOtgkcO32fM8E6VJI
         nQlJVegnWOT9wEInQZb0yTI2kS8eU3l4NkuWUn2ES52RyAeOjhDidjvR30/YkwNQN0KU
         FcyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpSYIVf9/cuYqEKlCYHIr3rwWhfTm/O8c7diQyavqhsbumc7vFjPEwtODihqTqxTCFESnwFMy+LKc5dje/@vger.kernel.org
X-Gm-Message-State: AFuF++nHhRg0XIQ46YC0ZcLP9DRl248kRrHbtrNSmNHKQqEJGztY3odp
	RoUtDEegsbc1vNJ620OMHN/I3D7rCP8gKERxWcepo3pRkXYC9h13zQUg82StJEG9izE47kyS1YT
	HWy+U3DrkfNmbl+mdGK4GDcgVNSSiqbk=
X-Gm-Gg: AR+sD12175lT/RO4jlDgUBF71LFhwqzo40x+kcSok+uNH04Jx7KqZDNrp3HtHwsKpHF
	bnJ3Axha80bV/H+q88L31aLtQ7NngRbqQe0NfTN22dTiHaE1+B0abnAvyQal9Iia2rZnwPqMP4y
	9LQzbh7NgE6CzOLtGOPFG5bpIb1/ojgbEHAi2ARfAF5HscVXFrlbYiWLiRHoApO/lMb7jmRZ34n
	rfLbj7Lc+tLkGxiK2jrZrxgSXpmIU+k3ELVLu7/nf0UF0y4rqdG6lTVAoEev7pOPYNQqZ7AQDWv
	4lPDvSHuAbQoymJG1jdPOe5sqfM8FzAkpS4XVVJG4QLvdqy4Pn343Sio9WM8gvIW+3HEDHlrzot
	YFdPbi/FuM6PaOZPUXZQhxagNBgenFBxhASY=
X-Received: by 2002:a17:907:c1f:b0:c16:12ff:dc93 with SMTP id
 a640c23a62f3a-c25b3d6fd4amr496747966b.18.1788273009053; Tue, 01 Sep 2026
 07:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
 <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
 <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com> <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
In-Reply-To: <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 19:59:55 +0530
X-Gm-Features: AcwNN1Uomn3Xc_3Adcsk8DWFI-MLIGjMbU2Tt_GmbXn_JHJipzIc1HtCVCNKh-A
Message-ID: <CAA-+uk+orBPf3uCpwyC02Wnvk9mzChukO494wuPfu2r5PpX9dQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 19:51, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 18:22:34, Sreeshankar K wrote:
> > On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > >
> > > On 26-09-01 09:24:35, Sreeshankar K wrote:
> > > > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > > > SoC (internally codenamed Lito).
> > > >
> > > > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > > > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > > > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> > > >
> > > > This patchset is organized as follows:
> > > > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > > > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > > > interrupt controllers, clock providers, power domains, and reserved memory.
> > > >
> > > > Dependencies:
> > > > This patchset depends on the following patch:
> > > > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > > >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> > > >
> > > > Changelog [v9]:
> > > > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > > >   Make all clk_init_data instances const across the driver.
> > >
> > > You sent 3 versions in less than 24 hours. Please slow down.
> > >
> > > Give a chance to the reviewers to have a look at each version before
> > > sending a new one.
> >
> >
> > I apologize for my actions. v7 was the intended new patchset. Unfortunately
> > there was an interruption during submission of patches, only 08/12
> > patches submitted.
> > That's why I submitted the v8 patchset.
>
> Yes, and now you have sent v9. So even without the v7, you still have 2
> version in just a couple of hours.
