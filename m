Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB874AF167
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552230; cv=none; b=VtVx31aVixOtpH4wggKBH/GLnXYOLcr1bJMW/JjJeViwIh/QiOzNHhqaT5sQTVwxavwIRHaYWpdfJ5sUw/PTHaVpBfty2pZ8rSDbB/ZuDqMyfzOZrcIoFt/+l21ssiLTe0LzwSvOm55a4b3Bd67Npo3VbM6lNiTTH0+kXPPPO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552230; c=relaxed/simple;
	bh=zVftL0e6KTn1Fup/RmgkkUqXURXldH56P13A6WLi8KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8yxrYKw/9bzKUrIoDxUYBhDQFOWcCyPKmXK97zz88YutKZRZ9eKO++T9fecFIfZMsm2qTuU5UQxZKcygWp78VFyoJtY3Uk6AfENtkkr7yVg3jMq3Wp/gzGlwaz0dZHaemvMAGOZrUehp9pEUAKOIGZ3aBLl63GXM3yNptTDdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzby88uf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzby88uf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso3137595e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789552219; x=1790157019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=;
        b=Dzby88ufsV19pEuHSQnO0Z3r75FgiJ44qF/jXgKTm3w+wAYVSGDUH6LyexeTQiqa/g
         mb7EWvB3UuhKI7YAj+i2TOZr9/Z0Jn4HnQ3SO6kUkIrvAwSnRTzKzvfGb0So06LetuEf
         Ts3VEs9CM5zHiWBu1V4JZ71jpXN6ZkETnLDwqKE7PV3aA5kY0+ABvWOim6YHWnbq5cCK
         nHzOneSJDYvvXY/C7BkTDDo/hN/r3+9IBjrwRhsKYcoz9kdWM+uOTg6K8qjcDaH6D7EX
         KA0rYEGGzwyipB5cM3imDGmhTpbUuWgcSiyW3ZIBr1TR7/Q7dN5mD7jr++kuJyreI5UR
         skeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552219; x=1790157019;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=;
        b=yqDKVZZij3wew3pl4AWSuAt+4KxCyoISJ/VeB2maWbQ1lE5a0MUhzvhXHbe3Vwc6/z
         uxIyiMmyv23XXMCGiVMMhQSSfs4wSmj1qTwR7x1I66kcAbGEKtYpkKHl+ej4zw1mw93M
         DDIMR1cfVVD/JaXWNfh97X8CHrnto2gnUP5ZQCWLqTTaPWu/zI57RbB3rcftdy1ArvtN
         VEUcfOrpzj9n/iCnP85PFtG/vYSy/0+WUibsn2lVnipMJVe2KaY07W3PLJ26RB6hW0DN
         H6U9oibYWOaJbTAOuKXSN1yTfY+weOCWbi/M7X2GejXF4Imjy65akLw1OWRUOnsB8jfE
         pD0A==
X-Forwarded-Encrypted: i=1; AKwUvBxwsWuiKnFRE8LEYoof6+VrVoXhtpwhbv4YdARwkrMvvH9+QncCIItoL2WWplx63nbDzNz/C4HbU0WFJ0M9@vger.kernel.org
X-Gm-Message-State: AFuF++mrj45nO5w6M5u3FzZhD0MWoYNGDJrXeI7TzEs8y8gbeUVKrdGn
	Wa9etr8+bL7TdSGHK8Jv3gZInTiQPunc6qSO/thlxbatwJHRN0FeV6s1
X-Gm-Gg: AYBFou1bBr3V1T0nQKEzt45P7MD2p7u8y25Eoebjy0BDP3O96pTfH7rCrmXotUAzQ9q
	mmMpPik65BpIlKWCueAs7VQZEAkmRedpjs+FZGBtBa7QZwRFcn7hNaili+yOV8Z1ZY/vJkvwR+A
	7lVhW4KAIccQckjp3gglg6JaiTLnsb4VTrKf6Ov9cK7xRu7rBPyLhNVKOXv8WQrkFqU+Tglg1fY
	rkgqkgmf4MecWWoXGu63m2UtewV1Q4KjWmMPossAX/D6MPzybqNZs3YGSzTYV+DmHpULY3ddHiI
	79s2V685sRMVfEfyh0TCEFGVO9qvmREFOkXPTokdc4BRKL0eCbe8nNeJ9ZI9QFKClZZYyUdv25J
	TYbnO8/jOwu5Nes/hRVh/YvYoHHX2VZWPaU/qfl7313LtRcQjAMLGkPo1B8PMQMs8f2XgvHjLgm
	Ml5fcSd70cJQjq9mY1XD2jQkQNJggI0G0qe+rUPuDyJhcrgNe80nXMVWAzBtb55ptNQqRmdNvxY
	0NB+Tu/98wQ7rRLUAyroDI2DHu0sPG7fygi1Y6H4+4CaF0=
X-Received: by 2002:a05:600c:4ec6:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49eb732aec0mr19444455e9.24.1789552219000;
        Wed, 16 Sep 2026 02:50:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b02245sm84055225e9.10.2026.09.16.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:50:18 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:50:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jann Horn <jannh@google.com>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, Jens Axboe
 <axboe@kernel.dk>, io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bpf@vger.kernel.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
Message-ID: <20260916105017.13ea5e36@pumpkin>
In-Reply-To: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
	<CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
	<CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 12:08:57 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
> >
> > Is this mainly about stuff like "we installed a file descriptor and
> > then the following put_user() failed"? Because if so, I think a nicer
> > fix would be to have a policy of "if userspace provides unwritable
> > memory to a syscall, just keep going and pretend the access worked",
> > and maybe have a sysctl that kills the process when this happens to
> > emphasize that userspace should not be doing this.  
> 
> We've done that before, where we just ignore put_user() errors and the
> user gets whatever the user gets.
> 
> It is maybe not optimal, but it's fine. You can find quite a lot of
> unchecked put_user() calls with a pattern like
> 
>         git grep '^[[:space:]]*put_user(.*);'
> 
> and some of them are in core code - see the two in kernel/fork.c, for example.
> 
> One of them says "if userspace has not set up a proper pointer then
> tough luck". The other one doesn't even bother with a comment.

I think the code should try to return EFAULT (IIRC that is too hard
in one of the exec cases).
Otherwise very unexpected things might happen if the memory is just
readonly.
If you ignore the error and the pointer is invalid the application will
get a SIGSEGV and (usually) die.
But winding back kernel data because a user copy failed is likely to
be problematic/difficult and at best have error path code that isn't
really tested.

As well as writing fd numbers to userspace, some sockopt code tries to
wind back if the write to optlen fails (which has been read earlier).

I've forgotten which Unix converted EFAULT to SIGSEGV in the system
call exit code - I'm sure one of the ones I've used did.

David

> 
> The scheduler has two cases too, although one of them is admittedly
> for another error case.
> 
> So yes, saying "if you pass bogus arguments, you get what you get" is
> a valid model. It's perhaps not the *preferred* model, but it's not
> wrong.
> 
> It *would* be wrong to take code that already has error handling and
> remove the error handling, though.
> 
>                   Linus
> 

