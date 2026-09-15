Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FEA4398F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494730; cv=pass; b=BlNxo20UXJiSg/UAW+YP3mp21F8fGKf22/jV9+V6Ueulg96V2E8CK7XXh3YYrKqueKTBxPeh1dxd2d5yCnv4yc6rXrTj/IlhQ73B4G3dcZs6iRWdk987JfpK5DzpYUO6sx3vl+m/BTLT5RTHQ2Y9Y5fW9KMt0Owjaz6BoIH1FTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494730; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlrROPOaIf6ZNk0DuYf8hNbE7XUmPsEs3+frc/PPPWqLjszXAF67lPl7TKmiEJ7ERaVpyBu2eMBVfjKjUFjO+zdtmgi1HTZE8k8G7b/AGcjbEgizgyqIL0AZx9dbrbwgeGqMaakQ+qeo6XHu4e91cIczmEX6YLwm+4Zr6z93lGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so12175ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=kGuxytIUzhV/mYrHaE+3bwHzIHUgoosKRLcOZXK76EGKGsjwRDu5NVXpC8bxl2w5xA
         ym8E4cQVytFI6FFs/9QFoyiU7Ji0M4xCxJnwDthCqx5+yxCmadcVgInfC2NZX9r52L7j
         nHhovW9YgYnOK2HIqq4gVxVJ386o3QxtvAVSWvMwGDFOCGdBjEOqbDFkz6idkMGwfCS7
         pMrWEUEeGVrFGdwgBDENALg9tuzExxsyPM5l1MFaPggTAeUNOe6jF1ZxIENCUQ54J90X
         8JKkbCoKjz1UJJofm45pot7q/h36yo4302ryRlA5i0w5vnhYLx2iM5MUjNVDBaADGIr4
         LR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=QsFCFcDHk2Zd44+xXLchw5Fqc5NiN0yswnfiLRdpSvA=;
        b=cDnbzCNs5yCTbYmUeIYuoFz+9GgrDosudsN+UsgeXaHEtJFqv9EXdCw8AFglKJoDr4
         gPQkdCFZyMalqTapFFAuFfsuA4BPbzvDL4h/Zqh2vFSNjA4w3zuDcn2cRNuSiXJwyERO
         gePLJBDLp6KblPkgD73pYS86ZThhgY23fNeYC1/Ha7oaVG3uuiCJkUiBtGed05BYM4Kk
         bQeEPifd5C091ZCfLkEa7Clvn2wJqOaV1A5otNVSZGKtxtI7S6HsI/HG32R0oxKbn5yM
         8XHVvKrUCpYBfNtWvj2OfuOGi5EbyVwfufIs5qm2fM8cyQzaZjqdxAARMjNUQQ6fFcK1
         iLUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=oRVW0LQJVmsp84Y2DHqMsLqoqL6P+z593Vdqq4ewTojioZTqwrdZcqke3c0V7mV6dJ
         AxA4ftN8oyuEHJacQ+0mCuZRxT0gro7YiWpkos8HEFsCWB9P3DWURWNPe0EjJ/gbTw41
         ZyviJOITQeBTx2N605mrI79dM00b5RPYwnH9rtD8vcpyZh/rw5MBLapt22M54JHQndjV
         kaoNRKhvwYp9zeUcUFBXtg246d36LeMCd+UWkZywGNJz77UwGtfmD+4qoa2EBMRbRMFp
         cZFHGoXZH0h/UztIMZGkALPa7Cs8dXbQ/jj4/+wkUsNUWxBuprO+aRt0jM3JpoPTk+Da
         w3vw==
X-Forwarded-Encrypted: i=1; AKwUvBxrtKb8MhKWnxoUPbR2xFCOimVb23DUka7orMA5n3tKNghPykvIlMsT14Bl8TIoR1sQrvvy3y0O/UW2LgHl@vger.kernel.org
X-Gm-Message-State: AFuF++nIUOm2i3FP9NK1CS2F3vUHiQZT010kTLUyu/PtSMgjd6TDI1FC
	Gty0Ks/SwJCt+cUwDd5THcMDoXS4pg6JVhVzvnk3xcVVLtNJvQxLuB6/66vo0Fh8Fg+3qMhKc3Y
	bC8e066rb0lN7B29LytBC5AAor8LIMDrnet12G/Kv
X-Gm-Gg: AYBFou2hQ9oyKn4TvGNaScAkYFJz69p+N4R6EQvOg29XSepA4tSvJjlfQXh5JGuLcTo
	DbRNzBMVM08ZVxVSqjRwS2Mgax0FGINUGqGNGEyXZXJZhZfm5afFzkMmWxl5wMbNyIoa2spF7HV
	Sgxxre+0+NFN7kbcj/fAQk5mEBtMbK9+7lQQOqkYVHz9SWgjTegATOBna6OUu8/xQlXQwAw569/
	MzmwbqCd2oMzzT85jxf0O1N315IENFxFO+OBExXmQOheI9viZ+zsxji48DsBqaziyuaQhCSLEjP
	DZzYEhMCIfaTV2ebI3a32VNnzflwcdeRpo9VQem+SDBypSfD0CzdStDVIgi5Oy8JNQ9n4pXfda+
	cMB8G6b3HrXJ2n1ShyM552UV9UciqoKDy7Yu/4b5OgxszvFw6LgY=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
