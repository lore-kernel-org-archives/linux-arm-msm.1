Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9AA26159E
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786763652; cv=pass; b=Vpap6sHQ+FnjT0QKBxSP0b80sLoquTy+brr8wv2GKm/owuUokow4lbA6bTW7jy+1kO9aSvDHXjo6iuD3ylYCxgh2XbVTwN8meAv1itUbMsEZDMQ1NTsiy7X6Km3+YQztBPnlFLjOPwn4SjEPeFc+e5uwohzn7KZi2Mf7U0KUBG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786763652; c=relaxed/simple;
	bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzOey2T46KpiCd08UxPWAnxwUEgyTUgympN1qo/3bbypD1twkwJc7R1fTPJzCxWVgUy/8FjQ0u5HYF8ZuIuGaudx0Jcub9XS/WQXoYH+P/yXFxqJyMFzITUwNztvd/V8vgArWKTMZNjk/A0M3lhTIse7gBA0VZK62Inz8EQfxIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG0stGcZ; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG0stGcZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d049069377so17962285ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786763650; cv=none;
        d=google.com; s=arc-20260327;
        b=rND88eEt2ejMdmnY63HCRlylJQwqMN11OxRBwRyJAdb5Zi9N4ulfP1rwzyp2AQTX/+
         AJlG5rZ3h1Lwk0fAEp37hyPu3wBdVrKAAQi3a9/0HiamKBuPstf/YGA8nQCnGA9FzlRG
         vb/CaKSj0uN4RLPInsn11Y1QPo9hmD1ULgJ1LiIxDcaYpz9ixOH5jxhUVmay0v2OKswV
         hn31yCZfAPNH+7IgJNcU1YKEnV8H70X/eGM5n868aixDUnmzOGABo0nkyIAFzUugyhHQ
         6H2dSIxk32U8+6JmOFeTq4jbTkvDnwv/QzTRIWriU0GfMiO7l8LqUf9djBw+Rb9jENVe
         /4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
        fh=EfWq8vi4p4WezIooKVfbTQXXc78uuuNyIvimsHFlBOA=;
        b=HVpiGtEN994BAA/4Vg3g5uVisLxLlPMpj80KdVmh+6m3dBN24GC012kVFSwpyPwksj
         ilJgOiVOz9tBe9bqfmg1v/IfI+PvMCiuUeuTp+Y+ceF9dFj2WFAdPFRGjLrpxd2eJhCj
         tXHyr2S2ULu0tjIoHyVN7bIuWSEk5Sl7AuEYKjc95s70rwBu+yt+7c7xD6nF8Na7SDaB
         QCJgO7UjOyHAa91Z9FtEfPuOzgFs/LsMUAmu9vYg/f5fmf5JnqmNhw/DSfHYuOHpwQki
         UpamXlsv5sz3PczLiYI9U6XlN2JfFDStYF1YVNhxgPWz+HDwhQfQZvQsLhV7tOjAD+f9
         LLvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786763650; x=1787368450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
        b=BG0stGcZSpUWRLj2nQICD66E/CXAsKhssCpp+LXbKWq9H1O30a6NGQOcx4mNQtLEu3
         4xrMW3TiWNKNjJtlM5l5S6VxMpGx+4Zsv2KEo7N8ypZbw0bSlZdK/sG1DLfsUNXvH6Fc
         1MjtLnbGwO1AIIqWJS0Io61Efq49GO395iQf8mIN47E/KVxgmteHOrqBtQAp7tGR886V
         oeeeP9q7R1l8rgwW0OnOA8W1UAbckiijH+s1I19R+eb9tgjFZ/tukyQ14X4sCcq4tfHZ
         fvKyPmDUubqmAj8I8Oh8L+1wAHU088JZEOqupB9xwNolyMYqKCmZCJ+IB9Xs53DdlzeB
         OiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786763650; x=1787368450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
        b=c/cm0b/Tc4F16ZXiVBqO3qAlMhmPzqTcNOGBl8rURNNQNQEUpOXA3l02fO7P47uGNb
         RY4pAcicoAVFqEC5gOKPCQgxOiS9L99CZ9lsg5pfW0ePehHcLlUR87tZFzSnxem97Irp
         Gw4pO+9CDMq+UGCmR6KNVr053kDKzC1WAzDfc7OtPxhoihV+z4vI//hjuJKivUaJRjXs
         I8sJmTImwBCaaHnvK+vydN7Km85OR9BGSFFB7F7WK7kBoMEVlic5gRjl3d8zyp/Y/JuW
         9u6U4lkN/zDfh4hZppHpjhwPr7NfBeHZuGNHTjfp9w7o0xZAnpUZRCMB16jIzHXbY59D
         APLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAJoWP1YepZBT4HxfEz8vXsVZO2pmzsADwya/Sx2CJWJSeCHTfjZYXo/oN1XXwq0PL+ldEPcQDqfRys0wc@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXH9qLrcU1nryUoxAKHMajedSedfJ8ffLyb4jWzjq393soqcY
	xqBsHMMZ48movYEW5gU5S9lunaAo8Orl9cewY4Mg0olcmxDj7GAFJsU9d/ldSiJj+0VTJZb6I5h
	RF6xJjHve3U7S9c9kShSs3MjTuGG6q8E=
