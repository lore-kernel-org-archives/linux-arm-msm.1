Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49621429814
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755275; cv=none; b=HKwN4wy+4HGTa+YaYI2MhqWsLpbRXWY2aV+H+GsXvYvq/6bhpvKEAgcvFQrlCnyJrNqhncTGgOuuiesL2VGg7xGOueaJRLuAc8iw0cuz+DguWbF6Qi3vnGHRW656WhOOh4PiOKrtEKA4oVjJup3VdF4DvfX5TahdqCkKV0Ch82E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755275; c=relaxed/simple;
	bh=jLxIR8/arA6y0SLDu2xu18umhCJg7Mr/B8usW6wre68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1ehFMDzu/mU7+UzsRnRbtuTnr0EkVXhZodjx6/zpeyBS5bAVRpWJJVeHvdg2xid8cBTEguLm5kHb3+hjnoFk58GF72f7Tlcx0IR/e6Ld9kmhD5IZyTB/8aH2c/GkgGlkLSEuQYY3q40dNiAfo7zPyQpsjjv29BWaPUanBp+eAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3D66bvR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3D66bvR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49548e01d02so28004525e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784755272; x=1785360072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MetGCHJH2H32CloHxU9sTuHEKcU3rsEz5bg6J0iX7DM=;
        b=b3D66bvRbpugWEw+Z3NCZK2Y+lvmGucK9Qf4M6i+5xxV27SUEh5JYiVmrYMn4SVTyk
         0I+k2Bqq04VUTBJHrsZSADNkLLqZUatZ2v0jq/nXuo/uWen5S97inxZg+TmUylW9yhhl
         XeqCl61i0s4uGwBT7byNY2zw3IGb4jRwz1gB2aKmfK951z2cdd13llA0QDwiPyu++NWP
         89kjtUA/jKKtYmIjPAgoTas1IDkqNygCy5cTa0EoxD/raH3q5RofsP8gF44UvF4aPQTz
         CrOXUO9noSQ1REI709AkU+Qlm2WK/VHw2TFvCp6C6G6aNSDU8Zoss2+CmNkJ26mlhnzf
         oIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755272; x=1785360072;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MetGCHJH2H32CloHxU9sTuHEKcU3rsEz5bg6J0iX7DM=;
        b=G0ZUB6ceuglMcynCMhwtMUlhKgyuentrUG32qi0oqFiCRRYE/kKhbi/ucaacP/VgCX
         yEn5lgeFV7Qwn90qQ9aSOIFlvwDqUCgIPf+GXSRfab2Av9QHrIMOdlDLEsmwA87NfGxc
         N5jVCrOQi3N55gFKPYRN8eM0MrKoM1721fQwctxpoEiZaHY3F8XReHSHqTLVwJvFntT1
         kJKGbw/VhozBdaDpoLefgdFQ+CWxY4e+u1Yv9QZb+On6POZ2JrYz0zXp+HverHUDr5qm
         9Iy6shPCMwxapuCx++HRE2YGXWwhR/IOeAibzLh8+z1hxxR2hiJs83UY7Y33feKdtCuq
         iMPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlydquWXpx5I+1RQwPXG8+pljYLlPLZMSVdtB+SN+Y5OClAQCv7sITPbNN+8vCFdTJJ6ZTNhgUAuw8t96y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/2Cf7P8Wg9HH9dgQX21mfj9aP1JSiG/954gxo0arxl8WlLs0
	zi0gFoHqBjq3IATLIy93pHER8D+Hj5CvFzjApcN0Al39Y8wSL2IArpCJW5kEIBavHEA=
X-Gm-Gg: AR+sD10JM2XIzCw1dLHdfPWh9as5X5QhtlGEPiUSliT9pCwBPoGK8e46dwollfcanFJ
	lTuJjVx31quGyCBwbJkQkwhzkTufxmIKeqXMefs6RFic7hTKNlFaYUzZqMF3BjfJNakQTobtYJh
	xOAhpBEwFoCx9lQ0rTkLaNNNaYNlbqklohOcS7oD33F0AZO19YKGlqjOsNEsPgNwfLrjyG/ovL9
	Rnwzw+eBd5tMqCE1U1jsXfC8UFin5kl642hqaaI3kZiOLAcvmM/MzLAC8SJvbblpFiNbi5XZ9vz
	xkAwD1wFro4IFd1pvEuELzjkTOwpesKwiQXzc6BckUd69tSJQ8vXi0x1VeIpPE8hjCnAUfrY9HB
	FhYosvNE0QdZ/z+RmUdXYdDBWNETCkCqvsHS6koXQ3q3JZym4c5Ru+jEemvk+Zu5HHTmb+icQj4
	5tsJw0BkU+/Lf5cA==
X-Received: by 2002:a05:600c:4f12:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-49573ccd035mr4678525e9.9.1784755272538;
        Wed, 22 Jul 2026 14:21:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab22e74sm82772835e9.1.2026.07.22.14.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:21:12 -0700 (PDT)
Message-ID: <bb60d2d1-dafb-407a-a784-2ec219cee0d9@linaro.org>
Date: Wed, 22 Jul 2026 22:21:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource
 table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
 <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:36, Hans de Goede wrote:
> The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
> info and use csiphy_res_8775p[] for the qcs8300_resources.
> 
> The only difference is that the qcs8300 has 3 phys vs 4 phys for
> the sa8775p, so explicitly set csiphy_num to 3 rather then using
> ARRAY_SIZE().
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
