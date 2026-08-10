Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9A3A4505
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351021; cv=none; b=UBWAhZ5Unqw0sIk+xKBQVuze+uenFvEfg4jz3tVe6nWU3GB7PA5RbT1mVxWfpNwd8yxGkZ/l/ztuLLWVMje9wuBClZgLcx9qEAh+vADjwtGkW15Xhg8C4JWwbwuC4GpSGz+RVysew55+j2y0KuqTD4HYMynG5e0Eej5sz3/7LmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351021; c=relaxed/simple;
	bh=QTlnUVbr081WX3YeG7lPl7wFfeuJcenGYORQYtLshAY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2dSTnVdDPL1ZqrYnbwUecphNeJzuKlMPOr9XFcXW11RP8cRGpIO/Fs7gABV+8zhN502QSkFC3efnVHAOerCmdDp8iyOxDanDBkzqg7PTHWiKnW+xqDSOhc+P50iGI5lrqNw9nRuzm29Ovgpc9dRFSm3PZXf2izs9b8e3WNAKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv54kX+8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv54kX+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621FE1F00A3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786351020;
	bh=QTlnUVbr081WX3YeG7lPl7wFfeuJcenGYORQYtLshAY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Zv54kX+8ua1IFNUsfkcuHOY7BUOWUSG1+HLAiuOEpkO7J7QMIV8/YFz8iCU473EaO
	 AyeEF9GR8+MUdUpICtV5rYVn7lyA1bW2oy+dCzqXMqiTxki6Uu7KeqCYCyxSaLvyhd
	 Wzl687GXFgB6x/YDJKspan/HaLwBymcwzf2U9hz/e4cyok13mKtYtEBj5Aii7PgdLN
	 0t1SlIAdidM7hRvxhtobVVoUA76AKbavE3K822XToadbvj0/JLw9OTgllYgDepK7JK
	 C8LaEcmrTnuaXB490TYpDKBwtM2xQ49IqijxiJ20rDSa1PUKFIH4OxGAdrAZg7Jet2
	 TKM2myF/od+Og==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so8468481fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZxADay7YOnRnzu/9ZH5o7E4xChdSFIO5wwXaT+cOhjiZ60n6NdnJNHmkmc0tr2LKeDsit9Tjce/gtd6N4@vger.kernel.org
X-Gm-Message-State: AOJu0YwXFZUkb1ATvpzmLCjj27+6HQWErm722Fa9MmQRMYJsfN8DXuWh
	g5Ili1QLRGDw41g1YZVCQAEnBBclS1jEjdlnsHEuO+PE1BoabXA6P0lPvsjaxcwDq5PZlfANvKD
	g6SFhnT8lPzfGf6ed2HpVIelhPdulJ8IOWs++KxRu1A==
X-Received: by 2002:a2e:a54d:0:b0:39b:1ee9:8c03 with SMTP id
 38308e7fff4ca-39fbb222fc9mr51256531fa.10.1786351019095; Mon, 10 Aug 2026
 01:36:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 04:36:57 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 04:36:57 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <anJn_Cf0mgVNstHj@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
 <20260731-qcom-scm-code-shrink-v2-2-4ba76096915f@oss.qualcomm.com> <anJn_Cf0mgVNstHj@baldur>
Date: Mon, 10 Aug 2026 04:36:57 -0400
X-Gmail-Original-Message-ID: <CAMRc=McQ69=zDfJ+NrOho9ksMsiBhsG6T8MB=Fs9UY0N613Kww@mail.gmail.com>
X-Gm-Features: AUfX_mzkGv0eWg5bW4DBFkdomkThTvmTVi8-eG0fXtNjdoryaI5SJX_9j_zNf84
Message-ID: <CAMRc=McQ69=zDfJ+NrOho9ksMsiBhsG6T8MB=Fs9UY0N613Kww@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Aug 2026 00:30:47 +0200, Bjorn Andersson <andersson@kernel.org> said:
> On Fri, Jul 31, 2026 at 10:00:35AM +0200, Bartosz Golaszewski wrote:
>> Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
>> whenever ownership is transferred) to replace open-coded
>> qcom_tzmem_free() calls and their associated goto labels.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> I tried to pick patch 1 and 2, but it doesn't compile. Please have a
> look.
>

Can you post the output? I rebased the series on top of current next and each
patch builds fine for me with arm64 defconfig.

Bart
