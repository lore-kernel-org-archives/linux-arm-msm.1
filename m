Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175709;
	b=267I+AVl7jDyVOc2O1LsoWJr95YGTWNLkCzWOPb1G8fSJaV5pCkkSr8sr4o/SHPIy02H
	 AJc+YdLBxC3JpHpM4KxjNoOgpPTkzsaMcn1/gMS0Mssw8uhRHMOUXhrqCPgd8TNDnrK8t
	 obHQPZlENxiBzd+UXgYJkj4SrctfzUg3AUXD1wh+6iCGJp9ihlJFfS96fvjF2mYv02bST
	 RMsozwzMJ8n1uHRqKiUL8rCFv6ZeGP6UwvP2wGNzwqpulinqBovNXROWAnk4/Jh/IotzJ
	 H2BvFbiHrq16mnQAOT8AJoasKWIaIaEoDFkUC+rsjXw/pzsjXyJMqnJ0p9Vywm6Vc3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DKbl0knP6GgOxKbGkSb4++hb3MG0vuwY2UQuP6+FkU0=;
	b=HPPYTvjKqjlJiVClNq+zSAnCRJUVZ8i0iYhA2bcflO1suy36TEbF3JqazVvwAFbNaKuK
	 IJ5eVPMgNyE3EtMMWPNpl0tuCYYK8B3G5mHVkacNPCNHjKe2Hg/eLeYVtx93ZNo7ijMJJ
	 x8qFHy1vlB51F0sydXj2pHAdLETshuSFv+3zvBq48VxyBKBIjBPLABB/hjy/MA3NgtceT
	 UJWtHzPitzWuKcBl5XjZi1xNeLYhdvkHOH8WXeB7GNxqbaivNk4q2huZHa69lh2O7rBU4
	 wE9BUZZLeZ7zpD42gtx49IOMKJYnISeSPvJdD2zNvUSDjadg0FFSLKR4lYmJY5ONvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GyXb+xmc;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C1606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1C1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GyXb+xmc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e46e449e8so513653f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795175707; x=1795780507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKbl0knP6GgOxKbGkSb4++hb3MG0vuwY2UQuP6+FkU0=;
        b=GyXb+xmclUqFDKryhpi5m9OwUGqPa4BDct2MsTkMEVQZEKVA4q2M6taCVZK0xO1qYU
         qUTlfDVTZ1MUbljxTZenoZadlHfR66fREGrAZwK+YSQ249wZ7MwFiUODBayiFQVLSrJE
         MqYh3ZGOMrkvwAapQ30QHq43APGtlmrIJqSolgeLQoJ/KbGsmSxtI9XTWUBp1i/ooRJ9
         Zy/UfwA7Ecr0Hn2E0Z6+ZA+3Wb3JNDaXwVt0UTvt3FuIey0wIKUEpW4R8mWttlsuvs0n
         b7Tz66g2fDFkfzwE4AhYt1DKn8sl08PAlJSZFaKI4+FOlcRs7xVmvxbGuQsrT+M2bNiD
         uVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175707; x=1795780507;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKbl0knP6GgOxKbGkSb4++hb3MG0vuwY2UQuP6+FkU0=;
        b=AfM4X5PTxurw3ygPNbssPrfwDVfZNhxdYX+vhmbWzG28/8MP+CqMhQR8v5FIdrF5Bw
         k0zKEEXbuQDIfqsAQIS2C4B+dWFYqgw7r2JZlZ55nZimLZyK8j4IyGFtkKEqd521xPuN
         vKFIecX7DYVMdUqwm1zZoWh+1uqW/sY3pAI9jQy22rxFT/b/2dGwDJ9zlBYh1eWbZSXc
         e01vA8ajZJEA61fcg1V6e+WF/NnhQs21Sbdc/n4vHUK7SVpChRkWpEipuwjayDiY6VPF
         I4+MhRBs/UzMgFXlvbuBTWcLu26FWttS4xVumU+sMVcFnPk4Qj0qUBN38T0I9x4U1hQC
         vs7g==
X-Gm-Message-State: APuU4Z+8olmfs7jDTs7GGkJT1I28XAqWY3kvweTorPvzVVzRurGq5qWX
	hW/apQiEgOY1nJ/qtZrwVlwKG+w7OSffVqvcGqAFRMq3lwfCsZpRkXhIEWhoM1f3ZPA=
X-Gm-Gg: AZFdTZcjI3ZCGaCky5HKSbzAQ+PoNNwtxvA16nvuzcbdbSoq/KyAksPEPMRHBdkas2g
	w3S079QyZYNvb0XNmK/c6cjbbNZTqZNaiSRtUcLSXn5f3y2wHiSPnLB5E7NZEQsNoaGOlKfo3PE
	BsQ/vaxtmuEa4Sa3XlLrj/U0Z1tRkXSgIP64Gyl/vj6TWEktVLmFCh6YeJf4bF4H71qtobbfS77
	gkEbPcW6jpzUoRWas2rjaUTWuZNz6uA7VQ2GGU3MIZ0ws/ZSgYKCTSctWYYUsPp8Y2oymED0lVP
	rOBygtHG0GX0gquHZCDirDMshvwiANe7x0Ra5GoRtciU1H3wWCZIAS0KNNCGAgEU8hhK0I6tCeI
	Uu1e0zOXQhwsxs+MPTwHigVQzzmBVBTpD5M17bWamFB8BFjcNlcVF8yFy9wD1fRyB0vSB5KYVaW
	T4+eeh9ohqWdDwRi4GlCztRnyklfd3et5yUa3I1piiVDwZRq0bhv1G7ZWYPXZpmmBGgKd6KsZEL
	jLWFZvaiYbcbAxFCYm7nEihIhN7qJ+p5lZSk78wJ72HkgzRWxx6J5HEZiSwOwGD3KhJUKXc8Ya0
	BnE5FXsKvkUNgctYouvvzPFj2pK5YbRHKWqaY9AbBC6Syn7Pc+2u6j6dcDci7Kg=
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id ffacd0b85a97d-4abb86ed79amr5274202f8f.43.1795175707432;
        Fri, 20 Nov 2026 03:55:07 -0800 (PST)
Received: from [192.168.0.167] ([109.76.69.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm5834751f8f.14.2026.11.20.03.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:55:06 -0800 (PST)
Message-ID: <2612ca00-602d-4a4c-95f3-39cbadee10e6@linaro.org>
Date: Fri, 20 Nov 2026 11:55:06 +0000
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
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 09:59, Neil Armstrong wrote:
> On reboot or power off the port is left as is: a source partner keeps
> the negotiated contract, possibly above 5V, and a sink partner stays
> powered by the OTG boost while nothing services the port anymore.
> 
> Add a shutdown callback stopping the port and the PD PHY, unregistering
> the TCPM port, which turns VBUS and VCONN off, and finally disabling the
> Type-C block so the partner sees a detach.
> 
> Assisted-by: LLM
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
