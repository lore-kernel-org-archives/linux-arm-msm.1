Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F951CF42
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179871; cv=none; b=danZwdDZLcDpjm0Qz6BX8zltsVZhkORuUo1OSK/BqyuA/cQ/qD4FEQ8CoKUNoZWsuErogTpCnja065lyYgCXRXHJ2h17nbrweeHjsvyMAza77W2DGcn/PCJUBoSkinAc5RCPH7nzDqDQb5vKIbSFRkeAOnl3giO2euTkvhFGBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179871; c=relaxed/simple;
	bh=vWbCGLr/MuZUgAz43yt6B+BPwVgJjzTOzpP4Pf+XJtM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LHdFV5BlkHBIHpHGLgKvvRH9pv1kDb7p9Ck+oT/VJu0jp9iQP6hzMZT6VEsFgkHzgLzJvdAi2W+Y6tG/+HlLUSFnVAME/od4f4q8hXUyJ7yq0veTqJz5EbxBVZMHYasQV1rA0han/vSwCH1SlKGrwzWODPZ04ENvfuAmnr8p8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj4TjzI2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj4TjzI2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so6893485e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790179864; x=1790784664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=552bajCWQo8xxuyfsx4OELhJAt3U/l/MccDr1/FM3uw=;
        b=Uj4TjzI2pN3PZbjdxS917lIjvHnEvYnzjV5I5wVCrmiN2taI4lBwR/A892LWX9UNQU
         ixmWi9sJPfbOopoi41jtrB9eOcu3LoTk9vLWpbLyVtP1fjSZIwcsmCeBioqs6NFXuMlG
         HxhDkHL1vgLeJfdANVl3BGdEnXLwHSIXOwe1UXNlgWDZV1aqtNS0FbYYOkzdfLHdf6G3
         j+uKoqVG2pnFPQNcHrJ97kslvXLl80P7wzdWIt4uRaPOyFoDWjFsiJ0b9COMLkZJuPlM
         vsukRKxLddHkaMW0iPSyem6t1bJzub42bp8UympPzHfsuUrydIs9QqfZXdS8tNTRhhKd
         nx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179864; x=1790784664;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=552bajCWQo8xxuyfsx4OELhJAt3U/l/MccDr1/FM3uw=;
        b=Yd6+2x+mum9/sz8fQeixbhMdjQ1sPzeR/msY9KricAXr5cKdAJ1aunuZHP4Nw8mSz6
         dbP7XndKXc94YOyLf8nIzI90i2CZAXDhTvB5URMdMWZSwetY990zQYdwNTPUMRWj315d
         chkJw7hELFxVNA6zEKgjYniGNU2Twmk75GXd1ssUtNCBq4vk/HCBG24NBuqE2+ny3CXw
         Hhj8K50wTU7OaMem+cGnEesCA+FCRnkQWGobpfFrWezY2jTnB16hJhGLmMTwaOyMmhcw
         L9ZwfQHH9mBfWSC+/U+XPdtKGgW4lJz6JUWcs4P/1spplYHQkEwAEQp94SjaWNGtXA4u
         QDkQ==
X-Gm-Message-State: AFuF++lZHQS3CgjofPTYe+a7vzdXkF9FmOe6UP1YQTaBHm+g6Vj5o+7C
	xMzhxIMirK5IacKvDMnvc3PjS1uSY/Ll6MDu0cSwbAmT1ScQxCcM7VTT+B+TU+iPegw=
X-Gm-Gg: AYBFou3fqbVfCab403E2RD8N/FsDMbF4jujmmxb7LS9dvxozHfJea1npXr9UO5T902l
	XIJ/cEil/paUxcHa/5gNb1GCYKOysdyu06nXnbpTw3JqxsiL6owicWSHNrZ0gpvUwDBjQCyZWJw
	iddaRwnIYSyWFXC13ccJJfBJ1HZ6LRoJKNKkZyp350D6LLfbWr6wNFiQVI/DFyCHo8J3JAnNC1Z
	rFHE4+pbxZl4sDc6i91LbsL6lwv+zJm8c+IIFZhM68/NfnRFhkLeSCnpXzIev4TitCPuYKMklMe
	G2dSl6FQdhyqSeCl4A4rGRXERsXvi+9nsT++rEJr4XBJg3wxgtEQ93TZX4R8OrKUbkQ1+XRTtdW
	g9lNUldl7H+SfT2Peh/lRw46JrFCjCbyl0va8iGrYKFPCwUkaQo7yyzjB7Z6TkrZ5+AYO4cuQ2B
	jn9EGSb9JI5CROCZNRdeXOYFBqS6Bf5Zp4VpEFzlOj2SKd1ZCzQcRwGAoSDR58g3qsJPaGAPqyf
	cwN469TJyH4FM68cdjvBD9J/e6GNaC3ng8oEma7oe6jRMta3CUF/wql1/mkNpG8IA==
X-Received: by 2002:a05:600c:3b11:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49fdeffcf0amr46321975e9.6.1790179863623;
        Wed, 23 Sep 2026 09:11:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4140:d290:ef49:44ba? ([2a01:e0a:106d:1080:4140:d290:ef49:44ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde17dab9sm102650735e9.2.2026.09.23.09.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:11:03 -0700 (PDT)
Message-ID: <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Date: Wed, 23 Sep 2026 18:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
 <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
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
In-Reply-To: <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 18:06, Konrad Dybcio wrote:
> On 9/23/26 2:16 PM, Neil Armstrong wrote:
>> Add an initial DeviceTree for the Valve "Steam Frame"
>> codename Deckard. The Steam Frame is a virtual reality headset
>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
> 
> [...]
> 
>> +/ {
>> +	model = "Valve Deckard";
>> +	compatible = "valve,deckard", "qcom,sm8650";
> 
> Sorry I missed this before, but you likely want
> 
> chassis-type = "spectacles";

I wondered what to set, but I don't think "spectacles" is correct.

I was thinking proposing a new "headset" entry.

Neil

> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

