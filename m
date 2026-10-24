Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792803559;
	b=hdasje3Vb8na8g7poIfER7pXec5y1jcrxHSpWYZfRZxgQasaZqDtLf+Kuhwtlrk0xJ02
	 MKGFXk04Wrv2RivZBcMKCINITiLHB7Eo+eRgUmXONmfmgDIY3IxyYeZHs7y+d5AFBItOy
	 8jrW7svku20w633Tso/mqmGqq/eQlTtCHOHqXnN9tc/JZzGlPuAjjdaJiCmBXaBLDla01
	 VNKbR03CXd626eqRGXh+TCpEmzv22qoWtlG45fsUIROlBbGCdmfumndW8oY4pZU7x6byc
	 F2Qdf65kOAM4b92cK2DsKChWjFrrsbFfprbG2fb3sKhZpTX2IDKg25Ynuu8DI6FRtXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
	b=Dgun+xL7bdOkycg4baQbduofwljFbRtT4HAy9O4TTMVsulGyJ6Y4u3QBJ9+yNPGz2Utl
	 mihYDprZLv3MkvWgGLT9xoVfZvxMqOcZn8abBDPampFER+TRq7pFAILk74Gxe9ec3W6Nh
	 RXFwAvrxOBAo12Q0WNwXgp1wGQvjtR7pA8xisyD6mph1MjH0xgdDEBvgm1YqITc2pz/Nk
	 z5e5Hg+wO93hiBj68jI1/ek2UK1L82M7ddOo8K4XZ2hkOQ0KZul5AXQb878+WRNLJwM2n
	 RpM2NrT3MTdgm0XGbANaJJg93fBSo49LvUk8Sa6iam7VNZxBJOQK6nbrNCfi2Ao0BKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvNnJ2qJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15E606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB15E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvNnJ2qJ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so2916702c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792803558; cv=none;
        d=google.com; s=arc-20260327;
        b=kH2yIAO6/ndeSgamRkimDgKNhLAby6fU8fs26YI1nalUDq5FT9qW0oe0w5Pmsf0cwA
         rSF5PkGQUFrtI1uSCNGAqEAnIR+Lfkyt6Zg2lHwC1STnOO1oaads9CzoYh8SEW5SqbIL
         lXANNeG/CJafYJbKsGK9pEKuwBP4bVbdE4EJdWS8UB2l9fNVqF7HmjplONQRAJOFVfau
         SKsPiIKovxPE29NDIaaatr3J/oN9F/WnJCJhPZJySMAV+eNiBnI0bug6ZEvwLoulKvVg
         XCVq+YUnUmbdSGNb8i9Ca8CErRrqld4JWstFYn/I4vDj+8U9KTIlH8Nb//KVZQyrQoEv
         +F4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        fh=HM2tdxevIEFgwq3oLbHLJxbXzW7RvTEs2cwBKQT36qI=;
        b=RmagZlcu5YV11+4/0CyUKP1Au7BdQTjIqSXh10HmnCWYiQrIT1Tl154Kiu+aeXIAPt
         ESep2cy7Agpg75PoMisdIENRYMAHoBP2360G1TBOCL3kXbeG2aR9cTdmxSB7kZJj/p1+
         Y7yJQNwCeomE+PTXuvlAYukmGuii3pRCSQqL8urAhtEP9SW9+JU6YcTUQIg9B4zRfiGn
         /Mcnl7geVm3qCO4npo9sjx+xFWzY2k9RYeI/jLTQbf1iAbNs8zTzgUpKCO56b4rf8+4Y
         8RHmzjpASoq6F2wemlUxhOSZ1lY6m8EZbRe/pIf78UNGYyvRHL/x9hTlvcCDPlbE8V1t
         rXRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792803558; x=1793408358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=BvNnJ2qJiKNYx+kMqLstZUfLbZO3SWFMHIFNvg5PlmWaoOBd1ZXExM66HZnXjTCi4S
         unE6rjajRqY8/A7SPEfI+4LBAuyuJiZmoG6Q0Fq7Y+tQ9wmZa108XB9h2/Ng2vW0Xp/b
         AuD3gZTSlSYuSougzvuYb2iXNty1CyVxCSA205hal/Jtbnmth7kFubu1V8Iv8Z9fKKNc
         jNTDfuf7/PVrPtMco3654bq7gxYWtmwWshbc7A+9XOhzjwvfjRy6RUeLptR0GdzXx5k2
         Z19S16Xi3RX+FXqQpE5fkAoh5JaAMd13ZeR4cQZkBBCyl5sEOlwgR5aS2wARVCM7yyxc
         16ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803558; x=1793408358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=vqw1MCFXpKxP/hyWActyocLvjOwotAH0nIs7VeB86WSstpQj1DaHn8YcKBvVPZA7we
         6mhk7EFn9WiVYrfyXIStbSSjGQd1k/OeDXWI9JNWiWRKtAhC+aqhJbcU96WAJqU50PUS
         j1DKeAz6ud+PFo/r+R+C5lvl0ywsmXwj7WnKLLgnuykbc5l37d0UmE6KvT/JcVZi2wfM
         noEoHjLQrfOploeqmMC3Hqu6dbacGef8Y0b6f2UzMr4JYMDgYpfGzzWTrO1xzzWi68eD
         zNM3rtPttuhiDmLf1jhCZH20KWkQCLxfPfaEl2nONB5gwy/MnGmaWadKgSBAXJjsh6il
         eglQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKZooKaha/vGOsTXZ9Fo3Dy23a6l3RCrh3+/VLZGcuLIoaYai9WH/wLv/YHMYoiQON5n/uYBuWU6qM6DdJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKf+qMpbSjJnjjVYgVL28pHlfmBaJqIW5A7hGb0+JO+G+1Vv+/o
	PWuv/V6lDAxEWXuUcfJ2sDex6/Z8IFEPzGz7kreVD2X/EB6w3j7tdFoo51AxmLX+ZQQ397dGodG
	OudCjMutRVTLJ/aEeKPe4eAuutSBv6Cw=
