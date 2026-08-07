Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8D3EC82D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103070; cv=none; b=bYMiZwLqYobofPb0sqvohlCPPX3X7x9Z8as5mQS23WG4RG0Z8vNQEmchH/WjPQpjpJW4DkYyr9omm3lkvYQGKBt1XBM9eGpEgSQUZA24JVjokTnusbXZjRqflVjSLhlRBEzer0Rl1+7cN3tZub5BlN8n+13h/Q5xQohZsm2V0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103070; c=relaxed/simple;
	bh=lvT8dVYXxfEOz4ErWFt/xXCh3QyEZQewy6lMEOSEFVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubM/ac6NmnTPON9oq3atwXclw3PIncVxpwLZ2TvX9zaIbBUh44zBzdM0MWjdGWVn2aE9MdyfX7bO8EyjlGW5F4vGXVYeXYd7A6ZysnjIEIMJ96sfKos4QSGI+KvP8T6dg/9t11cbXDrQgzN5SWTTF26TeGPvuqMSjjSESsTcl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nT8LdQDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi4mYJN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nT8LdQDL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi4mYJN3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778BEDl3477030
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lln9kERXdMSFRdJYrPVHxT3nCzyfX5jDwbqscZSNrTM=; b=nT8LdQDLY6KFiefa
	nQP1vCt/SsffdJGiemHley3x0ovtAOaYvKu8ijgmDhMQrWbOCVBF0ZmL2k/5avOF
	ikdGuTDmIKJvv8F0fM/sEgaCUi5GKpu58c7Dqc24qepaaVuPadBEfiWYxNSvToWw
	eNcz24f8iT2XWLh0+OAx5Rx1OECE9LDZjds1fe6MxjfqzoN6ExPnPNbm28+YjBiV
	+TyzAUg+2/DBObD87M+NBwNB2RDHSIf/o5qshaWZBfcf8baFnn9CriGjxW2AFYSg
	IsGGuXqEX1Cl96j7Xl8Mg6zas5N++xgtAX6PuhxQJ02dE8HD92kD0owNG1HKRbYs
	hiFp5w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hbqq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 11:44:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so2866865b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786103053; x=1786707853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lln9kERXdMSFRdJYrPVHxT3nCzyfX5jDwbqscZSNrTM=;
        b=Oi4mYJN3KFAa8oaErTDRAIDDrbNZphobPEcIS+TKQaslJt+W78CirTlXtCBpJbma4K
         6Bjq9GosI/hufP3LFpsygqbX4JaNHT3yQNYJdo4A/M0ws6ZDRP+LFdhvMVskJ3k5Bbfa
         cU0X+NQxvXAiE/57yEaWkvXqXPj6sD6kJIiil1kJLmqZq2HNnMeXiSXI61+M+hS5EIX+
         sMwVICrWuT6Eu/eLGGesUcYTHFn12Lk/orVbuL/v2+P+2OYdzw/c0QUb+K327TCWgyl4
         fCS2U4qfjGhAj6vvsN1N+qbC1p+Fh+05gYE+/qs/YMDee6fip5Ct684cfadQuHnQXWhM
         FcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786103053; x=1786707853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lln9kERXdMSFRdJYrPVHxT3nCzyfX5jDwbqscZSNrTM=;
        b=d2ALyDPV5CezkblU4P/9wBxINj/7fnh/0i+QIV7dwJLazXghkRCLxnpE/sYFVGQH7d
         Z9VDHGH9YZ3mzDLGWesLuMwfrfi9nDUBgdaOnx6m5H7FFlpgCqnDDBiu5oQ2sM2Bim7+
         ndMRToMoS5k6Iw4ycs9UpNz+poXEFv6QhvsYHhytfXv3dle6/gHsWlSa+tCYD0RTFFGu
         mx38mAH7P38NPY+Zkl3ggEv6iOQF7jMbBvJ+xELX2E8xBG9PI4jOpa0BdcfKHl1L9YOT
         KDvktemix/N2o5WnYOZQcsI+Khf2AF1zzWISF2xuBwBkpwaQ/cgY4WWTolRgS+eSoL2R
         1Jxw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4InHviMT8eqJ6/MDtB3rtp0qESz+ifPnQIUdCD41ieXm7LsGw5b46ahzarNn8vVKzTFi2jc/aAF9dRXat@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqT/a2Yt6dNkznwgAeHb2l10ZpkrNaHIcP3nS3uPwcA4espfL
	Ut7cHTRD0a3bBlruFSyA0AVlFsQ5r5bsootnyo//Cvp0riead7E8VtaEeUkZAX2ifag5Nqzw9Hs
	9p8AcjfB0M5ZODy6jPjP/XQgpwK/3EexZ4tvD3CF30bKI/DqQ94moH2sXyOtS1YRAZrIzuskxjv
	TK
