Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2E37DE83
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969507; cv=none; b=FLJFMAMsskea95C2ijDsCXytN/KeiiwPEYuMYvzyXO/xDHlWW0BUZbeMDBLNqs6tDsXHOc2GPaxNS9pgsgbnuAKeIeHTYcUHtWTJMzXcKz0kA/1y6og8ZJxI8noR3wS9VpCIErp/Hlp8wlOeYlx2AhyvQwCtTWqB2thEYTzp7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969507; c=relaxed/simple;
	bh=Gj+PEAhdIV/uFJgJbAghSUHPHdZ/2r0J4sOrBe2CBfI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVclU4+CFoHwaPyRcg1ynPSjFo93jeLWRYjPPr+3GFMdtoq+GlU5EnNxpnu7DApjigYgSy/fe6UJbzEqg479krbTit2vY0HMINWDVfPrkokIK68WgYV0mKLuB3TJ6Dbk3jttP1bLCLyoGwTU5LO5IeRnx/LWdk/4eF5KGQaRxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhm/5Qa4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhm/5Qa4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7C41F008A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969506;
	bh=Gj+PEAhdIV/uFJgJbAghSUHPHdZ/2r0J4sOrBe2CBfI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bhm/5Qa4cTFpoOUZToPyaA2zcXGy8AWO9//uXK8N66BKJB6fkMlnXXhM1A2GKrLse
	 19q1LCRQS7vli9R6KczLoKxfE91sHVLylsCrzFs9tSz2OoC9c7fSS2AXXjARr0iIjE
	 rlCB3kqTOhdYyAzoJkn0JBV9vc/TRNZrlUTgGoBcpYcyPWCucWhouQXMhH6VWZECFC
	 rkr21IrQYNFOJO0msvnADlZNfKFKdkoOK732cVXS2c7OgssBo0ZyqpKfja181yAYX1
	 9hKFLymMbtJHo+K5dFZZgb4auPGDiEqKBDmxn56UxJqFsWSPRvqqlfyKF3NlP4BDlO
	 lBDNcDIPpsAFA==
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a973a4670eso2265981fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 12:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJao5jTNTztE4/SO6jBbeGKBAc08EeCnhX6XVA2nwXuCyAm4EGT6FBT509gXxWkvCmLJig/jBA0o0PI3i+@vger.kernel.org
X-Gm-Message-State: AFq9FYJcIlFbuPOXNJPkp12NwJLqb1AraU/nA0LfUa3hNazy35wIg2lS
	RBMUeIFBKJTuhWi7zTAt0ssJ6xBk9q8JMZkO18jRyDKfK7H4hA2ZNZ6El+aWymlz50jE28c5Q54
	dYdy9TiH5QX165I/N0B/MIJT5vOU2+IO7aPUsRCYc+w==
X-Received: by 2002:a05:651c:2121:b0:3a8:7b84:be9b with SMTP id
 38308e7fff4ca-3a8877b73a8mr9365471fa.5.1790969503992; Fri, 02 Oct 2026
 12:31:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 22:31:41 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 22:31:41 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ar9qNirrzOTDLipN@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com> <ar9qNirrzOTDLipN@gondor.apana.org.au>
Date: Fri, 2 Oct 2026 22:31:41 +0300
X-Gmail-Original-Message-ID: <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
X-Gm-Features: AclHuK8wQ6TwGfqRhG76u8I4Ivw1PHBRVeaKEhxJd2tlBCqG9_-Cl1JOHG4NPMU
Message-ID: <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 10:24:22 +0200, Herbert Xu
<herbert@gondor.apana.org.au> said:
> On Tue, Sep 22, 2026 at 02:57:15PM +0200, Bartosz Golaszewski wrote:
>> This iteration - in addition to the previous fixes - proposes to split
>> the QCE driver into a core part necessary to bind to the QCE DT node and
>> enable runtime power management in order to allow to drop the
>> interconnect votes, and the crypto part registering the crypto
>> algorithms. The core module is then enabled in arm64 defconfig while the
>> crypto part stays disabled by default. In addition: the actual
>> registration of crypto algos is gated with a module parameter that
>> default to false.
>
> Please check the Sashiko comments:
>
> https://sashiko.dev/#/patchset/20260922-qce-fix-self-tests-v9-0-b1aa742e79af%40oss.qualcomm.com
>

I've gone through them. None of the issues were introduced by this series, all
are pre-existing. I've added them to my list and will fix them. Can we not
delay this series any longer and instead work in smaller steps since the crypto
algos will be disabled by default anyway?

Bartosz
