Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34537756F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812630; cv=none; b=fZcsws5HqJQ/5n2aZRzaMl3j9bMKopqcAjTMcE1Aipw9Pg0p3erozrAH5Mmc32nOLKu/JbS78RrozXmqlUo+DDrL6er1xuZvWt2mNTMrkQUmAdqe3ugSRUo3tuzZl4u0VdOwbwaUvBIHNfXOKAHlk0w28wgBn4Lt1WrM4wGmcwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812630; c=relaxed/simple;
	bh=klYpvtSOAIez44kpWs1v0eOeO3eNpRfwfPOMbeNagbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPO/cyu7IcHWZ+eGjxM5y6YYQjJsRWmEYGWX5WjoByNt9Kgv+GgN85PVtcL7tvWJjZJLzMJ7aKHthEuOcA0Ypo3by4ugMna72gPq+HNQPdTLu+pc/41Uq5GvK2yuvoSOQrDZ1k4QDoDGOE0hSqHXgA9nbHWz0CkinIXzB7inpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svmyrrrU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svmyrrrU"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so234025366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812627; x=1792417427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=svmyrrrUo3IBwVUrHUz5XOIRL6IR4SKFPpuJiXCQocCfRp2ykDDOQxpdLn/6csAZs8
         3snMICySepg7Usag21gkcq/lEWG8CPCQlQKbk5r/PrfRCCsMSTSsiSGolqAVdL5fw94b
         eG3p8KkwqSZ8eEVJ6epsxq/tKief/HN6hotKiG7uZxZTnNtzDC6VVK3NCl0VOe5CqwnC
         ZdQlUDrkS4T2A9sCLQzuQ4qWKGEBMUER16VTe5AzukvKY1579jmyIzZCzbHKWCof+6gF
         xodnr6RguTZtOfamTlgIjp/Aiy641NmtRcW5rm+TKnXFYGQ74sVJBVFPXfSrCwz3zjIq
         T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812627; x=1792417427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=YM3JtQ8r3kwkD0lj46f4i/WV4SIUDXZ2Q0xuIkgKLU5Fg7RL54eIZTiUZFD1tF3It6
         YHAa0ZU9EB2wbivTznio3crqqclQ4TCaVwmaPj5NRiEzwWyJQr+hEwYqX7E1cONMzDfs
         kjXq3vjlkUGT/QVFVvd0iGDFqZG408O49Cnw7+VIt5FfwaoFR2x1LrIsb71EG7OJcf1X
         g5XO/rZMabz1nSzMwGSWPbGztyh3Jfw5IQQnPO4LItOeCs7F0Gq6L8VV1h8XfeHTtf7E
         LK81zZb/izJ5yy58d5s38L1F3s6Gil4Ax5eKzKJVqyiDfoQw/MInhmWentx7Roym6Tsn
         w6hA==
X-Forwarded-Encrypted: i=1; AKwUvBwDz51JKLNjrfC2IDuvQIj6MfeeFpTwqnECS1vzL687K/Yr8zIKrT7U2daA63XGsR114LNsdl7PZjtvJtp9@vger.kernel.org
X-Gm-Message-State: AFq9FYLGsMVsZig0fkL6srojZkWw77gLea1gT/GXUXXWPUse7s8sydeH
	deX7debAh+fROvJpptJazZ99CNnVvQec6xv0jDIHofaaCgLgaZjMl0nYAoAyrHFtZmg=
X-Gm-Gg: AYBFou2RTBBHbAmA2PKz3vICpaAtdShhgGrrCsflUUUPNlt3Cg5X9uOhNd4+lj3unIu
	fvrbOFufchZPZ//X/6qbong6Y5Zh9c1fei3sIkvPUAhBiexhT724IAQ9M/jmkV24DKG0qUJiOrQ
	M3OOi7Hmt3gkHS6GrqXIO46Zzp50b8gkDiWLwXngYf/lEqmiYmBmMG/N+4JsyhrMusWXwJPSb53
	f7ZPNB1K6vR+PDNbhaSnLNZEI6cN7NvxwBxD8LgeuFre9MxGnWzNr4yUNM4wOr+VOuitf/IU15o
	Bqk2G9DMf1SoMZkk9UnRuBT3Xlbi/odBCocsf/YHpjjzqcIR0MJ5Sk+Ji/HgTQ4fagZz5hr6/SZ
	4F65YrT1ED0zWVRsa6Hn4slPIy+T5lne5IePXtBlRhGprH1pr2sqs9VTY6BnfzphRrTexU4lSMc
	O3ke0w1ve8dw9jpTxr38CpgggGaHglSSapPWHJZkYxVlmilNoX+QMkFoPAzX88Cr3leZz7i49cx
	rjLQInGZiMEIHJORl/YDKI=
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr897992966b.21.1791812627292;
        Mon, 12 Oct 2026 06:43:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3456933dd1sm168189366b.50.2026.10.12.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:43:45 -0700 (PDT)
Message-ID: <4ba1f9b2-c300-4942-b686-4bd690c57418@linaro.org>
Date: Mon, 12 Oct 2026 14:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs.
> Allow their register regions as optional trailing entries.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index 4b9ab1352e91..05101dc97711 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -17,7 +17,8 @@ properties:
>       const: qcom,sm8550-camss
>   
>     reg:
> -    maxItems: 19
> +    minItems: 19
> +    maxItems: 22
>   
>     reg-names:
>       items:
> @@ -40,6 +41,10 @@ properties:
>         - const: vfe2
>         - const: vfe_lite0
>         - const: vfe_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +    minItems: 19
>   
>     clocks:
>       maxItems: 36
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
