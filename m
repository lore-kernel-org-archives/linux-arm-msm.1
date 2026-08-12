Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE03E9C19
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523574; cv=none; b=t6aCP5+4ZHwPSCCqDzDZknucqY8hpmQhCAeDC8ZZME3qH/yvIah/x5btzMJRWem8sBSkiXQYdbg/oMZwLHugelxxM4Llo0ytMXbKOYw8H0cTVPXqAPDC9Wm3V2bnMFVa9kFJ25Zr0KWhYCMCwrTfo2X2NtWUiqbyw+qBGL7Vcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523574; c=relaxed/simple;
	bh=59NaB9DJpc9PT2zjlAZDUJ2PEpr3NRLYiZ77p37FDlc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0QA9wCKmt1B1n5L/iN7zbXREaYxadjL5eZ/OdtfpELYKsUuqpnn7SLvjIbsp9jNRqkf/nqMwXFFucfSgg7u8VshoG0icGJMBu85AlPD5VDpXmD9H3yd72Kx+LpEfiHvQvRiOerXiZEn7IC35Odpv9uJYKIX60q4AVhx20G+II8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA+SA56U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IA+SA56U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D861F00A3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786523573;
	bh=D4fYTkdonNFudLiCicR5+qg8B8A7g4fsWwyZCZbxLtU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IA+SA56UAQRUeIxPAjiA4nC3m3LlC0S2ppZ+6uYJq81tOBd7KXwqEbU/ifDuy9qnH
	 vn+kX5no7FwkGy5r8C2dFFD4AI6mV4HAhMlLsaPyzHdyYmkJYgtIbtR5dW+bv87xU+
	 0PzZi0bFZw0b+w4HgXIWo3RryLYkVTeLPd7VxQ7EFhOjz+cgXFeirQQOk5Z2RZ9k/K
	 pNJjDV3qTY2P5DccR/BeHjWL3xMhCvWOlLvZRK66THu4V4N0pj3bpCk3IUl5cTvtxd
	 YJ4xq3UuATzm16M/YmqNp0DujF+ASdUb/x134FCONaKjdmMQGvceODRIkzVP2A9T6T
	 ITC1r6gThJAfA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a3166398so878217e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqI2BDOtgBGxRFzNjvuvlQcR8OmxqQp90viYbMBs1CfFIt6VDfavWPYedAzOYgWLE45KepZQRB/+N374jzy@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFUqKvGYZf7or864SRJkUByVZAhPdvTT6pX147FAipBI4MKJu
	zGFRNpGFGFHXWTm3wtFenDXEFu2ENwNnGh/wx5fNCEnVhK/5+QT7Xa2iE8+epHF6IR/rIqTc8rq
	9VZTTJZhCLahzvqtTsG0cE9YXol5MZzyLBBsWTTjgMw==
X-Received: by 2002:a05:6512:605:20b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b44e315709mr317066e87.43.1786523571645; Wed, 12 Aug 2026
 01:32:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:32:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:32:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260812081856.GF1072730@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260812081856.GF1072730@google.com>
Date: Wed, 12 Aug 2026 01:32:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
X-Gm-Features: AUfX_myM-KKHFiWlmkYHiKUnznZQ5Xi8sRhpZ_nwB_pCgToX6LZLHX_mNL9495Y
Message-ID: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026 10:18:56 +0200, Lee Jones <lee@kernel.org> said:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---

...

>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>
> Okay Yoda, but why is this okay?
>

Hi Lee,

I'd like to call you out on this because making snarky comments on a non-native
English speaker's syntax is really not OK. Please don't do this. As a native
speaker you could have just proposed a better sounding version.

Thanks,
Bartosz
