Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7D3AF677
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332445; cv=none; b=KToHFp3vVw8G7MynrE6hOI/AqDAh1Ge+jicoYqV7lT/UmP9bmG+ILHJk3CR5FFQ0DQLbNJrHPj6+COOmmzE3jr71l9jQsAAGfLWc0rriwh5Q4WLBtn3rdO1E/SXYvmHAZMWGLed4cJ8kg2pPiqoN872MbOPMC+V+dPypiTZR9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332445; c=relaxed/simple;
	bh=cRWNjKmduoK//U7tqDYvdW8Fw47BsRRlQaOBQhBhOfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rx6YBd/N4Joax//1AytXClThymAJICgu2v+22EG+PhYJr8lQOBX58OvtWb1aJ7C4MNmZZdHGA54bD2b4zH23z7+K4dBxw1nNdbUDRV6+6Qubl/UtBDJyUukMWIO57nG8usuTZ/lsvQ+4ONxc7eWQ0xDhcnVdURhfnBi890cInQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1UxLoY9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1UxLoY9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso5614798a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783332442; x=1783937242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UGN+tInxm7YHzGqwLdDJ1bWYCbBBGU54xQmERlMD08=;
        b=X1UxLoY9KDlDjt1y1R5kEZDF4V/rRkfJmQquq5271XE9EwHP32ww6JOrwjQDoOKfVT
         qnXjmNEhgL9eWPLX62XCD04i9N3VtrvgvBaHoT2ozZcKF+59IVeQXfy2wKSvR5O0rMVb
         43q2NVVvk9l4gqe5Og0cLHhbX3qlp0JRnQe4F2O3baDtvU1/c9VzW+3nDPiWsq4PwgGy
         8Dnk5tyTUl+EDyF/QaI6Fx1cgBxA7egkFaGUYBQITPdX+t6CLqxBlJMELiaRGDSZWPXY
         D15L5bQasIFmeSZGG89S3XRgGpQtGwhhoo0/0Lep19d+NyPaWgYu8+e0EBMDkXl97u6q
         WaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332442; x=1783937242;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UGN+tInxm7YHzGqwLdDJ1bWYCbBBGU54xQmERlMD08=;
        b=Q/joqSwKhoU0l5jZ0k6NibbFkgX/uxc6lu8SXXGUz0GvRbLNkoRjPpC2ES3N3QY7vJ
         4g9sKA13mSPWKmp6oYzaIqdQX6zCAVCTMZxiseEwYQ91EGVV0fD8BwUlldnDiw9zZj1v
         t/3CQ7S5voeBv277dEBqMCdWhS+jB3mb8roEvOxXKo3QrgInjSJhJuZFI3wgeDkay71j
         os9K7v+Hr+dMMR4mCAezwVsfpqh68X6dJu0bbVXiQQ77yz8C1aDEFoqjoj0UvxnM/DDy
         XykiWeUnmUFqK36ELVj9DUt33pQBBKvpNUUcgquTAHqZaISayMZJEIgSe9l/I5UjW6b/
         58Ew==
X-Forwarded-Encrypted: i=1; AHgh+RoftTA5c7Re0JxoCBF/Fq8XwRQPmTPu29cNanEx1qTngFFWQm3L8xZI6BjqJi8RzIsC77p3oQveGuSqM/2W@vger.kernel.org
X-Gm-Message-State: AOJu0YymxIowccge2ufXiwTY5dUxqRU2sa0YXe/I2s+vPc+fK0BeXzuE
	0TXCNN3BsoR85rwi6ploze8y8W40MBKb/keMNdOsDKFK/TFGzljGq4XJkzkuBxd2p+4=
X-Gm-Gg: AfdE7cm87b/98fwuMCeTvg98oCNlqGRQrDSwmnyB87/RRPt42AvMKAmH7ZMW4OgQrg5
	uNK0VrkbgFIjQJTzAl0IdBEPM8yrSSpTJE48a/3M40qxgBSRhCr6gVCkTaMLKu5VSWZCLoQ1Oom
	5dH549O0JB8Qdn5iZb7e1aS0zwyQ2lXHglSoBzSDmIf7UeX3r3ZpXikRL0SJYpWqXSfRT4PjPu2
	3nbbiJhkqTrF++HsEB4FCiQq1rPHptfqaQZXki64YzIu5acDg+h41P7zJzIjZECW5YX6tWCgfwg
	XQ5tIidngY2Vi3yiN0YQh6g33rq5oss0eSe6yFyIFYdRSgnujbNlx2ObNkg3oRYLJPAWJQHdCka
	0o2gpZ3br6IBtAvkKBMbv3iXZ2pWs54W7rQute+ISKpW7JErH0BhMrCRCO1h/7GluCSLfO5jr6d
	ZDs/Swr5KgcWBQGsKYaVI9LdjlDg==
X-Received: by 2002:a17:906:fe02:b0:beb:8c28:254 with SMTP id a640c23a62f3a-c12e66259a7mr358483366b.0.1783332441744;
        Mon, 06 Jul 2026 03:07:21 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c552esm710202766b.49.2026.07.06.03.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:07:21 -0700 (PDT)
Message-ID: <b7c335fc-4a53-437d-824e-63f7ad6dd06f@linaro.org>
Date: Mon, 6 Jul 2026 11:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG
 encoder child node
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
> to act as a bus for child IP blocks such as the JPEG encoder. Add these
> properties to the binding so that dtbs_check does not reject them.
> 
> Use unevaluatedProperties: false instead of additionalProperties: false
> so that child nodes are validated against their own schema (matched by
> compatible) without requiring the parent binding to enumerate each child
> type explicitly. This is the correct approach for a bus-like container
> node and avoids updating the camss binding for every new child device
> added in the future.
> 
> No functional change.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4a..6008938ee369 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -102,6 +102,14 @@ properties:
>         - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>         - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
>   
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -317,7 +325,7 @@ required:
>     - vdda-phy-supply
>     - vdda-pll-supply
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
