Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B51D9A66
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871596; cv=none; b=spNZ8nbR1T+sYf3wxMwOoc6hsTgPWN+rqx1r4gMjIa/UIUZ7v7b4tBGyHhtKq4p7p23I3Jx0YV8W7DVa2svkpmtNQaMEz1NB4HFX53vlOVkocsJpxmlembz2hHpiQOwKHhUSswRz3gJvPOYQl/HeuDAlZ8zIye/zAbzX5RVPzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871596; c=relaxed/simple;
	bh=jKBCUCn+td6u/3sbwm42C8Jz26hnQBdGnVitYLh9jlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvcprQRnD++9sMF3csdG8oNs7uwYJMK5/RN7bjY37bXUyUgMTyopNyP6MZaxwSUHHVT1uctDII97hkjeekchxV7V6goX7SZD6CAuUri++hC6jC34+RniXd+lYjytrqGk/lISb5roOJh5PQbYWX5o1P+sA8vWS1tRunBdH20uoOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xp6MWfu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa1WjjRS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xp6MWfu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa1WjjRS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21DmU3752521
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=; b=Xp6MWfu03rxCXJ4X
	9WoxFhM/UBuwwDdjrTmhhS4hQxjt7O7WKG7MLK2BMtKMMjRpkJWC3or5TmXXgOKa
	lGX19fmYFMpkryFjBG0drysSKqO8kbtOdQX8gD9f6WpUjRsUMbay4u+cV1xbDgJF
	Ycs1r24wen8yZwCplQ17VSBqYJxFb614Szrg/ynnYXVp52aOr0utTttf0NaE3HiF
	Xwu/UXpjh86KjAi1hpmtU+RYGMLA5fpc+NHcZZJEJVCQCe1M3+MJYbU5S3VTX40N
	pkPEvWJldnVl9Kbz70Y2tc+9fgnrFnqV9CtJTL9IQ4+SyeqzZ6vv+1VPYFTdThs+
	nmuvGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w2gut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so1877713eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 23:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791871593; x=1792476393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=;
        b=Oa1WjjRSY5OzHOtJ1Gf23VzPi13ovkWhurUo9ZqEooZrVdWnAgHIfSWeag3xF8dfwx
         cRLeWjzcFKowB7fpmPlRfOjLfH7mxIM13qyPXoR5O9AITaGBIsgWe7Jn9XCBdIiQgJRh
         WrI1bP1zI+0eK27fv97cSY/xivxLnAJJHuKtFDgn4uK8/Tn6n+959IqKFNccR+Kt5o+l
         T/k5cAxMz1KWiit//ETHpqku92jUiJ1BzRAWVTSK7iaydeCP7F4z5RP965mk9MI3yWFx
         IEM7bsSjc09DwK5NoKStyA36vc+6d+ypt7ryMIy1ecWmAxuQORV4Ei5xX9fk1UOni4lj
         tUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871593; x=1792476393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=;
        b=GuIxaPa+CnvHWXUG1i/M2TrHQfoRhnbcSgQh6EG6BxfGYG79jOodN/TrmZJWtwMfiT
         xwIhXSSKHH1QMyu4xbQz0yRicpu94KHicfYsgXGxLwf1fJUvAOh1DTuhtaq3nExqmViz
         srdCeCaBScaystzaFqf7uiXPFjyViQX2GdUHBJjVGkQiQ9fOhiYjopKz2L131Us24Iak
         EIqeh6WUOEUUqDeE2ZYEbFYmuUL2DdcviQfkz1Eh+edUFDELOO+zn2mjAYXTvoafEY6U
         b5PKPQuojSjWC8YSzPhXhHRVBknhCVPINVVcdiZoRi6MHsheWo2IuN/WWAa4EDtyGcio
         Hxsw==
X-Gm-Message-State: AFq9FYKIKN4mWWaPyAllnTsNtWdQ0LDQ99vlHMomwWjDBwicIejidAId
	RZjpM5yhogpgBahsMkUcE4xAtIxiFiMjpafqgc+j5FJPcow4VD3KmYAtZI9bRh3OyTNFIE0RdFo
	3Jv0SYu+MRANULiS5ftmUBhANl7SZXvDLJFZMrkPLw38ZGQwt47fIBtJUKRbzTTMH4FU/
