Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936247B432
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785918; cv=none; b=n69sJN4Gop9pUsVqOSCyP4U8HQ27fptBs05N3g+wdi9q90kyLZxKnBejnW9FgZ5gZEZkcynnyzCMtJKeVZj3X29A8jBNZ5Vau/cgahS+KPl7e61vaFEmTmQfM2W+pD+Qk36xdDfwE+vd3SaWpuBZcwqA9yfyoIiihyS8SaOOaAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785918; c=relaxed/simple;
	bh=DCoJBl7amgy1yhvT0dMKEv17zLSUXval2AKvsyCluU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEA1/xD9KaiSIPYYiaQVIb+f9/lFgD+in/KmazaJmSMx9lcDDW319uPnuTI4F2Wrp9hiGjzJsflvVeQlr6XYH0kx4mCaGY7Hx0YhayebvTbcwGSCEPmbiurL+xx5NGImh9A/WTaHxB/WtJY4MFcTOTSqkg6xKOGwpI+FCxOhync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtiU6jt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3mQHDEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtiU6jt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3mQHDEo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRU8217680
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=; b=XtiU6jt+gVsasIn0
	H1tOky+lowiW6CAOXCYyJ2hXrpaBAVdk674w6O4GTlX2+WEUnmzYId94+TMokEz9
	KMVBsRnHXeheFBoKwFC+yGGYRiBv3Up4az5HYr0H0lZ4SSPaZIIiS+Bou/4UMFqf
	Q0SWc+dKPRD5XzWpRKIG64YJbhhgKsQGfBdgX1H11gdhqVd8P1l6pnTgwvKbWFek
	kip1kiiTtK4C/2QPzEy9KnNGFgcuqc9rvu8FmFxpig90+NVnWoIu0JFVie1fVBIY
	i7wI6V/g1SW5aRwYrT5Nqq1IamDxwkCSCiAqJGQu90HoyIR91+Tlq2F3Dcx8QYWV
	Jkqjyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgvp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:58:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93102454272so49915985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785906; x=1789390706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=U3mQHDEoLLGaISWXfGENLSUkkYpHDim+QzXcyCaJ291AG6/4yhWnDUJF0jD6742rjQ
         HIjfqiOBmUuQIpj/AjTGy3vfK4YYliVEq34+H+0YdFUvAGpvsca8FjZewtZ+wVbhY7nz
         hGE4wpgO7YKdNRR+etB9zk7tnJs0vAHfh0DA+hhp9hkDY00vfx+0Fc8O5xQcSvgBZcGW
         L2HGzOzzUCuhQuPMtdNB20/X7iQdolyHVeZk66dPJVfUD+lKE+EiRPdiUpj61U6ecHHr
         JODrf1xtaI/oM991vN5KZiJONoVIeg9/7Vzhw3oWzeLSjJVLb30q0FvJ+1T/OeNepRr9
         uZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785906; x=1789390706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=XwbkkMYIgN6n1Cn0v2Mp+gCVLCIZ37acPw2KiHAjZVA6YDdZPwEHoJgbYsBJLkjpxF
         sGF3pVqWlVdpxBqXz+FuDReGph8cBpCfaCgjZR5gWpIGb1lmGfo80x+k8vR9XePe/uIt
         az9oacFQbjh1U1ve3h9pMRiLrleTYYYkDkoFl5d1pnVgFI02oVuJXbdPfEFhYRzD74GJ
         Iu9XpPbWFM0fettyPPUlbfAgQjQCgVmtqZL9fKx7vxINMkNJXCVWAX1oBI1vE/6sNtqP
         7cYdEV5UuobAaHacrWO3v4S+abcktWTSfUsL3DPPl+nTzzp5cyxkYzbdZoVbPJ9RlZy7
         qiGg==
X-Gm-Message-State: AFuF++kUW8apkhwgqPMTvnDy/Lqf+0u1Mpv08w207k86/B807W+DGf1q
	5Xixn/b+CFrQKhE2LfNAv5/pwhsbqHTFi9o+szmVGTp/CUzLjbnzHSMb9N9pbAWuhDRN5q/c6c7
	FKOfVKc2SqiRX5/2lIaNWttnZJzQdQ+4YwZseZl2cSksb0LM9G/Mu/x7ZhMnZ2oxvRYo/
X-Gm-Gg: AYBFou2JgPIZiBqRuegnIFWuq1jk4LeqxWtTPoCFCSk/l4p4bGBqyjZvuBg/H7RNtY4
	ka1d9U2B8Q4WNGlW1OONnUtBT0N1gNN3w/JrVT71+WkIqC8GipRbL0eM79i/8e0VfnkYJpJiwMr
	yZxi5cwYdCGuaRhSKDvYQ+A92JSKA/7aVOaGyz+a8uBRzfevLOZRJZNRExClXI9pFMLamgbkDbq
	FqzRjAQdnGgau9XtLTVYIsj3kv/osCLWhbg56KaX1WzGcZCK5fPOzPY/XBMQkkW70QMdvqjc0yE
	xcwd4FVJNYUoDeU9zXVRCj5Du9W6TACDVwrRaJmG3G7ybjnQ+jwZfmsCojl74l59mAOJsrMHCnV
	LGVOzX0p+0fT10HfBbLoTSw==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1787137185a.1.1788785906412;
        Mon, 07 Sep 2026 05:58:26 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1787121285a.1.1788785904186;
        Mon, 07 Sep 2026 05:58:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm408829066b.4.2026.09.07.05.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:58:23 -0700 (PDT)
Message-ID: <1c955b6e-6f79-4ddd-90b5-c667b68ce947@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:58:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: ipq5424: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3kSxMeughlf4
 nLETFHhv4aUm2UOr0Ojt1BZ9BdKwEsSBTiiRGUWzqucEEly50R/RJ/4P4fNlryG72/1SnPAxTMw
 n349zrfd8UM6wPFCz1xLouDp+0vOvhnK4ZfYC/FeGfzc0a6s9/hDD0IyWSHI5K1aYRoCIgoUrRC
 QpiLVXs/HFkdrYXrGKv48l9eq+tqP9dECp2IlcyMhNv/Ijtix5yyA+sEd4a+j7wrLjMDGzw0Omt
 ltxY0ZUPz+IlY+L3GiZ9A+QJK58nYUHZEMealTp2/hu7osg49T2lBwGGmMdLe9hpNVrl3ghukN4
 eU5QRzV0BwcfHkdqke50E4j2fQSgP5mEWdMT3YlonxW+gyzlHT1i3uBfndv71O1X+w5Nlp6Pl/q
 8BGKyF8GHw0Ync45sW+kC8Tmb3KxSBifUFSxutzF1rxun2C0LcIOVaQsHZo27plJjEUsQC1nsLB
 pR4gFxjqmwn0iFdxlsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXz9jNubIDiYuH
 LiP7xGCUermjHcqUbNQW6AJRuQDliA+LQ9jPmwdw1wWzjQeJ8c1O//XEczxaMWHkSHLCr+Y9B90
 6Kpue41CUaKCfoOr+LDQ4u++XEPU24E=
X-Proofpoint-ORIG-GUID: 2ZtlY1fK9F9BnxtNoIRwTUwnub5wYcML
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9eb4f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2ZtlY1fK9F9BnxtNoIRwTUwnub5wYcML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
