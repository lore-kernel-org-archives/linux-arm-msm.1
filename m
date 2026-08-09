Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611E3CDBAB
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786287768; cv=none; b=K78PcMA8cJMi2XYit16YeqF0sPeUpAA5hcDTPYg8mg9wtoUvyhUJwmtto5VMVspzS6Pe0qwel6JYSTFgKD96WfBeLaY3X9Ibp11dwq+ecaVn9TV86626X8Vva5sfsO0aHBW4+khQ8/Ql6O+VWfMC0CClJ+N8l5h+krIvjiuSC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786287768; c=relaxed/simple;
	bh=9bqcyvf7d0Yh2BRS/ST81Yf9zUfX3VialSXDIsbKkzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyO+QWmsZp6v6khCgpK21zPgZK2+HaamPZwuqBBxolY90r/5zlfDIVW15SSWwh7T92e5HMA0FnNnMAFe4tmrzH5Ijx/0RBTO//CW/H2T2W65209CMt2YSZlmQD9/JaTn7OxG0s+Ld2aPW7sfFrJhmzK74HHnzfrCNB52k0vtKbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rL50P6Jh; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rL50P6Jh"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so650777a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287766; x=1786892566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=;
        b=rL50P6JhIkZojWGqdsxXPqfNhJfJwVyNJbJmIROJkKwFkM7se2DeRPni/bgUXsMoK8
         Ghx5zmH0fXc76b6Jtw4cOi9w1g1YV7syq0a8616Ho5H921wpaFirUCHLt3XDF3hcDRtJ
         jEEygoYvJoeohLn5HtU9XupUHcu6vI3+QLAgNTG0cmM6QHHRCyE9lp4J9gsYyPoftXQa
         BUrffdUgUPdFsl2IHosF5EH7xD9kN2JPgyjAfw9Cuh8707b8bbg9swsxDVvBC3O1mL0c
         FhzV6OYOlEFg3pGoned3KW3vpmISJ1pVCnp1Qq/gP9JV7MH3IL4ejH2xH8Ya6SmJYUnJ
         Okwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287766; x=1786892566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=;
        b=Gp8iwQz0j4aB5XO7ozbIqOyghjoIvWXJsimOa/ZJBZ2YBUxvdfZ0oxqDmlTgIoHlIr
         9rcCymE+0hBVgQAl+XWvZqfOWwO4nw7YJx4otNrpLBswqTajQsKCY+GSLHkLCsSuSOxp
         q2Oc3/qOIAWs7OSW87t6LXi+xA80q4HYx3OxXJQ6gO0VRSPnubVWdUwVW504/nUZrAyv
         0iWUVfMEPptsoQyA66IU4MtEZIwZWzg6Wcat8e4xfxJ2jDsohhVWFMhaYAm2XZXWlS3T
         d5D1/zVZ/9cpRsbrMg+aZyxcVicO+iJm78v+7zCDB3xqaEQSiAhQT4NSzuda4XH9LSSZ
         BBQA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2z+wpWsGG0XAZwlllRpxrGo6LkGcMtGOdkz+9OcyeOXrLrJ+taRs/ZPWb8saXSolQ1vcrnwPD4gaEttUR@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAjsmsTj7V4mY/iHX4kDzb13oRYx+hP50Z5M7WXVTTbl4db2c
	8pRZcu7xN1nlhRbKoxng9lvTsiHDIVw0wulCt5BeqlSpJKUX2biIMNX5
X-Gm-Gg: AR+sD11rNBmJ8Y9GKqg3wlbZiYgA/jCTiAzMtX+hnGkdLZxQnTWH675SJQmymgrhinY
	s5CdA4w+zGvJqUiHz90yD5PZEsl942z264yH0c2mcIigjEp7rGKukzTqoAIfyWTfWddHsYV5XKV
	wdWa+TlMRJlSVzOEskTYmKjyQI8CeQ/PSHPDO22e0s/b8plbdZi4ZkYFfMYfojQVRLhVcMZpfYt
	upg8fDy18H/XmM3d7F+7kLAdm4gHyceD8dxQYQqmlkIaUQqD4L92ttmny3IJsGpOxCta4brYfry
	En7VBT/urPbqfLZf3TMit/sW6eJ7Q8j7INUlxEO2NjMRfO0J8yIxLzrz5EHlhOFP2us4tajqf8b
	t7sPtGnBz3/AEE4WoZ04AqkBH0NLjd7gXG4C/aXVGRJMk0RYWZRHDSNR+qYRaJOp9xM86NedRRF
	v7oVKsl4Mmi0UzSrsqKEYpdqGK6Di+oSLW/greQxfU9UQ/Mzb2KdgDZ7sFkpfeYFse9sog27Q06
	cfikVANNS4A
X-Received: by 2002:a17:90b:258f:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39282247ee9mr14215543a91.5.1786287766154;
        Sun, 09 Aug 2026 08:02:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm25594852c88.5.2026.08.09.08.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:02:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 08:02:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] watchdog: mediatek: Propagate errors from optional
 IRQ lookup
Message-ID: <4a875307-19ea-486c-923d-78a362651f60@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-2-phucduc.bui@gmail.com>

On Fri, Aug 07, 2026 at 03:16:50PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter
