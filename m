Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793128790;
	b=vMI/JytTLi5VQiNywd8whHZlIgdf/md0RHTn0gHd+H7aVQKrtEToS1a4ornfnkbP/t4M
	 tfyo6VDuSsVRiA7HdN99ppF7xILduu7XeP9XTDGakryTRaPw/+NhENJJxhVVSSwwH/8Gt
	 PYNI/V9r6MnzqqbOeVRHc2X0ui0JsOXcqIfpLE8wg5uIv+bgjXVbNTEG5ckOisO6bk0XJ
	 tnOahRiB2/vE7y5jhLdL65Am/qp0P0Ca69YGQGNxghYxgE8uf3vyDWokk6YEFW/aAnpiW
	 FBCnKvrLmVfvcXfFvxA70hMPlBCGTm20gQjlpT50g2TgeeQ8ytwzAe3dZ/cHBKMZYrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
	b=CnCJN1gWCPXO2l2C2htHXzYR2uM487Khj0MDA9J4qjriGkHcFJH/jWtrQdsHyevd5E44
	 f/ScaPe5rUNWugsJV+qatB6GZt0/uSmYn7/QhKNlVdcek1XN5rBsKBxtN4YxF/Ub/kRzG
	 nKMTpYFvl7Y48cXlnhPWhgvnUTTHGFmBiYXv0qiwUfRl0cVnYuI2VQovBJlQr3QJXXsHQ
	 +A1E5SJBGHDkhLxOKEFEw7qmDjl/nx1gx1Tmz1jnZB5ub3SMBfQbwcl4waBVmL8hn5Glb
	 /Z/ZKxNUcpm3sNAG/NarDmr0+BP/Ebgjf7yyBNoMaNWlnZQcSbLRZxLnGTiTSGZc3fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7OWrcee;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC1606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 19:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFC1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7OWrcee
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67989a2f9bfso167030d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793128789; cv=none;
        d=google.com; s=arc-20260327;
        b=nJQFL9NGg+Jyc2k8VBVg0tPx+R92/SM8bNjKfAdrICnB2e1nxvtGuRZL2M+cmfLcU8
         qZRgGhxs5U4Dhs3R4cgsFjNo1YBG3P3ymi2Rngq0rlmsQHRMEqYI8OOWovslaWx2LfqS
         TklnFXqgGK6d3KHE4L3Wjbv85c+UQWibJiPH0eprU+Da7GJRx/TeU/D+gpKzo54GHPuj
         HYRWZeX1TZ9YiXydPDg3Ww58nqgAImj+W/xzkHWU/Ki6qs0tKwHYGZ2rXZXDMIDhGUkW
         +N8piCXLvmB4OjQuiV6QISpJ4zkaNEzD9ppWqWLU0PI7BaR182zzG1DwPhXWXkL5ixLa
         fcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        fh=cbfgTs/IP1DrWD/YE+X2UTjd5Xr/nFluWCV8b5fiHq0=;
        b=a1LIWmsEb9MczvWHVrnPgkKXds9xiCO5sgRzgC4OOUluDACBw37fgNhywGmnoN85Zq
         gLJ4itP53OD0nwWywZ8nN9R0Akvgngwt6iRic8QqEwDnunbdM+OpfYJmz0BMLhB+yttj
         4lA4ynntv33IiY0PzLT6RjT/rveWNmP9qjfcfFUFvvoGLLEqjvKzxzbGJGsguOj+03h7
         51dd2UPcDOXJ3VABcYseJKPbPV49hAJk9FzxVXk4hjIoaUT7DBVj5aiPzV5iJIU2Fy6b
         MXLrwwSd9vhpt10yNvlTDzuicaMZ7EhPslZA8uY86cgDiH7/cXI00mA5VcEiQybZsaMs
         IUSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128789; x=1793733589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        b=B7OWrceebfcXCuh/DhLY0EOzbwxS4VXIwx+4ErbIGYhP3m6OebBZKVpVzxUm97HkC5
         RATOxwfeWslWPH/on+cse8vmweGFq+Pe7cq0tJN6X5HmrQGSM6MF/ULWw/gpdXC5i5HG
         9NkLvfNE83gBYiy7Ru5QOulO2zJWhVApeBVoR/qyGns01Jom7oclFyk96zrOU+AXkJK2
         PoweW5z+p/yrJepYOWIS1yrxxrIxyvqcLqQF0/7ufHkRXBqbpYKGGSkPRGrphfitbASs
         qiM1wCpc6/jEu7uoZS/DuWD39x5VP8sElaJBuoLijnze9E7K6anFEzu0cuTEbh8uDlrr
         dYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128789; x=1793733589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        b=tqHDG91IUTB6He7oQawMoCl+w8ykZb/selYrSZwQnXUlrIxJ+m1qcjr0/duEAMlNma
         clrx7jlzo/RDpAKbQz/p2CUDMXoq7eatr7iIu0wFsGXq/AWBkSP36IjAtb2oz1dR6Plq
         8vn9i/ADhXHttLpQykLHlSOPUN+uv9TDSGKasfrPMzWC1Y2S0CIfdpey0OA2rgodMhwe
         /gM06KsXDRy9rW1O2Fic8MBP75uNxovtivT0BVQPkGsBQELrRD10exrMPenpUyQJMMyb
         W2OwFzBzrVa72f0JyXyhFOGyDJHDKABCXlJdnt0OnT8uWGQqvLkgzWJGnAxRHcOqgmO9
         Vqmw==
