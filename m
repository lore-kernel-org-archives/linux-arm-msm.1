Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573428;
	b=RZfCQRctWDdj6JVp+2+ug0UElR5u00c7IvoIni0L0riUv0eMsHUb/AM6rItrf4+nMezn
	 FcmgLfEU+0/Cvu1RV/7fDtHaHPH8k3w0prhLL9lBbC5zzPxX0c4r3A9QDq4xkhOF/WP5q
	 vlEdM26XwGMGeXf+Iwev+dFxpquXXnm9Y4tnDfUROBA1zxUJR8I1PCDckNEmsbc2UHmvu
	 VRnVZ4Hy6YuCXKW1hhn5AopsB4hqpftzKiPp3Eziyx05Lx+o4k+oqbW10ecSM7bwYdVsV
	 O4h/L25dZUca7cGDzKMaC76voe1o2RDPaNwh/7wWO2vFCCpa0hBRxVhY5yDUx5KPpow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
	b=3JLcevTiPRnc/EDFp7wnZz1LNODhp71RNKxdkkBrtf0/iAdL5K63jIfSCGydS3Yo3L2l
	 d5jp6p8i27tIxtJ7Wj6L8EUu7LuUtW57E64AE36K9gXn13zBG1kcwWjE773lCTyJfBBj5
	 8kcj7exR+xn428aM+Paf8xLbs9R1z75c5BbTlsIBm56eAwtYC6lhNG3nTOG2I+keinxXg
	 joTBhRV81uW1RUQDoAr8Ib9bA1gfqukpLJyaVc7Kz8GY7QjlSzpUJveMfsDRMC15/ZsHA
	 mv271K2YXzUKoKbLc9cK1cyEkAAWaoTV0zbB0So/kdVwQs4+zqNGSk9+JiJ4xIj1JDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+Hq+DUt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2UIYRLc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3C606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+Hq+DUt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2UIYRLc
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VSRc2795069
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=; b=Z+Hq+DUtwjM3e+7q
	FQiql8qBvO9CK7NZQpBz+IQ1xlHSd3P98RmIslutyrqCR8nx7FY7PMc/tbRLXmFI
	7054hLp+yWXH1m8FoR6tF3/ZuowLXg2QpXNlaI+4lbqWOqtVr7SbTFBQOiUEAYJ7
	E25TqyjLVCxfBhX+Mhk0Lj+UiuTskaTGV8IdC7UY5C80UV7i/ve7UZuBYSMfTAU5
	tA3a7WwfoWf/zvJ2P0POOu0RjedPoZcHWTz931+tTR5s9xMHTSTwMwAK0mNW7/jL
	Y+vnjmjigckwPgu1LF/+rkI0KI6hBPi9WPi4PPnNjs35uMlDjdFctdPLTBCyC5f0
	398H0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7898y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:03:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso787175eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573426; x=1793178226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
        b=T2UIYRLciffuZJlr26g21fr8jtvvPFPP/gRqchv2nLjkRmPt3B/2k/KK9MxnIpfO+2
         ZeKyJzc3HnYrq0kwnY/jLVTFhhtBJ90u4ld3TjvJmZc4bHFIt+/04gkCj5Gq2NGx45KA
         oorpMgEo/o4i2L5QxULCsx6rihvYSyOsyvdfagYEB9Zlpe5CPomTDqPzWF8/w0oq+9rM
         X6qsAtKvappWozuJW2ldOr9xoobUrpWADZ9+9iL9E4ifJpvrk5mmfTVsmem5LVTw9srJ
         9dCvuNnc7kxqoFF+0TXhgMJgLOif21H7gB9a1qpZ+aHhQfwMMmZWEDHR3grWPIRpORgg
         3c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573426; x=1793178226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
        b=zdYQQdtqDO4tHfMOzuvYCPgAJK3l+p9GuyWHRmUQjgGwH4khX30W4juPabqnAIW0h/
         HZpeh/dqdrndJ5puiJRvW4UO237FKtWlMJ2v1YQ1hkCKarYntlHQ7Vp6RPVJ8M8vjHQ5
         WTNN2g6nwGWZSHN+UM/8d0HBHDzD41ZK92X1fBf25OE8s2hDKeSrpeAYB5dRddxT3W8P
         RoPFUUxkBE6wt48MS7Kj04awWm034NO0Lg5RqnR9iDISXD9KDxvAZjxCVGK8IFmlF7b2
         YSKLEPwG03p9as3o4bgfB0WuCRnuXOEUspyyJCjzFdpCqLi47M0FbDxbJI0brdUxm9GO
         kHHw==
