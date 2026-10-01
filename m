Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A664AA009
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845107; cv=none; b=M/6c0N38ZHlhO1uKg4Ephl1iAnaSI5GbHZRSkJmBbWXBy2j6VjqtJUNK34Pv4063SNOIbQ5Jh3eaW7jiSyQ3WeEmO10QFgyZF3c4vaGInEc/UOTXD6K6jLfVZDNxDo3cRQyETksT+UFyUwiitfi4LuMDctj/6RUBxc0gIds5C1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845107; c=relaxed/simple;
	bh=+E2iJBKavpqK3ygX0v7QgiQcmKUSgfghZvHlTvBum8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3EoRALZFJs3ZxgL9Ttu1BitTWmMYodHnrBcMe/Zf6dGI1ozfx1P/DoYsrsQa7ALzpn8RmR2nnRpqeqJKjFW3UIhMivYoabaupWI+XZEfBo0zbZLWHyuAtZ0/JFB2L3NQKPpQRYfX5aet0BHwLkUeZroDGukaG0W4S10vntvFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1XZlNCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0q9KcGU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1XZlNCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0q9KcGU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xldB1661060
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnV1hJu5ZYk9qMVUaRyv/ic+YEuX9OQI6jZvHgxtYDs=; b=P1XZlNCD5eLHy000
	mCQ6hbUJAy0icA53m/ijvv/BDPqLEsc1k6cuICvSSOR0kpkflgzR5OCUimszQODl
	mcy0DNPTd2Mt9YDcwWJ88Xu045pvwmp/dHhKNmNv0+4lj1YiuBNFv/XRvHV7BsvY
	crqAQevQJeSR7whMQk1X05psfxgwMxNAOfhgpSEM6WZldtZCrJLgPK4dRRDWj6Yo
	XCY2ibxS0eMEiXPeYcEaioKfVPRDqKS6Gav1ZcxhP/C4x/7P7CvjrGicEVpRL/gw
	Ha5Ty9NQMNQZ1zpbdKS/TYKkurN3Y3lSLrNFObj0i4bX5CSkah0PiZGrUKdhCO1L
	hUVdZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pkdsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:58:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so51411715ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845104; x=1791449904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnV1hJu5ZYk9qMVUaRyv/ic+YEuX9OQI6jZvHgxtYDs=;
        b=O0q9KcGUw5f6yqnAFlKkMzjjrAKOF83CSihjXVbwBP0S/WGaRSJOVlF3lpVG6mKVAv
         5kQRBoA7c9wqoLv+Bzh9Q7SJB0g/2jkbNzIvZ2LMPLz0P8KsWkuS58DoXhOyNeibvqdL
         FcLugWakz5HFFsD729+kgr7tWdlYmzY/MukQalBvQP2Yp50zalTLZiKJ5HCzuN/gTALa
         cNSUhW4SLB83TrKmCVziwbxF+Ul5Nheo7KP1iH4iilf0hew1vNLZMmPsc8WL0yvnbqf2
         RIeJUUWwxyKdgFKXb6rnHdJzY+v2LZBhVXdVZDZIG2fsD/5yVlU8o8utUx9tK4YH0oH8
         9NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845104; x=1791449904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnV1hJu5ZYk9qMVUaRyv/ic+YEuX9OQI6jZvHgxtYDs=;
        b=FeDA8320SWlfDPaXeX3lRcYBkdLZtUyfikXBjggYS281E1lmFvnUz4qSsUYyOpYpGQ
         vKF/cdmY5sFCOE4ERZ36nFS/DAMvkQ3uZjJa32BziH3nND2mevnZ2LfFyoFLofpJX1lq
         KgVEQ945px325XRMaa/ov3GcNoCwYbwA0Jw2dMWjueA/94VTBTnFwVCgGp6IxU4gEd4+
         NIWcehZz4iHKigw3m9Cryl3vniNo+C770iSFy7ViP9pBBgcU4XKnvgYc7cfPlu3k+Cdo
         19oTqP4/xISb53+OBvA6Iu7KSEe4gCWsGxHg7DqX7dC/wXLAKAjsycEcpYX6M39+9Tj7
         m6Dw==
X-Gm-Message-State: AFq9FYKLtHWibLDLELqphUlYpp386FGEaI0w6H1sCYoMMzNuYgCvM4cT
	k+Ayy4G+THU+ABId4MpFyyQYJ4ewDdtEf/HNRi3bsYUNSyd+Rg/jFQxFetEJtOqVtt9cCWvu8U1
	FLLp81AKmUV+yUQ2ScdpKBo54512hHo06y93cN0VLFslOHHbPIIj5+nI8f4SYILEuMuiC