X-Gm-Gg: AR+sD12qmXHbenvy3MWy9CiQbq/hMiSMJlgD4qABDTetQHAcgX4R8+qKMrQBvqwleOd
	4CbVCJCKBN8mhA0RPx6DhlcZM9rGkGP//zTR3bX8AX4ICA/y3zsEFJj4Fx6Je7gcr/itBQw+7Yg
	IJyun0y70R/jJ/Zc+wO+V0t0RunO0IcMHjC+DT1OKoi8cetJBm0tTVMFaEki2sAfzC/oToDkJVA
	D5l5VpNSdGVsJjCFwzuQ8s5xhSSsvTjCZxcgwlTu7/g7pTBpoherwfO65yYz5X2wQFt3QKSazkb
	GQbGR1mk7TQSYcHdJqAUxKr6tpnHu4OseEJukCRw92iQPfp+nGy0cLcg9/sfzn6BT/H3/z2jy85
	guMC2IHL0SvLs4VxWVIA6jOBCFBpHdOubL7EQZU+0yU+gZw==
X-Received: by 2002:a05:6a00:3d4f:b0:847:9188:e492 with SMTP id d2e1a72fcca58-84f2e04d173mr22586363b3a.22.1786103052897;
        Fri, 07 Aug 2026 04:44:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4f:b0:847:9188:e492 with SMTP id d2e1a72fcca58-84f2e04d173mr22586318b3a.22.1786103052457;
        Fri, 07 Aug 2026 04:44:12 -0700 (PDT)
Received: from [192.168.1.12] ([122.164.82.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f383c4dsm590767a12.28.2026.08.07.04.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 04:44:11 -0700 (PDT)
Message-ID: <c4a85f53-e84f-451e-93fb-e53335e02d17@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 17:14:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc: Update the SCT table for IPQ5424
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com>
 <q5b6lkfejj6ejqhl7ta7xtmwk4qetnelyxuy6li62vccko27gc@ys5wru2sja2u>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <q5b6lkfejj6ejqhl7ta7xtmwk4qetnelyxuy6li62vccko27gc@ys5wru2sja2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XKmjlXPkWd2MoY19RGNwHO5IVuz9W3S7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MCBTYWx0ZWRfX8pPO6PJjRaIn
 N1likMn/VDM1xcSsKFQfJcYVwr/m8k+/g8dcZmhCL5G3mxTYj346EO54SrEvQ4QOjSnH0yYqqdI
 sRSZ5fHpfYz1fvs6PjV43urAtFr0c8qDqlYukUzhwHEZu80MFChqbM77T38myetzaz8CPf5Lz7J
 81t+PKC5rftTbsGRUc3tsAdgWr2s+yKKazJfDSdcnveLeduCqT63s2mybL3tnQrJCrpGLdGyGd6
 igDq9CQVg3OUncCzn8l+/I6dizcQY70MYCc1tnhTgRmTv7z+nRv56mSvz4NIlSX0Yh4gNzO73oQ
 XJ7M9IOmxmVdYC/eAy5Z59UqB5b400Vg1zQgRHzkLZRVIx4Jnk8HQTUzY/69bcZd0QNq6FHC1H1
 11pRXDXtkqBnbd4KH4xXhhoBFFWJDq/fB8nVa3gw+wcwmzuE/QCsJPGSWxNsxpsLK+6nP71viVc
 QI2svYpxKnef8FTdKOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MCBTYWx0ZWRfX+4O3bUws2WoQ
 sfkzXUi3swUy5YQ0XMBCSUzyOOIyHopHF94l+XaR8/w3Zt8S7NymOrvzVPzrMDnnc000v9V4z7N
 /RA44GU21LdoOo7FtHUHwlEGJl2x/fs=
X-Proofpoint-ORIG-GUID: XKmjlXPkWd2MoY19RGNwHO5IVuz9W3S7
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75c512 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=y7PaeC/M+x+Sw+7h2JA03w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4pKe--ygYk9DO-BB_LoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070090


On 8/7/2026 2:35 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 07, 2026 at 02:08:16PM +0530, Kathiravan Thirumoorthy wrote:
>> Update the IPQ5424 LLCC slice configuration table to match the intended
>> cache consumers on the SoC.
>>
>> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
>> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
>> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
>> and way masks for these consumers.
>>
>> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
>> LLCC_VIDSC0 do not describe the actual users of those slices.
> All of this: why? Your tool has provided a summary of the changes, which
> is useless.

Having the dedicated slice configuration for each of these use cases 
helps to improve the networking throughput by more than 1 Gbps.

Let me amend the commit message with the above information. Please let 
me know if that helps.

>
>> Assisted-by: LLM
> Which one?

As per the updated guideline [1], this is what expected.

[1] 816d9992d9ed ("coding-assistants: simplify attribution")

>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c       | 56 ++++++++++++++++++++++++++++++++------
>>   include/linux/soc/qcom/llcc-qcom.h |  4 +++
>>   2 files changed, 52 insertions(+), 8 deletions(-)
