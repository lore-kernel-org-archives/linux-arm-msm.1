Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83640433027
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010337; cv=none; b=dGOt3YDeSeA05p8v++UIIGFBMhVw21fXixdENcxiJDIn6ZR26JMHQqeJ5G/XJ/QMdeRa6cP1hz5OWGFyVvNB/1HI95POwMY7M9ITRHRK0FSgETh6Hnjywy7mhTnaDU5IsgfOUhGEe9ORJWC270b0Hjac9aFvQB4GJnGFwC8CbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010337; c=relaxed/simple;
	bh=YnnEPpfnUPa5Y9StJluJxI90r1PmLRRMqN1/9yvH/ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0RADD6RbL0G71OdhEaWaa+e/sqLNhz6hTqG9yxgBhNTJuQjyw4E3pQkoEshcfq0mtw9kI6lrQ9H0yUEKenKm3xlo8JZj24QaNdLTTxyGTVIyHFHarxPWr5H8t0QFt41LT3pftiGn25h1XSsEOYJnPuyLXDj2ETjg02CoyGB0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmwramH2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITLrXJA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmwramH2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITLrXJA4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nrcO1228396
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=; b=KmwramH2AQ7tLxSZ
	Jj7I0GUOgipYTvaRdwNWV8APeDGz+UhXcLhK4EstQekIMjncFVmLRSzqsH/XZJFi
	jQsNSYe+tWcHK152OLTeoJyhMAS9LQpu/3SEFwhgFja5iY1yHZJpiesG3cS1NilW
	CTT16uublfNjyoRXaBHcKe5mzQr53tkwsZ47y4ZWgmieoTZ4aXWYOtuJi4Ogz8OJ
	KydxY0QVSDopT2yxptE9xg356iOC/0Lk8dxALtUHSPYXukVPfGiGyEmHTTQpyZcN
	FxdGLsCTWKYMTegRsBIbsy2mkgBAj+0oci65dYJnn7nSBo7nCmOk9539vKRvfnKs
	KvijJQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdug64u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:58:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848d21bbb55so3548557b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010333; x=1786615133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=;
        b=ITLrXJA4RJhO+zdEmVuSShwPZqtEeNY5aaA1oFc5DlmhmExyBV19b1INqm5vy+x0fI
         uOfjBqP0LgSFO2uLYYSiBGsAwYXErZpw8+YDbYzPT8NCu4RvJR/hdrr45AAGE8/WERjK
         kvJF2GNVZO6Pjrbi9qyJHK4Ed8Jbt+DYKQ6p3/IwWaRJXa2L0RwnZ59lEAvMjoVAycGU
         7rN0ep9e23bWxmAcoUm866YjbdUiLWYipnANtJJMZR3gcf+AsGw8W92DCFXDe/MfQE3Q
         8gUjRhJCO7B53RiHWPXscMUlQ6WlH9jgqUptgrsdU75TqXs8iC1nN4rgV8HNOMUVClaK
         aGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010333; x=1786615133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx9UkPI2/eVI7/G8hFIhX+SVBVFckt785d9/b/IsG/w=;
        b=GnvS3Ue2c+vk+MRcP+dMIPvyAfqT1fQ+sAnU8onUbwWZ3bgdiNv/GPPmD0A7o1rENY
         Zd9Z/l29leyJ/SXUR7eCi1RliQNO3xU1yIXN1gOGyXtPL+TIselDAUS9z7eI0z6aNr6C
         IneleNFkw8YanArKfah8oc0VlSSz4fkFSu0TguBWQmTvlKLC9l8ExkYXfKo2rI9NXqTM
         Il31GjrmEOOT62muGk7SD9aBjphqic3+A7rcLgtgg8tJOPHXCMo+He/4W+yRVPXObIp9
         t5eufOMOqTITU31CGocumcSMQTazwojJuT6Y6XPf3YE8N2pmR0DLDpPPPl9LXODNQen0
         hAlg==
X-Forwarded-Encrypted: i=1; AHgh+RpcfIqAGEtG3UfBS05zOwU1p3DpbBn1mJRm2tSwGRN1E1gsr6gMw66jMdkjMTWiDIjK431Yvd63AiTu4JOh@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHFiFZBf/GnGB7smYHkCuhDKAP0kvTT7iPC/n6x8qdemgeMzQ
	DZQi57MLJcBx5KWE5KsuZtwJtKA3213oDMJjMYUjwDXFuQlGqDPDtsiv6Z7RqF90l0sdToZtlQF
	FpwJ0A+KN/hV/88wX/kB8WU2abQs/1N8VsYogN90vMwlDZ7uJ8WQFt8QKJyydoMcG7YrT
