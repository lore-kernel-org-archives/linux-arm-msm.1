Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447358;
	b=QZxRLzbIt0uuomHyOA/SDsct0Ga0VbTrOI49zJJrstp02EGQo87QHCW0Ytw9IgfpCjVI
	 a3hqkcpFfTW2dN8ow5aSirHG8bHPYZKlLkAYR5UboV3r5sW50GSf17eJU/0d1PTJefbGT
	 Z7ccWE59oAEGrvGWY0n0AoJ1W4ILIhqNPeXhHZ0tk6bDazco7mn5rK+69A3lxTCW1mpVp
	 y7mY311nxzVGHpe7fF7hdtb+FzWDqyfX+RZTwr0O2G30qgypRylWe3TuvI5m0gBEaVmhD
	 wgTbz9vQ+C6OdNicIboANYuAViEnYPyEhVwPMdWD+SWL0/+QyJr+LPyKqwsRAnSNaNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
	b=niBaGhmz38hPPh4qR3Ki3bcWhCPZUWkYbHC4dzHQmmb9uuTtJYq8N2JSldbYY+asEMPz
	 smRvqwVmzElePGrn7V7jfD2nKcXcV9g8YvOOnDnSG6XnA8evrh+c0p+/5won+fGH+Sz4s
	 aKx2wOAJMYg50FpVl3RPev706rzxOngO7ngPDmT3fsugi6VMJc8r3sR9iBv1p0BAyjhd5
	 NG9va2V+jfBZGVUl3pz0KEVIUdWS3buDxyYQ5u6KTmf3X/Wv64qM2mRHfaAdEpivpKi4A
	 Kl0hQblmW9NNMIzRFuz27PrhI6BrIfsLau8f8mL+JJu1tqLmoIKAYV9aWBVGiy3wJYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hGlKNPG/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0Qpren;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84FE606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGlKNPG/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0Qpren
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKsn4693788
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=; b=hGlKNPG/fxzm3rld
	gNryU850G1nqO933oknVTgPAvtA4pSrWcdSaZXW/reONdtMatxVdc+s/x9VNbi+W
	7NHeqx0AeA/hlEPBrScxqHg98CKOl63zCsTd2NUjjknfyy8iS3qTXpk9NbhdBrol
	c/m6r8pFhlMPxaPhiRKw1XwM/4fKyxfe0vMyc7WDZSkeaC0AT3SaJ/sJIxbK+lca
	OeNqvpHPTMwXSRkmrEBOnbciyKxDZiw/hEF6d8Ykkz1CGy2zfk1RcVf371SG4q+h
	NsgzTbs7/XiIsTwmz2Evn6XQUdcoFLfsdWnrM/3HyXEMI61nuwPA5Iv8Gc8YUSpL
	HlHhSA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0ry6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4f7d6b98eso50162657b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447355; x=1796052155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=gs0Qpren4ffJsyB2nZppF82qZJzrUnjUzmbjW77wKv5psLmJTToUlwmuSC3XmE+C7l
         QGSxGSaxhSa1dm1gTVHHZErNIyqbLQrbPZNQGxXW2SLy8zyfGjxsTqpqn9+mYbOMD8Fy
         TWbDZIypyUERbDM+RIgH8doteHgQSgFD/0XE/0/Zi6lMac7QKAL9YVlO8+eRo/CDFMCI
         12zRzE564lYrOWVgcfOofurUA7Cuyu1zz+SXt7XxC382JNsbDNi5SPqeOSxB51zKvAVt
         dHCuv3fs/FmW0jc09eYapOIYkKzbEJHAiyHPHWg2DtIV9op614CtLZ4v7fR8/NrSbHpK
         ccFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447355; x=1796052155;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=iN0UGfLWdo0pk6KpVuNTQ4pON6UdJnCBM1gBRT6o2S3ylFdPz5fWR8tdwDhXDt1Aol
         pY+4kTHpja5fN+jSUpP0Hzx97nxOe2YPw5o41PNh0xRf9ALFHjVcLPKvpJzT/OlL8b7f
         G6BwDH5vxs+7iYPjcrSNSlGf7t6dlI7gq38zccIUdE664pSNpHh53yTkV2zSMbVHeFQ0
         5JTjDmI+OoizrAgkZVLZ4VGJ7fkU1I+YxnSEDr4RJ0t+YCrWmw1qDQsYiA/4UhZC8Vlk
         8aZaWKjoo0DUw+gfH4SDIsfLU3Wo/m9UpVgmjsJwsaclRgBaDqidhJ6xhFC5NTdkBr8X
         FV8A==
