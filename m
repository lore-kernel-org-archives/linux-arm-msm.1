Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613321;
	b=mX9pQwOeI5/aCzf/w6txjRrV+d0ntHUoHhG5EuAIxjTw/bYTixiq5Z5/bF6KpcsnaHRa
	 LtxN/tqX3LtqQstv7vnG3D8AQxeoo1BNW8Kqx8XX4CeDJKlxY5TuPBeVx21qTV5o4Y95U
	 JlkUviyIyfyb5YFvj9JO3KbZbSWE0ns5wncVcPYf0hnrJ5vMOIzRqSD4vXdSl0tfMGcpo
	 4SzctN2gCrbBRy5QBOlSdcHwvn56i2kIQEGkDfRqJbPRk78jU1ZpcFatDhxd1EfhIkP83
	 h2VX4I8h9n1YrPTlGmjcqee/k4/IzCIKPo4tbGcdESBQ+a7q6HxRPdghPI78NZyr0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
	b=V9Xf1c6GFhiD7n07cQEIftDExtuSke7hTLOxmMyH76PlIDGCIyAWyubma5rQQVM8ucTa
	 fRHHrLMQ9qyXx8E5s7dD3bRbUZZ66FWm6YnlfOLZnu/z18MqLBN6+s2RaP1BcxXY2/D0A
	 JB7sQj4B/IX+NzedDg4Lna1o9gbO9Qzqxkp3V5zimlyQ74nLTxlTBt9BIrlZE8+jNAGhy
	 cmbpcrvCdHpikpkSq1HuoPkt0ISeeX6coeGwkEh+q/TKLH4I55hUH1HcGcpzm5yZlGRAi
	 qVAm+B356R86M5UIiLfYCbyfzESGGon7Jjy9lpcYVIiH+PI4w6DuupRHsO0U7NqT8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB33606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4069001fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795613319; x=1796218119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=Lc98iv8nhLEW6JdTzd/vHJpSezeDJHH6M/66PZ1oXpIor2ipcSI2kOuCTfZkI3fQLA
         ZGHKgfCKDJwOdC4Hs8i9o0Fn5riETmKP8hc+edIRV6EUGqW3cBmEuA77uoWleYlzLIXd
         b7iR50U/1vohH/C6Yj+7N6aTLNBvKvLLKI8mekY770Gs/3Z8IOH41zI1+2qjOzAIsb8O
         N+6RdLiQvvPVU+0p9Y5sLoDSUZgZTjJc+9H3sph8aQyVaiSurPMSS9ncOiAy3PL/ts67
         bncGENx5GHzrxq+3rVTNmlKUWUTclbJ+VOpsyi1P4MhOFI+fQs0oJ3HYa8O52Qoi36IJ
         IX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613319; x=1796218119;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=V4+ak+TH44cmESuXenpEDWCOECcqm0jbEOwgom6P6AEzHztG4SFDLflXwFl3/dIr08
         sLhWIzphnx3U19jFBTveeId0BJ7Y+PrYQ/j+0DWMFlRUuz+Q2/kostRv1dJLeCztuaC8
         pkuQVqGcC3U+0ryxD80kstui6EhEUdZtYbUIit9PwimwYqE4PTzp84G22BdO9F0KpDKD
         iaxdJgy6HLxbW2RIIJP6iDXb0TBvIowNKbILAWVK6OQV7myGb4DKPF735LQYiDakqsRh
         zOOfKyootQkvOdRaZdnmYa3EuGzvB7W6fwbAJF2LGeZ+NXSLxPa/aMUF8HUBVIFkT4oA
         orUg==
X-Gm-Message-State: APuU4Z9zQErtADMsQZTapAYAoT+ilbi+EKLLDi3LtBcKbfETZE+rsgW1
	zCt2mGb/74YMttZs0CENDLOQHJU9rCPffntaO3IjfI7brnzUIlO31ltDpUn7/cDLcGQ=
X-Gm-Gg: AZFdTZcAUq1oFzxiN/KvJMByO7FuWRtgFgqvzf00oFzp3zIzfqnCJuIAXlG0nf+uL1h
	0KRClTm6eTg0B2/bOKlYxMLKZP+dbABTYYQp3UOvDrzUTeJpOR4FDU3QloBpW2uFGV+b4cdpB6N
	dTFhKx2WQ2H737ZPWT59KkjbsyjFF1LvUGocEnUKhfkuDV1mh4uMSn31YNyh9hNRBwArG/QlmP0
	yyS7SHax7wz3jP2nQe+AYDRKT+w+TOV4OR0Tn9hk2jecVd4QjTWoa8VekDNgBpBXgF4wOEkYYfR
	wtOS+rS4ClKkO+6CPZ3vV9neKZZCCi+dl7dfuUDWe8lpCAgvv8U0vOhMS8n2bnLsEOn5nfGmL6J
	b+AthtpY3mYqGOt53RApdEW3UDTnYNjlbzCAl+VRMZb6m/iv0qxB6xzKiYn0Nqm7ONHupk8OEi3
	MW4bV2o55KD0Y7jEwFDTt9acBS15roswTo39FbErwIfxMUUX2t9aiBERmvft/i1h4ukeyF0qhSM
	N3PDi02zJdrYexLM7sAAs0pCULB0Xygd5bUx9j1B39S5hDX2lHOEmVN5DjboQ2lgjMeMVhIhyWt
	yI5RGJm4bubFFjr6vpF+829MXKQ8dCEBT2T00dMeSMaUp1rPnYYB8YDxMyal/vJAAJSMUBTflqz
	p0nsMQ3g=
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id 2adb3069b0e04-5c1bc57989bmr6590468e87.0.1795613319090;
        Wed, 25 Nov 2026 05:28:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf333bcsm4683145e87.2.2026.11.25.05.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:28:38 -0800 (PST)
Message-ID: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Date: Wed, 25 Nov 2026 15:28:37 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.

This sounds like the DT binding documentation shall be fixed instead.

It makes no sense to add a large number of new compatibles to the driver
code.

> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

-- 
Best wishes,
Vladimir
