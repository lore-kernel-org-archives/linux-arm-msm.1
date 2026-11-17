Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953653;
	b=Y0lo042LiW1aTuIC1zOMmRVLXC94IIJ5zu0m1hu8OivLbjXT71GBoxC/zGn4slQkCZY9
	 kLQ/2LL2Q8nNGhHkLq1iaU5+kURiQK2IR+/mWaMbXxnX6pXICMAsR8Es1czhxQt+vkWxJ
	 tSQpwe7to/As9wUZ7hHuhuDxQ/rNW/gNf4Dxs2gKT10smvpxBJAKBDUm9uOwh2LNmF4zQ
	 v9Wa1Iae6OPDU2urA49m+g8+Zanyi9p9hDrIqyTCTNq8QsiFxmhDGgJrjkkzzFeN+4czm
	 TB/4XEQ7j0lvt0z8Uz5NZAWh/uYcogMU8GTmWRKo2mMqSuuHFd8n3119/PfZr0hH6XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=;
	b=KHeJOPMjv6v7paUMtqXWtWL9X+oO0T5AVM99P3Aa4g0v8AsLYKZ/G6BZKL8+IopQAg8f
	 8zA+974BxsxNIKhcqebJcLEWviJJJvTwBR1pwfQnOvEqtgZHyfTCXvq1QlCnY39m76QVA
	 WvGv1GbnUkLBra2A2L0cO2uSf7Wim2e6cCKdo15M1ql3vBw1N1rWylaFM79VoN3ixSc/W
	 yU8p3qj6/F5C32hCJTLMRM+ON+c6src3sCeehusN6kuyyR8K7Z5KXBwPQ9+mtcGMAlab7
	 0FVW0BRtjPFoONiamXUanzzGMR/Lybcvndzg9r2LHsu2pcbcm3sn7/nOHb06BbG9I7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWmW4Vqc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gx3DMGuH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D937606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D937606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWmW4Vqc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gx3DMGuH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHKex1W3912174
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=; b=iWmW4VqczE3QyEmb
	Swbt8vC3VUy+iyYxwzkQml92CjoJCXL0YeWGLkWxyro296gRj7V9rvvdRkurgB1P
	yUcEbN1auMsw1st8lbi8CoNldZy3Jk6JxdT1pS630Ji6dFjleNFQYFkyuSKouRvp
	0KGv5u0emOa0MY0DiNgZ4L77UQTkYBxabwuyWlrDoyQSVx4uT8LKSpfB7+dEO+8M
	Lw2UDd/pA9vF6xSU7pmYyTSlJK8tfe2xnsKhrwT4zkwbPUZhbQINvbXHwhjyg0u6
	phN5s5aryd91ARI4g/hk97PaCFJjUM4EV7OrbiPVQTTREgOHO3wKcY8HaAUO1KpL
	qEa/9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbaseq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:14:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so292048eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 14:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794953651; x=1795558451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=;
        b=gx3DMGuHpXqs2lDmqIvNAXqohkHNDifNlB1ZnYFjfcVkqz/bOyyx/HPL6tlYDu/QcR
         PM4wDidIbpW73OcU9ZemxiYDyQ+t8cecj165oY3eN/2BpTENKWc7Sg3ls2ZsdKYZA4JY
         NdVmJqIVA+0sElyylKtzeNPcG15dPwkMrmhlAWHB0dEJ/MtVaQIpsAbpoUJhs75KoouB
         i0Kl3De18PCayaDPxgUXzUALo4fwviehNAmJP34lG5J1dbxF4PDyZzhqsWJIzhr9K1vb
         sjq+yHKo9l2ho8+sGeFuWmbcZ2QLp6MuNZPA/HUhvwtUz1StwvZXRoxghWrBhzwioAWA
         nAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953651; x=1795558451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=;
        b=tf2t5EKj0o8bPd6ZZnLzC3uzeH5ziUt7rTQoHKH0svLh4xlnsEbacyeRhVsJX5v6a4
         YY3HK1ooNswb7GAHJ+GgOorEWP5XlfP6yNw6MPCchZVddASH4SNJnKyMcGjISzIFMvp7
         qDzuGQ/qTq2NcKtjztYnH/FBIEps8Vq59tP+A7C9xPt5Vh1et4XowRGwVDVzVhlT33aA
         MI/CcNYXBKWEa2eGlym4onNbmQvRjm7cPmBYAyQQWp9XTXLuO+hu+TEh/t+MuFQKnH7R
         Q2/X0HfdCXoGtrFfrI1ICZfFdXTZJgYTNNqxnzocx5raj9hpjBtrGukAN9q33xVweDBY
         8QIg==
X-Forwarded-Encrypted: i=1; AL+hErGSur69Zx7PAW9YVJGuuMSPjhXF4HI0m8Oww0x6t+sZF2lMzfloeXASPg+3+qcgtS5xacaFYFMCQAvfIQpx@vger.kernel.org
X-Gm-Message-State: APuU4Z/X9cFqcMbpBgB8W6/dPYAly5SzkrVyzpRPZTxflW6ubtbE9Ufw
	tskSn1PrQmNXHHfAzRIXAY63lE9mIUFYUw6sbE8BmjhdQanC4ljPHjkbSzFsH9xaNdsuQpxkdjw
	l29SnmY4djI21Bd2+fb2/C7Jqf8ZEm6EwV0sNcUjZJJc3RQ/4qLLD+pzKmtYedD3si/4j
