Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AE4399E4;
	Fri, 31 Jul 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509089; cv=none; b=npAS2UQ+NEPwObn7wbhvl6cJ4+FKjvnS5SsgxfHc9qNh/MbyoGCGKzLIWgTWX6hGxK+NmDClUhcJ4iH2AwRSMwuWd3VYScrlkZRb+U7n/wJEyFIbKbWAFAMP8I7+dvxnlsG62P1FaZRSrfB+iWkjtPADdhvi+Jb47T94ehXAw1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509089; c=relaxed/simple;
	bh=Ay8la0chgyHStaJ9wYfubI9jVZzbFrfF5RLTStX8Ioc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/3VJQxvnq8FvLlWiq4IP/iJsH/OnFRb/gpl8i1B6p5FCescwSn6QJ6hpEfLm3W1M4iCIwKZcmvaCEr3FXbqjt2G3fowWBt05cFUeVbabTqtaQmVh9SsxPmV3Fea0BqDiY1cd94wEt8sIXZRhC3amAM6+335RMvYvsM7BEjhhHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mX4/R+Vm; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mX4/R+Vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785509077; x=1785768277;
	bh=Ay8la0chgyHStaJ9wYfubI9jVZzbFrfF5RLTStX8Ioc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mX4/R+Vm7atfQkOY0H8s709FvtkjrZMA5mo4BQ0/q/j0Vt8qmECT9p6/oD4CqztX2
	 hOAzIhayD8nNzL8uuHBGgW5jq3m9CLEvBo0nOOVC1KT4KbiF1bL1iHLNtqo1f1Qi1g
	 yyyP/CSToVX2vvPmeIpe9+eVEesKNyg9zZYsuNOcyeT0+jCD7CikloB8NxzwHAxz2c
	 2l9xrLVaLMwGycz10XlPre4Wl3dTipkLuQVhee9DPQf1069Uw5JvJ9eWoEU4bI50jB
	 dPppNAuZStJFF6FArxofKw2x3JRQlyXY2fnB+jfJHMtBbonHxoiktv3fZsrLA0pFT0
	 qUiVRuyX0CTKA==
Date: Fri, 31 Jul 2026 14:44:30 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
In-Reply-To: <20260731-savvy-piquant-chowchow-f516f2@quoll>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me> <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me> <20260731-savvy-piquant-chowchow-f516f2@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 03a346cc16caabb6151e5a5e35776a974e2e0a0d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 5:58 AM, Krzysztof Kozlowski wrote:
> On Fri, Jul 31, 2026 at 01:00:08AM -0400, Esteban Urrutia wrote:
>> Due to a different process design, SM8475 (4 nm) SoC takes things from b=
oth
>> SM8450 (4 LPX) and SM8550 (4 nm) SoCs.
>=20
> What things? This is just unspecific and not useful. And I doubt that it
> is even "different process design", because how one would know that?


The process design is specified on the corresponding datasheets for
these SoCs, which are flying somewhere around the internet.
Also [1].

>> Add a separate compatible string for this SoC to avoid possible confusio=
ns.
>=20
> No, explain the hardware compatibility.
>=20
> Add foo bar, which is not compatible with baz because it uses bam bam in
> different setup (difference in registers, e.g. XYZ and ABC),

How does this commit message based on what was said in [1] sound to you?

SM8475 is a respin of SM8450 on a different process node, which probably
forced some electrical changes.
Document the SM8475 compatible used to describe the PMIC GLINK on this
platform.

Regards,
Esteban

[1] https://lore.kernel.org/linux-arm-msm/afcbb668-ab9e-4f97-9014-ecbd5170a=
b92@linaro.org/

