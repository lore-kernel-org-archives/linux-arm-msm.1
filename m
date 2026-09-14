Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA53A3D5221
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394414; cv=none; b=eLZD+nLwfqRGUrU0iGmcWb2smyNc2FkNP039yTGLUS1qJbH9iq6FkO21H+OYZUlFkACtQJpIhCNRTY9KsRFsdRy4XXVflPPAUs8H/QZai5oz5hZcqPPys+iIPAD4i+dX6FHrJBKVoAcuEBVx9ReiqaSQ95ZzvOHkuDl0kZrEWew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394414; c=relaxed/simple;
	bh=XI4WwrwTGgD371stG3H6USuVa42uAaEk+Sn/MOGbTDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXxad4ksTAZIlTNTRP4Zxk9ii5BNdh3VUcQdpAVCf9SGOvDi6zxU1AO4+Y2kFxoDbltOIhJaQ7gI2s10LfhgY85xVFqcAaLm4Xjzdn03qpyXMYwmkU1qxZxCtuoTLXvuB7JMfv2C+lQUxZj1faO5DEuVAn+HOP9UFa8skgCa21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUrmrupb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fhf1ZlSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUrmrupb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fhf1ZlSb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0RTx510925
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQzxqD9h1uwPHHR2f0f4ExVZnrqJWA06mIqPT77OwdI=; b=UUrmrupbV86f8+ej
	FCPGoYKQLNG7dtRquqpk0ya9G30CbljS5bs/ED9UpVtwaYD8BTVec/1x1dRGwMzc
	GSfSgppci96TuILBZLh4sT7iZm39XM7N1MiPk7/TY9GQsyJS6ETU6ACR16dr/FsK
	q0qMAiKzA75Uxh34zX1O+90VQoC/rBt1tTD4oCShhM4+V3+djyK/B7r8r9CFRq6J
	MoGCosUIMTBMnAK2srXlw0mydJ2Blzg37TwRoqrQ6lltqUrPF5S38XeKZzdNdLI8
	Zz/FGQy7DzdtCU5gFp9x7ezPyY3R+OOom2z8XY6cBkN5hd+yz5Wu0nXiNBYxMjIC
	bdJvUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtgber-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:00:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so1723894a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394403; x=1789999203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQzxqD9h1uwPHHR2f0f4ExVZnrqJWA06mIqPT77OwdI=;
        b=Fhf1ZlSb9j1G/zCsBZOo7MrfVpC6JJNg9qEN/rw35tlqJALFJ1tCpIKlycle/JRCgM
         ji9R3TFRRkBK3VNRv/oehCbGiQFwYTlYIk1pMpadCwZb9Peqo0EMkwiYoGey/RwsjmXQ
         Am7Lbt3z++W6g1gJ3bd/a/TNTA8CLTjMHLReAuS14k/DSKTU9nMeW18Oq/atmZSSpwkN
         QiRMJl5pTk/wI8Ix/UBdwCOaEE6UmiMyG5EcBldrmx0bMXC+0fvlGFRG2lsPFys8J07b
         OJlByOC6Fq7EykfsIGgyPVSjb+8ywFHrQqADdz5jeKLYhm4qxcfm5g0ai3G/7XypYus1
         ddZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394403; x=1789999203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQzxqD9h1uwPHHR2f0f4ExVZnrqJWA06mIqPT77OwdI=;
        b=NGAIS3k9MiohL/9vwXq28VStzyF9JKPNFiBPUk0s+DF1af1XzzS7SGiIa++8iZnbzc
         5RARXs14gHncBHEOHEP8q84up9nl4T7oiuu/D61QwpmKNJ0dBkYU+Fzl2SaKDmmlDtCS
         YpYirzKD4/rt5l2VUus63O3DNItDL73nRtFBnSMuZpwlXGcxFZ+Oj6nkxiqEV5wJd7Ym
         PvPRKDzJffjnDYQQbey5bhomlQw0xVYbutBz6Y0juWwmF4ERTEHt7J4YpEDbMwy5jYy8
         3YRZ+vExaN3mjJvaw4/A/1AwQKb2/6xYGRO1dJvev2kytfV2+LtgLFrEwQVFBhvKYIoY
         eN+g==
X-Gm-Message-State: AFuF++nVl9pBmSIhw57YvewgYmnXZgAxk4dQ0xlIkfoZq1ayhcH2RWuz
	77fBwGKlB7pGedipAjq0F79YEW3gqSZz4ULLpPEYc9IAD6RkmWwcPwZ1XhzeDKZuFuBGz3bzwjA
	ESv9Ud2J+dMYd0gFE1ACdn6OTJXEmHS3Wq1eJ9b833Q4pbYHCiXw+G9yce6ZiMZF0q2vg
