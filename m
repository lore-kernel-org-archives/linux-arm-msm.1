Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698082;
	b=PVnV2CSCQlI0aUtIgsz5K3I6Y+uKDngwE0jvR0HYz6nHqalBtD4rAh3Ti0tpkBr0UGsy
	 eTtJYp+3qQ5T/kPQzQRXbFO/DXtNhDTczQ9YnC/BR2CRNI1uQ5WVU9rsejDkeQ0FBFbtu
	 JsAN2Wq6dwJY6Fm47uOn26yOhNJYPHdUnXP8qxSqkP3NchjfAU5IHKPJg/gLmSSL+FVo9
	 oS2qi7cS6nrUwCRPmx1SMRbBdnHnUv0EJdNTRy0bI2e2vSBLXxZYPBp8i6tAkZASKawCO
	 HVU+Lcpf531WlX5CvbuRfF6EHViBO8UfQtsNBdJhk385QeIfbxCyQCHvG2ejvpfLNzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
	b=XquwZPVppNhWMFUB5WEIZPsG9rqjhfMRD7rVqDRI8q7sa4HCJAdclPhG4HnHR0c3iHfd
	 qPVyTj69Ykgl7ojw9QsncxJ5p6DtZg2hTKmS8xM7+oBZHW+LrzklgOBFMa8Q3zsOAe+FU
	 dl7THR3DH54Eqx7F10qrDWobTw6+/Wey46SBTE8Ps+zn2nkZ+R5dKLmQP5PJ5orBRRAJi
	 JP6s0NyFxQwlbi6QuSM+WD7Kn1Gu7eDQBxSc7RxzoGoytB5AUaNHCadvKon27G0jZvMxG
	 hC0T4NYdlahsEtXntsOkSi2e+wz/fTz3y54PijjB3oULu/KNbFkZiN6mxzyTp8LReAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eGuW2GMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A46606A328
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A46606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eGuW2GMh
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b8306b9f8so3710056d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792698080; cv=none;
        d=google.com; s=arc-20260327;
        b=iHk6IXtC5T7d/lwgiAzvgvVwZMYcWs6X/0OqAm5dpycrC+ZmcoDlME4GEDmRhXsvNX
         1uPLoSU9XDG8mwzlb94VCH7XAkDeqUaAzF9ClsO+7rnCiobI9w6YdCPNvpTp08Sw8c/v
         t8y6oUCDttqqh/9N++6kN8ui2DJtHtgIpv+5WZCtDBQzjt1oy4ydX0uXYErtZAnGGGOE
         SxrtV8lgh7wutwH/T5kR1fT0r29KeYar6JMRebNO3DQs1Y3Szxp37DxzMTzGDirWze43
         QTnJUgPIYhruVZeoGxNTuoYX91EiyQlFpjCKzZEvY+ASmUUhN/JdPxVG+5spr+fNTgYt
         rwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
        fh=rCso7/xi99v9e0M2XNkzhjLOcDdF6DQxyTM3FHByzWY=;
        b=VpbtNSBwiEFmng0SMq/hynZ/5yp3qfK7zAFlu0hxiJr6vXrZy1XWZJOIdGDdJbqeCO
         SO2e3Vc6Zl7D5BYiDRCEDM7ndddg/aXuHbwyK4Itkubctq9VBme728bwl1idLv61+69Y
         CJ6B+oATcINMwfA4s1YvssnOj7WrWVdvfKspWeviiwxjQnSMh9w1NyYCniI1xOm185uD
         SfR0gFBCqWwH5DiygsX68rm3+NKGzfqq+FXHZk5ALQJ4d00iWjnuat8vFGdKvdMwSBUm
         W+m4j4HB3z0Fgfq+1+bMFS69f+I8b7hlW1JZyIrCtF2AOPr/ggP/C3w6VwAhjBxrtSzc
         yKTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698080; x=1793302880; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
        b=eGuW2GMhQSUXWyk5IeInmdud2HJMQfOnVPXJmOeMh6VxFknNuNoa+qkDlXNZeYEkHh
         GihGP4ebcfdPfN4VzbHut5Yjoa6IcOBeMy9rnplGsEWi9IuRHabuVA7BBjEyG75zGxKY
         ELkZwKuLUwjWElR8OJSrpVhetC5zDhZsJ3kOQf8gEdEsM9T/Ubax3hCr6oCIkXp/jDBR
         6DMtOBdOyD6Z6vKAMC++ATPdyDAAsFGJAcRengfX9XrZfxpmTXMeJA4bnOXXgeSmAbTy
         ANdKXuIkPnv4E6ycQtPA7DstjA5ZpLHYHAOWY45xmxWGB8saWofUe8lrvcSH5cSwZlDz
         +4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698080; x=1793302880;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
        b=sdpkejC1PxOjDppuxR0GZzO465jKAa05Hups6gJEvvrtCsPFy2jXGqH01uCmsOj1fy
         fNJ/AkBSkvMMlfrP4rW46kx4tPuLcWro8LLVUjy/zXrsHmy6q11UkMmnA+HTbU5fZ8/h
         M/teqJkeZtbXfh2wpOVaPcRZFuM6Y/SBUot/aPYQW0gWq8Rok23VU9tvRyHCl404Jm2i
         4nGGoRrz583NEdIvPIYpJpDEfaauqNdtM/FKCgT3aGmQq3/1wKAedwVL3aGxxs+FoaRt
         5hHz13MIU4jdwniWyulAKYVYzJeaatj62iW8mJZ+b0QgEUPrPtuRbmeJlkmSeStMXVlT
         URKw==
