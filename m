Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5142AFBE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838744; cv=pass; b=gdpBSxFNq9I6YEKn+W7kyYQ8jNhZUljn8V8oRt3/0EU1yA4IxHvLegnCak5JtIbZGOTvgq94yxONhnW43HDUGI7ROrtvRhZCa9WzRdmkj6UpZNBoQtcTOMPtDOxTyJMLwY1LMlE8Hg074kPyL5ioFGBLfk24oDJOLG2IOvfNwUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838744; c=relaxed/simple;
	bh=eOeG508aHYWbK3Xr1C6Yqd9VRDdwIhi0pqvtGII3tDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YU1YSZkiGNvKDChum7Gm7bYQ8GlQSFczMzWJyMwZVM/T42bqmmoYQrIdYD+m8moh5Hnd1WX5IS4gFx0CWV205cuV76mGZnWXLLGIvjumVuonh2fAwgRZghwyfkzniYQ7QZUlyNI7b7LWeJgTCpX30lOiumAWihXoPdIGw0YzeY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGaE4apA; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGaE4apA"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so8912541fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784838734; cv=none;
        d=google.com; s=arc-20260327;
        b=TIJ0JWgZdv4W5jb3N46KU+CdBU6h6P5tHZ0fV0p/fMcumI6IuAceSRkaezxbevva9D
         F+dNPVd6rTBZdamcIMUBIP0cDA+VcZ7I328NhN39gioCaNYQ7b2vfQeROmwrdHevfh24
         07KStAqKMxfWMYk1/6seTXgoULSJl1cQDZ3VgyCfC/yQ9ZqabLl7ocWKIfo/SmKmYad1
         QTmiZKqwWiINucLvNkSOClZZFBWTvKrVbIjx28d2ZhHsXV/jiVXJOzaRQHxXmxpgmcLY
         VQLRXW87eiK7uqyGkr3cpV5tOUl6dcgTLLRs4XhAvRGTauMRdkwslrLgQ2yVeCS+qPkL
         AtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bx5sWJxftrQrtfDayKdIgeqeQp/vyw6I8VLok6K1+O8=;
        fh=8+/X03VKkNfT47nSVvlAndOJBE3zSqmLB94mY+xJOYk=;
        b=aTvpguA/dSKOmS5mpnIrcPt01I1VdApaX35UWz5btLqskMrhmv/7MnxW2XTs9JlWkg
         d4Sef7hxpplK4gSypQ2QbM3ZrfNVxq4nOb4NR9japJZKRUiyZmZ/PmXeDo0df4MgLh4z
         Ckwt5k9pM7STNwcTmpeUpSKP08BplhGk4GvMLbN+LY0jTjZUzRaUZ9PjPZv98+qSzCAM
         oFikfkivKYniBPBV+wTc57v7F7JBc3OYMrB6+zDGNtv6/4xNmvfljCa79CpA0WHWM7vY
         VRfFXZaeCOH87OlaxTM8YC543+bPHYZyDY+F4x0tEF4kk0/3D5Y4ixvy+3Etbj5pZ/Zx
         g7lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784838734; x=1785443534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bx5sWJxftrQrtfDayKdIgeqeQp/vyw6I8VLok6K1+O8=;
        b=nGaE4apAlR17tof1nOM3xAecTRFRRa6z0ZdUNVhgrykaqUqXoCHRXg03lJKp/24wvE
         62yf3QcY18iBdn6QFSYccPJq2OcjQI9cO47GsLOEQvUI6CHdksDF7LsCwWtSDoI7xDZ+
         MC9QySnpIYY40tcSev8DJlVRPF5MGR6jV4Okr0vINbV2ev+kHbOw9O6fPLvz7Grs0RbG
         KXgpEtx4KW+UMaG0cpjEWilFK+tmVWwdu1OHhPHbQGYciN29y4VlKJddzc5svpYnEG53
         tBbBGevdhRf2TlOb+IjpLF7l0uz7zTwh1q4CnlGeTfIGr6r5SoSH8HO87Kc5WSKsr9db
         B9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838734; x=1785443534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx5sWJxftrQrtfDayKdIgeqeQp/vyw6I8VLok6K1+O8=;
        b=MUh4KLzD9yMLNmrdOwbFwqlRC6o1KCxZPKwSlay3zsSRTBKL+UMP1KBGDxBSCbiZw+
         vuyb41tYDt+orXB3YCrD1/YKcubQ9ielOIzioZGh/QCxn1CZw/O5UpRUkoQcwZEcNuUr
         LvSBPrk4KTXWPXTk2DyPOJjnS2xVrjtoAhwqg4rTRTlhLq49KBYHuvZP1uXzWoudXZNj
         VixX4Z934eORc9YYbjOSsjr36maAQOTwqacyjb2wawi2mlmAvqMWxYaYY8aQ5y7bIunO
         jaqKZFI8bghGR9uDEDZFrLIzc/Se2E7grnYDvwCcZe5zZh/Y17WIyYfY1t9fF6idteRf
         X5TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKfb3cbfSeJSjc5FulL8fSNmXodEWUw8HxyISeU7TA7E1lpUaZr+OiNJWXZoFBSJwgRgCnV3Rx+vrhsWS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3n0C0pK04dbiY0Bb2AlIyTv7ME7+oc+UyA1eiD1AynKquCm7+
	Kom0/mXqLn4g3yXUMVtg3drnAfHMQxRisORouRBvkv49n+rOn63/b8hHmvF6MJNIEhaJvMe7SLM
	8XWB98B4s0SlfXAvgIGpUHWX4Et9ilsU6ow==
