Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792838122;
	b=TUJfwwelYtmn+boq012FJHpD5p3rgDyfH0XqsH9KTp2JoWe1f9QFRYnhehL3vjlDhTKR
	 bTN5WrsCdtdQrZkjchQk7WuHIE8F+kcdocHt7gFLrj9RYKUoxbDtdOnXMugAQ1abKBaqw
	 PGL6BQKnLa2GUzN+nwWwSslRWcUDoMKnp9EPo/6sQF+O/2yjeIM1eXXGdDARhPaqGFjg0
	 MB0qv2Y9jZhA4nfbwhM2yphdru69vGI8VdRczqlYqTk/K/7Lj99xW0QRCIW1tMpqFu1Um
	 xpP7SAmu3NqF8a2ZsQ8dnE2tiBPAySiPTtbiK1fprEQqqOHXjgXUltLQOAtOtgoxpVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
	b=Zv6Cb3C5JhLA36UBSzAIM+7B5wxt8nEPYtSeoi53cyECcqHHTQ/lLNSv21v7WJOeq4oi
	 OU2DDJ0tOfBQe2nl26rgSfoiYef/vPK//kfkXIcLsjUzse4nUHjNEfqHDpobvh1uT7K3i
	 sdAQukaVz4Y4qVGXm18RNhhnsC0BpTj98ATOUOGr6HV6YfWgiINM3m+sqAVn5bHHMULZH
	 9fwiDy4D8xiNd2AkQP4Uv8lJyQ+/3ARVjGIGggHKw6QBrhYGyON0R0ej3onSoifa1DwM7
	 W5CdDNh7A0wwdQh1iFcJCzoNGY2PnGG8kk3VQc4FHhfmo5S6qz6BodXl0d0HTmtcw5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ljANwm9B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41889606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41889606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ljANwm9B
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1405728a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792838121; cv=none;
        d=google.com; s=arc-20260327;
        b=dzrk3PgpFpv7yyz6IXR+hl4UK4DPoo1F2ku0LBdUDmULquNMt81U7Ct/Yqx0Gg4SLt
         E6+WTWaN5d69x08CQnIM1RTY5jxRJYn1N4rU08UFLXQOa365vIaN36qU547sydYqe8cI
         t3s8Pw1sSo+Qk2GVDoSqyhA4MkHk7svFgkbEGCI5gPNasN1nunieOiUHu9gDggt+ZEYL
         fhqRZb1fhVIQ/CG9lsdkZFJBLpXLv07QPmsZvd6Q77BA3hUAga5J22wjE6JCBbBrlspm
         7UKOj7lQnx1T8x4VdJI8f2FPAsCbN2LY+ItulPSVHCOIQBPQ9oq+u1O5hchTCSsOBzbH
         xPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        fh=R3Pbw19vHP1uHgmH8zT/0kkfhG/U6Ulp+1gsl/omjp0=;
        b=U09nffANrHX2lnMiFBkje9B1M46VbEeDXZm/JeCxDLRFy67Cf0ybMG2FawLVglxlyF
         pzKpxdAuV7pxYzVgl+NxFihPub1wVNli/10dbW/vTZK7e4VhkbFTMWO6fe3s4ze88AYh
         CcavdosrRl+MevOxFkGgx/gXguQSHPQJcIS2RlclJ/AFhHRRozBnSkUWTThmQLeL9PwL
         fDFhxAiJpCe7Ej51lcMnlMySmGiH3XluBpKh++3tATLGBdNreRyBeM+HYSgOn70UWVuT
         3jqDoE3qj5PHjEv4+JmaOOBzXZHDTQ2aVqtHRbCY8WvzXWc1x6T4xk2yePVD4R/97fhq
         w1qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792838121; x=1793442921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        b=ljANwm9B6EoPJseb/Kq4puCiEF4EWyMyp3X4n2LWv14GXwcMXrQFunBzY7NF2E9Kvh
         xoYmLEaKc7xY3wniTybZ00WnXOXYEeViJU1q8hAjd23BuQeZ1PVEIRnsiXggdN7gi7av
         roBQeMjH6PF8lsFFd7DgRfYyWH/k0KxDXEyjnTVs73NNTKNpwYrRFsItYFA6/BY+i63g
         i6maHwiCRuuiGcsW0Hk9rhVlvGPADq42KmeiH+Dz2TPeB2OTJUFUEIyay3e4K6O4PMJ9
         G4uQ/e0A6ITIG7MP1X6F3PuHc2HnbAj7R3LDRS2JcLWacivlBpU3RzU55UsdPMMEgQe4
         s9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838121; x=1793442921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        b=NfMsLytEG9nxFEI6X0+B5q6UOWBIyLpvReula1JYtPS6nrKq5gfWLZlmwrrUMqQmS8
         YZBrao+67rD+mAlV5AVtllWxrM9MGJQ40f/LIDGtjGvO5ZO1DBMYgndSN8hik7za8YnI
         Ax07RSZYXnkCRuj9g41YIkmVdKxvh/GEPkXH752FVtGlC25eZ0B/fGiJHGqxtTOrwLZh
         6j3QFtT8Xoc5CXg8wTuDTeHSoT4cQnLg9aCo+1qkLHVLuCnoonK0Aejpe9bXjRR75lq7
         x/lOVXUKkowPHeO0DRtFlqNuRFuJMC5+HrBBNdbbhPOiaBZarBEz68pPw9g2uLzA9tWs
         /A1A==
