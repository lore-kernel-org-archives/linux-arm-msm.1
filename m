Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C205372D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077957; cv=none; b=fkv0QXra7VNDFJl3M0+7ikoOZSE7LT6YfKpvIRzPPsdKMyO27S+dJUDGwUaUr7qDhIPQf2aOvTwyy14txTDAbVqlfQkgXgfqF9tyDlOZCKQiJNu/GZ9nK8LLKVebCLkHqxRvxOeJB7KAx07aG+2iRi3yVaCcDLcNuR+iunGh+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077957; c=relaxed/simple;
	bh=T89j8VKqzweQ0KLy+jjZG+qbjjoAhGr42G/i9t9i+Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4y7ily+XBW3SFirznSdFgC8XjDUIJUGnjRbSshc54yWq9XcN9KPNVH3KtGpz4R2BQCVQzpAGDe3f3Qamnd1c/D+9fTyfSj/Qv10wE1iXV8wkUtvuvLuRlyqQgI/u+kLl6b/NoZGXxi/WTlIxJzuQ+IaiSTxSDEjVj7aklVGMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NY5A8ZMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNgoCpW2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NY5A8ZMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNgoCpW2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPebZ3487652
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSzVe56P75eSef8q8l3pV+jAAl+kO19DnhJhuOgKX8g=; b=NY5A8ZMOqBmyeT0/
	lk9wp+3ePbXrw2rSN9eAmhEiMu+WRypitsQmSbGcGWP6o9s/ZV5eE8ZrkzfKnh0B
	evDJMGGnciHbs7JEy88eCIzt61vFcFEIyXv91sokecPUSrGVPoTtHm0iyXWz7bGj
	DEJBooOBgPUkt66cHju4sP+E+QW/SLQUN+k9QkydAK8FWSWmT3PYMZ9OnsCBFnfi
	6m4RNHYiSgrUV8VdbUWNnybNd24B84y8JUsMeyuPYA/odgSVT2BBlNmZQKQ9/eJH
	AUF8qk8gPFLkfn51L+9VsUBtJa3SOHShxIKg+k4akLoY7MU/HKUv1Utb81jTYbER
	kxwWXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jp3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:52:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91240299f0bso9236146d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790077954; x=1790682754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSzVe56P75eSef8q8l3pV+jAAl+kO19DnhJhuOgKX8g=;
        b=dNgoCpW2TMdBYCL2mcgYmOOfVhsC9bIX2x7NMW8sGP6erVPXUyOkiKHH/Yz/b2PkY4
         phW3gdf14gWqosseflsIglOi/neglni7o5tsKh2k2wyuC9g+ThN5uaA6ZqtLQz/FKhEZ
         0DU2q47GYmTXCitlrNOkiH5171WWfdCnm74idh5yX/KMrXssX2TcdNUzqjRorqtMnHzH
         apOw2TW0LuGKRj6jjNx8r6QzhdAAjHnFRvHS1xdeqtMYjEEwR5YnjypYXqaRgIp5vnBN
         l0eFJU2imOc22UDHY00Hq933Tazy5TI0M9kn+GglwKKL/3iELxOyCmqJbrz7cfQ1eA0L
         BqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077954; x=1790682754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSzVe56P75eSef8q8l3pV+jAAl+kO19DnhJhuOgKX8g=;
        b=1BRvX6d/sjl3Gl+7jGouvRA/VFanXz6eXw6tE4K00i5HeTYKSE5DnUoGAeiXIqkTfB
         CPozLwiZFcWGMKl1F+zbTK57h9ta3mEobfz20Wlf7xuaXYXQl+XwcY9Mdgh3xfQAZ80M
         XWcnpmCLsSwb1ROH8TuqiLt+2fktDRrRbuX5hAskP2x6Dz8GWHGZyq+2f52+HJgrwTEJ
         p+QI1grQVnH3NwT6AYamE16meE+qdGD7hkbQQBeA0hzPS3OcfZzyBs3jH4f1+Zo2yH/1
         yCWEIDqGqazhE8asO8nXWaoPL6m0m2FnDhTcrK2rIMGkkPNdRgmotfbRUwB5u8j9uUux
         be5A==
X-Gm-Message-State: AFuF++n1vE4Q6C35b/qBEIFItKONlo0UYywkE2Sw9bDtUJ2gLFf2src2
	8SEFUjKhZ4GkSAwAjGZ6fILHGfOSaTbXJgRpZGwjM7EslS3Eji9r8hAfxWrae6/c6LEkvRNYp5T
	DT1lthYLLNprVU5aVdazNgc62mzc2u1zDwas5s2QdVDZ+6mK18ZVOncVNhj/d+2vGwFmyDp/PRE
	yz
