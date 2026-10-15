Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCBE54A7D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080120; cv=none; b=Hqx9Rj+Cit1kI/BSt/rhYRD/vYyoxN6BTXtqWq0JK32+xW20J9qZOpyPcEdDXXrN0iWdWPQHAuDHZPgQIQKdMyz8nWUngzIZr/0IP/oKAu64bb8GCjI6M+tg1sE36fVommr8PIfS3ADjqN/yQJE0VrYLmajIpivyzSiFywwnoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080120; c=relaxed/simple;
	bh=JE8rTmi+yV9lC8I8Q8izF99dyKvC7oYaJcG+z1U7BXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLSFiA9gQORVnryThDtMF/Y3EvLkYDW5ihl9WtYhmgYA4AtNn+I4vi9Oe6adQDPdityYxfFUsz58sNZU/uShikWD67CpjsjX2a24mGebVgTP0LZPo+nQ0+ut558tU5wzbv3EC1hlO0YVxfmnv268BEsw8SojjAPmlFsg/lCK7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CrxBlAkl; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CrxBlAkl"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b89c6caffso14773396d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792080106; x=1792684906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NALvi08ArpEQSQ23rf9GeRnMp+xRrLbipmmnb3o1ZPA=;
        b=CrxBlAklAz/i+mewrnF88ATKZ1qirKsY0mt/ROgawZjbqQZrGAOw0yY6dRMgYEzBOB
         WGkTXUY8wHzHE4EHlbIhqoLGBLjGwJx5ouYtr77AT0965ZP5vcOXG0kA2bk4V4a1Ll5g
         kt5XHTAKFgmWHGVvl4m66+SqfX/3aoicIZdUimYWmI7WQaUHx+Hbl0AQkVGDTCymCq0H
         RXGh9LmV5sfmUAl1G5e1te/WLgsaYTDF3fOx6/e+HCqgNh5oU0duep2XpOXaIYSHUjR+
         FmcOMBGjBGk31iRGRL6U3/WIH/K1y+w4oTcNVAtFqnuMk+Eb/hEIPDvBmb/rlchqvBMx
         2nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080106; x=1792684906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NALvi08ArpEQSQ23rf9GeRnMp+xRrLbipmmnb3o1ZPA=;
        b=GkF+gd6ZkC/QXPWtORjzRcw6e295T/7k4lp7kRRxY4wtrPOjm//DIM+Qhau/W19NSj
         4azt/xOr/hXshio9JDnqJE3gq56NGsBLqftRv7h+J5hjAA2ZkBsX7aa7WlZ0YOjPOdEi
         uSzNLgzWOEGvQY+6pEtzBaWtifhSZMsmTVUa4E1YXz8eNgL/XaZnRF+mTa+XodQKD+VA
         Hs2twlCQLBUm735ZtPMhz9MXBzEXXs2tVfOikjR2Pz6ECT8J5Out95SOoAVcg4J9Y4EQ
         2A1VDx+wsDCgDN0+OAZ4sK6iBmIsjqWybHYigotvpCY6XeCLMpTfxMVKNhhrQp9nDw3l
         wsdw==
X-Forwarded-Encrypted: i=1; AKwUvByHFSHfAaKftHer0PaQj5+tE7OyNQIM8yJqRSWob4TkMR0pHImBdygcpJ1Z3GekOBzAuUzMdaBMSIB5Wxsi@vger.kernel.org
X-Gm-Message-State: AFq9FYIL5epkqYXAZPw1v3Jkg9gnq/MS1mKeo0K9h2+Ol7jgnu2rRYay
	pzswFMfmtajEPlr19eY+VsBLUO6Cmna9LvoxMSQl8yNnuy+4sohlE7zGvkITorSCbKQ=
X-Gm-Gg: AYBFou2bGDkNxHBI8iFwoFZNbNp0cM/iGv5J6/F+ZI8DvBdBAZOIZ8PB+qd+USg3Ih0
	3e6mZ3mZy5BfuZs+MUYbRzphZoKneYLihRPT00hcnnEJAVm9RRTNDllPpHnG/Lpy3yIsUi/tHjt
	8JOgcVrUWixGxl5x/66YSfBxw5M2mZt9aarejFEgQd2lfyh1CZb40n/J8mDu35ARUCTg+F5F3Of
	cQhkc469mralLa1mkhX+ZHcovEE3pYqYZTEZHoWHyDLJsMFdbsQL079SkeeshneJfNeBZKmVVpD
	yfTNnSRRAG7Wvr6kDqbHrPda+Eylhka+jKr/yk9kqRuKW+VKo9qGDEVklTFbg+bQeYg/28Y2oT2
	xE157WuogfST/ZTdzWoFBRMx4kXeLHZQz3b0dkKmdDNkpFQzbYnvYDdz/Lqc8OUDwe78VWWAYLH
	FMFat1wrQgF9y2S/OPF/CD0j8FTBm3SZB1L1MYF4dQtirMXaaloRvC09ZCTbr5v7jeGpcFpLw=
X-Received: by 2002:a05:6214:4586:b0:917:aa89:4168 with SMTP id 6a1803df08f44-91b5579949bmr310643976d6.40.1792080105628;
        Thu, 15 Oct 2026 09:01:45 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm85388086d6.8.2026.10.15.09.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 09:01:45 -0700 (PDT)
Message-ID: <4fc165eb-b57d-41f8-b7b9-c9fe433d866c@riscstar.com>
Date: Thu, 15 Oct 2026 11:01:43 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 Daniel Thompson <daniel@riscstar.com>, ansuelsmth@gmail.com,
 donggeunyoo.kernel@gmail.com, mohd.anwar@oss.qualcomm.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com> <atDz2hJ6xpA3p5y7@lore-desk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <atDz2hJ6xpA3p5y7@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 10:40 AM, Lorenzo Bianconi wrote:
>> +	if (count)
>> +		fsleep(phydev->mdio.reset_assert_delay);
> nit: should we check reset_assert_delay field is actually set?

Are you saying there should be an alternative delay used
if it is not set?  Do you have a suggestion for what to
use in that case?

					-Alex
