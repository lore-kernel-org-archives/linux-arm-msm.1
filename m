Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793045312;
	b=cXEJrTVjGjzuTxYxFvOuCf11rfEA3kSg6i2X8Rt+vpEkNCriAkXgv2S/Yd9Oyqokib1/
	 CObCEEeSEoawv/jILKW3o9Pu+kxUEZ6RR9zUx6Vcsf+mULTsAF0Buy15uS3xl239qoXci
	 DbLzaPKCWQ6jZA8/tyfvaLyejgqkcA66hUqcJg2wpjblw0VJ2a05JtAoygkVoQ0pdjIrP
	 0mSauDQpd+u4e6qhWtM7Y4vrd7IDAFHLKCNF6KIm7KH2QzG/pIrFUc2yjmp25nQOQaUBD
	 Rxfj5/RjkyD8xr8HFtLIV8vAwNT50fEcioPLLKi9zBAjOCzUCLj+nA39pCN1XrljjsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
	b=VgJ1W+mfc3dYQeBaqSFIYSgrENbKFs9tkeVM2ActZUFcH80OPqbVDcvZqLemyMUSWkX6
	 llBcN3WWaLjvXkThVL1sZsilHzvFnmDnMObqWgeIflJl9wDueouNxI65d3Fh1OHLI011W
	 wQktWFNErA5mupJe9Bb+Mz2evnW6qLAaeVRZdXv/gxtmObjRsLkhEj+bhEfCJLpgL30lo
	 TaF31EfCZ9L/aoDTUn/1OyFTJ9DAKzhto+rMTOT7nQnTXA8DVfaxFa9tK9t5ZNSWA8rBp
	 W5aQABhO3+bmOKc3GQZdwXhKUNS/xhcU/VG14jjegFfP7OxMZcosCY5wbilHFpPJqzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZh6S+kW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C3606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 20:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282C3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZh6S+kW
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so3596996e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793045310; cv=none;
        d=google.com; s=arc-20260327;
        b=Wqb8FMcbvc2brP8lDJlUe8jdsskGEj4BUtq27iibZL4rEFQoJE1l1aZpfG4bOi2po+
         AyDJWIHm0Xpggi+owk05f4//iCRqgT+daua//E0ia0OcYWoUtFk/X5Q0D/n7bpnuTkNT
         jDlPdXX4OYhcwk+ND6upZYZnSiQ0dO3pp3Y73mIJ8HDKXKDOINcx3yDMPkieNvExG2UB
         SVgaUDFKhsa0oCg8cJTRxcouPkmBGWcIbO2BEiBptvl5upT3ttlZd/cIKolM7iQcBcyI
         L6mFxpejM3TBAmiZUSs4+pxlGSVuOjS2YXY6RpHWm0oIsVg25eiAdPpUE6ftNjH71tgk
         UEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
        fh=oVkbxXIJhxNQuLuHt6XpwQkQaZzMY7nQ8EC0fUopn0A=;
        b=UoTX+yLFlC3vtRhr0cdK/NvynEwa2bsX3wjDU6r25Naxi9Vbf2DZaH3GMI8hEYhe1D
         xAaIcuJOldjyV9lNeq0KUAmXtiLKjEBkSOMtgDJSMIRO9mnAWtae5ydKwQn9efWJKbEt
         pS1J9SQSAbbV71/4QhZHgs0AM0Y0Tk1cl3y3bZc5Sy8YyyN/IptiqoNliZIog+9sjC5I
         ro6zFgsrNA+1uKuQvEDWGWOso6BaAzaEQl8bwAHpMMBXaBzylFZvS2yUTgQrX+MU/WMK
         Nr7yYhYhAgjKCa2X66FBKxQXrnEzJ2fI/B5wSrmPQLrVsG6E98Ui60ku99TeOh1lwADm
         ddoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793045310; x=1793650110; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
        b=OZh6S+kW13kxpe3lREHBsQh7gKurkpWH6ldjdgEceuqtuVRZ3cCV7j4U//r2MvB7lU
         2L48tzRSfgIESNC+J07hbFIqffZMyhEUK4Vauc84aTbLsEZNwdK03v+BQcLAtq2f5ReD
         oAmxaCGbbkcUuB8jksUqRoswH1buNz/raAsyvytkiLsa/9H95KiGGJej0a4SAm46L0gO
         M5NYNOLaYoDsWsuyCOgkS/qut4MsNspWHcUL8IGSkeOrzcSiFqa1YTAgQyVFrdzpom9U
         LYyswoJwSWpxB8byrplRzmSMhbPZM99zK1bFbUmz4A+iwBHWBmRxCWa9NfX5w/o4MjtQ
         SGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793045310; x=1793650110;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
        b=peqfgeKtAOktvoCpD1vC7YVBEwkkxK+vupmskDDswJezgGD6Z4ufxzvDNbLaqiCkI+
         tqLznr8ekcgnDoVPxDB0H46OUCarR/gYOXZBUMdBCwRBmvjYEy+IZ/V2sS4J7Pal4//Y
         wClWkgC8JS0+Nk/7Rp/uL2I3CKAAm43ULr802GWBBAFsFWV//9tzCHRpzzw89wj6kWcR
         ocjGq5VedSbL48gF/jUHO6duOShwP2H+YuG8DU8gwK6GYwlwvyT4QnDQG05w9GFdH9mN
         oE8HHRJzFA3eke53qJShu5qrF7ZEF/kvfQ/mNRa95bhgt13e1DXYZmYcRtG4KBfK1Fiw
         BgSg==
