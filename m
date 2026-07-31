Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD235E1A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477693; cv=none; b=u+aJkTjY3UkjuFLhA2AeOwrrBwW46HqAtLQh21dFiL8g5Yuo7Fq5dq8/Gjm+8Z5WZiHOLAR8PgU0L32PJ+YhUtajGJ+DwRY3vSwqYzTZPw3jDALufsGS/ihff6Qdao+y/pC6TZlgzUxqZOFrL5jSuRQBBYEzFTS1DRafB0iBBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477693; c=relaxed/simple;
	bh=9IAiwHERiQkQn/Ry44QWMoA1P6ukK6hO/AKfFxIf0tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zw3KzqCfnL7M90oNfrM+iy+EADQbSXgk/7XOtLHLO5n2qD0w3RaVY0pLG3KBJYXjqtVE8TMnxKdnl9mR6gdRUF9PzgCUSTBVONBCk4KQPEnLysFPuc2V79z2M/zK2e9s+HVezYcq9hrqWNyYxxxgDgbYqA1fJd4yp+qmnE/iGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/poziHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8VJ27he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/poziHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8VJ27he"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V60FBX3130981
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yp8Mavcx6CQHzFiv541AKdT+PiGfdYKPQ+fSQX8jsE=; b=Q/poziHwoBoxGXeZ
	Ww+9uNCbsx/K5rn/sz/ShHj3cgIJ7SiLBM/INrNavhUajMIRCr7GY4zcmSqTsfbg
	mOuoRD4IvirrP/KqYVJWbshAWQbI9ctWToTqn1da2OYx2QwEbaYwAQoVLvIdoSv7
	gKs4WZxdhYVIxCAWvBZXKXoDwXAa8IrW4C37/yU1LfcIxiC2s7KUmDCydRE+5ftt
	ycUrhVDcb7nVPOreLbyJG9TIIl+XqRt2EeYnwmf4cnnY4f72wzS8es17ctt+PetD
	mq705IlDY8udmWrbBUUecs/pqVOfajOLbx9uYEHW7QZRXg9KvIcVXCXnoEpWZZU3
	aEoYVA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp2ar081-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:01:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b9fb055so1932076b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477690; x=1786082490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yp8Mavcx6CQHzFiv541AKdT+PiGfdYKPQ+fSQX8jsE=;
        b=a8VJ27he9HdaSYUWYBCMgr/AH2wJA7O8Qz2KNRalFMzbSUj0d9LCPiVTkqQfuuykCN
         bwAODY605ofc3HV4b6cjNBpqK6rM7SgKaIAb7u+4mMXIt1vRdb+9tOoa0KQcUogYED2K
         tZGOlDEC+2UfxLv5y/WMrndZsViM5H2gsh1/KBJ5SOY/JiAUAmCxdRTqCo9AJAy7dORC
         1WfmdPcd5bM0lWEbwIlrM114S40UwD9T272YPddkjbxHT+n0md9mcmiHz/AGUIA1kTln
         3vA6aWqPiuROmLbbR8eC6TA750b4L3+mq1UEyrF3pXv4ifyXy2CdI3YpyvzjX4oSs1mT
         GGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477690; x=1786082490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yp8Mavcx6CQHzFiv541AKdT+PiGfdYKPQ+fSQX8jsE=;
        b=S6QEE+ytHu/OazLdQyAHphnnXkR5OKDJ7RYwY5yG9IuxnMOsr5ZrVdT5Ru3+tbqUqL
         yoarfCfIBvE5YDVOjjdeQLt8Rt9sYVuhPEEB4qy5skf2X/OsXah7LsOmfOHJv828q+9y
         j8/6vG2fihmtRv3uFvlT4/MIsH5uVYgLUlKWwJ/uGsoqnfNIbBjJjUiNp7V07d0zt6y3
         GibTrhhQnPtDDIvIX2GEITt+HGfrSAaD3uc8OuTgzWqP58SP5ETAGB9sLw0ivTkncM3a
         4O6aYfNX94EdBBe3yyo8VZn9wZRh+dvbm2rEzvA7SOR5YXZmen/y/UFIi4o1d3BThXIb
         q9gw==
X-Gm-Message-State: AOJu0YzvY80p+wLSLjHYN8lfvT7oN8OSnyivq8fH0qVLm06ZTe99oZg/
	lrJDCiEuXaDYUEVAx7nSK+pkUobkHrNyZIDrdw8gDUJTlgntkLMct8/MUE8pHj3oczbc2UXBgHD
	VJHBYF9Seuc2UOa5Yj9RUmooBaLCgyL8WJ0/6DqnHTJcgFoXwNRbApQoRsIBKqgqbK4fM
