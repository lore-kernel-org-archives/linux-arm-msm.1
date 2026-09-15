Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57D429008
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488529; cv=none; b=AgXXsnz0iAUgbMBOCYeoWFuGaVzdYBpMl6YH1ar/sR10hkVAU1QALZG4hTTj9BZgQwW1S1Lkb+Thw/YLwadVQwXfTEW0XTTDN3ihdm5EwgHpgjGSFPrMvhzC4+B40+Rosu7X3pi3+H077rGniDgs7928+FcX7CJEnG9E/lAgCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488529; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAw9KTYI9c1lARGuB6nXiofwphV3KZsfMOfuquyLcCETjybb6JYPruThCwsoQ/9pY/YJeXEeGd9fN5o76gKEblKbbLpexo5ePKsTAe7cYRbxXMArt7c3EhEZpCk/PyWhpUpS1tWGNfULfvnrlIqXiKX/BohhaEdwkUUewAFcrKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gA/tsZ+T; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gA/tsZ+T"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so6088576a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488525; x=1790093325; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=gA/tsZ+TyS/voMeA5wokavA/Q+E4lDL4xjwa23xb/8le16M4pPd9OJqLXmy+SePAeU
         hE6UFVQEhbfOj5A+3ENk70noiF0tkWpp7m7b9DiYFIYATCxv47g4VvTvYNzL2dR0GWm8
         9wus3YvLAN1mT3iHrjLNsIvSXANkVpqoM5Sjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488525; x=1790093325;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=uMaKcOiF+Z/jVc/7GpwQlwUvhevv0Kkm+F36g93mW0BOXVIQxnk/j/PECuvFkS5eCZ
         Slwend0yHv1N4+9orsM1IXW8ugIDC/fOL15Pxeo6DUJJogupBx/7grDgpPlbG25YzNb+
         a5AK+LqFQXXs5jMhbwDkLcnDAGBVpcGofYmDeq2gn2rByyhWRxYV3zR4bqNebcdM5mMK
         4CVbfUAJnROe8tiZD08CTLLwcjo5CBdaSSgva5QaSIaqUKkCkjTVCnrC9R5feWWb2OWv
         2ctFvMRM4dxvi8QQOVKFMWYRSbYVOEKHHLy7LInZR0aGYqhatHk3OSP6qfPnyb2LiDKJ
         tHEA==
X-Forwarded-Encrypted: i=1; AKwUvBwQKRjPwgkXbNeQUHdYWr0GrVJ92oKv69clOgpqj5TXVCGb/Vqdx7ooprX0YQ8GRCjm3xOYq2EKJJQFa0KV@vger.kernel.org
X-Gm-Message-State: AFuF++lD7/KkCdl4ClsSzETW2H00OiyBUtTDNeUqzbdl+SmORh815/3J
	zIXVqrGyOXFQlcrG10NaYIcbEsG1b6Qm5yh9yWkZ2QoL3/SY5JfeqM8XJ7KA4L/pTupWWBgjgh+
	NWGxTFN4=
X-Gm-Gg: AYBFou3UZesCz9X28arOo47S93FC7RU9V7Fy5p1AwFiJzqfFH4yOURxynZwQ/lq3Dcy
	InIb8edcUrUoyewyR7WxIkvwaYSAdyt/YnHyZaTBjR7LmIBQMitL8w1EWgBbwJuwGc5jnFeyaXn
	lQF9pZBwMIGm+1SCnlVQyIj4YKgAkkiT98rWvx0sKoJVxERVi8QjYiWxPJDotRgQeWiB5NbAoZH
	ndZKCDefL/f2F7L3zLaVZOAMeiTT/03/pAMGEBWM4MIookha8EBqySjcanACuL7CodXue/eouHW
	c9pbb2zomqvLiQJ1NVZPXn6/SLtj8gQHHHp9O1tMKI4r3RjiXdn6Y+z4qahsDGGBu2wz5qmVBg0
	1O7QK2KjK01S5t1vfDwlIdlneJTX4ytA/DJvzrdIHR/8H/0qz6+ErloSBwrYTx7+8MM3j1oYxnn
	PpbNtriExdHo5JnRA8ZGguYdSaqH+kqKm9doq22iJvxoUfXockpSI8uJ8JFygasHKV4T/6tgmVk
	nNk4MGhTR4TervP6E/F1+ynJWhHdNYAjx9W+b29rqCUiRsu601NvmkGR/qu
X-Received: by 2002:a05:6402:f1a:b0:6a9:aff5:c6d3 with SMTP id 4fb4d7f45d1cf-6a9f63da61amr3599992a12.34.1789488524554;
        Tue, 15 Sep 2026 09:08:44 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9d0ef7228sm4441884a12.9.2026.09.15.09.08.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:08:44 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so555253166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:08:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzH/+TJfGsgB6qcXH/eHDHdE+Rnu7kSXWM/WyrF8g8RJuqgjrXvIa3+1grRCB1UFq0IIRW/Plbo38mxmWDe@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
