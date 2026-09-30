Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D3A492E34
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 23:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810282; cv=none; b=VWolVsLpP17JzCYFApCzwolTG190Y089ukg/Rht6Ms49ZgXWZe26P7KW2EAM5/sci69NSiBrAfzv7BFM6Ts3oOLIRNvHNJsICNZgbmbKSB3nriuECTRzBhC/auigo9CU37hkgMtpKB935iRZn35NEAaDT1Lunq8kFvsrCYceBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810282; c=relaxed/simple;
	bh=MQVYYLbltUu3gM+x2chnL6/HZHcYyjfddY/XCJbMqzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7urfn0/DGB9Rmdr34K2Vr20uB8CEtidnJM63EF30NOWmK40r8ZWXNLff2gAX0KzIbxIbDlmfDD+6nb6P9sNgER9cRv9KKm84fFYQNJCmfgTxjJ6J2EQYP3ih3yl773g4aqUN4AGsH/wWO60/smEFdWwdI/xkuMgAMl1Ela2M0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kr4bc1w8; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kr4bc1w8"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba40cb7246so895098e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790810270; x=1791415070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQVYYLbltUu3gM+x2chnL6/HZHcYyjfddY/XCJbMqzk=;
        b=kr4bc1w8Cd0EmY5evHeRyVloBpfy+UkeXF+HPDUL1GkYX3hNgNwpMsV7MgMRD/GNZt
         YlwcmUI0IH9LivyEXvS+bwgIu97aI/Z2WOhfh9kO5+0odBzlhPbzw+3xJ8w8DVM4oieV
         wFAdxTP/vz3CU0XWgN4yHQJ/A5B5p4BgkSCLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790810270; x=1791415070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQVYYLbltUu3gM+x2chnL6/HZHcYyjfddY/XCJbMqzk=;
        b=Dycy8m5Z4/C4fMc/GNazIqUSppFccF4IPyeVIl7XHGhtCf1qfppW8nNcIrw1kd1Eg6
         hvYryCwrspO65pHl9GYDhnd3rtlxBzhspL9sZ+o3WBdfoewmydZfsMb4bYsoomGorJs9
         9KPXFnipJ8Krzv7GVH0U0QRS0FlI8jFXeslsQTKiKg683sc6Z8e0AfNMyXamiguYgQdc
         HzIBKu4K7octScG678JE9qak8qp818Prri8trYCkR9GKtBuqiZF8dmRYCQOjeeLFGdZ5
         JUE9bXnTmdOrfMgdA/x7imWrNztZN7X690DRf2d4IE1Es0MCYHcunihBJXjyX3gabWv4
         SDSA==
X-Forwarded-Encrypted: i=1; AKwUvBw2/xCmctv1QHPejfJXrvAoi2t4yN4kQ+H7+g3LBHSFOcsM10mPAl1tWgqBm3A1Z/s7x6X2kHjLEX2WAn8p@vger.kernel.org
X-Gm-Message-State: AFq9FYLtlbkEmS6CZrKhooW47/nZXU7RMyYkFYf1r0W+viLaqMAVh49x
	XBzk1/dJ+vyaOb7bzGFXy17+oBe32i7aHEob9NyQGK3ihtWhfkgTnCit9T94DqXRrBd5H2r+5uB
	gOLbfgQ==
X-Gm-Gg: AYBFou3Xh+PxZRtU1hR58IFD3dVIrB+QDqu7T2DyLRXJAOqkFN0aLanqUI1IQnILfNP
	6s1g0Xh1Rzpaas5WyRbB8u5+8dVo7bEk+p/TrmdLN7SH+R/UH1a9sx2gfFwwHZTDGDLXKyKtnIt
	DdTwke84pRPSfKs7SLmo3iV10V9PTqPSwxXG3Tt6NE3YY6v94qsBLBd5fM/KBjqQpvM77/UJyX8
	2jdJp2ZHF2sniwuYZCVWQPtJj/oCoYq/tiPg0URqXT/qo4bo/NAG6pjdtpGq8f6jqaEXuwQM3lA
	+RjJFzkds2yZQpeV9ZOM5Ir+DTi3Hw9yvHBmw/cVh3dPYj2U5I684zf5o74hxHFIB91lpf8XnF0
	/7aB9q+A9UY2Jiji3y27w/O5QnuLjDJhQaCJ6jACxlcaThEMPHawltIhv4rYxU8aDWbQwW25ZWX
	QWGoki6V+11MMUMctI1+Hhb59du9ksZBVlJk+SlF7QQUNyrgVhNwUVMsAkGUXwgiBE94yE2ZsDF
	JSDfQXM/n5zwXid+nNK8pvBQP/5oxu1CaAQ0ZJ0p108Dhd4
