Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080F4CB8B2
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787238; cv=none; b=qPjNxMvpb91VJpFV7lb9Moa75WU1MbRbtK+KNpJ9a3/G31AieMcfL/hdrRX3xLdqNJoBP2RgPz4NjZ8X5MVoCk9wy5ye8nj/i1Gb36kg8McMd3x4TSArIGmGAi7uUIYAgXGE0dSjzcz5NK96RjTmUBxU38ghI7UiidR67XkN+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787238; c=relaxed/simple;
	bh=QMKR2U1eWght6rndoMaCkR4g8GmHo0hzK5L19P7OJrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6SLD2y7e+CpYD0et1F9pZ45NuVqvSwNFosnpRbVWPn36W5yCAEPSBJZUN7aTsQ7jh1lEtCNY5BwowAGQMdrukVDexOB02V8jOF+7P1Jr7q/Zl+wzbbVeWI/PKNjcOZa/2gbbxxpHhzGAhJpGM72XFaeb7RZ1pX83h+jPoa5ayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUtLQNPj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaCEqPec; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUtLQNPj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaCEqPec"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An5N53862564
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UzmpjIxRHN/BilcB43bET/35xfzOKpYXBLvk43yM1Q=; b=jUtLQNPjVOqllxfb
	3+KC14fSj1clLoxp02gAFxfXKllsMv3UGv3ljQApssvZOflr+LptWqsj8JkMP5R8
	sTtJewPwyPW6nB0Os5Oo1+t74Y/vQR6xbK5yt+In7iC/Fr1KUBUbkFUVS0Q/fLVw
	AhwUYq7kMrs88jGR40IOprw+u+NAqCwGFjLTyogXaaUyP7Qm8sASiN7XsIjJM1+0
	h23tStHFegX2hVXmB+tRJ1/Mr0/uSYNCvc7z2mxgnq8FjJ1mJfne1jq0gyy2r4Ht
	fq8370J6HOFgBgajsm0oSxFMHcwhIy0pIKineZSx9QHNgzTvGPmu5sFPOtSAfK/r
	MpnqKg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hyya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:20:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97bf9097592so30814241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787232; x=1789392032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UzmpjIxRHN/BilcB43bET/35xfzOKpYXBLvk43yM1Q=;
        b=OaCEqPecCWW562vTRM5uOB+rOdMqaYpEmhBBg7sGGnin5rcb/qc+uxwK0FOf49g0lm
         mVo6+tvBWP6Y5Dl20akVYbpHmO6xMfAZsDs8aN4sEf4NUTXl+sFlZv2l1MCv0HRTN1yL
         TWkUP4OeNyyrnXcL/G3SEvvhVQi0aRkKojohZXf00iz43JuoaI0u7Eskp1Xy/8tNnRPf
         ZKEpAvK+01GQzt1Tz+GRef7KSB3nBNp0xuRmmjSa0guh5CREzuipOVjpdhiH+XgdMGCZ
         oROe9ZHsqTqzj6CRl/SfWt2ZPcd1QwarWKR5e7geoUB9vCH+1mK2zBduKNnMW4cYOjk7
         96Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787232; x=1789392032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UzmpjIxRHN/BilcB43bET/35xfzOKpYXBLvk43yM1Q=;
        b=VCUEDDIylN7uqgPqSTcDnLBtEPaKpLVh3a3E6DDFPvJdATzgp9HqYxB890mJhanGKO
         gUpiBXF7ovz6cvOKyxSSfciso4ok2Iu4CPkPR0VgeYY2PeJYE8YIYAGHcSWUlADgNMIB
         024nmK7EO6ubdbfbuFItTdXdrUnxUoBJbBHs6lIoxodF7EF0lkf79zxE/1XTPh3lurdL
         0p+OrC2JApOqN7s35r/n0R0B9ogxG6R3OdHD3yw4IemgvMWbdtF7X1uOn/vahD0zw7F9
         Msd37sNULNa/VQ0xPGy+ImJJOaP1xfXatxJTMtJ1v+5BQVpS7uGE5P9ZALMeX9tPv1VQ
         Nmww==
X-Forwarded-Encrypted: i=1; AKwUvByTBUxr+3yMJB4mFxTVHZxSIhy6lsFejpzK1qErK+CWUZYcLHHd8lxLCVVRxGFFdwE0afNMEybGvlRL5BXr@vger.kernel.org
X-Gm-Message-State: AFuF++nEWFr1my8POuDAO5JN4T0QSxfY0iMv2RvR00LxiHAF46G8NLAh
	eLAbGS7SuAwag6bYrC2yDIHWoX6tU0G5pZIgtC3Pj5KxuKx1BJGqMMHquTiKnwNEUiM3nfgZB65
	ryKOBjlkpuLXw/HrZPiNKpQ3HulgJrufGeZGpJQYremnbWelNjJ3sxVulibJ9GlwgSgk2
