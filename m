Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFC53451DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633196; cv=none; b=iwsMsQQkyhA2mbfQzBox87XEoiUHZf/Ytau0zynX9HaR0GIy9QuT2x1lqzz1eoDZNhZwj96vBGDaM47GEP1aYGFEWnC6Ij2+L7/N2LNl+YG5b20KHwguVgGvYFqHoy8cb0zV5EzYXloW12qs7Z/AIv8aYvsOo/y6uTVyIhn/x0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633196; c=relaxed/simple;
	bh=InVu/xdm3HcombIpLOvuma9l79Xu7IXTNVw7xvdTTGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTSTJ2fe6bhnHq9JoSaMqHv5xkSLsgRB2xnZyRfFQ2ELDU4IiKu+8uaErL49jflaaG8oMCDRCED1XHXtaXpaTc+2WlkpNrFV4Ks6MJyzn/rsSxd2ZbjD+NtDFTEuS7OtRdpSwnVoPTeVGX7L4cLWx3+IHWYYROunIP2DP/icnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFzr5U39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agzPm8Yo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFzr5U39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agzPm8Yo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARMkk945788
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EA1vIFZn2u8R1DO2ekCfXZ58M6JuYvASbE4xUk5ds=; b=WFzr5U39Mitdb9HW
	NuKz6SmfJ52fZW0gxc2vn7S6k+QkkR+ZyG7Ya2OYOWs0cZZOsr3rL6NW7n5+3mpB
	kIUJlyDSybYAEnpkZsUTT5itRHKTqjT4BbwyQmrS07bWjO2+sz9tC4Z/V+49M+zM
	KctcKE71ETKwAleXHRr7ovLTDwbiL6YJOoXZw1/iZ20qwm6wpbJ4BZNiGXU2AvIU
	mRbPJehkqq9jbK7mqHuFuLEbKCU2tLobZpsfuFkvbLmVcJFNT+9bbFoKKg03Hgd6
	w7TeWCwSidBx9U/GEcVl+Um8jYOYdIlNpi9vdQTK2LlyjWMkylvehsdA+XdVO1JV
	0UZyQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es1ytk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:26:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e57e56ce9so184838485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633189; x=1785237989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4EA1vIFZn2u8R1DO2ekCfXZ58M6JuYvASbE4xUk5ds=;
        b=agzPm8Yob3VofzKYGftpYR0lEFnv2qE4L3NEEHrebD2k5AC/Kvvma8G12y/awR7VD7
         QkqFXhDaFTBndiFuf+kQE9CCUsfbp1dpYBcHaf3Iqbx5M8HoZm/UwZVW20SR7ssNC3X8
         APXPFMLQIVxx+djppjsHkkLr1Pxj4PFtPhSTMYHnch2fVbJwaYlnt5GhNgKdYsQO5ofD
         tjhOtqCJEGHgfTj4uiTYTiauZOje0ZoWonda8LYNnQujAGzZSh3Z+wr4b+wEft6JtSpB
         piRy4WkJoLA2zb0+UzsNKpKl1VwHsxUE7CSaldQjxO4VRZhjZF7ymU2E/FgylsfnYK6B
         unDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633189; x=1785237989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4EA1vIFZn2u8R1DO2ekCfXZ58M6JuYvASbE4xUk5ds=;
        b=akPHtXQ7PHHhJzLvBCTs2kA0xggJHXOgSQvCD56F6Ig8WwLWnR8C3lysZsDO7eQ5iP
         LXNyDTx9DLGwifwZSsdet5aePbGCKZzhWVUDVYMvX9sV0wi866eufYxXE+1hesmfytl9
         4NT3nVs9bIzNMq1sd73NtvTS0xP5poed36r76BYs0xIjUMxFrh+Duw6iTkYSjOyrtXAv
         sKHmmsx51R5q6OGZNtmvD/5UjJyUbnuAeteGEWiLgpQPeHN+cE2MNX0IiiQlkjkDuHgF
         dw+h0HW2P6ePiTUL7706/kTkEwiqKLw90xpJQbu6ndUG799E53eshdqlg0XMso9NGKuw
         /Zjw==
