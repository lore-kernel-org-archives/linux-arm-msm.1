Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646CB3A4505
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351082; cv=none; b=XlwJ4vzYU2GiZqw20hS/LDiRLXPPNpLAMBQBm6LYFIroDlT8a54vxB/W8H2MnqlAMB4MBge92wzy4cDK5V0ia/d/5KEOnZ0HPbdE508IpCkpX9aa5URqp641kIVZv53X8d5PBqT+MLFLLQoPGMVE+qV8mEjJezbPYmBXUtsoFkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351082; c=relaxed/simple;
	bh=6C2v/w9tNkKa/m89Cb4ma5dRceieAgGMZNWRe2Aazx0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVsofIM7Dh2LKvILj1fYZkGZ847j2jgx300wzv3gr1EPd/VPtfxin5N/ISrmM78PYBclS89xiBpkXB/Q3sIdCso5bkEAjqzJf6uVJ1Q/vZMJI661Wnoz5VKPxBiNGklFwi2e4/8SqSj584Ze6xLrynN52BFT5W7TObzcbjzrncE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAQii+y0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAQii+y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4DC1F000E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786351081;
	bh=x3lCSlMb3A2BMJf9y7N3DQXr9DovXyPF5YcxwWs0FlY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kAQii+y0j9K5Uq00BPYaD3iefNqweUZIkIynSVDjzUF87xpL1KWNGV7eChJUg4aS4
	 qLGyswG47krcTW+oPswRq+12Y+Z/4zfHXSQBuRH/+wKQqGC9y/ZL/Ec7CF1UhJn2Iu
	 SZVWSZyTBpqpv8loyi9WYmoJruGtHXK+xlC0xR/i5PBFLh94dpOo0T1Y+wo8oMN2b8
	 1JMaghWziDcxdgICFewHuJP50eKXso/uMiBBB2xTSybu9Yo6MrAbVKVDyDzCtKuKMz
	 5oUGpaW9M+EMU7VoOrPUlvqRQlV26LHWXgSP0ly1C3+tfIELPiV/z8lhWyO/C+wx7v
	 vA1NYk+6+aWnA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1476369e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8bgUlXC6aLQCgO+0ZEQ5u9Y/3CDRAX02FiD6BxOL1nV2vGPHOyINxa/aKIWdpukD1K7s+2ZVBQAKLrJnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq95hhlONdJSIAS2qk5m0NB1l+QlCcv6MeOhX5mYuhvoi5CQ8u
	hA2wJfy4TUm+DrDBvOfApTjpdytL2oLzd2xeirGUZ1vJmsTNaAkwX4309BTsm4otGCtcoVr0JzG
	AesRc5uWybiSbKRYudMksP4HQIan0kK/77qmn9Ye/Kw==
X-Received: by 2002:a05:6512:1556:b0:5b2:a1fe:5e86 with SMTP id
 2adb3069b0e04-5b2f4b803eemr3882764e87.1.1786351079781; Mon, 10 Aug 2026
 01:37:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 03:37:58 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 03:37:58 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <anIGRcBuIKiil36J@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
 <20260731-qcom-scm-code-shrink-v2-3-4ba76096915f@oss.qualcomm.com> <anIGRcBuIKiil36J@baldur>
Date: Mon, 10 Aug 2026 03:37:58 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfZkmqt6w9LFca0OpyK87-oZJA8V24JiUJHSuWnrNx4kg@mail.gmail.com>
X-Gm-Features: AUfX_mwGn5AHeI6h1LvuaxA8lqUbXvZTq2Xro_utHTyp2P2gxU5KS5TAQ9xWBk8
Message-ID: <CAMRc=MfZkmqt6w9LFca0OpyK87-oZJA8V24JiUJHSuWnrNx4kg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 17:35:53 +0200, Bjorn Andersson <andersson@kernel.org> said:
> On Fri, Jul 31, 2026 at 10:00:36AM +0200, Bartosz Golaszewski wrote:
>> Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
>> construction and automatically calls qcom_scm_clk_disable() at scope exit
>> *if* the enable succeeded.
>>
>> This allows us to convert all call sites to using
>> CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
>> pattern and to remove the associated goto labels.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
>>  1 file changed, 34 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 10c79d2e59a14af0532c515d332f65bdfea05621..bb213f64703a7adb9ce413ec00524a7d0a1d3856 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
>>  	clk_disable_unprepare(__scm->bus_clk);
>>  }
>>
>> +DEFINE_CLASS(qcom_scm_clk, int, if (!_T) qcom_scm_clk_disable(),
>> +	     qcom_scm_clk_enable(), void)
>> +
>>  static int qcom_scm_bw_enable(void)
>>  {
>>  	int ret = 0;
>> @@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
>>  	};
>>  	struct qcom_scm_res res;
>>
>> -	ret = qcom_scm_clk_enable();
>> -	if (ret)
>> -		return ret;
>> +	CLASS(qcom_scm_clk, clk)();
>
> No matter how many times I read this line, it doesn't tell me "clocks
> will be enabled from here to the end of the scope".
>

Would CLASS(qcom_scm_scoped_clk, clk)(); work for you? Or maybe
CLASS(qcom_scm_clk_guard, clk_guard)()?

Bart
