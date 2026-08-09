Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41032E736D
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786269720; cv=pass; b=o1hUgxhe6g8+f44i3yNglcQAJKkOtDuEbrqvvMEhYx1PiGd41GPVhXyqnZyuQpm43k83Pa2WL/TqAvKR+QpSHaQyTE4mV8bikSqcp84zmc5w590UhNEsHm422CiZD1iPjkV8J5PtnQL+Ih3dtE9qDwhAdR1BmmZDbReTeqdY7gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786269720; c=relaxed/simple;
	bh=/x2G2UyeG5EkyuSGA849izepJeHD1ZsiWWA6fpjB6c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTOnjdl2GAHv1zSTGJxNSOTyw/GcYE9bFXFa5EvYQZ6ZYeKmhRpCY4JbVad5iTmuWZd+rHQdGV9pNs5r0mY2vwpfl0M6uVlaNwhbXTbjgMctsSm3T/AsyIGw2TVKP1/Pexec58FN+q20TpSuZzEdd1MkAwmOrRkdIRGpUnq1zhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+LQTyST; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+LQTyST"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ced3386430so11491265ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 03:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786269718; cv=none;
        d=google.com; s=arc-20260327;
        b=mh+eydGXltm98+fO+86sryl1Z7qIk2kL/JQaWTlBVUXucmMPcxVWc3x7/Ab6at0ed4
         Zxt/4K5kEeKtfoI2bJtIM/lCJyFrH8k2uRo6nsy8S2wZeKb79snybDHrn7e12gU87RvF
         NUREnnBY7Vd7ufc7qAGW+EIX8mZGXukqNNikUSjmPp+s7+/+XsiE3tNUJ1gPTaCnOoKX
         8BCMs/TrjSKFTeWAiqSpPaY9lL9Kqnl3cwQClmioWp+1nsE5tAPwsT+Qv70HR/hnydQG
         vv/gcVpHQXcfcobe5qVlCmtlk9AlNQ3Co6wDlIO7PaILMsc+OVKUaoufgk6/rW0e8zlM
         ASzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        fh=TGMUOBN/vxwf1OtwByxd6JV/d1xkZN8RZBn9vm11JR0=;
        b=fsk/qt9TjmDEZc0nuSkaPPiYu2jm1DiwjadmKf0gamhMApQbwIg+FXNF/fLQEl7K4F
         K1qUVruOHL+ZqbSsiJGdmVfrArb+sXv/7JxpysfWBoUqpTTbfvQj2EO87d1xkQOB6sxc
         7ZsR7Q4+TVG4khnfhzbDYczv7eLXiNQ7HdT9cS6EIv164+xhP6DbJEFXSaoPMtjOgyOl
         bRl8fnNu5faMK9AaUyEYSH9kY5NudoM3I4slg8YBae1FgFkfB+Hv3KmOxGPXiDT16Bld
         UZfo2k/wXVNjTuW9YWNqT1sSHzkYYm8dfd6FTMhqybJMMfqwV5eclbMegkY/qe10GlV3
         vR3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786269718; x=1786874518; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        b=D+LQTySTpGnMZPJWNYGJBEWc7zCqm1B5zc7CnCkrV/4XW3H8/tGoX/GDmUwHO8TH9h
         R65gg2RlTsGCEmjvvmPJPRbRQ4T+qnDTb28Op+rvirBhqKUs0ppp+uzPPGZ097cMdJ4g
         yMCTZm/In8BScvhHLzFl+F268TzFq23N+WFQZgqiDbGQnSUfCyKo2onPK58sqe5uz2/4
         4/3YNy/uTl6t48aAzVgSiKQVlbaNenRprmGjqCC72mzr6DHSIEHhhyjQUF8rWJBxdq//
         lus11BNlC1VsBei6AQdZpiLxliWuosCf9Y5NHJe9VAPGlNJdvvXG5zB1npa8Cq3Fv8tk
         tsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786269718; x=1786874518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        b=TSZUd66JhNPJJln/MPfcxhm4mosMEhOvDdAUJAQKhfiewvMSReGDnhdAWo3TjfXPbm
         7ysvbDTUwPsjqK95ur6jE6sBgrRyuiunZmxO27C1alLxGfm0WMM99jhUq0VOo7ruEyYY
         S8asy/9m7BHv2IYeCjur9jmVUvVPuPhjw+nteAwBxVu5AGeK9Yg4qkYfAagO/nfCkQgu
         9qtn4z/A2znTxLgR5DF0zT7HfjcOtMVZn3mgG/g6znZsS2CuPxJTQv4DSMiE3ZJd5hRU
         b+rjaQ13yCUbHnWhk3lvY9MGRctNS6XIPWX1DBwlvdha8Me++IyGKdGSwUC+Pb1gX6Fq
         uPSA==
