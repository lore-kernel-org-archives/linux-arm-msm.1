Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61F53BBFB1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574310; cv=none; b=fRitXM1r8kSru5H0RAAFsTfhtkjbQFMUuWrKV+Otl3vSWZA7NVcJe3XyWQOa2BD+uqi42JDmV9LplhURU7gVFb/YfH3q3UwKL9Mzip43ooRUV4gOu/9w+pLkWeH2XKKyFJc12lS515WJ8k4hMYGGxM4vhOe6BRYn/6SWgljPVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574310; c=relaxed/simple;
	bh=sdJEAeBzaRfEfWUUAtrryRTnn1gnVg/ZDP/K3wQYXMY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fncWF+NINxE2nuWLQZqhYILHbqa8P67AtfuphxMVX+1Waq1TbqK6s2LhgLvbDUcG/tCdfCpdaeRpBoYoNjecUgBF+yTZ4YwxNUutT6nJBd0uSGE4dbtd3IO6PAGtfPkXqSxmxMs5NKMZHbCZMsVLq/8hcdqcZDM9XDBh8E12XeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/1zjWZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/1zjWZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9433E1F000FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574302;
	bh=trH5w8lLNIt7kLoZaTQ24CsToSZw3THdJT/eANCqA7g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c/1zjWZeC9reFnd3ZUtDpQDj2fFC/33HNNuZsIDPTb/GeO3DJf380WAwJeaO8wWfM
	 AI8uI7GS7WbdTwgC+x8hHtXFF/aZXgsgFtfX8QWFBVUgrMGPH1jLFHp64RRPc19J9O
	 snHbOU1SVrKclX6ACVD0gcxwioYsmh6isra8oNpXmMPFdBGcacNKM20eRuPTEDL2mQ
	 hMT4KfYXOpxIMZTeiG0IpVMXoEVOned3dnqxB1MC8PUv1E+b5Yf9Fle3EI83aIq3Vv
	 d1gtGCos6vICzVIG89QOAjS0GbqaZhnIJ2hPb0RT/DkxKDzwJ6CfpORfZSIzHFjXvm
	 6f3leKYkm/CGQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso10834111fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:58:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4pePLhMqMo3CREvAgNbKG7fzq7Y3nDqZ9rGVs8e6EcvhONC5nComJXKZjgqr6dUxYrZC1Bi4CZyhkcm3f@vger.kernel.org
X-Gm-Message-State: AFuF++l2+6KbfAJL2X/FXeA3SgcjGo1laND0bmbS8HHtzOCi/soQKs5g
	A5iVqWPxhIls5rJiFUiWrki9T8Ahrb/0woVLXfmpZft+fehyAxVQsZZSBcczV8U9h3L9+5D78Ty
	+rA41IEMzh4xG8eIZahWx//TE8heoRCkmOk8n/HhIow==
X-Received: by 2002:a05:651c:198a:b0:3a5:df43:7628 with SMTP id
 38308e7fff4ca-3a5df43797amr11316801fa.0.1789574301154; Wed, 16 Sep 2026
 08:58:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 11:58:18 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 11:58:18 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <00a0910e-0c15-4f5a-add0-3cbc3457972f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
 <20260910-qce-fix-self-tests-v7-9-cdbd2718af14@oss.qualcomm.com>
 <20260910143140.GA5719@quark> <CAMRc=McDHXWRfYTwRasdBCXMnoVkXK9T7RB+gBNgCsGof-euyg@mail.gmail.com>
 <c08519bb-b912-4d34-a164-5a9d65162716@gmail.com> <CAMRc=Mf6A98R_NxFaBiMp+N8JuzwZsSdfowwe0XvkMsUCZCL5A@mail.gmail.com>
 <00a0910e-0c15-4f5a-add0-3cbc3457972f@gmail.com>
Date: Wed, 16 Sep 2026 11:58:18 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfpvK8ppLLdEMJtTok06xCgjN5oiEJEdo4v+7D9BqpuVg@mail.gmail.com>
X-Gm-Features: AcwNN1XWj9MSlgewr7vj_JaUm-twNGCNpuDVSpmlu-ZMB92Mq8VbxmRPbXGQFjg
Message-ID: <CAMRc=MfpvK8ppLLdEMJtTok06xCgjN5oiEJEdo4v+7D9BqpuVg@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] crypto: qce - remove the BROKEN label
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 17:49:33 +0200, Demi Marie Obenour
<demiobenour@gmail.com> said:
> On 9/15/26 05:46, Bartosz Golaszewski wrote:
>> On Fri, 11 Sep 2026 20:35:58 +0200, Demi Marie Obenour
>> <demiobenour@gmail.com> said:
>>> On 9/11/26 07:14, Bartosz Golaszewski wrote:
>>>> On Thu, 10 Sep 2026 16:31:40 +0200, Eric Biggers <ebiggers@kernel.org> said:
>>>>> On Thu, Sep 10, 2026 at 03:00:50PM +0200, Bartosz Golaszewski wrote:
>>>>>> All self-tests now pass.
>>>>>
>>>>> Have the other bugs that were reported been fixed?  For example:
>>>>> https://lore.kernel.org/linux-crypto/20260723202704.GB110634@quark/
>>>>> https://lore.kernel.org/linux-crypto/20260723183438.GB93534@quark/
>>>>> https://lore.kernel.org/linux-crypto/20260723205342.GC110634@quark/
>>>>>
>>>>
>>>> I will get to these too. For now, the series allows the self-tests to pass,
>>>> I assume it it's enough to not keep the BROKEN label.
>>>
>>> Personally, I think the driver should stay BROKEN until all the
>>> known bugs have been fixed.  The self-tests aren't enough for HW
>>> crypto drivers.
>>>
>>>>>>  	help
>>>>>>  	  This driver supports Qualcomm crypto engine accelerator
>>>>>
>>>>> As this patch would make the kconfig option visible again and would
>>>>> result in everyone running "make oldconfig" being asked about it, it
>>>>
>>>> I don't mind changing the symbol if you prefer it to avoid any accidental
>>>> `make oldconfig` carry-overs.
>>>>
>>>>> needs to be fixed to accurately document why anyone would want to enable
>>>>> this option.  As you've stated, it's actually just for "testing".  The
>>>>> false claim that it's an "accelerator" also needs to go.
>>>>>
>>>>
>>>> "Offloader" for lack of a better word?
>>> Could it be called a "decelerator"?  That would give users an idea
>>> of what to expect from the driver.  Maybe explicitly mention that
>>> you will take at least a 50x performance hit?
>>> --
>>
>> Yeah, very funny. Jokes aside: "Offloader" says what it both *aims* to do and
>> really *does* without claiming it *accelerates* anything.
>
> This wasn't meant as a joke, but I could see how it could be seen as
> one.  Sorry about that.  No offense intended.  "Offloader" also works.
>

No worries, no offense taken. Good thing about drivers is that they don't have
feelings, so you can't hurt them. :) It actually is quite funny, I'll just
allow myself to not use it.

> As an aside, I trust that you are doing the best you can.  Maintaining
> an unpopular driver is not an enviable task.

I'm sure we'll find a compromise that makes nobody happy. ;)

Bart