X-Forwarded-Encrypted: i=1; AKwUvBwwmh0lJ7aUQ1aq9lz/OHotILybRsessb4qa/NJ/SZO1NecGJJMSOEbbjtblyzJ6FpELs6S4HrMA2UbnBGl@vger.kernel.org
X-Gm-Message-State: AFq9FYIlSLdkP16b5K2MbjGuaPoQSbs+PqiK02t6NimOjHDjtQzCefCV
	T1qmaam8cdPWMZTTzPeBFmcmLp4u/fmG325aF36etI3H0VXvumU2xd1XMB96pH5iPupZgvJ3q4T
	JxjVIvQkDrCQRXEssA0z1CnDtkLbaaKQ=
X-Gm-Gg: AYBFou0uHgPSB5DO1QQZQf8FFVHI1TchsiGc/n3g7lmTHvXATNjVTUUmBlNkRZ7cjN7
	nzJ2+TPCxgNim1LxGLr5O4xlRZgkAe9V3BV2GMJdvM6NjS+p6vFD5609IeQtA7j6hoCFFU6a3Rk
	sJRhGbZuceGI5DtCwWNsjg1LZojNRwxqx1UQuPRnA1fVrBDAYdLn/TS/hx8iZlgbvkWeWBO1MXa
	nM73amI4/ShYlFom9dYO/9KISpMG84AcF8zvNhDyhEQM8o9im4eHzGyzBfK4Bs30uvC5b5GvQ8c
	dhfAXWfv5t5Nz2spJ227RB8u03fyHALRFDMqwMgDGrNBXxgkzWgDDPVRba1P+oAEB8jgd4fmlW8
	5viLXsDsSSBkisg4wgm/asBoZoWBIoaXz92J+
X-Received: by 2002:a05:690e:589:b0:679:9afd:c0da with SMTP id
 956f58d0204a3-67a7bce2beemr237682d50.70.1793128789479; Tue, 27 Oct 2026
 12:19:49 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026154001.9323-1-jeff.roach0@gmail.com> <20261026154001.9323-3-jeff.roach0@gmail.com>
 <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
In-Reply-To: <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Tue, 27 Oct 2026 14:19:38 -0500
X-Gm-Features: AclHuK8SfxQzWuTwavpktbuV6X76nKFATsMGirtAOEaQ-uUx0DzvkbTO2fqQFh4
Message-ID: <CAAnD8RbKBMaCEf8rQZdnAxMSW-oUjYR2GCqwKyVSy0pn=-CzvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:49=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> I hope you asked the agent to go through the regulator settings!
>
> Konrad

I went through them against the PMIC votes in the laptop's
ACPI tables. All match except vreg_l1f_e1, which I had copied from the
EliteBook at 880 mV; ACPI votes 904 mV for it on this board. I'll fix
that in v3. vreg_l1b_e0 (DMIC bias) isn't in the ACPI tables, so it
stays at 1.8 V like the other Glymur boards.

Jeff
