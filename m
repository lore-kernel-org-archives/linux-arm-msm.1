Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469AC2E06D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 16:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674542; cv=pass; b=kobdREgi/jelPOFUZirz4RfzKEN+R1fRX9bFdGDllb+eeo66iC8RIUZG6amXW9RW8KvrUwApcWr4ZyAjGNA1IgPu1IW5uvVSy3TzmuU8bfYrCNe7kVn6RhhEvqKV8j8uMb4cnZvTeDvKAxSNrtO4q2DZ1ciXhMZnQ6UoQeMBSRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674542; c=relaxed/simple;
	bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xt4fCp5Q6XB1qui/EnIAuRWqzHiIakNvV1/0K9S99KyIEgsnKP583ZIu+wCA9ztLAgzGUNECifhsqbpJWi+dN01dRqaDo/kEpychE/T3p+D6ecFERa54fj61raB3nIH6MTNw1FMJVSFZHtRFJWAgQr5YHLgZORZsQgjYU+vCzz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYDe5Sfc; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYDe5Sfc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so6055216a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787674539; cv=none;
        d=google.com; s=arc-20260327;
        b=Y43oRXx7Om/7xQQjZ8seiNvbX2VZn8vfME/N6JkaA9hoZQoIAJMPUloyhdlRnLLTUq
         4TIRfv0w5kG0UGJTBURAVLdS7sm1S8jg7ekTUe5KPLnajeplOi7G1Akz/BGv6YVZbrin
         gs3J8460t2Z9WVAVv4uaJ5/CbCBHlLtoG1lkm+cOwvNsg3hWzeCbfj/4KfvMU7lPcoVD
         FhccBuzCpXzLKkIOlQSBTRMoQ/EENB/gYl8XJ07OUFTaEo2y9KqRSCq/bKwjwis/wb9j
         4Kub/yiKOzA3ZsW9WwzcBJfyXBEUBtTj2Y7ZvWkxUD1JvQ/6ycT9PUlrL+BnqHEqbeGN
         ZtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
        fh=04WNYLxZU6OBxLbgLsPG0ZJxktq8lwWJfBXavyF+i8o=;
        b=gbcZihXS1ps9kWtycaLMIm4xIUy3uaBA0TPSM21h8afoB++gviuOpX37zEALjxh3/W
         Us82g/VdGO7yZTqS3qc5gXaglJfbcuku2LsKu8AsZKehIaixvg3211CAAYzZshnmhSSB
         NLmgF4NNgZu8+hIxxLjF5hmxX+VWUKPaXyxrfo1A68afIbcDTGlFKFc61+fx7lhpzidb
         LT9j99SZjuOKPWsxaikjhf7cmVA3ZLsUHvKrMsJ8oRYqTnOYbKDzUCzv04AA4YmOp1zL
         BI6i9l+UP+EhRw4np88c90H6cCWbHqz9ktnohEr2AZZH6RPP355sUytWXpzLUtfoEsFp
         Xslg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787674539; x=1788279339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
        b=LYDe5Sfcrj44bmekSy+MJs3ZkuY/uJ1DYBOUqIO7oKKeFFlRkyOzCo+j1xKwS1tX0D
         iVaKnNSa+lWdNyKsGbmdKjYzbwXhxuPnP+fydX5cKuNdCf0jwSeKEqaED4Qgt+fwkeff
         3cvBlDUf2LyRzPconw09fVFK64j54dTw6z/ISV0iHTMBPycDl3QRES2aanzQAI/uY+kH
         rrVXRH0ySYaQmWYFgorcMizjdC5rUFepdPAtMl6BY2VNYi1kP3yoIRGx3d8spbG31UC9
         xNLWsHGzTqOtFo0vgSgQyiJIkCEEmG+h6d4RY3/UztfU2tEzi2AXtvlMPHlfjnbcMYLX
         hTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674539; x=1788279339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhCYfoLImXJnmt0+tRDHMMQyd9cURICYnhCWLjk2PLg=;
        b=GRH7HppRA9kYNJkKsjAybSXpDz+jA3aV73/RCtS+qI9ag4qNo2RHMz/ZzCW8lLMHfz
         FoX3OJEpNhbqG67bsWm4IMy8xSUavFNygA55Kag2Pm1A6ChZ9kB0GLqaW9twyP7m33gL
         UOnS3eRXaCVoDtGn+/NEM8nj9nNXbutHyeZT2YrHEC//cJo8eG7TZI50nhfAYfFnjpkU
         75k2KidwXjMZG54KXUb762GjLKpGUVk2AwWlRf4ejIX/cempkkmAknxAPj9Nba1Bw6Su
         uJd5l3zVBJyGeG9bKUsbaKWdQ15x2x10YJXw0S2rqRtAi+hhzH26Py/3IjS1anzgDf/e
         Nj4g==
