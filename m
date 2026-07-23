Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A530F957
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831897; cv=none; b=OudsEYaa7D0si6Q+HtPtnaXOb27NR6d9SfA2yUhI3Nltigua0Xh98yoz9sXkeMel/9QNPWRqnbmox0SyLtchimAo7QVqNpWpiARDEQwWQGcAHroWyugEqsGG76iEFTxN3yzvd6z+xdgMByAw4vtz1a0dcRtH3SXm5i4ykuSkj2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831897; c=relaxed/simple;
	bh=nzG4awxgYfrlyx9Luz617YX5oT+UjV3SFnHCznNjdDg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAbLaVywHicdvSOH02m7ZPHx8gmYDz8KeAnL0GYMMlYLUTBDK3Jab7C/DgKnNXTz4Latt7DuswQRx6CDGrTKQ+gHPzslRPRgmBTHgmVzK21MzLNz8AjynjjTCtXn/OGrfNM/4VRO6wZ4RcMVLcHCbnJAyc4TgMAFbilGC9QdpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3baiUl0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3baiUl0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso413068f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784831893; x=1785436693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQh8Ebl2z6PI6INJ382vkExB/1zYbiEiM8I01ow3Vog=;
        b=q3baiUl0KU0vhV7XIUY8UgLk6WUJkdFv62CRIgrnnEVsnxw9cBofQB9I/4L7jZRE/g
         64JAzh+bfdUy57LDnKMo2Q/5ffLNbhnOEB/g8z73gBdReTWszvKrsFzqh5DCi6PbmZL0
         FXgGiKdJn28ft/xgtwHqRMwXHC79RQnMwycm5OQvNQ5mZIXylFLw7JNT9QZPA9JLjWAz
         jOcBcVn7T2+W6Ehyz6R0uknsyq5ciDrLE8HpyLk2tU5pN83f9iuOj4IbMOa/C4SK9emN
         xS1BVx2LCLNz/q2JABcPOvctTUuJZfP74QY/F882LjFO+dB3jXApnyB/iYRhcMk8pXNP
         m7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784831893; x=1785436693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQh8Ebl2z6PI6INJ382vkExB/1zYbiEiM8I01ow3Vog=;
        b=OXjcVJ/m+fx6keSBoPS2UWBvTgoEmM8BmloGNjRMfGXV1HKRUNLnTc0vknvUYqbVu+
         u1U3N+m04MXfQg3iAe45zhKtzNe3g1jAYvtR5LUN4VR3axVu+5Vyis2dOut1rBPkjHl7
         icPLQJmMNZH5ZcLiKX9Hyhk5d7uMWIaY9JrjzXosBpsLF/a4LLSK608BsWJ6XYBL+Ytd
         M/Nv/0JPgza0vsoHaiG+q+6vcYQXqhmEPhViO6OnxTeqYI2OOjXs+xAREO8oFPA5rj/H
         jOp1sTkYpfN/1mFsE0v7gyAN8OGxyAKAR/lDwBQOB43xV8e+t0dF0K2p/k5thhPTPkF/
         +Ncw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg0wFj+xOLrDT2+hDAOLQhI07WCnfFxY1L4Y2DNHen3T3e1lslPrZRH0jel2iBsW1aqqHDCWu3oH3KaMEV@vger.kernel.org
X-Gm-Message-State: AOJu0YxsLTJhxGCuLCgDj+N8ggmq7WopCtsJZnTsIPI1xMJIyGcjw/rF
	vi9RvbSbGyKkitfw/yFYRxGw+cqGJc8eDTghm5rGvzFyzxhzQdOJgjun
X-Gm-Gg: AR+sD13fl5lmxr8EqowKly388sHBxaETdu2xRYCDpGmgcDiqcIdSF2VZYxg7sm/yA8W
	WRjMW75tdFvXYc8ky4pb6kofSSqas62IDgQ51Ft5BjdwhrfZBsSLRJdJEsAuRUO/XCjOXcB8ZUs
	5YHUsdHahwYYNIrpccFxTyRAfkYVqfSldfxLug4kaMEj3sMjgPxuqTMbV4DBJL/CwxfgB/dSdGq
	4W4RXl/5Yw96NYKdQIWHCQSqI/SJjlNpz+7NIs8k03lyxtEJV2AVVu+urDJz7RbdV6Zm8ytH2qp
	HpCbGz5nW00vR/SxnRzp6p18Ze4jg+m8+rcT+Gf8ZQJjM6VaFORe3QtLmk2cJg5K5ie5IFz+3RG
	kBWwHkLcp19v2K7EQK1IhSTJ7wt9SQjTp0WvO+8PIChZMpfdPY5kSoFKuOsV0ltQHgPXuwA/r67
	N3I7iIMEux6cbr0UbAIqBdmW1IltL9Ejeoi7yDcREM8USofEs=
X-Received: by 2002:a05:6000:1846:b0:478:77c1:787c with SMTP id ffacd0b85a97d-47f8d76ead4mr5907181f8f.56.1784831892999;
        Thu, 23 Jul 2026 11:38:12 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6f076sm18328564f8f.34.2026.07.23.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:38:12 -0700 (PDT)
Message-ID: <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
X-Google-Original-Message-ID: <amJfkRUyQoa2VhK_@Ansuel-XPS.>
Date: Thu, 23 Jul 2026 20:38:09 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>

On Wed, Jul 22, 2026 at 01:48:30PM +0300, Dmitry Baryshkov wrote:
> On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
> >
> > On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > > has no upstream device tree, no active users and has seen no functional
> > > > changes in years, so the driver is dead weight.
> > > >
> > > > Remove the driver together with its Kconfig entry and Makefile rule.
> > > >
> > > > Assisted-by: Claude:claude-opus-4-8
> > >
> > > Using AI to `git rm` is definitely tokenmaxxing!
> > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >
> >
> > Honestly I'm pretty angry about the latest changes on ipq806x. First the
> > dtsi just because there weren't device (it's ok and understandable) now we
> > are starting to remove driver...
> >
> > There are godzillion situation where there is a driver but absolutely no
> > dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> > this point and treat this soc like it's a 80-90 code...
> >
> > I will post dtsi with actual device for the SoC but really I'm not
> > following all this hurry in cleaning code for device that still gets used
> > and actually some company even produced new one (even if it's EOL)
> 
> We have no way to check that the device is being used other than the
> DTSI present in the kernel, being updated from time to time with
> non-trivial changes.
> 
> For the patchset in question, do you (or the community) actually use
> OnHub? If so, please consider upstreaming DT files (and also updating
> schema FWIW).
> If not, the files will eventually go away. Just having unused drivers
> _adds_ a burden. I stumbled upon the driver while reviewing a patch
> changing the driver (for the sake of changing the ASoC API).
> 
> And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
> a DT counterpart).
> 

Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
they also use the storm driver for the strange attached speaker.

-- 
	Ansuel
