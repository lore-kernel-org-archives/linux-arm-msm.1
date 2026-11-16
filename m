Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819648;
	b=ZEaw2sBecGAnMhmqtZMtyeSMh/BXwgxpytLzR260j+/bAGFiedcyRit1C8eW6ncJVI6s
	 xqeuFRiT5DqZDdGFVWRXYLKHBycUmPAgrIJ3/XkNpU5cWobSpQH8BI2uRQ75Co4Mm3pFj
	 TTt/13KzQyjCj/HOa+YF8J0TuZNQcZRyhYK8Td1tzbJpKQXTLif1zlyLCrmJaGmjtIFhO
	 iUkR2IE8miAT7QMLhYVaSwfvjdblOxijOXqDoEMUHxp201S8pPJ+YTIu4VEMiReYPYvzX
	 vU+N8+Djgm+zdXyRDw5p5ib2oCvT1HQVvoiLsPEYhlMyDVs3X89BA2xrzYTAYwye5QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819648;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
	b=f8W50DVT/Hee5SDT3rh862xU9okItaMRGaKjTBkWhHG2PKI43c8ILiasJ5p+zVfyID/2
	 JBRz9TxnLeKwVsLa7+GanuD97lq6w4BhoCwOGtzXfwXtITXQQoeS6nEI16g5Gkv4SYHyX
	 reu2nQtnx8ZFSmZePKrwNSORrw7Lo7EUa4+hnhuaPiBudo6ewSNUN5vfyFbovHFzmaIB+
	 0bX8CJUoymQ5YlvT4E/IPgjaU8N/x2amQVbSizdkY4Pt+dGmOU3UXC8FQCR7q0S9XKusd
	 a7FTGGTelzOENkezjf3a/TXmFmSSClhTPba++55oodoESJoqyZGj2qnd7W8UrddriHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIPZSJew;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XrXXwcYR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF47606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF47606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIPZSJew;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XrXXwcYR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794819647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
	b=SIPZSJewbuR3msibV5KWq9pH8y07qQTWZ0/ZG23C25J/DKQ29eTe1M/CyXvmSJBeE6HmR4
	sUIkql9qjjUBu4tI0St1Va+R6W75P2gM8hEckyhnBUb2FMlNwZfGaXrdizw7DyV+dzmNda
	IFdkXDRIVsgTeKPTYcNhDp9lt6rIjfE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-vVdONPKIMRmkDIY7gfiOdg-1; Mon, 16 Nov 2026 04:00:45 -0500
X-MC-Unique: vVdONPKIMRmkDIY7gfiOdg-1
X-Mimecast-MFC-AGG-ID: vVdONPKIMRmkDIY7gfiOdg_1794819644
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b56a350f2aso3707890a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 01:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794819644; x=1795424444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
        b=XrXXwcYRWiKArWCNCwX1GiKcvxXibPtrB7wPYiiQT3Mmn+Di6DD/+YfhcsJH6Gy7LM
         7dMwJK1ZVQR3OOidpofo2b0FeEmWjNvMOoN0DG+HD4GnEjPP2KH9LvXddlIK5ie1ErYZ
         E9C8vVPXNdnEnvo1zCyv0IYNxJt1M7pytuw3icoaeVAuqd6i7FHqW7sFyWGcMYrjtoan
         vufkZqzW44sY0wQwysjM/qHRlZi6IeLO0wAQ8JkvFmiAP3U3befFmCUv+lypxE7EFxEN
         SZviZmeIUqJ/Q8Gk2xAPnfMvRKDBrpfTs8scsLYwZFOIWI9z+uKw9V//deB0ylVvpWBS
         sosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819644; x=1795424444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
        b=kkDCRxROygD4xeMoLc71MZ5Ij0phUyyq0u7LzxHOuRXaljFNvmftOB/vVxLDv93BAY
         bwjfRF2XQwlowhwpdQgrBqIYPVM3jhPDRCJE39NzT6LHjYFtGSQYMe/ohGSZmu9xm4ti
         1Vv6Nn2omhxcF9l1jiXXBmrKm/mxhZMycVDkRYEuhXLuinrHUhGPqBLFtWF/ib4ufqeW
         D4OKpdTDG/CtGv9vUY4YjvOEYr9yuUYnPzALZMMBSdzgpB7rkmC9yezP/nNSFG8ObQNR
         1IvsQIk/kdk7B9Bqclnc/a4Kw1MB4A5b7oxFnwPI3KYtsjWK5M7Yemoxht2JpVqZtnqK
         0tKg==
