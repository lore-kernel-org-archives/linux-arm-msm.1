Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7DF37AA99
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939359; cv=pass; b=paV1J+ndNle+pEJ7IrycogrkLyp7qMVrfXDenEJGbuCk99mDQ6FqNbMEEinKOrgUQWjJ0DgrHxVkp3nJwuVkbaAOAT9XEFWtxElzH6hUY4l6TvVWh7DJXQR66xWE8IGpa5neg2LyKmtP/6dtalx8y8BaryJ67RybajXrapHGh54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939359; c=relaxed/simple;
	bh=Q+CCqNFJAWM5zclazh2uA9ABf22MMeWrfoy3sMf1DJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZHHTB6gzf31EdGa4C5J0YN6V7R8QKJgHMObtCKIa8HcnIumViH94zZXcdFl4TuhUzko5M8O+bLLJ4eeKsKYoFufod2onSRg/BYYePqEZCkWCtQb2aaTvAC99yarWmcH/oGyupGHa3OPyoQiSQ00+bdxeoU+nf5Q9a9mncO/3EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kEunrNpA; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kEunrNpA"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664d22d7337so5588394d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783939356; cv=none;
        d=google.com; s=arc-20260327;
        b=dIZibjpS++YV0qgOEUl1rn31dBtCe5eHXoRYY94WTwxbRE5QVrrruHwm1vsiFWQj/L
         rXMY9F/wYNc9tZSGEfCxx6JCAED69qOFijhgeeocM0BymwwzxiRc1xlz68MOluN6/1Dw
         Tmgdu2xvu43D37HjQDDTN7hVyy848vm+kzxUMfomACedSpnQ6y3/PuDfIIj49HXt3PTh
         fJTFVQ2dt0TTIYNbQAJDnk4Ar2K8GwSUf5BwRU7qQOOfagxiI65Osbvozgmhn9Glip0O
         M6SfZzJocoj1EZQeY8+VAwzd1XdsNzvXVLExd+LebDb6iidyGu0+YJM6Pr8tsRzPITPd
         zzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eWFL44d2xUl7HIjwQPptHzV3ZpTWrkGx+gsq+YbLkl8=;
        fh=fLwuITR9lvAOTerSfrNFoKLUF1SihXksPphaGGcvOQw=;
        b=VBwIL7z5EbSFarCoEm4+t4aC5BIR20Gq0iHzXW1kPAFKOdApVy0A2USC6R1s+LFHbB
         J1sjkXcbrg2g/ZNepie43VYBuzlhtNQbSlkwgtS3Uo6eAxqESQhXi+3XnkJHnZWrqzcH
         rF2Xqwg5iqpRn2WfSGHe7/+CZa773/VaFli3jG1BShzzmnCl5QdDvRAzT4kFO0PVHc/Y
         OyGMyxRTMLSlKPymzg2/SlmvvZs/OCBAXXFHFzqU1E8WenLRY+Vn+nUyTM74TfxRhqeA
         ikhaViL7TEXNc2uuoq7Lpgcbn1oqd3dDdrDiYuUu50Ln1CTG4+/2RidR7VXUr4fC30uJ
         Igqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783939356; x=1784544156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eWFL44d2xUl7HIjwQPptHzV3ZpTWrkGx+gsq+YbLkl8=;
        b=kEunrNpAtZo8mwbbu0+JKqM+tM+vEkGZPuEMau3eab195Q9GE7V3NDmQSqGgUU0mQp
         3cIX4XoRQYIjmrSpUnZqUXNounNhRE0APyKL/+Y+0xaPfnD4cX88kD+5LbF0dY3ydwbr
         qUJLomnzyREHtatI00tqTBZcL5V+3HaagcB5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939356; x=1784544156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWFL44d2xUl7HIjwQPptHzV3ZpTWrkGx+gsq+YbLkl8=;
        b=nRTekUcQzyC8T/5CasV9wEJ0bJoCYxfSLUUF7E5z7bYpae+DaWXjbaxgEXQMxOAscn
         PT3LUHhP3tgOofwfwG1Xd6QIBO4LXDfZFjuTUPMN+Ts0DtLRoDsIMWwRxrUfRv6kHUIk
         h7oPnJmVc2NzmvNxi9BXjD/yyk8HYGZvsF0BCF8HfNx41xFNbAHb30G2WQkBiA90ZGtS
         RgqorZhnZXtdiONtSJMCU4kdIjBwICxnkh1CBsTFbXLJ1uZIlHKBUIL32EAlVfW/epYr
         oqNbtFaFXzt2+bQlDc04TblaBnKv4zUv52KsCkC4v7+4y6phdAOwVQXtLRAr7hAHv8Qa
         qtsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeP+8vNOzZj2r/Eo8oIrVQAbzuSp/rAdQLKhW9KVxQ1GDZza4qPWRsnDjOWgzYokB7VFYy6fBYB0/KEs5T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58+5wWsdhbx851EU01SFZ9KOwRwmYj8waDfsTZe9ZXoh4YVLt
	vX01AS9lmxVDENbaNJMAn6uK0yHZ/8dRkuotm2aaa/A4fO6MesTz1wPQGCAnD0cZ9tbGJFT3i3R
	ANt1Bq6Ul/OIou7V/dYwJLqTREIx9mmaG5J3DOUvSIldh5YpRuymY2A==