X-Gm-Gg: AYBFou3069HZCQrVewtItytzXMyPNoue81qIX7aEj569m3HnboZWkipZkbCHmetpBOc
	3pkidi7y/5hxC5JoWsHGRI4Dp5MQXETFX4ezkm1ghNLWZivF4aUncGIDpkpuboSnZAsO0DAqENq
	ypcWUTJywn3JlTvC4eR68raOjE45IYjeYNYKMmwIFE/vNq98R6T4DN+D2Xl+5JmBuMJUG/5sGWb
	wDXcjciEAxQpQ8deqx1IsAxhDBwf/5XByRmDa/UilA8VfmjwpdtCjAUwLBnaSxDGc5kumN0Pnp+
	KePwjTilgM1ntI84xF2lDdND5WgTF5aRxolI4Ahah9OMfu1ukwHgKT2X9rWuerqLzG1PAdAOTZX
	d0Hob/1mCdw7dfChGihOwgg==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr52216426d6.4.1790077954209;
        Tue, 22 Sep 2026 04:52:34 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr52215976d6.4.1790077953615;
        Tue, 22 Sep 2026 04:52:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e6dbcsm72096666b.41.2026.09.22.04.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:52:32 -0700 (PDT)
Message-ID: <94dc2136-cbfb-4be8-b74b-9d61b94e8cdf@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 13:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
 <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
 <bc3d3df8-a2dd-4ac5-8064-d54d4eaa3f6a@oss.qualcomm.com>
 <b2112da7-dbb6-49fa-ae10-b9e4d47d4495@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b2112da7-dbb6-49fa-ae10-b9e4d47d4495@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -DTiAHBYRAzXdWGbMc8xbkENgalh8k3z
X-Proofpoint-GUID: -DTiAHBYRAzXdWGbMc8xbkENgalh8k3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3MSBTYWx0ZWRfX5sPKxWHLnUGu
 LOPr+iBhBDsQPSWIzCIa9/gxDG5Uq2HVuuqEAEUE0A64mJFp2AwWIjB1LTJUsDSXJ/FLlkATszR
 x0Etm1PNdimWdu9V3jiQ8IWQZ5N2oOr0TuTLeOqKOHARN6GvO/KsmSeH2JrdcPnROvHmCnLfGO/
 BlhvtxkTrSRO8WZZ+eD9NTt3PrPXMnC8DORIqDeWT4PQ5aIGbXuR2NUbWeqTogc6MyNTqsTps8z
 1NS/krh36qqu1UsUjb8dIjPKqL0duqFR33ewOxS11YCNBkt1bod0CH2OMdU9jyLsctjayOgtUNE
 K5ew4AUkTiHwglYIUEej121xtYdOQfw9rM/C3KI+LxSGq4E8BpWzgp7vWo0d9dJYzSmN7MNE7kn
 eAsw9grHz50buT4zWf2PdmSoYWmOsuwSksGsOISe7NYUVtj9df6mVp9uAC66MdHWUQh9f0O7o7S
 NEKurDdAAZSQR1dz/iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3MSBTYWx0ZWRfX0AohlIFSIbRg
 Da9Hoj6QJvkNBw0skfP8abGJYjW/950UoBg84uNnZj9G3Mj10eEoqU2/1jaVIEpxzuK57giiwiX
 TeHKt0BbSYRJgJ6Ukw7Wf6mAuLZIqLU=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab26c03 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=E5H8lzb8i-VhQHAci44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220171

On 9/22/26 1:46 PM, Neil Armstrong wrote:
> Hi,
> 
> On 9/22/26 13:39, Konrad Dybcio wrote:
>> On 9/22/26 1:28 PM, Neil Armstrong wrote:
>>> Add an initial DeviceTree for the Valve "Steam Frame"
>>> codename Deckard. The Steam Frame is a virtual reality headset
>>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

[...]


>>> +
>>> +        aop_mem: aop-region@81c00000 {
>>> +            no-map;
>>> +            reg = <0x0 0x81c00000 0x0 0x60000>;
>>
>> 0.dtsi
> 
> Good catch

I typed that it's in sm8650.dtsi and then realized you removed the
whole memory map.. I was under the impression I ctrl-Z-ed it but
apparently not all of it

[...]

>>> +    /delete-node/ smp2p-adsp;
>>> +    /delete-node/ smp2p-cdsp;
>>> +    /delete-node/ smp2p-modem;
>>
>> I think these shouldn't hurt even if your usecase is different
> 
> Right, but those describes a pure firmware interface.

Yeah, but it's also noisy.. perhaps let's at least remove them
through a label reference

Konrad
