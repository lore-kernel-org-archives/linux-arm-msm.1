Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA252E739E
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784968618; cv=none; b=bnN415tXu4pbS4ep5gCTvmTtUleXcYtUa2AlhcoAEkQdj6kJWp0TmFqAmcKIXABT+Js8q/rbwWe7zi9EEJv3hWOs3XYmMD+kuubQ57J0ZyE4q9CVnSFlftpFdJTt8gDUHepfRXLhLJFZxiLZplLxtAcuFhiCn/JPT9/OzuXrSmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784968618; c=relaxed/simple;
	bh=0OFXzeMQ9EYhP3eXqAO9VV9ArjutGPKah0evCu9E7Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNv4FBuvrKqX0XY2d7KxTciAtsXZUxchjLH8HQ9oYI3OtqVvRkh5dv37+IwCwRSA1hoWwYfZW7VhCD0m50OHRPuW6H0JTDphK8Qxwn8CjGhFdMtw+nl6orV8oBupgfUrcayYMXpHfmN1bETz2NCalT9BFK6Cm8mdF3nOPXWSu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRb81t0g; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRb81t0g"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a1fd0ab0so96057e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784968614; x=1785573414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YE9HQKDmtvVCl0AgZyo95qIV0Glat3h/Ev3Q50mZfxk=;
        b=bRb81t0gplgx+wXktxJDEJ2Ox4MB2kkgU77ju6qBVpGS+aKfCqtDD1vpSffNMDmjBo
         wP0cVGFOtVSXcwUOdb+aVMDX1IdWJhZZmy5ZfEqGq01XVATvwc5O22uotUfXxj86cs69
         8C6ePv0nE66n9j6AQlSrjOKiLkkexX3Y473n9RP5utoEEZMjmbd7U7/fr5626Qsmlhqh
         I+lzvJpfJdR9VaudNE4BAWyrweHm3L7TqDJoRKuYZF/A2RGzEkT/5sgHEf9I1nYgAZ9u
         iWzVuv3gcnWL23Mez66KAq04cDkzRpegvW8m37YxWi8Lj2OitWzC7xgMBn9LFiETHGNu
         i/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784968614; x=1785573414;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YE9HQKDmtvVCl0AgZyo95qIV0Glat3h/Ev3Q50mZfxk=;
        b=SYX5YMLI5MZ40Ja0Y8jYW29X2iFma4p0Ml3LhV+RP14hytefQdYXVXYpHlzOOF7rfc
         GS0pJTuXB0WkvvaI/atfEkO8Cz/BAloeI0TJW+9VLRE3opywnia1s20ISQOIKjBhw9Ik
         k7Q2k6kiUgIml9Op8z9OBJnHATztpZz1hHOX0CiiXZUt8L/6mPk/o4jy/YDdfTIaqILn
         1EZlhOcyBmfERxkpqTidxF7Hn2TtYqKGUy6cdY1MCqXtGldky8fDXpP7PVUCP3dR6QzR
         98afBiezCy/KDmENbGc1lyHNnHWozYbHq5Te8mMUiip1pLbEYFqEwWiBb+hStK/+Ke3F
         /bPg==
X-Forwarded-Encrypted: i=1; AHgh+Ro856GfXXsVFTZ65ufAOxktia+ibu+PRhYmPpLcE4tWqzoXgV4A3BYjCr6jUwZMMOsCTH/2b3IPyw28UqBd@vger.kernel.org
X-Gm-Message-State: AOJu0YwKEgBrh7FcHZbBBs8NvRqdZs1dRguqh0Z5l6gDn3426b38CPrX
	y3FxRpFLNAsjlCfkKCikYQ1OSPv/Sotva9KCclev9iXwp8Q++d8EVk/cP9klrj2OZgw=
X-Gm-Gg: AR+sD10UaF4djYJ7SBY+Aictnu64LWPaK/os+WswtCF9oIwgwXCb2H/KTni734DwTvS
	3QDp0VD9GJ1TZ/LyQc1YlzzcqP1fLWxHnlQZ/y1hji4kLwKHqYWYsufWnMlLiCuZlv2c2nlTAPS
	a9/qCLs5517naTtbUSrDTjIP4Jyjf+9Bv8wnrdHS3Rp2cMCaYdpZDBRFaYZ7jpVNSygugtt1tzz
	MIFl7teT0lfR5DZu9i6wXycmiL9Y4Vsha3CLhLwISwl3SD+KDiP52BLzmIuhYZzfiAN23svL8Iy
	sTQ+U4X0dLiLF06M/1BY4AAg3amUtc+0ozslA9ZrJ8jijPuagZvr/yKblGxsHGFDEH+5MNKlApA
	m2erTblRFboJsQKGx/EuXGVelUFSdHJ+05l1QfT01xgZA+aLrCWN6G9hpAvxub1/N+LZKiJWo7M
	bDQ2ESGxQfZnYSJeSGPywP/03I90pbMLLFIFeGg4GBhpkTa41QSJHCrHDA
X-Received: by 2002:a05:6512:3a84:b0:5b2:b008:f90f with SMTP id 2adb3069b0e04-5b2c1b65accmr154957e87.6.1784968613674;
        Sat, 25 Jul 2026 01:36:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d8c57sm315085e87.43.2026.07.25.01.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 01:36:52 -0700 (PDT)
Message-ID: <8d20f3ab-696e-40a4-a05a-688779299071@linaro.org>
Date: Sat, 25 Jul 2026 11:36:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: qcom-cci: Add missing cci_clk_rate for msm8953
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-2-5eae78700da8@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260721-cci-clk-fix-v1-2-5eae78700da8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Loic, Luca,

On 7/21/26 17:58, Loic Poulain wrote:
> The msm8953 CCI data was added after cci_clk_rate was removed from the
> driver, so it never got a clock rate entry. The DT assigns 19.2 MHz to
> GCC_CAMSS_CCI_CLK and the hw_params values match those of v1/v1.5 which
> were also calibrated for 19.2 MHz.
> 
> Fixes: d202341d9b0c ("i2c: qcom-cci: Add msm8953 compatible")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 19e4719f13b29b2cf60e113565b1b63f19d0e669..5f74edde8558382e63e2c3d0fbe19489f325e8ce 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -783,6 +783,7 @@ static const struct cci_data cci_msm8953_data = {
>   		.max_write_len = 11,
>   		.max_read_len = 12,
>   	},
> +	.cci_clk_rate = 19200000,
>   	.params[I2C_MODE_STANDARD] = {
>   		.thigh = 78,
>   		.tlow = 114,
> 

this simple change is wrong, but commit d202341d9b0c ("i2c: qcom-cci: Add
msm8953 compatible") causes it, but please note that the commit d202341d9b0c
has no explicit issues per se (if proper frequencies are set in dt), but
this particular commit 2/3 breaks the whole picture.

Let's see, MSM8953 I2C_MODE_STANDARD/I2C_MODE_FAST settings repeat the ones
for v1/v1.5 and 19.2MHz supply clock frequency, but I2C_MODE_FAST_PLUS
speed setting very close to v2 parameters and assumes 37.MHz supply clock
frequency.

So, at least one clock rate setting for all modes is invalid in this case.
Automatically it means the reverted commit 1/3 in the series does not
directly lead to the wanted and well-managed data, and the logic in 3/3
becomes invalid.

I would suggest to grasp the statement above carefully, design a bit
better solution, meanwhile postpone applying any commits from the
series, especially if a breaking change holds a Fixes tag.

-- 
Best wishes,
Vladimir
