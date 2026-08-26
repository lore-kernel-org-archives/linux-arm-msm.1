Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880B3E44E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745013; cv=none; b=YKqEqoiX00LBnP90g34WsMwGftaqlGpqd6CerFA07bHdTQn/cSUqKtuUKrFAsXHtV/i78Haufz57DA8Iinp0t6AjZ+WarKFi6QhhDnDoWwfUwyWYRLSsydCHEdwB6VAOR0rXq+ipwYGd9yHI3HlwUD7vM2LkyoephW1BXoq7P6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745013; c=relaxed/simple;
	bh=1SGAfTx2TZ3eEKp4FT7JZSyMYgsNtOPbZIThZf3hzh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+EfjGUHBZr2fonRREeaL1eMgAZ81Zw3TaoHPCTFrGTAEzRKFc9RgYOEyFS+0NGXYJPZSbuF7lVQ9YyJMZCqb87f0jRvbTNu6ehyGK6+mrrWK0PxkhlyS5Du1o2t/Wp8VpXjXsd6yi/Y86mvrxO7tPq2Vp5ojRyHcW6wSNQiOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxmWNd5y; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxmWNd5y"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b014810feeso68230e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787745010; x=1788349810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2J2vNsAHfYFKY8ev6oKKs8nVBoFlnbLHTjH6FSW37A=;
        b=JxmWNd5yCwrqNKo+psRACPAJHjYYdTVg+5U1a/8zu/a9S0VbSncwrfd1B7r7a8+Bxk
         423pPAbDs82XnYkQCGpHMb4j6RStANO0LoIARYwjL/YxWXFlNeL/yAG1EEG5rPVwIGTh
         ocUEIzsQHIXoEce1T7DwHfY6a00XY0SQYL0IeT+oDb7H6hU69gL+E0RFJV2IKmD+rGW2
         7acp34cZjUtdLLhOBSNmZSA5u0w9jyB9j4KSKINSFnlj2oO9CIRwh7O/JpBhl+YRKt7f
         mnzYoDL8o6CT0wh1uzxVqHUG6GctEn9qmtLvldyALAU+DzNIya5TsFaBMVdFIAa2+8ia
         enGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745010; x=1788349810;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2J2vNsAHfYFKY8ev6oKKs8nVBoFlnbLHTjH6FSW37A=;
        b=IxS0dTuTOTZke7arqGXBRaK+PHHav4qubBrcHBe7gsEv8w35ZhIm8avlitXXF1q24F
         8/nWeLyfHjAmBJbcYUfEIoEDzgfZmISNomf8JonwTbCX18H/+6fxUmDM0DnlTEW1Aynk
         TFFMl/7NJJV95TclC4LSYgR+J+58FwRWIZCSnaE9WnJkO6wi2ux+CsRIgiSPYL+b6CxH
         jwZGF2d26ya8dDDwaxSSVCVmU/86FwJ0Co9nRXsotUWL0p28dsZ5qoDZCWXCemWIRTt6
         SZF/bkyiEetjlf653FQrdbiOZrZ7NwpJFUUHvEIczH1LtyBHML+m8Jh14MJPVr+1I/9u
         RPjA==
X-Forwarded-Encrypted: i=1; AHgh+RrHQljipSyToR5laNcgsjEBxnA2uW6t/iB1UKAPNFFfD5k2zqnEMvvkZxdYtoZYpefA42gs2xWY1CIQfaon@vger.kernel.org
X-Gm-Message-State: AFuF++lWGR0VpcwtzdHm+OFYSAbZXZn8R4Rmg76C3rzgybDwc02UpToB
	MF1jiy+gB5j78FEuf/3aNNxWOcMcqQi91TnBT6ixncULoq+uZ/gYDksU8xyMtlXXUjk=
X-Gm-Gg: AR+sD12gld/E6dn/nVwzh/VJ5iynwyaGgh9pgFgOb+epRj7bDIEmNGG13L3leZ0GIcq
	x2Vq1klIzXVBi9YOzXX/BKpejwkRC2JtBRHKbPEpp7RmoDIpA9vkMdHw4BX/+FT/F1ke7Wy5jYN
	/aOb+32q61DbpQ8mEoUa1tsOwjumvQ+94zQHI/1SNQN5gOm9GqZOzoSsnsH2/YPAvUfsYaXgFE/
	f3X4ZXk/T9z4FwhWYfhKLAPBCSG7FvfKY/60UGW+zVVBWOh8+H4+0xBzGr4hDYAPeDksTgw/yb3
	6Ms/ipYRhyIOkXuiFm/qnVmBGuIBpdwRy2V4IEMWG1uu6jbZ7Y250g0Y6ZcLlFUqAgLgPqt5YgR
	rornKzPiHD98Eq3FbGVGLOqUgnK6V6PFQzefNlnl+ar1vz34saEQgyPf+9PTCyEsIeI1qk59rqx
	Wb97BD4hAx5e55UaGPODjcoZN8j6ld0bihLabELIuK8IN8h0/EFqPoN1Kj0veZEH8ONqO7tBiSN
	nFDP61r+i199+gMWUJ49RB5AD4YGxEq7LW3IM3D6g==
X-Received: by 2002:a05:6512:1151:b0:5b2:fb6c:718a with SMTP id 2adb3069b0e04-5b4a8fb4c99mr878955e87.0.1787745010085;
        Wed, 26 Aug 2026 04:50:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a415454csm538766e87.2.2026.08.26.04.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:50:09 -0700 (PDT)
Message-ID: <5c5a5617-1a74-435c-bff8-8813e4acc5b7@linaro.org>
Date: Wed, 26 Aug 2026 14:50:03 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
 <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 14:31, Abel Vesa wrote:
> On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
>> A clock controller driver is expected to be embedded into runtime
>> PM framework iff there are specified power domains to supply the clock
>> controller. If there is no power domain, then it's a noop to add
>> the driver into the runtime PM framework, and if there is a power domain,
>> the dependency can be considered using this fact rather than relying on
>> a probably stale data from a particular clock controller device driver.
>>
> 
> I don't think this is right.
> 

Please elaborate what is wrong in the statement above.

> In an ideal world, maybe all controllers would work with runtime PM
> enabled just because they have a PD attached. But we are far from that
> world for now.
> 
> My approach right now is to go one by one for each clock controller and
> make sure we don't break anything when we enable runtime PM.
> 
> Once scenario I just hit recently was CXPC not happening when you attach
> PD to GCC.
> 
> So I'd vote against this. But it is up for maintainers.

I find all the reasoning above to be unrelated to the proposed changes,
it would be appreciated to get a comment about the changes.

Thank you for review!

-- 
Best wishes,
Vladimir
