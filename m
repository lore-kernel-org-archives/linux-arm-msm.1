Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43577246788
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116767; cv=none; b=tRlrCXIcACMwaunTYm+wbBW1W77vsUNS7qrxeibhCaX8+mtehFYiEjjV6No8E+/z5ssSxSUUJNigSd+sMrp6dNP3kU+SNSiJXG7IJqxAmQv6fm7BnOCdTlnaDwdazG5/U+CFU9bcfA+5W95XGEadex75iEBME9EqaUyvwaCqE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116767; c=relaxed/simple;
	bh=eMM2fY2sSyTG2BVZM8zJsxAwDHGcEqxeCIX/N813lEY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IGx3MSGq2qqqgykf0rC9c11Uge7g1NJFjd4b/mR+zmRJZgfqXmYmbM2ZxGMlsESrGCGaQFwsojzZshN5mavunmR9veY79gDf9RgB5cEKGTore83EsgYedgX8Z83hnNkndwpqC9IWRKykothsL4VDAyOhliWu1FfbAUeuLp0ceWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIw3RjXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRHfRkyj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIw3RjXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRHfRkyj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5Hx2A3323790
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKsEa2XwhEwGj2LvHoISQJqWBujx/+W3c8LKRXoZFXA=; b=RIw3RjXQpgPFi/z8
	2mMAmLpmHrhwGCNT9blhjQXVcbwvJiifKYoJUO52Ph4x85HJMxjYTGl9T02XcT6I
	1k3Q/zwNEM+Qh08ZBxqnAIOO01QLtIuPMwukVBoqGxGQ46CNk30mWEalgFkFxFGe
	S6buboMQ9Xd/bKYiiEAz799pH0exRW9v2P85yKgwI6tQgVRCy1Hipy4Q6EIWpu2n
	KUeeTsWRjpYZwIaqUbV6i2Vo+mwD1vBFowr8rKxuUdbJO/Sxvf8iOzMzLM1J7+6D
	xbCaLkdKNg9ePjuqVzy/s//ZvxWT45bZKu0HSio8w7GPkGMn99R8MAmbCss9f20G
	bI71CA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjhgxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:19:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1977217a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787116764; x=1787721564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKsEa2XwhEwGj2LvHoISQJqWBujx/+W3c8LKRXoZFXA=;
        b=RRHfRkyjSZXBPtk9wOua8xyoSgiH9b9we+rgp5DI+n1aFtKjHvyKbDtUr+BwKNJHDZ
         xIlFwqzaiHwoTL5KdR3JbeYKhcjArVByfDzPRtfPI8qF5Qhl/aePVo8eokmbnoh0CW7d
         07IWkDB2VlhyZ04L71/L7uAGPVA2Ropq9RLwTvVVPNBUAEzp4tql8igB4n4D1oopI8ux
         Wq3LbkcshuYMeN6wamdH8j6N6IozQr8UD623deqCV7ucBGWx5Ufcz3S8iYC0HGwhEC0X
         K+JnnFYvyA5irxbWZQdx0bSlAsGiTBsfsa8yVb7aOwz50VPW6mC89DEhYY0dZbU3xKvH
         uscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787116764; x=1787721564;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKsEa2XwhEwGj2LvHoISQJqWBujx/+W3c8LKRXoZFXA=;
        b=BSY7c+NUmRQ3EHdumE4SjAfkcKVw5iGdCXDPlf07UikukgMuGqPHH5idYTBZYR2jC/
         FSFxFwk7eURQmwvDT9WMWphu4x5PwTNyvI7RMIbcTvc27eSHgzUCfJqadF6GL5kbog/f
         OzuxoJCOYVQf8Oe8yRvfaNem+p2Vp0S7H8tKhBpZYLIL4Ty5laK2SamlH/yNyV790oaK
         ZU1023ENcizf1T7YL+VRSOy6G5Yl2ZzeTHoQx0C7F+ySqqtDH4oAJUQVhj8tyMM4lVh/
         vxMhV7cydETNi0LVtjUuUR38I45G6GRaPMHeY37ferukYl3j6OGb1y09b8biPE2LTpzP
         TD/Q==
