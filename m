Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A949BD88
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819248; cv=none; b=LcGJqy8d2SNEMamDze6rZUFIjEIga4kfOXI/1krza89JNeTvPvWQ5+pJg6MqrTjsgI1jZAUUS1xrg61R3ubvNVc9OC/olI4uNTnJwWZrsNFd+3wYa2OEmcJn5Qc9N1QHUFYpGQaju3v22EGM4HPeyigS744Gf2lYcYFfQuvOjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819248; c=relaxed/simple;
	bh=8dASgvAeQFXZ8Qm5V+syp94x7IID/FvtG2KApiz5+hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZeRSt75XcrIt5udnEIefwus6Pp0ss8yTaTfRI3G6YPiDG5p70j9+jEpsZddE/EKtdnpSjfl0OEA+wMRbJ9oClFaWfaKvnKReszpzzNoQcYZRxszcWeqausYEi/KOMApXeegncKjMj5Cq1u2kOBKGsqEkrxyt6TGw0hzZi4yA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFvzY9+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDtRgkHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFvzY9+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDtRgkHW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08Pk1686255
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=; b=KFvzY9+HNJ3V9Usb
	x6KdEDB9a5K1rCPv5xS+tAR47nsIJBRMEXMrgustFMXsqOoLP6DOq00Wbt7obKUe
	4fEZGcCGwFKVCyYQk9DW0Dyl95Jg7U31Dnhqzgw03diIk5mKx0kg3LqqGO73BlRP
	iQErrB+EkgLTzmiAXLqTFCVIdwM7+w1TlQ/DLLg8UnhsqwBhOIHbN6W/5sDZAr2v
	U5oL7OsthCre+oT8wk7RN5N7jUmpin+wLiH773FL47lt2bQerxXD75wG537YZ0KV
	MYdyPSiMj+g1NiQbATwQyoh515nj9nQf5oygf4LtutnA+FS3KrHTt48g4gtnBlqN
	fNOcyQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1gqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:34:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so8472577c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819246; x=1792424046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=;
        b=CDtRgkHWWhqll05XmWPsbhn9fqCNUqTMeD6AHL+3qkuvvwYo4ktYBg/pjrAAqBtXZM
         DvsC9Bi/VCR9Pqa1htsAxurVg3DH/OrK9vc1sYmSpEQwJUBsyr6tAPlypNoWmOk/u7e8
         8l8CCU57Z7Onb1g4vTbi853aIp9npF6T0DByE5jVqRSZsF4k4OUE/WbKRP8hjtiga0N5
         J7F8NnXDq+xsZt2NSZCuJFkiBVfiUUUAdWTAcK7pNxKMxyG4RxQMhp8iS/tXZg1OnNdt
         47Mc2TtSwqfGEf5YeHoy5DkVHC92qu2ZSNlOEmSlauLmB4LpPAoLkx03vQQFi+BI6lOf
         Vacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819246; x=1792424046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=;
        b=i8JejtkpUSNSUSXmpfeoHtgbn23mA2DOB+jOCQ6ZbrbxpqmuxzAVkcbnowFfzSfWeZ
         +YcH8P0WbCK1p6Q43t6+USyxBJfaDeuhMYuZwhSB3xCdQEvTtToi9Fm9eHhaQLaklU2w
         S2DImsG3y+llEisZAIOC2XzeChnURRlEyo4Rb09Jvos8QrhrPiSuQFM1tAqB62aKiVfv
         HbdLK+v8Bp/h6NGr5O9yju5lsSsBPQiBwucc7oBY3VWUh9UGuSlrmPTereH/5kBZDG7Q
         1fYh3x2W0wxRajN5RUGbybWvjVKZkyzly3skL6rkRjjnyIfDeUYxkj6rrZCfnAAkWGeo
         lpiw==
X-Forwarded-Encrypted: i=1; AKwUvBwN39IvFaM0prIK3SUVeyzKUcpundWjeQSO9T/tFQRWFmY0meyXkExB5hVGGhCD8qKrX6Zi8wczXLQagjDt@vger.kernel.org
X-Gm-Message-State: AFq9FYKQyv5IpLdMbyRCamFu5kzgBXFI7Yim/CvAVEFn60Ru+V7xu0E9
	ydhAIODWqKtl+zdLiEQ5V9U0fQV5tCazvcEbO2zOFKi9BK2NubKYIZqV/Hu2WGzTKJGMHtb6jos
	wdCyPiAV2HHR+SF9Z8g9HCn+A48jNDySuJFyU5QyBE0o/2VvGVm4b7D+EBMqwRe+x8Tld
