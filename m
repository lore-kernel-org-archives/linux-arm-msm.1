Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BCE440A32
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499744; cv=none; b=jK/6qvzc8Oc+k7BjgIcoaGn18lGb/q22ga7qor9u2DFPHK9oJun+ea77eFLUBP405Y/grYP1kPgYF+ekuTWBJz972beEVL7BtyrvQ1MwUPajr40+d+ua/dKjKm1fR+NBViiVvJZaYCusHqHoCmA5Wxx5Qqc7r/x1d+6WBHk0FSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499744; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kb0a9iPZbBB/4lk5z2fdtIevXl7gOeaoBnwWdWHHJ25Mae+0Kw5GlJG8GZGfKtvYVsD3kf7yrmdhAxe8ZfEGHEZ3grlJtEcnkJaFL9PyrPjp2AFYGSSpWsdU3BrbISP7jBIaMqGj41MwIhzTVqWi99DFgEp14Vzx9Jw7t/W5QRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CD5U/VDG; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CD5U/VDG"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso142853e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499740; x=1790104540; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=CD5U/VDGypdXQcsqAmcpRH6R71bAOB9S4Dm3wqMqaq59Yhfvy8Bhw8Z7QD9p9kH5H5
         cB99Htt31Uhqud5/Sh6FF9L4U3kWBF/TfLF0IO0zqtndlIZJE6XGeplUdZXN44ZHmFiR
         4m9NC5e0a5bd9JmIvoawG1cdaFsvMc6ud18qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499740; x=1790104540;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=DN9aMAOoxJ1wbQkFshU6HFpCCEjsMs5FxoRzab1VTvl7CslR58M2UgzHR6ExS9DwPy
         vmQADXL0Bxw6q3cUBBdldN1x8AWVfDGvyEublzKncZ8T6wZOFy94xUJj/E3XR7S+ySSW
         6Jnyj9br6dm6RR/t6uVKH3mslXIMY5TDr9UCvpjd0SOHnfMJUaZEPfyr2pMwvbGOJ21d
         AjxeI87+QpFL6bxc9C7NzBPZvIf10vKZYbgMYVgsqiFvyX32oY3EFORJAfTE7jce2/g9
         w29ZVmv9QWa+oBCnAFDXa6uVie03R9+Au+dAWlqMVSCPbXDLjn1tPUB7OOFb+ivhAZ3x
         798Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5PlE+cBiWm7Usg1jbxYc7YDJT/C5NUFIewnYsL/KWraNw2bTTKD0ZZ6Eb6HrUCcAf0bPwiTE1Rn3iL7Sx@vger.kernel.org
X-Gm-Message-State: AFuF++liDxA5KgzS8IZbVnJXx/Q3E1KVTPkNEIs7r8/k9L7TQKVhxaCL
	EWDEbHQRdXCiUwo+rpDl6UmtQ0GnLLZrKF3WKugkcbxqcN0iAZ3XpR918JRwEmrVX1eGEl3RgLP
	ZyWXDnvjB0Emi
X-Gm-Gg: AYBFou2Ly4X0gSOxvZ9wUFHl+Zq32ShgE8OVst2oX9YokLHXb35pV6hL8vZtf88y+bD
	LJbuAIGlloQQRn6YO94cqHxT1DrbdEBtY7LHPTxSDKHBLM6XRFsiXY24agakHU9wAkqlsk/eQUH
	BfKKRrjAvHtRaQ15plwXjVxrCwbYs9/1QgsfJpKrLYhdmjqrgP+NItRINN9gndO3rIW8uua4p9n
	Om0JTAKpMGWV1w9X9laSSpFObU7nDwn6rtBqHBOcAWyTyUtueBtF/gXQuO7nfb6qMlK6hyU/108
	6TVZ+nG4oXDDovF8WbtxABApai9BkiZK+ycs4/k2t3Mo66VMcK9YabiXimAxhha/6Uta4rUhu6e
	ynjdMdmtiPhg9NKieAKrOu8XvnlNRnqJjX64HYYYsw/li6yY5XkqvgqXdlU2mKTGcEguI9OJXL0
	ErW3P0xXqrYGdQibdIMptRbDqY7eZjiS07lvRVpHMxuWY5xbwqONiSmLW5f8sJ8oj1oRxwN/d+S
	oyuipOSgAVkhlQsHOgRCWlT7zQMaK329QKmw0vTphg/YU17Sg==
X-Received: by 2002:a05:6512:108a:b0:5b6:19e9:faee with SMTP id 2adb3069b0e04-5b8ae67d24emr4554416e87.7.1789499739894;
        Tue, 15 Sep 2026 12:15:39 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57d7570sm169689e87.50.2026.09.15.12.15.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:15:39 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so93907e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFY3YzWy+2igBur9iOnMDoV+qQiF0XAZxLvZrP3TVp2hraIm1EIPik0Tw/yidxzoOomKkwUEVN7uBhsKLC@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
