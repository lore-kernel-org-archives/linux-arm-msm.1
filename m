Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605296;
	b=16Qrmb+oOyOtpTTOHs1w5yB/f6jNbuQoB4Prm8I9UOIxZgl42Ge2f21W3xWHYoMouWLm
	 YH803hzFr81F4VIvDtcYSAzbHB1HdltQscOP2iGE7XjW/J53gVBmTjNmYbr1Ueaw3QGHU
	 orJKJcYy0bzeHAKwESkcTvUOVhS6cIxD+V4iBNcXUJ5YHs2ZhJyILAgTyGbuCn9fbO8vb
	 6+o/7izK3V5OynH6uesWVV8+Z3Va8nLj/uqJkA9zkYL+0dN1W0EBsBe6+7tz0lKVlx2R9
	 ozV/tapnmm38I0dIEQkHv6RhshKPwRBk8KWj5J+SnLeoC1reXN1Y5pk67uHMt1OO9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
	b=OHqD/JBmKkEfPSGTBwq3ormVup7FhqB+EDw0+KeuuCKOsC+OYBHp7SGgZKDWb94w7GLD
	 ZvWDm/Kfd+IxMMLDF8NgtCaqB2RUlrb9aDDAiH+ZO6IOD7ji+vM7qZ/ltz52cZHk0dl1n
	 SSeIyIryMlsaMPOczYJdSyxIaoU0QHqBrcif1O9MMUTSIAQgC3AXowmz0E86crp+rtsti
	 /DLHYg9rxxeEeFzemTcXDCyXX24mHt05Q6qmvyeH5nthP8cwGMbryTmtgGiUJAAeGIkdw
	 rpU1ANYq0Z4qvngpGbRrKXsocCBaBmuayYO4c6HDQHkDnoFZxlR5K9LQzSxONwquVXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iw5L/c5L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BongjRyo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99142606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99142606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iw5L/c5L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BongjRyo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9no0d1505311
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=; b=iw5L/c5LEqMKQlxs
	Kt++vdZNGXxSwIk+/wLeTfFOIwc0MYXU5ybGhgbBclLOlG8ydyNqc8EvjixXRsOV
	WpGa9R8sZUzhlzi1oGAaGPDXR2ppX/ZYjYzhqE0pfhKbBf955eJlAMRYqbWKOexN
	AX7Zaj+BMsWQgBWDnnVpueAwL9oA6YbEQaq9AgMkMSL0kKqrGeMFqV7Zp6eZ02YV
	KIPf+s9h5i0qPEg4Wson5+ERDfvMRMVoq3ZmDjeZtQopukHgsRWbA359yuwJ+O0W
	9Be2NJLJXN8XKgQ8xIfzx0TemdYfwfgbTQqn2MMJt9hvoXuZBLTWnpHsXHUgw75S
	u2pU5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29wy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94993a54a73so51359985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605294; x=1796210094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
        b=BongjRyoKMsyr9dR4Hw9a3/5kqY015TcMbMXkhCLD497R/v0oIKkLWBz4wakMU8fcc
         L/cerJEdtswQcsJafKbO7CBPKbnA4rRr5Hyk5GmdSPO9Qu8sGV+lLmQIoH/z2RXnjwGs
         laJn+b04uPrS1zVx6m9Lby5RRLO/r7np4vI75hUU7OFsZjheM+pXQRFhmrMSJRtR90at
         o9ApiRsZ/gXuWXFhrYN+AFt2FhoMRB1AwRlDldpVPlZOlKMC8ouIWhMW+pj9nmbB+tKn
         NFljZqLYma6IQhZ7fWO1Ly3Nzs/9awWFqf4UCGjQTtsS7NQPSUCusOSsQfIQy56F6/66
         ir6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605294; x=1796210094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikiKlfRi9berLfoPrc2k1052Co6X3F3qm6oP2ATaJ8s=;
        b=WUnyK+EdrgOFm2ETN2lfWnR937qcAN/a2JfxhS25dP0yFPjLXEuXbkmK1XaqJSvRdm
         KiFO9ESwEviuVeCyrLJgMcYYTw35BybLgEtrtLGbTTaaLzAssSIpyBTuR2wnFEKxoPPc
         Pm8jxgUoJEI1iZwqmrnnmQAm4XCw5cl94dwOkqJXisjhCQOd+MNVsW6lx9AS4VyE7qDn
         Oy5Sb6Io2EWNDjJs6Ssr+RnEBHxyPJIQAjcfJG3V0yCKtctlP+Hlap9FFnP1kozULk0K
         TByoon4MOTSQj0PPVi8djFblLvCIYycErbCTr7umgPyawEHht47XHGJBSrSL6bQ7ZRni
         mZ7g==
