Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774022;
	b=Xu5VMGnchqGrKeQwmMY4BejB4P38tus9gxLDFErRz9p1BQ4Cpb7qXRjvnx9tb1w6Gyta
	 q/48FpMFbgVgflusk6i6j2kPxu5LRqXb54lwwWZ1lSH4xgilUjFb8fFxqKMQdCiKc8qdx
	 eOCufgH/bFoH7NCilPvbjqOQsBzAa6Iu6qrZqSOxjZHgVHMXTgrupn1uXEMd+eKn14QxD
	 WZx+pEXp7c9iaMQ185xUyYugeeC3OYSroMNW9yP4jkQawi5udPcWZvrv9Fwjj1IBiWg6q
	 CpQdt/7xDUvL5jKe659dotHPJvJ+SG2DJ0RDu8Fnzv1oqqbPiN4QJzFnKJibn5VGYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O73XxAIF0LgsnwonyeWn4hJSY1YD1aIc/jM/RSa6a3A=;
	b=BVbSNf8y3Z+GXoQ1ujWiuyMW5vO6GwBJCCuX6sZkPiv7HZqad93m5x7IDTrMxU0MP490
	 MCAkyMSPCaeohz2ZpEX0p69FLBYnLduFZEuj1pGxGQnTX9TkJ5vcLQpA0QMXhdP/JG6cT
	 Wxv6+lTzWVhX15drLICiZbb46qn26PXSTcwk7bJcE0IDaQofp1pLolZPn3ThdxF58x+j4
	 LCDxwqTGOdVhGnvuRpwv+Z2SUYyRCXQ9hLIC3vmhs+owWugdOuBB2sIFCbH35xBGr6b0M
	 G8V7Sp6I0TphjD03Ecqz/dlijmGUmQkWgoWnz6/Mhi94tpedatsFuuDgASIJ0M1CDPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9MQL8kW;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEB606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9MQL8kW
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb628232d2so4367978a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774022; x=1796378822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O73XxAIF0LgsnwonyeWn4hJSY1YD1aIc/jM/RSa6a3A=;
        b=W9MQL8kWF12NP8Ld0CddhitaY7skX/cPI29eygyDp4q7kKffn8ENuaGDAEY7HZp+QZ
         W4FWujCgzWYGUl1e5wGZ2lE/nQQjPOgP9e3Qu0NzEo4YgpLst1IxW6yVk7/26zp23o9K
         SAnZRMuX5ORkHUk27aPyKiXmVy2hB7oO0KCChdLs4SBpsw+2l77rMjdP7a2gn+t4kptc
         j6BAHpWtqVRD9IVq6JzV6dkfjBh5ZmsNPALLwFtddqt91z9YcwN0DBUGgzd7QKf8XauL
         X70613+5WIFRTdunHWdD+0p8Nrasr8RBHiE/F+qDCh9KPAdznjV97PpV1IiMXcqu6nxw
         6HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774022; x=1796378822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O73XxAIF0LgsnwonyeWn4hJSY1YD1aIc/jM/RSa6a3A=;
        b=yb/oC8ZatM7Rtjj/NdbsG2FNUZBKDq2P2c9m3KAXXd0PphlSfgh3IcMb9nNdlm1gbc
         GtLW9YVcwF7y9NFTPERdyvl2BhqTd4W7Y346bemsNP54pnkTZ15NGBoyeTl9e7L16FW3
         KJfZzzgWrDKVs3pInrmxzpLAo41l9ZKbUlLZxsLmNNBsZVM3NjaIVNGjITrzNU6lUICE
         VmyKmUJpc0qud7AH8oky3c7AzLwJ5IyFEN29nt8m6+fECXA+U29xhmI9nCqVO+jwLLj+
         Dy7yGMWJno1qXoiZKRkveYq4hWqvTV978P4xZViYphseFlV6Y2Wqm8dalCoRbLOpR4bN
         EbtA==
X-Forwarded-Encrypted: i=1; AL+hErH9WRsoNsivVhKZWx8pqZwFIFyuQHfPuHIp0QFOOTMRGn2h1N6tXh0RA8OxbkNzHbs4WJXLFg15pr2DkODb@vger.kernel.org
X-Gm-Message-State: APuU4Z9gDVecx0V74cI17slF261EFjJYjDrpxnr3Kd2RcLnKATvuejgZ
	XvJTAlVIeWJ3DhKnd0vdjphP1ZEvVWIls5XsI0oIpCAtbVmRWlE+4PDS
