Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDAF3DEAD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664863; cv=none; b=MDt+nB7ADLUzwNfNRsXt5590yoK4BZQ+6w7hMfS/sWwj/q+TUSI9Yoy6totrbz00NQgxHCIvR5n7MzvZhgdEHkIdGHOvdprgEkSvOfXEELZSR9Yfz2m4kcasomdlS4DkxFy1phZ0lN9fuFdUl/xQ4HBT+/zSgler3rODqKg8qAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664863; c=relaxed/simple;
	bh=4AILTySd7UOFbCLB2VpbZnitKDnzSXWz3qknFH1+qvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTlHQohPMzJ3Bo+7XER1mKQA6qDnA6cT2bfhYo69S4GG8hklrhCg+YaZxR4M9TAeDEwmF8aEiU3iKXk/UdHZVZGSVGwmoraE9Qr4NXdU37rPkyp7ReKWIwjVIXtOpog9vzmmNkea1Cr+keiDzXndLpjVkl3TuRqNONfr0FdJ+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpnS3THU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OR2OwpGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpnS3THU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OR2OwpGB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47MgQ3643749
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=; b=XpnS3THUvae9pZLm
	5796AtzrKqWYV44rc46ERAsi0BZLg3saJ1J87xBvwPC2ulwMW4BE4eXMc/pFckEj
	/iKzpysOtbznLfGY7+gIh8a3Up6d6VhMKydLh//MTXkEABDzXpWcSgfLggTeWg8Y
	T1OhFu3jUnTZPIUloDnNCuMTpwoYBYwWefFka26WVHOtkpqZ/4lLve1peuIuvjPW
	d92e3HxoHralQT5yCn+1ZaJKO9xe5HIaPilUCDm/SzSZ8kE6IKOo2/O1dDwDsEnG
	UrxIEOyybNxPs2hAVxvtjUcIwYPjhyBlXvGuw2P4zDGpUbg1H8Fswu3HHOSomgfQ
	IDAuyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4sn2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:54:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2035771a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 23:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664861; x=1791269661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=;
        b=OR2OwpGB/HqfLgX44YoSoIxHeqOYK+WpNj1fdS3wbtuREpP+E3P0g9Wo32IQBjMJw1
         qrdby+t1qypJLn7sIgY8G2x+WNA08Mv/jHantuH2ytWG+H9w9kC6mBCxSasHCa6jOi0T
         HBtjyjab+cqv7LVoQIOYiAHIQMxmGzk4S9M061zRYA55cedVyCQeZ0tgfMyPjRf/ry7I
         KBcJ8zvDKgK7YR7VsJvH0axcA86pqMtMIiNg+sxcikYzvXRI4uv0yjbWazNK8WsYQaKj
         xZyoPn6zIJeuqEZQpvnezWxEaYVpl9Iw8YMBbWvQChw8d990kd8Wepor9xutwl8XCql+
         gE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664861; x=1791269661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=;
        b=u7cnRjMwhnKWdLe0nutWEjFmTPt7itULa110HrsBP7lTuuTflWtjz5q8XgCikiik7L
         fH+SfjjPUfRNv6sC2s5PU3SNjov5jZX/RrxCmjTu30KfXHNSufOFElM1b2ZWD9M2I/a/
         bXHt0uAyt3zjgnsjMFdofG7gTk6WeorcVIBPoP2xaiDqGmFN5sH5xsqwUkWCm+0hxXfC
         B4p4VfXKjrnPnW9N/4Co7+r9ldaV36ydxLjAPLWvO2TbJNZNFJuzznMjqFKh4S2O4HSZ
         at6jMDsn90+vDK+D4R4l+/PDrgk6z8NJidQtmfeCcVJQCQsxuMEV8HPrQrx3exe66Zg7
         KzaQ==
X-Gm-Message-State: AFuF++l4dDK6hy0WzIWHTOXoQFjSvizO4Fn9Hj0Q8F44uqPmk2OTwEaZ
	yWs5x+0zUZxCX6hiBtiPEBGuazX+dJPz6O3c3NLl0pJWIsGCfYLPTXlfte3sowJxJcXCvAJ8kpz
	nHpUjgYCAtMPedt5SjAJiWeqCEMVilrBDg6zckB7KJloo5fsW4dH4ogmxbnB3II4DaViQ