X-Forwarded-Encrypted: i=1; AKwUvByogx8qnCNlBP8r6A/Sxb3bnYjTcwCABKjLSfxv5o7dZrczo+vgMtytpOrBe4njHTGSKrKlyO7Ip2mrZhN8@vger.kernel.org
X-Gm-Message-State: AFq9FYKu113wrwPwRQYcGM5sKNUlH83Fu+wUs+JZQm+Ann2MshtOJMYS
	Ur3nHq0oC6s25mE8gZ3Iez0hVy9RxH4X2/oZpcLFTDSnxdBa+bqB8I2JQu7og+kp1+dBRrCp4f1
	Y1KBIvXqpym9C/nkdJh9vHyYVkJ4QevI=
X-Gm-Gg: AYBFou0RoXvT08L4xlxOjkBOWwjuQi1AJJpvgIBcT76IwIpPqfeoO0y77VNIrPHazie
	NWQCiS2R2F9L5X0dJs251sE2C5AED8KzdkWTVo6blFoAcfisvkm40ASS0r3iOMJtu87AVpa8CCO
	vzaaimv2V3RrKJJwa5OqIh0buP4xMczs+WAV2vK/qVkChxBnsH+LyTwwOcbSmLRQqCxuBduLzjw
	TxqD/F0SazdZecr49/O2yCOXSao1Y9BGeczY3tMMSFUYFDzmAGpPUxknTfD4C+5YkFt8ktSQJC2
	jOX+PZYmEhwAREPOxRMwJmaF4g3/1qh54R3LmceROaa1k6YMwPU596f32epgiNPJZBOeQBU8F9q
	8NWKclKq9sL987sNo/T1/XKb5ymQtS3vSYDAhxhieqxtlavH8sMqitoaIg2QXoLs0KJpKXqX3DX
	fKZtmTCAZsLR8HIdE=
X-Received: by 2002:a05:620a:7001:b0:939:b057:daf2 with SMTP id
 af79cd13be357-93f6f7fef1amr89402385a.45.1792698080536; Thu, 22 Oct 2026
 12:41:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022033638.32460-1-thatsme.saurav@gmail.com> <16d56f7b-6295-4ac8-b0c9-8b490dd0d582@leemhuis.info>
