Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A637B02D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371408; cv=none; b=b0R8VFHE7MqfaNmjT0xNszhrDG38gwcjXCrhSncVfyj+FXjqjNVLJcGaa64DxMuqE+ahBsHsnYkftzskPiSnlZbl2RdaN+I+trALmed3KQ0jcH9hJAY0wXeX6IC4s9yD1VZ/pRL2fHdszcCzxE9tKxVl1FVB+PQvz6wyAjQoFmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371408; c=relaxed/simple;
	bh=EoNxgc9KtzYoR6dP5gz3OiVtQzHtUZBri5ff853Uv4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUABmUF3WWrJWPZrckp6i15tXQ9Y9w/dLVNGfZCdauroTvMqX7e7pfWCCItNDGOhgHlE6us23zsh6E8M3OceNqPPEAJ3mnP6EUh6FyQ2QgHOmQXVSSHcplq1GMLnKrb2O1As86/eh8fUtlZNGn2Na7CJn4EoYbQcLCnzrtviSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH8k+AXu; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH8k+AXu"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2063828a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371406; x=1786976206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AyTK6GEN9WOThC9UrKPlxdUe4XgPNPIkc/LonxXL24o=;
        b=NH8k+AXubTI79PtKjSF8zx+W7ANQM1j90mmboy+rtbAWQBkpZQ88FFccFBClkG1KAa
         2JAW18aFdKDG/kIwhX7XtR5ic2meOK3hb//3iUHJdqo5aVNEzmsnFFZSNYMAMp4rjq25
         /XDnhg2utUEDWPQZ31FDO7+A+jQMg0GFMGyTUmpJoxiF0LeZWmFuKOzys3WKjaA2iQFM
         FJjTDA/1JqXEUNtzaY7hSVDB51FvLCZ2ZlFHeryI1ngEpg8AOcjo8AnCkpE4lJ9seo7y
         Sawr0c71zP9GiGqrNSXo7r90d6nazpoLTgVPX+vQJR9xkXEgJElcCPA3LkXscTuo8Gui
         qw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371406; x=1786976206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyTK6GEN9WOThC9UrKPlxdUe4XgPNPIkc/LonxXL24o=;
        b=cwRI4oAG2/2MznqvAFdXiXxLLLPgDsqPK5HVgIOpgNuDQvqIaIPE+C/VvWbzMD5V9o
         wZvlTz0aMP0DNQjGDM9onPSIc5qMIG9EBr2PdOAOp1HMN90BV2Fnz5IjG9RDuz6nsZgB
         f02TxFFHYG5doFPd6EpfdlGAeQpZ17LePKf7HSscWmVXU10/H8nKjgrvPSJuYnt0JCNW
         mmVMktxuh59uT/DbfOFLRMoE3NJ6Xuj3cTOgFJ7xo1YVdvg0035rfRShYjDrgPDaVX4C
         T+jWZdHKryQrPWyVPUIfOStVwzx7f6jCQz8pNtc5/gT3qBKP2u/5lQwoXmtlorkO1KsL
         ZnGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHQmCVrbgpocWurzBpiQ0nNsH6s5FaaJV7QGergzT8AX4Ung5X6GVhbxULfiUnC+TGF8kQEuMyiAnwF9l9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+hO/6/rOYx+lluEJJqJUAPq95lXZa9qy7q7wtEkrjeXiL3RQ
	pGmyNQgoq0t5JA03nL7BKObET53HhsKfQVMCY9DLW1kReozAqw5I4hlv
X-Gm-Gg: AR+sD12GwvAVaj0OQX+cpzUmy65ENnZLfsUwHhsLuyvzig3UkCKFAigFBKO6ruKWQ38
	IpyPYhKVjrHM2/UhiYMVUMWqeP/nmhdbI8emdhRsp7rOvTCpex7PU+L2vsOiFrOsSnWfJWRVEeE
	JgrdkPuX7Tl2k1bD8CAETEPnwEehd7ILI2iUTt4WsONrAqFgQz2nG0taFD0+YyDGmIftQPMuwsP
	CfRIzkbEBdE/JD7HcZva4gUWveWJxn8gHSGIMd8eK2rhkQbCl6o7Ky3jMTjFa6nXfXQ6TTVWjw1
	2ELus6FTwwOpOhQC0ZmaQDLpzJGtW7HThVfVMI6iACUGzfnoyqNziWmeBDcGNhFA30r8ZD+VAnO
	hVJo5hZqxHI8FrxI+61XVqSoSCeAs+/zyVE41TGs8nK/mdsvkq2l0hUhS+pZsVrOsOrYC5k9jjg
	i/k2a0fISaVBQ0DtK/pxKkLmahcgpNHfIU3KX0+dMCOf/SXCYZ7ZUdCBtdYsoIFBiPuuLe8xSUL
	g==
X-Received: by 2002:a05:6a21:2d8b:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3cc1a0bc45emr2856624637.3.1786371405704;
        Mon, 10 Aug 2026 07:16:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm51806975eec.28.2026.08.10.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:16:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 10 Aug 2026 07:16:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: qcom: Propagate errors from optional IRQ
 lookup
Message-ID: <ed1510c4-7614-4086-9cd7-ecc5640dc714@roeck-us.net>
References: <20260810105101.55945-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810105101.55945-1-phucduc.bui@gmail.com>

On Mon, Aug 10, 2026 at 05:51:01PM +0700, phucduc.bui@gmail.com wrote:
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