X-Gm-Gg: AR+sD13wKZPP0Z5dn1D7y21e3US08m/fdMOrBj7K0IzzWipmDmlOpH/pkAFJdGhKQoB
	kW1pwfkPdZ0/e54IAxfUqkK0XDG01eVzBm+mBsAJp3NQ/Lp5GOgi2SzK4wtwODC54N7ZhAxDmLZ
	nQkFo1riBjlJFNnItzPxuxi06dsDomphexqd0lODJBXe6Chh5seJhb+KNCUBm6wh+3ea5YBUH2+
	uWLu/eo4YFaUhGjaBpqiNmXgeaUBMdlaK8b3xj9S3dx21R+Fx6AQdImPW7KXSenKsTJpz32UDNJ
	H/ftYfluHenZFam0HB+YnnAGTd0yToUon/7gkch58SzLRyE0jDN2ZMGTEocPNM/D/HmCKNfoovc
	RiVzICrcKqYYVSOghEnp4896gI6AORuc=
X-Received: by 2002:a05:6a00:12cb:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84ed6f02d49mr605925b3a.51.1785477690450;
        Thu, 30 Jul 2026 23:01:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cb:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84ed6f02d49mr605895b3a.51.1785477689968;
        Thu, 30 Jul 2026 23:01:29 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5deb8ebsm311596b3a.40.2026.07.30.23.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:01:29 -0700 (PDT)
Message-ID: <548b30dd-915f-42ae-896d-3ab8c955b0f2@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:31:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
 <0f56d22d-437d-409a-852f-9fbf4e303284@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <0f56d22d-437d-409a-852f-9fbf4e303284@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfX9OjTUtMCyyDy
 Lunu5GYiwEHWToScsftZwZK969+xPHktyxba1eERZpMCxc+VeSs4Dk+xBiVz/OJBUsXGvoPr4nq
 zA1VNF5GMPo7Jt3+lW+eXN8HCpDZH+3rebzJa4/ODkhvVnlIRCOgG2iGDLmbiahIk/aP7j544Dq
 275zWml+43rsFPKU7gQ3KfrwwgYJ5K30em8hBdtVvWiWePBe2aXzMcAbrBRo6xtM9vE4Uhx87AD
 RhzPCFE/KhRwMVCg47xkYP7Puf64BBtSIZxxAPsA9VW84HcSaITzZQ65b49XG0joImdGQZHzUwl
 fp/pva2FQNVUliEpa9DUJEU7iM2YurWY37sRra73gOWHhNYuX5XgoFu+/+dQWoM8ag1SHJc+tNu
 Kfi3qzyVsl3DcM5UBHunmaWn8QRMuMY5l8UFcQ4FmAEU8vvdto7jIlbaGThXU1LpPEcVhEZHGqv
 rKj7F4rLhLUnVuCwOvA==
X-Authority-Analysis: v=2.4 cv=RYOgzVtv c=1 sm=1 tr=0 ts=6a6c3a3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=couP0MF0vw6ipDBTzhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: iEpkNgdxANoGkv4us17huiMsrJjYqprC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfX49fRi4BK7lBH
 kOBGAiuR3q6ZyBT08a8mawq1Hxk4vBEXunLjnvdtD+VRj23VmwKIiDxAwzuMT4oJ79Wpb7P2MeV
 yeBLwBCm7u21k6MyXu1m80LsDx3yMLY=
X-Proofpoint-GUID: iEpkNgdxANoGkv4us17huiMsrJjYqprC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310039



On 7/30/2026 10:40 PM, Daniel Lezcano wrote:
> On 7/27/26 16:22, Gaurav Kohli wrote:
>> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in hamoa.
>>
>> Set up CDSP cooling for both instances by throttling the cdsp, when
>> it reaches 95°C.
>>
>> Add polling-delay-passive so the governor periodically evaluates
>> the zone during passive cooling and steps up cooling levels when
>> temperature stabilizes below the next trip.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++ 
>> ++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/ 
>> boot/dts/qcom/hamoa-iot-evk.dts
>> index 9fa86bb6438e..a146be1cb5fb 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -1684,4 +1684,36 @@ trip-point0 {
>>               };
>>           };
>>       };
>> +
>> +    nsp0-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    nsp1-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    nsp2-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    nsp3-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
> 
>  From thermal-zones.yaml:

thanks for review, actually this is overwriting temperature with 105, so 
other properties are coming from hamoa.dtsi.

> 
>      ...
> 
>      required:
>        - temperature
>        - hysteresis
>        - type
> 
>      ...
> 
> 
> 

