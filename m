Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406D421256
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891399; cv=none; b=n1E00rYI8ianWyzL7fjUytpQcEBKX38qFOwJQ4Ti/0elkSdLqLJzdCL9eCRWQOsnORG5djDUIOdO/qdXNR5nNDW+PLk8cdnHbG4m90fnXrbWkABv+KhG9NRK6N59WTgPHJ549r+32wdchhCezhHxZ5PRXBwvPAl4D6xwGuWRCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891399; c=relaxed/simple;
	bh=SjaRgO11ZVAa77PForVsP04f24YEfRy+ox6Gs+mujQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpgEo2lMF6IPTd8nAfCgaFNQUghhFcLW39fHfD6lZlvN8drei96eBxVJ6y7ff6X9s/BufqGNS5FP68MHDyiFVmqHpJD6TOh1jNmFOHKYUQofyFU97LTI8zbwArnEz2bmHNZun/t+++8Fvbcl28ChdxiQrRgrcd1M5xEL4lOun7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eB8r8vo9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KREWTtQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eB8r8vo9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KREWTtQw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADwrT2742726
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux5qS+vam7s/34MW3MovvdC6Je/WYT0RC4mrKVIhqVw=; b=eB8r8vo9xIJzqacz
	WEYbI7oxZo5zmIrFDlHvDtivC2+DNlAkgpf6tip+nzVX2H28i6IT5vKndueJTxVl
	3FEvMdJWFmEnyt+XM32lXDNC8LxwqUvE2aNOSZ4PyN1k4Wv/pB6EfRoDanpBkgmu
	mPRK+FkHQ/Bg1zgeDJxJTMukjbxGk9OYy7v19hS2v2lhCmbzZyEpJeyw8c+2UWha
	iNRRl19KlINckWJm03OZnSr/Z/9OxIUfS9otptHbX45MIbPjJ0KcCQz5xM7tWrnb
	ciov2cO/RaeXUbEbS40+pvQhjNj/R0mPjKc0ADHmG9Y9rJavvIOwEqNDxRnbQW4b
	5JbfSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51g22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:09:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9310484c005so5705585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784891396; x=1785496196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux5qS+vam7s/34MW3MovvdC6Je/WYT0RC4mrKVIhqVw=;
        b=KREWTtQwkwiziMFVPkX5PfIpif8CpkHgvDBqopCZHm+NKgHZYpgIwceh8r4Q2B8Nhx
         p6izjQfBFTrdiUWSAu8Vgc5kHiEouXaWQacx55XQ8+ZdvaqIanmBh6r+U0E2Ig0YAb5d
         pKSwlFnoes4fWQ87OaeV/BsBnC8LKq4LoeVPk0GT8UYPSVgxXGIBuVjTBc8711lWHRXn
         S5ez5qilAgLyba1dULvQ7RTll3+5y3aEogLloJyOjwEK9cS5TEYDEfTqaA53OYd6gQBp
         AhSYEseFKAFUM9nw3JfJyRSkDF7UU7xdHmNuzihwagVOmiFf9XGaNrMTUddkcY5h1CDw
         rTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891396; x=1785496196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux5qS+vam7s/34MW3MovvdC6Je/WYT0RC4mrKVIhqVw=;
        b=QYec+wXtWdFVmqR1EN3RxEojy2rOh+Dbe+En3kqPfPyHgULBAaHJp9tSPYFaEyiJtQ
         NupND3VwD4plKNGzJkq8xjP/fV8MDsDUL+sdjJrxve6Qs/dPsxPxm9U8kbGhJ403Lyqz
         Bc1GzUErInaVbS7OGd+tfCa0AsdN8qR4xFzoR9fpxWiyNjoQxnO4x4A6BAAHUnzKP3Yx
         izh9o1OJ9TNwS8rZi8aLp3fsUU9q5gKjaGibHRNZfWIR0lbKbtLmIN6aCEKmQYkHI77v
         cmw6I+QNWeNHqi/M9cNeb4X/HLgtLVrg5MzBraGTToAf4ghY9e+jpu4Qd5aKNt5VU4Ow
         gcFQ==
