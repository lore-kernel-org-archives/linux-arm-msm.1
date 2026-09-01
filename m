Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76936B932
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244525; cv=pass; b=MZK8JrSXcqZyrEH+5X+m0GI9LNFAWPsR5bjHc02rS4bzo9GBCtlsO0jhzjR6DVwa6VccPfM+eppbdB5pvXVpJSYYI74+UlPGGfKNV1JJjitCq8LsqWU5yLwOAllPfjQ7ULTaqlbIZe67aOKV66uJM5j36JWHVxhc+wEzc+N/rYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244525; c=relaxed/simple;
	bh=BDon4cDpFmYz8mQwr3AAQV3DrhPj3IR/41250WfkfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+R0k96iTPD6nQavLX8ifDZtrIsYRxtZFdO68Y+SaWl6P8vamuM98UFl4Eke3p7L5iBKQPy5KzMHlr9q4bhS7NVKZMRwlx9kvfcUrwzaVJc4pec0KtJ3iIE+ErDcmE1imwlXJPYJDR2fQo0cQqCX+NgV6BIXiFJCSYEb33KmMIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJuaV8An; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJuaV8An"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so1429921a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244522; cv=none;
        d=google.com; s=arc-20260327;
        b=K0Oum/70ub+efh5mfu2r/RNViHs01iYuw4pnqxxydchKgd+oHFNzzxY+u+W+KRipO0
         61DQwY7jj5VB1i32Pe4CeOkCNewsnflLYdDT+AmpfPXtczrDc1NOiKMIMw3HB4PjGWa6
         y32Gc06/+7Hhlfc84Bq+vIhlMGKnh16f1fqoinHDD9p6ggHC1IprfN99IfMDsYyUM5py
         9RAWCdXWEyOCGiCmjGEyrzAHafnZmaCY5clJoA+jPVvKlMLo2lal8aTR7J7OuaGH/aBj
         KifhUoFnKIiUVPly/iQf79iUmrwEnFIcdTBEp2EUYFJr63zXqdblsx41rmDQJI43psCu
         Eplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        fh=O9Td35/ijq/g0Q6v5/norOyb9OSz0mFo285F60/vf20=;
        b=DJbK6+rYzGXkhg2NDZn1sEW3iBoHxdMJ8M+SOtgl88GijrTUtqKzLn/UZrvzyuAo/p
         E/CNs6oX0ODQqUjEbZ/4X0zl7t18brz1f9ATN0Wr1fsnHDGa8ccjHuzdBX8TdPu3fbqx
         +FWiAtuQPREgK9kwR94JnYG3vvmgvjf8ENOwj9Zu70w1poGei7xmf8SwxjyNugd20kXM
         YknbNcYHca3a8QaZ2r3vbLuZFoJpLpAncd33lEttd0RCTQ3pLNxzPpgBamxsNl6TDHAX
         s2lM4B37AlpqszCxqP9kjTUIcQMmDcot7FVi7jwNaL3sChImmLwCB4DPUpgq4iBrhrLg
         cTnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244522; x=1788849322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=aJuaV8AnNKXXOBUpWLK4vmUqa63/rYdfhLrWH4OC8LuQ7iZGjM2qhAW4Zj7AjPB1Wk
         COYUzhhxr3JQoXTMUHkbDDejIEM0R4rEmPDgezWB75j2GMgDPuwIGT0Vukz8ZDjA+prz
         vrI7pDhJLZctnjEWZF+xFx8lZUXJ4AT3PhM7HL3O9yPJqRz+M5Umla29sf2ay/YTV1UG
         i5e6QpUasjkFkBZP22NlMTmzcy7YKD5yDbMEA6w0/ddqDDY7b1vcclRmEyfGmj5N0F/Z
         FYGHIlIOe65L5fN/FXC2C8Z6hufXsqPivD8ogtJujMhae9khHKSVj9SpSirplcC9w6Fi
         cNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244522; x=1788849322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=ZHRFRMSeDexlfxhLXEWFJGBIY1odk4Lio0ve6prQan7PuJtxV1xUny7MFKxF2Oj/Li
         iogcDBJB3uEMv9TU4ej0ZnJBCh3BqVZY83r1s7xrg31FQ/yBoSD/CqRIZgHEoW7TYRxo
         v6j6a85+1IE/NHj3u6EjRDDoOLWGGONwz618f/Rg27+1QX3jS3wpgwtuWjrI+wE2gviw
         DbS+9QjpxGMWvGam3AIQxO+KVFvhn5E0QRHbjzNlbHryLoXWxKGRU/8oTJkeM64uBAlK
         hrQ8IrfgwQ19wswP88SN8f+QOIUfAvic2CM6/2j/RS3HzAu9JrgFQ1h11/rz5NBYY/YZ
         wpRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3/xDoao6mzkwMuaLYbtg6/ZQrECjheD25KlV83ESQbTK6zKFB1HnDJ/F+di/4nA126hWK0+6/KyvdTDAJ@vger.kernel.org
