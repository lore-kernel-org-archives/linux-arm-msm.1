Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47FB3D093C
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267173; cv=pass; b=kwgHJDHk4uojIlsEUHY8en5f0gud+C+lg6SrmcsezRRWZjyb80NC6Lm34MYBSaAkbngK7CFAp1Yj0ajUDc+rVeScXKVRUoTdtRRUX2mXMWqDsxa52MMB23SwwuaKgsNCOdLqJRRQyNur7OYNP9snkNPmu8wYg7e8OKQTV0qlBEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267173; c=relaxed/simple;
	bh=VG0JGy9V9Ess42oO7HJ1M9+yUlNIwa8iKwJ+GuLfhQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1FgNAR2GjLFFtKWa8/r65wobrDSxsLmntA7kyxIoKpPVmVV5RCXmutX6mfp4XUfzOkAspIam3rZFaIqFJ5e/RtvuahDkE1MHMbazensTtsfNZPyVGZwsBjZhy94S1uPX5KTXOTiDsGaIKzdiweCg4e0aeQlaMyXFSNJn7UUC9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APws7sjm; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APws7sjm"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a600a1caf8so1316818a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788267168; cv=none;
        d=google.com; s=arc-20260327;
        b=hY211dUuIEjTJ7S1j79bMn77gy3coJ+kY0Uo9X1i+qqCidWjzvJm4g8Lww9Gj4/HYe
         1KUGP/+s5MponZF1+ZpK/i2zoX8xbFHl8FL1SuFDuCFDejd+cLIw7eNgXokZy805Wobw
         NZlu0bHolbVFUDRkD88pmJ7tMgYVE7eSR2yZgKtrNEx5j7gSyzGT3OR8bvw5QZ2qiNGk
         D7l3utqEsIFMOAHr8TU1kkZQxamHtiNFF2kd/WHAzWjctm960Jddy7HSt8QOJEpSNEtx
         d+YD8ulO5k2u5G/XOu+eAfx6b/8R+sNcPuJnpJnC17W9qywPsj9VpDoUzvUAU70ZHU1h
         rU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        fh=9Aoi/vH13ZAlstPSqSq3E63Pr2hjmt0yiDGGUKq5EZI=;
        b=mu9ophIJGnnHviIs8zMSeTnnd6VPiRBhj3K1yWByS9egaG5DumBo6gwf6h+9/RqDnK
         tIFA6ZQAp3tsV5mrIZCLaf/4/dqPY0jLiejqr24eyLDe69Tz2KkO6pkisjd5XTio0E7m
         GLKKAU3I29LtqO43Nhd/TJCxBIAMCEDb/V9BPUSA+UIN3XuWMJE4iBKRDMsgfg137Hkb
         a+P5jJnGguHMtP0HRNK7Ok76IIjDygNiyHrOY/PBcgc6Ew2efI60dcmULBdUMv3fAzzD
         QzieC1k0CQKLzQKx1oLAoFC0HuBZmXIAYLPnhU+UySCLq1+cCIj7jItCewH+nA+ghjax
         jHyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267168; x=1788871968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=APws7sjm7FGRX6eDqzMDTJ6cLbEvx5rf0JczDmKeh6lwitsuvAm68EWNBoHlcj9TZQ
         ryXUqotI5ZY1D783wL43Eqz9xwj2S9Ho3jCdeo2in8E+GMEDFdRa69LUAnc5UA2KwjzO
         HahJHGS0h7NSTdJ4fTQJ4AikeQWZihGAZwL7nEDnrjQNo0/3+OGPHFPoKh/R6H8v2k79
         YnnjDF3ZMrcQ9gfRiTmtODyPPoNCMiEcaDb/1ZIhjPr9an0sNK5/TgYfz8BsTOleITAt
         VAzFDN8mZUuUIqK6xijgMDpq5UXwiKPesyLA1o2p9BmtRoaZQ6OtUiOMcDt2p5o5Q7GA
         cDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267168; x=1788871968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=F90AvnmsUKUSqN3Yr608paV712w/y2G7rW/ZUQjJenaBdHbUJAV39LGHZ0QtCN/7m0
         krf3JRYX5ahI4o/IiKLzEhD3sRx9a96/PK3f/tKvGqj69xUmyIJs5jt4orWEhTmgdDxl
         LnwjZQ12KncE1LcTuQMcKLcix9NDxq0q8SVE8D+IhWFSSRgFKFXq4AzXdaAedw3Fow2V
         vMBTzwt6f8od3SGG+IaiTJHDkXQ6b2OMIpCfEcPo4pFkYQ109sYW5emqfmBhqjMWdJDf
         n+4406S5TaQ55NebPZrqQgzhQS3LPojPvfvFEHgRNDfZbdXOSf9BEDXHQoazKblK5JCJ
         61yw==
X-Forwarded-Encrypted: i=1; AKwUvByGceB88xxUbevS8DPwXEcSjWBgkBI0vdDGCE7CA8tVpCrKrzRmLbbAfbuHs5i65ZDdkd4D91GX2BM0erNy@vger.kernel.org
X-Gm-Message-State: AFuF++lFzzggle0DUogXvWCgGRUa7CH5HfgC/FzNOMaujEHnZmJPzlaV
	gzi9D1IfWdg+SA6aPWcOO4i1d8wT1Ir9NCq7N2Dff0vridCy+sUo+Q2WMC0yg+yOdvFSX7SKueS
	9zRPlKXWmtOL+H6wjKSEdKXekoKV1Qa0=
X-Gm-Gg: AYBFou38ZlFeTQ7WhTb4m9x+Px3cDhC975/8zUMaazDxvz9z5T7wdzlBLSC1Chilu63
	xpp3gW5BVu4G7prIh4hVFL37yM6hI1V/ISEhEkqoRHDfRRpNf2NjsTuMEXhYbKVRDOdh35ik7sI
	8+zABcjLZymwksg5Fy9rLpQIuzyvz21oV3mbhCUFtYEwjjCW8z5sHqQvnufPSAj2ocf1fTuk12v
	qhzzR6Snw0hFrmQFKg9zWCYCdg6koC25t2qGQG6cojmP/8Nc4RDGyhwvRAeVCO6VGw/P+goGzjn
	RFeQupfXxEFAmvjp5BGkLNAkE9HtuDIaPSGr2KOn33FWdxKXIza6xG29Z+A1ZtMhK2k2np7Qo0t
	iweQ=
X-Received: by 2002:a05:6402:44c2:b0:6a6:32f6:c with SMTP id
 4fb4d7f45d1cf-6a632f6013amr11282461a12.18.1788267168126; Tue, 01 Sep 2026
 05:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
In-Reply-To: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 18:22:34 +0530
X-Gm-Features: AcwNN1U55mxl5Buv8KaT17jt0XFpq4P8gD6bW6R2dqKayvNk2vS1r-azwArTaqc
Message-ID: <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 09:24:35, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> >   Make all clk_init_data instances const across the driver.
>
> You sent 3 versions in less than 24 hours. Please slow down.
>
> Give a chance to the reviewers to have a look at each version before
> sending a new one.


I apologize for my actions. v7 was the intended new patchset. Unfortunately
there was an interruption during submission of patches, only 08/12
patches submitted.
That's why I submitted the v8 patchset.

Regards,
Sreeshankar K
