Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EBC23C8AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202305; cv=none; b=lnXoHef8ISM4ozhdj8ADTxYY0kp6PBdAfh73vhql6mdTDLfKgCoIZFq7Hj9NxWCuYRGx2N8ESRMra3yn597oMn75E2vs6VEJPbnCKTjVagrle6nqZIehG1sAf0aVDhUXQPI113ztcJqoZ2yEu+VLw4VwngFlnEoUs0CtrPHRp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202305; c=relaxed/simple;
	bh=KRqjEsfgNqcnIJO5eNWaBjRXlRkWEm/1s5nZvcInopE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsqJZYHgaGQ+sSuybNH+Y84tdNEJv8q5b4VRsCcJd0gGwoA9i+HCHkHJ5QtWH49kRqNRh5BO9b0G5E0dBZLmXV+Fd2ggv3+/qut74OP7QTQMyuC8MKcYQ58gfLYwAWDPdiXxX52iEyDEXmsy9BqlJvZKOwc7hqUUpbe8rU5GILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKoQ0xk1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXNF91Tz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKoQ0xk1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXNF91Tz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL83NG1258528
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IrmzCdsWW6qEYtX/br6mJGQ2P/8lrI7K1gQFv6y1bs=; b=JKoQ0xk1tCNl2Sz9
	4XG2Jd5pFNSJ1/NSm8D5K3Rkd3WLtcwbp9/90pR/zIiwrqR6tuvJ70uyI3ztFUux
	vMoQ5mDLgtRJQJfOwWSilAwIuNT16R8cUQd00mnSBfEGxbmB4ARgpG/YTIe3MDXB
	9kZ4UG2w/K3dezVMSR0NYf/35kI2sIgTm3djDiSVn5xU4c5oKJWOaOVe5YEMtRsD
	z/LkqrxqXEQZ8RG4VeyXP0ZjIf9Vx4kJpctvik51VaiVUP9Gsyhvo228QdeAC1K9
	sC12zNdnEV9N1AOgyJmMEITmjUUcpE9SN0FvDf/JygDvI0CBa+SOwJBI5sOyOUbi
	kr1fog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es634y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:05:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso2450703a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787202302; x=1787807102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IrmzCdsWW6qEYtX/br6mJGQ2P/8lrI7K1gQFv6y1bs=;
        b=HXNF91Tz/3aIuY/f4xHAV7vKJnCgYQH3eUv2K2G5DOoVj6G+0Mb+PVJXVFI0dvNacZ
         KVIvu2rIs4v/wClUfpIJwnGPAcY50sAXsSQoBoNKe1HiSGmCXm7Jw+KcpethtqC9Li9D
         lIUfnUHsI25IPLvXwXkbHdUyM7leBe4Dmsi7fn1pcr2wrBqBPsvORAdZ0oBOrSzXwc79
         emQkLVBpj2ULkY7JCLSkkiJn0esyKwegP4LH9W3Mpot01mwPa0tS3JSThSnK8OaqDC7p
         8NRz7TqYeU7egM/Unzd0NMPrO9HstNCn2FWdr6uZOOCxgOoRMdJST/YsL9vCB7YUthj7
         Z1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202302; x=1787807102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IrmzCdsWW6qEYtX/br6mJGQ2P/8lrI7K1gQFv6y1bs=;
        b=tCTEjtrfjCKBLuYu/peQnxo9DJs/nOeVmcX6Fzw7JoabhaCAawMB2MDGhZB557Jjl+
         5NCmQpWky2OjTftbOuFBx8kdF62K/gkZU6M98DICz4bNyis1xkWIogPDJKqkqwmATtlL
         ogaSNbzucqQY/FdV5UNLWY2INZVm5oE71FbEbT4FEZw+nEqSFGeEzD6bp04/bXgVxvQu
         tO/71tG09/cor241yJcbTUavYxuZ9NV9PCNJucEu4yrv0jcZ2g6GnTgxwdLwp0T7seUH
         elfC97kCnrAz082h22yLmzy3jzr3a7Gylagkc8F5Ld6fm5da+p8unX+sylY0pCjLTtWg
         UPUw==
X-Gm-Message-State: AOJu0YwJpZn3pRJ9SSXafNJ+OF3tq1gdJKX8xUYY2safP2Xlgaefq0xd
	A1z9xyMfaC8qGFIVVWIGSWwq6v1sYGKEYNnTcT1uFjSbqmrdvK+9nu8Wq+Lkjwv0J49J/YUMUQM
	LUrj5mhd9Zz9t41mn2S9TE/UO7PcXtXFjcXuGMbTfVdq7zx3VoJwZNtoKP6sXAttldR/S
