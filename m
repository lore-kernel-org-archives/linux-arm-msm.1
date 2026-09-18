Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3548E0D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720651; cv=none; b=h7H+lA8OhkRMe5S2DhucVovg/+G2fZy/Eq3BB+Q7t0QcbajSXArDHRUdHJahKHx0gN5BvTb3RLHQ6Zuap//ZbH8ylK6PGVlKe+itrsyN79SEs61h3zsVKW8IP+UrNB/4/Az/GatdUP9Bl1VmCBXwMsYCwNaBh6HaOCm2MIeUw88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720651; c=relaxed/simple;
	bh=Uxr4WVyD/DNS/detS6ug+v7NOvEjI5JJaJV4V+VWxsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpllaAOKsYYxu2B/uOQ86v6S2n9Wtagrwri9Z/wsaSfb5uvGfvuFkmYq7upsi1tLpe66OV8pEffAE1TZNSQXJLlhP4iQr6lp6LMVJmhRSBTCWCDaKzot/Q5DZIHXkdG/H0sosyGNWkpDzEWoHHx741au9T9ItcoKABpNfSqI3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUyKAVm5; arc=none smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUyKAVm5"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so64374166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720648; x=1790325448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=sUyKAVm5UpfIhhx75ErJhS6MhdSrfjRXsde0yBrmtZLPEhSOoZwsTSeg2sPetwzmSS
         zFDuCjaOq2pfNyh0hC1OWHKqPxYyh5Jf53eCycmrOTuDBreFIljsoVmr98FFBpKBftkE
         dVPzK2Jg0MCAGFcU+cL7kYUvP5E3Re9QxSNA9+P/F4yo5GK53Up9tnhah2OpIna1ZYRX
         JthbQcFArVC/Pmnc+4ANRjvUekvp65CzP1/3xVZfjXTG85PrTvTmuv6Me7DfQYG3g1S+
         uXZKj+0eHTvrTYK0NSI0RAkp7P4GsNJNjunmdrh78Gw51scMd6otBM+8jYoCBR08b1yL
         qXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720648; x=1790325448;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=dNjXdhGrKWHdOJpBcHqL6AWjtwcHB4Ghlr5yUuE4CM1skN4rhzXStCSj2gXvq3CxPq
         azTe02lyIgFCR7ErVxVDns3Te74Enpgyr7Bd2S3K0zVboFuCOlRB9505LjwW6xjpGu6X
         78PpQuKzWa2bBbzwcjW6QrmgOevFPqxLdqA8f9jx0b+7d9CECfsVFA6W7zF2KCB2m9Ax
         MO4Qu1dP8GKa9wMyR2PulIzlhnE+KVejNdBTzJ5doTrgBJvETXrrcxqvZpx+TdPPQNvQ
         IMF2otBxz5KD4Ap6pj89pl4Y5/1kEWrGQFqOpX2iEXFZdklquJWDfXINhwb+rJ6149CW
         P39Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1SneWeB6/6FN7Tn8brhwRrcDJ+z9LduGAZ9c0bCMPSra1Fs9WsuPQV6HzoiD7bRHaq0sfgMQUn1GeG4nV@vger.kernel.org
X-Gm-Message-State: AFuF++mGhVlLFnBMEF199BpAEkusEVCn1a/DcNOfppDN1HRq+fDNjhTF
	tVGRJ2aYqqUPZHTLr7o5bLXcSxrKn6t4a+6A/nZJ9j65yNbOm2M3gl4CNaZ4vOBySDc=
X-Gm-Gg: AYBFou36dq0BnnoNRLFFiOqjqHP6FJg+zKc9DhUvVQu8sQvhqm6lFapJiNcVQWodX0c
	CrHwPTRIWio8hrPYJjn8QKDdxOtStH1ehcrATL6P6kpm15OC1RxquEMquCG5F4AjXRBqG3DZlOG
	zFIPi0RU3yaY9wYXCRs/F4GMIJ5W5WuJHXrFt9urYG9UMybuxAw5EQ9lgTk7DLW1KGocj6ANUWR
	iVuWC2sGJfy5OCynW6D98F6fVNpArSc+LhDwVoVnJVjozYjRRE0oGlqt2baUQfBtVdT9AH2CiBR
	x6bEdZ9VitQ8JPkeiz3rTxy0lUcWRCur1NJEi+bT+UP590zf2b1GKgzg5T8Bu63XBy+2wiU0NAz
	t0ACV1OwZZM8z8iKIQHCov0Ra0leefiq04NzSrnDVdkz7wh/1PFi06DsKXTXQH2j3vkMYtKCYfU
	1CWBqbSwnEF3enxT8ClRgha3vQoqhXllC99Y4zxHKvONY4qakcpT4W/VaEl3pMlmEr3T36AnbeJ
	D1F9DwirQ==
X-Received: by 2002:a17:907:1c1b:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2a15846850mr191330566b.7.1789720648074;
        Fri, 18 Sep 2026 01:37:28 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm32784166b.53.2026.09.18.01.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:37:27 -0700 (PDT)
Message-ID: <70284db7-a7d9-48a6-acdd-7a9850cdc7e4@linaro.org>
Date: Fri, 18 Sep 2026 09:37:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
 <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2026 02:36, Manivannan Sadhasivam wrote:
> Looks like you completely missed all my comments given in v17 :/
> 
> - Mani

oops so I did, my apologies Mani, I will take those in now.

---
bod