X-Gm-Gg: AYBFou2HJ43HBCz+hR93XOXBmsvB+B5Yc87CLiNoo/W8mtZ/T7ArvADlfyD94Q+yb4R
	d+BKkYFicRhRzjAoqyoxljUSW5P+DSm8RGjpqdRNLPZNPhp3NdMjUCa0enL85RdRlvUKuuOI6iF
	SOn61ylE8a2OpVUlVVogGwrxlCZtSRlGLCZYNBOuBbS5YFK1zS1p/hKp/Q+fiuwk90kbyxeN9DN
	LMRTjnfWKWdh7Euzf/+RqhE2Ku1gEwfuzig+FilIgcDba6Ye/092PXLBDvv6NC6C1GJL6C9emMH
	/+M3Hd8GAP5nvaw51wsEIlHYcUtB0J1zvKHZJhuUYgN49i3DSd1BHexzOu6yRAoZijCob69UNQK
	ediB971qJhnO0JAjM/p7mxjDPi2fNpEZXkA==
X-Received: by 2002:a05:693c:240c:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-35cdd035d62mr237985eec.26.1791871592530;
        Mon, 12 Oct 2026 23:06:32 -0700 (PDT)
X-Received: by 2002:a05:693c:240c:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-35cdd035d62mr237937eec.26.1791871591944;
        Mon, 12 Oct 2026 23:06:31 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.141.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm37232595eec.6.2026.10.12.23.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 23:06:31 -0700 (PDT)
Message-ID: <43f487cc-c8e3-4993-bf1e-41e3a9aaa7e3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:36:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] media: qcom: Add support for the iris codec on
 shikra
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FTIvqlxPcMGhQ0K995vTB1orYJF7Y-hv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX0oucNBRGnlnn
 v2/8nKGONQ7NpULeMMbQUfW+wYzn00WRRtFbz5ds9IO6kDp5HH4boUTmc5L0b5wB76Jc8xmqHRr
 tB/cUOi33vZoE7DHYIazLtDhQxkCJh8POpVvOE4IPTWc8UZSv7CI7DoLnUbmEYbqlPiZ9J6hXI2
 UrkWDnDhJ4H2t2yZMm9/KTpeJnfBlEXBsViQ5OYHzRsq+bJ95Jx5JgZqy7W7URqA+Fvldq1qsQt
 KZ1y0U5INT8aRNa+sfrJOscqIyrCxM/obRk5nGQAiau4AUGTLCsyQ9I+ibI3v6E66fWkyLbD+uE
 uFahj/dKzQkFF+W03Z4Elp1gN17U66k3O/DxnKfV2Izcow5jWCjOVP4N0RZN7DC7eCfzDGDEa1+
 uWT/UrAE40naRj439XY8axfMz9EPwL7iDjfsSjNvFYjlVwrTQdPtcx77+tzc7wVk5vogIu2KSYC
 tEwurrrG8uyKLceZ8tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfXzaYBkfoX0GGp
 ANzgdABoA5Da8KNORtzw8aWsud4kSl7gyyW0ppZ9OwyAY4+hZlSYe3VjNTetGUL5KwhK3WzTCeY
 IiMe6MPaDUErdj1ymrSSk54CY62028g=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdca69 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=bQUMaMctTmycBtt4xuJn5A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Q6wxVgh2rZIxxIaB2AUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: FTIvqlxPcMGhQ0K995vTB1orYJF7Y-hv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130024

Hello Bjorn,

On 10/1/2026 7:11 PM, Vikash Garodia wrote:
> Vikash Garodia (2):
>        arm64: dts: qcom: shikra: Add Iris video codec node
>        arm64: dts: qcom: shikra-evk: Enable Iris core
> 
>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi |  6 ++++
>   arch/arm64/boot/dts/qcom/shikra.dtsi     | 61 ++++++++++++++++++++++++++++++++
>   2 files changed, 67 insertions(+)

Do you plan to apply the DT patches to get them in 7.4 ?

Regards,
Vikash