X-Gm-Message-State: AOJu0YwPR9/zerHO6XaNgpD61K/CvvhCpxWKF8pFcwbvA9fAKg3QhdM1
	X75CEU3xsrcQh/xK90RwLURKTmzb9QOIa4ZEdb72vJYer+L9zQkPkUOqpmwUUuClrAiH3BhWQrK
	dKjxji+6ms2O0YIHpQMpHfJGN+UpBO4zUHvaakFlK29IPH8zN277EmWV1q4mNfDFCLAk7aCyFW1
	2Y
X-Gm-Gg: AR+sD10q5UHDbnQaDn7bctE6j+uDEVwQS9ZQeToKmXEll/Sf6evGj0aeWhQQMeKz4ZD
	/jgg8cPlqqEBLcCJCrhjJcA3M2W+23HwYjqKa5qDPqRCoGGjwhha+TXaC3u14F94tJbOfrmPXjr
	rEcPWRD39di2Dzq6if/blQpgwvA9xA0QCO4Qb/VDy7OIlcI3xvwg1CbrTPfs1AlXTGPFcNT/NiI
	1bJ65pKVqkWXrfmLguu0Jk8nTrQLYMiSg3JOZ7osrvPFUiwTr3cZFyVjLsRJBwPDADrR0o6qQEj
	aPOQbfg5tVAnhbvrE3CFWKmTou6kQwGuUOlAhAUvxFlObwSAMHav+HL0IWaxvKle1QV2UNOLNbA
	dYy3vIjOlBJ2eTPj3B2fuHDOV
X-Received: by 2002:a05:620a:4804:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9310365429amr571676085a.2.1784891396588;
        Fri, 24 Jul 2026 04:09:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9310365429amr571673785a.2.1784891396117;
        Fri, 24 Jul 2026 04:09:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b92a98sm3034189a12.10.2026.07.24.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:09:55 -0700 (PDT)
Message-ID: <36ec6823-8792-4015-8693-ff6937dca771@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a634805 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VaiqnSBy5ELP4sQjxKAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rgUUpgF6n5op3GdmyDWdShxlfMyegEw6
X-Proofpoint-ORIG-GUID: rgUUpgF6n5op3GdmyDWdShxlfMyegEw6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX95butxu1AhUM
 MiepgVHX5LdPye8OXgyWBP4zkV1RKsQ0KUosOr3mxfF8iWeN1kEw+RpkW/02X+btfe349U6lwIO
 RmLejR4+REA7SH26gDZh9NLkWVceDlI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfXxwUFcUsyqo0L
 DHoACot8/CxoDa3NaGq3GDf1eNgAOTVCVZwoeQpccIoA/uD5hxAeza4cZ7omXyiRMuB+fIC6mD8
 77lKul4EfnD6vxc1GJ18Ew5cPjT07pDqQEhTEYeaZ4WMx9uYc40SGWTMcVQcluWizPsT5yBZSGQ
 LXpeem8Tqge16NN6s2wP2C9qsbRCSYd68s+F/+cM4rfwmp/B5Dd0/30X4TS6Lkrts7V8nhzsJx5
 exSVoTQH1s4CueyfXiFIszhqKm77fRK8RHaZHu8DLf3OQ1ctrnLcLx8txNFm4mRyDC56xJwcSqW
 /C9Jpa0FqdoouApN58Waz85HTe+C3UbJkd9ieSRFFSnCDOsaZ3XwAb4PGCz0vnMbPUaHob+d5dj
 NJrT/3+vQqH+/GBrEKftZL5a6rdSZ6KwhPec4XM3+9dgFKdafQ6rOZmq9StBydHxM79pTdm20P7
 36IGDsknO/d9H3qB0Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240101

On 7/20/26 12:49 PM, Komal Bajaj wrote:
> Add gpio-reserved-ranges property to the TLMM node for both Shikra
> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
> from the non-secure world and dedicated to fixed functions.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
