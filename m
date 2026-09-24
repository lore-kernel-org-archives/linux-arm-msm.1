Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462BB443C1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241367; cv=none; b=UubG3Kz9EiOfsfNGOmSIzOOI8uSoW+Jxm7YS5OjMhMNRCnbw6Sgbd+BnMOISwi7UJ264vOSydAVJF4LmPggEMPB1hgxRwukyD3vPPisceA5r+ncN5+X9qvSNWWBF2y58jMukkmThlUwxxgX9vqFYTCQeER6QOc34i9W9osEArcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241367; c=relaxed/simple;
	bh=UVYxTLF3orwylggdZ4gWvmbd1Lhn0cOSEnzX/WKEq58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fm6Xi1FWvM4q3nCoWjaPsZFCB0LIVo7/TnZ1HsYNenw4JuAhlxqLBLaAZWEMJiZOEloJJ2GeFf+8X9RlSch37TQIv9l8s0BpStjaS+hjR+WAni2C9a3J2x/oglBpUOQx5RLdO7yP9FioHsgyVV4ml1SpWlizwybxaTCrphvP0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqR6OSKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM63hGn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqR6OSKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM63hGn4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eWS01741986
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+eOrLzw/Qpo7C09lkfiDnHmTyrPwyIYLHlIG3/Q0ls=; b=XqR6OSKoDeyKxwqe
	3QNwzc0Vyy/TtVOkIwKybv9y8tZjZ6Bw+z3fBQewLAxs5LE0LFMjGW90qkH9rSe5
	J+57T7AK0f2GK5W1+ygkzzPzbiV1gtdLPtGceBawFB/kKCN3RPCGeT05VWEyAgMj
	QkCNyj3Gee1FE/55JXVIJbm55kCHebrOUpk0+kVK8tCGuNIYLlyZCcq9TjU5uWKO
	N6WjU/egXui8t7WKKHCGRFIu08ciu1htyfQNnJmiWjqktY1YKBeizl1x9KM4Q4oT
	CQbDkTsWlaxvgA0+zG+VkhboDrca2BjM7Lu0JXKReCjlBldv9JaurYzs1EU6L5Wf
	I1CQWQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbm8hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:16:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so1946120eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790241362; x=1790846162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+eOrLzw/Qpo7C09lkfiDnHmTyrPwyIYLHlIG3/Q0ls=;
        b=RM63hGn4ymuPyQQNbJuyrez+q1dwCiMPkexxKUUqHa2CD8B7aloIDjTxyDGv7J34Ri
         TlJUZVwDpRE5p4KizKVyNn/N+SGmWW8szORp43/JbmKOVg0OXTFeZp3Zh5tw1V25eHxF
         rQf8KmaAJTbLtHZEk41qAOaQoUxAvpx3fyuqYismTlVlE0uR6psBcXtH3E3Zj3mv4rVA
         WoIKA6XaR9UNf258ZsFpIIceBpblBRbKy48UTJCQXA+61MKQ3hWZOQqY8how2A5cWMwo
         yBzQJOLW6uWlAIUmgVLbAYT6ittmqU9OB6j5YPICQYPQ5Ko/EUUaLKw7NvytlRmisuWS
         C1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241362; x=1790846162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+eOrLzw/Qpo7C09lkfiDnHmTyrPwyIYLHlIG3/Q0ls=;
        b=VgZwKyU6yDpzKVeQmx/gJnwdLMSu9awWN6oaCwJFQ2ICV2A4Mvf4xmDpdRCpUfkgyR
         EMM+zMrR66M/cFuo+65wfiWKjvSvMC1DJWfW/ccgsHxfhjg10XNOn+sWV2TDWIe0s0Y5
         OZJ4Rg1hqOknN0rdIX7+2nlH0A/7/huIpzJlse0Zj5M3ap/F0ok38Chg4WGcRjdary1F
         3rv+XMZfh66jcfyAPUNYkwOkLrW7foq0rV/fk9e9ZGNPCbIEhiF86WhE+4mxU6v/ia28
         s9B6Ncmq9/JcF8JY6Q6epNUhzCRsOGMct7rw5xXwLVFo+fYZ36wMJTf6QrPPfsTcIDSM
         CDWg==
X-Gm-Message-State: AFuF++nj6oBAmrkNEC/Pzsi3H+6M2XrO6lc7CZFLidLCRm2jNgqmrjPE
	M2JFbvUpFf2csm31/yyhhAA80ZXlsLY6g5kXDhWoX8lYtJnPp/OCoHF5i1J2Yjouh4Dwomp20V6
	1DFsRFHEQ2OI2tDcCohhRyh6eZABRVXH3gtew0TKJaQaV+pWlsDpl4j8RSORGO3poA/Hg
X-Gm-Gg: AYBFou0p/AYYomSQ5AsH3FxEfQD5gBtP88bZ0420SygUZalSeeKTn1dMSNYE1D3bf8s
	q6+VrNfsNN1sun6yDFccaBNQpz/trZ0besl4NqnhkAlUesy+t4zBvZfiLNGfte/f0Ecwxpb2mBt
	RaCCaAVfdy0pMo28TblMt5dAnE7Aai/Yt66q/Npt8dMNHT0TNNOKstv+NRzOgOXp+XRTeQxSaow
	9JromNlDvq6lMFKxRTHZTEAteEkQ4hWHCJ3JRFksmUJnqjrY7CJotmQfhkq6T7wSHSJfRfDZk80
	/IwR8/xS5u0bT+S71RCQwgeniRs7KLbisJe3CC+kZjFOsxdof9/vFhk2EK4YCVweLoMgythu0hq
	E18ZuVy2ZoblHRG0Nlq6FJ0z2g9R0QWCj1z07EUQshBDL
