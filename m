Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471681;
	b=Io1+y63jM5VOg4D97EP4RHPCP9kKXSNRSnGPeplMWXQYExeerLizeO7WtBPzsuHnowtR
	 5hfVBBW2gaBwPuZPybLQHLLTUBPGg+2NaE/0Q9Etd4dQpGKQ3dRccy5ARiKcxAuRCOdL4
	 zKY9m831bEk1snKvgSrX/l+IPfzY80KJ30/UrcBFT6GKw0FF83DKgNr13hNmiEbMtNWsW
	 u0RVa2hYg2u5vbch3Uj+Sj+lhx9j73Ia0t+Q3ULGu0o2Ve0DDL0uS39dCGDOaqPJ2WoMW
	 YknK7Q1sxAD/uEfW5sRKXvGPllYgg4SnQsOGsz7HWeJVlZYEAZhfWxnEfDJaiKT1M2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
	b=5hJYL1QnYV91QGoctFpzr/REPXPdWrkdYmAGM02j6s5HDxpq+bkUByK1w4Hr1k5itP5a
	 B0Tp+MiHPNSP+lcacO4u/ZTKk9DDs6ce8BdEQI7Gj9IkJJXuzfmZG+K+OyKBrhopszhsf
	 +o1zKkpkeUnQ354bmb6UVze9XVtgJRm3PRh6WhplHmT8/cHUAvu9/VzxJxRjRCEf/wbde
	 QiowWWQ2JEy9mvKQt0os5HWYqtfnMpACPODbHJG5Xz01rS11mzweHbLdMbtI7BkwuCJWl
	 PWd2x3XO/Lt16sUtfjgM5G0V3k01PYx2QANeMAq45Ka7e8d+UOgAhaELCU5XspcK/NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnItNOMI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380C60A2607
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D380C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnItNOMI
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14470729eso2836325e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794471679; cv=none;
        d=google.com; s=arc-20260327;
        b=WQv34I2cV5YDl53bQaIBCkVyyG8iLDCd4q6PbVefjkjygjA02PVLd6z5ZfATTyXXOC
         I11MaNEABksU3kbxjXdNwm3LF0YKIZi1s010O+lXE9Suu6BkUErcNyW3UzDkdVh0MvSM
         hkgAmJACihhtT2ehdQ9gNdb+rG+BDGTEzaD8Iwzxj6z1kIytSpS/peABwpqyRcOLjtmK
         xavdJVa/NitNmXgmqeRpbklhmHj0CJCO8SNSukGJBpQThtF81SIX6k9PIXkgjr1jKRXV
         YaCC9lMrJkhUdNqFDPxvohh2DpN8qcbTYzq+PFzVPYQlOyOo4APyN61Yd5/Kc3kjoN3H
         SmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
        fh=JCwzJ7VUbnjmBYUsifAvFHaH5xNS/qyOZyT3rO2NSD0=;
        b=Hd3f8l3vpKyImYP7cisDgGAF3M+FyrRogMydd2UoSq188USCPXd+nSYVDkDz93qIn9
         D6/O/WGMMn7uAN3Zr65dJzg7wcbDTPtQJc9x/knYJS7vCAPFG2I3pmF20Hdm6DUlB3bk
         5uRMCUaSNY9abbN3NToMrQ3gBT4WiRbgqGo60xWXpknLDDeBaRAzxDoaStWDGRe0sOFV
         /dkXQ42K6O8Sff1l/NhLIeWTGn5HeIJ+lZimyjPTU+6uw1wrRZourZhh7TO9v8XXpwLV
         Mrv9kgmBQiTHWV8mU3OEsaQ1zLaPdIY9XT4NWpx6LCudiREc8WJDPaPhs6XcJViaO1eB
         DLeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471679; x=1795076479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
        b=TnItNOMICxsAi60hilZ58GoxH4iWeX1qTos6GZpm4UbZyQko8vEoCKUqEVAD8uTePW
         +DNzjRWU9M9l/picJ2QUc/lloAWhbWqIYPhym5Hoyy53SHY8U/QejvgvRrZvJUYCx5u2
         faoiJERjh8xXELJw+tUccsZJ8eG3C7CzjcD0NcRYJsTmnyZLh07SxtkFK5V5CrWt4mFn
         bxIIj6261VXjcYjDykiPkIsIwV/GsRGuKQ0QjtjHQHtuqRMPJjVVo21miw/0FKmXRPZH
         lV5ItoOMavDY54hwmrsCszPynSiqdA28NIS6VIq4Xr9aC3C/oRjOdQKWhUdZI+0a9IM8
         5yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471679; x=1795076479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLmf+VwwIVZyRMRY3t5XyJMTsjjFkvnESjr9VVfHyWE=;
        b=POB6axwv64sMPIdFSrJR7J2/1ngPMec7xK74+fphsZLUowoo70EdratbhcZRhKpuPv
         9VyKI45/1Y7Ou01mB9ugBflaZANAGYiBqTUEyvCjOsBOut/FuWi4Reg3TcKNrTLGbm5s
         SXVSnG4etJAMffe1O1CxWaVT5Kg8mpJ2tJ+GCL6VifUqo8vank9EevXPJMZyKNwjOigI
         SE+jkmVEClv67esh5OteYCfGQKeyWTIVp/mKyY+zz8OxVYgqMK3Aepr9lRDx5jiO8Lmg
         KwSskJfe9f9UqtvS4+Yc6x7/LNwhbMC4pvbZ77SnVijVicG1xBmbMB5qkxkNewXmDXFY
         Xa5A==
