Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A4339875
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148052; cv=none; b=d95YhUYczLUG+jiky5b2YMz0DZRZMXFcvk0MdknqQ9r+xgDUkc+lYB0i/HMiZgtKjrFnW9UQ9xU0uZ9SX+T448Wj+UbQYyHzOVn7wdf/Sbo3tzIbiGuMnPevjPe2mhjzrV7j8rN6Q65d/AdWB03tjckp7kZABW2Bs/+E627wWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148052; c=relaxed/simple;
	bh=62e1kUMESzzCwuPSSGbFS0/epS4ablyVxUFHfRq4wfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRceP5vUUsrDtYjVO+hz6oiEyWQsCzEjdE6lHIuQ1sVHvQ5dguk3e8/ZAF0k5khIMnasyRJy5sd8csc66s+shjS7PyC6n9ao6JTXTqjzs3u9U4/4wwpSy/YHCfpXjOjSfgrbYGihj3b4I8kQ9xY8DQBbG70AGX2veg6F5SdVwgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKpRwjQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dikIMSZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKpRwjQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dikIMSZX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0Crh901363
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nF2NpJFe2HGshGcRjWNfEWmWVrM0+Bh1qZpz0JDv/hg=; b=RKpRwjQWmEDYC1k5
	hms4mMV3ZkvzUyIf1+wcPVTqDIWwiqp4T9wJVhzHnO/AMcYn97K8TgFKp1RSt7Zg
	V/S+HaSEbrEJ9S6q9hp8b0bjxeO953rtTJH/S7jNQAGkJJgboCg6BByHR8miTEwW
	dEd7iSTzbsj/pT22tmZ1S4GWQsT68Q7/94XscwmtiyYxM3R15s4GBlY11xU6J4b0
	iU946LqKzbzVjGZl0z11VdCrojPPbMTciDsZ6kewgm7ftAQzRSYHAhWjOnb2zUTr
	jq0oN3hUzXwBUn9dxq7LpWSDh4Gf7KzQZ3m7DKfbCP7uM0CBAfIhVw9K8pa9ThPv
	h+6Y7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpugbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:00:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936bc854d04so13092985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787148049; x=1787752849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nF2NpJFe2HGshGcRjWNfEWmWVrM0+Bh1qZpz0JDv/hg=;
        b=dikIMSZX1WiraT0fLjmVAS/wOiaQkC2hbpvCqpnHjeo6OkOduud6rcWafj/o8S5lS/
         vGX/0aRT+zYFL3W3jOZl0EsCC0RPTuxbm/8HaRR/x17M8GarYBsh8+nCAuSWlCO/Q+tU
         0yHQB9N5Xso1IxcbAXydT8U9AAkPgXTS2HQ8hKw7+f6enA8CyovSjyEmuZTANvQNOOIB
         dS/tF6I3A4gdkYFhuRefB5KSpV/jPa8yQXCfXTLbZpipZeBUe0F9X6TnUv9x9YWAgKMS
         izpH70JwqkUbzABdXfFcAafFSAe0nDyRPhjSL5vyH20/chGpXRnvyvqZR3J5jU4JN6FR
         aLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148049; x=1787752849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nF2NpJFe2HGshGcRjWNfEWmWVrM0+Bh1qZpz0JDv/hg=;
        b=Hkxt8v4Gv47/W/n74/tzuBjFw7CwlCsGj3mnUn98Oq8uwBL6PqxNGDm5t90knFcaKO
         IClhM1GADrEgXNJufRmlCBcMUtvD5AGJAUYezQeECjWBh8Sd0to2Rh/8ynNV9Q2kCwCK
         T2JJcZNQUXBwtPqY0rbSeVlNEEaORQypi+HV1Y1b70/I7OFZbHOUCfDzsFLip7I5AKDN
         lIfgZSCbS5vkTKL32TN6BPKmyvhlDNROALf71gFvjPdONkpZ8EW9nunYDYdvdcd2Qzwy
         1lVaHUOaAmz4XZCsjWY+OXGTKVsaLNv2bjkhZyQ0b5Mkx95ARXz3TAP/tbOcwG+p3gMU
         LDIA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa4HhBEgLoYesPVK1n169D5aUX0zkqzahlDmrES8EruZ+AA8LxWDZAGhzF5YvKlo3NF3XiTd4WfeP2dTdS@vger.kernel.org
X-Gm-Message-State: AOJu0YwdvfnLsZaTD5iV8uwFkJKWNlbT+7i1Eg2C10TWC90mGZvlUom3
	IOGzCJa67RyQ/ikWpv1cp+mPNt8+Bw+LQJyWQ3lstIaIGSPYnyFevkU0+4qLU8rgOFlJC2SFCUi
	Tw/KJJydNVUls6J7XL+MTrJ5wBYjAuoVFq3WoVXq+Hxtw47nRT8SGGbluJ1eAR81EmkDb