X-Forwarded-Encrypted: i=1; AL+hErHdfSI2IDvWZcaO/DrgXHOOU43yNfcDVLAjSPKeuKZIz/xOkrakgff0GpQJ3v1mmqEWXAUeOA/WA6RfAnyg@vger.kernel.org
X-Gm-Message-State: APuU4Z9wTDCubP/1/zneet4qCaXY2YxljImI69kdw/ZBKr98zPpK8Kra
	4gKGokqo96jS5hT+Kj/QG4MpGpffWAQQY725NT0e9CM8uzElB4wgNDiqVwuST81F4jZZ29wccLX
	H7+xbVIfmjpgiJQUciTIi78shbGEQFWvI7odivD4LVSJyT85D1xpKL4tv4eQR1RQph0c=
X-Gm-Gg: AYBFou0hW2au/x1BaYASC3yI6ixCpMjYtu1+9eYyDe1MQIrvIr9PLq8qhErcwnlwzTK
	iWRQEGHA6u6sRTOzKHIZ0Twn9F+aylT8uDhYG0AElVnbusHIpt1E+DwwXxAPFdKdcBlqW51cKBa
	oqorFGDdYn+84HYpVdey+DTXwPpogZEluozm3Oi8TPuZZ7mZ2G3eeZCsJXoLxuoMtAHs8vFujVo
	ej09S1xv40RTX54dSSlxVp8WfFF8E6fV34NkR7tbFn/YqdG4YQmgB+uGAzUcjPl7b6NfWu7dOFB
	KL/cGv0iEW4Gi8HC8f8CTY5j/sLbSkTyeLWA8L5T+U9mX50haVZhFlRqISD/McItMTiK4hkaKZi
	MYa1IVqPLexC+JzWEJ5fFWPYOQ3P+OmbnaP0O+/sVShssLQENSnw2g1ccCxftJoZc5KAxINqBX6
	iS3j2tyKCIS1UFGknbSXP3iXnE3EYRHB4Ud9CHzudLboFa
X-Received: by 2002:a05:6402:11cd:b0:6b6:fa19:41c1 with SMTP id 4fb4d7f45d1cf-6b7c09580e6mr6633110a12.8.1794819644311;
        Mon, 16 Nov 2026 01:00:44 -0800 (PST)
X-Received: by 2002:a05:6402:11cd:b0:6b6:fa19:41c1 with SMTP id 4fb4d7f45d1cf-6b7c09580e6mr6633087a12.8.1794819643759;
        Mon, 16 Nov 2026 01:00:43 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c262338csm4287688a12.33.2026.11.16.01.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:00:39 -0800 (PST)
Message-ID: <4418e4b8-0f86-477d-b9ab-7fe84ceba52e@redhat.com>
Date: Mon, 16 Nov 2026 10:00:37 +0100
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
Subject: Re: [PATCH net v6 0/3] net: wwan: qcom_bam_dmux: fix DMA channel and
 power-control lifetimes
To: Hongyan Xu <getshell@seu.edu.cn>, Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <179474327647.103840.9539614513141118915@seu.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179474327647.103840.9539614513141118915@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 12:47, Hongyan Xu wrote:
> The original report described a TX DMA channel use-after-free during
> runtime power transitions.  This revision splits the work as requested:
> the DMA provider now offers device_synchronize(), the client serializes
> power-control and DMA lifetimes, and removal stops the state publishers
> before tearing the interfaces down.
A few serious process issues here:

You must cc netdev for networking patches, otherwise patches will be lost.

Races in devices tear down do not qualify for stable according to Linus guidance.
They don't qualify even for 'net' material and should go via the 'net-next' tree.

Too much stuff at once: I have ~10 emails from you in 4 different threads landed in
in my inbox at the same moment: keep one or a most 2 threads in-flight at once.

Thanks,

Paolo

