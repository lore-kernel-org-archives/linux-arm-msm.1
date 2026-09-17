Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F764EA396
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648347; cv=none; b=rPvqRKQakS5yKhtnCAX5wwi0vgVb67Bfjzjiw7CeeO7yOAdOlyrFAjsSZkwMmQBkyUGwe2GhECTSXyVMx0h3fk2CNmMPmWAIVAN0/qtjfR/UnQM0ijAkVgIWlBh5DDMnIu01txD0mRlteqhLGZ8f2OlTgQwnWB2ypts226DJpiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648347; c=relaxed/simple;
	bh=Qg3ycRE3g7Zuot2l+xy8keoBLqLf95K4w8+HOE2tBYI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G6eVcvDzQKoUHyRCuHscTmdQ8pAD/dAlPbresimKH2FkrBMxLle+bmPmbMz9KM7vRbjiKAEMirmSXUa/PLNycTT3nRbdkFHJDpHY/5K/tlqe2s9DHVeq6D6l8SMJdCCRCrqvnur0SZWhP/DEZha5IteBjiqIV3zYQRwg7y3vyq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNiBXomo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNiBXomo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2344165e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789648334; x=1790253134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deDx8R0dQpJzll1o6lTznXoeUspJT2P/GlxcRpRgrb4=;
        b=kNiBXomoohUg+1rIHPjm24uYJ2o8L17JmVFA+/y3A6oJAC6Fm4J/NdH7rktWRdd5E3
         s77upXsTSNSknh9Hh8SDxGBhYJF8oMx8H6DBKzmKmBG+k9iDv5CPRblzITjPImUqGk34
         Q9kxlgK1FhzX6U2SlagVO++yT0nWwvms0fWkYr2eizXpTS7+/3y0lcLTAn5SqU1Djyvs
         NJ4ydM69F+zDkE44kg23MKpSMb0fyjTUwgPNxxlqKQ8Z61mWdXwrIrdIBKUPMpuShWqF
         fIZ9xCny4K3pQNnv54kVUCaGRgT/lHLOJ2E/j91HPu9dvfUJgC2r5y9PGAn+azKnWqb4
         Rycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648334; x=1790253134;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=deDx8R0dQpJzll1o6lTznXoeUspJT2P/GlxcRpRgrb4=;
        b=GJXWX75UdDu21UrIb1c4RwvAe3shm+Xg9VVN17wZYt0YxPTBZEyNVDM0vltvvLS4SL
         zbfTqAswk1aKlrSlGvAnzsQ+QWtAjbnsfNTSGOhoiCiveLfZzBisEFa83LCJHIcRU/cZ
         J+oGHu736ai341Y54FcEckVBquNHm4KcFvChu/nqVdb0aR3Zh0meCIGaAZxsgeQvIz68
         PsYK2gw02CHPDG8TqdbEpyQQsWXf4xRPe1HCKvLhm/PpWtllh+B7fgag0DSclRFxFaTj
         RDNd2WG3nNoSJNt6k35s53r26z+TMLbQcw6/RzmRRFM4qcSVvAGEf+lJg69JiyIe/GPy
         rNvg==
X-Gm-Message-State: AFuF++mE4hvVGOvNr51zlAT6NvJTyC6sFU4+nK13CYeclU6eAA9LIoas
	+kg/mC77DyrvAdy1W4vZvZwhQS1L/idZphz9iTizewt2pPJoW13P/mtTxFJWoWCpBG4=
X-Gm-Gg: AYBFou2KEH0o5o+zUtvcEFGjC9bmNvvMFMwWw+IyRI8IFOh+gf2PHCQWud9B+UG22Z3
	CwdcRYl3gXMhdfzv1gBdyG8q2Mkp39icKyBSt0jhca/6APYp7Xw0wJwZXob59PJsqX70Y9+m8Nd
	2MWf1WoFBLar4yDCd6wK4dUgNdmDz3ysVlRTK4sCf/2G1bipqDbgBzCSdKJmB69iV6dQCboyhky
	2mXY3sqFEN26TOVklSKc/4pOTWCo4Mf4Wd7bjWAa46BQRZgn0OdsN+SW4Pyqn99uVXFufYpDdP3
	trvZwr/TraewEZhg+egsyKw6xT/GYTGAY9VbFnnrXcwW3IRyDSLANnvtuzgfYlnd8JylFEo1jNJ
	OhbVdjYRTGqrCUsvEQpCO3Rsk1H//KE7/8CebQyNhRriiZiwUffqpbVKB3BNMvvqpfu7xhxeThW
	KE6VD3uhRdNDm7FP7gzzjyPqu2sEVRGy6a/acLaCEtINlSSg+0GAtqFGnSysIL0aKHUDOZp7aT1
	U/eBwqZrotj2GjY2T2wgYBxFnoDH125xXdQj6Iogmbs7bYGjTgxgSwKTxiBNBFlHQ==
X-Received: by 2002:a05:600c:1554:b0:49f:c1fd:60e1 with SMTP id 5b1f17b1804b1-49fc1fd60e5mr11744815e9.15.1789648333763;
        Thu, 17 Sep 2026 05:32:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9? ([2a01:e0a:106d:1080:b5f0:971e:8fd2:f1c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd225898sm78339095e9.9.2026.09.17.05.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:13 -0700 (PDT)
Message-ID: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Date: Thu, 17 Sep 2026 14:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 13:07, Bryan O'Donoghue wrote:
> Add a devm variant of phy_get_by_of_node() to allow for the familiar
> pattern of having devres automatically release resources on the driver's
> exit path.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/phy/phy-core.c  | 36 +++++++++++++++++++++++++++++++++++-
>   include/linux/phy/phy.h |  7 +++++++
>   2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 490a7cde6d40a..10e9323566803 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -833,7 +833,7 @@ struct phy *phy_get(struct device *dev, const char *string)
>   
>   	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
>   	if (!link)
> -		dev_dbg(dev, "failed to create device link to %s\n",
> +		dev_err(dev, "failed to create device link to %s\n",
>   			dev_name(phy->dev.parent));

This change belongs in another patch.

Neil>
>   out_unlock:
> @@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>   }
>   EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>   
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns phy associated with the device_node or ERR_PTR. devres manages
> + * releasing resources.
> + */
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
> +{
> +	struct phy **ptr, *phy;
> +	struct device_link *link;
> +
> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy = phy_get_by_of_node(np);
> +	if (IS_ERR(phy)) {
> +		devres_free(ptr);
> +		return phy;
> +	}
> +
> +	*ptr = phy;
> +	devres_add(dev, ptr);
> +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_dbg(dev, "failed to create device link to %s\n",
> +			dev_name(phy->dev.parent));
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
> +
>   /**
>    * phy_create() - create a new phy
>    * @dev: device that is creating the new phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 71c2e16397130..14b924a88411f 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>   struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>   				     int index);
>   struct phy *phy_get_by_of_node(struct device_node *np);
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
>   void of_phy_put(struct phy *phy);
>   void phy_put(struct device *dev, struct phy *phy);
>   void devm_phy_put(struct device *dev, struct phy *phy);
> @@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
>   	return ERR_PTR(-ENOSYS);
>   }
>   
> +static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
> +						  struct device_node *np)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>   static inline void of_phy_put(struct phy *phy)
>   {
>   }
> 

