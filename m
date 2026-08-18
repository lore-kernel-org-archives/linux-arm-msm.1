Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CF3C65E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048981; cv=none; b=kZpYdI3zsX91fjHFmM/CL20aGfavTzMP24mnHvtzqy2Km9NS8IUizPhBrHadvWXLv5Mij1HhQ3hDX45kR3cBMdzs2bhralvAd+sCGwNkHs9kf58nQOy5YdLcnIIw4m14mLmb/IArHR4q6fGgA+MobCvfNGoO0g3vzG5R2Lws9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048981; c=relaxed/simple;
	bh=gKG8OSS0s8XjujGAuxjEGForeKdjUMTHTIRH8G+B09Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0uChS9oKPpDPcSCT4fiWp7yUMOA3hAShK0XDYP+49y5VoNIpxolRjHx/njSWnbUEFRBMaLd+lB+8Y4tqOkdDr15xGgthtcOpeBv8zF0i/SM43gpTTCGuwFmhwxDeoTheTUncNy3uh+QGaaDHLxz+TSIJM5zDJ3OshpbpTWbkD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3klesMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx8pvhlo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3klesMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx8pvhlo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABQAe995797
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwvaPEIoIhQ1ukuzWJGk+aWx8iPKAsZTljEwBQq5jVo=; b=a3klesMhnaJ+n0XL
	/E/HKhWA5C5DL9pOrHSJ42uhaZ4727hrZ0XlT1IztpiPMw9tfA4UA2XTCI1SRRza
	iSgJ91D0S2Vg1woNuqPdTrQfTybKVk8RYadeTYmd6JxdgoHWHeaA3G7Lazbnopgw
	kVjNx4r4HASkfOiXyfRhIXJCNb1BVME6TliSo43SoeWR7eFjsKUPRgg84eWDeBMx
	qzloqv3Ux/z7j6OeuU5hXOPAE9PjthTRRXHoiwHBVOWC0ZsY/LDL8JqpLc1RQIoh
	kBrzdraowMasFLVxQgYyiicJsULT7+GB6N56PfT+GgFcwlIdku1CBBjd3bWuRKRg
	bqL92g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615kwxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:29:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so915567a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048979; x=1787653779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwvaPEIoIhQ1ukuzWJGk+aWx8iPKAsZTljEwBQq5jVo=;
        b=Yx8pvhloznfRPYo7SOpqlNHfP3rmnzU7+UqUpREvyFK37gYbmgCUUL1xCLpNoO7AlL
         8QuU1HhkKIPsLSVxswRS46n5xfl13HJGGFKbOMhJV+I8AAFjQ+t8ht9rqHB4Qmkeu+1b
         ZwbcBSe/+l1Tcny+t3HelRF+uOOdza2y9cHeuB63m+Fnq2liQxT2DFPQ8wrkL2QuK92h
         fv2b1J08NkE1nWMCsQJ3nm8jhRn84ypFda/hcct6T2tfg19ACgpCN+IfU4T/oyBeiAcY
         esUey1lLzenw2g5KiRvNkZClqnvlhjRfHpyqPMHz16GbuHz4lTYXKd2J70onOW/JpSSD
         S24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048979; x=1787653779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwvaPEIoIhQ1ukuzWJGk+aWx8iPKAsZTljEwBQq5jVo=;
        b=YsqymLbvQEDkiW+oKJvAGFgTJJLhYFetHr57JNDsb3Vn7Rmi0iqEFMwlpBbAu8GjF0
         fAYT39D9eCBMgkD6CKJE8Es9DAuukH9jWWnuInxiwL6H83JmEZiauNa3XKm/zTVoHwbK
         Xm0DZoeuHcWiVKmqPcKRxIZBS2Mjaql/JM9VPMV9eMTmcWJ3bgUjdNgXOPGe6wamRv5o
         H3Gdeo9kfiDnhahPH5Fq+m6IruaZ09KMDf+EGbDMBaLVXzfBv7NVNSnhH7mPtmneP6l2
         D9holsM7AiFJJne8faRZ97aPf/ZPjDTufCwdGrRKI+vKAZf6xTxl0LNd6P7YKmwAmOd5
         y94Q==
X-Forwarded-Encrypted: i=1; AHgh+RotifRoCCYTSo3prWZcDxvjZQJfebCoYtuun87fj/5S8OwuZw36NLyudxEvqffBV0D84lpDD8c1GAInw4em@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ao9/orlYX8/OYG4QIpOpFo1GY/zb4foOwZ00wfLxO1/rUpWL
	P3RurWLx3RFc9EirGNeJCLlOfwiaearBUwwuiUIpvkclhFs/2+cQURiid7TFfYlK+Eyz6NWcNFr
	/JFmpcYlr0fQ3vwTQ+7zgfCikoq/YZTUxK3l71K7o6TkUbW3HijtuoCHUG9UBHm7KwIU=
