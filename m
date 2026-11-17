Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891908;
	b=2opC+5nasn0ZV19y9iwi7WCb2ak3neh65Y2KM0JVrXL0PqVJrrJIXb0soiC7WPd7oblF
	 KZ/4rJ4c0RWpV+z+X1nng4j/xlw1g7xViCyHxZNDIGiWaHgLLKLZeQgQWHgUtNQWnGyMs
	 vEoBxhQkpaxQS+e9rsTEHDfDxjn5nLHWCdpxCqmsIqWTtjUGmOSIesvGcPo0IsZt1yymB
	 rw0WlqsDJeXQ1MzazIo3kv8CR72RzAMj6fLUGZvSwtGJfjXToAMIwvT9rc9U1b7YTNzTj
	 Jw/iSM9RwODU5wBH8D6fqHwN1/iPaFmRZXbyOu7KC2bTXO5ZwGXMC38O5ZmQuCoVbsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
	b=yGWvrwTgb+f5z+QHWd+k1wuzuVwTxCZ6L9luAlL0ojKHBrc9IkMqO/OI1yHsbRYxrLUA
	 y3WiOWa/KNA41qQ4BvW4dZdOhKcQ5dXEpnneO5XkVlvojxU8mUdDlkAaIKMa3JvieZk9d
	 Vd36wrVHbqN741zpABeUwOLfTiZxbKUxkjI7t1aJPb8uj6GCzHEjGLbVd1lWckpBJENiX
	 Mznu9NLUUIJG9zJbZup0ZnOXaLJV2FUhg8wfiULXUz5KAPgDTi3qwGOpjyPDdYent1anU
	 +W69o6jk2acciwcAknMGqvbwuvMjrAxhJn964JAuJs9ZTFj/Ic+3KwdSNUajWENhMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyR2Xvr5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHkZQaS2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473A606A331
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8473A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyR2Xvr5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHkZQaS2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKXP1800826
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=; b=UyR2Xvr5mgnBNFXX
	m5z2sk5nqcqjIuG2LbsieBw2xqL10aw688SmCyRstdkHPG1FJZOoKTLWGUZ8iYbV
	AadKpNBqRLG9aJxV715SCdaoPrnYPIm46bwK0akZUQzaycSCspUy5d74C46jmFfZ
	i1KKjkepaYeVferOskHGdIligD/U69dbi5WcQXtrMlMDVJKwwA2AdvDUF0Lr8sQ+
	qJjQR8FoUBZ+l4LG6Xp6lyQUtBn4UoRzU8uhkweKSUBUeQ16pFmNVfRDu/VHyGBf
	RMo43qg1oL8450LO5UkropBDG3sZoHLBrjjJgC5mPb1RjndC4BB4b4tM/BK+aH5q
	B62j3g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y35gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:05:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso3945988eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794891900; x=1795496700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
        b=RHkZQaS2MZtvr9lY7Z8D8+OkVnghhoESST2B/YndphFb2ect3aUlXAa5fP33mU2q7u
         PE7TNn1kTsZghXhKHEhBL5nerfFkcEjIiOyYZY8ZuKL2j4GGoOFgnqB/rQ+TWe/q6Mxj
         q2JVcQ2YNM0bD7XkP+gfrNVmLUGB9C+prurACA59vOdP1dHRgq/yKVYCfcsoyOTgNQdT
         DxiGNN0RGFQowlqDA55JdwONfRXc6cZXYmnTJk/dohdTgEYmjFq+gJuA06M+ETNbb4es
         /Y0NnGm11O1EULBqhQzVl38t8ujxUXg9RDnoCT+0MUgYpuCR+/L0Bmy+ZSRGJ26Pz3ve
         F7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891900; x=1795496700;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
        b=LftVpfPRty+tnqsGB9cy9c88b6+0ZyrjUQin98H4/jiOKoMhQKCaUaLvyTM0R15liQ
         q6HpVZodbO5g0dmKaZ8xDdeiACkjD+FN1NgMOjQCS95AZANs5Sx4Ra4lq9Mimxzsqa2R
         dH6qZA8qb4NtmrUm+m0V471Pp3dI2cYokuezCi+Bh5wKCWpP/RpmQ3zFSank/VZyZUaJ
         5rGJ8j49BEJjpjrYHn7WY36aoFTyre5ftXauvgyPDvL1kEF+ESschlKZ0PMzn7ejP0qq
         4ZAdWwg6q/RiGdtWzzIvwuMYG/Vfknfc8FuCR2xLVPvn9WsFqZiSUmbjoo1AAtqbuzK0
         FYPQ==