X-Forwarded-Encrypted: i=1; AHgh+RqSuj4aU+3fr/d1VOtl6j7DfbsXl0O815j9LkoYYtJ8iefY+basvNKME3FmtHn5PinDOnAQTh9fbWZZlPWt@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYMd/Ru2hTPjxval8rYgElT1200SZVNvP5Xy40kmVXjDfRLiE
	xhGw+i1O8VZTQT8uYSJOvOSeeVRzbrI0AQlglyXYu116eFJqJx+JNZTdLlXJYwEQKNEi3iym2Bm
	X2lSRcQaPkr4G+zLNWJrojWVhBv2+h8kbFHlimyjvh9Mn65JskYMpoDSlx9VHpc1Lrm2b
X-Gm-Gg: AfdE7cl3fOXw7EADPXD2moYf48DzxcvMET9aXnbQ2T9QtWZ6kEsGe8nguSVwgFzwDkX
	o7Z/sEC6cDkYDi21txbIuTmA+aGkMY3pTQdc7DLnbXXMgeNkscXzPavmZxvGa6W8mnV9lKLvhbu
	plTlpBrBjXk+NQyAfy+6bnIVsWa6UzeJ95xiri5fRJt1rmqFjXX68PWC9aoRsxt49Mp34vgEcYn
	Dj0nhOwqRgyX81HajdTGVj98d9tVOShF0+d6n1mJPMWYYBseRWlua0dPPY5MRAL483MeG6uK930
	s9JRL1sR0FQFjSBIXofBWApvzLGUnGNlArkAX74SE47vFNEtYqWn081wykG3kdjO+rmVxq5dgy/
	6iOw3CqeOl/lqQ+dvdA86wyw7
X-Received: by 2002:a05:622a:5d3:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52672beaa74mr21320381cf.1.1784633189120;
        Tue, 21 Jul 2026 04:26:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5d3:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52672beaa74mr21320201cf.1.1784633188754;
        Tue, 21 Jul 2026 04:26:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm589872566b.32.2026.07.21.04.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:26:27 -0700 (PDT)
Message-ID: <7ca03680-165c-4ce3-bce1-77c0262ce7a5@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:26:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f5766 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=k8JVevEbTmNoh4gevwMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: amZlTkFrXsowVyM27CAvQLkDcwfShBfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfX6/LmDh4AIgwF
 6r/9hXbc/lQUwcpeTseI5kWWh8QvJ084lZW3+Z1k5YZfqvwOLSPJ1kdqi/vZloYfRQDNm5l37A2
 WfTJ6GFI7CDc8GydxO3oDYwZRJnXTRsTfGo6PzeUaqy//BYY4Z31+ooBoBtX0As7urtiDGn9+tS
 UbWBlcRq6qexEazVhvinQoeIaYb5jWcjoLsIzRgT1R7qsxXGKcFXLgC5JntMSt0GGg9L1SQJNtH
 3UeZORsGbv8BbJ2Rew6droG1vRaQDpBy1aW9Jb9CrxIpJbX6h9OuFp2x+cLoGXZuhVRVsu56DGR
 GJvXdTsEs8IQTk0fvplvdAFJHaPYK9i3rb46d+CiyBzkhlOfhiQgKv5a16l7lnIDoQVLIJRlm0o
 +ZJmwlL8z3Em3xzAYYvQBp0PhwDN1aN5ZzOadY+g4MU5DOyaQbM3LOI77RE3BbvkXaZlFSflHrR
 2TWAJzLQyO69aU6zUTA==
X-Proofpoint-ORIG-GUID: amZlTkFrXsowVyM27CAvQLkDcwfShBfM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMCBTYWx0ZWRfXz1dTzAbLQF0h
 rf6sksuLpPM9ylgiIIXfxi4e40+lJXs7KJOy3zw33W6dR9knieefwo5OFW6N/mRpGM5UR0UkBPb
 0Nd0/OYT1DlFRbJZH1O8b8ndj8MwlTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210120

On 7/21/26 1:15 PM, Chandana Kishori Chiluveru wrote:
> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
> 3 bits wide. Serial engine indices >= 8 get silently truncated by
> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
> causing the GPI channel to bind to the wrong serial engine. The
> channel allocate command still succeeds (it doesn't require the
> target SE to respond), but the subsequent channel start command times
> out waiting for hardware to complete the handoff to the (incorrectly
> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
> for SE8 and SE9 serial engines.
> 
> Older documentation, such as the SDM845 hardware programming guide,
> describes the SE ID field as bits [2:0]. More recent QUP hardware
> documentation defines the field as bits [3:0]. Use the wider definition
> to match current hardware documentation while remaining compatible with
> existing platforms and enabling serial engine IDs greater than 7.
> 
> Also update the SE Protocol field definition to match the documented
> register layout and keep both fields correctly packed.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
