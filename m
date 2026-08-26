Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066E371868
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760429; cv=pass; b=dpLUtebEjfTkUV6hJrQKi84+e6rwxHPikUMXbfl0IVZX/nMIUMCFrPXrwNJMYQvnAvDw6kewF3oKxrpaZ6gWykwHnKL8/1hwWOTHtoFOzodYA7QEou9PQLDjNnG1f6opg2P7ezobu3r1f1WZOSG+fJkBhyxhkJsuIuCFD4x4A68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760429; c=relaxed/simple;
	bh=aFuIk6AbhdcNiE1bV56o6X7K9fMz1Hx6enV/8s/aroE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXvQFM7G4xRFJq7BZrUCUFYiEV6ZH8s82eZ2nJ1vU4Yyo+aayksz+F4Na0Im5YsxaZlzoJQ1F2iPgSZAt5X/fzRue78aRdGS07U7MRJChrDTSPWzb8gTWSXurYUHGShS2lMCtttIC+dbCa/4aiQaw64WRgcxQ0qLwaVWzDOagZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAyksSd5; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAyksSd5"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66dee7a0c09so144951d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760426; cv=none;
        d=google.com; s=arc-20260327;
        b=kR7O5op38t9MpCockbWz+wayQIq2w+HUSpSMJ9/WUlawMgglcl0JChoEpROngJxA6P
         +Fez17NAa+rxhVRchZcUKXG9S7YPVLv2iYMVaYCtdvyVL1DM555IUcvUnapAa05JrTrN
         S39ibTFqihqxOd8qm1h42iDrVrbFjX518SjaqRi8ud4UDgZZTejViR1VJHZnMBE3hssN
         ccooKEhG3jggNBVTNLqpPG+xiN8xqwOxTw1SPR8RU1rHm00gbjBNkmM4oN+F10QZzo5X
         K3WV/567CMNEAO0GBXsk71n7vPRRVKeVYfW7IT+gY7HPBTvti00SniWeb4AcI+xaacKT
         0d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        fh=6qhv0h/+BDEHsjhixuaHIPONny4WMYydIkLY9b2Xysw=;
        b=fqMb5qAx/8HN5ebvKCt+fhMPnIonFOJCTZeLCv8/pymHoihJWl5ZoZMhX6YLzTUt3s
         PNNcW0w1nF3Y/1ZCPFnWO6DvPpoewsYBTDgkxNOsPIdw486oVePUOjgsJRP9CfSikY0n
         khByWBWPYYAJ8ZhBIwVmieJK/mTgz/5vymTOFBEBsqVwqjVz8JDKK4kmtHONxpxiDgKx
         09Oyx5gcmLi9og08tr0JOtZbapcOpzGkobnJwhE913Vm/KgNow1W0rRIAAmau9QI7fsJ
         dGWiT3Po2hZtPXGIW/XyUjUYA77Cad1L6p9jdO5Ha1AAyNjvsWZ0rSa78eHUVmP333G2
         huaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760426; x=1788365226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        b=ZAyksSd5/Dm7wmw2SqPibtg79xKHT9liPdYXA2k50TFiw+nnuXd/lKkFvtdANK0909
         FJvA2gFPQEIjsOANZN+yjVwQJyvtEWjVy6WMkSjg2Ubp/Ekl6LouEXhnOU2RHNXfBxDY
         0ErbnX/z095WYMmHOAbxsQ5DwNTVad3zkNJT0v8C1PfmrXbKvjg5t98zgy4i20beBA7P
         s8gBsnn7oUUACZUsKHiHYi76VcaRgh+M9StIZcoLsRyOUWtAKLv9bLRqkyN3nVyaq2Mv
         B6v+WiP1bG5CMduItYtUD+7crr8Wy1lQAmw0vaDvjq7XmC0a5BG3kikhvjBL6GGD4HIS
         wXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760426; x=1788365226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZlZQ8Rhh1qyGK3bhrJ6S37zPY0GD0Zfh5+8vycnKN4=;
        b=YmxKcacB+RK5CufxTOgPE/2FZtDnsmn/0KjYQeMHFLBKPI/MHN5VY92Ef4soc1Xgov
         dBP5vF4Drz+BnHci1uY4k7vIMYXd6mRxI+m6uAWjbc0FnwSrrlYWlCcu1s69nvVrrEsh
         /f5XWi2UmlmSQ2djOCZ5jks6gIUIc1ibOQE7Nzq7SCuJr6gfHkhkm+74jE8Qr6exGV6v
         3stAG3rzjCXLaE7BllGkGMQ/cgvfdfvKqU5bNQ8iieLh6zdI/Piagueb7P2opsA+gpTG
         nqUs09sXiABVl8XF58Kqx5+F8BPMXZsXM8qa+Dv7gESWZch+pIBpfL22+YvWnNTniSg3
         G0Og==