X-Forwarded-Encrypted: i=1; AL+hErH3fYPfVcq+/AodRSpapF9Adjhj/NfRU7F0Qp0KPs5qn/GrLz0t7T9czO4JWGojEShKX6jGO/JL7L8tq1n5@vger.kernel.org
X-Gm-Message-State: APuU4Z+694GwMg2knlZzfMYBsIf3jIv1wbdDJBd9eYlA4IxNCILzgNyM
	uTGmMZttJWu354s3Se5yyuz+nrv8eUyEKklTYimKv8YoCU+RMI3Xm6l59gQBCC3jqRUih6NKfnM
	+GGaee3npVBEyJSDwHIuDoNfcDXQH2O5hTngyi8IgC21QiyG5sYIidBVGJZ2hMYaZmKV4
X-Gm-Gg: AZFdTZeP3CZfNgYuPlLp+WEz9lo7X0vSi5qyduzmRZ5B8LCu9WLdE82KNONXVtDes7b
	alM0SNgz9tGlizY/890MLCaavHZDoVw+ppbNCoyk7V+KWSL5ZUmjGQNpbD2Ej8QMVg+r+yFej2o
	TG3+4jGo1rTIt7J6vBAp3VLRcWsonqNcpqYe/JurpcP22Jg9MzuXqiVvRDLTOtPZKEH0JblDTSl
	s7f5JrRCGtiBh/MT+oDvOA/5itoqX0A44WggVW7Bopd0EWR2iExXjqTXt+uDb1CDS45ZGt2HuYE
	IRY/g7bMMIv5Ge+wz/Ibl3xe7W4Pb+L2OXs4Bdtg5PKwKAHuvSdh2yS2mOCRFUBYvp0V8Mb1cN8
	NxZdZU6rLpUFaEEnhiQTCR+1J8+RES4TIbBlAd+4N8c/g9x5AA2WmWaB7mBcLo0QX1UVVtODDXk
	tGTGk=
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr11307799eec.4.1794891899968;
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr11307779eec.4.1794891899424;
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm1297729eec.10.2026.11.16.21.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
Message-ID: <d3060950-04ea-4f9b-b160-0e068946e623@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:34:52 +0530
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
Subject: Re: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
 <20261116-icy-free-lionfish-c3eed8@quoll>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261116-icy-free-lionfish-c3eed8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GQ4TFHPnl0TUoiXetbkygyl5pXycRJMB
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbe07c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=CCHPWfvzcojU1fbeCg8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: GQ4TFHPnl0TUoiXetbkygyl5pXycRJMB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxOSBTYWx0ZWRfXwHsLkGmN8E9v
 57EoZEzC+jbv9TC8oHe44g91B7nWe+Mc06cut/2vexLiPiusbIkogt3M1GVAjCF0eH7JBMuc7Z7
 z4JvKDUX8lwas6jOwav8kumEg4o3b4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxOSBTYWx0ZWRfX3cXamcW/Goq6
 tMbzqjeca1F79yV3mNJl0tHNJBlOOpEDCafR0jTCY2i4Qw1+igjpzlY3YtJ8/DlRklMopnx03wr
 5VRk7TG+tBjw6BGCY2jeylcwDolRgMnoKONfPWfEnMXTl1EeNYPXZVfqkgiHy7/HQsF6fZRHblB
 QBt/59xVamzAsGA6n8W6Wfo+Q7LM5ann8ZxzEzHCqm+zBftq8WF8nC9T7ZAX9komqQBoZlWiLAt
 flN27sYSUMNn0/L3YoKb1zBkbKeh/xzq0zGf40MUpioG7M3us8X8amBtMvJgy7+TG//RktdVI3o
 PPirqc4q/s/585RUSe2uFSoTKFsyJzygmX0c4yKl7qKHuY81QWm+ashI0Lf64/F4f9CFncycrxL
 9RY5DVE/RR4CFMxJXlp8tVhfcmaUqqIZXzB3N/V8rb/FDURAPDHF+xXeOVE4cNtqGH75KFOMr3b
 T+6CCfuqVCoW7bh/o3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170019



On 16-11-2026 17:28, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 10:25:25AM +0530, Maulik Shah wrote:
>> Some domain idle states require system-wide coordination and are not
>> applicable while the platform is up and running.
> You repeated the property description. Say something more. Why they are
> not applicable when platform is running? So if not running, when are
> they applicable? Why?

On certain platforms CPU subsystem deepest idle state requires co-ordination with SAIL subsystem
such that both must be powered down in coordinated sequence. During wakeup SAIL subsystem must
be powered up before CPU can resume. The wakeup can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause substantial wakeup delays and
repeatedly interrupt SAIL operation whenever the CPUs become idle.

Add system-state property to describe the state is reserved for system wide suspend.

I will update same in v3.

>
>> Add a boolean system-state property to describe these states.
>>
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> index 4dd4f59bbbec..b19952f6225d 100644
>> --- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> +++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> @@ -45,6 +45,12 @@ patternProperties:
>>            state will yield power benefits, after overcoming the overhead while
>>            entering the idle state.
>>  
>> +      system-state:
>> +        description:
>> +          When present, this state requires system-wide coordination and is
>> +          not applicable while the platform is up and running.
> So when is it applicable if not when up and running?

I will update in v3.

Thanks,
Maulik