X-Forwarded-Encrypted: i=1; AL+hErGW2ckMtk98OrAMw2a3AYnqrMMtp0XYr1pqrQwoXc7awwFuERQI5OEVhxd9D7rhmfnpi2xDk6ZyNIWiQ3Ul@vger.kernel.org
X-Gm-Message-State: APuU4Z+YupDW1UF2+BdMdFbstWTGHd1YQSfl3Gkb6tzCLpYLtJIPF3ZQ
	gvIOAQijgz+K3UkjtVf2nGuvdjSHPl8ZHyOfqyhUjOzZk94WrGVixSCaMTybpi7DfHGfNDNqsQ5
	y7VPnziFzM3yONeVldoirtGVxvS7/BYIwRk64KpIjZd9d3lannJTzCL1Ub3SZP1UiZNrI
X-Gm-Gg: AZFdTZeazi7dPpIk3UNNYAheny71Wqd49fQV/+9vMe4R7KWKg57vMAxcKDtwz1u79NT
	yuJJLGo5pOQ9L0YL/2fZPOrvsmkK/paE64fSzAic1X26/3OTbjnB6CAjeXntENb3hU/z1XSrddv
	Nl9SmFeieuWPGMNl4WyFA6wBp/PpkeHCY2jR+/C50aXTu/ahpnVBBFSOtsVFqK4y91Fk7oERaxX
	S52tHRlcYAhRsusht71857T7cH0HRSUhop8LZjJw3mudOiALj6ukIsvgkK9wsRnvu2BTDzPrWHj
	jUNlguzknI/7tzahtC/jiOJ+C3BYPjXnUU3XEhdHZJGsgEqYd2si36L3D2jrRMOusxZaLAt5g6B
	zrMx6uw3q2z4SmsZg0YjS1XPzSsESgRuT652yLlUC6mWED4gUCxUvGj6Hf2YHTw91G/whtL8=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3334183085a.2.1795605293859;
        Wed, 25 Nov 2026 03:14:53 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3334179885a.2.1795605293467;
        Wed, 25 Nov 2026 03:14:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm617344866b.37.2026.11.25.03.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:14:52 -0800 (PST)
Message-ID: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:14:49 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mp3t7sE_I7baMTOphRyBdx_76kXal7fh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX4m8nK3UCqaCL
 wB3G4hgkyNRPVqZWpJOATdJfkBHWdqHsvchTuKtbzp3NxON2WeD58hTv9a97uIp2NsT9EnEe8qO
 75tvpLlu8YnKC5YLosLmrio4612bMMM=
X-Proofpoint-GUID: mp3t7sE_I7baMTOphRyBdx_76kXal7fh
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06c32e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NWOE7OTWcffpa4NYhI8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXwr/84TZ8YZxO
 Py4M3BRwu2QbVXKRab/CWo3Gl+iuX5uwHH8EcX8JhwAcy2cptwszJStGkTC3rZGgLT6yxQt0atS
 biM5+jbaHLnmHBFaAyC2f+vaq4WwK7lwLzLZJ/8mJlX9eSLkOeSU7gyDoMdf8oT9r8SCy7cRnuS
 /mD6KLnqawZi9nFIckqDY3nc1ZbcyTxx1VuF8EqRKZLfSBj6y+GJXAYkbGnymGUtX01zeaQj0SN
 81SFHWVLOfQX09G88x9eYH1eiQO1hQoJESrCSlmGlBqiG2vC7P9aUbuc+sTQWPxdnqNKjVS8Aoq
 pA2gSHQl3OxetEg/mjPaWSlgyyXeY5aqMnxBK08jjQjxhCm3s08Hum1G1fhzSROyt53VyDKRjB6
 aFjyO42OMtzmWgWJcqy7KD27gHcqznI/AVOMlcr4YEUWnclc64kpqN7mWkWGLwJCgg9fni3XilV
 zCT/FpuNrvmQ17A2ANg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>
>>> True, not ABI in meaning something agreed between DTS and driver, but
>>> the values are used by bootloader, DTS and the driver, so I would just
>>> leave them as is. I rather care about not growing this for newer platforms.
>>
>> Right, but they are compared against a hardware readout of a
>> well-defined value, not against made-up indices (i.e. these are
>> not bindings). I really don't like this ending up with 2 files
>> doing the same thing.
> 
> Not two files doing the same, but one for legacy and one for new.
> 
> OK, let's drop the bindings, but then what do you put into the drivers?
> Hard-coded values duplicating another hard-coded values from DTS header?

Or we can have the defines live in include/soc/?

Konrad
