Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915924;
	b=W8DQZAOL/QXf+a8lFGep+F1zGeoC9BzlxssdFYd4DCDcn8yiQOXMcv3QeuApMymvpZu2
	 COS5odpEv1ZPJYSt8Q1p44WYygSWGTmojH1wAS1PTMe4Tho9DsWaUIK0Z0x6k1RlzVm7G
	 qFfIUIqKi09rQ+3OQJAkZYf/y8Iyd8TotNMPXq6IrZVF1+fuLcgCCmZDQBamMGwpgnBOk
	 zfnlM1vSKBSlDAiXdhiuIpFAu0SaiTptAXcfiwnsMY15i7gImMfEEuWHDcToGT/3N1y7H
	 /Fzyi4QKul+3Nvd7iMWz6fLpu6MciqcjsqVCIgVejXatl34MqfQyChoN9HrcmFKGSVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915924;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f5e+r6C+Y+boKKU1c+tSb6Bf3yIjeJVK+Xx6iJaNfGA=;
	b=dhfOu+YA3FVsIXS5oqqBDxBBMpKq3aFW/x7j01sb0J4bmiAz9G5v5/AYogBsbYT78k+V
	 1Hy4aKTS8w2p+F4iSMLl99Ttz/VqsZawzKu6uhhQ/ZCafNjXvbgjWw88+CDTOXRcVLJDq
	 3cN3Qabx4bdEcgzlqhvP6aQDWEy+7Ty4skBAJ92l2GbFRIFAoWCGvBujS07aWNcgYxOQ1
	 NYK2sw+HRpRRq+VzDNgjDuo29YeNklV2ZGID3aTn0jiXKolR246lpDT57DBMdA475DqDh
	 LiWSqQMlWzfsO/8Os/GlbcSqj5ai0Ecr2+UtGNdkxvZUCgBs5vuGpRarhNrzokAUmCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6243606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6243606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4ced671398so370700766b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915922; x=1794520722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5e+r6C+Y+boKKU1c+tSb6Bf3yIjeJVK+Xx6iJaNfGA=;
        b=bYUaG7mYM3tpE3WlIT6UqQQe/bFfRvZIGvfC9iorFqChBPRmWl/7nUeu3Ey6RfC9zn
         ECLV60H7W2xEfky/sZKJDrQilCrs2SYIbhg2NK4ESWnI39rJrO8uIVDbOSBNplpbHzRt
         Sn7SRdIeqhguAYh/bfgroVS3AkcVVHFYKNYqJJQYgJLbqDnp0oErBWi5DrjQsJsbCoGQ
         I3H4TQkWlya/0Y8Jl4mo7fCJJamFEg/QI2Wm8yhGnZ7eeTj8yHwMCEIyW8fIyJc9EK4T
         9Ge+Ct3W8+aO0y/yOWCPlBycewY2RYbLwkzMkiIm/9ZU6xTHBddLIrTxnX7Km24ohaC4
         eA+w==
X-Forwarded-Encrypted: i=1; AKwUvByF3aULXFtKMta7lsvYPj4wNYRhriBUfh5dbgq/b3dB+2CKfOrYlPCzEfeiRw2zJG/gosrpIVO0fC9UetO2@vger.kernel.org
X-Gm-Message-State: APuU4Z9OaBMyQW2hafaE5etMUhkAOpxUzx4MyXVpl8Eq5ad0IDrLNeFs
	uARdhz5zrBy+yo/l2Bd1bqyoeKvgM83+xv0hcIKONHJ6R6BgITYiujvYi8PY1q2mmzNRoQ==
X-Gm-Gg: AYBFou3OaBfVgZxzlXNazEiJaRM7YQfEyeUw22ZRHMvWdSVYisv3IvAD8jOkEjaEpGm
	KpNQbGrGrSxFqhi5ETvYG6+jn5gyyR/3r7iCj1mu27jPClibuG0KHvHf0I05OcwBkRwCXd8/AP5
	trkoUkqf/mFJPR/UQf5V6YJpJdJTQv0HCarM4pB6Lzc714UAdFAxF8quFOInmraUNDFrvJeSvR4
	IP80qUK107/1a8sTzR2oAZhOOgToHEmNkcsVzVpeiHLSq+ehzFsaz2XqW/XGjctHJX7ixLHc5nU
	CM/OZlPRGqB6yZsRtyp3F1KJazllNBIxiGkz57yaAfyhiL81ABoDB5HmYqwkwK/Tn2QdrB2h4Jp
	Hti4aktJRaSW4qyNPBW5tpH2294U5p26XxEtPtat7qYiRBRWcr5DMfoS88FQJUza8KQGtkmcKa/
	V0MQQhI55cWD3/yA64y3RafMKVdOWdz7byXvuk45CIOnmBS07SW4S6fxSLaU2XiGhyX84JkvH+C
	Q13PeKv404g0FI+1pw/UIKvHsIvSwad/PoADb7LwSU+kdGw6qAj2PoHwBnWrSscTHvg0Gm9iRuw
	w+f5C6S2B980HE5cHcYLzzrXrNBO5A8Fpy7OaebTb/d225ZxIefroegoKN8/JIgJOQixWhZKoJH
	nOuWjFA/EqxQR
X-Received: by 2002:a17:907:961e:b0:c46:75e7:25af with SMTP id a640c23a62f3a-c4d3541225cmr58890866b.11.1793915922129;
        Thu, 05 Nov 2026 13:58:42 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35670169sm21237866b.42.2026.11.05.13.58.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:58:41 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3597652a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:58:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBywG1Wz0W+kvcSWtPkUu+E7q8pu1bSxtU/ZgYTIoPfelMlMuqnyfmxdCbBEJYsHSex1oAYW0ZrsPndpFu57@vger.kernel.org
X-Received: by 2002:a05:651c:a14c:b0:3ac:ddd9:7820 with SMTP id
 38308e7fff4ca-3acf3b201eemr1185331fa.15.1793915531874; Thu, 05 Nov 2026
 13:52:11 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev> <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
In-Reply-To: <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 18:51:44 -0300
X-Gmail-Original-Message-ID: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Gm-Features: AclHuK9TNVNMsMH-gS3LyhmcwXP0L8JEpTnOqnWuyNklory8rcuhuvvX8_jSoFw
Message-ID: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Andrew Gigena <mail@andrewgigena.dev>, Abel Vesa <abelvesa@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Stanley Jhu <stanleyjhu@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I understand, I'll keep that in mind for future patches. Should I
release patch v3 removing the "Tested-By" now, or wait for other
reviews?

El jue, 5 nov 2026 a la(s) 5:56=E2=80=AFa.m., Abel Vesa
(abel.vesa@oss.qualcomm.com) escribi=C3=B3:
>
> On 26-11-04 18:38:13, Andrew Gigena wrote:
> > Convert SM8150 UFS to use a standalone ICE node.
> >
> > Move the ICE register region and clock from the UFS controller node
> > into a dedicated ICE node. Reference the new node from the UFS
> > controller using the qcom,ice property.
> >
> > This brings the SM8150 device tree in line with the standalone ICE
> > representation used on newer Qualcomm platforms.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > Tested-by: Andrew Gigena <mail@andrewgigena.dev>
>
> Tested-by tag should come from someone else, other than the author.
>
> Authors are expected to test their patches by default.
>