X-Gm-Gg: AYBFou3G0+OIvdhuY3M/QTDU4bWiK/WOqTkavNaZvD2YoFaWDJS7DOersneSmAWA+XJ
	DLOv4oKyCRX71/bb2fOJUQbDEdF5NOvl8LhMlxBiBBTm2H7Ws2y9C+fpfevreBPNXeHHVImUn1U
	gpL8oqmSFP/4el0UZ2SBrDumVaxPW+zQfcKtwgpVY4S4dWLv+0C5NbPSieN3F7FP5hk2umMNgIS
	KmLpDRYQUTLoY0bUgdfSXTTxWYVzgPI9XF4Qdoy2zDn5MtwY96KHkUCoE9NkgsiiNm+woQA+7Ss
	iyKAEL5xRLRHyGZGPVpWrcCkBbud8iTGMiKTujMsfEaXKxrx8pO2+rQXEDHS1aY+IKcpnUqZSKU
	IvYFuZCPdhbqgvl82+qXwQg==
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr15641140c88.47.1791819246362;
        Mon, 12 Oct 2026 08:34:06 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr15640998c88.47.1791819244510;
        Mon, 12 Oct 2026 08:34:04 -0700 (PDT)
Received: from [192.168.1.8] ([171.76.83.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm40540655c88.23.2026.10.12.08.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:34:03 -0700 (PDT)
Message-ID: <c50aac72-edca-4690-84bc-abe7ade91212@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:03:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
 <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
 <7759e73f-58ab-4a9f-b3ad-2e8a42abc843@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <7759e73f-58ab-4a9f-b3ad-2e8a42abc843@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+uBe8MvK+n90
 O/AWGb7YGNLvY7ljSH3uH/a8uHWBDb8ZDiOhxsK+XMxe4LBMNs12ZEdOumiySpbqfPXyWN+LB1h
 s6JD6EooYybjKpB8b7uzOxpSO3Zwmyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX7240/h6OXUvv
 iTY3xTuG0wgcuMC5Qfrbc3BYbRZY1QbWrQt86cAu3CP/14s0/1EeifgkvFDPxfYEeNeiKQKZ/rM
 GNwHYrRJOtuxXPL06WuIfK8Bq2xchq87T77ptP8YftDgfoKk2SLo4sWvipvwOPMtZlAkVB88OHD
 I93+ZUjzZHFs9OwCwpcoQWv2Zu8DX3bRT+j3ATuaJzLUHK2L35ERsSdVl/evsUtX/ZK/W2hPuUp
 ceyjMP9QFkC10MzZ6eNkx9kqhnShBHYnrkLcEe6C0Z/DerhhPlxr6GhAKuH3gCH/s9gxVYTLtWa
 dTybcA5yL2e01n4yULEV2ZxWO0qMZg05zysneonn4eVGPWPIAsi+XjumJZ4YAeNie5xiHaCwooB
 IjSm3DAhmFJSiRMAsMIjk3U1MsGyTVaaksVSz4OpFEaDCB8G1I0NC/IghiifFlpy9CSIhhZSx6K
 d7eihdqEuwVGrLbrlpw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfdef cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=xT2OdWCu7OPer0wVDpA37Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WhK8QHrt5qDQpnd42zEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 90k9uKZbZT5EnBans6GdnGDdiziePAEG
X-Proofpoint-GUID: 90k9uKZbZT5EnBans6GdnGDdiziePAEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061



On 10/12/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On 12/10/2026 11:50, Anvesh Jain P wrote:
>>
>>
>> On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>>>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>>>> Register fixed dump segments at probe time for attached-state recovery.
>>>>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>>>  1 file changed, 77 insertions(+), 8 deletions(-)
>>>
>>> Why is this separate from Glymur support? How is your device suppose to
>>> work without this patch?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> This patch is diagnostic-only and is not required for OOBMSS boot or SSR
>> recovery; without it, the device works but no OOB coredump is collected.
>>
>> I kept it separate to isolate the optional coredump support. I will make
>> the subject and description generic for coredump support on PAS
>> subsystems with secondary processors, rather than limiting it to
>> Glymur/OOBMSS.
>>
> 
> Commit msg probably should mention that "recovery" is here for
> debugging, not proper device operation. Otherwise single commit, if
> moderately small, is usually bringing entire support for a device.
> 
> Best regards,
> Krzysztof

sure, I will update commit message accordingly.

-- 
Best Regards,
Anvesh

