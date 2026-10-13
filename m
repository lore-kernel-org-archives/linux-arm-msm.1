Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D87360EC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896495; cv=pass; b=SAjcvPT1pyTJcv7JRFHSpLmlgSIOFpUI7RlZnlr4CUgZAcrJRfIfmPWr67SWneXp3ciAeyNdgy12Mu2jwuReiI+QdWHO8hRC/TaXsmoxNu71LqxRp5PjrZshMMtf+t8PB5X7KairMQHPZVD0IuX7oagv11Tn5iZBPs7jN57iQHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896495; c=relaxed/simple;
	bh=toe9yb2XFnEECQoBzURsHAyN9yjNtZPEApnZ+PZcHWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNXnpZeWbS1UY8+8oasMvReCMK2YCezRnEzymBsZtZkwW70OQgIBdQBGqXH5VGKQT9DGCq1P0kWA6RMfI1H0qLPOgN6R/uUNkRLxJLi9qhxyg1m4vSRAwQvM2P7o2OGvvymnG6rDDR9rxLlIL5Nv5ANaK5rnC5FA1VX2L8G1f4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpoUWGa4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AauxX3lp; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpoUWGa4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AauxX3lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791896493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
	b=FpoUWGa4mNfCf5OaSoaBazEr9ECc1u4+w8628R7XSgn4ynNd70lfXypzLa6rgO6B1vSHSr
	00yG2Yr3BXg9orT2daF4yOiSOZgA43GPPnaZf+3QCzxI5Tsb4x3slR93kBLWBT7aLJlZNi
	mCbDD4BzLWZq2eKJXZmDH82PmsggPg8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-9NnMMhNWM9OEmQutrRxHFg-1; Tue, 13 Oct 2026 13:01:29 +0000
X-MC-Unique: 9NnMMhNWM9OEmQutrRxHFg-1
X-Mimecast-MFC-AGG-ID: 9NnMMhNWM9OEmQutrRxHFg_1791896489
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0adb0b8dbso19087157b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896489; cv=none;
        d=google.com; s=arc-20260327;
        b=TRIaW/5uXBNO+JnNTKSxcdLVk/dSVF4c5lYpq1L7TkcwZ7anRaa8LxZTuMrscpF77f
         1fOyODhKasUNfnjr6+qDF429+ak4X8hLLnFd7G0vMMpX1k+9j4NKgJOGmNxuqaDxd1NU
         jFQZkMek4WnZOq/kOGIuELpZ4kDaTO5oAOUPv55Wp791liT/P96erkuYF4v1ug5JaeDR
         8n5haVjeo2+FBArC4ZeFwrkq1AfRG48eoK56o8gHeow5iYu5L8NGMuyCljI3kXP76HZt
         yNrUnQ0czz1EwyWAN2gru3UuHtlRfouqzReDS8C+mVRDi61smkta+ZChOKki3gsbxs5z
         nA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
        fh=hQDqPid4VWlwx04yUtMy7tb5e4T3Q++Cpum3SFKLbys=;
        b=sP03J+nlk9Yxpr8ae9Fuol33Sb0TSkv543XAe6jXCnR65AnmHXKya6ZPqZTOlOdZI+
         x8tTQlGhkF6VqvRKZ5U+kg9hh7pL5G+sct76XqFKG7u1aDDYhyp/lIri8SD2uljIN/cT
         7Aieic/yo2NyDhlvLShheGz2d/NzV8CytiiYBH+4O0Ovnzm1mTMDA1zCblRo/L1wnkVi
         mTzSwMMAmX3lun7WBuXcwo4INQgkpOJVr/OB54QoBx+oT5lVEfn0rsfz7gyJGIC++hWW
         zkztH9/uL2fCutRkgscq02r5v2cRv+vzEvFxF479rXu6sWEuppcE1NO+8zyIBLQ3OwFi
         De8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791896489; x=1792501289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
        b=AauxX3lpB4jQeXxopJ+N2zu8w8O6l5+LR3hhUNVJJqJd8SJ8INIuq38bvTh41St+Ex
         IbhncZEhr7C7RkyDXEXl2NlTKS3/5LuCtjkFYpnfF24ICUQ1/UOj2t//LFQVE5yQKRkQ
         WvCItTR6Df8Ggb3OHJVrM3oBHNtzkmlDki7hW6GzAjIdqMQh4tQs0YV9T1EytYBEBqoi
         F4lkiNIlwTK7jzJeTYnwRtFXAcEwXUB584eH64xDVg6KBYDxRy4C8poqc0qPl9u1Zdrb
         PrI20fmQ9gTU86QQ6tjC/P1EfV844shinlCmdQ/W4VpLCE+Aj3W/w3GwhW3pL/9tH7ru
         YkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896489; x=1792501289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQqcIXlaYOQ9CiGwV5uRnoFItSNFU1ls/V/6Sz7sN9o=;
        b=lLkLBYgWz+jTOJgzxePfejt9opUdt70Rv+DnTPnf6n9o4l67OSxeq80y3D/YN8hGu3
         WyOz6P/3Rv4T9sul1N6FrBZwRdpjFnr3BtOKNXlTPkpKCAhQk0RfBDSDoHqG5345Cxey
         QU6PPeztmu45hCG5fRIdpQf5DlH8u2ELrzeDAU+8znVzwRePqnJKut44LZEx/8mi9Yz6
         LtRBIHPHswt4m1PwR0I6+SBL7bra/gf1cjeVHCujMtkmmx58vh0eUbwzIHR8AlhkRAnw
         JvHmdzTeZ5g7WgOKBKU102VNUlQQxnhcyLrgoN//QSAlDQzcZhyLAD8V8rJQhlytLYVO
         JS4w==
