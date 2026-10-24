Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829828;
	b=xVIGBFAOMmVLqnkUJvbxwC07GJ77ECHI8w75TfucpbhojvsHbfC5+zJwrTNRA+DpjGsz
	 JPGLxGk0gnP00SPLe+L0OEJxhQrp9O5qTgaiRzYRWc3aGnfIDeB4qVXd/+OboQ398vb7B
	 qCMZF8P1McUoHioqZB/L2QWd1qPT35H7esGvBi+Xf3yASJl+EdAufwfNZzW/nPQ+XEger
	 CtnFTiXhOf/lOLvl4Eov+EPIbchWscdp/q8q0A+j8+sOsnih5ZhZyY7p36TH2UbzhdmUl
	 cQYbHzV59/q1uZ7DNZIBzCqzdhHmzd4BnGJkk+v1Dkwlqa5bgGOkW2zYvCecaHyTbxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
	b=NlWfM4RVmfa/n2+w8IIAcgUyPU36saVKhoJJh0p8SV/KCrNFP/G95/dtlc4xLlEDt5BM
	 PbaGoFrAMC6B0KyuD8ThEJTX4xAI09thol2FSfoGhLJwx6xE6P7CKEfZ8Y84q19GKhxje
	 HsQBZD4CLK2cWMPntAI6fQJLH05HzkVsmTLho5lCJp+skSGrqs20cuo6TgScurQ+ryxOp
	 ZL5Ad49PpNz55Lsd3rCyMtUfbeclAPZpLf+XCtmirFIZQRlgOqxAvUpPckTUJjwyOwyLV
	 lr3pI8xrbvo/qhXIZhdAsWrDbbvF7TAKchJjV93uXq0ZT57l0F2Ez0KRjpEU6m6hYeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="RQ/C/ciB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C727606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C727606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RQ/C/ciB
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so2496301a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829826; cv=none;
        d=google.com; s=arc-20260327;
        b=ssCAMaDhK70vtRXqPj1shxy1T8CwYaqo779YO1TmqIV7eABmBRwQ0iQSLpHSgiAoOj
         edxQCPFtDlHjOHZjFQF3i3LmPdf8TGopMjUYVqyOtDbSk4kHuek3NQP7gBdb6/wACCsD
         +EUqcD0VOPMf+t3kdUxVCCpPw+Y5+04oZKOaHQiIFplbVooIt031lUtfcLzFGmG6OO9u
         tQTqLLrkzb3dq6/wF/WvMfwq8RgV4tfNdqk7Lz9QJgC8rtFAEJmFkY9P6CAuVQrqy2oE
         3pORnpsED/5ZK+lS4qW1AwRJ6zPtidOzqFnZ0lsduY1J18btxNIdWO7bsY3l0ULW60QJ
         6hzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        fh=ujkgDqtd5QN0JQx6UIcJZh+Pjl0nPROCqDANMP0rXPQ=;
        b=r6ioNXwzdN2WsPhWCzCf9xDXNgPo/7tjq+vvQdiLDVfwh+/S0ft2hn29CkMDV8R4B+
         1Y2FFCdPWZXpQgfrHVwe6jScA8kBnWm4kOCi/YcwWxFjEbGAnO55gRHN8yD0FFGmg1vw
         I/RVB1knXLsJA5a+wT0JcwpWrLHppt4r7fXToJjzNKdGJsPQuko1rSo5qDdg3UTA1aFd
         QPMIJjHhejX+c12K4EHwB4lZVTvRN/eOrDdoa7QFKf9Q7XBOHfQ1RTLLMvkoW5H+XmcZ
         9VTYGVMsXxy0TWW9RS3DR8hUlJI2wcFaRPvhVrkv6/BVvPYrLN1f4InA2d4qgxMWuFr/
         fTqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829826; x=1793434626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=RQ/C/ciBKZJHGdvCZm/dYrMbyOFdij4a0YW87tH+vXDq+9FS+P0+VhkPe2yvw8PouR
         1rl5NjCRsmehOHog4MCGLudY+nXK4o7aKeyawk/ABbhLZrLiG/YXwW5Ec453FETEL8A9
         gIgBxk5de6f7THQVvOrLyQmTAT4gg/7K+qaok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829826; x=1793434626;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=w+IYHsEbRgKxuJ8r40RdoQs4QyXY9GtTzfcnxaTiHdC4lxCUjYYqLwAjNNDtb/SgAz
         J39w51cSaODYdS67E7opQ0lbdncTMFTBjqEbryruO/gto8G1Uhug1PtpiC91qejRSevy
         c+yNY8NHMkxa6EVDvwJUJF6pGoxxsUUiTQajoC0k6XoZD8CA75bPy/LNDJqw+M0Nw2dD
         6vLZ6+3CP41mciRQ+VHhFmQRy2Nl8sDluY1OrOTQ/EufMy4AOzKab845LHlB1+YX6mIB
         XirEBr5pHw3KZ5DssPcsNk4yJ4nGHboecV6jWzqjEdmPJHxWRkdOVWxusycfJ58JIH/v
         L+qQ==