X-Gm-Gg: AYBFou3gQIhydkMYubvrUhm5/rPzp33iWaGsyO/8M/2MxrUKDdge+WlltaaO5jaaZVR
	ghh1a+dJSwACB80HflZG+KKufqBt3ZLocmCqRZ3P7WzamXFut1arwn8DkjJkU6mSi3RIsVCdjBO
	3J1CDSVG/b50sM2by/hwV46Rv1iX+4DL6HsHg1yDklLj/fnEgR3KCSndpoRkUnAogxYGs0N55PV
	Y5mu3u6D/g1N2YamDRaCSfhToCUFXXje9/n8SpPuILbkJYQxAkb+B7RBpKfD41gZ/fK8GvE6GkH
	YisXKRwnJfb3XQAkBqksKlCtlaGOtUJluFIXj5/T2sPRgzTeIxUU5SbLASkkco+j4Y5h8r4LBUL
	wdQiCNvDSl7eSvr/Tnx8OZGspXLLhzZC3ircY0BTiivnm0Md+3c/1CsRNM3WUNrcohDSP+jiSej
	HRZB6pEKm1N26V
X-Received: by 2002:a05:6a20:c784:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3de0e73a73bmr14325989637.31.1790664860891;
        Mon, 28 Sep 2026 23:54:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3de0e73a73bmr14325957637.31.1790664860412;
        Mon, 28 Sep 2026 23:54:20 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78773acfasm5579201a12.0.2026.09.28.23.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:54:19 -0700 (PDT)
Message-ID: <41953b98-571e-482f-aea1-6c3ff78f09d2@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
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
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
 <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
 <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXxwzXi65DXc7I
 q9ODWIx0QEv9kQl9bd0B16O+Yq6PSXDY0zvNv1/96YLn3ZPnDCZVOJNY/h3gsk6RLrY1uXFw9K8
 U6LJBHd+22d/gnl7seKpB6dXVZJ4CDA=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb609d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=G7NnfM6ISWE-AksYWssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX4ZbllxK2ZW0U
 7KOpi4p0vwbK0Gtx9jnS7UYp40mn91f1K2oLTDFNgxPjpMda4IoAYJGjBxfAjgpwSvviK42LiHN
 cFQHUtrOA5QhJaO6k/+Si+tfjQHhEzFK3B97s9cqPZZExj2w7/8VeGNys7vipILC7XteDOxUfO2
 gxc1ZCRF7XJojwpxKVBWnbo0GBEx4ejjiUfdjoNiPcFq14X1Cwe2jsVWT2iB8WyEYFFQZRwY362
 kxSk39e1MyAHmP1Aol+vJBj7ZC4S/P3OhfpylyZzbSq2AaL1i4WTlCnkwGh2FMukpoDvnXJHCB5
 AG2vFmDxOAsKcaD52R8biS+fQdCo2TWog8aQVTnh++Cg+zDKscYBv2rHHBklbNJwzMCqovgAlSz
 I3RAUPVD3I0dfnFX1c3bLt2HlwWmIYVwemHO0ANElC14w1CIRjOtwGaevaZlM44JhzNZwkjIY6r
 Q9LZTMeMNA7Dx9ZaMFg==
X-Proofpoint-GUID: K81CnyEVfe3_lp91xFVu1GXkFyq8258R
X-Proofpoint-ORIG-GUID: K81CnyEVfe3_lp91xFVu1GXkFyq8258R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027



On 9/21/2026 5:53 PM, Konrad Dybcio wrote:
> On 8/19/26 7:19 AM, Anvesh Jain P wrote:
>>
>>
>> On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>>>> Is being on a (powerful) charger a prerequisite for entering this profile?
>>>> Currently plugging in a 5W charger would trigger the switch as well.
>>>>
>>>> Should this instead be exposed as a fan profile for userspace?
>>>>
>>>> Konrad
>>> Fair point — power_supply_is_system_supplied() only checks mains
>>> presence, not charger wattage, so even a 5W charger triggers the "best
>>> performance" profile. And exposing this via platform_profile instead of
>>> an automatic AC/battery switch would let userspace make the call
>>> instead. Will check on the feasibility of making this possible.
>> Even at 5W we're still not battery-constrained, so best performance
>> still makes sense, it's about wall power vs battery, not wattage. And I
>> don't think userspace needs control over this either, it's just an
>> automatic fan curve pick, not a performance setting users would want to
>> tune themselves.
> 
> I believe fan profile control is very much within the expected
> feature scope of a personal computer..
> 
> Konrad

Fan-profile control need not be user-facing, since it is only a
thermal-management policy.
-- 
Best Regards,
Anvesh

