Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721753;
	b=gaRPj73aSYCf0Nhtv1vm77XYLj0y6tcxo/hFfYwVCRxduEsyfnWEy1qBQpvXH1cQS4me
	 JxqPQg6exntOSAjV4t4uxPIlS7Le/Vcde3pbKr8HbWtADk90Pdvg9NkOUSp9x+4JwPzWL
	 97LU/5LHfbtixw9NImHSRNhEVG5+AsLMssPp1BcqdKX0SIIGcym9SwjASFV5ddnaZ/DOt
	 6DOwDpuI83S7yBGMVCtFfD1rK1huH3jRqHV3TFSi/2g0v8/cQPMp7Ha1KAn389o9DJkpu
	 Na0W2UUbVcewqxWWCKeImH9E7i0Xr83PG2fkKDmIorJBkAPkv3xefKUHy3Hyf6aU4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
	b=ORO5ToteJuGp5dwAyCOOijzEoAjSP93nKRUhXKmjZOYxH5BynpbOHTONJ5jTtCliZ8p5
	 JhViCGax3WA+BW1igA05TIvFwTm50REJe9f9tfy2hMSWLX2mywmXx9OZbjJ0rLBilG++D
	 HF+kR92iZupNSi1vdTHNCFuxwWOLc2LlQPHBTq7iY3g3nmdtbvYoDwSsQNxSEBk46YEk5
	 0rycKqpt7nQfPw7oQv1E6fN1hRQVU+rM5O7qjW0QboG6IVZKBsOapB7kR0GeBxSSR8s1R
	 rg9Syb+kpIrKDOaxtKRaYONiOJMwz8q8xHWflUBTSN7Hb80rxYhLX6RL+Jk4qWn52jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A52606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A52606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so3072665e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792721751; x=1793326551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=N6bPXlOeCto0Xw2q8GWbXShiK73KSeIs2hmlz4VTfcv3cAbpYobZAt88gMpOm2lBHw
         M2WfJeRF6ZYKReLfipIpDUfAnbhsUsv8J2oQW7l1iK/5BFKX5UR9US08NB2EImhYxU01
         2LYE468fIOMwkAgcUbeK18A0/ZLhnrOFo2PLaGYrpw2YgPiNsFcqPE7KgYGeV83cPrxD
         FpIW5fQs9yEITiLjip/HEMToKsJMw1h4sWvnRhwc4bj0nGYObUyUW9BKyBpxz/jbhbZQ
         KB5f10X3NGyq3jXPSCbI6gkZJLGk3MRSi/OUtQCBoCmZigi6eBIaVazUcUv/Q2qG5inq
         g0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721751; x=1793326551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=s+sjwOioWcHJveqKd+dcsR8VX3CvBAN/r4SoD5udR8k0D7X0tzEEKGiBvVEJRRP3nd
         U/AdU82elun03G3zqMwFRoVgZ7Up1DwShriZfvUcSsSO4op2jAQ2EKLRIjr6NfWsF2NX
         VZ1mD0iVBEZZmOkazTTJjmZk9TCVqrZ0XPpMY6Mw+uTMpQF1h1WBIgD1gJZF+VNM7AmY
         vYsNG6PmJnXxhSVZtGAZ0cEtuRezplvd3N8uHQlvR3k6IB0MiMwKy1+x6DIW2lwSh+rJ
         bCz+8Fulpqye9MwAVchLfnjCWmF/ykMoFaGo6C7MV8u5xEF/YcCzfw4xeFbkAbnFqcH2
         AMLg==
X-Gm-Message-State: AFq9FYKdvSmSXn8QlXY+7yeG1o1b62TmUtvmlzxUOXjO+GXFNEOS7b6w
	mAw41QBggN5Xnrq/vG01FESWdpUdung6tKVHhskH8QwsaddbdbKDsK+Y7paLxa8O/ig=
X-Gm-Gg: AYBFou35F2dwFGOQgRAUdVycs9MsRcpci6OxDFCFCr8ZY/hONvC2/liJ0QnUID+44Kk
	3zTprjDSvg8F79XKeRhCl5N7YHntCSFXIS+07T0pBxEh0HH7PTf8WD4MpaKZfdEP5WO0IJ7xjSq
	Xd1MjZ/5vt7unt0hhgohYgz2ie+H/iZXcDbW0KIoM3g9rdaycLKnIHy9BOWu8YajTxbobEoO+Ql
	J4E1LTOyQXhT9TzIqYtMHKCSzL6ZdOvNIJJxRJkb9Wmdh3p+ijo/oMOucwXOZPv+otVkrnAnVK4
	GXdzAViSmoxZnOABiuqsPl66OK9chULUBIMVg00bjOKt7JQhdF+DGEg9TphECkY/5Pv1N1x0aJh
	PpyxJHGjjmzmg99SzZiplwkUNImG7PvspoZ7X2WVFJ9GmzUL1ZVdYujZ0rASu1P/0PipicH1U9D
	CiaqDH+tGmybcPS+w7fQpYOEbdH/dcZAFJ8ozgVPAmmgtt5mPq7+9XDx0rIGot9HvsO76HZCLdc
	0l9bAZvtlzWN3UZsvki0ZKUc0NfeOBWiUjAJ+KXjeNfW4EE5M/3CHBc+anHcfdcNXVJY3q8FaU8
	lftA2xAMWH5G
X-Received: by 2002:a05:600c:19ca:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a211c65f14mr11839735e9.10.1792721750941;
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034b3d0sm47718525e9.3.2026.10.22.19.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Message-ID: <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Date: Fri, 23 Oct 2026 03:15:48 +0100
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/2026 01:33, Anusha Arun Nandi wrote:
>>> +    if (!cfg || !lanes)
>>> +        return -EINVAL;
>> Lanes must be a multiple of three to be valid, at least for your three
>> submissions to be logically consistent, this statement must be so.
>>
> I will update the name of lanes to data_lanes in
> phy_configure_opts_mipi_cphy struct.
> I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
> data lanes only.

Sorry the only thing weirder than arguing with other people on the 
internet is arguing with yourself.

I argued myself down from this.

=>

One CPHY lane is 3 three wires. So data-lanes = <1> means three wire 
that only the PHY driver understands.

We communicate in lanes not in pads. There is no meaningful way to 
specify pads in DT - only lanes.

Which means lanes - I think we should follow what struct phy_mipi_dphy 
already models for us:

/**
  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
  *
  * This structure is used to represent the configuration state of a
  * MIPI D-PHY phy.
  */
struct phy_configure_opts_mipi_dphy {

         /**
          * @lanes:
          *
          * Number of active, consecutive, data lanes, starting from
          * lane 0, used for the transmissions.
          */
         unsigned char           lanes;
};

For example in DPHY lane == "two pads on the SoC" so for us in CPHY mode 
lane == "three pads on the SoC", there's no need to deviate from that.

The CSID needs to know the symbol rate - so that it can vote on the 
appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself 
need to know that ? It does not, symbol_rate is not required in this 
struct no more than it is in DPHY.

Sample principle.

So _really_ thinking about this I suggest

- Following the DPHY example
- Including all of the CPHY specific timings
   The ones you posted, plus the few I found missing
   Any other relevant CPHY timings we may have missed
- Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
   IMO we should use defines not hard-coded constants for the
   specification of the timings here, unlike the DPHY code

---
bod