X-Received: by 2002:a05:6512:290b:b0:5ba:3d62:9368 with SMTP id 2adb3069b0e04-5ba405f48b7mr1022425e87.22.1790810270385;
        Wed, 30 Sep 2026 16:17:50 -0700 (PDT)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com. [74.125.225.99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc8155sm287788e87.84.2026.09.30.16.17.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 16:17:48 -0700 (PDT)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso544177f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzi1RxlQQc23D9wvzhINl7etzO+RkpAzi9fZzky3IYjJcTDYHnbMdxqien2PChzXTOLVbXbleDJTHDA4svG@vger.kernel.org
X-Received: by 2002:a05:6000:2885:b0:487:9a8:9f31 with SMTP id
 ffacd0b85a97d-48b025295ebmr5666042f8f.41.1790810266894; Wed, 30 Sep 2026
 16:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <87v78l6oha.ffs@fw13>
 <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
 <CAD=FV=WE-Wn60zTn=nsq4qLis_zjncrS37fND6ehtpuvxYp+DA@mail.gmail.com> <87o6deh0pm.ffs@fw13>
In-Reply-To: <87o6deh0pm.ffs@fw13>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Sep 2026 16:17:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuSEzHw8JJsTXuGEEe-w_T=_w6ycsqpzpNWDHxMqyJdQ@mail.gmail.com>
X-Gm-Features: AclHuK_lONYIi2Rjd5xeZvJ8IkAtljr3_IbRPhmnlL1GcuMTyl7rym8vZ20aZcw
Message-ID: <CAD=FV=VuSEzHw8JJsTXuGEEe-w_T=_w6ycsqpzpNWDHxMqyJdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 30, 2026 at 2:46=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Mon, Sep 28 2026 at 09:14, Doug Anderson wrote:
> > On Fri, Sep 4, 2026 at 8:26=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> >> On Fri, Sep 4, 2026 at 8:11=E2=80=AFAM Thomas Gleixner <tglx@kernel.or=
g> wrote:
> >> > Of course this is a regular global interrupt otherwise it couldn't b=
e
> >> > requested normally. So this sets IRQF_PERCPU (it has to otherwise
> >> > request_nmi() would fail), but that looks like a hack to me.
> >>
> >> At least on GIC, promoting a regular global interrupt to NMI (or
> >> pseudo-NMI) level is possible, and Mayank's use case here seems
> >> legitimate. Any suggestions you have for making this look less like a
> >> hack are appreciated! :-)
> >
> > Throwing an extra plea out here to see if we can make forward
> > progress. IMO being able to make watchdog driver "bark" interrupts run
> > at NMI (or pseudo-NMI) level is an important thing to do for
> > debuggability of the kernel. It sounds as if there are no general
> > objections to the idea. I guess the next step is to make this look
> > less hacky. Is that something we could send patches for? Any hints for
> > what you'd like this to look like would be greatly appreciated.
>
> I think the objections have been layed out in course of the discussion, n=
o?

I guess I'm still unclear on one key question: if we post up clean
patches that allow promoting global interrupts to NMI (or pseudo-NMI)
level, would you be willing to review and eventually land? I got a bit
of a vibe that you just didn't like the idea in general, but maybe I
misunderstood. I just want to make sure Mayank doesn't spend a bunch
of time trying to solve this problem if it has zero chance of actually
landing.


> > I'll also be in Prague next week for both Plumbers and ELCE, so I'd be
> > happy to discuss this in person if that helps.
>
> I'm going to be there, but I don't know about Marc.

Great, I'll make sure to look for you.

-Doug
