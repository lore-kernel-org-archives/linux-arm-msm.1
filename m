Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622518;
	b=RF2FR26mPaWCc5U7yk4wkkeMCwHDBpquzkgAnEJtBYPvVmLnQKDQBjMMPbWdW1wms1i6
	 xyjUG3wmYuxDZ6ogqKD3/FwmFdwua+Wy3FprloBWL4vO7vFe+5wxa3jyCTSKCUhlSFsuR
	 TNwB9lg6YfDSbyjMV6C1LDOJ695DvJp7otDnLdN0RWeqgB18ddH9Yj1dSjxDY3+oc43PA
	 egIqHhQznwaVJmjcA83mNQQmIQgDyNvQ5YFkesJcxxNLXoqOPTsaX82w7rTR6WlCT7Xso
	 KGkyaicw8SevYojQVvPoOFyasOSnPFtygPPuvPZwGov94Kioxz6N5BBIfo6G5n2fuNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
	b=0+C+N47VUTWYIMGT5/yOiCEgZWYord+jwvnSZQ5A4NHXP05uPlJ68GSWD3OUW1ZuBZsx
	 yZn1hd9KdaF3vCiJBByxiqjoDbUT+0gTvcEPXTvUGenBYvIeaApg6UdsG6QE2sOMpJikY
	 4Zp2guvnfADYmT3qtbD2TRQ/DXPJvBbpdylSWJAK1EyDmxLZvjXBXeO9TcknsZUAt3e4B
	 rxtIqMPWZPtKczAMG3a8LjyWTYWnd2YsO9gAQagsnERGe5BkHjMKZ0zhsU0VhVUmLyBer
	 /kT0FhDmWIax8Wja9cEfBuNpQCckuG0ZDpZmRVpkxWNt02bA7Rj8fDRE0BWF5FYF7gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fbcyOIkU;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7709606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7709606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fbcyOIkU
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso4223419a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793622516; x=1794227316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
        b=fbcyOIkUCz0TGl1DajcSVL74qDJ8dEfsmuoLiH2eVZ7u7Q5DIgP0CL1WHMYVnRFtn6
         wX1ySB8VCnR+BQBPNPNeX5MOi9aQ6RD4iKkmB81GPjJqqx8TGjJGCkMaA+P9xmkmB+6Z
         xuOIWXP04IimooIF50ZrsBxN0SxP0qxl88z7wFBXKaj6QK0KEy8/eT6Iv1uVZag3xPju
         b/Kubb4a/THgn/wwAuJZqo/iB1dztxp9qvJB0um3EZHQkfKi5wJLS/VdJy6faXzoFK2M
         2gZL9uwJTYJZlo+RKFkPDeX4yg2TP60XLUaFeegqjTykCtFwvK5B+D0Yu3SUTYaPv2Kp
         7sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622516; x=1794227316;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
        b=Tn7ObynTs9il2WKfGbxlYfhV/6DxNIjGe0F13I+euRRCCIa2eGiJEBSCcpJRyAyySf
         2oERbfRfxCCI8WPp8f6xXDFo8xkr9v3DH7SawbJmzH98tfind6ge9qSek968b/93a0oq
         TRvFCaPETrLinN7Zsv/J7ouSKabbiEeya1D3AEA/OCVWsqnF1307r7ytooitq/t1HCZy
         eac2xS8S3EKgojYH/PLh5lrEnS4UBcFwB27NAUnCYfr+cDohYHQBluXqF+8pbuCW3BG3
         r5fMWIywn84kY+PPJRYLMmS9nl7h0r5be13Cc2GXQ7tr4qcPLL3ZAHd5oX95b92fYq5Q
         2LTA==
X-Forwarded-Encrypted: i=1; AKwUvBy54FdnuVIqvAEBO6YIh55W5MtZawQlupCW9scVsYUWLWRGozzecAR3JUZIcdcV2w81YLcc7EKvazK5mC+f@vger.kernel.org
X-Gm-Message-State: APuU4Z8gZHEMjXy3GcY8q1HDna3yTQ/I3Za8smuJLMaKhYCC7GWmU8UH
	xUKkmgHffb1HZVAuJWysgSiDP2LsYswNKDHRICTKBGu08wQ9Mln12WZU5ee9CyKLeWc=
X-Gm-Gg: AYBFou3S2HWXSAifEj4X877xCEM0SdUwAPOgr/sBlvXQLH6N7gnVmlvwPxj3Ilo1UQW
	9VgIB9ARkRfUyFzd9QldybrBRBbSFOnRSnstGftdrEexiLMSUt4aAa77DxcfppxZp3FjN9al6y9
	GF0trkz1amKrddAjy6A3Fm/TDyE0h+D2t+xlyoJ4ozGggRhlE3ajh/FBN3rmidYUzc1QrbA/Wv+
	+QLsEAKbj6wb8qf+oZCZCoUu/JOMnzoj/Cu2xBSriA1BZdiz4/VgRmhs1xj6i2t9UOhh+nKOjHu
	walNQraSWm3Frs4UHhIf80FKfIJ1H3QGmzrAjzTL0I8lZq57Ux22NontydrIyWvzNSlDUZfvxhb
	vZBZpCjRi9AfTGNypqYiuabzU0PDr5CJqQU30HQbBESyHlBecjb2gW2HYSD3X+3p7N+pdpCgU4P
	GNgjdcWquxtnHtR8bkl5L9ISlAk4FyFykwUEW2bqHXzhMrq/2kDcCf1pxNBWCvd+f3BzYUjRm6s
	GXCLmq1vTPKKe2n6x/e5cTFySJJTa/d9FvPq1jJTQEqbM1SfnfWFZhjE+ZW0OlQZABKAPsMKpA5
	LzSBtNw5JVZ1E3rV9qSrs3qk+72CaOTdlTyltA==
X-Received: by 2002:a05:6402:11d3:b0:6af:dc4c:5f28 with SMTP id 4fb4d7f45d1cf-6b4d4f71386mr7121197a12.37.1793622516124;
        Mon, 02 Nov 2026 04:28:36 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eebb0sm3172063a12.8.2026.11.02.04.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:28:35 -0800 (PST)
Message-ID: <b59981c1-e98b-4c20-8e12-2c5298c0cad3@linaro.org>
Date: Mon, 2 Nov 2026 12:28:34 +0000
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
Subject: Re: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not
 described
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 11:21, Vladimir Zapolskiy wrote:
> -	for (i = 0; i < camss->res->tpg_num; i++) {
> +	for (i = 0; camss->tpg && i < camss->res->tpg_num; i++) {

this change is OK.

>   		for (j = 0; j < camss->res->csid_num; j++) {
>   			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
>   						    MSM_TPG_PAD_SRC,
> @@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss->csiphy)
>   		return -ENOMEM;
>   
> -	if (camss->res->tpg_num > 0) {
> +	/* TPG register spaces may be not described in old device trees */
> +	if (camss->res->tpg_num > 0 &&
> +	    platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					 camss->res->tpg_res[0].reg[0])) {
>   		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
>   					  sizeof(*camss->tpg), GFP_KERNEL);
>   		if (!camss->tpg)

This seems reasonable too.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