X-Forwarded-Encrypted: i=1; AHgh+RryUyD/oI63KnmCffISQNGEI+zVDDIsV4bBPwIZdGO8dmKMb6HWLdlnhj3TNYgga8JclA5/j7IGOChPHPJx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy82o4H1PpTifFQw0VsPdPBrxv4DykXUf7PBng+MbdR+qx5sif
	6MXUNUDDZvQujrHbd4X5Z3JmawpqgaKVYtvPcx8M0fc8ovgqweCRP9a1n9lcamjkz/L7JoZaxpy
	HTeVy1p7BwPCg/Ksnqw1x+9vILvG6Szg0TudP
X-Gm-Gg: AR+sD11xVJKRqBvkF2xATO7mX2TM1xrS9G9VsPByB8QXtnvaerl9j28y+iqTJD+P5ix
	nHldalwKEDLd1EumsPKF5YPGGjnsCibf7QaPy+cfOdmzGVjCgg7SjoKtpy1P20cUqe0rvbJiCdE
	Xl9e37SuvPl+7iZ92o3534k1yXwqcZapw0/GohlPjoj3m0UfrGFYY/HIbLXpIB5GaW+otcd0ttk
	MKYMCUBfQPVPb/jbDzuGDIjq1myqEv9PEQ4RMRJLe8/rQzDMEYZ2eHMy2H3H94kSuUNCV4JFJrd
	IXGbo/SQU2Tp0Txh5OTMzCca46MGFTWlOj9HFlj713O1E6boY/uPM5WrRl/BV1/X8R2TTCqA1mk
	l19rMlLCS8XXoN25j1y4tFkYKpnX31PuyVRhHlpTzyn4Ub/DxYYSQp19LVaQagKpzrBrItAFYHe
	AeAaWWxso+xCwReHtu
X-Received: by 2002:a17:903:388d:b0:2cf:84bb:1ebc with SMTP id
 d9443c01a7336-2d294c223bdmr207346785ad.15.1786269718053; Sun, 09 Aug 2026
 03:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com> <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
In-Reply-To: <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 9 Aug 2026 17:01:46 +0700
X-Gm-Features: AUfX_mw1KVezTWqN2z4u9TeLCw86vjeGY2Ka_ePvHYwoFPbvJwdHv2HuwDWFspk
Message-ID: <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter

Thank you for your review .

> >   irq = platform_get_irq_optional(pdev, 0);
> > +if (irq < 0 && irq != -ENXIO)
> > +        return irq;
>
> This is still wrong. If there is no pretimeout, it does not matter if there is an error.
>

If checking data->pretimeout is required here, I'd propose one of the
following approaches
let me know which one you'd prefer:

Option A (minimal diff, keep existing structure):
---------------
irq = platform_get_irq_optional(pdev, 0);
if (data->pretimeout && irq > 0) {
        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                               "wdt_bark", &wdt->wdd);
        if (ret)
                return ret;

        wdt->wdd.info = &qcom_wdt_pt_info;
        wdt->wdd.pretimeout = 1;
} else {
        if (data->pretimeout && irq < 0 && irq != -ENXIO)
                return irq;

        wdt->wdd.info = &qcom_wdt_info;
}
------------------

Option B (check moved out, before the if/else):

------------------
irq = platform_get_irq_optional(pdev, 0);
if (data->pretimeout && irq < 0 && irq != -ENXIO)
        return irq;

if (data->pretimeout && irq > 0) {
        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                               "wdt_bark", &wdt->wdd);
        if (ret)
                return ret;

        wdt->wdd.info = &qcom_wdt_pt_info;
        wdt->wdd.pretimeout = 1;
} else {
        wdt->wdd.info = &qcom_wdt_info;
}
----------------------

Option C (default-then-override, only look up the IRQ when pretimeout
is supported):

----------------------
wdt->wdd.info = &qcom_wdt_info;

if (data->pretimeout) {
        irq = platform_get_irq_optional(pdev, 0);
        if(irq < 0 && irq != -ENXIO)
                return irq;

        if (irq > 0){
                ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                                       "wdt_bark", &wdt->wdd);
                if(ret)
                        return ret;

                wdt->wdd.info= &qcom_wdt_pt_info;
                wdt->wdd.pretimeout = 1;
        }
}
-----------------------

Let me know which one you think fits best, or if you'd prefer something else.

Best regards,
Phuc