X-Gm-Gg: AYBFou3QUujLJidJAPRmc5EMv+IiKP6dDCkUwwEIb0Z4owaUTOAh9wNMA0E+5gkLfbe
	po2VkGzLuBtvpdq304ldEmz7LTSW4Pq3CjAnV+hb75Xscv1ThR3URG8tiUYjvwCcz7Io8n+29vG
	mYcNDc8Ilzw11GDqG8W5LmCpfGveyNKcaOYYICKmYugU8XQFNd9We+Kttp/95kEHfb+dAp0pgP9
	V8XefJR3wZVnu2Qh+BJpbUWyx5GA6QNRaW5rH6nRgB6RjY2KSQOPYJ4S8D1GgCQwY8n2OR8a5lB
	vQs1zYaWSR+tna43CpgMRfP/t0JJ+0WPa68AfRxkXyNMxJ5QnHEdd5PFZwE6ysAfWXZOyeMJH1N
	7G6xmxWdzYLIj+De/fcoath8CRnI=
X-Received: by 2002:a17:902:c951:b0:2df:ab73:7e94 with SMTP id d9443c01a7336-2e2e4b970ecmr34381415ad.51.1790845103755;
        Thu, 01 Oct 2026 01:58:23 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2df:ab73:7e94 with SMTP id d9443c01a7336-2e2e4b970ecmr34381235ad.51.1790845103223;
        Thu, 01 Oct 2026 01:58:23 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bc991sm3358904a91.4.2026.10.01.01.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:58:22 -0700 (PDT)
Message-ID: <86303eb9-a3d2-446c-b7f8-24061f838f06@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:28:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
 <9c4cc38d-6cbc-4c87-9946-904b3bf513ba@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <9c4cc38d-6cbc-4c87-9946-904b3bf513ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8nJP9j5K8ezXXn-JatbBX9M--j6qrVhF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfXx/8Sb91T/i+v
 JxqIwFKCGRK5tLDwqFVP84K5xMXmQ40v42dqprb7c5JqOCIV2e96lnwGLnyZBst7sU054+J2DZs
 +ebnyb0Je7PJd49yEYYYVC1vhIKZvCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfX0lPfaEoQZfvH
 K2GbTcaRneA+urLBbyZhdh7qXTWnvkbdyJXrqwCCcHZFwzuK4V7F0oM/Wf7rZtiqngy2zpfYSz2
 x+xqtsDfiXyLd1W+pFvMwHj2MEJTwAl84EnB2NF1tETPo74KPKmhJQW3iJSF9MGMMEQwAbUXpv6
 rRWMfYogkZJfNgCqFY+5dAXl5g6gJN3mjkpqNtodM0lCUGd5DsQawag6gY0hzJbbF5ddfcEibbt
 8LwiqOkkBZIxSsns4lnxOCgOHd8HiBm7p4v+8lN05EK0hnR/fWJlvI5tOqQhbq1tqwY0hTASftw
 zAPAyFEIl9NG2kSZ1PopKE2aQREiLWJYZEAa4jHaqiEYJcUtF24jsHPy6eD6WVKqWKdi248KmD5
 jQAFPwNYtE/lCqdGiiU+LeRTsS5J9T3PAeu7KnSohlJ6BjTleFQtkVbmY2iw/7FUWNrzUSiHp5a
 r3+PiblfPGr2EcrK64w==
X-Proofpoint-GUID: 8nJP9j5K8ezXXn-JatbBX9M--j6qrVhF
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe20b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hvJKFWt8HJy2S05q1K8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010035

On 9/30/2026 3:22 PM, Konrad Dybcio wrote:
> On 9/29/26 10:35 AM, Komal Bajaj wrote:
>> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
>> TCA9538 and TCA9539 expanders used by EVK boards.
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
> [...]
>
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	expander0: pca953x@38 {
>> +		compatible = "ti,tca9538";
>> +		reg = <0x38>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
> Please keep the nodes sorted by their unit address

Ack. I will do it next revision.

Thanks
Komal

>
> Konrad
>   > +
>> +	expander1: pca953x@3c {
>> +		compatible = "ti,tca9538";
>> +		reg = <0x3c>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander2: pca953x@20 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x20>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander3: pca953x@21 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x21>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +};
>> +
>>   &qupv3_0 {
>>   	firmware-name = "qcom/shikra/qupv3fw.elf";
>>   
>>
>> ---
>> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
>> change-id: 20260924-shikra-gpio-expander-25ff4a29c848
>>
>> Best regards,

