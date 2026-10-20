Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500280;
	b=Iyi7L01vUrgmQoQeU1mR6ZnkD+Wayyw9om3zIldAtfxo1I1LFNsNm2UDCuNhLJj4uPUu
	 gtvZiJuddfONnXpxv30aBfbwQxvhitErc0tpEq3Gr2HfBXqvHYimLcVaP8COQ3fnmFvT8
	 yH/yCAtJB4ke0sxXcgmHC4qdVpoccTQ2oeUBOAbfyX+Sa+vbOfPTGeC/ecs8jHOTnWuOS
	 0tjWhZelI9oSwXqg3aXK/1EKQMj+wtylceZOQ3DVu6Bx0qtTApBswesg7aFkrWiDSfaEp
	 THKCbE95lkdz8qFSDD3lURg8U8Ue/JDtLIFnt9WC0+oYVuQ4LZYUu/rhFTwtZ930m2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
	b=EjGeVyd5sbAvBKjuoE/Lthj1r/KZnfEHf7SHOHqR1kH1dvnNYyh7/gExl5wsUhOgySs8
	 KlFLfcu2ass3Jlydeaf2PY4fNy9E27bToUd4CL55U0eQiL3o/szUSGuNW+WluJ220dZS/
	 VWFsa3R20PiqwBtqBDr09CoLpKWk7NWm9eTQMeLPxs6isjg3JyOTkIcZ9GJFewYwnsTUY
	 U2R92PpGB8NVRiVIF07N35Uonac/td9h6FQ6KNKpX18T0Tfk/vWktf+9CNDcfRo2A/qv1
	 Iywfcvcs9gycnvrOBLQARYGHGcehbnzIrV2BK5eWSKWeQcGjrxwGXZap2YShRu10qBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPgguQ0w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2Fog2h+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75281606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75281606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPgguQ0w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2Fog2h+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWSed1571683
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=; b=KPgguQ0wbKjaowTM
	T2JqPto0HnRXnD2+amMCpJjuNJNdjRdi+dkg2CLG87xqKP0lO8malGNdtS11Q6nu
	MsMUlpsnXJLm4kRK9Sj6IYrAtKqLf/KR09qv+ZsE0b19TTWwBPZ6xvU3V/0rILoN
	AzKmRNsow9hWhZccvM3s26jcZjGgGmbk3bogUwQ7emfqFFzXJvdZ1QPVfeSweFOa
	SkBqpqhIpZXQTxQc68ZYXllq85H5B0q7/3gB0T3oiFZIsq0qIQilpIM23nTne6UL
	phh7/cN5/zTHFbZk71xbvOCVsklIKwLigvo6wNEpHSpwqfXoLgvpkX7nODnsKux0
	NFh16g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h287e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:44:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so678233385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500279; x=1793105079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
        b=g2Fog2h+SzjdMLQYXVDkHJ0m9WmId2+O+ou7+iNhFxX1yKvVMrWgvwMNlAlUKg6rSV
         3GxMrCuTZoRQzP9XfjrqJ8vta6s3ysrd4oRfva5w5hQOb8EAJ4/qWZaoEyKZiiJWPlke
         /XlcP3lbqGwKScaTf9Ix/vbhJodDQ2MmMcSGfWuSRP0gTAl991FNs+sDLd5Q19rLmoe2
         J8SVwZyIRFkMpmEAS+8pHQD/FRjipT9bFX10oj1I+E+MmDpsUUC3LygmaLMpCx95oJjZ
         yMXYDsoJx/CBV0M0wmHQMShHcy9z2rHQexClp1IMi5C9GFRWKDnD+iNhPEfwra+zz9u9
         fBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500279; x=1793105079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
        b=DRg7tbYnPPOQ61E4TZoJzNd1n9A3at4iq3mu8Pjkw7PDuk4dE52rppDLMV8Xl+O4Y4
         VHUgnFvs5fZxRqyfIbhrfsXGFRICWcNKS5DNUEICMr3cdFwQqRab8cBkPrO9yQY6tP6F
         nnZCovWYac4hC9zbb5WhCD4DXH4ys4g12HXJX1a4Flii82HsrZJBeei9a+OFsdweYtgj
         aIWAU72DzlYcaMGmVOq+lbbnDu5ll0L68ihv7l/iXUcTTu6NSEGyVDI+BHP0hbuZsNje
         XVfz0BwP8dI9K54gXUQimvE9T4I55Llgsd1/yo49NHqVwAJpGyZCXAzSM1cztGpYVC3d
         aiXA==