X-Forwarded-Encrypted: i=1; AHgh+RpHpLtiuDNaVl58WaNLocGwR1hF2i9PygsrXHXjCVRrprdPshULtD+LMa/KgMgcLmJxyi2iQOut1x2mWW6u@vger.kernel.org
X-Gm-Message-State: AFuF++nZCSZSO0qLJQSJKwe3aOdHnqOksFtqrhKwW0KVtlJ7pSAWTMOC
	LJG5H7pf52D+TS3riBGYy8XQ6WbgHGN1YmQnXu7l4P0BrsbxN9l12ci33Q9Zyh7t7WT4DKFYPwn
	pe+D7R4YmTxbuEZfGgadwcVJ9q5azHQ==
X-Gm-Gg: AR+sD10+XSUVTiK74rM8pcZiDNAEmBLPSeV23Rn2JK8bm/peAJZX5zwag+FeH/9Qvww
	L0LBiBD42JAEc0RjE5fh7ZualIotHk6IsSk4Wpmm4bNtS5lpmA4otLCIipIROlAIP88LgsgweIc
	ctWBhjpe+931tFj4CZzopEfWJ8+Wh0OTj3aadEv8K3nKPLlU5NOtzPvqU+ZeppsDRZP9372sX6t
	JPeh1aMn2jvapvRg6KNi1tNncJGmaivVegXhZKxrwt8UPos8HNSlir88nPc58jBQMJ5z8k4Rf+g
	G/eOySDrEuhef0wODnYcgrj1uuMKsWQ1cUDeTz7YZMw=
X-Received: by 2002:a17:906:6312:b0:c24:6445:d19 with SMTP id
 a640c23a62f3a-c24926f3cf9mr3439116466b.17.1787674539339; Tue, 25 Aug 2026
 09:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
In-Reply-To: <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 25 Aug 2026 18:15:03 +0200
X-Gm-Features: AcwNN1Xh1B5d1Dzdu5ByG6tQN_JbDhHIx5uu93y7vcm7QY05B1IJMZkB-j3ldSU
Message-ID: <CA+kEDGFwSyebOLJEsg4fyQ2MjVuyPzJxq8j1acbmGeiOWw0RJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Replace old sound nodes, enable DisplayPort audio
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 ao=C3=BBt 2026 =C3=A0 16:07, Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> a =C3=A9crit :
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1].

Potential nitpick, I don't know : the Surface Pro 9 5G has built-in
speakers and microphones but no headphone jack, so I find the
"Likewise ..." sentence confusing or misleading somehow.

This has no impact on the actual code changes though.

> The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.
>
> Replace the unused codec nodes, SoundWire controllers, LPASS macros
> and related pinctrl with DisplayPort DAI links (DP0/DP1/DP2) so that
> audio is available over the DP connectors. Add the required
> sound-name-prefix properties and update the card model name to the
> conventional SC8280XP-MICROSOFT-BLACKROCK form.
>
> [1]: https://support.microsoft.com/en-us/surface/models/surface-pro-9-fea=
tures-and-specs
>
> Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition=
 for WDK2023")
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Cheers,
J=C3=A9r=C3=B4me
