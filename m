Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794895390;
	b=Moq7Bredr3EWOwzWFe0W5AbkahHokLbj1VKqV10YF3HwdOdZPig9U/lFcRRKCXCIWWmQ
	 QYPNkSigNxZ8rEjINaYwomDhvidt1v5ZsnRFGuoxUCmvgs1n8ONtsjs2wTzZfzbIO5Aw7
	 Qqk95chYx5TjZrXFJ3PVFVtkfDSjymlN+tlrqo5MnPKkp5lpsbmCc+CE/vPcT0tAgSLsQ
	 rSaVvj7N7sw+cSxkkovmgca9ksG7TshJBMJZoq4FI0fu/AwA4Tmht7L5hsknBEsqSHVOb
	 Z3i84Q7rFaeI34X9n1Lnc1/5b23SJyiOFUIMm14zjCMGCfemySUnWTQZNoCC+UXUpcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
	b=SNv+6jXMli0VXlRQyNf+bSzpKNGixZB//L49QdJfqSRcRsAkhtFkKDkiJbxrPYcS7v2Z
	 QcuwwMwRisss0B71WyNzxCQoL5M4SP9nGR8VaAW8FFV/PIE3WyypwVuEevx8S1mJP3gy9
	 CHfFftTf1WkahCSztZgvgbcTCfJPzZ6zjpNXi3XEARb9T4zlsOXxHdcS7dFNrWufWm8Zj
	 s5B9BjzNQwn4EEm06ETSbBsGWwHwT5+02T4CqrXQAE4OWklcH8XxVQcDvLaP9gq/z3lEJ
	 P9Ob7SiLYfOfNTVaSE5GNlFOeip4Hul6H4SolDnpT6yLPL7K0uN7+cwpwvXWClG+QzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxu+q6fg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B557606A888
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B557606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxu+q6fg
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so670022eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794895389; cv=none;
        d=google.com; s=arc-20260327;
        b=WjUmsRO3CABHRHx0Pmpp5NUy4ghWjFt2iZRfsgDt5nZHEpXCK5xK9xKecUb9/a5nL8
         RkrbPY64sP3bj5HsnfX7TTodVZXKGNsJcnC3X72MOf2RM4IzNX3nCF4qx2TNliO6zsk1
         QT0vaqxvWdBNt9jK5GekFVGLDH6KcuPZrMkJm2mcFoQZF5+GrNedeBU78OMTiA5rpCl9
         fNZ8UNTTaloGr/21LkcEDB72Q7prDnj04NiTVM6Q81JrcoFO2oWdwcKpxx4bztP9q8Xq
         RUD/mGktWPGosmUv/80/FLAIjpKcGpUyG7fpiFt+bWlVipf8Kj05IDVNzl9QjjZf7hNE
         eUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        fh=JMM8p0CyhPWX2acbAgTwfeCdGk5kz13SV7FPo4MFPsc=;
        b=ea5NWx0kGb32PaiJG2eF2UNqpe3PQ5rQWBlY+F+hz7zeinkgvDZ05d24rjRPEiRkrT
         oKu59zln9v2aoXK5lg+zzpDosa7IYuO5X9i2qp5f7NwufcrNJniMFWgeEQEFqkP0bM+B
         DsQ8MrJ0YXGNJoSzVux6R6mkw3KC9b0hBfDHKH1nbPIDslraXj2ANfz/PH3n0GirnFS9
         avevOMcGzIbXxu3yhxOlziBUL75xdr0aL6j4OuvAZS1LXatYmLYbIUtbxKEzaq+E5+0u
         Lt0CIkXb3CR985z0oP/nv/WCkN8WdKzFgWG/luITTJPSFLQVi6QW109zLun0EX2a3IaR
         4rPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895389; x=1795500189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=oxu+q6fgYWKxtHBHw8FvEpHrsqniQ8qJPoMRxryaL1MyrshMDryi758XSD277qDFDE
         6kQJ62qwIpdHfvwgQr8spoC/AFhwSMpfV9+iai3aUx0ROe87N+mIP3itcLpT80NDIawR
         jOjqE9ASRmOMDoROtB6AtMQBEIMtUDZIF0lpBpu1/MewronKUFiRIT3diqzTzylgYFC9
         pSHDQiLA9c/GONdGiNyXINVd26D3Bf2nK3FWnLoFMIjF+MR7LT8lMGuXmknfD8WCi9fR
         CygUu8XtbTumvS3Bvez5qc4mmqosPXuR8SsKIcokDd/8fXeaslqx7tFkFeBvjhRh4cvA
         AX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895389; x=1795500189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=qH5qNig68kYYul/1lB8hdskJZByx63LDpFTO8c7DkHvwIJoQ/4o8Wg9sSAg8l+E6Az
         vU5nK+ZQt4l5jWZGwtoKFj3NZOs4KAdaZP8gF9Cy/uxFWWQwTzGZW8ggbah0lB+aRkPO
         0au2BCGipeUvsxPh/6pH+ByzatoA5noxGD+HXv4baWvNC4GjHGIB8l52Fk6ZQ+jv8tvV
         sZtK4P0vuzwWWXd3dH4uWwwoHZ3d/uwPMQcDqaLxBel6JMaT+Bvo/LJDHTd2tYr3K84c
         exQ4mgUYEsOTtJ7DOfFHe6xOHbwflFkLf44FwvM87bOsiorkWBP4ddDYQqOdKq1oaLuC
         Naiw==
