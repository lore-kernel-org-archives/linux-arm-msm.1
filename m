Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8884377541
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571186; cv=none; b=M/YQ8I9H2ELCMV0g/ySn85tMBpr82NeiaqklRG505AL3tWpO+LthEEuYy0PTMagWLNHbnc9QiRfeY/pcsiM81ydHk1fD6i5yGnfFVb8yZGgjbwFrriqcjHpWnR33zkB0/jXMaQE4M9RDitmKTznY8rD5+fOuLCvFDqEevZu+Rxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571186; c=relaxed/simple;
	bh=fnE5efAXrYDH63o61zDt3jsPaz4AKBrN/AQ+31gDqD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpnmJ6w3OUPaDWB28Cz9MdolEkCsjlYZ91bSKsBW/gGlqefKOxSkmBQYJ+hdipY+AaoTrqILyxf9+/Qfg5KHvEIrU1U3oYWGNJYlE6pXcx7e45xoT8hk+Tsi5kqUKAqRzSdeE2s9VgTwDi0hWKkx/RB3+YozS0EnWDr2FTPgnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8uLxNpD; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8uLxNpD"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so1329864a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789571183; x=1790175983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0ZqTXxWmIi8spdoKcHLXhkmgdsqCfsr13D7RbpQDjQ=;
        b=g8uLxNpDOWf4Ro7imrfuTpkB6KLXSmbO1UOnSXsw2RC6r7A56yhtpHPYkjqEXC7Opn
         3KbDBbfSVL2DTORigWOSZp9Dw7fkEXdzcpRfuoOr+dWA5+OvWogxcd1nYtK8Z17rTuwk
         fGls2FrkynG5efUKCsJ4Ksi10mPXB2TZ51lSLT0RrxKdtom1a5WHAhCrH84b4N6+po5j
         yCelzRRzH/JW5rt0Dkc/Iv8ip6vC+hKSvRMTR8Kyqcp4LXk1uAM7CGQqK1TXnOXRly8D
         sG27oApa+Ydp/VvAZtMbJw5m9pJR96v+024AMiu7rVjnkBUqfxCNKPKw2vROzGbPYNeZ
         4TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571183; x=1790175983;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0ZqTXxWmIi8spdoKcHLXhkmgdsqCfsr13D7RbpQDjQ=;
        b=Es9IiS4tqC9k4BhuCwAUk82fkFUYROPfetV8YPXkIG8Vwj9ig+hsynlviJ4hPGfrYM
         D1IWCvJVR3VBbyyhkmMORM3LzI8DX/093eoXvkR6uAvUJq1hjERAmyy2XuyfBxiMgSIY
         yzGAleiOPLlPO4oRBmjJyWXTKTN15PSpAPTANIuKKzot/BHDhK0GTAGza7lJbcSPj7FN
         IpFt+211I07lAIDVBnOPYAnX9EXUoWcRUBqQigaR9PuhflRh2TGITYWq/mY6sOArBXo9
         jGMt7Jqv3GRU5D0qFHs9aruPbxYV5dWdW6btk3OSvo41o8YWESjNEAl/gjARvLvaBWmY
         q2ug==
X-Gm-Message-State: AFuF++nd7T8ePNbWaQMaXcT9KNvIbn6l+9uHt42/JjfU8FNEuHPjDw/k
	G3lCR155Rnl+EbSz+nNL2fxkC0z5s97ym1InuwRZaGFc1ckdW/X4w5fQHMEBKRwI+oc=
X-Gm-Gg: AYBFou1JHBimzbtInLOfrcxS7cQ4Fb7phAT/N/4CERBDeoQSNFrBBdSnT7+bbcZMXIv
	SJsv9vNUsoZKRQUQXCfhnbvpNyqCwvZaD4omKaNWFhBecuJwqHUp+MWOpIeVP21BBAE8lS6D3+h
	zZDzDSLB8OTBXjmg1+nmW3XefEZw9MfI1EaxKpBgbzBScWXsG80SNNSmCexOQ/ZvqjQYAjEE7Fn
	yztBfoi43ezJmaZGcwtdTXMhbLUG/UqdwO18uurQP09ywfChd/6HHNq+ggJ2p9XqBFSrDRtWH1J
	CTe6783b/uHs+t26Dt6Gn79bpbdRUDTsM/TB6t6pbYh1SCvFNUCEcOxAd+Qi1Goq2OCBDKCNRGb
	TaVsUHPFqEzcivXa77EBLfhUW/QNR4le56FS+IM0QZFVh8HLBLw6jUDVSylCyFjVDU2gNn6jL0M
	Xe6lbE1qCguhO744oqzv8NzutToZVp9thvFBVT/8NB0YNMAC+F1uD3GMfGbPvRPKX7s1Qo9HkD9
	O0WKvueNhnt
X-Received: by 2002:a05:6402:c42:b0:6a9:232b:ec6d with SMTP id 4fb4d7f45d1cf-6aa22479709mr2186159a12.41.1789571182901;
        Wed, 16 Sep 2026 08:06:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d260702sm1876319a12.18.2026.09.16.08.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:06:22 -0700 (PDT)
Message-ID: <510e12e9-fa79-456b-8215-9f613d6d6e7b@linaro.org>
Date: Wed, 16 Sep 2026 16:06:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
 <EcOn_d45L85SEZXEL9tJYp8j2B3-IIn5Ao1OiDaZsoJZOhfDjo04cEbn_YvY3I0eidZYm2PvZNw0K2e9D62CGQ==@protonmail.internalid>
 <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
 <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
 <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/2026 16:04, Konrad Dybcio wrote:
> Perhaps moving the endpoint label and definition there too would
> make sense, i.e.
> 
> -- hamoa.dtsi
> ports {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	port@0 {
> 		reg = <0>;
> 
> 		camss_csiphy4_inep: endpoint {
> 		};
> 	};
> 
> 	...
> };
> 
> 
> -- x1-crd.dtsi
> &camss_csiphy4_inep {
> 	...
> };

I don't think I can add the endpoint, my memory is I tried that and the 
dtbs_checker spat it back out at me.

I'll retry though since I may be mis-remembering.

---
bod