X-Forwarded-Encrypted: i=1; AKwUvBz89x9Iwg0/IV7fT+Z7CBLY8wnohJjFBpjjZ/GmOvRHB0sxpkxreWcDsCRVNNRrltzrspTuxs+isk+GZ0cv@vger.kernel.org
X-Gm-Message-State: AFq9FYLjbSnLGJ3qwvMolE2CSbpPnpnHeLTPcZHxlaaqqNK+vM5adsA4
	KFWpwPcG2vBcRMaiiZG8UB41T761cB4+9xSjfpT79ppqjkbJyr7/Naoaqzqhyhw6E0B3OAWzhm6
	sWl1VfP8rG/E6mJsFL9UcOqIG1TdH/MZQMk4bQMXSezriwzgUtkoSyxw=
X-Gm-Gg: AYBFou2r7DxMR2F7RsQgcInJsHuP/lU9o0RiZ97ja2owNOP/dk85M1ksou2KaVT+XOp
	yETvplxeKrYqcspMlL7zQJN2aWTtKrPF8qfssJF3jlrKq4RA8bZNgPMOJVgy44YtcTOgVTRmzKo
	74SlXFXPa/1ARWJNJWzyvIzKBjKL0Tq4RUdBwyFdGT9A+jXDkMaqKAatwV7Ik87mEVB2OXcB8Zm
	jnzCg1QLdNe8un+NgQRU+dXt4bS7/i4+8BJ0YtzU3EjmXkYPbke3i4whroUgKq+TjNcz5f0TwgC
	sfoxDYVxkMSpPFexGf8/WZjppmuFNTZmQq9q2hslL8osK0IdkyIi5onWwvADtXmpopCDyQpMqwi
	tFndny2ocE3agA6Lp/dSMOm+TL/UPpbhlByDkFC5d6Su1r++0GnWg2F0Pq9izpsyBbeGzb0Gphc
	rJh9dBpJez6Xzb8NaI
X-Received: by 2002:a17:90b:582d:b0:3ac:c024:b275 with SMTP id
 98e67ed59e1d1-3ade9b2ef33mr1458580a91.9.1792838121551; Sat, 24 Oct 2026
 03:35:21 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
 <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com> <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
In-Reply-To: <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sat, 24 Oct 2026 12:35:10 +0200
X-Gm-Features: AclHuK931L2oXiPPuKzWcoF3-rZklcyBCLSRbJVaUCSuCAcGKc-a8jrSumJzuR4
Message-ID: <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Vladyslav Andreichykov <vladdrako007@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:46=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/23/26 11:41 AM, Robert Marko wrote:
> > On Wed, Oct 21, 2026 at 10:06=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 10/20/26 1:39 PM, Robert Marko wrote:
> >>>
> >>> On 20/10/2026 08:54, Julius Bairaktaris wrote:
> >>>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>>
> >>>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> >>>> which takes its AHB and SYS clocks from GCC, so the device tree does=
 not
> >>>> pass them back to GCC. With only .fw_name these parents never resolv=
e,
> >>>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails wit=
h
> >>>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 H=
z.
> >>>>
> >>>> Add .name fallbacks so they resolve to the clocks the CMN PLL regist=
ers,
> >>>> as gcc-ipq8074 already does.
> >>>>
> >>>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>> Assisted-by: Claude:claude-opus-5-5
> >>>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >>>> ---
> >>>
> >>> Hi,
> >>>
> >>> This issue does not exist upstream, as CMN PLL is not yet wired due t=
o missing
> >>> networking, even then the solution is not to add global name matching=
.
> >>>
> >>> The required clock inputs should just be passed to GCC directly which=
 I have
> >>> just pushed to OpenWrt.
> >>
> >> Just read your reply after writing mine, I'm looking forward to seeing
> >> that patch!
> >
> > Hi Konrad,
> > You mean the wiring for CMN PLL or?
>
> Yes the wiring

Thanks for reminding me, I have sent the IPQ8074 wiring.
IPQ6018 will follow.

Regards,
Robert

>
> Konrad



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