In-Reply-To: <16d56f7b-6295-4ac8-b0c9-8b490dd0d582@leemhuis.info>
From: saurav kumar <thatsme.saurav@gmail.com>
Date: Thu, 22 Oct 2026 15:41:08 -0400
X-Gm-Features: AclHuK8DakwZw0LIt6ofHcRsAHS0pyqF6XCOnFZsjF1b3JyRhz1B6T7MRSrjzRc
Message-ID: <CAHmbrkmPc5+NrKUn-Bfi6_U4nxYNsUZe0xFNackUS3v2rbWJjQ@mail.gmail.com>
Subject: Re: [REGRESSION] i2c: qcom-geni: HID keyboard fails reset on x1e80100
 (Yoga Slim 7x) since 7.2.9
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Tested 8cb5c17be3a2 ("i2c: qcom-geni: Restore the source-clock
selection policy") on top of 7.2.11 on the Lenovo Yoga Slim 7x
(x1e80100); internal keyboard works again after reboot.

Tested-by: Saurav <thatsme.saurav@gmail.com>

#regzbot fix: 8cb5c17be3a2

On Thu, 22 Oct 2026 at 01:44, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/22/26 05:36, Saurav wrote:
> > Since 7.2.9, the internal keyboard on the Lenovo Yoga Slim 7x
> > (x1e80100) no longer works. 7.2.8 is fine. 7.2.11 still ships the
> > same i2c-qcom-geni.c as 7.2.9, so I expect it is affected too.
> >
> > The keyboard is a HID-over-I2C device on i2c0 (i2c@b80000, 400 kHz),
> > address 0x3a, VID:PID 048D:8987, IRQ tlmm 67. On 7.2.9 it fails with:
> >
> >   i2c_hid_of 1-003a: device did not ack reset within 1000 ms
>
> Searching for this error msg on lore found a change that fixes such an
> error on Lenovo Yoga Slim 7x Gen 11: 39e8e085710a2d ("HID: i2c-hid: add
> reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard")
>
> Could you try if it helps? The stable team plans to pick this up for
> 6.18 already, so your feedback might speed things up (and get this into
> 7.2 before it's EOL, too):
>
> https://lore.kernel.org/all/20261019135441.1420968-216-sashal@kernel.org/
>
> Ciao, Thorsten
> > The touchpad on the same bus (0x2c, hid-descr-addr 0x20) keeps
> > working. A USB keyboard works as normal.
> >
> > If I build 7.2.9 with drivers/i2c/busses/i2c-qcom-geni.c taken from
> > 7.2.8 and change nothing else, the keyboard works again. So the
> > regression is in that file.
> >
> > Five commits touched that file between v7.2.8 and v7.2.9:
> >
> >   82339215fc00 i2c: qcom-geni: release DMA channels on probe error
> >                (upstream 268aacb2e2a5)
> >   139efdb3ee6e i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL
> >                (upstream cb97bf3d4f91)
> >   6c3420d6ba34 i2c: qcom-geni: Store of_device_id data in driver private struct
> >                (upstream 692e0c84db5f, Stable-dep-of cb97bf3d4f91)
> >   4edab037132b i2c: qcom-geni: Move resource initialization to separate function
> >                (upstream ed4b34033db2, Stable-dep-of cb97bf3d4f91)
> >   fb54df3645d8 i2c: qcom-geni: Isolate serial engine setup
> >                (upstream d8d3bb127ad1, Stable-dep-of cb97bf3d4f91)
> >
> > I have not bisected within this series. My main suspect is
> > cb97bf3d4f91.
> >
> > #regzbot introduced: cb97bf3d4f91
> >
> > 7.2.8 always wrote 0 to SE_GENI_CLK_SEL in qcom_geni_i2c_conf().
> > With cb97bf3d4f91, geni_i2c_clk_map_idx() uses
> > geni_se_clk_freq_match() to find the index for 32 MHz or 19.2 MHz,
> > stores it in clk_idx, and qcom_geni_i2c_conf() writes that index to
> > SE_GENI_CLK_SEL.
> >
> > On x1e80100 the QUP SE clocks are registered as DFS RCGs
> > (gcc_dfs_clocks[] in gcc-x1e80100.c). geni_se_clk_tbl_get() builds
> > its table from clk_round_rate(), so the table comes out in ascending
> > rate order. I suspect that index does not always match the hardware
> > DFS perf level that firmware set up on this machine, where index 0
> > happened to be correct. If so, the engine runs from a different
> > source clock than the SCL counters were computed for. I have not
> > confirmed this yet. So far I have only shown that the 7.2.8 file
> > fixes it.
> >
> > I have not tested mainline yet.
> >
> > System:
> >   Machine:  Lenovo Yoga Slim 7 14Q8X9 (83ED)
> >   SoC:      Snapdragon X Elite, x1e80100
> >   BIOS:     NHCN62WW
> >   DT:       x1e80100-lenovo-yoga-slim7x.dtb (in-tree)
> >   Kernel:   gentoo-sources 7.2.9 (genpatches do not touch this driver)
> >   Good:     7.2.8
> >   Bad:      7.2.9
> >
> > I can test patches or run more debugging if useful.
> >
> > Thanks,
> > Saurav
> >
> > --
> > Drafted by Claude.
>