X-Gm-Gg: AfdE7cngXBtlyo8wMrDUftBRyK0UV4z9GQw11SPYwzDJHpVJSSzI+98yuGKZhHffAB2
	FLnoxFicQzTj6tk8g2f7J78fo2oGlgK3QLHL7hBdppT6GrzzjFetMi75NPupEqllm0jDnt4+ib1
	DjlQI0AaL2Gy9Ae9rhnDGdiSTWB4cqUcD5pneh9vpy1hYmg9MmXCVAdCj/IYqj0hhvhUmwx+8fM
	oiyewOvLp5Pqau51O+0M86XJTvg8p/jZ3CvY21da30M9YFK1g4ZzPR8qfC86MDteUFvfWll/YCm
	vHUQ6JR3J5wMN64NxVvt1AG0CV4=
X-Received: by 2002:a05:690e:12ca:b0:667:f107:388 with SMTP id
 956f58d0204a3-667f1070edcmr2274020d50.36.1783939356491; Mon, 13 Jul 2026
 03:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-13-wenst@chromium.org> <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
 <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
In-Reply-To: <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 18:42:24 +0800
X-Gm-Features: AUfX_myp_DLSLs6zxF1b0ZOGMaYgyXpFtWmzvguDpYK-nGyh8AfVloamNxBzSn0
Message-ID: <CAGXv+5E0Nz=uD26eXSdt3jGKEjsWyai_+PO2ZBTr8t45FQ+SKw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Wei Deng <wei.deng@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mengshi.wu@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	xiuzhuo.shang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 5:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Jul 13, 2026 at 5:43=E2=80=AFPM Wei Deng <wei.deng@oss.qualcomm.c=
om> wrote:
> >
> > On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> > > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB o=
r
> > > UART for BT. Currently the driver only supports PCIe and UART.
> > >
> > > Add power sequencing targets for SDIO and USB. To avoid adding a
> > > complicated dependency tree, rename the existing power sequencing uni=
ts
> > > "pcie" and "uart" to "wifi" and "bt". The existing target names are l=
eft
> > > untouched. The new "sdio" and "usb" targets just point to the renamed
> > > "wifi" and "bt" units.
> > >
> > > The "unit" names are internal to the power sequencing framework, and
> > > should be confined to a single provider. The names are only
> > > informational. Dependencies are tracked with pointers to other units.
> > >
> > > The "target" names are the strings that the consumer uses to acquire =
a
> > > descriptor with. As these remain the same, existing users will contin=
ue
> > > to work.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Changes since v2:
> > > - Expand commit message
> > > ---
> > >  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++------=
--
> > >  1 file changed, 27 insertions(+), 14 deletions(-)
> > >
> >
> > Hi Chen-Yu,
> >
> > We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
> > and UART BT M.2 cards and found an issue with UART BT power cycling
> > when the USB hub is active.
> >
> > The "uart" and "usb" targets in this patch share the same bt_unit_data.
> > The USB hub acquires the "usb" target in hub_activate() and never relea=
ses
> > it, so the bt_unit enable_count never reaches zero when hci_qca calls
> > pwrseq_power_off("uart"). As a result bt_disable() is never called,
> > W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.
> >
> > Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):
> >
> >   With your patches:
> >     lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
> >     btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callba=
ck)
> >     btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed
> >
> >   Without your patches:
> >     lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
> >     btmgmt power off -> GPIO116 goes LOW  =E2=9C=93
> >     btmgmt power on  -> hci0 UP RUNNING  =E2=9C=93
> >
> > USB BT card (WCN6855, sub 0x3374) tested separately works correctly wit=
h
> > your patches.
>
> Thanks for testing. I haven't gotten around to doing the UART based BT
> in our stuff yet. Though today I had been thinking about how to reconcile
> this with the MMC pwrseq stuff, if the SDIO stuff isn't moving over to
> this. Still no idea whether that would happen.
>
> > The testing was done with the following Hamoa-specific patches on top o=
f
> > this series:
> >   [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Ke=
y E connector
> >     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5=
e725091266a@oss.qualcomm.com/
> >   [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UAR=
T BT variants by subdevice ID
> >     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5=
e725091266a@oss.qualcomm.com/
> >
> > The fix we verified is to give "usb" its own independent unit so its
> > enable_count is tracked separately from "uart":
> >
> >   static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_dat=
a =3D {
> >         .name =3D "usb-bt-enable",
> >         .deps =3D pwrseq_pcie_m2_unit_deps,
> >         .enable =3D pwrseq_pci_m2_e_bt_enable,
> >         .disable =3D pwrseq_pci_m2_e_bt_disable,
> >   };
> >
> >   /* change usb target to point to the independent unit */
> >   static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_da=
ta =3D {
> >         .name =3D "usb",
> >         .unit =3D &pwrseq_pcie_m2_e_usb_bt_unit_data,
> >   };
> >
> > With this change, uart_bt_unit reaches ref=3D0 on UART BT power_off and
> > bt_disable() is called correctly. Since a M.2 slot can only carry one
> > card variant at a time, the two units do not interfere in practice.
> >
> > Would this be an acceptable fix, or do you have a better approach in mi=
nd?
>
> I think it's acceptable in that it works, but it needs to be properly
> documented, like "this only works because on the M.2 slot only one of
> the two interfaces is used; do not use this pattern in other drivers."

One small problem. On the USB side, userspace can disable any port,
which will cause the usb unit to be powered off, and therefore asserting
W_DISABLE2#. But on the UART side, the core still thinks the uart unit
is powered on, and the consumer would need to power off and then on to
recover. Maybe that fits into the normal reset / recovery procedure,
but it's still not intuitive.

Maybe something like

    pwrseq_power_cycle(struct pwrseq*, bool forced, unsigned int delay_us)

would be better suited?

> It's also up to Bartosz and Mani, since I believe this is a slight abuse
> of what looks like a shared resource. I'm sure the AI review bot is going
> to complain a bunch.
>
> If it's acceptable to the maintainers, I assume you want me to fold the
> fix into my series.
>
>
> Thanks
> ChenYu