X-Forwarded-Encrypted: i=1; AL+hErFCffnp4RAbet2gVDgiKFkL1aXK7qFmrsUFF+V/cR+OZ58NdHnJROT3ND4day7ZIUsXN0tos7e8oZfVRpAz@vger.kernel.org
X-Gm-Message-State: APuU4Z9KtSI9rx6C0aSJm1FHZcfzI8ET+v3Afd8hma8oCdQC0UZU9hd3
	UGnNx9hBtRRzK6vuwb1HsB7kfgd030cHlo7OfR1lgo59bD3y1Igl11m8JGNeXhOLTwvQksLSXNk
	yeuQre0K7oywoNpswhwknwvb15KliiRSj0e2qTqSBIl/PspiJInLMuEm4sD/W+iKHGpqp
X-Gm-Gg: AZFdTZfuADW1uBgla1t0tu1WdEx8/3YQATRkXn/CFNyZPaJAOYYlUSy306Hg0sctCHL
	0Y2Rm1F0ZzXanZnu93AYMj7PdsmosFCTGcjLW5eMOtmCRJjla4uRKcTwdirkLUBNMmeMsz080By
	Z+Ae3AUifDwiQEgt8NigReVFtkb1WSw1xTBAd9NQKNEtZkm2pgDcByc+TOr7RT1gA3gsqhSDjNx
	PkNaCq4EkdzIojO0Z8jy7pXx9WXRhS1SSjeAoK3EysatFg4ZczHGklWQSAb2tjLSQcan4IUACk7
	0MfQyTsxiYm0XUr6CoqmeGvaCh99OblH0Ueo96Tds9dTjhNKbB2wSiTicQt/uy35Bz80xpcN1ug
	M0bZE7LQziSKgUbkkB97OWRC3hDtrlk/sVGwgSr7pMJq1Cbflc30aM6IHME8XEWuC14Q4UXnfKu
	E=
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795397b3.6.1795447355045;
        Mon, 23 Nov 2026 07:22:35 -0800 (PST)
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795207b3.6.1795447354440;
        Mon, 23 Nov 2026 07:22:34 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22927144f8f.51.2026.11.23.07.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:33 -0800 (PST)
Message-ID: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:31 +0100
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vc1c_ycD96A6krgPtWBIJznSHFuPPqtl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX0kAwQPMb/wlM
 +OFeqmf77IgUhIP8mpUOXt0VjJIA2LrT5dCN1aOWNEM3fLNxxuBAhf6qEh4qWLLH2AyCQ6YI6Zf
 xjUGy9h5NolpCFC24jLbvnjmc2l8R+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX8cjxbvSVW4G+
 QVhXZlAdu0DnQZrxydbizWr9rJlYQVLlyKF6pmhN/hzD7By3tbltuFLeZH/iWDlRLcJsDnIbxOf
 4eSm1gMo4NtGpEZSfkCVxF5NKH+yUzrK6OArD8H8eKq6W4OF1T3Kz+0jEXsQc4oK7PM7Lk6/0g8
 +wTFCRpKF/GtklhrXXJiZUqUPNaVpqFUK9kQ1RyQp8fv0APuJ0aiRbd5Ag4hGsIMUq3v6QUiW9W
 FESdPM0Y1QcusKQ8K2YS/rKPy2eS1CorN3h+2qF17qRd9GSRCxR/QvOc+rl/jlAxcIPHr7cc9T4
 RuYu3lcInR6H1ZACWKD7gd68Duk/+ND7DjdVj4juHMeKvCM/ky4q8dkbi/2H1J6mdXLduUK9jUA
 Hxeg6/O58S43bpzHlxR+MF3MAFkIJq/vxcGG2aQe0ho+LnZTX58hrBT2O52pALZwK2vybyxTXAh
 xbOSLEEDta3Cj/F3mtg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b045a3c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SaS78iIXIhQ6CdhXs3EA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: Vc1c_ycD96A6krgPtWBIJznSHFuPPqtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 23/11/2026 16:17, Konrad Dybcio wrote:
> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
>> This has no impact on in-tree ABI, but any outside users would be
>> affected.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> I think we can move it altogether, to prevent a situation where one has

We cannot move all, because some are actual ABI. I could try to leave
these ones only, but that's a bit too much work, IMO, that's why I cut
everything at ~450 value of ID.


> to take time out of their day to analyze which one of these is right..
> 
> To me, this is the same case as e.g. glymur-ipcc.h where the values are
> some foreign constants that are specifically NOT bindings



Best regards,
Krzysztof