X-Gm-Gg: AYBFou0aLUGvdhNS0jmIVnehhbR7SNeR+J4Z3TH0G/jkzsaybLehPAA3tbRerbYy8Ga
	HdzEsYBaafUNp6/Lb6ukwEnR9wQdDqNo9XxX8jp4Qb+A9nwl/ftk9cKvIdRlgqTA4ViFpG8II5+
	IOq3YSMNmJA4GvdCJhsyAArHVZCJIgGaR1sS9y4ea1VFJUPXk+9JyD0y2dY7oJy0joojHiOj2C0
	bqEUeF8/OMwpJS1cbnSFW5fAU55nLHmnA8+2XfLrTFaAnwmk6wsH4iZxFSkzM+uW8J1w2Ma5Nyc
	WAkNCDOHu/phR0e3Jyfd3/GSkRcbaarPdMqUHBdShPT0gV2husvcPQ2+RZ7JzgVbsEcS8N7+iWB
	lfrH1fL2JNahPeYoMrmBJ2EqCW2IIZg==
X-Received: by 2002:a17:90b:2885:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39dec0be8cemr6142768a91.18.1789394403266;
        Mon, 14 Sep 2026 07:00:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39dec0be8cemr6142690a91.18.1789394402788;
        Mon, 14 Sep 2026 07:00:02 -0700 (PDT)
Received: from [192.168.29.80] ([49.43.225.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfba45a1dsm103677a91.2.2026.09.14.06.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:00:02 -0700 (PDT)
Message-ID: <2dce8b26-9da3-4298-8cba-f486eb338739@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 19:29:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
 <1b4860df-8c5f-4ba2-bcac-6ebca94a664a@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <1b4860df-8c5f-4ba2-bcac-6ebca94a664a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7fde4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=hceuC4G52E0BBsVtZdclDA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bxJ34Oa1_eCqSt1cKPwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfX4nCG9C0pen8F
 wQ5WDsJSnDEYCJZfbxuvJjBU8Q+DO9/zP9NISZUdkPXkpFZNEiBJBEkEhZa1BJQDZg3tAd3OW8t
 PHStBf8hQCIyXwRRFFtief5Es5xNVbNHlq2w3+4w/YAEoSvcjJqsv0ayVNXbuAEZ0ni6Ycpukv5
 fC4jvx7wVqMZz0qoEwifVMLfGUJT+Q1tSimThIyMuenkOS/OTGIXTMQlSlxU/XFVxo0cgvMm/E3
 4akzs4lPTZmoSnMnO5OZD5x6P1SmwkTlGXeem4nonrEqjF/UKfN0t5RN5VM+gxr2j2ZD1ozqncH
 TqgH3lp05SQ57/nxwVSB/Tb6cVJ3SMLfYC+A14mJ/G2GIsq+drRaZZ3+j2Df3yDA4nTNUm65g25
 lFHDgH3NGo/7DFUN9zTpr4peWZ30LBvBzP81ar+nO2tVgwEx3za4TyHq3j73qxC1ebpmpb6q82l
 oI7f71jZ0jQy0rqEYFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfX7KkaLImVdYX8
 0TBjszqcPAc2MNSdiCnpDkiyjuWuAp/6CFvRqByfSCqPG0litSwRVxZR6hI1MCEenrRo3BujJ84
 ukAkwfR8ZuvLhCuhNBrJiF5falhmytg=
X-Proofpoint-ORIG-GUID: 6s1KWnvmgPoilE-HQQ4rug1-X-yKqnD8
X-Proofpoint-GUID: 6s1KWnvmgPoilE-HQQ4rug1-X-yKqnD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140200



On 14-09-2026 17:57, Konrad Dybcio wrote:
> On 9/14/26 8:59 AM, Maulik Shah wrote:
>> Add the idle-state-name property for the domain idle state so low power
>> modes are described consistently and its name is printed in pmdomain
>> debugfs.
>>
>> While at it, update CPU idle state names to match the low power modes
>> they describe.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> [...]
>
>>  			gold_cluster_sleep: cluster-sleep-1 {
>>  				compatible = "domain-idle-state";
>> +				idle-state-name = "l3-pc";
>>  				arm,psci-suspend-param = <0x41000044>;
>>  				entry-latency-us = <2752>;
>>  				exit-latency-us = <3048>;
>>  				min-residency-us = <6118>;
>>  			};
>>  
>> -			system_sleep: domain-sleep {
>> +			cluster_sleep_apss_rsc_pc: domain-sleep {
> This is really a system-level state and any overloading of the name
> 'cluster' is only confusing here

cluster_sleep_apss_rsc_pc node name is already used in lemans.dtsi, so for consistency kept same for monaco too.
i can change both lemans/monaco to use "system_sleep_rsc", as they reflect only RSC is triggered (sleep votes are sent for global resources)
and would indicate this is a system level state too.

Thanks,
Maulik
>
> Konrad

