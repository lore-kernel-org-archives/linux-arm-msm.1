Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503064;
	b=j595vn3Sp8MKnaTwMVrURkbthe5SpZY5j0jqoHVI4SxLLsWslfs4Mc+laI64zgKQ9Q7m
	 0rSRtxumEK1vNDNMRdOnITDEHd6Qi2IYkni+glGNXRUwxZceIjTr6GoGtYt3623nXnvhV
	 SId7bCXK+NOvg52++tR/bsOf849tYAny5j3UTcTbq0Um7GGLapQbnqy8M/IkW8tNUt843
	 /Li7Rs/TQ6b0cCIn2ZDTmO6SIgJ9/UY35PzJeo5gXxG16R0T2zNdqzhAONSiZjnjLuW/I
	 nJVO9biSa5iQ5oFBSAFLx+doPCrYFi/1+uJ4ny+aWV+1gTlRiqiMarYzo4MDvLfSr3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503064;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=fgA/Zhp68dHEavBmIayWw25ZtfdqSPSrDKUimhdzG9U=;
	b=M+GHHLytO5DEZzySxhCuPu76zg8/nHtQFJDwgl2lQQxXIE9h0yx1oc3wiDds02F2xElt
	 Z8siQJ1ONjp//tbu7oBALNS2l92qCKzd8uAogxZ9lSqGonHRqDk7kkzAJ00A7x6VnjHYY
	 4qvHqmYU9NsjicJqm9WDzsIrCZqk3d4eTCepqSVndrDtz1UEbPYHFHfdPzTkhX+m2FbLY
	 Ftd1tMwwupSq029LXeXwFEHMIN4e8Cd3O50T7jTVG98CZUdnUCO/qUltuJMLJ5EkV/AdN
	 opefeWG0KuZeu+UqIGY+R2lp+LCHwWNvPkjf4OQPhF3k3qdM2XyTtqs3xKl40vl/G6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPlXry69;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550560A4AF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPlXry69
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288B01F0180F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503064;
	bh=fgA/Zhp68dHEavBmIayWw25ZtfdqSPSrDKUimhdzG9U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XPlXry69G9PQ7JreqGMjCzfXo64H9ICYp6PlqLMX0ix32KcTuDYm2tuMdXcm5Qjyi
	 zYoriCeI0+5/z1j+sKSkuvAjOfgF8XeRblPHFUEO/CdCInOwcerSMJ/qsnWeGQFnDc
	 GQxTf5z2YtpsvOg1M8lIQxy75AHfYysuQs9Sa6PYHm331QEwgrU61uzytC4nyr8TCE
	 LWpIjQGGGGqBjcg9ns5JxToqxheR2rcwME2ZspJuYEntTA2J3wnArW8Q95tN/oTbqZ
	 T8tMxvuGj3DHuw1aLTLncnomdJyqybOYENU+iPec7w9Tt7vu5GJAtlJMuKHrDVQaiN
	 iZ8yN98+El6sw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab01c46697so24429391fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTcgC/O/NZgtIcTzof8+9tcUtdom7K52u5coAlQxxoYdBSL/U233+iD+oeDRGu3oE8G/PnPjc/sC9oFAyQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKfWhpZ5VktvZK2kZWipa0jkPyhEEeKxjVJiFY61lKCJuOnu2sq
	q052TUz0i8iVPxSd1ZTsDzTDNbqBkRim25N5baQfgvFRBOAQr3HhyF2jMQRAwGRlVnz8xNLV8UL
	BwRMGt5yKeNvRbRhmYDVjWlpNEJRyRHBfhDX+JilFxQ==
X-Received: by 2002:a05:651c:2111:b0:3ac:41ca:1104 with SMTP id
 38308e7fff4ca-3ac41ca13e1mr919641fa.0.1792503062833; Tue, 20 Oct 2026
 06:31:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 06:31:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 06:31:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 06:31:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md+y1SRft0+qWpy2Pj=ZK6TL1hmBWCq0jnVBxYDmQnu_w@mail.gmail.com>
X-Gm-Features: AclHuK8JpK4nWSYDUH42Iv3zGzmNhtB0xqKaw0hDbR_OOIMnU3XpnrmRoofeLP8
Message-ID: <CAMRc=Md+y1SRft0+qWpy2Pj=ZK6TL1hmBWCq0jnVBxYDmQnu_w@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] crypto - qce: fix self-test issues in aead
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 14:47:00 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> As requested by Herbert: this is the aead part of the QCE fixes sent
> separately for easier review.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Ok, looks like there are no more sashiko comments on this one as well. Could we
get the three separate series with fixes upstream before v7.4-rc1 to enable
further rework of the driver? Once in linux-next, I'll also resend the driver
adding the new module parameter and removing the BROKEN label.

Bart