X-Gm-Gg: AYBFou3Tshhv2xzqz7BqbXUfAACuYVX0t7IuLh0bkr6l4n+6TzJD5Eno3SuKWIA/9t/
	+3i2BztvJ+UH68NSfHT+qoemSgNSKrGzpbMivWFf4HRISjgtaxkrzomv5TwC1UjTVjIzgLAmBJz
	c5uaRqVXUtbf9e3U6OUzM7Tx54RD7E82N436BSdNijGAr4YC5s0UTN1XUqIldxmExvaOdo08m8C
	CJURb0s410pa/1JjAroPa3mcIiRtUNtuj22Xjf52YBfMt2qSJ+SQ5AUez7LCl7knSuGF1/YhW3b
	IFDin/K/+FYcRy+rTgJNt7xcvMfZXf78sm5i8GCZFrud3mDQxuTL9KqMxfYtNAGK8QvWexGp9wE
	SeSzswQFMPbuaiMEf2ZnOFw==
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr1556683e0c.3.1788787231887;
        Mon, 07 Sep 2026 06:20:31 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr1556659e0c.3.1788787231199;
        Mon, 07 Sep 2026 06:20:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed2b7sm2377474e87.14.2026.09.07.06.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:20:30 -0700 (PDT)
Message-ID: <ca962589-3b6c-4e5d-a11e-b49cf20dc262@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:20:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Marc Zyngier <maz@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Mostafa Saleh <smostafa@google.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
 <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
 <apgeBNSiP01YfNcs@google.com> <86ld9d4h4n.wl-maz@kernel.org>
 <f58bd978-ca45-48b9-a928-45a2878fb54a@oss.qualcomm.com>
 <86jyox4fas.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86jyox4fas.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9eba20 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=6exlRfS1EnHN7lmZ4RQA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: JVIcB2xAAaacIZSNLbdNAdkKQKgSHmbV
X-Proofpoint-ORIG-GUID: JVIcB2xAAaacIZSNLbdNAdkKQKgSHmbV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfXyFAyRcdQD9Ct
 ts97IXzGvropAUHNsWHUHKkFw8Oa1e0iaMAZRkdZ0girTjjdpdgMTPaP8GisRRgTJCqnbuX+gKs
 32ToDt1DrFo0/5W+j++OPLQblylecd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfXx3Wp9vuSwQwN
 yFAapsjRJgXcbSdFkmoou8nYsdd7fyIA7gIViGhHvmf3iGrNNYn7IJVdt3k7XNBuCe841087sRl
 Y02hbV+WHU4bito8rBa/HYRVIhmEqLTqE0qO+C6AmTZkH1u7ASxjseGVJeQYOwM2KctOaQiw/ve
 usVbzrwlUMDWrszd3z4eBu/e7VXZpvZi2sQRg4bpLnfL5JvfWASQvqIMpQpiTjtOKLHylrqbvRu
 S4FTu9xr+l36gXPJpbUQVViXcx6THHAqNgUSZppH9EWXiTtmilIbcFsRk2pFJmbg2nabjgOhMAn
 r0nJUcPp9heRatUP2NFVWYc20B/FdUq0W/PvoDRtBo1+Y2G3i9s9H72nMFaBpmdBIk9c7ckhwXC
 yOFc3b1B6gcpKl3HUURsQqaCZzUdNgZXemh9D5SXbglxCQ9JPZfM02m+5ig1DclBhplZWHvv9Yt
 TGUpenLAfnkw5S40lKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070146

On 9/7/26 10:49 AM, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 09:18:38 +0100,
> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 9/7/2026 1:39 PM, Marc Zyngier wrote:
>>> On Wed, 02 Sep 2026 14:00:52 +0100,
>>> Mostafa Saleh <smostafa@google.com> wrote:
>>>>
>>>> On Wed, May 27, 2026 at 05:37:10AM +0000, Raviteja Laggyshetty wrote:
>>>>> Enable QoS configuration for master ports with predefined priority
>>>>> and urgency forwarding.

[...]

>>> I'm also seeing spurious resets on my "X1E001DE Snapdragon Devkit for
>>> Windows" when doing large file transfers over the network (30GB+).
>>> With this patch reverted on top of 7.3-rc1, both machines are as solid
>>> as they were before it.
>>>
>> The current patch enable QoS for Hamoa SoC, which get programmed only during
>> driver probe. This shouldn't impact or cause any spurious resets once the 
>> device is booted up and probe is successful.
> 
> And yet it absolutely does break things.
> 
> With this patch applied, the box resets within 5GB of heavy network
> traffic, probably because some transaction get delayed, and a watchdog
> fires. With the patch reverted, the box keeps receiving packets, and
> everything is hunky dory (100GB+ so far).
> 
> Which makes me think that the set of hardcoded parameters in this
> patch is not universal at all.

They are, provided the configuration is for the right SoC..
Turns out Purwa has a slightly different topology and that went
unnoticed as the platform was brought up upstream.

I'll send a fix.

Konrad
