Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658E383C66
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409052; cv=none; b=tUtWyJubJnUTKuALo+sI0Pv4o0QO/X+/u3f0RRutWQ3cvVp42Sy/EXR/0gKGnpUubD49i4EL/jkZ/v8QObmn5bJQR/17T+aRbTs+tlk/nx1awCWknYGsHwcZDp5Fyfb+PHoVb5uv/ldeYRYJ+Ca3M9E+pznd0p1QjAnvE57P27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409052; c=relaxed/simple;
	bh=AH/B7aaGDglCpKtBexb7Zxam2Ch3aRkT+fHsRoqeAAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnwE//oeQnT6bKaIIwdsWsRwVRi3THvg8Iy2vTfC9/WYcqXooQMKfyH2udz/XrYhPmiu6YKxsjUOf5CcIHCZv+zfuNLUXU7vsmY5Zh6JmJryPy5g1RPQ1XwkBnif1KID/KUA0khbvCOxHh/hsWLuoodOhNptv2/Ip2a6U6ZyCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyD3NwZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY44XBQn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyD3NwZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY44XBQn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xZTa4150791
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 04:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=; b=nyD3NwZo+WNY7Rda
	EqrUJPJ/W/QNeEA3EcYuDlQ5nsevih0iG2OXWpwSRm6AOaghlUTazOu/xplqjko4
	KTI0lQWenqdwUBcudNc8OyGxaCWaMmJjCHf+QdB6xu8J7XnX9floQxWhItbEsto7
	mEb6mlRnyvwLNv0UzGrMpAh8KWWT+XT+tv+MKoKgsZNVDonfKMfLP3dOyPGqDqzU
	YyUL94TAH7HB5hSPH9gRdwHGJVaIJP2fUazVr5K/rXLklyvbbACdsPzvNrLb7Be1
	hYOqfeAd1JTPjtCS5B7RKCFLV+0xaKz32r7UeXFZ1+EFQ7A+QOmInQTvdM2HFmuU
	KkmNng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnad41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:17:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so17804425ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 21:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788409043; x=1789013843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=;
        b=aY44XBQnFUsez6919ZCOIorntuJHQWgtAbUwENu1aiD52Q13N6rg809cflbIw+7YcL
         8CStpXS/10PQp6h6z0CKVdRNeDyp3oCxY9snCku5D0ceo6+vhb3ybkaSZq9/xNchRspu
         wa/+jLZ804j/mNcL2F2gnl/+iYAAG6KQC13ciMJxnqhNXgenvrV+wPjVdGZnFk+eVcbI
         CjCnudSyaiBIKyMVPb27qcWVTlCOScI/nOS8zR/ehhFL8lDmWiLHNvG7sw3+S9kbKur/
         ZO+D0ymGYNOiAm69xwQkmttJupn/wIynTs1x5Toypry/M66UxZTMVDWYQQUJHHZ6niBD
         cT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409043; x=1789013843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=;
        b=E1FceZ6pQvT97O+G4IUQOYhddqK9ggNFtHmNrSrrOCAoaC3PO8sVuTgweCwysLWy3X
         MYt7YEuTsasv/i/XEcdApK1Wt2MNjymbDZcvSL4bLPvh0ynYLQNmudhz/4aPh3eHjEKd
         p7HoZ3RPV1Dp04PgUGmGC7pgR2p0rEOlIc3fWB41aqpFkikUdF7CSAzh1gPyRJQbgQCR
         xD052a0RLNsBJcQiY+aozBPuYMLC8xqiGlanBkQetqqEtV8b2Eb6fnY79c11+0/GqNnE
         Y5sNSaYw8EF7g+y/yaXwORVnVrzIdGfZUkTLW/ogS37ZHOS5QJ18dTNp+pKIeGUyK7/z
         ujdA==
X-Forwarded-Encrypted: i=1; AKwUvBzVt2835UYIx59glJU3920NbU14FAJo8ER0xmYDd2lGLK6LK0w8fClAyOBU1H5Y9xTs4Bp+LafZ7SNZ9ynb@vger.kernel.org
X-Gm-Message-State: AFuF++mFyIli2t1W1xsA+xaCAP92vk3BvTdIgyylkNesLPpQZD2+HJsR
	Rq9xMb5wNvA2+A6iFL40+IvoifEGFBTWCqBIAUY8xUFj4E7YeXgixOh6H+oYVgQWrO06e+z748H
	oHh6Wg/oNEcV6y/y3XEc9xgp8aC+77dYq/ALt98JpTMV2cC/VoFfWnRM7flx79WZGjaYS
