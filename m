Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268857;
	b=35/ToM8y0nwSdKCab9DRv8DdYw6PkJIy8o/dBpURS7rCyIB3tArWZyrNdbTn47an6Nil
	 sN8faDuVwKhuUzLbWtXhwtVLcFgobK3TSVsuyCBYANeSdR5yPD1BKyD663XvIa99jIa0d
	 LHK66zVIMLSq7L0AkqbuIhF1L5Zy7JYALOi6qeSKlc7/m7j1RJhMDbw72LJXYQt5c1dX6
	 LwbQcvhCOlZuv7VjXloOGjqkwtggf8n21MdjKYBDJJwX7s0DTiN/TJtse0GW5Y/3WiB7Z
	 R5UAyE17FyM0fPwrMQqtXPcv6bqjc4Vkn2zo+wGCnU5S2/fQd2Z9/L2EkHKXnjSYrNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
	b=fyIwTaIINv7gDAlxltqTORmCvaaeR3iZb/zOYhm4vh6f+PfGhcmOH6BE/z+L4cVrlM1y
	 HWFoGhaZHZoGwRq+QbYb4yEqQ6r8NxHHwNc0dkLjhUtfL02t9QnYF/g6kkr1+Wzr1lBaG
	 V6XecJFJzWRb5J/9QMCTjofJsSRe9+bMgPMhFF4+1yS0RU+DvlYPna6gsp4iQATspoOw/
	 cLQhBLOfaTVEuk8hvuq8PeLJEFeYm0EZUEKtvdiWS94jrSSexIwKqhYJ9eOCBmhq8rLtw
	 JXELabFTNxUMZ2Ds6LYBtXNWZzidhAacnL7K9x7GLliguLWsCMfsx4oK5qfsgW9ZnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="deozIxz/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA160A2606
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 00:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DA160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=deozIxz/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1071460f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794268856; x=1794873656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=deozIxz/aGLnxTDbgoDjHa8Nq0xmOsMrD8iijQkW1P4nF7hUt3TN6minRfpOckwpEP
         MH8cy2KjdHGt16ApzZLcpoe+zhdeksal5/pnr6I+TcQRsTCklK2ct7oVvoeflkq0l5cL
         OzQ85Dgs6+w3/9mQwalx+mc491efpiATwmjfct78qe7gA0CFA1q0ZOlQaauNpMBQp7K+
         Oj9dj5lmjukGVHglA8CHXKMpdD0XmZfI29qoy+pGOEslgCu8USE8/FRmf/FYwZFW+3Vc
         3h2a90My3w4IF2oP5UJKDZDIv+ULOx6KAwmIhCIW773jtJliQNO3c/GGW3MCixqqmSK9
         2Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268856; x=1794873656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=HNXwwWSZbDDtxql6qY7q+e2tHTihDTgxxtfSKn4LgTfDar7sR6zqrg4bXbYpxYmjX+
         +p6xGKecqpjvtlSkKjWc+Odq7+ipwkEbyHRA51KIyzvuhy6m08NoYlSaleoAwqe37s+m
         8IPkEd6zzrVORJCTQ4UJ0vJlf2WQuHr327z7E7yj0cE/RC6lC8+HbrMSqwBGMoybSwng
         ALlRkwpLO0IoQWKpi2lSwoJocUo2KOpBk5J3zIJ2h/DI7dnEvPZcEZKy/QLP/cwzeu9e
         0HD1tbXWj2LE+w8ySMl4XWTW2CSKQPcK0Oe91gh0CignqXQJSIN6+imLJcIZlb8m0owx
         +Epg==
X-Gm-Message-State: APuU4Z9GqfxzTllu+A5LFcamZZS0I2zaCCl8RTGsSwAhqYyWHArgPy7Y
	AQt1AK6L01BsdYarunzeTOEz56//zqNZLfGEM+OnZPvDLhU58nkIQXZjUfeye4WntCA=
X-Gm-Gg: AYBFou1qU4sskfYhVqGK6OYX7cVEWExpOY36xdGUrByBwLCQjVQ92URN/z89byxA6SQ
	u0lHxthhz0KBLtoD5MS4a+InM01Zmx+AVRcK9YApQoqHel6uSaIpHpZmx58fyIGORQAPfZYa4RS
	zr3CGfz87rZDM2dmkTAeZVRTSB6exOuP16dxqLxMbibC9k7xAebstQMvH1AZfo4R17hrjBk0aKr
	uK2bARqh+jtqf4NSqT0tgIH0ouVADnnL4E7HbEWKJmiKpXhBQToALSEYMVQFpAokbVAjfI+ppLB
	GnOOOmARj5n9UwSk6D7WIcS9gybI3qvoKfZHrN4t1g1xZc0h9l97GhFBVVDy6N3Y7l2GdA2cAcR
	txgjQQNKop8VmUxgjHmaijuUnf9XHejgO6GkZYhydV+yQwOZXOCh4PcdbYQJW0HrRF+RJfRv07k
	IgtL07GqfRi3s78vHbqXAcaSiTvVEFuoF3eOB3pBNJ8gw13KJFmHsdSLt2FMTlsX21l2UntZWZt
	B4RcWqCPWR0U3vPVoHTGNnP7YMqkzE2uMSHzt0M5LVTPXszU/k61dr3MQKeEGHZ2tB//hA/J1mS
	kdpYIP7zxlqrCL7lB3J/vnqI2che0xJ5C6T1e8U=
X-Received: by 2002:adf:f391:0:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4982f2b5ce0mr1045706f8f.21.1794268855287;
        Mon, 09 Nov 2026 16:00:55 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm1882531f8f.42.2026.11.09.16.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:00:53 -0800 (PST)
Message-ID: <5d775896-5c7e-4830-862e-a9b02b840177@linaro.org>
Date: Tue, 10 Nov 2026 00:00:53 +0000
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
Subject: Re: [PATCH 2/8] media: qcom: camss: Add SM8150 support
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Right, well please review patches on-list before sending duplicates.

https://lore.kernel.org/linux-media/20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev/

---
bod
