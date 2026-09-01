Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB0442B21
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279732; cv=pass; b=HObNaOVu7+JbSebzpV0+sfzlamVZmeV9nm8h1j/7rfoAmSQp7l7/dNiOpsQcZKgYf2pD6GthAHC1Z2qhxMVAUSm6ymRV6FoxOW2VqVSAGHgHHcRFXM0DGh6Xf5N7D8SKuCn6Mwts4QcQjZh8E744LXvfMOnysGPkYL3tkR4/BZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279732; c=relaxed/simple;
	bh=Zh9Qo22DVdgyIWE9/JgEgDmjV2v+axogH4c+ynR+9BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brf66rXj26MkXFr7lkuHcI4Ht4v5pvPuIiRAwWW1rvpbRddS9AgYaRxbq6rX7i2H6k2WMR2xXO8ACOBcQQi58BoN1M7ojFyyXruuHQt4cOf7KrqZn6f0+o21p1EbmxrxSRg3eQrJCiGrGIyuJgnWhH6Sg4aBf1d46IPiwjdsv9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVrFmLqc; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVrFmLqc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2530cabcf4so769824966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279729; cv=none;
        d=google.com; s=arc-20260327;
        b=d6z+xujcrwcCgyZM3NyS+Otg7Eh/fxCZVEleiYsmBagV0lJsyPSrx4ZZu4Ljvh6jV4
         bqwiKzoT1kymNJDrqehdwKUVYYcW66B1OXyhKMfj7hBDCXVVr/RrAlugDm7+T3ewIyn3
         OYbmSGeqfsFioZsPcp7rNphWuuUdrGh1ZFugk4KU0og/C0l5kraRB1Yte/62766Rcz08
         6XTxTiN4TwvqiiXkSqLaCpH9dRPBN4icyRhtlr8H4YfuNmip1k/P8+/5GON7QJVBqU7/
         6++QkKD/MwPMKxS7qDyVfgEbSmgeJZOzlVemlt1PgeEE8sCoLDdoOuYzvxyddNMKU9NI
         E+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        fh=Qy7zEfmjX6mu9sj5ynhCfaMcGaVtnY5Pxn/wRuhDnYI=;
        b=UoK+D2shvrio4aVS1bTJ9hEhILfuMgPO99xjecVTs6aaQMLXkpd3R6z/5aLS3tAQ7w
         2I/JL1NtJog/bxXT56Wbc4OExpN1GnK/kMmr5hn5MvdFtxHrtCAtQhbvAwiaMAs6Mibt
         yL2yIEaUoZ5B1lU1OdH52KQrDe5isdsKctTEsjl6qqIsua0bxq16iCxY2/hC0Hv00N3o
         btEp2AWTSRztDzq8AHuGKy9bX3tC2KAg0XRGkaPk98a+bfgwNDcxdLGTuNu/XXdJZ5xK
         fjcVuyTFqYnACZ6KuCvH2l5dmqfmqe0ML1w7Ktq3XGMYLMeytZ747XNqy8tSMK9x1Iib
         2JHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279729; x=1788884529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=rVrFmLqcP/25rlRoRXtjiedV7T4N4hODM2cU6Ep1ojhMUJDRoEyu/7YGgTeF6sfrfw
         2ihIUl6g6LSTR59t2HrqEEeBpT/JdkSyWio265iHlpmFu3UPy8Lt4X4VjxsO3w24ZrTY
         2w8AMtpbh8k/PGr1huQsXYbENZtS29q/7dQ8FWqheoyWfYrChkGWMGWGJj2gSAdwhKiF
         TjfJ8/1VtG50+CBNY9umIUarJqMywld3MHG0ECsWY70eYtgcp4jDHg+lZUVglRPjO6aJ
         ktlbJ1SVHw9TdZkIm06pDrhx+m05zs2LGDURPL76lXdUDXSSEen1n9wAoa/ap71VPymu
         eIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279729; x=1788884529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=EcDftbuIuOsHeecmMsGKEUlT//RVyyJ1M0cuyjRf06a+81mOMCEhuuJGwlf/zzW+Sp
         dHFRJsy3o8GNiWdLYxtL8v+2RRw1dMfXKIc7nwHalquvLgFFE82kz6o7zJjJCb+CqyGe
         0JAd4cGE8VUM7h9VY6vPdm6559AgWuXb82dSbeBBpzaistUERppUxxqPEQAhCSoFOKKP
         XWl0A1qeGTf9zx0Fia3wl/kUdN0TRghpRgF7J0M2xqvc4vH5pp7+4cTk2VfrGmghD+Jr
         yRy6+qCeVZbiF36CdiGAb/x02dV86mLhMYCHDTw08cop73Gk+UdH22Uip2k6a7zLkvp2
         q1JQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxeCYBKsEwH1Am6kTQ8McEmFIrNHh5gENoT4jViX5B/GRgpDbr6GsEk8BS0NZWEt86GMNllzMdw9wE58MN@vger.kernel.org
X-Gm-Message-State: AFuF++nUykidzoa1Ktp7GFBZ+lflGMhXXu4NNO882OROqrhoYstJ1Y9R
	rIE4qQucvGELmyJ/nzNjXMM36qV25GMcRhlTq2AJS9uZnTg1ivQbHUIbZtHLvVviAEOCPD+HZQm
	1LZclI9whAbH+B/hsC0uHRFqJLk/ZRl8=
X-Gm-Gg: AR+sD11AGTnEyWPFQIBp2vlu87CHou+Rm3aorcWFAirSpDp1tZHmm/KgP5rwxU9vYON
	lBGXZL2b2gJvveaR0FAPy3bxFyPLoRhXj57B7whcq9ZzVRedX0YkSuz7qeqxvT/xD0cYsK3w62L
	/0xDuYZv91Nk3yPpsBbzPxgCKAVlH6trq6Ow/4hBUMA+nVy0WMygxxZ0IiUciDqfxeSdwNtLAj+
	zUtFjqkHj16SmzK7HrAEzUyRrWQbhaMmgXRzfPH0u4LPMxObX8TbagtPlHL21hkJzSID9EY0dvn
	+9GsPoDrd/Vx3TxzZS57MlcruFnzAc3hMRTk6JnsV571u0nSNd7g9JbV4nXWZu6V8L4FHYnD5sC
	tigBDnQ+gENzTI78QCd02hHeOJzaxOeKLKSM=
X-Received: by 2002:a17:906:c108:b0:c25:c979:e76a with SMTP id
 a640c23a62f3a-c25c979e7fdmr216147466b.22.1788279729382; Tue, 01 Sep 2026
 09:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
In-Reply-To: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 21:51:57 +0530
X-Gm-Features: AcwNN1UgmlzLO2QtgDmTIhpoG6ElFAFHl1rN8oIvI-bmMKMW8f6_U29Z1lRdz4I
Message-ID: <CAA-+ukLdb_98Fx8PCNesvg_-4BmCcU3jxy8QTL1-a46MCJu2ZQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, taniya.das@oss.qualcomm.com, 
	danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 21:16, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
>
> On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gm=
ail.com> wrote:
> >
> > This patchset introduces foundational upstream support for the Qualcomm=
 SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featurin=
g an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cort=
ex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, P=
DC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved mem=
ory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-kr=
zysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver=
 for SM7250
> >   Make all clk_init_data instances const across the driver.
> >
>
> [...]
>
> Patch 7 and 8 applied for next, thanks!
>
> Kind regards
> Uffe

Thanks,
Sreeshankar K