X-Gm-Gg: AR+sD12uyXTTA/bGAHopRmvRUtZrCuN7HcU/FNo8VBWeBMbksk5eN6MXMQeQ7vyqaR6
	+Nwz2izMnRZjySbxpyD9zFsGDEk+qSxhJxOlXOyeC6MwhQ6YlSmeCaWI/Fsm/8bpGOPYR0vRDqh
	Ve97wRZePLCVYToDjBCADf7gvM47JjandmZznCqQhNm6gMv9KI+9fhXV7CVeWwSdCUQnF21WiKF
	cMxf6EoxnxpTN7Vlgf9Qz86GDCs9MXPjm44NLGQM5YUCjSfVS0oeDzYhb9SSN1KeyQx3nBGTbJs
	SH/ajYUxd+hfIWLT5DWvzLWqKjlQaQHKgUh++vu6ST9/4NTFjktGEfGwoL0LofsLbOXQewf4Rx4
	/f5+A87wd5815ky8E4ke2jENpnxgINEXFHAQI4GPHrmz2BDNAmdJf0dLiN8WHK0ybaTvBiEepJQ
	D36GTyJ26O7dUO2Q==
X-Received: by 2002:a05:6a20:5483:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3cd00e58e33mr18463634637.6.1787202301923;
        Wed, 19 Aug 2026 22:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:5483:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3cd00e58e33mr18463521637.6.1787202301416;
        Wed, 19 Aug 2026 22:05:01 -0700 (PDT)
Received: from [10.149.122.146] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm21195675eec.16.2026.08.19.22.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 22:05:00 -0700 (PDT)
Message-ID: <4797ecf4-67f7-4bf5-ac10-baa4a1356ea1@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:34:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
 <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
 <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
 <ed3dc2dc-69dd-4b48-a5c6-47ca72cfee05@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <ed3dc2dc-69dd-4b48-a5c6-47ca72cfee05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a868afe cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yyrbUpTaeNQD0MaAboQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: _ULZp-742hpt_jKhKXr5ddvQHePQnTpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzNCBTYWx0ZWRfX/EsmrVspcKap
 8n1PgrOAUZay16sfkfR47jco2be6VHrfW6nvop/Lo9AhQPEYKrEciy5SLhBiTyfWZHeONEhsQ2m
 cYa3BSffiT2Yy3yhRwP5lTO8kVv7+FaxXFKY8YUw+oafoKrUMVOEF70/jIqg69oA3PMuY7Py1ET
 +lYPdfqZe9WnzBxi7mv+mNAn6nmrG5eviAa6jmXWZeFWGdowqsnVuul9RPRSqgpivb3LB8zFIJ5
 /jQO16W29yxvoVB/Njy85kS3qbr0CnZHHt0JqJGd48H2IhOdHLItHPvX11KlMJ5F7INRK9cTYuZ
 +tXNYxQjVa1kzN4Zjg8cukhA5nMNZuPJTY6rImTNNyeOilX41S5G62DuT5Jwx0oekIAynj8AOp7
 KtiD80J7hVj+by5OlvRR6AdnUQvz3zARp5BzU2S6oRJmpdcfnhIqB6CxnVxx65R8V0yfjqljKDc
 cdDbImN9bZaFU9fyZIw==
X-Proofpoint-ORIG-GUID: _ULZp-742hpt_jKhKXr5ddvQHePQnTpG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzNCBTYWx0ZWRfXxKnpj6BKRjus
 ROTOc8vN5Fq4Tdbo3HT9IpIbyJZ/1RNVtjTYfjqKEY5MSv43/Vca8mzwydQcpMtouG/juoJKs0j
 htWEOdvalt6d4ag1oxVcXjVWgW/8kGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200034



On 8/19/2026 10:11 PM, Konrad Dybcio wrote:
> On 7/31/26 8:25 AM, Anvesh Jain P wrote:
>>
>>
>> On 7/30/2026 10:38 PM, Konrad Dybcio wrote:
>>> On 7/30/26 8:35 AM, Anvesh Jain P wrote:
>>>>
>>>>
>>>> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>>>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>>>> Add the EC command definitions and handler functions for querying fan
>>>>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>>>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>>>>> transport for the two commands, since their variable-length,
>>>>>> sub-command-addressed payloads don't fit the smbus block-data model
>>>>>> used by the existing commands.
>>>>>>
>>>>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>>>>> them in per-compatible qcom_ec_lut_config data selected via
>>>>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>>>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>>>>> geometry but are bring-up platforms without a calibrated fan curve,
>>>>>> so skip_lut_set suppresses the LUT-set command on those boards.
> 
> [...]
> 
>> 2a. The EC's LUT storage isn't persistent across reboots, so we'd need
>> to cache max_rpm on the driver side instead to skip recalibration.
>> Initial probe after a fresh boot would still need one calibration pass
>> either way.
> 
> Are you saying that without this patch, we could be in a situation where
> the fan simply wouldn't spin because the LUT would be null on the EC
> side? Would UEFI not do it for us?
>

The EC has a default LUT from flash, but it is not calibrated properly
for this specific board's temperature and RPM characteristics. UEFI
doesn't initialize it either but fan would spin at some unrelated RPM
settings. Since the Hamoa EC can only store one LUT profile at a time,
we need to reprogram it on each profile switch to match the current
board's actual fan behavior.

>> 2b. cur_state already reports RPM-derived state via the cooling-device
>> ABI. Is it worth also adding PWM hwmon on top of that?
> 
> We have to deduce the RPM number, whereas IIUC we can query the PWM
> state (if not, then there's no point)
> 
> Konrad

We don't have an EC command to read back the PWM state, we can only read
RPM. So there's no point adding PWM hwmon since we can't query it
directly from the EC.

-- 
Best Regards,
Anvesh

