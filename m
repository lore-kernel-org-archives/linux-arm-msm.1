Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECA429CFB
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782293; cv=none; b=Zr1uY4CJF8oUKT2BTpaiojMhl1kQGlWDUJmonWhKkV0/iny0OROWquxYpv3Pz+rCJDvfSMjSIWxcvhcGke5asGS66N5QjT2dTz5ZVPPb6ZGEVXNafO9fwGleGnzQR5TorNGlPKBviAbQnzfRnwQcKOS4fOburX/5s5e5BEGKVjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782293; c=relaxed/simple;
	bh=IQn9Lo6NDC69G/SKfImAg6Do51foG5sJRKiGAiAzsP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyuWlT1tv51/5WzGgfJqhU2ShUQwf305Lp7iVD56GG4MgPsXAMFJU6Qp4OqXABwatpqgi3bprq2NugWn8VRuSxcOH4EmzS6kQcJOMOO2YOV+VGpEeu3vwtK9YL4+/oimh8aH9yIAWLrR8hCfYGiIP1xa7xzAm071zoaiw290m9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk8LzuMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8+Hc5C0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk8LzuMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8+Hc5C0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmsjI3180789
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=; b=Mk8LzuMmP7TNJuNO
	iq6CD2fauFhV3AsA9VQaeb3SCUq4bIdO/4f5Y9sYBwYIBXofjM0/criCAMDj6uUC
	9TSDoDOlLR0nz9HxsXqgv9pAwD+AwX8ojQ4ngzW+J1Cg0Q/ZA9/ZUdKtJOBwqpbs
	kKjHmbMYAm6N/g+8MI4s6b6lzEkb27h3H4rqiIeN/w9kmmBWvatYoORvmtxzkegr
	e/nHYDhQdSDh1IPpG+y3edtWwilaKJ5Hy4UlKSkt8d3ckPYAD4LSMNHjHQ2/oFXU
	aQlab8E0fySg2CUgaFi9Toq3s13d5Fc5+1YQE4SCh2MgkE9punF+83qpJuKqrgyG
	11owog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw20tj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:58:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso36508465ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782291; x=1789387091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=;
        b=O8+Hc5C0zPXsmZSyIXdCmFtbzhN+PuGQQjT1lMBfPwSl4LLI1W1bw407Af8NgUHL4n
         WMsazSvx7d9B7p06FPyJZunewkxQamuRjuzlKX7oxiz74dcKdCCtET8AW8cZEwoBq7hW
         2z88bq0ie1ACo3F+RAT21WAmi8u0ghsEWa8TBsmfOaLa9kGJZyIBtXSPYmhi09OSwn5X
         1jvVYmHu1f2br5u6uo6c3V5Umbc0vWh2t0oPmeXoV4ZxqGRU5mY+mEqgW06/poalKV1F
         NtH+UTjIaPOidHYU+cwb8AH7nSgOzCQQjJFjvArwauWBmUClDuG3Bgn8NgEJdEvBGz1q
         FiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782291; x=1789387091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=;
        b=OeVUQqF7NXeLJRHD023jaHiIfwoeZf+oh3hMOjAwdWYLU+NJRj+rm9QUuxs/UswXTS
         KbHNZYCW8Eow6SLQEiBdbUoNFcAwnBzJBh7fSBgHM8X30jgMfKbZ3gorfGyJzMxVG94g
         WRnILMxlmO3mALmiZSlSYpRAy1OV+ryVcu8nCViuucAGx7r97n2o8bhwgSIsNIiIXIbY
         gsX9R1L4lt2nntToBC0Uk61jOxlM0OpqPijvwrAQ9G1dRlHmX7AB+iA+D2O9J61aG+JN
         ZiFF3v/smeVZmxDFU4NrPhR11FIYcHymHz8eHGEJmcnIKQdiHXeQpw+WcQMsZCUYMZsp
         ObBQ==
X-Forwarded-Encrypted: i=1; AKwUvBznzdk4xNOcFFgAxfQe39Go1V5kLOgTBggKbOGbXxtb6ql13lLrYyqVUWV0V6fUYQm5Vv4c+tfdrEh3i7YV@vger.kernel.org
X-Gm-Message-State: AFuF++mpwaW0/gHV5KnYlIkTRW9wvUxPhIuZ3oGWZbuc+ADlrDmZ2Al5
	DX80FLr0JJN8EWL1CARwD7W3w3WVZ0aQNHk2Z1Usff96CMPrkoK50ouidn6lG2W1D/Ft2euok3y
	gcumerubMAhyVc2ZPE+podXBiXQdAIJv3OmKButqM+UIWiQwo2zHLxYnyQxXEJ5UkZWtg
