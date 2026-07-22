Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2B30B502
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716683; cv=none; b=QY2Fv5EUyXEGFe7BvJEibPmgG1B3aBnZw4Q3FkHzaIMePG5RkBH9oNhrEHQY64RMNuMHUcIivDvnORIiSof9x+YS1RBoYro0kL4ls2PHr0Xre+NC0bhtrZllEZ+piGugzSIfPGIdhRUciiTdXXeUHGz83Q/vdYY+UZK+694PX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716683; c=relaxed/simple;
	bh=VfPcQNB4zjsVSd2TPRs1QxZs/yJrY5PGJosUGRLu2jA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImzjEA/wKA8pRBbyf24lPoX1h+0pa/0ZydcrllGWZPCsP7pWd08kVg+Y9BNaU22VzQy/1p6IM52WKin9gLV9f9vcMQoTwPoNy/INdPhdWsSSJWTqy43t0enALT9OoU5jSwRC5DYDm6fVEg3g+1tW9/cHZtsWvJjGarjTBXGlDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOdXNXki; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOdXNXki"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954dff6536so33069905e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784716680; x=1785321480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lCysCzTEUEBvOeVy0VePsNIZ83v965Z0gzU2Gk56mFk=;
        b=lOdXNXkioB3anyhjQAmkPrbF0Op6YXsugTDaMLuxh0ZV/VOvdsDghbxWZfkgrI5x+9
         ImabycIzFpg8Hevpxf/gOgRygXQ+6/GJvMi1lBeCI4iNiXe+a2iME8R/aF+IoQOZb+Vc
         wVOsX5RiQNj+grMhfHvUCkWo934CClALNeFOdKFaf55+vHz87zSvyrwhrjYBu6flqXZT
         tMuv8aqp3IA3rnjXtGr56ckZDweMbwWxPCAQUhxheLaj8fkUH/xxZ7BSrb2gLCOIr7nx
         fqPoOaitumk3ICUusH3pUdE86qar7131wqPXU0LPG0HHa9sjEEPysLRTGOFwtWsSjyYZ
         QTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716680; x=1785321480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCysCzTEUEBvOeVy0VePsNIZ83v965Z0gzU2Gk56mFk=;
        b=AGSNQUuoKBWbBDAutv7qf+peuOxqul6hs8Tvu0xiGq/rI2sF0bLX/FwRwnAbTq7hdy
         yQcw8FgUWSyagvoo8G5mccPP9UY5FRue5HEGRsdvgWrRerIwZekMXqw7E7zrMc2/8T32
         5TRvfk7rnwrwLsolUrtg5nl3GSInNwQzcIvSudESW7w9L8YjgVvViZ/A0wehPX51xwVz
         0WvzeKmaPClG+AUdwsnxEfGhkFZMUAwy4rvdCSdN8NUolMwQjenkpejujlUsDPFlRzWo
         9wOTpi7w7Hf4MfKMh1oHEqyqTdEStZgdOyPDj5bR3mJOeLwg6NwgJOS+AIt9flsyTHu0
         D3Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1Qg4jjOsqyrnmMj2rAudLgtpBKpvK+O2SYQ71xRXJ0H6zWZ55Fu0f9/GLWsBwJqiM42lDjaD0eBZAKs/1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZvyKBSM36Zq7G0O71zmRnRt1IwiVjFCUgJEjmayNt3EgBjKvx
	AP6cjYana+N1FqZMcZPyCLkUcRwO7fMGCjcS9AatVqjJMGio1Cp1BKiE
X-Gm-Gg: AR+sD13O8lwn+nqCTMQlBI+eapmsJqD8Tq8XAZX68WQFjQ9GDSSmG71ToU6EtRzmJxu
	XM7LojytXu43X04g5DAX6e6sIkw6FnkzfYGDmFsgtSY9fT7DY6kcejwqTtKnbREPsJs1FwwAo0w
	mC+etARIuN2XIeEIZYhwED1B35uw+3Ah5X7WKgwiol3seWWduto8UrnU5P4Xu/iGU/Sy2BPcwNW
	lmI3WDZMVC53TlYAovd5nCOmehgNCIueSYhffsN6OOtrfZOtDhM3vuVLmmkLwZVvO8hvx7rWjvQ
	xpaHQxU37HEs5mdKFVahmdctxLW6oZPzuDSfBu5OpBCIyMf6sxD429fKGbwIPHS49ykP0xoxZZc
	CbV8IzHtxf0sB4ZeE2c7zBFlXAKzCmzzVzJkAcYoRRFkyBaSlJLt8HIp6P6XbhBDKZY1IvTljj1
	SvPfCgnfswD1ugz5eObiGWhiCITSFSC0a+LP5euAaQKmmJuFihhBF8eN9yHg==
X-Received: by 2002:a05:600c:a44:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-4954a40c014mr237056015e9.32.1784716679886;
        Wed, 22 Jul 2026 03:37:59 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm148687275e9.11.2026.07.22.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:37:59 -0700 (PDT)
Message-ID: <6a609d87.87c5160c.1accad.0f33@mx.google.com>
X-Google-Original-Message-ID: <amCdg_gCgyMs-TDv@Ansuel-XPS.>
Date: Wed, 22 Jul 2026 12:37:55 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > The Storm board machine driver targets Google's IPQ806x-based Storm
> > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > has no upstream device tree, no active users and has seen no functional
> > changes in years, so the driver is dead weight.
> > 
> > Remove the driver together with its Kconfig entry and Makefile rule.
> > 
> > Assisted-by: Claude:claude-opus-4-8
> 
> Using AI to `git rm` is definitely tokenmaxxing!
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

Honestly I'm pretty angry about the latest changes on ipq806x. First the
dtsi just because there weren't device (it's ok and understandable) now we
are starting to remove driver...

There are godzillion situation where there is a driver but absolutely no
dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
this point and treat this soc like it's a 80-90 code...

I will post dtsi with actual device for the SoC but really I'm not
following all this hurry in cleaning code for device that still gets used
and actually some company even produced new one (even if it's EOL)

-- 
	Ansuel