X-Forwarded-Encrypted: i=1; AKwUvByY+CUoMxT1Ysl5FTzMoYhXiJN05M93aeZbQpmi7GhpGbp2goctFLOzJohrfxDOcKttVQLxpxcrRHoqKKcU@vger.kernel.org
X-Gm-Message-State: AFq9FYIyM1sDPTUEIg6P+Xe60t8balSZuHL6T8a7S6DbpDALnpy48miw
	EwkWfkwFx/6/uCPLyCY5ev/Lzjiv3pR+l5VCTOG/y8aN3AlFyKrcc1Wr84lkloRZc1+gV3hYeEY
	o+2DS+JEM49s637Dsm5OQGFDNQK7i2LMpUX6aA3gu
X-Gm-Gg: AYBFou3sVmtN5/oleNsa+Me7u8Ol8D6J1gAZDPv6JxdnvWh702ad/jo9bEy3xdss1IP
	geb0w8FHvG+qzg6uaP9wEc7WLkwwU/bGsz2Ozeuh8fYX+MZ9RZ0zSgXLCxxMPzPmDL88v/lt1Zr
	yw+OSLtjueueftlZpujHxXjP/4DUD22S8sed16JyH4/WSfOrB3DrjFC9klTo+JNFD5GfrZNEEcf
	GiuN2xLYhmOuetkpyclGvpdDlV+r3jYTTfv3xHeQ03JULFRyK+Ma5Q3RO3YGB2LfzWGRj18Ebvx
	MObTSETKKmXNAo/0AZE1wbU7geD+41sP3c9uJWsYs5SH70ZL3vi4D7hHpJC3FwRbEqkt/UVYHaM
	8UThrPpb7exLf9bvprauL/p3q9Fro7INlmNo=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b442ff19aamr1213416a12.30.1792829825967; Sat, 24 Oct 2026
 01:17:05 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:11:00 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:01 -0700
X-Gm-Features: AclHuK_qmQOwk_OOKs0VN1cm__skt9GZJUv6Fec-Si_oH1IGjBDYDz8yVEqOjak
Message-ID: <CAFLszTidu1NFSJ9dprCHts0-XY73gk-ZPAhz0V9BdYPoCcXmvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
>
> This adds the following commits from upstream:

>
> f3451d12532b meson: Only take the version from dtc's own git repository

The script builds this list from the last sync point (v1.7.2-69), so
fdtget.c and fdtput.c get loads of changes beyond what this lists.
That's fine, but you could mention it (e.g. the new -r and -d options
in fdtput, automatic growth of the blob, long options, strtol()
instead of sscanf() for parsing integers, fdt_pack() before writing,
the libfdt iterators in fdtget)

I built scripts/dtc and lib/fdt_rw.o at this patch with no warnings,
which covers the in-kernel libfdt now that fdt_setprop() and
fdt_setprop_placeholder() are no longer inline.

>
> f3451d12532b meson: Only take the version from dtc's own git repository
> 7a1e01792600 libfdt: pass sources as keyword argument to library()
> 8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
> 89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
> 3750493c8b0f pylibfdt: Add address_cells() and size_cells()
> 0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
> 5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
> 66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
> 214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
> 4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
> f116f4800edc tests: Dont have test cases link directly against example dtb data
> 9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
> 5f919a25d71b ci: Merge make and meson jobs using build matrix
> 6c1426dfa963 ci: Add macOS support to install-deps.sh
> 23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
> 3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
> [...]
>
>  scripts/dtc/checks.c        |   2 +-
>  scripts/dtc/fdtget.c        | 207 ++++++++++++++++----------------
>  scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++++++++-----------
>  scripts/dtc/libfdt/fdt_ro.c |   2 +
>  scripts/dtc/libfdt/fdt_rw.c |  41 +++++--
>  scripts/dtc/libfdt/fdt_sw.c |   3 +-
>  scripts/dtc/libfdt/libfdt.h |  70 ++++++-----
>  scripts/dtc/livetree.c      |   2 +-
>  scripts/dtc/version_gen.h   |   2 +-
>  9 files changed, 391 insertions(+), 218 deletions(-)

Regards,
Simon