X-Gm-Gg: AR+sD13un/RsQsbH/T+puYMWz4VgRSDgQt1esHhNcS1sDMXQS83H9p/YuJ84pvJ9WW6
	ST+HW+AOyctKIEEC7ns2+xP6i3DZyuqkD1DJazJWVi15L/icINdnPhxE+uv1sM3EMWrSbsAw+wb
	VvB5sGu7mFj1yPuy72WGKbelTvHIWiqDHq6/iAwp22FSNkwrMM/KfxCAJBBYm6GpxA0bTpRsjdp
	B8DWpLos5c4pv1SzOzP9nyfxuC13fzone3j9WajqKTivQS6UY8/Lj948cNQTdwnXkMO2btvWPuL
	zemf9cYSQO7LKuc1MMydBwrdSBWU0GfPnE4wrH2awoFIjXc=
X-Received: by 2002:a2e:a012:0:10b0:39c:6e84:99be with SMTP id
 38308e7fff4ca-39f07e9ed4emr8044241fa.21.1784838733792; Thu, 23 Jul 2026
 13:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
 <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com> <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
 <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com>
In-Reply-To: <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 23 Jul 2026 15:32:02 -0500
X-Gm-Features: AUfX_mwYG4-fJOSair7gb32GVL9MppZtqgrzCpxFkOHUTppKBL2CYuJQ4JilW28
Message-ID: <CALHNRZ8UGRzr48RaTufn_CXq0si1_uwYQSnbX+8YAtf3=d04YA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 18-Jun-26 06:37, Aaron Kling wrote:
> > On Wed, Jun 17, 2026 at 5:41=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
> >>> permit scaling the Last Level Cache Controller (LLCC) and DDR frequen=
cy
> >>> by aggregating bandwidth requests of all CPU core with reference to t=
he
> >>> current OPP they are configured in by the hardware.
> >>>
> >>> The effect is proper caches & DDR frequency scaling when CPU cores
> >>> change frequency.
> >>>
> >>> The OPP tables were built using the downstream memlat ddr & llcc tabl=
es
> >>> for each cluster types with the actual cpufreq LUT tables from runnin=
g a
> >>> CQ8725S device.
> >>>
> >>> Also add the interconnect entry for each cpu, with 2 different paths:
> >>> - CPU to Last Level Cache Controller (LLCC)
> >>> - Last Level Cache Controller (LLCC) to DDR
> >>>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwid=
ths
> >>> ---
> >>
> >> [...]
> >>
> >>> +     cpu6_opp_table: opp-table-cpu6 {
> >>> +             compatible =3D "operating-points-v2";
> >>> +             opp-shared;
> >>> +
> >>> +             opp-1017600000 {
> >>> +                     opp-hz =3D /bits/ 64 <1017600000>;
> >>> +                     opp-peak-kBps =3D <(1353000 * 16) (350000 * 4)>=
;
> >>
> >> I think this should be * 4 in both cases since the interconnect driver
> >> ignores the channel count for a node in peak voting. We may have a bug
> >> in all other DTs here.
> >
> > If this is confirmed, I can update this patch. I based the
> > calculations on my sm8550 copy of this change, which in turn was based
> > on the sm8650 change. If this is wrong, that means one piece is
> > scaling 4x too quickly? Making it a power consumption issue, not a
> > performance issue.
> >
> >> BTW, are there no lower OPPs for the fast cores?
> >
> > Not on cq8725s at least. These lists came from an AYN Odin 3 with that
> > soc. I don't have any sm8750 proper devices to see if that's any
> > different.
>
> Mobile SM8750:
>
> root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu6/cpufreq/scaling_availab=
le_frequencies
> 1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600 3=
072000 3283200 3513600 3840000 4089600
>
> root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu0/cpufreq/scaling_availab=
le_frequencies
> 384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 22272=
00 2400000 2745600 2918400 3072000 3321600 3532800
>
> root@qcom-armv8a:~# grep ^ /sys/bus/soc/devices/soc0/*
> /sys/bus/soc/devices/soc0/family:Snapdragon
> /sys/bus/soc/devices/soc0/machine:SM8750
> /sys/bus/soc/devices/soc0/revision:2.0
> /sys/bus/soc/devices/soc0/serial_number:<snip>
> /sys/bus/soc/devices/soc0/soc_id:618

This list matches cq8725s and what I put in the commit. Is there
anything I need to change for this patch to move forward?

Aaron
