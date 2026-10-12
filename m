Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD04E0B82
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 19:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791835165; cv=none; b=WCVZAjvYO9HO+DhSDwzI8gc7LUDrVEo23Py16OPuuLNJHcgK5usbQJGYe7Vuk0LRzVTopYPORIYqQGCLX/+8q9JPOBdR6PFC/ByQ8xQcRLyeWNdsCcrROmJ05vJTNlgmKjVlaV5eDQszs1dcqeiqpJzEaQGUK6dlFcwGhcqTcaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791835165; c=relaxed/simple;
	bh=cpWrm/qLrfCaxwKAvrTPQuxxJuyVWyZ8+EWRPwtSxTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRs9ICYCJZAq4lMsemDkzkj9MDZqA/K6ZS1HcusL9jTW+xoYO13lLNLLDRKS05GXPJqtyPpfCZ4QXmLKGyvVx5GUtyH5PUsbnVAHW7yPABC1gOqZFkluiLdbMebqSfbSYJbWDj84eljrbhG6LLog3d7E/iOI50a9H4F1zJvNedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RTSYGB/8; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RTSYGB/8"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5350cc60b51so31784321cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791835163; x=1792439963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu1RymioQvrQ4tyrLotMGHTUWkYq/MH4DS7yYk9IT7Y=;
        b=RTSYGB/8BMxgnq5xiH/1ZiufGRQSctbV3HCWADHFC3Lyxd0jG50BIBoByX5Hi4l70i
         iRcSixC0bw1MhxXW5EVIiTsSBvLIOKMj2IzXO8oTNTFtdjQP0KRIe/q5P8e63zk5o2yf
         3Sy/ksrFpebNDnwpRPdvwq56keIYVzJqRtlhSw7oku7VG6eGhrj4vVlD9D2ctc0SfduI
         dsCZe6o6zs+S3v4OP3yeo80AkSAD2z5p6NtFFA/cXhDNU7y6491xCyA7EtJTm1sYbvFS
         3Bo7mQ1EtskvS/oGvtLrp061x/NoS9Uecjep07mZ9/AHp+Z+Qf/mxieTdST2RzANOB0w
         bPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791835163; x=1792439963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu1RymioQvrQ4tyrLotMGHTUWkYq/MH4DS7yYk9IT7Y=;
        b=VLLW10oRPHQa1sV3kFT8Xaodp60NahO2H0IQS/6Jx9cP/beR0SPkOCaupCpOzOltFH
         NwVk+5XsAYlNC4eI+NWB+MZWGVX1Rs2wlhf+JH06QbWdkRsHIxwUt35vC0IcOlfqwXPQ
         EhTsjAnPZhQ6/vfGPui3i33lK2CmiyYiC7ruKwYSGKVAN09ZCALUJ7cijbsF4754GR1X
         /k0OIApg9U12BPWq/LF6QDqCKko0st5NnwdnlapZaXaatnUxnZ/EaeLI9qS1kJiY3Hym
         lYoHcX/2hLGyzDwZwsouVXJwOLasvMm+kC+ibZQE3guvG+b0qUDjA4Vp+ylUZ7H/0yQy
         9LHA==
X-Forwarded-Encrypted: i=1; AKwUvBxJGEFULt9YjdY2G75PipZsb9BKaXSMi5B6xqRAlzhnlN3TbYoc7PdyGUGM1V5D43ynXTTpgrfFl3zxCO6M@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3vVIZDCUFPpY/ZUyUs6AjWEVqPmtND+KJZThY6QKuUuw/IgWn
	ueDbn7LPP+LsaDsuDzfQc/27Wvys4Filf08VbvEO/GjRX8eHo82qv7S/j5sbWMoutNs=
X-Gm-Gg: AYBFou2teYolqYifHLEEm7cBlAw0NtkhE6qMCbPeDjBlqVi7bLsfI8N/q2DuCB/KDBL
	BVH1B1jRXwnAf2zIizEIzByJz3DjTXewT2uJHPAoFLbpd9uOLOTfoxRMEoSHF3sKePUSMT6tNP2
	klbhL1FeKsY1SQdJ7dLrvnD+ZH3pcjtmark8lRki2wL9PVV893F9R12pj9L+Ryz2a2NYEfjvwiR
	ZOI45GQ5TwUSESm6E7SyTMYJsPNk6M2NDhDTL5vl7nbC9NSu58HjFjbdMFtHTfc0Jtolx6cKNTX
	2rdNpzGMR6BYlXjnBBRbFSyiooYnKHkN9G2YrRGlR1zqObxqr6aNCnOUvC1CAybhWxEwqIs7w7F
	LbmnGeM8nDXEO/ij5PkddpZ3qfttcvjESqEbEmYQ3VgxV7BWS4CmfKQ/zImKoCE+CCmNKMvHRv4
	ksb9t87s6DfYy9l7QLW6kAThE6kCDi/F7VfnwhIDT3U8HkPmLClf0BPhgB5Qfd8z9HLjHsvNI=
X-Received: by 2002:a05:622a:181a:b0:534:3634:6959 with SMTP id d75a77b69052e-535e88321cemr14254081cf.8.1791835162762;
        Mon, 12 Oct 2026 12:59:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a186sm87032691cf.20.2026.10.12.12.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 12:59:22 -0700 (PDT)
Message-ID: <dd01d09f-15a8-49c3-a505-6afa0e7c516e@riscstar.com>
Date: Mon, 12 Oct 2026 14:59:20 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: introduce TC9564 clock support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012152408.3729237-1-elder@riscstar.com>
 <179183220207.266355.4262660703229090399.b4-review@b4>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <179183220207.266355.4262660703229090399.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 2:10 PM, Jerome Brunet wrote:
>> This series adds support for the clock controller present within
>> the Toshiba TC9564 SoC.
>>
>> This SoC attaches to a host system via PCIe.  It includes a PCIe
>> switch with three downstream ports.  To one of these ports an
>> embedded PCIe endpoint is attached, and it implements two PCI
>> functions.  BAR 4 for both PCI functions provides access to the
>> registers that enable or disable a set of clocks.
>>
>> Both TC9564 PCI functions can provide PCI endpoint buses via
>> devicetree.  Each PCI endpoint bus provides access to one of the
>> function's BARs.  Subordinate devices (like the clock controller)
>> can then be defined as nodes accessible on the endpoint bus.
>>
>> Only one of the two PCI functions is permitted to define the clock
>> device node.
>>
>> 					-Alex
>>
>> NOTE:
>>      This series is built upon linux-next, with this patch applied:
>>        https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/
> 
> next AND a patch on top ?? you are not making this easy and this is mostly
> to accommodate the DT change that could have been sent separately.

Yes.  I considered dropping the DT change for this reason, but
on v2 I didn't say I would do this, and thought it would be best
to not change this.

Here I'll be clear:  I will send v4, and in v4, I will *not*
include the DTS file patch at the end.
> Basing on linux-next means there are other deps and you just did not explain.
> This makes it very difficult for me to apply your series if I wanted to.

OK.

> Next time around, please send a series on the clk list with only the 2 first
> change. That way we do not have to cherry pick, we can use your cover letter
> for the merge commit, which makes it easier to provide an immutable branch
> to another subsystem, if need be.

I understand.  Thanks for your feedback.

					-Alex

> *Clearly* list you dependencies if any. Please consider using b4 to list
> the pre-requisite.
> 
> Thanks
> 

