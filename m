Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616481;
	b=C0NRU77i8z2anvcXnoWuAsCUvL8i7JmjKwCyruOOqQPG1ikCPyq+Dquvk/whxUGMDC3S
	 NVLokLqGXapE9zgwXOKLOg63S5lToUcsGiX2kXw21aibbVdtnxQ7jtz9XK25DrAGn87Ci
	 a7v+mZ7p76gnfXebmMwUTHSzzRxv+a977vSqIUbUgpQA2XLtZZivM0aCTOfJEeckvPczf
	 7iUdFpJ2aDhSqldR48+ZG/Kduj4qOozkfZqsZ4sCD+qmLUTCAMZx0IFuQF8ZgUMQ3WIL0
	 7kAOvt/78Ymeof1ZDZzARK1n4GEuLxEPuh4fYb3TiDGMCE2qWqyqI7476KAfEmpLk5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
	b=KbkwR9yzu0RoHOff+7KDIJioAqt2CsQB7e7l90Gf9V3+1imqIA4iX0Jso+gvudLWV8FD
	 kJn66fwvzpoSejXiay+G9mefq+TqXFjQDvbOAOQ8e12nsm0mv4WLMxCsL8rxQp5ga26DI
	 zyn+vC+ZxpLKn8TRw3b54sgRZQK5xzzLzKn2o5IImXowQABC0nM5qo4CzLjPNvfE/VTog
	 NdJRufGmOidR7AiAREaqE3bGhj8F3O5mnQMNNMFaNh5KlGtAI3tzyxXMo4Z7Pe1BZaC0Y
	 piOCYOq3sngRSGwrJJ3GMsQKs/tzWBTGNPBz9EcgphdeUpZeqTe4cImDtQFfvcoQRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E846606A33A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 14:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E846606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4149721fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616479; x=1796221279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=ZP4cszJXmUZlMGJtbZ8PlmAsjUZ6rzmMVf8KPM3mYZ3Ns9WTxIMJQFQ7gtv10yYVG4
         0CgaUMFucTfAEE1Z4x4SfeIuKqa+CwB0FrnIcJXHvuoyNam+aUvUnr0KvwPsaVr6jMon
         Vlj2PwIRSIOSXGX8j4rWov2YJUxkCnEz5ccDZGiL5SIXVD0qq8U0mX2CFCaGlMRXYiGn
         FsxDARH41XcEj/7c1tAsIlU4D+CpX0lyDuht4nfDjc+6TDwfa1eAazA+yBsoEIMjPdNg
         bQAZYuKxqdpjQJpGRMg5n/uJIGq3fKGuH5GgqD7KJEyg9c/meRTlLh+beVP0lZQ+8LC8
         fzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616479; x=1796221279;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=sixXw0BkjjfcvTjJIe0TrtzjUBCscM0ZWpkzfeMLSSDumD68mdnb95b/JCbNzQoOGm
         uUUAQOunjcpiVnXTbJ/CaLH66EiQZe+I7uB4Vq6x+72zJhCeQVRpUt7w7mAvweZAHRoA
         dOWBNfvlES13BxZms3wl1obgeF3NNQ39IEuS4ABfkF3Sj1Kf0SsLetIjqTtX2c3Te4Ii
         H9UqVbmlD80kDMMPiUfyIcdG1W9hvfRljYcKugL9tQ7swupz2hEiqDl45knRVwR6NFBW
         gzM2ldV7woAIxADq+/2N6MKfHX5oyRvGQ2LvmvgN6SXIkIg+HqsCU5YpIVuwxvxOvw1/
         j5/Q==
X-Gm-Message-State: APuU4Z81H3yLye0W4MjCKYvzCvCVoytFVQ99YML67ZFU1tAqsZoG+ggp
	CnJWjNuwt7d/+eCeQg/CckDo36j7VNlsomcgvTD+dv/TJaCuhcUbV626KKKJ419g/Z0=
X-Gm-Gg: AZFdTZeakYM2UOlEPEp7l3JoIri+fvmDZqIsniGNtWbZ09qXejJHY0LeFYYN2JmDOlo
	vrPyRP7BZV0Gs0VZ4dRfJTx+QuS/yzizOi2/EXSg8nktbt/WUwXpojVVJnWdQzqPnuyj4h5+ae8
	Y8R74jqk72ZOB1cng6Njan7mUUxEZnPn7zacdP316M8eYdltT9PVd8Hdf2WQFoza4kUMxBFlnEv
	YKtMeHl2mLge8cEGUfQHtn+ec5Q64smIpJGvO3Tb3WIz4eQk9h7WMv8pL5O3/9r+BOda87Bv0wc
	fcwITriRSfWqgAJUtjlHdqoeqr82wUyYoUYabfJaaO+xE388mp3+nkpmhLAabCB1IoM0vSejJPK
	+OYAY0AlJ0/sDvNLjEWUJVhBA61HhkUs2jKPH6+9zacHzdU21Xvu+s4sY2x/LK7IV22HfruzkNg
	+5eQ/R8q3IHdRbdsbbAYnILlDmNotnbuITxl7+ghTv9xh/PV2rnKJqBs+Wq7tZhLZWdmfxIOt4a
	poQrnpSM0ClkBuHxj/vZRHIIAvGk93UFtdnS3eoOwLfWUNn6DOH+CCAz7IvkoeSDcNJA7FuCbTl
	XOXSf6ftKMnlCERQZ/vLxRveEHl8r6uhIG7qQIuaiCX4nFIBIl7Wwt88TuAGzbvxEVDEn6h6629
	DWlLpD0gFTaLLNZ9f828swzCXM24z
X-Received: by 2002:a05:6512:31d5:b0:5bf:f87e:3d25 with SMTP id 2adb3069b0e04-5c1bc6b22b3mr6618657e87.2.1795616479393;
        Wed, 25 Nov 2026 06:21:19 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171c7sm4541303e87.31.2026.11.25.06.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:21:18 -0800 (PST)
Message-ID: <aa0a99e8-1c49-4417-9a1a-8653cfb3585f@linaro.org>
Date: Wed, 25 Nov 2026 16:21:18 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
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
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
