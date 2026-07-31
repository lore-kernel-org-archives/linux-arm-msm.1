Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E622340F74D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493195; cv=pass; b=IeeQTUSvSo3+A/5hFhUnLPxPB7tOWtCzQSyfP00ZCr3hiYkpPqPjJlDYTMnu3hg9eM8dn+BZ8qFrfZw3NMQuvtjBkFGLsXGP0nmcPfANL19Xljk5y33w3C/kUEYUwDUlSdRCq1MhNWlBTsESiev4SaR5a2pYL1ZYsVtKdw2g3IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493195; c=relaxed/simple;
	bh=VtshzBCb2KjKA11YGS6bsR7f2qGbXQoLS2YE7NaD6Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyGbse3ebIglT+cpV45gEXSag8RbYG3jBPzY2e1AyhWVSIIm4brNtvp+AyrFZM9hXBmcZhMRfq+3pkkl0E/vL2nUw7z4T6fwxC4x1aKdtCAOVg5qmKiHlkpF6+9lwCtyPqLLpf6JZ5gqq4exHCp/zKqlSHu6pAU+PYeMKAYYtbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KC0xiEDd; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC0xiEDd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848743155bcso415490b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785493181; cv=none;
        d=google.com; s=arc-20260327;
        b=j9dAlVYpDVWT1Dh9TCa9+sT21KaGmHVHZtThHB1BLh3RsqSolWxu9eTjMJGpZHshjY
         AYa4oFu08/w2pfTeaSX3wxO5UKcu6oVehwFef9hWxgum8gUg668gHJacGl0Aa5LXVBwa
         7b+/jvWvLn4hTFDeMRhg+R+GBWi4Jfv0Z366OkAnHfcGEI6ginV4HQPPXVrfu3fzN3rF
         I3jLETO0uDeIhPXVHXYdA6A5paU2kbYUD3YfxuYZzBNZvevCyGqy44RMRpWkUm8vlw1k
         itOhEbotCMJA1hmSDY55qjP7i75rf4Z9IKJejEqOnVO1S08gMTkmFvytH7W9Y3B/5OCK
         Taeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TQwy1Ukj0VK04ebNpFs+B5E8b/zHhQKir61AcZcrp2M=;
        fh=ekpt3LFsuaqS6eRwaii3aAoVt3znwQAvJCdR2vkKBNw=;
        b=a5Z4fJVEXQgqDw4vC7Z+TriExJPvSq4JGqL8Dr9OqNGZUDkQrY3F+cTxrVFYxlRnvd
         j9mHCPGCA1PrCbtCg/8QumRRsdXifxZZrVgKsoHVCQyCqwu9zZo9k4iZBWJNQa8ZkSj9
         Twx7xULjzfrbKqXE1JbwQ2i/VdliWIof8Y52T8a6bYO9t2ohIUBeg+BCRSxBn/t6YSsN
         VBLiA1ORcH10nYjudgamXjF3/Dsqvg2Yf6h38wt1nbvsAnyKJFF/FEcR7MAlwdc0AouP
         b9l4Zl5Py6Y5uB6rJmD14F4zCV93E9Q51f+hrhAxpFP3ZKnRO5k+sh/OOTy6NrBXT9B2
         CJ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785493181; x=1786097981; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQwy1Ukj0VK04ebNpFs+B5E8b/zHhQKir61AcZcrp2M=;
        b=KC0xiEDdnPifMnTCsMVT5pEg/4tDwAvSpGZQmUbIBWV5K+TCEdKhkchIeHGi7qM/wa
         QjLj8YsaSQu5ks2ZhEaCNS7UUylJHcutmhevdHoFsFnnjVlajvtVsNb5UaekimnuNNid
         eTznb3QrUvo0+pqy4euFCA7m55P11n3qgJOqbBZYivIT5/498Zqh/MmsGadE32cjo46g
         WxCJbCvhI1toHiYKFnaVwRXcuQ3pKSeF8hCAEqOoVbaDhhcqtVS1oK9v6eEGeS7nPWlD
         xW1pOcDavUWeOameX6SCXluyiNMzZ5FzVgcAH7BlevdxV0Xnev8PYE4xWRGnDxx0QYLH
         llXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785493181; x=1786097981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQwy1Ukj0VK04ebNpFs+B5E8b/zHhQKir61AcZcrp2M=;
        b=GSYJlGRm3w9iRpV+5zC3Sodm+D4TDoNPqWku/2fMpKvNNK/bjsqth1mn7PvzYphay8
         Y0Ckgp4Jgjfb8V+LqD+yLfD8ESVQIJ8QjKdfUsvGVGRgCqtBCJAyeayOO61CJAvecCuo
         Y0sZlp0TRVc7Wxlv/iK2IC8OxjasAiRLkhZEDOUeihqsQOPs1kcEbTYziPI3W0axrE9i
         Y35kR5TXGgTNdmlD+JyiBapyI+TikAypjBl+8k8pxYkVcUCNeUi3kaEqyf0++HXoRiEk
         WGiR/kl3XY3+MUwSEu52XbLWW9A+xaf1Ru8N7jZ2WR1HbrjrqcJ6dMaBh5iL6iNe0dXT
         Ig8A==