X-Gm-Gg: AR+sD10wlNYZV9UZVMo6y3sqKHWhjLtM86zALK8Pn9FHlcpD2Dke/KNftnrTRlF3atM
	fvS0gJnvVpRAHzSDtCMSpLh8OGbSpFP5F5w5RELRwCzEMZX4lvHA/2l/ELipYVcWhtA6yci6IkM
	XXHbl78ZvwGUU2BVgd5wxMKWPOE/mcnMB6LSaM+ZZEhYdL6MNoCxZGS9lSTGN8ratAPGsBD1/dI
	7L0rxHTeTqjije/vj3O5QayKrzetCSEk1I3cfiQHNxNPAC6z58BFzl65V++5Kx4KpA8UG48VxVY
	1pOSZ6LZIbp3HnWvAjB/FTWMBh/nntgtpISy3A/ISUYuVcGy+HSvHR1UkWdDozS8MGb7tvUL25f
	O94PsMXJNr4610FRfYKUMzUpn4T90wjk=
X-Received: by 2002:a17:90b:58e8:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-39563853b57mr1541855a91.4.1787048978662;
        Tue, 18 Aug 2026 03:29:38 -0700 (PDT)
X-Received: by 2002:a17:90b:58e8:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-39563853b57mr1541806a91.4.1787048978164;
        Tue, 18 Aug 2026 03:29:38 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b699e47sm6806282a91.4.2026.08.18.03.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:29:37 -0700 (PDT)
Message-ID: <2c4e275e-5736-45d6-ade4-963eb646220b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:59:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: power: reset: add PSCRR NVMEM recorder
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel@oss.qualcomm.com
Cc: avaneesh.dwivedi@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
References: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
 <20260817-pscrr-provider-v1-1-88a318c13d41@oss.qualcomm.com>
 <9d494af0-bd84-46e2-91f7-b59bc6da9b89@kernel.org>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <9d494af0-bd84-46e2-91f7-b59bc6da9b89@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Co0FksFC3-NWMz-fnOyPWDr5_umXraJO
X-Proofpoint-ORIG-GUID: Co0FksFC3-NWMz-fnOyPWDr5_umXraJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NiBTYWx0ZWRfX0NHEPeqbIU3V
 9ivt+Prkl6TV1KHBjVsP1vF9QS0qHWp+DZutQnCZu1YPZS6mvxhagUgXoBvnkXapwP70Xfj2nbR
 DG5lTipORkM6P4zF1V8ETaVZoPzQrvcJacleFlkfwbGZ4a8X59uKTVJ77zSiKjdVCkFO8HDV1pC
 gFmRnVL0Z3Zn97YSfyy+svMc2PbXxtogRA0X9EbEdFNaoZ9Jtsol684zvrL0na1wYohlWwHVksg
 GYO39xZtrE5Wn0XDdK/8mub7TJzRVuvNW7GF4krU90mSsGq2NtwTYXZB8s1/OZsrwg+7ZmfxiFR
 R15aQG6wnit61e6th353/adpJX7xS+Vb+/La/BDIo7V0oPtN3MZ3zLcdV/lX02c8efiQZFpfN2f
 fB0jF+VRMXdJ4rmrygxGIaG8XapYT8viOu4SaEFTVK/rB9b39GYHTENp6Q5cAy4U+qj6EChl+Dm
 fi03MCIiZRlwwIfEAiw==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a843413 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bcgEjyfVyK5lAH-vZIcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NiBTYWx0ZWRfX3Qix85IDkbIi
 SeRtD2QEo8t6vsh7KXIq/WObij6xWkKj06X5uAZ/xppAmguY707W321ju3bujgILARIuPkrmUvo
 qPaW1mF1cnSIbVxGjQnHVBshcw66Wpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180076


Hi Krzysztof,

On 18-Aug-26 12:17 PM, Krzysztof Kozlowski wrote:
> On 17/08/2026 15:29, Faruque Ansari wrote:
>> Add binding for the PSCRR NVMEM recorder. Records the power state
>> change reason into a small NVMEM cell — such as a PMIC SDAM byte or
>> RTC scratch register — so the cause survives a power cycle and can be
>> read back on the next boot.
>>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> ---
> 
> Why are you sending emails to kernel@oss mailing list? This is only
> internal.

Apologies for the confusion. The patches were intended for 
internal review before submission, but I accidentally sent the 
email to the mailing list instead of the internal recipients. 
Sorry for the noise.>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 
> Please follow writing bindings, writing schema and DTS101 slides before
> next submission. I see at least a few trivial issues which should not be
> there.

I've fixed the trivial issues and will incorporate the feedback 
in the next revision. I'll make sure the correct To/Cc list is 
included when posting the updated series.


Thanks,
Faruque Ansari

