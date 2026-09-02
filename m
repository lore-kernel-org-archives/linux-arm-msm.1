Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790903C10A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332861; cv=none; b=lH1tskFbBuEMAYFFrsBbziB0KWHKXzqRi92Dl9JnTDbIevnX/z439ZlQOFLWlH5K7LauL3AN8OLLWO80uL6ZgHpUiHDvAK2Sk36x1D74UMs61QG7VR17HB1CPLOLo+/YHh0/d0PThjEgEkD1mxvMRSXj7w+OMsJczBhoxULAjuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332861; c=relaxed/simple;
	bh=FedWjQDFkhAuQzFzf4Nf1k2L0r5/SaGP2n+Z680dXvo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qPP8OajAeppkfLTHuBiiJnbRV7HJVLDyzlbOw5QuO0WHo6a251G17s0ltj1EY6mJ/R35Neezo+OLQSND+GCIywoEUfk7DQnY86cdyY2Zaamysd9PWOtpcrWmYkQCL75G3Ut+3njbxbD2sn06PRZ/6DbMafTtYsPaQ5PGMGAG7O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lzl98Kbp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lzl98Kbp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fe89fb333so420502f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788332857; x=1788937657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Vfu72tBiiNU8XcM6XXnBVHaiA2eAANag0f1nJhi2+U=;
        b=Lzl98KbpqgcNS592TLTSehZ2I5f2PNgBtpeXHG52yr4RiDTtGDw18M7/dzDZuGuOp+
         eJ88Gwt2Ie5rpbm5wSC3DNj/OtvCN3m03gddAxBCyShumPqz4U0gjLZtUPE2E8R6xlBb
         o9pP9OeAraM7y2kYO6//pdlYnt2NLKjiaE+SYbzMhV90vz9w4SOfRkOGhclvdu0naaNc
         EC08+6C1bzBjwwguj26j3UdkngKZN1EEPjKKasII17PpYyZTjxvA6JXy9bytJbNgY1mj
         0uuM2xdO4KeHVjs8STgUkm7p5aPpIsSDzILe6pj4PgzFq+aD+CUq2CLggCZDPZ45A9ls
         XHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332857; x=1788937657;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Vfu72tBiiNU8XcM6XXnBVHaiA2eAANag0f1nJhi2+U=;
        b=Ht1Q4p8928BDPNwPMRgT4i6wrrDJVFWRsXt+cBrgvtG8NvUyKtawYxywIhx3cLOSji
         IKBTa9z+t9MwTaWRefRzRCfYeEP+CuX+6hdi+lviF01giH/PGY1igraJkvxpHTFXNFAC
         sv+ktVUD3fK6qpxK2zx+68+na2/bJcxQel1KwNRYqP7B/ulqLkhnggidgKa6sxdLRdgf
         a5J/4o2pZxpmLHK5YLw13g8NJBo65zuPtObWDl62N1mSQUIHsD+N/z7F6WWS0KL1/H7p
         OvMZaIKW3vdhzt5t7MeBmMP6kTNnELZIeEskSjhXBFcWq3E1xviGAltdRz0rVP2K1+X/
         IbYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH1bvfKGUlNXtSz/Elu+ChyiikDMmqJRTlwU30VQ/ev0lZbgtiQIpqkSFXOgQTcUVwe5DhEDmvUynzYXFS@vger.kernel.org
X-Gm-Message-State: AFuF++lNaTkLglkaazsKD0tLAuzGi2vkd7mwKuWNHxJIvMzUkeUnbx5H
	9Hzr0bb+7K7beuZcw//Q13RgPO0c08efwnx19EAY4nDJMgLdYuASiHptJCXQlsGAbrY=
X-Gm-Gg: AYBFou3FJO4z45lHFbTjDNgq11mE3/hIy6rCU+tN8Zq9Sw/dn1+TuucVQco1n+Gw1aO
	tYkGG4SQTLrrUjGmEAg2ytkBptsBrlSvJ9oAzT8QNpb92n1l92dahHLGqzvKpfRzHEFOrmicieG
	X1PM/N9a6VPYWwwXae2bBbIXvcnTuZqKVMLIYnPF9fUOxt3P2cmT6T7ihJ1IZRD6dCZ435Pgbk8
	6uJahh5vsu+YPI6hho87NdT+KAtG6BBENy75puqYJOcOld2Ye9Cz72bQ0rTKV3THI/n8qy8fgGN
	25W9uvKo+rTozgVlmlVAUKSfPPNTwSCIbAMrl7xiEDnk7vHyeAwuE7bvjVXxiHiEqv9l31Kl93q
	72VOViqesPmk7bb4LJ51xXuDK3mbOrfH2J72wNgcEytANCGMM3ZMC0yIxOaz52pf8bK/CabP8tQ
	nqLbmh3CyoUR+1V8OLPGzDhd/wEwycftThj0zXV3Z70+bEEJmFJPSD5CYapMS8LKJ4EZtEtwyTg
	tPyjeys1XmxVJY4fiezcNeqozl6g39jP0uMvMz0IWs=
X-Received: by 2002:a05:6000:4a11:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-484914b7e15mr4452356f8f.20.1788332857515;
        Wed, 02 Sep 2026 00:07:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:526b:98c6:2fb7:c242? ([2a01:e0a:106d:1080:526b:98c6:2fb7:c242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm4746752f8f.1.2026.09.02.00.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:07:37 -0700 (PDT)
Message-ID: <60c230e4-d138-4522-afa5-07d579c8db5b@linaro.org>
Date: Wed, 2 Sep 2026 09:07:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v16 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
 <20260901-x1e-csi2-phy-v16-2-dd863b929080@linaro.org>
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
In-Reply-To: <20260901-x1e-csi2-phy-v16-2-dd863b929080@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 22:15, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS                                        |  10 +
>   drivers/phy/qualcomm/Kconfig                       |  15 +
>   drivers/phy/qualcomm/Makefile                      |   5 +
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 462 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
>   6 files changed, 974 insertions(+)
> 
LGTM when bindings are reviewed

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
