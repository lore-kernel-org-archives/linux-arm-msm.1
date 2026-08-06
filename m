Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9525E469
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023517; cv=pass; b=OkIDRn/+vNDkiU/mxm8fMofAInJyfxoXdhcxsBlIFpEds0OP7MwItqEphavgEJlbeyLkZMI83TiJiT8soj+NLb/aK7YKkyeYxwr4vnQfkfQYAirAGZ5ruPk3CqnmxhSE14GmXltrlGrcKnSuiM4XoT97Kmgt7s+4gy96L7ZWIrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023517; c=relaxed/simple;
	bh=PHzEhrU8WI4T82TlrKa6NQf/0AGs2opcAg9+onUf+Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r16x15wxIS7ECEg+85915Vy70WXdScBwC4humwbJwlDrPvX9516kKw4Hn0gsDbXVutT7kG9MruqPpBnK3XDOCgmndqsuvUyroCtr+u3P+6d9961fCDsFgS1nVCXCyk2Q6CXC1MEtceoFnIlHEF75dEy1cCkjImsTkaIN4BTX2IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU8t+8I3; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU8t+8I3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace91f112so25608215ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 06:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786023514; cv=none;
        d=google.com; s=arc-20260327;
        b=Fsx+pGgCXBr4lihq/BS3uNhUcookByOHWK1ecMadEnJRnge3VjTgQj/5kwieGJqxZW
         j3AyksshTHv8B/3FdnOYU3Rh6/CCO327NU3mUt5ntb3EyyXWVCb08D9Ecb7sP9W22OFs
         MQ8Q3EgmYa5+vVeMLPz+bcwf46wzja39Bd2kpJpJTeUunkacrYj/dWCd9b6uYolkE4Dj
         XO7wYepxBhKj7IDDMPwS5QQN6YDstFnQyPW1zuoQdeN8mQKg1Vz7vjsMNBu+pPHVjyF+
         j2T7Gq5mWIaJODd8HTyuHOdxu77wKK8S1Y+inHjAMALY0GBge9cKX02xKCQxD3ZHh8Xu
         sw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMkBzLdP9OyMfsmAjdRRIfPjOi/S3wZ2VstuxfJXLpk=;
        fh=JPLGAnLTWSnC29z4th7UfqvvLACFeEmMzk4bYr6Z+Gc=;
        b=N39gq0MqMsMLPSQ9uWDJbvnpiDmKbrNqom+Np/iuJ2YVM9N+WO9ICC1+WGwOCR5gSN
         xWbfJ/z0BkyDQGWDsJOFfvnIjioyJzdX1IRcTN+1DM68flWSUe+yPXtVjq1HDfX2NvDf
         U3MGS4WmpDxxBmtKYFk6dCIpA/MR7EirsFbmpJ5pQC2Wk8arYgVhPnZUG3Zyuc5NXVIm
         9ueZspusQacDcnEFAoZWGsTMXtX1EQAbav77snOKjcqUlINk/C3xBo9+yADDW1DQ85ja
         drCjNO7FLkRwwCZU2fn0t7NszPqpGTeKZFOvR/w85UE0xRzmnAuFJCHpaxpJdAsaOvAP
         yXYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786023514; x=1786628314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMkBzLdP9OyMfsmAjdRRIfPjOi/S3wZ2VstuxfJXLpk=;
        b=GU8t+8I3517Dr2niX81FVhStMdet3jw8eniUEmpcO9NcHU57kSug7nycN3aCr9eeC6
         w4+liK4w/1xUB5aWA+S8Q2HKBqlmvSUMHBfAMMiFQIPtTNqkfpggN6XhdCLXqt2TZKUv
         +/DkLMPi1Hci8MxiSmICtyWbhdrd603Ezm2AMkGm+nrbzGdtCG8mmdR1eDF7DpEoKgvK
         /+eDzI3SHPypf5qvFm1BkmIuzgXl0mH0ERqjw77MFIU6VGNWYjGgsbnSRYYxt66LD+0+
         almZ9mH38mAy4k1EZneJuE7gjW7Sibau1E7+/y3GoEdje3B82jJK2s4/gU2+ulZh0n7O
         TpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786023514; x=1786628314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMkBzLdP9OyMfsmAjdRRIfPjOi/S3wZ2VstuxfJXLpk=;
        b=cHb/FYjRYJmeJ9UJCdwLQaVI4L7kyqRGKInsbltnghF7tS99uNk5SQvb5leHrJLh6r
         Gjdb/pYJMZhUYRkNJvNQD7yjkjWerHTiP/lXmKF+6CdYRS2yHLh4+l2s+oHZctYlJ+wU
         KPvS76/nJr7jaITUkiEKCauYinrQZJ6fm3hPe5TLhJTAG/Tf3LML0zi1yyWs+K4rtqzx
         5z+iRbdeF09ZACJytjTNymuR9RuFm5G6kQfmhQIQbo7VhfetMJI0GPoAfs9pw+PI3FD5
         DBqkLhXJLPp/KvpHTHeh4c01FuTM8So7mbkOaoLatv+85EKFsWqktl8QJXX/lL197T60
         MFMQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2/Oqg1eMOlnTL+4CXpj8EWK4ZD3aTh+VrACfd5PiUzWGGLyIWm88tkHv+Kbt1so0KUSeKpnWyMc7hZTmS@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKr23MnkHJ+XW0aA9K88WPY1G3MlHW8ByqxV6LPNRWKOOuRZe
	mHumqG+M5H+gQ6RlxDMMqJVCBfxhPMsPdj359FFcSB1QEwIF78wixP/jxv2qhHBPFZzwnXaX11K
	u6Ie5eyn3fARNRIDlN8nXirF5aFV+cCg=