X-Gm-Gg: AYBFou0BoLgIAkZHY9MTbyCuJPwLg7IMuEWN8DYgT54O/I9aMWLfDTmFcuoVt46AtoX
	DIs0Qm5pcMGsIApkcBrEaImAMF4TmkKWwH7mcEJSrloIq6YxIp2pwLSVlYAGgas1+kH4GkyqDDb
	WlSXmoSTVd+6PKdbaqVNFazkbdjo61UahBiVQgW5i3QUBA9S5xV2WBI3Ko5rdc72o53GnHZRH3d
	t1hvYvc8WzwnUP0jkuVVwDTdQ8PRZG7hVLhD1ENnjCjbCYMFGk7EgeSZKmbAFMtFtj/dbbuQBrO
	0IUHh03LpDukaDftO68n12vLxNrOk8k3RLNfR9cKYh62u0ezSrmEu4Ihdl2LTh8Z2P4M2rW6KWK
	23fRbVI3qm1v6CljXvShvfDafMfNiG1VytI5L5/2Ou646nrCgg3sL18wNBPE+UV7UKAHAapn/rP
	AQLLM2ChFv+CE+uh41p1N8RbjD
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr137795065ad.8.1788409042880;
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr137794625ad.8.1788409042477;
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
Received: from [10.79.117.104] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2601042eec.3.2026.09.02.21.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
Message-ID: <7a73d847-ee43-4a8f-9149-2471230e3969@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:47:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
 <6ae07fc4-fa79-4c05-9958-67154e850563@oss.qualcomm.com>
 <apWp5vxhRYozKQ7Q@baldur>
Content-Language: en-US
From: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
In-Reply-To: <apWp5vxhRYozKQ7Q@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98f4d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xGGhxaKCOqPHMtdP6scA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAzNSBTYWx0ZWRfX9l1D1JTAo5GB
 yVn43vNjqmtwlI0p6sWGMypQIKVcqdc//yUZHlOQyfsrKNdJ1G3OhG3qDHLVEgP61/CW9/NaZC0
 +9TmaQTjUAlEPX+PEfIiciFVECkMhsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAzNSBTYWx0ZWRfX0WYbVb3WZrvc
 1ciy/Hb0AqXMbx8SqglUK0KB+BIZLD8Mvqb6Ep/AwbSLigyYkXXFGTrl3h+z7OG8j/z8oCb0sMD
 xL39ZCLpsDvYK7D90Xqo00iI+47dzHcu3d4MSaUXZirig4CN69AYZxR0WA/t/WoGM1wsbv3M9dE
 89HHGSuFGQG1TCdhTRVO6orjveCGWrGKJXzvADAa9363Dma4PAVyadA2bZHvJOt0GkYLPww6XRD
 mVIBy3XFab1IdGPg4J3Bxi/IikqdP/Lw6tmR56aZM6ndYxHuXO23QlYLck94hGGpe4mJPKLVDzm
 vC34KwdL3zpv6bfw4ud6XhFJ3XYmrW7UfZmdmLCPUFyYCeXz2UNWX+sN9IHfqxFHCLHL0KwIti3
 r5xsgz3d4c42eipQW1seLTsV8psgotqrbuOQC5Bxuuw2PsovtODRW2mWmpVFYT9hixbaOC5lTye
 sRy8AtQ1dwk3G1GbfzQ==
X-Proofpoint-GUID: duORt45rYUb5faIXiNu22L8IosuWgzUj
X-Proofpoint-ORIG-GUID: duORt45rYUb5faIXiNu22L8IosuWgzUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030035


On 31-08-2026 21:55, Bjorn Andersson wrote:
> On Fri, Aug 21, 2026 at 12:54:03PM +0530, Iranna Mundaganur wrote:
>> On 19-08-2026 17:16, Konrad Dybcio wrote:
>>> On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
>>>> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>>
>>>> Add the missing SIDs for the LPASS eNPU masters to the ADSP
>>>> iommus list. These masters are exercised during audio record
>>>> use cases where Environmental Acoustic Intelligence (EAI)
>>>> models run on the eNPUs.
>>> Could you share a bit more details on how we can reproduce t his?
>> This use case is not enabled upstream yet, we validate it downstream with the
>> AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
>> access from those masters.
>>
> Even more reason to provide a proper commit message, clearly describing
> the actual problem.

We are discussing this with the team and will get this fixed in the next re-spin.
Thanks for the review, Bjorn/Konard

Thanks,
Iranna

>
>>>> Currently all transactions from these eNPU masters will result
>>>> in global faults; fix them by adding the additional SIDs.
>>>>
>>>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>>>> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>>>> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f04058d2e089..6b06e0acbcf0 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
>>>>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>>>>  			reg = <0x0 0x06800000 0x0 0x10000>;
>>>>  
>>>> -			iommus = <&apps_smmu 0x1000 0x0>;
>>>> +			iommus = <&apps_smmu 0x1000 0x0>,
>>>> +				 <&apps_smmu 0x1040 0x20>,
>>> The correct SID base is 0x1060 (although the mask makes them equivalent)
>> Yes, will fix this up in the next re-spin.
>>
>>>> +				 <&apps_smmu 0x1080 0x0>;
>>> This will bind the eNPU streams together with the ADSP firmware stream
>>> into a single iommu domain - is that your intent?
>> Yes, we've been told that these SIDs would need access to all the memory
>> regions ADSP firmware stream is given access to, so we want them grouped
>> into a single domain.
>>
>>
>> Thanks,
>> Iranna
>>