X-Forwarded-Encrypted: i=1; AHgh+RrRQ4dn4p8ZXWh20TnfHiNlOlZxAbX559e4KI6pqJSYufQSlVnZlUzN0LmlchOYDkufhNkVt3vxbysEgpU7@vger.kernel.org
X-Gm-Message-State: AOJu0YzOaOTOdoY9iG8pH3e2pzfpL+zRlgEHqygI4vp4qDcjFXVFmNPW
	TPxvn71U+yXs5YozwtTV92wMuwkylDd00/wZJ2tOAdipbr3JL/aWGlxEj+iBX+m/qj67CXWDSNP
	Lr/xeYj++p3fDupwXZnIsRnCxsAz+zRc=
X-Gm-Gg: AR+sD10s5y8Tjl016QSW2IWmP5uABfn4o0cCRTbVBr1W+MyNBl8uH4hHveAydJO4sfe
	3XTqDtlvvQSMNIG9ufO2yOEBs8yU/wHF6FGgWPEBUeIaMQXLsKofV+qCsxnK922dyG5/WV2lj1/
	A/k+Le9pY9ARZFFcDtLLPxq/TdeUIZmUedBQxE30xxeyLcerPetrdtXcL1zm+kz04t8+zFxENpw
	a6dKRdqjHV6xM7+25iVGL1l5JiFq1bs1aC7HCxISzqqqgESy0j9Lw6Ws88KOgsHn+kr/VujWzXj
	XsgLfNagTRpL6gj01KTixSp6J71D6BJA+SFo2/oFh5P4piau1FmnzRurpIUOw2lH0Y4QB/gUzAv
	7ecZbe1urWwIApCEavVA3qe1nL5vKt4B429x7k2ei3JHUs1by+WJKeN6X
X-Received: by 2002:a05:6a00:600a:b0:84e:3a6b:499e with SMTP id
 d2e1a72fcca58-84ed73051b1mr1248797b3a.78.1785493181600; Fri, 31 Jul 2026
 03:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731030648.8706-1-phucduc.bui@gmail.com> <25cef535-ec13-4fcd-9f50-66c67cc64d6f@intel.com>
In-Reply-To: <25cef535-ec13-4fcd-9f50-66c67cc64d6f@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 31 Jul 2026 17:19:30 +0700
X-Gm-Features: AUfX_mwJ16jB_br5_HxDIl4yPOFtz5xsYqf3WCt_W0mE_Ha0unDmTuR4z_KdD0k
Message-ID: <CAABR9nHJ9oc2TfXaypsC7kAoktO4GW1gM=merno__YurNv-=DQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] ASoC: codecs: Use guard() for mutex & spin locks
 - part 3
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the suggestion.
>
> I wonder if --patience would make a better job of showing diffs for the
> patches with larger scope_guard()s.  It's kind of spaghetti right now.
>
> For the series:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I've updated my Git diff settings to use the --patience algorithm, as
you suggested, and regenerated the patches.
Hopefully the diffs are easier to review now.

Best regards,
Phuc
