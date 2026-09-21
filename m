Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8944E041
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977517; cv=none; b=FhfeH4UkhCI3WcBOTm/89lVOh74wKbf6RB2ABt7cKQ2vFhSiFYABLhx3Z1m1Ihl4m6jbeEYdQrwhUPVTWbxfleHn3DKfzkwjommxzZC6ib5RePCtcKl+M7ILOEiO1o34FbvXV2a9ktJ2i9IdNkAJibpOPiVgzIJyvCeQiMbBrNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977517; c=relaxed/simple;
	bh=wNJEVjvDhDeyUZ+24cyJGPOxbwpnTdhWCGw7IrC0l/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nak1A8QRERgVwSFBUfWTexTyOMSJjg5BLY8VRLwIS16jpnva3mlZU8YWpEjgj0xzhuhc+XlxDl2la3cxwqHoC12/sr+J9r+jvLtXuielTIyVht+zBJACbwvnB34Q6bB3grLW6AjjE0NLtCkeQUshOIhAP88VnItplP6f43C+GrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U++02eu4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U++02eu4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48704fc0141so223057f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789977514; x=1790582314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4anFBGndO5Gr9SeLCAQmirqhf92DuQgimCIluGITj8=;
        b=U++02eu4UULYJI4nl9iNPvIoLsabBZJuY9vlx1wixjewvdo3QPGwBOWXCN3vzTvWiQ
         YoJhMD1xkTZ3WYDjOsBZe47xL7xOx2D+cihLLhEH//+zAJjka/0bfPox/mfZWz56lOfj
         NcdBOwP1qeatikTpcSvPqUtoPDEhol5JCfotla7lOd2R1WQ5T8/IMWlCrIpflYyDJ4lf
         2sebb7UG/3eyb/Pg6qxri1z3nzxqocY4k3DwcL6pm5JFZl81KtO2TxYHv8KV1UJDfBIv
         ZVpFZEe7HUgPMeoSNQVwTkTt0yCVuVgeML8orPNypMGeumuOWTozpblDVu3fDEBIPfWs
         pZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977514; x=1790582314;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4anFBGndO5Gr9SeLCAQmirqhf92DuQgimCIluGITj8=;
        b=CDisRVMXhdBg0pFI31PEK/HtH1Cd46JwgFzFYbstnJYkN1ki4gZy+JU6P8/BRXNpar
         L6tnetTdxo7+/Um/AcCk4d0jv9gKyHbhwxsyJVlDuDO40SJKcbGd+xkvCcKzzpyiKCNg
         ZHutrXRTxfVaJOs+oP0uBDyct/i8xQAavdtb1zTLfygA1Z1bEcdw3L7l2gXkroibczxu
         hhBky+f2Twae8sqk0SQpPAXvmuFM1xUXRbmnECNJXb+B9LhfphR/1PVN7JYOsJ1NtYw5
         cOUBURBdYlCMtYJlxR9srVXZUTNCoThNTH88WLBIP9IOi57GKyqH7gzRFSHIOYWAqq6B
         GX8g==
X-Forwarded-Encrypted: i=1; AKwUvBx5KoVDAHYR3mhY4egiS8dcSzMBj3ONFruELH35BOhCjE2Jdb3Q+9rphpsoeUCgM+XkABSsYCwriWtVh4Th@vger.kernel.org
X-Gm-Message-State: AFuF++mGImFj8JO0q6Uk4NjdO6QMr1ukUs/+QttC+oTeixFlxi/qqD37
	y+fCBav32r0vkoRTtpWMQzvtKlX5JaBm5P1G89B6KKIUPS0iI/AWfzCTa1rDisxUuSQ=
X-Gm-Gg: AYBFou2r2anidriX862y3wVhuyyO+w0G3xZ1p8cfX4e3zbBU8J2Gia2m7mm6kyRC8Lb
	mBp6J31JDCdp2qEGBlvW9cedFSbB7PKQna2SWLjSquLL5yFXnCmaR9LL1t+XBqrc4vn9/L64FEp
	Fntp1EbPHMLcswf3yplcFKdIyvUy/x8Dk6JWO2C7Ub6vGAh+G38Qrrl/YjJ9qxteEEEgo8AlRSs
	e+PiS03yOdHfEVGG6FbzZPsIqrMzRULL9e6cGPthySgd4J7LGOGJ9/BLXoWmCxjEjdve47WO/wb
	lShkqsyAyonY3Gx8JedT1LOEe3nkDdwf4WWB4FODf12w8qsIj0aYYOSHewHitH4X+Gyzbjzn8c2
	le4wXaA1VQQ2ZauyvctlqI/1oCP8VBC+mVIHnwyDKAoVNg2iqhYXsuNT1enVbFJpZ1tVKA+Y2FC
	A54tfGe9iSBcW8GtMOID47NJ4spAp9Cv/1Qbbls2tJIFIlyX0mhdWlWhDZ6JBL5Cb3BicKQssuO
	eM=
X-Received: by 2002:a5d:5c03:0:b0:487:1488:d200 with SMTP id ffacd0b85a97d-4871fa41688mr12776133f8f.3.1789977513799;
        Mon, 21 Sep 2026 00:58:33 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903::e14? ([2001:1a48:8:903::e14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724593f5asm20453529f8f.28.2026.09.21.00.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:58:33 -0700 (PDT)
Message-ID: <71362ec5-ba7f-411f-b2d8-6913a08be8af@suse.com>
Date: Mon, 21 Sep 2026 09:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>,
 Daniel J Blueman <daniel@quora.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909055846.16539-1-daniel@quora.org>
 <nhbc6epjziyb455l6z4xqunfb74bdboycuq52vt6nrr7fqjo3z@ruh4isxdkyom>
From: Vlastimil Babka <vbabka@suse.com>
Autocrypt: addr=vbabka@suse.com; keydata=
 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
 pYekxJujNeEDkUlky0Y=
In-Reply-To: <nhbc6epjziyb455l6z4xqunfb74bdboycuq52vt6nrr7fqjo3z@ruh4isxdkyom>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 19:05, Manivannan Sadhasivam wrote:
> + netdev
> 
> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>> Since the MHI HELLO exchange was relocated, it is sent only at device
>> registration. During a suspend-resume cycle, the firmware in WiFi
>> cards such as WCN7850 indefinitely waits for another HELLO,
>> triggering:
>> 
>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>> 
>> Fix this by triggering the handshake from resume_early in the MHI
>> transport.
>> 
>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>> suspend-resume cycles.
>> 
>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Since this patch fixes a regression in linux-next, it'd be good to get it merged
> asap.

Linus merged it directly for rc4 as 6a5719cc3ef2 ("net: qrtr: resend HELLO
on MHI resume")

> - Mani
> 