X-Gm-Gg: AR+sD126j6nkyGeuz94+Oe0dsMgSbfJRzXJ0D+NJxjrKKnvn8DzWV2dDR2ULAyI4VXF
	YgoE3B+PynV7c5ptj0sAR25+2gjDIHU0oxTm3V/9XxEZOn8mwgnJmPYWWpOVrEgQot6R3GlckHP
	zbhlhTqS8ji5jFX74cIghJZ9OURF6O8qegpjkXXTEuPOjmXkokVq4uq6ybWnlGhF6zYOI/6YK2D
	dqxiOeHVI+x+VGypVGlxCZUuM7iE9RnPegyDmqpzBDPAVyuve+tCl8yN+8QyY2un8Gw4cfLnBX+
	rOH82pggUEmJ3iBD6ED3zTNb70+r72LVWknPAXtxmyOxPKTldUUdVE5SvCIPVxcYTFLxQNgt6KC
	iwopmyW9gOh3go846ziu++7N+
X-Received: by 2002:a05:620a:708a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-9371e6a9beemr349783085a.2.1787148048930;
        Wed, 19 Aug 2026 07:00:48 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-9371e6a9beemr349768485a.2.1787148047869;
        Wed, 19 Aug 2026 07:00:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788e791dsm533593e87.65.2026.08.19.07.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:00:46 -0700 (PDT)
Message-ID: <09f10e30-f613-4a22-941c-1db63b190186@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
 <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-2-e1c9e0dabbda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-2-e1c9e0dabbda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KNKd-wyKoIk-iDIRwlo-WPzSiZuao_UT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX8y+2PNMQJR/A
 Gt4rO7jzd2weAmF7LIiwIhcTEkALVclEUp2nM++IFMKAxFZFBc79xuyYkjsKBumAHjM+0E2NAt/
 NdGWUtiTaJOblzz39W2ESFcvgkJ9DUBST/d2ycVZ7UucS3Qj3BMRv/rVeG2sW2jcqvqKSuG+Sxv
 7VqFLX36AnYCjseeq4P3gkhTEp8FXJRLxqF20FHT5Xzv8cbHeHOy9//hlMBXqAyx4Y1G8/lQA8u
 V+6WBKZYYm4kXAYYO8LH5V4FR03jiJTL0Z1mqpwgsqLzzjrL5ZdV8XZpByAPdGqx2ycapzqhyH6
 MmVTYc9cqoDE8nnBZv4EtjBeWzRhC7KI2HF6TtglB18t2RJZ9KsMQjt05EXCqbTRr6MBJdv1M18
 4jLCDZ02+SfIA6FOtYPea9mC5Tmr4CPuKSoJZwLkNHjOmzQiFwX+fUBDG5zsWL0PY14TgxZQnH3
 am5Qvp67M07HrZgoi0g==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85b712 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OIFkiNoqZ7k2w5cL0_IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KNKd-wyKoIk-iDIRwlo-WPzSiZuao_UT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX5ONonI8kuYqM
 HJ8lQBCD/gqXKpViBFAjagtVWbnWD7Vgac3a/VTt3EUevQ+Cd+mUykt+NKgmIYxvefR/qb9QkFk
 iUsrmG71K6QMWDFlvEfBWgT/7CF9ieU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

On 8/18/26 3:38 PM, Praveen Talari wrote:
> When operating in SPI target mode, the GENI controller relies on an
> external GPIO to notify the SPI master about the target's active state.
> 
> Add support for an optional ready GPIO that is asserted when a target
> transfer begins and deasserted when the transfer completes, is aborted,
> or hits a timeout. This allows the target to explicitly signal its
> availability to the master and ensures the GPIO is released in all error
> and completion paths, preventing the master from observing a stale or
> incorrect target-ready indication.

[...]

> +	if (spi->target && mas->target_gpio)
> +		gpiod_set_value(mas->target_gpio, 0);

FWIW it seems like the gpiod APIs can eat nullptrs

[...]

> @@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	init_completion(&mas->rx_reset_done);
>  	spin_lock_init(&mas->lock);
>  
> -	if (spi->target)
> +	if (spi->target) {
>  		spi->target_abort = spi_geni_target_abort;
> +		mas->target_gpio = devm_gpiod_get_index_optional(dev, "ready", 0,
> +								 GPIOD_OUT_LOW);

Is there a reason for the get_index_ variant specifically?

i.e. why not just devm_gpiod_get_optional()?

Konrad