X-Gm-Gg: AZFdTZcu+j9jN+4XQ/KE+bJkXgWW1WJqafKUDjhgTR6JlY0sy5gGdNBw4BtxIW4AqUw
	YMMuK/7/zb/4BZaoqHOyfv/0KdulhqLgMmOFvrA+ILpCm0PyX/1uaqEIzoT/tUTXS7o4tngw/vE
	bWiqgFDYWxH/M1ztkq/UmBgR35bbE5qgv0NcYLciWotYMUIXu+vdvimSTlTQ16erUnwP8nQuLX5
	af49lTUwGRqLf4zSbaoSAdHSQeyJ3lBdfCOwXOFQV+sDMoERdaAY1A8NyM9Xj/32JYqLWZDa2Lt
	d4CbDtF7euxzK9S9K11GpYIvWTog5Nras0qPkNSwZznuNINEuAANqblmY3hIEuskCHJwz+iZ+/1
	zJxCyRHu+xfLSqdcSDme6u87QTgOu3v7a13wEn5/ixUHad2Mmvy3K0sJAy6yOv99P4PPShKPuYg
	==
X-Received: by 2002:a05:7300:d117:b0:36d:394d:e690 with SMTP id 5a478bee46e88-38282cb705amr578486eec.40.1794953650661;
        Tue, 17 Nov 2026 14:14:10 -0800 (PST)
X-Received: by 2002:a05:7300:d117:b0:36d:394d:e690 with SMTP id 5a478bee46e88-38282cb705amr578453eec.40.1794953649982;
        Tue, 17 Nov 2026 14:14:09 -0800 (PST)
Received: from [192.168.1.12] ([106.222.233.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm1066399eec.18.2026.11.17.14.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 14:14:09 -0800 (PST)
Message-ID: <079a8518-bca9-4f2a-89b5-eb2d17a910a8@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 03:44:01 +0530
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord: Add GPU cooling
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
 <assC2v74wpr3AzI6@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <assC2v74wpr3AzI6@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX/4lcmgAJq7f5
 QogJwTrFut3z/4GQvn1shSPV0ifsWbtEUVDlQ9LTWieHJEnCmB90MR8pIMBiToi+Uz2lnBDg7mS
 5BHZYvFrWIEVN6M4WL6x+JErha/fxbRJUlyIE0A5Uj2JjJ9LEmtA6UXgEARBkn3c7kXFH7WcAQ2
 BxWVTJxdgaIRmRRk0RbkkO6vLwYwZ4nx6CZ9j3CpR6EHYdjhiVYJ7/CiafN48IZLSxuTg5CN9Bo
 maDEQI92Iipl8sEw701/n78GbGE/+kO20hJvJy9WpwfkM2WF+osRB52z2FPxcKKt+ENROwGgeBm
 oVYCvQtOdbSitNU4pv3zYVBORWbapVzCK2fH8ZJB4agshGLPCyVoiaf2LJ2j2CSNGvUpk5KrQN3
 Dnf0lPsAdms8aw5cxU/51Ykc0/dOE/QzydIXzDbW5FO17tAmtlVF4BwvIziFgggN9Hfeq1yacgV
 1iQEtEdZyILSQL7ayFw==
X-Proofpoint-ORIG-GUID: L9dfBeNfT1aOpzYoibzZEMDyG8EbJiD9
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afcd1b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Q9FbUFTPKQUszr4Og8UIjA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CYWSrXY8TNIhK36ftfwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: L9dfBeNfT1aOpzYoibzZEMDyG8EbJiD9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfXySVl0jRrH+dl
 YyPtJ8Cast77pGuYxmeWonURLy+zFPHCmU0nbFoQYPdmDL/9CAIZHZ3vIWRulw1P64A+9EyM4MF
 VowfGjivoeY39D7uaRlYtpQQ+17Kj9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170088



On 10/11/2026 9:00 AM, Shawn Guo wrote:
> On Fri, Oct 09, 2026 at 02:36:38AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when
>> it reaches high temperatures.
>>
>> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
>> reaches 105°C. Label the GPU thermal zones and their passive trip
>> points, map them to the GPU as a cooling device, and add a passive
>> polling delay so the thermal framework can monitor the zones while
>> throttling.
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 177 ++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/nord.dtsi          |  80 ++++++-------
>>  2 files changed, 217 insertions(+), 40 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 4379092b7bf8..23370007c974 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>  
>>  #include "nord.dtsi"
>>  
>> @@ -2042,3 +2043,179 @@ opp-403000000 {
>>  		};
>>  	};
>>  };
>> +
>> +&gpu_0_0_0_thermal {
>> +	polling-delay-passive = <10>;
>> +
>> +	cooling-maps {
>> +		map0 {
>> +			trip = <&gpu_0_0_0_alert0>;
>> +			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +		};
>> +	};
>> +};
> 
> I'm not sure why this is Embedded variant specific. Can we not just
> update nord.dtsi as needed? Would that break GearVM variant in any way?

Only Embedded variant support dvfs scaling. So passive thermal mitigations
should be limited to that?

-Akhil.

> 
> Shawn