X-Received: by 2002:a05:693c:6392:20b0:33c:12b6:2bfb with SMTP id 5a478bee46e88-34002edeeb7mr1515519eec.24.1790241362240;
        Thu, 24 Sep 2026 02:16:02 -0700 (PDT)
X-Received: by 2002:a05:693c:6392:20b0:33c:12b6:2bfb with SMTP id 5a478bee46e88-34002edeeb7mr1515491eec.24.1790241361632;
        Thu, 24 Sep 2026 02:16:01 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11845179eec.2.2026.09.24.02.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:16:01 -0700 (PDT)
Message-ID: <7bcffc7c-5dda-4ead-a053-7eb4980e43a4@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:45:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] dt-bindings: clock: qcom: ipq5332-gcc: Describe
 clock inputs per compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-5-d242e3d49648@oss.qualcomm.com>
 <62a5fabc-3a06-42fa-9c6b-6504650e712b@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <62a5fabc-3a06-42fa-9c6b-6504650e712b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX0ZAocKlLQ4UD
 87EUA+iCDksnKjIVr99Renlbk+vCMofWtx+6p+xL+3b20Jgh1I40mKE8HllV0Z5HRy0juSWCu+J
 wSGnjdNIuzrAywWB6MxWyi3R8FnMG9g=
X-Proofpoint-GUID: ZuX-Wqrc4SgEhnDvqjAA9tvqaZpkf5fk
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4ea53 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X-K6lUb4N05xD90F8XcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX1TzagNfYOOow
 f7Uqjd8wrF3d50LsfkrByCAvITkMRYG/wbPARyKdFx8FV0IbMJhsZuad3GmXY6R35S2r6oBj7tI
 G5TE+QUBStLSOf+mSJzAj2UWI7029hhiesequ6lBYE6oRK0vIMh1eu0rA0yeYx5me5l2kirxeW/
 ZqPRVCpwZVzvNuUKXdcAOohGRHVu/HvGZbzZioNvbMswO46I0n5k63PinuOj3kOka6p88jpJjh2
 +JVircYtebOHBrgTFsob4qA6ks6ys3alk/Q36PjqVwCJNH1sEeV2XNnf3zpbAEg7dGVFICKET6X
 pHUR9Rs73vX4nogBDc73mT0KncR3Fy/RWS9nz127l+z2sslbYRjfFulwEhmg/4lq4rd0F9bgAQ3
 SI4KWLcthT59XLjRglJQbZImZ4bUaxSWkEdE15Y6wAUb8JyCaRVdkWwJ5OosDUHI43tEIKnEPA3
 +xgIFCzWiYORHL83FDg==
X-Proofpoint-ORIG-GUID: ZuX-Wqrc4SgEhnDvqjAA9tvqaZpkf5fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038


On 9/23/2026 2:17 PM, Krzysztof Kozlowski wrote:
> On 21/09/2026 08:19, Kathiravan Thirumoorthy wrote:
>> The IPQ5332 and IPQ5424 GCC blocks use different clock input orderings.
>> Document the clock inputs in compatible-specific schema constraints instead
>> of using a common clock description.
>>
>> Also add the 375 MHz PPE clock generated by the CMN PLL to the IPQ5424
>> clock input list.
>>
>> This keeps the binding aligned with the clock ordering used by the
>> existing DTS and GCC driver implementations.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26 +++++++++++++---------
>>   1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> index 1230183fc0a9..fb39dffca988 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> @@ -25,14 +25,7 @@ properties:
>>   
>>     clocks:
>>       minItems: 5
>> -    items:
>> -      - description: Board XO clock source
>> -      - description: Sleep clock source
>> -      - description: PCIE 2lane PHY pipe clock source
>> -      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
>> -      - description: USB PCIE wrapper pipe clock source
>> -      - description: PCIE 2-lane PHY2 pipe clock source
>> -      - description: PCIE 2-lane PHY3 pipe clock source
>
> You are changing the order which is ABI break. Describe the actual
> problem to justify such change. Are you saying this was broken since
> beginning or what exactly is not working here? The driver was added by
> Qualcomm in 2024, so how did it even work? It's not some 10 yo legacy
> where we did some mistakes in binding while converting from TXT.
>
> Also, I do not get why the list cannot be shared.

When the bindings was posted, list is combined for both IPQ5332 and 
IPQ5424. But the driver wasn't updated and it was following the below 
order, so was DTS, which is not compatible the DT binding description.

enum {
         DT_XO,
         DT_SLEEP_CLK,
         DT_PCIE30_PHY0_PIPE_CLK,
         DT_PCIE30_PHY1_PIPE_CLK,
         DT_PCIE30_PHY2_PIPE_CLK,
         DT_PCIE30_PHY3_PIPE_CLK,
         DT_USB_PCIE_WRAPPER_PIPE_CLK,
         DT_CMN_PLL_NSS_375M_CLK,
};

So I'm splitting the description between IPQ5332 and IPQ5424 to matching 
with the DTS and the driver description.

>
> Best regards,
> Krzysztof