X-Gm-Gg: AR+sD11MYwiPElg3KRW5wI4x2UeC02r/6gErWUv6hqpeuKxma2IlaAKU8Nw9oHTfo7h
	QkSQ2SFTN32c1j9T9EqJjGGK8Ioi1lTCVbgFGLCRlYO99FOThc3Ld1YiIReGxDbCZkkl1NGC4dg
	SxRBk/HXgVye7VFOnsZXA163p7xpWBeDrnyHryiDKLYedy/FEqHtwjV52IV9UjAZW0yLmlar6qm
	7g5odOhtXdSZ6gcg12hHQOvKIWTUje2UJSDOFV1Qe4wuT2IHpZz2GAfdAPKAgT1RNqWuoFOqxWD
	d2PlnwkXIWNiBlq3aByjUJpZv6sgwuRS24vfiaHsbOYoYxuhIISeJKLb0UHsSC9oWiI1GuDJb8X
	kTWNu3tdhJxANpcOA1rf7x9/e0KBj7GYW9GEUyjruVXCYE0l+UumlKWuv/9p0NfPfnUt0947uNB
	6ZOCNZlBp/2p4kjAI=
X-Received: by 2002:a17:903:1b04:b0:2ca:bf8e:35fe with SMTP id
 d9443c01a7336-2d3b0d9591emr116157115ad.16.1786763650444; Fri, 14 Aug 2026
 20:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813042012.17631-1-phucduc.bui@gmail.com> <20260814170001.GQ265046@horms.kernel.org>
In-Reply-To: <20260814170001.GQ265046@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 15 Aug 2026 10:13:59 +0700
X-Gm-Features: AUfX_myDmZ1LURZeKvvYo1pSU4U_UuWwDBLuj9naedtztPbUm-U9GqL07KDvox0
Message-ID: <CAABR9nFxfzf8QP-wq5iaJRTL+HG+a+tNqqX2daj-=Cwp46hPJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from
 optional IRQ lookup
To: Simon Horman <horms@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Thank you for you review

>
> It would be useful to explain how this problem was discovered,
> and what testing the patch has seen. Please add an Assisted-by
> tag if appropriate.
>
> Link: https://docs.kernel.org/process/coding-assistants.html
>

Greg Kroah-Hartman previously asked about how this issue was discovered
and how the patch was tested, and I provided the details here:

https://lore.kernel.org/all/CAABR9nEfPqXAt8wDo597qDS3b3KMaHeF6-swAFg9RLanap=
DnBQ@mail.gmail.com/

Regarding AI assistance, I addressed the same question from another
maintainer here:

https://lore.kernel.org/all/CAABR9nFgiNv6cnYa3+ZY3KnjbKpcF-JHpZY8TVcR7H40vO=
oR=3DQ@mail.gmail.com/

The answers are the same in both cases, so I hope it is okay to refer
to those replies
rather than repeating the same information here.

>
> The same check seems to have been added to both arms of the if/else
> condition. So it seems to me that it could be moved out of that condition=
.
>
> I would suggest placing it below the existing rx_irq/tx_irq condition
> which appears a few lines below this hunk so that those and
> dma_regs errors are still propagated.
>

Previously, I understood that errors should be returned as early as possibl=
e.
However, with the current implementation, I agree that your approach
makes more sense.
I=E2=80=99ll send v3 soon.

Best regards,
Phuc