X-Forwarded-Encrypted: i=1; AKwUvBzwXla7x9ovmqt+0IRC0X/A3Gym7NZmPWnDolgASmW/0QpvF+N/T176vpoDMhZHyeWEZklQOKZloNLhpsxz@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3hmkYc0J+/+qq7CeX7lJhJZgO34QQMsFWu0X9U/5epQjzR9EA
	otviA0fGMU77V/PWUkHARkCWryj/WtPdz33tbmzrDo1yNokMOX0I2I9AauumHYRPkNlABH18xyE
	6JJAFRidD/71L6IsVZB1iXVOZovdqmGyCywi7PRmldjKJ4PVR1QY5p3eb7ngCrb5O39w1
X-Gm-Gg: AYBFou3J0afMK8elZrcy3/DWae98mHl7IhwxdjoN6UByoIB7s3V7hAWS8i+PEYFJezx
	v1R+ylB44K1PNHmFTQCeyg/n0MIERGoO/tJGSBJUtUReeafP1NV50XEAtfOi5PeBLrDPwu02Lub
	3GVuWOV96UP7yvsCb7UuxpBJIuqvJRWqPbvnchltGvVGJIlSzvCSVpGmJZrOPAukYQukthqFRoY
	TXrtKpZZrHGfUwbOqPWl5HbvGO5FyIxP6OjQ4DxycH5ZWCAksWFqK8+qE3NawGLqE2gCNNTqVsd
	AlZ6Ho+cl8ZvASm3AVfC6lM9AS06Tv8GXJtHeCrGt5Dg1pVmv7qEd/7EzvkT9GAPJP9wfiVJjrH
	S7wJw1P1A16KOwIosMjxpo5db5v7F8Z0=
X-Received: by 2002:a05:620a:31a7:b0:93a:1048:7d2f with SMTP id af79cd13be357-93f29d307e5mr1871425485a.41.1792500278807;
        Tue, 20 Oct 2026 05:44:38 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:93a:1048:7d2f with SMTP id af79cd13be357-93f29d307e5mr1871420285a.41.1792500278289;
        Tue, 20 Oct 2026 05:44:38 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82dec7sm5868592f8f.46.2026.10.20.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:44:37 -0700 (PDT)
Message-ID: <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:44:34 +0300
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YEZ0mEcjUXFzT653EKCYOLi2D1xQYJBZ
X-Proofpoint-ORIG-GUID: YEZ0mEcjUXFzT653EKCYOLi2D1xQYJBZ
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad76237 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXyNXnDkIUFL7E
 oFqe8VJ70Whs5i3wxsu60PJxq5qTybnFn2H+OyU9fhf2J6p8Af4EMWJK6wvwVmFuyDp+nat4LBa
 jm640Rhk9rakqTW6PMeRsXial1kYQJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX1nJYyMw/rN98
 nJ9oCuoRTDuNnye5muu0FW18LEYwzU9mnyczZug1Gbg262rcAdy7P22dE2Ygb97ztVt3B1aMpCw
 Gz5KW3nhIceupZUtVZXLvVEAisUKPgMeypC2LGu9qoRTGLvXWgEIXgJJ6DGMJpCY0jLbW4dGPGd
 cHxW7dLQkNt97tDFEwzJzJI5jA9APal19J7Yv4uDiUzez2CA+5VLcnYyOXUID4pUPF+YqnPyLka
 HI+H2i1dmvrtBcnE3XRLsRsMxLeeEotRxjeFOo0cVTQeF+pebTzIWCLLTHOdOQ2GpADMwq4fi0/
 5NaO8ou0Yj5yZQhnZ3ZPYehgLoG8YRkRuIWRYf9jeHXDI12LtIGwRX1PlqS0/o9XhZ279Boct8Z
 zcP1DHO7d+35iz9g5nqQ0QtrzZqCqfb70iLyZ3TjZMaU/ud/FijLBCLIyLHPTIAn0gAtsXDI0u9
 GnlzLw4IMDW3/wvC5ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
Agreed, the problem is in the drivers. Today each CAMSS VFE calls
clk_set_rate() on camnoc_axi based on its own load only. The last
caller wins, and the rate is never lowered after streaming stops.

> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.
> 
> Best regards,
> Krzysztof

I checked clk_set_min_rate() and clk_set_rate_range(). The clock core
takes the highest minimum of all users, but when a user drops its
request, the core only clamps the last requested rate to the new
range. The RCG keeps that rate and does not go to the lowest allowed
one, so the clock stays high. Fixing this needs a change in the clock
core.

icc-clk already does this: the interconnect core aggregates the
requests and icc-clk is the only one that sets the clock rate. The
camnoc AXI clock drives the camera NoC, the bus between the camera
blocks and the MMSS NoC, so a bandwidth request matches the hardware.
gcc-ipq9574 uses icc-clk for its NoC clocks in the same way.

Which direction do you prefer? If icc-clk stays, I will add this
explanation to the commit message in v4.

Best regards,
Atanas