X-Gm-Gg: AYBFou2zTSQGbAPH4k6XK/VJgu6EOUEwcZFDYZ7e3PmhlYDPmFpZFt42JeelMx51zfm
	4XwgwAkBFRQ8TgNWdy4vnF2+6GparKSBVfia/VRo5Fnl9FZcxQ+no/vFbzn6HqPMqMX8Xr3aSvW
	yDdaFcnzxQwYt9hKIvdLTeIekOn+v8dpaZv+bgujoR4AT4dbeJNK+iCzvzF1uiuEu0RfwvpI4JN
	aYt603Quh1XVLNnc6iGEV20Cpm0rMXcIg5ktsTIW5iGht1DJRsiCuGzHJZSp3h4UB14nyrMPClH
	DYMx28Be7wZziyPvaj5RbFSW/p0m2r9iDWVIFARwpRJfxmKVhE7nOCMddH5ECLfod/P5kVrHo1O
	w98WHXWi87rGai8X/SyJMB3BpwIs=
X-Received: by 2002:a17:903:2ac6:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dafaf5f50dmr265918745ad.7.1788782291143;
        Mon, 07 Sep 2026 04:58:11 -0700 (PDT)
X-Received: by 2002:a17:903:2ac6:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dafaf5f50dmr265918395ad.7.1788782290731;
        Mon, 07 Sep 2026 04:58:10 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm43995613eec.15.2026.09.07.04.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:58:10 -0700 (PDT)
Message-ID: <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
 <apl-vKnwHWFJ8Kru@baldur>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <apl-vKnwHWFJ8Kru@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F9oMUgSm8diX0aqwYSd14C1e-2mTo4_2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMiBTYWx0ZWRfX5WD5NM6zFYH2
 GTjmiRu564US5+5i7b+ns/8+Z32+mkGwpWWgL53EjBhDUuZmYaKNvgWBhYUE5l8eWI9D/o8/O7S
 2pSDEkFD4PezZlISzYgNTT4p9kqEt7Q=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9ea6d3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qtFx27__m5ifiE6ZfAYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMiBTYWx0ZWRfX6/T/94XwIo5y
 0ZdXB9yF7xZWIKq9m1yPH0ce826jFvzLVhLL0KinfUjfU/wUAt2VBiU/gV1trWUiiY+d83stS79
 8uTBOE/jXfTJ7ph5qo4mlSqsHPOAp+W/vOmrpEE+//Nw4xgGu3tJLUBu5XS5bveh/qBp/TRW/T0
 5BXnBSDuQeGoUTehKoGM/ushTJEmvOUQwyD9+7Sesw8Ru9qoaHq5Ns3WJYhKrBmfAOkceToQ87Y
 Zz/M7u7uycZFUM/xWXKzpxf8UwqDrHI3Vbbz55DJVeKbs8cmJ/K2yi5kyL77FVyqXmbqQ2ymRo7
 YZOgSEM2zuBdSIkUdPHqn1yF1nuO3GAUGYFYvCRn6uBsW4QyW5f2N9t7XJ6VDaeSwg0V8DMFreV
 hlBvywTYxpNz0lL4+s+sOl5L4b5xXtnO150tIFjnvnjg/VIFN8dONVkw45wNlj67ev0ObXz6lZh
 7CbM+3GysM25vblv8DA==
X-Proofpoint-GUID: F9oMUgSm8diX0aqwYSd14C1e-2mTo4_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070132



On 03-09-2026 19:36, Bjorn Andersson wrote:
> On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
>> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
>> stats like vmin and vlow.
>>
>> Shikra SoC specific compatible allows reading individual subsystem level
>> LPM stats along with SoC level LPM stats. Change it.
>>
>> Keep "qcom,rpm-stats" as fallback compatible.
> 
> So the fallback compatible works, but the more specific compatible gives
> you additional stats?
> 
> If that interpretation is correct then this patch is correct.
> 
> But then you need to fix the binding.

I have already raised v4 with the option to keep fallback compatible
in stats bindings.

Thanks,
Sneh