X-Forwarded-Encrypted: i=1; AHgh+RqgKDAOI1Uczfq1c3QxG3M14BfNz/x/6IlGweQWRBPWBBsDLe7ChAyhft/7hcieHsESvPU5dTK6z/2A+b4u@vger.kernel.org
X-Gm-Message-State: AFuF++lB7QuR6zdmNTn2kgT2P8qmbyUJHuyoIpZiSKT4QERjq+JpjZ+5
	phw64irD3fjwrYVIcvJWRgNGuCjQN/WYbxIwy3TYMb1r1ldoJ8PfP9p1Nm+3UvSgDGVfSojrOjv
	kTdfFbqs0qgNj0kTLxGSiW7fzrGqu5xE=
X-Gm-Gg: AR+sD10SWhdzqG318H91PvmSpNlCwUKdqg6lzJ1RiS1jYzCou4SLxkxE5OcljIFvwGd
	1wlLUq3O6rGAQD/cQ3zeKw2ntP+a08J3xC/DIOlgsjDUT3P6S8mVqFNyPHEM5Z7O00xiVEOSW9z
	whf3z0nwf9OWR+3OEuOYn+iQJFHEbveHdND8akJWE+WbsfWQEZ6VuvYvpv1pKpjvcpNItjgFhWL
	mYaeEOegfUwtNT2zVY+lYa1TccupbK0jX3qojFXx2dOydATSO5/4AQzTRBpR7CRBiMmJm9/WC5J
	goFNRqpw+KwjZnUROodfsWfKowVutuSDkBYq78vL7JDFbQLPp3jdEKUrlY+B2OOryf4DaEzK+Qp
	QdTa20zTVSCNKSx1U76i1MkIPnO/6tg==
X-Received: by 2002:a05:690e:d53:b0:66d:2469:2518 with SMTP id
 956f58d0204a3-66d256eece7mr2798681d50.13.1787760426443; Wed, 26 Aug 2026
 09:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com> <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
In-Reply-To: <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 26 Aug 2026 11:06:52 -0500
X-Gm-Features: AcwNN1XibUJOXyNOa2k-QB-afByCcBkGNudzVWR4SXKPlPfS0zWVsrdForCs6cY
Message-ID: <CALHNRZ8rqcDYcBJY0+Y_ioJroWsns_BFggMpuwZy9tiPavvBaA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:26=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Retroid Pocket Nova is a high-performance Android-based handheld
> > gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> > featuring a 4.5-inch 4:3 AMOLED touchscreen.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >  .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++=
++++++++
> >  2 files changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index 09b3c5b2d9dab..582805e89f4cb 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)   +=3D qcs8550-aim300-aiot.=
dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-odin2mini.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-odin2portal.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-ayntec-thor.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-retroidpocket-nova.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-retroidpocket-rp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-rb5gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs9100-ride.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/=
arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> > new file mode 100644
> > index 0000000000000..2422be63f0f13
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include "qcs8550-ayntec-common.dtsi"
> > +
> > +&{/} {
> > +     model =3D "Retroid Pocket Nova";
> > +     compatible =3D "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550=
";
>
> Do these actually have any common lineage with the AYNTEC devices, the
> common DT for which you include above?

Please see the cover letter to this series.

Aaron