X-Gm-Gg: AR+sD13McmZcow1y/IXIq1glP3Ep+WI2IQV0RD/t1kjGYUsrbmH3YtZD26NbeNRh7kh
	szMewaaCKT6CBUOlSoDrbShPGwhq48vDGj0DsM7una3v132RAE7mdzQtX7uvROI5W9tdLCEVCWs
	HgHHigMU6YcR4Sv4PsKjn7oi46exZo1CwCm4xTRa60d1MVK/lVdgu6TJ1KSVUSQCwItlywIWb8P
	kgtlyUKwNvYk7pDWl/7Xi/R8XGG6vUhez5LvUlSrPIn7qhzBBXHV2xP10n2IiUe9Dsjvvmu7Hyp
	Uo2cJMa96t/VzA2zi2CDYJ5mwoJrZQ//qAxyUzO/T0iaHVz8FFWKqm1/jyIVVVsHWMPie7bf2Jm
	QCC/lQQUW3EfA6be3b07mVDg93N8X
X-Received: by 2002:a05:6a00:1f12:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-84f2e0e1b58mr16151722b3a.34.1786010333120;
        Thu, 06 Aug 2026 02:58:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f12:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-84f2e0e1b58mr16151677b3a.34.1786010332755;
        Thu, 06 Aug 2026 02:58:52 -0700 (PDT)
Received: from [10.217.217.131] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e75sm1068934b3a.2.2026.08.06.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:58:52 -0700 (PDT)
Message-ID: <53fcdfb0-2bad-46ed-a4a5-519a1495cfda@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:28:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
 <20260805142646.GA795123-robh@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260805142646.GA795123-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cqp7AYnr164uaL4l_6aX1lp2MV6NbLf8
X-Proofpoint-ORIG-GUID: Cqp7AYnr164uaL4l_6aX1lp2MV6NbLf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfXyIWr0wZoeHLj
 7EPnk3zhURdta5E4pVb/byXXQXMtN0oRTyChXKj/EhMkN6EKjggkVcD1uKEQuryrRhr5jB4Ork5
 AGG3VjBLN4CG1ts+e28iry8wW1oMU6gUuvkS0TwAbE68Jq3GEAedzKqBAla6yWOholDNaCO3cd9
 Dz2yBAYoJhPIftLHZJJ/GY+mWCY0zXz70gFmgsVD5J/QjLU1/s6Hbwao087Wk+dS3qI7M9PBQn2
 w2QMb8DJh5lltDgEssUQ6reBSzcVjLnW8r8Qe3qjrDR77PEyf3Ps5kD7Yphx4LWDY9SNsuRiYpV
 xeJTjJ81GwmesxhBSX2dqwKj+D5HRS9UxzBvpSHPNqDC3H7KBtot3Yx+7GOXpz82gC+o6wI5l1B
 BC1IEdx7wyV6s1fIYpOGCievXT3s9k1LnARd3TTrdyBN1bn4UfE5zw8hdSFhA51AMy/TObYV+Ir
 QSYphGOhEznzpyKyPpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfXzx/QnPVyV2UP
 ujTg3jXplQek5stnVWyIzTFCbSbwpoe251dFYyz8xPnfLua9c9Ve52qKAJdzA96M3+PPbql3enF
 xJdB5RgjLF88HnqE6exYMo49eEN1EkM=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a745add cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=h0B1KYQZdrYX5eXDyKoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060076



On 8/5/2026 7:56 PM, Rob Herring wrote:
> On Tue, Aug 04, 2026 at 11:20:19PM +0530, Taniya Das wrote:
>> Eliza camera clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza camera and camera BIST clock
>> controller to the existing Milos camcc binding and add the
>> dt-bindings header for Eliza.
>>
>> The camera clock controller provides power domains, so 'power-domain-cells'
> 
> You mean '#power-domain-cells'?

Yeah Rob, I mean #power-domain-cells. I will update the commit text as well.

> 
>> must be present in the device tree node. Add this to required properties
>> to enforce it in the binding schema.
> 
> The sashiko report seems valid to me. Should cambistmclkcc be a power 
> domain provider?
> 

cambistmclkcc is a clock controller similar to camcc, I have tried to
reuse the same bindings. I will add a constraint to take care of the
comments from 'sashiko'.

-- 
Thanks,
Taniya Das

