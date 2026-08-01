Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BE3393DCD
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545854; cv=pass; b=lGYE74XdPrJWV0yU+AXvK2T9OpVfJs7EVE2h4CvqLO6D30ZrwmY+kdlFaykcj+uIGfUIFEnmeJQuXPlO342+5kgFPWS1CH9jw10XUrdMasnJ0yhxaOislJXoY+6d8S0ekzWiNkmyYVtNVjUg2bO7HhIXCrYu5BqHUug9mGNw/TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545854; c=relaxed/simple;
	bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4X0xoxQQKtPfOROpbkgGTnsydzlL8uzP7d+mqn9KmJn0Q1LfdTU85bL0M3EKjgyPeWdCh/K1bLDjPkFR07K3dH+gHrMQJe4rtzrrAZZQrxrNIBPjXFtFGawA7yMEXQMamiPhVwYrP1L/SD7/ufxaTKQZczThrzBVq5Y3GsDQ7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG79CtLv; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG79CtLv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1f5208b38dso291559466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785545851; cv=none;
        d=google.com; s=arc-20260327;
        b=M1WuvTybVjzXwzi6Wyy0IcqQ/C+6LgR5I/uKxCut5nQm2qp3KMzLOzoinyR9XGfIcl
         obr/ncs58i5vyl/ZtJUlMuxqMJidILHbMAmoM1H1N3vnkbZKfn7PAgmaautEBunGMCE6
         +qcKodk9PKkNeyY+ESoR/qbw1iORKVIZ+aPpFhD42oI9XPogNoIoAvPu6lgd7GoQJoHg
         AshUky1D8BvwYcvnCdkqDLS4xPQRmpamVZmeJMPVK9KzZKpHd67eVsMy0MeEfV/3C48p
         /veXYrB456L1nskMPv36/WuJc4mDkX1X8Cipv1C0/dM3Yq9eTzqqpQh+SryOPTQeM0I8
         WKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
        fh=e/v+c7tWv0Fby1jRs+cN21J/hVeQ901oxaY1VkS0rE0=;
        b=FeCk350CW6s0vyguMN0CUCBAgR22AGUaFZa6uD5RGK1EA/VrUGU2rNOKbFHwgFN0Xb
         z1IWzwkBEIrv+kkhSc7Ks1OE5SbVvfHfFPsjabwoP7itZqMw3P1QJXpchfWXnfGShkEk
         V8lYfUJrVH6Z+od96/FqyDrKC/UJswY0f2kgLQkgEeHJ65FpomnBFsB+1x28F3EJx/a3
         556oj2QAnX35afah2oevnUrMe90Srpj+9VGf/d5TEXxRGyEBR+IcFRFHh8vTrIc1APka
         Mk+I7KJ/kP2wS6nbi2ORrkq3SUHBs0NZjgir9D7fhYP/KzzvqwqaEJwum+Wyp52dCIB0
         FEsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785545851; x=1786150651; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
        b=OG79CtLvTsd9kaagJMbxh1ypR9pYeqtjHrDF2dA3iEWX3Uy6mDYkvUv0+OzuZaPFvH
         Q7TN+rhjutt0PZ9fWgUNhS+Eh0EMdt/p4VCRXuCgtMTUd7HoRquww81m1NDpA47i9iEB
         xSWs3timrHpBALT5r/KarFQ29N8c5rgNQlEIrgBfgkE5eTk8s37wATUWRbLVOpZ7yxPt
         K+KfeLPMQcN/5forqk17xhpECp5FxOUJldlzE8nL32Qo1pD6I756c6Eoo7iEiodAHBfm
         +rUNq9MDR3XzPlBWmwPWOQkDDaGNfVOaRo4gR1u0vZWclwncD6b5ybZt+HO6MJNsOyGR
         dFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545851; x=1786150651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
        b=MSFodtc//i505ATmCnq/Ki4jcw9HREPnYE7WuthjXmCKGT3qO6OIrt6wsL0KP2ULBl
         5bMscT6uAgpjrKw4PkZJz6y6lHnofPFWdUWUCIOciG+mECkrnYtzVipIa5VDy8NbrUt2
         IV0TeL5xSwzswh7TQL71h7+KqsFjTOqIWdu188hcd4u/I3IBZ94ldkkvIH74lN6Xvxz8
         3j5HC2JaMTeTuB9cgpoj+ivh/j2BzqQtniSTrxcsLsSxAyNr49WqDdL23nDVALwN3oN7
         rG+v0a7EDxuPMiOi+4sZudnC8nw5WCE1BWYrItRtwIdY3xEasioYLHTj024czK6+IqyZ
         i5nw==
X-Forwarded-Encrypted: i=1; AHgh+RqqHPgpWtr3Csvg4d3At+rW4MiJ4rK9od4M2MuXvNh2X/SEwCuoYTG0IIo/kcrwy5TOrCYqeYSCFldc/DAu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TKitcQBNmW79oj4UaILj+5Dk9jCJeED5Il1Cvi5VTfkRq2HD
	wP3eIfvKo12oA70Hm0hMbTJnWjaloXJ+7EGquT0JddyJkh15uyhrW8ZDuY5wfmetmKlVKpAjVVU
	+H+6rze3VQ22Tkc13Nrv+wf4/1BmO4GY=
X-Gm-Gg: AR+sD12m76okj+MB2jSHiKln1DHdRy7NZ9PBnsXV2BVSGuNes6mIvLcu8LiIeh3flhO
	RH7jdchJXqkK/9h4MQwRKAZ539oLidstLADcSmu1BYo7CXXC+7AqzDgJoDu1e3OP25GC3/Mzyoh
	ErSxVKhux6lgsEIUZEMvwOSFUScoUytoYZMuG7Y2v6/H7yIpzHhOW6+O+3eL5rZJANZ58oaQFhC
	3LvDSypGhiOJvnCRLpYh2Hc9Xx3CdGGvWyr5uD+huhs4Ggs8z1eSZr6vanaOXGcQzcqaYicceLv
	Qh+DaisiH9OARgsV5a4cnec8uxFzxkzTR7Hy6A5AYYL2LTwujONxYdmUSXCF2ZaJMz7CG/huntn
	Fj5yTM7lwOAXQIR4w8TN4q2nUisND/IlC6R7CixXEqvNUDvLnpSmMygdPwkHFCu34lNSH+0tiIB
	v1OaW17N0sSvNZsyuhSVZlsZP340awXS3cxjjjqA==
X-Received: by 2002:a17:906:7947:b0:c1a:5d49:f99d with SMTP id
 a640c23a62f3a-c1fe7ecaf36mr97140766b.7.1785545850680; Fri, 31 Jul 2026
 17:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731030648.8706-1-phucduc.bui@gmail.com> <20260731030648.8706-12-phucduc.bui@gmail.com>
 <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk>
In-Reply-To: <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 1 Aug 2026 07:57:17 +0700
X-Gm-Features: AUfX_mypbAhFBcdwt9PJ9n9jAqYAyvhlmQ7Q5VvvhQOXU-dnCttanK2OffHgnDs
Message-ID: <CAABR9nGQvyeLsG-u3o6dH_R68SUvZMAX1Avsg50ySEd-5KGXAQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/26] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> This replacing dropping a lock with taking a lock which will both take
> the lock twice and deadlock.

Sorry about the mistake. I'll fix it and send a new revision.

Best regards,
Phuc