X-Gm-Message-State: AOJu0Yz3Oghr12dZdPMzd5jw6Ri9DaHjMRrf+SdBTRD4Z44zUoRUTLQ3
	XUBVpvpfK3j52En31HQgGMxMbKcR8lONR1KCIyupcH0ETywpeZ0if4T+q02xBRbdUsK4UhR2/Ze
	palcZ/QQzAJKbi34sWkPcgqmfecGhf7rrcGhVZ4wSr8hP6zmsBkFzRWJYmkmI3l9ruSZz
X-Gm-Gg: AR+sD11wYYCWSsK7rA8KgwaJ4fDh7BSwzv30YBnKTf/B07FQMibKw9eBfK8pktGM50V
	xv2irABQACi+j1wRLcYfjSwDvBCu27xVbOz7gqNejVFXxtlM9uiqoeOO9Iaq1SVXfXOQ5OOvV5F
	NqM6UjiqJGf+rq+wkWLfJ3RKKeHUY++IPBVYH4IWTiDHPI6XuKG2JN58UYrEHBg77Cmsf+EeGoR
	I91KeQn6HgWaOg1gAjNvugU2eAaSHLDITAevlUadYzpVmQGSVmLF8cnwDaz/fNxdjrvqohd4zOm
	lTAudFd52VrftkaPftL4qockqETrO/jcedqpoCiU0DrKq4AoszWDOehMOb9uqQlYkcxvo/rrYyF
	WUqzZ7w2+axPxEWHlfuO7I8c=
X-Received: by 2002:a17:90b:4b91:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-3957f874e86mr2285919a91.1.1787116764110;
        Tue, 18 Aug 2026 22:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4b91:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-3957f874e86mr2285880a91.1.1787116763677;
        Tue, 18 Aug 2026 22:19:23 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.87.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fc4a022sm441296a91.4.2026.08.18.22.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:19:22 -0700 (PDT)
Message-ID: <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzNyBTYWx0ZWRfXy/1N8y7KHxns
 9TTim0efwapSNOkSqnGM5ekzS3cvE0MpLmg2QkDejnfxZcjHbNAyMG1KfaCUgL0IpdNrTa8CZSb
 aMSH6EI+/olh+ib6miXWyoufV3QxPsh3MynP67AFxAThVwkWgOL07ingoTMCuDh8AK/vI33WkLV
 eDAYaUCuPy8fKhjAtwqRQgizGtjR8d1YHeNIZDJC/lxI2GedVOQCX6fq1NtemBvzsW8O6HPbUdt
 ZFcsNVUt8kfhX0Qowl8etl09fAE5LWeB5uw99kDEr6a8fnOApsZjgbTrBSnPb6RyMqueDlZyKZf
 juVuIGVBKuL9fhnfMjvJueFyoFR8jkZDX/yEGrzINb9IEk6SuUrCs5d8JOZXiIMnnhsx3hngbvq
 ZBpeJgH4u45QGFj9v2IqUjP6tzhuo5d+xiE/4PpuPgRSW86mdWQxeeX4o/F2QBi1nLUaOW0d2fu
 EwTeQ0SgRuhoIRo8oXg==
X-Proofpoint-GUID: VNasT4au8M87gnQGPywpUIjYhnKi9azJ
X-Proofpoint-ORIG-GUID: VNasT4au8M87gnQGPywpUIjYhnKi9azJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzNyBTYWx0ZWRfX/HiSxioCgiOo
 xZpkYBRK4VNSji6WiGlUkH2LylvwGLjn9LmggESSqwuWVpcSJqV3ApHGk3dAXSb7n+Y9tU+rF49
 R8U9YDYyIcJxax7ely1YfD9ou8k/yYI=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a853cdd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=alUBXKyVNpYQNee0O81Cpw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=zvO9yiSBen9DV1Ab8akA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190037



On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>> Is being on a (powerful) charger a prerequisite for entering this profile?
>> Currently plugging in a 5W charger would trigger the switch as well.
>>
>> Should this instead be exposed as a fan profile for userspace?
>>
>> Konrad
> Fair point — power_supply_is_system_supplied() only checks mains
> presence, not charger wattage, so even a 5W charger triggers the "best
> performance" profile. And exposing this via platform_profile instead of
> an automatic AC/battery switch would let userspace make the call
> instead. Will check on the feasibility of making this possible.
Even at 5W we're still not battery-constrained, so best performance
still makes sense, it's about wall power vs battery, not wattage. And I
don't think userspace needs control over this either, it's just an
automatic fan curve pick, not a performance setting users would want to
tune themselves.

-- 
Best Regards,
Anvesh