X-Forwarded-Encrypted: i=1; AKwUvBwx+Tcwuovinr4JGqw/QqRW9LKm5WnPnEaIFME6Dp+CbmtxGDCht5z3rx6hGlMKrXy4BkyRX0lAne9c9EH3@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ27DWYZg5HdkRvHiixdmyFvRStV6qTPql6BjDj1/k/AZrpNSb
	MqadmgTl275JMo/tlfwWy9fP0IEeJDaoO97QGGe+xZnNuj4l0m2jo/F9urle/d8/6I+vCixCcsA
	JbkY4TLpIgSGFTVzptmxB1Wk6PsGjjicYwSwq9Ehh6wRKHnMPt0feoeB96NmYyfuWnfP7
X-Gm-Gg: AYBFou1MqRqK0EPaRdtayjnYe0sppbS76BhSJQ0aPPP4K05iWO2gCSz1YbRUhH9x1YJ
	abFJ1bHzqNkF8ozKHvahSjGSOoyrOCP8ueG0RwOeEKF1G8vUlvkfW7gvmxkTKgUpQefwg1nmKHq
	lMnbgePIJ6iGUbGQGnpwDC/VvwFP6TxYnMIXhoc0M0DTbAu00lA4sHkCRfbXX5pf736z+KB6tK/
	EQiL4pCULDU2B46POhZqonAa3o4zAAUCmcwMMA4x97gqAwIFdm2tdVY3eMenUx47bGkpwHUGDuE
	e7GkOn0gkj/P/SCXU2h2QR5Ylz7mFl60KMP2uZmWSt4okAb+O2VRwbeOWsNCY+06jejFHCD9eKG
	I+c5ehqVwqZrFFVrJqh0Li3CJMMjGlTc=
X-Received: by 2002:a05:7300:d090:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3674db5680cmr2001087eec.15.1792573426029;
        Wed, 21 Oct 2026 02:03:46 -0700 (PDT)
X-Received: by 2002:a05:7300:d090:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3674db5680cmr2001055eec.15.1792573425175;
        Wed, 21 Oct 2026 02:03:45 -0700 (PDT)
Received: from [10.217.223.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm7902967eec.24.2026.10.21.02.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:03:44 -0700 (PDT)
Message-ID: <ff0a5a0a-92de-46f3-9377-ee601d8d12fa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:33:39 +0530
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oWADNFpQQi4Ofgb44FOl7yqSCjk3De-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX9Nqv9AJpMKb3
 vYFJPFQ7CaJ9YBf7hxLljLM+H9ej1sH9PNeTYoQC8Xm+nKp9xDoxm6LOzucuV6QuEm078xoMqrN
 eVLsjD1RQkZmKJ/ZhuyyVVhDR8JUKw6c8wrNrhFcCHjGSFs913cDHl2jyZabxCWPJqGwXUIs9U0
 /MECeL9JMKKDiTjTwoSkFzr9fY3J6G2jYAb7HmcA8B221XQOiZfOsyTGKztoOmbQ2IxoBaaMnhz
 /sbkIh5OhhqnemZVPchyTWMQltrJJ28X6tUcwBgoVraakugAkOwuwT2LgBulFjqhB97lXs4r0Ny
 o8lrpvHn9vL7ZCAJ95YMkS0snHAZu4aprPrImuiT6NUiMbrMlTht8TkpVXA/saQUd+ijpBCpEWG
 JL/GcMngE4KGqgziOPOziXGL+lCxNrez3FkfcxMzhmBnQZQZas79roZY84C32qozyEpn/QzRL0P
 loHCvr+qZpa8pGpu5Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX55NNob0NWsYg
 NDFeTPKQ28cBW44cd1wJ/UAtBlXQeBTk+I92zxG/lZN3/K/vRS70EztCbqPMojjCugCNkws86ad
 c7io2PN0QdML9Yv9UhlXPH+GdSluSus=
X-Proofpoint-ORIG-GUID: oWADNFpQQi4Ofgb44FOl7yqSCjk3De-L
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad87ff2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iDK90Gyl-TMhxqDKVhgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035



On 10/20/2026 5:46 PM, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Add initial device tree support for the Lemans SA8255P Ride board. Enable
>> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
>> zones for PMM8654AU sensors, and SCMI protocol nodes.
>>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	thermal-zones {
>> +		pmm8654au_0_thermal: pm8255-0-thermal {
>> +			polling-delay-passive = <100>;
> 
> Do we need the polling, is there no interrupt?
> 
> [...]
> 
> 
>> +&pcie0_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
>> +		    &pcie0_ep_wake_default>;
>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> This GPIO reference feels like a layering violation - the previous
> commit promised TLMM is abstracted away

Hi Konard,

For PCIe EP, the TLMM gpio's are controlled via kernel and are not 
abstracted. Possibly we need to reserve them for kernel only.

-Shazad

> 
> Konrad

