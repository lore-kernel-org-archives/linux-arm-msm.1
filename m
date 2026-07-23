Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420B427FB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799438; cv=none; b=kMNNoX1h2Y6PKrLr3rKkqWwcgdkpqqvPoYJffaRnG5+GMRE69KqkcmeD6RQoAd70sYcqBhi+UYnMR2+x7FXrH3qnOTHdBy2dLqf+txch/w9TpMBzCMpVUpddxiwjI285uFDQ6vdb1F1UgEq+yNvG3AL29pC42eusPqrXSEH+n7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799438; c=relaxed/simple;
	bh=UHHEYrKMvzuzSupr2/g84h0S2cJB1TfXy3IzxYoKXmw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDqYNrVxxV5qUN5Mt2jCc4mkFs61uW1ujHQkUm8S8dftQDXEQygUonXX5vyHld3c+87rambI04PG11xRHKodnPDxtyzGNoyKDAKwmDg3T25LeSPBLBFGZTen8LCYb11Sd6VNKkuLtLNh0HuTJubwlG6OJ9j/JrhyQrRYVV/0aOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdfjBPdy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdfjBPdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316D31F000E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784799437;
	bh=fTzES2E2d90tPH+9oRQlOp14dLhGN56YzmJZ+EdSxi8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OdfjBPdyl1s4FIB0VkTzvgLT2UsMwKs8leQjZzgPTjION393uPGXSaMUus/K4PqGk
	 RSIZfZHZ41bwCGNY5++Rl8iSZ+F9K8R++Bj39Beawp9CqNijL3m2Qgj83g7xam8bgx
	 sfDUFlXF7GBbZUWXSP5whdERBA9oBa3WZmxLWl4qYwjZR4pfwKkRWPQkcw4jBU6oRJ
	 YF2ax0WLi0AHkBqDCJd2KFwURCQz+9wi1pWI0MuqqsMzHXhyMhzEhkpYo51w1REu6h
	 rmu5lrz+5nzdRzyeGsaHC7YHAPN32a4jtdvHaJ4gA3+JPECRFlC6FJChTRNYMfxrJl
	 SzYJriVeF1NFg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so395930e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5Sen7hfih80nf7sKvzBZHr6VLqUPl0UZkXVvyNpd1r6bVojbUUdqpKqt28HL9ai5mgQ67YggK5cf5FpOg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7sIb+i8IW8M5ik50obui9UGpH9p9Gm9YVivaKlLkrHQk7kL1a
	5tm8Jq4NHKcuPFZ8zwUMoPQTqKU7wkK/OReq5f9/Kvd/QZABjlePGN//gE+E6NAZiChS5vcijpu
	t8WNtqFPywp5+qYSNWN4Xq2xcvcL3ExF9YFiT9Cvnwg==
X-Received: by 2002:a05:6512:1503:20b0:5b2:9dcc:8e26 with SMTP id
 2adb3069b0e04-5b2b2f7c367mr296386e87.60.1784799433063; Thu, 23 Jul 2026
 02:37:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 05:37:11 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 05:37:11 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 05:37:11 -0400
X-Gmail-Original-Message-ID: <CAMRc=MddF5CzMgkUeCWbMFw=J3ZvbxK3qm0-oqvnaHFK61SKNw@mail.gmail.com>
X-Gm-Features: AUfX_mwNmj-4-Z-iXOivesxKtl8VG-OrWT9cvLrkpa9dzEwo-spPvV65NSiA9ho
Message-ID: <CAMRc=MddF5CzMgkUeCWbMFw=J3ZvbxK3qm0-oqvnaHFK61SKNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 14:02:13 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> This series adds support for LPASS low-power resource (LPR) voting
> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
> platforms such as Hawi.
>
> On such platforms, LPASS requires LPR resource voting via PRM to keep
> the subsystem active. This is handled by adding a new clock ID and
> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>
> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
> dedicated DT binding and pinctrl driver.
>
> Dependencies and merge strategy
> ===============================
>
> The series introduces a new clock identifier, LPASS_HW_LPR_VOTE, in
> qcom,q6dsp-lpass-ports.h. This clock ID is consumed both by the ASoC
> LPASS LPR voting support and by the Hawi LPASS LPI DT binding.
>
> As a result, the DT binding header update introducing
> LPASS_HW_LPR_VOTE is the only cross-subsystem dependency in this
> series.
>
> The intended merge strategy is:
>
>   1. Merge the LPASS_HW_LPR_VOTE definition in
>      qcom,q6dsp-lpass-ports.h.
>
>   2. Merge the ASoC LPASS LPR voting support via the ASoC tree.
>
>   3. Merge the Hawi LPASS LPI DT binding and pinctrl driver via the
>      pinctrl tree.
>
> Apart from the shared DT binding header update, the ASoC and pinctrl
> changes are independent and do not introduce additional build-time
> dependencies between the two subsystems.

But that was my question all along. If I take only patches 3 and 4,
`make dt_bindings_check` will not work in my tree. Krzysztof: do we not care
about make dt_bindings_check in linux-next?

Thanks,
Bartosz
