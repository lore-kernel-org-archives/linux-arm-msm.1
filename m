Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15007360EDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640902; cv=pass; b=RvgjXMNqteqEAtLDTMn90T8tjZXVcKfZGjnJ5UTPNYVyTeDTXeyBSwZjAiR3xKmyPv29EmXOQNcOTYJIPtpFLPd3XU28hw11Kc8bFcISYH7tg/HFUX9esSfrFyLihdAYuOsGatURoWfcArWg69t010G6mrqtk+gVWCe5Xm6svuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640902; c=relaxed/simple;
	bh=FC1jKvk7IR/JY6cYWwDQaxgJwqGXQyShLSdz4569yZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxdFPjaylj9p9ZcFgQtu4deLxW+JwBMXa2U77Yxf/JgDX2EjCnU8ULiJsXj/Kyqjp2d3DwG0vqKf6eIJFZBgsGsq3kolST84VSj5dfP3mbsIo3cKkGRKw6SXVdX7ajHUVQatG8tnb6exNSlAh81kb3vT0sBKCc9mmDAtgHAQ/bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWhxBlQH; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWhxBlQH"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ef8255cccso37489077b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784640900; cv=none;
        d=google.com; s=arc-20260327;
        b=c/QwdNNKco84z7Wq/hJv1YQBS1CuTWaPMcmRl7T7VnxjuEb1R71JLRdtQlo7JuUN9a
         WICAcO9u1MoWcwTqNTw0H/XEd09DPrL1uhyTPOV8vr/op21jWvuper3B98oocK2S7a4k
         Gek8JE7r4X2jWJPY06Ddy44BMTDGGwp8f3b87ATBACzLwtYC7ZivkDM0plp1pQV46AGZ
         1oOtJBrTXT+C949yrlQ67RbGBiRGqgz8szvYO5lIaqfcOJGLSqJnJRZKddwxkIGHQUsb
         84x4qJmas9y+WJae0DVVJV8nLjAf4oBVmLty3wVYra+85zCmMggbXMUUMtljzn+lZXoJ
         Pr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i86R+52aISfP5t62myBuNbHCUamsT0SSyOwnWKb4yLo=;
        fh=SkzW7QeDobEZf1CKGA5U0PxIFkUPxbO/k0H7wB/Rg8w=;
        b=Dkf04hShOXL0s/a2BjwJ+czf1UfrUA1G4H/dSir9P23bnSmr6pN/soqcazRjxThDb5
         oJMWEAoJW1sB2+A0AWqmM5BisD7UVx4sNuBc2a1NK7isc8zH2WWP7TyEVoaxvH15mg25
         n7iR+fpw82Y/ptMSVhNN4SPij/5MPN6Unrj4vkvb4i5BZK62+7nbIAy0iMTTew8NR5D3
         11KqkQFb2LtXlMVfI9lVHoYceorkgDli10xq2OM3IQfqboZrqWnqOCApC55hzas8MvUB
         Ckh+5rVd4GB1cFdP198OHNLLtG+eiy/3SEFVipzDkJA/IsIQ2nbec4pAXo45GDiFixBP
         T6sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640900; x=1785245700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i86R+52aISfP5t62myBuNbHCUamsT0SSyOwnWKb4yLo=;
        b=UWhxBlQHyLZ5QMINQ6OACiZxcJBNKpA4m99JJWSGWtqhiy4fZXQRpbPMQ5Bu+OF6f+
         HsRQjNk2gRAX6tc2tGOw3pILdJgw38D3DBTe2EF1Tv/Ve+8DUOuX5KE8rt7tiDgEWV4q
         J2hJHRDH5Xjm7MNSjASJeKxSRpeE+HhpUnxn0vH+yjQlJHycSuj/kAHZGO0bXXWzDiC3
         6twzs354a2dXrh5bgXEFbhyL/Js3hmIr/gUb1WcMpDYkOdOlxGhX5kK90+f/GQI4sbRv
         Gs8wn+QEtGieRWIf/DHx477tA30Dvm5mbMwzNElrtXZ10FSXg3eOFl9KrpUcahK0RCkK
         y+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640900; x=1785245700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i86R+52aISfP5t62myBuNbHCUamsT0SSyOwnWKb4yLo=;
        b=fIvawMwJRwbzl+i6YaQ6rzeeu5YfBsfGjvVT2RCcOIdzgTkBIQ8TXj+JCRLDf/a8RP
         8CMpq5Resr67GATSPyZKxhelVi8z/Fur08/5qAdTXgifJK/jwhxpHSAkKYL+6IkBIdIU
         SPNZ9dRW1p6nIH/CaLimKQI9aAe/D0OLjWIJB8x8eJC47qhJ1FBefEn7hS/kCFXGshSR
         yT2XXwQl63qg+Vjk1MJgHX3t9QyEhHvhDRG9mYg9EXxCbr9uqON3RoH6rCFLS38uIsKt
         opG5yP4ZH+OYzjkZ14f9WtclAws199wjwWd1bvV1LyJeVdZ5XWBWk+dccQ7Ib2Sidn+h
         2aXg==