X-Forwarded-Encrypted: i=1; AKwUvBzklEMMqhVQIUUw3Q066q7Szvwwd5tMokqa783wvLrjpR0icgyJkmBq9yqrtm4FePTE+SeBbaeBX64xbwVF@vger.kernel.org
X-Gm-Message-State: AFq9FYKbSMpihOPsE2eL4FImefeG7WiRiv8qbH7KBtWQt+O1XgerhDrU
	4mg4kcZopDKCGUC7Lk1KDTiL3efAgBE1BL4eXB78Vq6Q0xWTwj8EIe5RNGaJZ8kmXDY3kIp6LaF
	KJT9ReQoKEEJ5gPpkpFr48Co2z759YpNgxQnFK05hkF0DPNoncLO4F+Olmos0VySYjOwMnZOjfp
	V33W7LX0FMVRNpUbYXvMrpgPP0vxe5Y6IFueMY+jYg/A==
X-Gm-Gg: AYBFou2GTBq+QY4JcW+sGYNFl691e3qe4QPoF3s6BWE6SkB+lqVzqVYiFnjjnV9fxyU
	G9Ax517H7w6v8x2iRheBMibCjucdnJ0wCWzqxwf+xux9+LBZFZ/ES+vxC8/jsJKirwWbE77aeh6
	BCWVqaGzua9UkkSxTmqw+s2ORUb0kK5885eJjdSa2kgBKNymZc15Xn1w==
X-Received: by 2002:a05:690e:4847:b0:671:2832:efdb with SMTP id 956f58d0204a3-6793627124amr3406853d50.25.1791896488044;
        Tue, 13 Oct 2026 06:01:28 -0700 (PDT)
X-Received: by 2002:a05:690e:4847:b0:671:2832:efdb with SMTP id
 956f58d0204a3-6793627124amr3406753d50.25.1791896486366; Tue, 13 Oct 2026
 06:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com> <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
 <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 13 Oct 2026 15:01:14 +0200
X-Gm-Features: AclHuK9nNGUoFlmvw1xPtcbUceZp-66ZFXEJTxSsNT61wpcfLTveJyn4kskXD44
Message-ID: <CADSE00JEH8A8rTwBa030QJmJiiPC51fCdcbv=y0Z6qkg69kNbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ninad Naik <quic_ninanaik@quicinc.com>, 
	Murali Nalajala <quic_mnalajal@quicinc.com>, Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
	Jian Shu <quic_jianshu@quicinc.com>, Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:03=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> On Tue, Oct 06, 2026 at 02:57:45PM +0530, Pavan Kondeti wrote:
> > On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> > > From: Ninad Naik <quic_ninanaik@quicinc.com>
> > >
> > > qcom_scm holds its global mutex across WAITQ_SLEEP and
> > > wait_for_completion(). Firmware waitqs allow multiple SMCs in
> > > flight (wq_cnt). If one call is parked on a waitq while holding
> > > the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> > > and both stall on the waitq.
> > >
> > > Replace the global mutex with a counting semaphore sized from wq_cnt,
> > > with at least 1 wait queue.
> > >
> > > Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq cont=
exts")
> > > Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> > > Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > > Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> > > Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> > > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
> > >  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
> > >  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
> > >  drivers/firmware/qcom/qcom_scm.h        | 3 +++
> > >  4 files changed, 12 insertions(+), 12 deletions(-)
> > >
> > I don't know all the history, but in downstream [1] selective calls onl=
y
> > allowed to sleep w/o mutex.
> >
> > Mukesh, do you know if it is safe to allow all slow calls w/o mutex?
>
> In the downstream implementation, there can be calls that occupy waitq
> contexts and sleep waiting for events from other VMs.  However, there can
> be multiple such calls and we may run out of waitq contexts. Normally,
> these calls are SMCinvoke calls or qcom_scm_qtee_invoke_smc() users. In
> those scenarios, even normal slow SMC calls will wait for a context and m=
ay
> wait forever for one. For this reason, one waitq context is always reserv=
ed
> for slow calls to ensure forward progression. So, slow calls
> still need mutex for such cases.. However, I doubt if we have
> sleeping SMCinvoke in upstream ..

Thanks for the context. That's correct, SMCInvoke isn't upstream, so
the starvation scenario described in the commit message cannot happen
today. The semaphore here just replaces the mutex that was
unnecessarily serializing all calls. I can rephrase the commit message
to avoid mentioning SMCInvoke as motivation (that mention comes from
the downstream commit). And if SMCInvoke eventually lands upstream, a
reservation could be added.

BR,
Albert.

>
> --
> -Mukesh Ojha
>