X-Gm-Gg: AR+sD13ypijEwsnSYyNVXja3N2tnOGbnGlqJq6XRKeCm/vY5ko2fQP7XfZ5Grz+4TEG
	wG9lUa/rkhrZ8V9fzsMDT2SOCaCkPkEb/g3NnuAdKM6ASjiancvLD3lWFqiB1ktQpIYzM5JKsp/
	Evz2xjc0OR3AnyIr5qNM+9C7cfQ4FV2eQ4WW7MO9MZHWQtqt27ICB4TeJ8xOyLesoWwq6hy5ybr
	M3F7WMl0Jl8L3DF23ikGdI9Q/5LEAXgRYrRplErykVe+p6XTutBM//TecmRQRZ3L6mHUDuoDnX4
	gPwrrXRjrcs3yCwGwhT1MBPH/CkbDa9wBO6DMqUyHI6P
X-Received: by 2002:a17:902:ea09:b0:2c9:a5e9:c26e with SMTP id
 d9443c01a7336-2d0ca75d2a2mr179131175ad.13.1786023514258; Thu, 06 Aug 2026
 06:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804201919.1148015-1-priv.luk@gmail.com> <20260806132630.GC51943@horms.kernel.org>
In-Reply-To: <20260806132630.GC51943@horms.kernel.org>
From: =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>
Date: Thu, 6 Aug 2026 15:38:22 +0200
X-Gm-Features: AUfX_myw4BIaz218nEF8B4Sdyd9jW1zCIlY8OcpZMDJzRslIWnD7PkKnRfm20MM
Message-ID: <CAJmEJMzzuY=hJxo-0yPSfnOymcdd=O9zxmOxdeO_hCB3sbSrLA@mail.gmail.com>
Subject: Re: [PATCH] net: qrtr: ns: Raise lookup limit to 128
To: Simon Horman <horms@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

After merging v6.6.142 into a downstream AOSP device, it's stuck on
boot animation and following log spam can be observed in dmesg:

E qrtr    : ctrl_cmd_new_lookup(): QRTR client node exceeds max lookup limi=
t!
E qrtr    : qrtr_ns_worker(): failed while handling packet from 1:16600

No idea why it needs more than 64 client lookups, but it appears to
work fine with 128 as it did when there were no limits.

Also, I don't really have a good way to investigate what it needs all
these lookups for as most of the userspace is closed source. Perhaps
someone working at Qualcomm could have some ideas.

On Thu, Aug 6, 2026 at 3:26=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Tue, Aug 04, 2026 at 10:18:30PM +0200, =C5=81ukasz Patron wrote:
> > Current limit of 64 is not enough for Sony Xperia 10 VII (SM6475).
> >
> > Fixes: 5640227d9a21 ("net: qrtr: ns: Limit the maximum number of lookup=
s")
> > Signed-off-by: =C5=81ukasz Patron <priv.luk@gmail.com>
>
> Hi =C5=81ukasz,
>
> I think that this needs some more explanation.
>
> E.g.:
> Why is it insufficient on the cited device?
> What is the user experience with the current and new limits?
> Why is this considered a bug rather than enabling a device that
> didn't work before?
>
> --
> pw-bot: changes-requested