X-Forwarded-Encrypted: i=1; AHgh+RpqJZiqXvA0ZF7EzIgAH686mtQ8yUtSe3eNP4t8uX2ucA4ygWDAXvu9ZZk28HyoHcEVgxt0YhOB3owKN14I@vger.kernel.org
X-Gm-Message-State: AOJu0Yywl+LMGpaPJWN8aonusGddeq7zKXxQqmM9ZHIdTu4y/Eosp9YC
	rmNpHqrGtvfuBqleQyFD6O+kaAhUfRGD84XzVTJBZvAS1PVuKk6hAxredhTQiUfGjNdOwUCOnLe
	n/MxEc3wmDfHuXXYMgIdLR5OokQn17c4=
X-Gm-Gg: AR+sD10xqW5paXz3FdIxO0ezGqNl4kzvhIQDj3H+jIxKp92tWHb8pWOMhiiaKgzvNT7
	qJ4QxUZezLiFDLsBien4Uwg9qsr/QjQ0+kp/uCLK6PmWWm4TUGn2XKdZg2+o1TpNOSkTjthtzgV
	v005xjWEz+beovGnNVbBoqwBfl8xNbXwDldmQMroGvsr8cJWOggWrU78UH4EEMfa8phXoLprmX2
	h25iq1v9NmcPvsKfFuteoVvMzcfZhgDLqbFb5fD2v3qKzFVZNO4K5ABPPCteSRcgtY0
X-Received: by 2002:a05:690c:c4e7:b0:81d:9452:715c with SMTP id
 00721157ae682-81ef25c801amr58767777b3.20.1784640899815; Tue, 21 Jul 2026
 06:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721082410.18275-1-kaipeng94@gmail.com> <20260721082410.18275-3-kaipeng94@gmail.com>
 <f15fb988-09a7-48c8-aaa5-2a5dec3a1d15@oss.qualcomm.com>
In-Reply-To: <f15fb988-09a7-48c8-aaa5-2a5dec3a1d15@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Tue, 21 Jul 2026 21:34:48 +0800
X-Gm-Features: AUfX_mxLpLfwnkLuIp48lcTkxxMoKVznBIByIHH4kKSg8CZ_wjSB1qFA--HN7dU
Message-ID: <CAHk8Zds-rCfWZLfjM54vNPDK8qF6t8u5qSyMjeGU0mc7V2EKOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> > It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> > This device tree implementation references nodes from the x1-crd.dtsi.
>
> [...]
>
>
> > +&usb_1_ss1_qmpphy {
> > +     vdda-phy-supply =3D <&vreg_l2j_1p2>;
> > +     vdda-pll-supply =3D <&vreg_l2d_0p9>;
> > +
> > +     status =3D "okay";
> > +
> > +     /delete-property/ mode-switch;
> > +     /delete-property/ orientation-switch;
> > +
> > +     ports {
> > +             /delete-node/ port@2;
> > +     };
>
> What happened here?
>

SFA14-11 only has a single USB Type-C which uses usb_1_ss0_qmpphy.
Sashiko reminded me to delete mode-switch and orientation-switch in
usb_1_ss1_qmpphy (And I remove these properties in usb_1_ss2_qmpphy also).
Since the usb_1_ss1_qmpphy_dp_in (port@2) remote-endpoint is mdss_dp1_out,
and mdss_dp1 is not used (DP Alt Mode), I remove port@2 in usb_1_ss1_qmpphy
and port@1 in mdss_dp1_out.

> Konrad

Thanks for your review!