X-Gm-Gg: AYBFou1jGebHp989pjM6BcHffd/uWtNW6hry8uai06znAKYf/oWchRyhQTJy5oTzwMJ
	xjF0+Li0x0XeZ1cFmqaQKzcaZOSFQCJOYhvmwHNrRgWhJj8rWwIClo+9UoTIBBgytGNO+TT0rf6
	vGBwzxEEk1W00ZM8Hn5RAba3X5Jx+bDvePQsjvaJs3EIQju6kV3aXLeUE5q3rO9L1wO5wuJyRrh
	dcg8ymNcgrHUsJnd6KysJH7WeUO0IFtqjWUrS00gklAKb5vE0WWfZJhcT5yQNm1W2tPSo1GhP1k
	FNZwHZkoMAy037MKBH2Gi1JgXJZSU+mnc5zxjZvnfst1ELdEUB00tsoWtNBOMjnCQtXAS7URUq5
	6IVmti0diN1/r+Ld3EMi/+DBiy0OJmjx78AHKYuaeAajC2t/dXWCIbCl748V3rLvsBrIR
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id
 a92af1059eb24-1992a250624mr874553c88.1.1792803557836; Fri, 23 Oct 2026
 17:59:17 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com> <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
In-Reply-To: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 24 Oct 2026 07:59:06 +0700
X-Gm-Features: AclHuK805OtpEX04XfOwa7m3QcwJPrF0jSlDAfdHBuylNxB6UZKJYqAFi9tMyjQ
Message-ID: <CAAq9HC7EdA3proF75D9kKa0QFJswV-bFp284u2vUfJi-dcj2_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:14=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> > MSM8917 is a single cluster SoC, so powering down the cluster means
> > powering down the whole system. This causes two problems:
> >
> > 1. The system becomes unresponsive, even to common interrupts. Waking i=
t
> >    requires an interrupt from the MPM (MSM Power Manager) or scheduling
> >    the MPM to wake the system later. Linux currently has no way of doin=
g
> >    the latter, so the cluster may never resume operation.
> >
> > 2. Entering power collapse blanks the screen. When the state is entered
> >    and exited repeatedly, this shows up as visible flicker.
> >
> > Even if MPM scheduling were implemented, the second problem would remai=
n
> > and it wouldn't fix the system being unresponsive at idle.
> >
> > Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> > is less aggressive and can wake up from conventional interrupt sources.
> >
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
>
>
> https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.=
qualcomm.com/
>
> and
>
> https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0=
d5638@oss.qualcomm.com/
>
> are in flight, you may want to integrate/test them locally!

Thanks for the tip!

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