X-Forwarded-Encrypted: i=1; AL+hErGFcKxNpgGQh6SdDQ+9JgJ/niLK0s9BnzkVLgLFfkOsq1EpfbyOZjRK50vqn83J267LmFIKeTo7AJ8bIq9H@vger.kernel.org
X-Gm-Message-State: APuU4Z+OIBWnr7Q55OxEDj9PneF9C20xyULLddqHjMcjuekLoBzxKdVt
	2icVI7jmdU4or5fWXMsMDIzFzOmWqA7wF1czhnlZC/CuUUPGeFeiWlFvgQEz7BjHvxen0vCYxI8
	sMyNQxGjoNrijtTF02voJMJpvUVjtl+w=
X-Gm-Gg: AYBFou2+rVpTsPm+i0A4BTppVR9u5+kSij8COZ1PdTY3mYFS9CvWcpvbQHHb17t66Fw
	Qh8HtST6HBZjzu7SpHKpk6lVhxhRoWDf/XjgP5wnBc1+/TETJOYk/ZSS3Km1gBJPd692czAHIYp
	R/OD/VTeq39WdoHx1hs6OEGO24Z7GrDMsaBujf5Zyf2ExQGi1VdFqnTQsckqKlHg1FMdG3uekP1
	dHhW1JMXFa0KdrU702NiUQv0pQKjybf4z8l71IqTAmH+0nK3gie5l98qOULjORZlipG3QINlFvO
	dal4+5+Dqkm7thIJhkEtVDiuKRnbwB5ZKy8ICKaUUznXTTC1Ue1FVSvImxzYnadN4wJUrCuL9oY
	wuaXp463ahGHGU1iTqBjV0LAYaxRnSS9G6jblS5U=
X-Received: by 2002:a05:701b:4586:20b0:1ab:cbd0:1c96 with SMTP id
 a92af1059eb24-1b53a429876mr1337313c88.4.1794895388323; Mon, 16 Nov 2026
 22:03:08 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com> <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
In-Reply-To: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:02:52 +0700
X-Gm-Features: AclHuK9yy_ki_wzibjw_yQRrzFByvuyKJxJWKjlXJNrv02S4I5fFrI_oRWpsa90
Message-ID: <CAAq9HC6kCspxX8DyDXp2RuhFSXmU=1p0s6xdOmjhGZ9gZgmj=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:14=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> > mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> > NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> > probe is aborted:
> >
> >   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain faile=
d
> >   with error -95
> >
> > Add support for the "skip-suspend-mode-switch" property. When present,
> > do not call psci_set_osi_mode() and continue with the topology that was
> > already built.
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, added log message for skip case, =
renamed
> >  the property, added property check at PSCI initialization]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
> >  drivers/firmware/psci/psci.c          |  6 ++++--
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index 5722365b94..cc9f14769b 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platf=
orm_device *pdev)
> >         if (ret)
> >                 goto remove_pd;
> >
> > -       /* let's try to enable OSI. */
> > -       ret =3D psci_set_osi_mode(use_osi);
> > -       if (ret)
> > -               goto remove_pd;
> > +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
>
> Rather than reading this property here and in the psci fw driver, I
> suggest we just do this in the fw driver.
>
> In other words, let's make psci_set_osi_mode() to succeed when
> "skip-suspend-mode-switch" is set.

Right, that makes a lot more sense. Thank you.

Best regards,
Reza