X-Gm-Message-State: APuU4Z9m1WYgtMZ5DQCwUejw8LxfOYf3WwxjrzWTPtRQ3jV7YnhBLbdS
	CTUqQMxDUmWUSL/RQrbp7UcFEKz/TG/tVq9lfTIBgKxoVdqXxZ5RbXe1f/u+80tIywOVGSqW4jt
	JzsbvF41L4RzUmzIjJE672dfWspG5y2Y=
X-Gm-Gg: AYBFou0mwBQMfzzq/xLwFjnAlxgiaq83ErBP524Wanlfejtrz8AXA8HNUH/bjZRxlHd
	g0R+vLiVzCeuunBq1Twla6NBZK7w+fYt5f1cnxFNwLDLjkg5pHHIHrmsgjni+3M0H+XY0NgI1VJ
	e/Megy4TbGSyz2fs6ba/GkeTjnFrLSwGU9oxUSw4k/4LrcIAZRC4K0hpvJPcRKSwG2R0upVu1UK
	W9Lz1IQrKvrLC61krEJ7aEZ5lIZsKyIIt8ieFto2ch4FneMgG8woIbPkYnusqAy4WRgQBbqPZyb
	YhcGEpif11kLBVeE3zoUOW29AnT9julFyMFDDKsgWdMvNkW4lJzpg++SdkbAjaGrnuTYRr1/eqV
	ESIfYznJWz4+hD5PKHf5S9+qlmdxTKilOqqUv7GY3
X-Received: by 2002:a05:6512:b14:b0:5c1:57ca:cf70 with SMTP id
 2adb3069b0e04-5c15d54550bmr1547851e87.4.1794471678774; Thu, 12 Nov 2026
 00:21:18 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030013135.158157-1-dc_redstone@outlook.com> <20261030013135.158157-7-dc_redstone@outlook.com>
In-Reply-To: <20261030013135.158157-7-dc_redstone@outlook.com>
From: Stone Red <redstone.dcity@gmail.com>
Date: Thu, 12 Nov 2026 16:21:06 +0800
X-Gm-Features: AclHuK-cdF5oOUlIDnhrvyKamG8d-Gg2BFIhhq-XgEnlCunW0Y4quLSUyzDkQSk
Message-ID: <CALkEBszG9OeUPEFcL9U7G6ahMBnrbkPxHFiRKNA5x20_t8C06A@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
To: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	ShiTou Hong <dc_redstone@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't seen any updates on this series for a while.
Could you confirm if it's acceptable, or if there is anything else
blocking the merge?

Link: https://lore.kernel.org/all/20261030013135.158157-1-dc_redstone@outlo=
ok.com

ShiTou Hong <redstone.dcity@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=94 09:32=E5=86=99=E9=81=93=EF=BC=9A
>
> There are 2 LEDs controlled by PM8150b on sm8250-hdk
> which are not added in the dts file.
> The LED1 is for heartbeat indicator,
> the LED2 is for wifi activity.
>
> Enable the LED controller of PM8150b,
> add the LED nodes with proper triggers into it.
>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index f25447f1d..58b58fca4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/usb/pd.h>
> +#include <dt-bindings/leds/common.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -618,6 +619,24 @@ &pcie2_phy {
>         status =3D "okay";
>  };
>
> +&pm8150b_lpg {
> +       status =3D "okay";
> +
> +       led@1 {
> +               reg =3D <1>;
> +               function =3D LED_FUNCTION_HEARTBEAT;
> +               color =3D <LED_COLOR_ID_GREEN>;
> +               linux,default-trigger =3D "heartbeat";
> +       };
> +
> +       led@2 {
> +               reg =3D <2>;
> +               function =3D LED_FUNCTION_WLAN;
> +               color =3D <LED_COLOR_ID_RED>;
> +               linux,default-trigger =3D "phy0tx";
> +       };
> +};
> +
>  &pm8150b_typec {
>         status =3D "okay";
>
> --
> 2.47.3
>
