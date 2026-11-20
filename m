Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192579;
	b=29dTFYrBbOTsGAN4jo4h6ifoPcnRKwnXNCApqXS7G2K87nvJB7Eu+fWzoIlXmXhinDQL
	 Oi+j0zyFRngsvjD0mYrXPxjMrdLiUjwgZilF0HbAZtEDclS+j/i+3syN5R4G/04f6C0mu
	 BWxtkbzautnVG4h9ReOAfgAJWLufagbjZ40QU8+QASxvw/JtxDgTk5DoXkW3THDfJG+Nj
	 nztQW2XOz///HIgsQ4i9Bj2Mh0g1tS04OVOfn6ArQtqVT+zTzq/DEynZdcj12drVO+2Ej
	 M378MLnpYZMOYOHIyKMpgf25Sl2qilrgL2W0J4Ykrd2wf5FwhMjhg5JxYTfg0DLN8iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=S9EqDOm+9yGN2oqvjOr/ElwRnZRpzarNDWQs/yelBOc=;
	b=W77vJfbVwIZjJOiSuBv7VRLogATcJCjj+/cpFvY73JdCHHNsXZGqjfDpcwclIfEPQ0+W
	 agUvE8whzD/g62rrkzJQXctqEcFdQRleZZ6kQqMItJjxR4TmvMOavtH5kRBTMtj54CZ7l
	 s3RFULKLczRDlHsMKrQ04pSWQlziVBY+lw/1ptjoIeYwtUpaa/hw7GnNYlVVP7snDpl3T
	 njnCBME5Wm4TcCgUZZCDqnwYwvft9XXUEx2najPOm/k87oS2kZKQdIvvlWfnMZcP7f5ZB
	 D4NK6hUtxpY+czh4tUgwcU9eKyMsV4XjdHXrzN2u0ZfZ3Z3x9aFTJDVUEQ/kJ4JnsEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e8k2BilT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20426606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20426606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e8k2BilT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7842255e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795192577; x=1795797377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9EqDOm+9yGN2oqvjOr/ElwRnZRpzarNDWQs/yelBOc=;
        b=e8k2BilT7XijSj3DULur05y6rfSJjuisVxNdu46fXnvxJGtJBBZf+dWSo4961ZO2l0
         3MAW3doFFyiBx57LyDvYs3miVYOY5lrTMikypOxSO/aDbSZktxnxumrz5tdw+UPu9nz5
         ZXtffIr74F7l5XqmIq98NUPEye/Dz7M+WPIUiFYD698yST00rF7VCzKdq4xg2ePTqpKx
         Xw2Eg0RSlrMOeo7XrWG74eVbRmVU7EszkkNUxeGSmO8junIUtbKL08lh8+77YsU77lpw
         Kv4+pzzbCMPUf0aqAQDcDN0Ob/DiWSD/oropcFuY09Dowftpw7XArzzu+Ny86GHGFJft
         Xoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192577; x=1795797377;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9EqDOm+9yGN2oqvjOr/ElwRnZRpzarNDWQs/yelBOc=;
        b=q+Fz9hnKdbidt+OU4Zc6+A92fkxaz2t+eYKOzdsvdTeFAxnmtTbaeMeUgu5oqp/qfQ
         Ep12tMPAH9w7OkFCoLyppFagHNjvFwMSIIhektlZUB2voNdwY82akRgWpLxXyg3L3Vi+
         AVLx5VxMBtR+40KVnQqmiwNKL8SmvhX2IYKhtUJHzCfXS5Mq0aVUtT0JO5Hr9GBYcGnf
         OCLyoPYGFO4NBGb6xmuiLvYUueLwz8nfLD5OqNU4bKEPin6vvPdQ9zMm81r+h9IXfYIv
         oJWuFC1xOkK4s/2XIAuniadFk6Ze4ntYyoijK1apZYPIUO+24Rvvcs0ySLEenM/c1/jP
         /fmA==
X-Forwarded-Encrypted: i=1; AL+hErF/k/gqghrFAcs82Dz0+xgzPGBBF8Sg/eU9JzDqJuBEHixiRWKEJo+JAJh384eVEpbXg4z/7C1zZALq7QZl@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Ld0hpsdpFMePILBrzhxQ96bdfmjW40cn51rTGYkW+5egeQqB
	3hkpI+Qcd5USOb0frP3kviK0NVCKI/fRKXGMwenblrvNE+RNJ6VxULH+U+SgZZIwdc8=
X-Gm-Gg: AYBFou3MM0CNdSwOBNfAQqgzMSzOcG6mRKGHG+iuFTMABJEnmDq1Dj8o9HOH+oI9bij
	h/NykWE7p/p0qgSVMrzzB96UbyfOBb8TCB1VDdJpfn5bokk62IqaPM/OuVogwlG+DdhLuuVzfUh
	fJJ4yZSAAgXjtud1RiW6bFW8a73MUpoyoPYY2ZQcHfUM7o12GDPS2t7ZVo7epTw6XHL4BbwkXUc
	N09Ne0x4w75VPceIKqqEXUazNV/J8QTK+GqcKcXXaU8GwUCZdUvUfqsJCK+Do91+oWs/YctPKwJ
	edW7TMl7+aOBd7loWnatC3LnbCfmPA+UiiO1k6oWxL7KrJ/0y47cGxGc6ubvYzz5ldxxwGT0juQ
	9pym++TvWdbHlD01WahAyMaXC64YsTq/0JjcI1sA5pMs9kh6VIdetsXIW1nBEtiChSYnh10hgkf
	Lx3mL7FqPHL/XMnAGK7s/bTtZVOZw2HDba/uHdRKXxKlO3HpgnBxIk7bdUjldom3G+lfCrWP4L1
	BwCQzehY682DZiAz/IYEfqyMzyLgbIlprgwaSrc6NrI5aYYvmOgU7Ikbr+WVj+ueGObamO6i4wn
	GDLvqc6R+8r0ZA9XNjwQ3KHm7OB/exj7OBN0SRMOJB/IpEoGfQajoIuw0F4cwtLhPpfTh8HdDFK
	MbcA4GwnWwg==
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr81012225e9.18.1795192577228;
        Fri, 20 Nov 2026 08:36:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3374:165a:45ca:24fb? ([2a01:e0a:106d:1080:3374:165a:45ca:24fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm139206125e9.11.2026.11.20.08.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:36:16 -0800 (PST)
Message-ID: <07840e02-4cc0-4e90-aee6-5ed4b82f39e5@linaro.org>
Date: Fri, 20 Nov 2026 17:36:15 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 19/23] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
 <179518897124.6016.130748488943015768.b4-review@b4>
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
In-Reply-To: <179518897124.6016.130748488943015768.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 16:36, Mark Brown wrote:
>> Add the missing DAI ids and set the ops to allow using
>> the sc8280xp card with lpass-cpu and keep the sm8650 sound
>> card bindings working with either Audioreach or lpass-cpu
>> interfaces.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
>> @@ -533,12 +540,11 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> -			link->init = sc8280xp_snd_init;
>> -			link->exit = sc8280xp_snd_exit;
>> +		link->init = sc8280xp_snd_init;
>> +		link->exit = sc8280xp_snd_exit;
>> +		link->ops = &sc8280xp_be_ops;
> 
> This now applies to everything for all cards, that feels like it needs a
> lot of care?
> 

Yes I need to figure out how to handle that, I hope I can use the same
card driver for both use-cases...

Neil
