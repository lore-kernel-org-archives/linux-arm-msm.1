Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E33B05B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483763; cv=none; b=gK1mToJagVi4M9ey8HnYGib+YLMGSXFXLIMGHklz7GIv8zPFX541lTu1l8pcYu9sfox1NWVfebrM7WSBUG0HAr+Ovu3aihHrPcUJ63I63lDdpG9Gb/3EivPXqVK7nFhbuoI48cw+ZB+Vj5vjiVt2opR055GYn0KbSanirKyWTvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483763; c=relaxed/simple;
	bh=614wa5qQRU1GV8k5CDrRnbZjf57AjJr99VC+gk3oeHs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHYCp84jbtlleHD+NJAgcDCy8OuZBZL2KN0BKIoG3beqFvRt++5OLGGBH6rJwGs98iYA/X83XM7TU2D82+4w7cOUF/rd8On6WHLx371G5zKYavWzV1mb5YDcYmtMpKqYwl6ou3cLgAD1rp2YtwXB9LubLovYi5b4V0HtgO6Z680=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPOdMUpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPOdMUpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B511F00A3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483762;
	bh=wFkTo+n5O4m7NjE25jNyk98XEGUqbdgL1J/Xn4sF+G0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GPOdMUpWpRCsdYchKDzcpFf1VW/A0Io4/Vmcn+c40JGVt55/EZsuVH7fdnCEDd0mU
	 LFGvAkKLnhaG0Caa37n2ZUPgq2BKIGzpA3+PdTMWSxvGkjjBajJnWS2ho5niyhowZm
	 muR+MMM8cp/RriF5SYAFvDgcJUzBbHd4jOB479Ag99IUQ3qON1n/PyPcHwZsOGzBnt
	 kYQ2+wq5D5He/n87nFUy1bzFRvj1Z9McYTbDMgNXKMor46YZxgCLtRNLdBbcHi9Ng7
	 HzqBIcPpC6rxx86W1OP0UHLC23CsOXBxJIUUa3T8y3KxIAV8sKqLgaYbq/ASTBYm2o
	 /IQd8j7kKy25Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b159850b16so566042e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:42:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz5V6RGxtTXJKRnH4vtxtebEEBvRsEGvrStPSrd8WgRA9FDPdwD
	9SnPUsTGg3ZIjdX9adP8n0YQU44CyDqKubl5H75Diom9yWxacpNClzfwdupax2su3a3xP/Ce7TY
	29fRpMCAVl75/EXQEqxx/O0Np/h/J9+7upFy+HR4pQA==
X-Received: by 2002:a05:6512:1191:b0:5ae:bb19:1864 with SMTP id
 2adb3069b0e04-5b2e1fd6ad2mr298883e87.21.1785483760958; Fri, 31 Jul 2026
 00:42:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 00:42:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 00:42:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260731050838.158825-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731050838.158825-1-ebiggers@kernel.org>
Date: Fri, 31 Jul 2026 00:42:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeBzj9xqTP09rnVBQFPqSj-TDt5U8mtr8vN7NDJk-tY6A@mail.gmail.com>
X-Gm-Features: AUfX_my6wmZYiP2QRVhE1TA08-SLamheFCyXF2KVAELztKTqkEap1AuyWBDa-_w
Message-ID: <CAMRc=MeBzj9xqTP09rnVBQFPqSj-TDt5U8mtr8vN7NDJk-tY6A@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 07:08:38 +0200, Eric Biggers <ebiggers@kernel.org> said:
> None of the algorithms the QCE driver registers with the crypto API are
> even close to being useful.  They're massively outperformed by the
> CPU-based crypto (even actually using far more CPU cycles than the
> CPU-based crypto, due to the massive driver overhead), don't provide any
> security benefits over the CPU-based crypto, and have various other
> issues.  They're also unrelated to the Inline Crypto Engine which works
> far better and is what is actually being used these days.
>
> Due to the major performance problems people experienced when
> accidentally using this driver, the algorithms were already demoted to
> below the priority of ARMv8 CE in the crypto API several years ago.
> Regardless of priority, these algorithms also aren't compatible with the
> most common uses of in-kernel crypto; for example, they don't support
> dm-crypt because they allocate memory, and they don't support IPsec
> since they take a mutex which isn't compatible with softirq context.
>
> It's time to move on and just drop this obsolete functionality entirely.
>
> However, the driver does serve one purpose which is to bind to the
> devicetree node and allow the interconnects to scale down (though even
> that part is broken, as it holds static interconnect bandwidth votes).
>
> Thus, clear out the crypto functionality, leaving just a stub driver
> that drops the interconnection bandwidth votes to zero.
>
> Tested on the SM8650 HDK.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

I'll be on vacation for most of August so my lack of responses won't mean I
no longer care, only that I'm disconnected. Let me just leave this here for
completness:

Nacked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I don't understand why the push to fast track the removal of this driver now,
when there's clearly an effort to get it fixed from the vendor itself. I've
also never seen a driver for an IP on a supported platform being removed from
mainline linux.

Thanks,
Bartosz
