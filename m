Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885E44AB82
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552649; cv=none; b=LsypGe1FNiA3eus30qhGLsTw+Sw8eIIEAfIDLSOxvrb/j8RoeOH6D+fAtSLJmdrxBsR4vidIiN4WnbFd9A1kt8ilpcnXnAX9eyA+X+rXD4819fbo2+18P9jGAIM/6JDW9Newc7mWW7ys4UdgYIjWx+ldrtlNrXSRg/JvTiPPbDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552649; c=relaxed/simple;
	bh=E8yVqC/zi2IdNu5B9ZngEkUph7ZkUNPop4VYVkOR4u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaKgLYuLXd2WxLGVwR+qwLi5Bnk718z0aSPzj+0sonXCZUiVXz54kovBFTIwsj06/+Jx9I9AVG0+WIK1PVCyVFaN51mf5tzqIES0LgLAqsC4dEfktCxlnHBNAoel49CNYF7AEjd6shAWffT1vlp/hH19hN0Qa0dEoGXCeeRMsds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btZA4Izm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btZA4Izm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso20906935e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791552646; x=1792157446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRmBW0+uiCkDF6IJ8Hrz163xMrqCOuoENGdFxOZif3w=;
        b=btZA4Izm2DN0huJtTrNeWuVqrjaER23nBz3Tba/1gWT9EWB1NRxeU2Me+qlySrJb96
         Pce+R2AF+sTxb3c6eMhYkX/KCL7FHMJBsKAu7gD1Hvacb+mS8vJnB4Em0PKyN68DPXMu
         pzPTJNRgKEii43IWEOIcLIBfOQ0HDUq4mDUPOELclfMmbObwY6qIWW9xsUt3cwd5RMBu
         ZK0xAUsEdTwFAjj+2FnSHuCL9CA+s7bKCOhU3aBPQ+VYdF97vWDba0vMnEGzvPz3fOxZ
         oFMMZIK0g6otywbm67L9AlI3f+PIy60vjwRakoFnRyZg8T+PNMuE0dbl/Ok5a+9Rrzc9
         QxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552646; x=1792157446;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRmBW0+uiCkDF6IJ8Hrz163xMrqCOuoENGdFxOZif3w=;
        b=m3VgERNUXdNNcBPcC9Zr5Z3E+l3jS/j+r8tY3qx5FNVwr98lRePJcW7lS6Et9zcgrG
         9tltV8hn9jc1bnC1imR7F/MENAM2s6AWupBYi6B9vaBtqi2wKQMvxab9skV8M5jWVJ0i
         js0yFo4iAECwSbxj+fq1LKTH6Rl/3nEorWTg7H6B6cDjMBdbUQsEr/x+sbV6wePeHeUr
         tGfhLhNqT3uuSq9GyRbDTyaxoH3ARltsTqfVKcPwG1/zod0VTd5gEAQNrz9J9bMv7H/l
         ZityM/WNyVytl/wWb1hJj0sDngOb4W+m5bL6fzOKjzJGumOqUbzBRvZvr71T5j+/Z7cG
         UCNw==
X-Gm-Message-State: AFuF++kWNXD9XJzlFtBKUTV18hSzNFDN2fq2rO86snD9AlIaBUj+fh2t
	WpURPNAplNJ1rA2+9RXGr7v81SRI/fHxK9EgThWP4Gp4U2pheOhJcIN0
X-Gm-Gg: AYBFou3tO3Yz2gZv7Urdxs4Ua1N6dBGw1WIpxQlGzxkOMW4eRK4Nd0nT9v94mHUeaqK
	nUj5kaeBGwbZspr2pwzwmLhpzvYzduFYOS4nDdGCqn0n0Qgvfa7bofPai3jWenUNu3jQ5nhnbvX
	mo96Aw8D7C3ruG+Fvz4rvrMG9Jeo1ZBb4/YW1zs8bup/N+g+38PLIxWVNCWxtozzx2OcUtdeHGN
	bIFpAd7KHh+0rqfv8DeYiCZIwWjw8yceqgRMXwMeY3newDks9kzxUcanh/tENdHDAFD4S3AOJzu
	I8LuK7vHNMun5maeBav289e8rBCpRWeVLArHP7Ewi6kZeoxB8xsUrp3iSFkAHNvefuf8X/P6GTq
	ioZ7TGsYKfiGWttEEuaJaEWP9VBqXfBAEUy/6foWpMbw3nKU4PvNe0TcZ+wx0ET3wUztfOKcSsw
	2DORtGLzH9I/K1d49AQOFiXGuOl0w3ERuKaQ5uI8nX0mjYikNMiEczaOsnbl8O30bDRiZ5y2pGr
	Z4uTCs0Jmx6dDpDEJVBhnjkb71c2nZeouO0mw==
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id 5b1f17b1804b1-4a18eb4483bmr35172655e9.2.1791552645946;
        Fri, 09 Oct 2026 06:30:45 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adeacdsm3973525f8f.55.2026.10.09.06.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 06:30:45 -0700 (PDT)
Message-ID: <1796fd45-50aa-40a3-bccb-d779559ca02d@gmail.com>
Date: Fri, 9 Oct 2026 15:30:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
Content-Language: hu
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
 <ca27b076-1814-4780-80f1-d022183736cf@kernel.org>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <ca27b076-1814-4780-80f1-d022183736cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 10. 09. 12:15 keltezéssel, Krzysztof Kozlowski írta:
> On 07/10/2026 18:59, Gabor Juhos wrote:
>> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
>> Change the prefix of the board dts to reflect that.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                                       | 2 +-
>>  ...5018-tplink-archer-ax55-v1.dts => ipq0518-tplink-archer-ax55-v1.dts} | 0
> 
> No, this just breaks whatever scripts people have for no real gain.
> Assuming 0518 exists, then still 5018 is as good prefix.

Ok, will drop this one.

Regards,
Gabor