X-Gm-Message-State: AFuF++lJ/yEjR2dCkmIQIrOQkAYaLYklwb7FRu/7is0t0SSsMwh9e1/E
	aBRPtkKB6Oy4Sc/nGvNGc82BE3Hi1ZX016IcWfGQcwWhkgFBmVCv997QJ5abe/sO9d1ic3wCJLA
	obRz5/ozEieV/YO9Yow4Va5RpwRRBKcU=
X-Gm-Gg: AYBFou2a5YvmZmz3n1JN8HXeZiFPLX4e6Avg9yL/LmJeokYBQ5lejbVkwdiHsNU7MwR
	WcrEc8CmPZmBiSvmBpSiaSgs8Ng0zYgLElWgnmF6EWvAWAT2RF/vjjKp1ycKR5MAtmUQkd9qESp
	F6Tzey6JwyL4lxoNGoGNP+LJrQuM6Z0XbEhVpFfGNvWz3a67vJuw6LD4OwI4WRBpbTB/unFvlL0
	iI7K4rwP6PK430ama/MgawQGtxesFPBIdrjXnQtlmr5VmXOFyMF14Zhu2lEO6loeeTiUH0lwEUr
	4mtjjNvfuGEk6NBqtPXNS7cmRpZibNl7JNS3RNpqxH7pwdRT9UJMyhJFVMhe+aawS2ITBtJbJB1
	oxg==
X-Received: by 2002:aa7:da11:0:b0:6a3:ec9f:7e3d with SMTP id
 4fb4d7f45d1cf-6a66a611510mr1306101a12.6.1788244521855; Mon, 31 Aug 2026
 23:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
 <20260824150156.1310-5-sreeshankar0910@gmail.com> <apYNXZ9TJEC6rVVf@baldur>
In-Reply-To: <apYNXZ9TJEC6rVVf@baldur>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 12:05:14 +0530
X-Gm-Features: AcwNN1U5hmy5zAxaLt_MG_Oo1HmGFV9z4ZXwGALePDH7cPQz-NpgtyLXkjVfVO0
Message-ID: <CAA-+ukLm-6FhxytqX1=x4pZUqZU_bmB+hVF_+5K1AW=-ZpPd8w@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 04:56, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:47PM +0000, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
>
> "This should"?
>
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> [..]
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm725=
0.c
> [..]
> > +     .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>
> /home/bjorn/sandbox/kernel/workspace/drivers/clk/qcom/gcc-sm7250.c:2228:2=
4: error: incompatible function pointer types initializing 'void (*)(struct=
 device *, struct regmap *)' with an expression of type 'void (struct regma=
p *)' [-Wincompatible-function-pointer-types]
>  2228 |         .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Thank you,
> Bjorn
>
> > +};

Thanks for catching this.
I will fix the error and send a v7.

Regards,
Sreeshankar K