X-Gm-Gg: AZFdTZeIWcAXrKDjcIETLVe3z+NXyl5av/p5K3Ep3o4rN4Qfb1+WXD5nuehMtRoxL/a
	9GyvnRqe2T7qi7H6VBujekuyeTs/5cW19mimlv2/lk/R/zwh/lkN3OqkVTOJQWsj0MESb+vdMd4
	gkOshMOd2MJR8Jf97QsfwAWOJoqHd1eJSQsAMookiWPDVQcdYJq+9/ot9CnqsWBeXabw+UjF46o
	7ThxFzWxv/RRumo18416hixS4D7DYcfgZezj5+2HUU+2qDsKEQXYONHOPyZUPlXHCyB5AgUm08k
	O/iqMObLjUFglPIDGp7jnVVc6Up59bnQbkdst1LEEfj0QBRIws95n+ATzXNX4sADsAAJki3irOU
	AZR1wTgPyai7+6cETe09TB7q9mxyY2cRWv4XrxTEouwFqTfw4/k7FStocXXnVrFrEQHHYPW/uLo
	Um5QSJx6VvN4GLKx281g6bh1XFqk7X620oeCmNglYewu565stoWYdD+dteGpM9zZFHA8UWhUPKn
	X6CgHMDMwUcBcmq56fS55mjDjYgl5NVNsV+gwVuRtwCB/iKsNwuUc3Y+Qbz7bhWi7HZrvPnTbAp
	fqUrNWlIR4evV3jTd/9VlJLd5iYZQOI/aSfG3pAjjUrFJvbn
X-Received: by 2002:a05:6a20:ef0b:b0:3e2:8c83:6824 with SMTP id adf61e73a8af0-4014a17a54emr20630236637.10.1795774021793;
        Fri, 27 Nov 2026 02:07:01 -0800 (PST)
Received: from [172.22.14.75] ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm12059639a12.21.2026.11.27.02.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:07:01 -0800 (PST)
Message-ID: <5934f495-45d1-4e78-80e7-e33f802bbddf@gmail.com>
Date: Fri, 27 Nov 2026 15:36:55 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: niklas.cassel@linaro.org, rohitkr@codeaurora.org,
 sibi.sankar@oss.qualcomm.com, robh@kernel.org, quic_srichara@quicinc.com,
 konradybcio@kernel.org, rajendra.nayak@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20261127092834.731-1-atul.akella@gmail.com>
 <8500763d-778a-4183-b8fe-2b16cfc67b46@oss.qualcomm.com>
Content-Language: en-US
From: Atul Akella <atul.akella@gmail.com>
In-Reply-To: <8500763d-778a-4183-b8fe-2b16cfc67b46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-11-2026 15:11, Gopikrishna Garmidi wrote:
> 
> 
> On 11/27/2026 2:58 PM, Atul Akella wrote:
>> On Fri, Nov 27, 2026 at 01:07:50AM -0800, Gopikrishna Garmidi wrote:
>>> The da_to_va() callbacks compute the offset into the carveout as an int
>>> from a u64 device address. An address such as mem_reloc + 0x100000010
>>> truncates to 0x10, passes the bounds check and gets mapped to the wrong
>>> place. The check "offset + len > mem_size" can also overflow.
>>>
>>> Use a u64 offset, reject addresses below the carveout base and compare
>>> without risking overflow. Apply the same change to the pas, adsp, wcss
>>> and wcnss drivers, which all share this pattern.
>>
>> Hi Gopikrishna,
>>
>> This overlaps with a series I sent on Nov 7 covering the same four
>> drivers and the same root cause (int offset truncating the u64
>> da base subtraction):
>>
>> https://lore.kernel.org/linux-remoteproc/20261106184312.100-1- 
>> atul.akella@gmail.com/
>>
>> Mine's still awaiting review, so happy to defer or let the maintainers
>> pick whichever they'd rather carry forward. Wanted to flag the overlap
>> before there's duplicate review effort on both sides.
>>
> 
> Hi Atul,
> 
> Thanks for pointing that out, I missed your series. Yours came first and
> covers the same four drivers with the same change, so please go ahead
> with it. I'm dropping this patch and will review yours instead.
> 
> Thanks,
> Gopikrishna

Hi Gopikrishna,

Appreciate you checking and deferring; Thanks for taking the time to 
review mine too.

Thanks,
Atul