X-Forwarded-Encrypted: i=1; AKwUvBw4e/VBw6esHnPLyUwWll389cvuDZq30XFRc/kyJom8FnB8ajByatrybA/2rnJNc2roXpYJwAepHCfn7jPU@vger.kernel.org
X-Gm-Message-State: AFq9FYKPiOph2ZuzPHO2W03m8+gLKMQJIadoLoEYUH2lG6bfpcgwY+/C
	p6Wj6SgyQyd6UW7m6aEhXDBNJTqOFxnrXuP4aA1j0vspIkZFaHEYwMF40w52xWs8cQeivFlgzJD
	qZqogYbp+PY6GrKTpiKfQPLB3St6QleU=
X-Gm-Gg: AYBFou2k3I5wnbPz9oGxhnvKuP/62eHjd2EOtGtJe6wROXhzj5C6L4K6e6RQvaR0zy1
	Unn1FXs7FtobGVoe4WuZpO8nBdEeZjXw1gauQAm1q+Zj2Ep1is0qrDVoRi8NhnvmDlQ4Z1skHh0
	6901mS1yY1ndkWkLeUtHXHgRIUK9bBMu0c2oSJcv92fTX016z2KdaUufz4yXH86jmZlwHkEWF5D
	ayjyRjwzMWtbJxCsW3vaOfpvcWcP6BJu4dJzPYtgHLfTCjTM3CQJxT+QfJMnCRrUCagHipcr2lt
	WKiy8Hg/cTHJIou7grLqPK3EgNxbBWOUy2Lb6/N2xlG8aMR8QddOWo++CDwOeK7pcS6N8D9b+ra
	dimb8t/pkZyuDNZFtOJLJyoVMwXCiMVT2jR3QlBE=
X-Received: by 2002:a05:6512:3e04:b0:5bf:a27e:e455 with SMTP id
 2adb3069b0e04-5bfb71fe5dbmr2606420e87.65.1793045310018; Mon, 26 Oct 2026
 13:08:30 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-2-457aafbb28da@gmail.com> <54itft4rw53zcxoyx5vhxz3zfenxgooorp6lo44vbsdayrq4yi@3f4btdyicop6>
In-Reply-To: <54itft4rw53zcxoyx5vhxz3zfenxgooorp6lo44vbsdayrq4yi@3f4btdyicop6>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Mon, 26 Oct 2026 17:07:51 -0300
X-Gm-Features: AclHuK-BkS5vWEjGMTsyKGjUVJ_nbifNDhF0-JuYBYIWpzcnB0joyMLQ1fgk8e0
Message-ID: <CANxzQdFsbu0mTP6WgwjH=9tHT0SyT+yw1LWbAtHYv2unr1ym3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/a5xx: Hold a CPU latency request while the
 GPU is powered
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Paul Sajna <sajattack@postmarketos.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2026 at 08:42:26PM +0300, Dmitry Baryshkov wrote:
> Do you have any extra patches that you are running with? I don't think
> that currently Linux can hit system power collapse with the GPU still
> running.

Yes, a series not yet sent that adds SDM630's system-level idle state
(cluster and system power domains in PSCI OSI mode, and the MPM). The
stall needs that state, so on mainline this patch prevents nothing. I
briefly mentioned it in the cover letter.

> On SDM630 the GPU is running from the CX, but we don't vote on it (yet).
> With the CPUs awake we keep a vote on CX. With the cores going to the
> deep sleep, the CX might drop below the required leven, causing GPU to
> die.
[...]
> Could you please check what actually stops in your setup (CX corner, the
> BIMC vote, XO)? I think the proper fix is for the GPU to vote its real
> rail, scaled per OPP, in both RPM sets, rather than keeping the CPUs out
> of their idle states.

The GPU doesn't die: it pauses for as long as the SoC is in the system
state, and the job completes once the SoC leaves it. The votes don't
change that. I tested them with the latency request off and on:

- XO: the GPU clock controller using RPM_SMD_XO_CLK_SRC
- CX: the GPU clock controller voting RPMPD_VDDCX at TURBO
- MX: every GPU OPP at TURBO
- BIMC: every GPU OPP at the maximum peak bandwidth

Each was read back from debugfs during the run, in both sets. Hang
detections in jobs, two runs with the request off:

                        request off        request on
  as is                 207/483  216/483   0/500
  CX                    192/488  194/485   0/499
  XO                    188/487  188/483   0/499
  CX + XO + BIMC        180/487  185/488   0/499
  CX + XO + BIMC + MX   199/494  208/487   0/498

I don't know why it pauses, but downstream keeps the SoC out of that
state while the GPU is active, with qcom,pm-qos-active-latency.

You're right about the CPUs' idle states, though: with sdm630.dtsi's
values, 424 us keeps every CPU out of power collapse while the GPU is
powered. Only the system state needs blocking: at 2336 us, which leaves
every CPU and cluster state available, the same test gives no hang
detections.
