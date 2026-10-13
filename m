Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD014B1285
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884730; cv=none; b=RYDr+T/CGEDusbyEHcHCR7dbm6toF2d7ogvmYg7jrvLxBdTvNVGCUPxZGfzYBQKAVYhyS+f+bfeulGKIttzEYbxpyu/R279SADa7oazkDJTqzPLbZ3hdOLHUjJkF9Uw1QwNZl+RQGORL/b4VSRm7upi5H/BjCXJJ48Dz27IDiWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884730; c=relaxed/simple;
	bh=jN51U1VoMPBxv5NImcV0DrxZSW0vwqbzSIuL5nPXgYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8tv/XQNGJwJubdOlDKl7Kyn7rqPAdQmlmhH2aYjlVJZOOpWpRrlq6UgHubVoY2jxig1oPpQOGhFO9/uF9APXnJD51BKE4Ix0lOVkq4Hy4aMoRsO36gDvxHpShnvvT49lhlbEvHrqybRFRrXo6/i6oG18wSWH8rQqY61T7YdEZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj/NltPG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj/NltPG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16c399641so27550685e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791884726; x=1792489526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8v0JkLJFzbjbUzSunhsNyUV3+4oWGxJqnDHXmr6loY=;
        b=Bj/NltPGlupEIygV1kW7Rl8/UCxb7w99HY0DXHVMuWYtuSOF7i5RYjaNkzJiMV7GRC
         UmCXlXDgc07Fxz50CkYRQfc6g0/9JLK1bMOHUd3WVRO1yp3c/mZvRo4iG5kDzuD1k5br
         j62gAyFY652WZEmitDHC20xiyylfRT4fYymtM9KNxDJzF5AxpMQ7GkPqUxgMfyth0FRd
         jCzn+aZfeqexEvZGB9MoJxrD2I26NOnH3rpeY/fMqoYudNlyS2njmeemPq3xz/VEJHEf
         kei+Ud7bUtgR+BRDlcMLOX4HTV61tato7zTXE9H8n9Rytfg/wXY76vKJ3sgjBsOwNOiY
         F4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884726; x=1792489526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8v0JkLJFzbjbUzSunhsNyUV3+4oWGxJqnDHXmr6loY=;
        b=LTQloTP3Ehxymn1luJU4WJHOaKQQqC2VDjh+Y6/ix9n8ZxjiewVE/SPnUtNV+rUiIP
         GUk7qKob5m/OdlQcQJwxCkQE9UbH0drLj+pbR4K+5ZIOOuQfbRjgFj2MIETeFMXG8N12
         iMLwLox35dEmJwBsez9148EHvEbMbjqWY8s+Rp/ox0iyPIwxn2vHeamIGRzVv2BpExfg
         zjU91V/A1tOsaOS/BqJBfpgTnFYTbqEP1svD0wdM3ePhsmy9nbi/sRjA6926af/fBs3x
         oURfX+P1vLWdnLlh3XMqrPGYjnFPEFOOjmJNfkFj+DlGxEOMmSRPUNo7PadbDXkd3cpI
         pnyg==
X-Forwarded-Encrypted: i=1; AKwUvBxKQBgiQooBJAY6Ix3EKY3dUDbbri+1f7I33dYfBP653aDpe3fWn5JcsCRatB3XUFUqowpCgoUGhpZlEzdh@vger.kernel.org
X-Gm-Message-State: AFq9FYIiSFK5kjF1wa5l+fFF3809tWAZ4zrE9p1RPIiHLfQJD1iK148F
	EePmg2z6FNFRCaQ4hXyDmU84Q63wfF7AXDqdVT+F8aKyOuKgfk51rpHB
X-Gm-Gg: AYBFou1h7DpLJXU/k6jquzbQKTzJSb0QLSQqQh6YGdTNsNBpL6Hujy+GBCFMCSwj8NL
	hfQVpw/Vck+I+evQxr0266FbctkmBD4n5pP9KeqoWa5CNdTMMIg9dOfPVin7hYXJ2CHlDev2fU3
	z2jwl9fVeJ/JD589nOk0iyk4QJbL9SU9FmQqQwJ7Uod0zRohubC9S67yUnI4MdX+ZbNevqYB/Nb
	Iyx5yCaxYxmDtEvkUBLI/P7rmUDEMlGWX4eu9bnDTTtPobdkeq5GYwSTrPOKOKujJyNFWunCXYA
	hI5EAbe8bSvl0N/D7vukM6Kx3isLiuzoN2jMcTd4JFxdH8KeuwpM9OMGp6UUY/w2DiXg55qRH0k
	Vxjqte6Zh0R/OM4nZIvOR7oudslgnxtB8I8WXhVAZIrT1Be18gknyI66Kahvor2r9HKbupDKcj4
	egKFPk1Jk/fZ9hJhHytZC8o4bQtrocer8y9AaJXdHXt1Ef9z3m2o7d2pihctcbsTlLl4O4RK3n6
	yGG/oC3PaGyYFUBs0EuFTslUZ/eQ/ySovUZoQ==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr252151255e9.16.1791884726303;
        Tue, 13 Oct 2026 02:45:26 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm233154305e9.4.2026.10.13.02.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:45:25 -0700 (PDT)
Message-ID: <9c311e76-66e4-4ac4-a59b-f0d7cfeade6e@gmail.com>
Date: Tue, 13 Oct 2026 11:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: parsers: qcom: drop setting of partition's
 mask_flags
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
 <87qzhuzsea.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87qzhuzsea.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miquèl,

2026. 10. 12. 20:27 keltezéssel, Miquel Raynal írta:
> Hi Gabor,
> 
> On 06/10/2026 at 22:00:41 +02, Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
>> so it is only usable to mask the lower 8 bits in the MTD flags.
>> However the MTD layer does not define any maskable flags in
>> these bits at all. Additionally, the meaning of the bits in the
>> 'attr' field is not documented, so it is not even possible to map
>> those to the defined MTD flags.
>>
>> Due to the reasons above, remove the 'mask_flags' assignment code
>> since it has no effect anyway.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> Sorry but it no longer applies after Weigang He's:
> [PATCH] mtd: parsers: qcom: fix offset/size overflow on large partitions

Sorry, my fault. The patch was based on nand/next.
I will send a v2 based on tip of mtd/next.

Regards,
Gabor
