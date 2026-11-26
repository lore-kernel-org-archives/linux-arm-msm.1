Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693390;
	b=op2IxIRco9pw02/0ejlDosZBB1i2xTxkFRyeLf2w81HjR2LyYHk3fTjjQ3RblZg0w88d
	 TPNE897wnEgf0zxqomoP62c+iTcdQdHn5h38Lo7TCHw4iUSjL2RZ5CMbqtRKHJP8sxSxb
	 RVFYQQwLQ/5sAJ8fViAVAgEn2WrFgXbHEK5nn4m0JzpFpqF2RhXAEdEf209AOZxoinjIT
	 4BYGML+l6CIzOH7YZPhAKx1c/Er8Q3VfhQbBj0bIS0QgL1snp5bybUjwCXHuh46IKtNFR
	 L6zxJ/E8JVYUmDgLj2hQTUEdIvnRtIRtR13MmgWuyKisx1/sgxB8gNABVg1q5PcOS6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
	b=5g9l6MW/YjhWatRDwMZ+8K8QXKnIUWk0/YlP6qjGCziubsjF1nsu3HP3hUUEEWod8eZH
	 kebpfgF/f2YBAjULjeGPN4jh2ylvtCTH6fkwmkxUJl0i5udtmrydaCwx6TaSchrJlpYUG
	 0oy/Kv2AtVvf9GeK3AHJB+1JNHsV88vZgqtHf/FOj3b2rpwWN4cUWZYO5vDGy1KQigfZn
	 A7/u2Nh820pEPX2I8hsJe6FTVkaDMI8TLydfLzJ+C6MuSx3PVfj0W/8FQDkeiWazDhsAt
	 EqcKOW3L+hqSIFC1EYpiPHXy6htSi1mvNhWT4A/Xo5hHgaEqabARH6zDhBojqwhFAow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ph/l1Nb4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtJF6JCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4D606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B4D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph/l1Nb4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtJF6JCa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVT9j3177434
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=; b=Ph/l1Nb46qAXKfsC
	hyU7zCheehfxWT4PC437hldcVQcirZYNI6wZxfMO6DWMr9ipcXXx8Kc1DGaOhby7
	Ogfn5blLfhe9b8OfC1ftRmFzp6ebCGUe2NSahdxUyC28/izEQG1hHelH38r28KAO
	RMppqdpaOaQxd1Z0hKa+vNBNW5Kuqz2vA+4gORX5maUMobVt2WuYkH6oNm5nXYa6
	2Hv4pY852MHss3mwbaZXQ6xUiD+6ss4sG/qaKGxnzSKWMMRFIOsAL7wrU6Ka+N6K
	y1hZo9Stexzgd44BAyvlk8FQDNN1qFFh+AGJy7AOdsnA5AO+DgA9ZZCe94FIbQ4j
	kUmAwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662say9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:43:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55dc6fc65ebso903031cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693388; x=1796298188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
        b=UtJF6JCaxBGZMfyGbRZmWPT4cpp2/DhODVOalw1RyH/JjnNftzzl+CP4RbFWNcUsr/
         hfjMuAAP2ced6WeZNV2YacTCcgoN6bSdKeP5fBsQq299aLsB8ihDamL01pu9yI1gMF0l
         D34Aqbeys5ZmG0cemu4LCFa723cQ29REP+hcUOUkq25OPeqA0ZiBWE94ZWhg7iQnusiL
         /HNa/ChktFJB6G9kIef134cmTY/+jZNZ1J8bVbRGhB/POC+E9S74bIgiIFECbNEdQ1/6
         9PS8shuGjN6iV401BnBMhlHs5cJ/mgOYsJRJTPdgrWpYgN+IgtTy4tS/pgXWyIfy9bcv
         Xn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693388; x=1796298188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
        b=17nM+M/Pqq5ZZtRwOMkPsYTv9o7eaWRR17xBuZ/+jDRI3f+g86pM8IH0wQdz4KzJnQ
         d8BiKPdMcNxAFUVgb//T2Qjf0mGXifSXy/GplZnJPzGjHF0MRlW+DDDBKHf6VjVQcf/0
         LP2HQ517NdfPWM4d32BsEm6d68B4E14rT2858BVn3tck4Q6koVH3HrnePAfwUSIuNM47
         oG33GhQcO6NRds32Qbcsxk9gXe21EmZVAegZTw3/cIGAySnU5x81tpocScOPlQ1s0yUY
         +qa9NbQGO0UDYYHSBa56doA+E3zXEAO9hv2glVf7O1mcML9+Nb0/S/TJrqNN2wQ4FfO2
         Rl6g==
X-Gm-Message-State: APuU4Z/lt2FhWZrVsB9ARNUiVNogRfqK6H6izY6hZFMRA+Xd/Ka2cSJ9
	g45Xr5WLNk/8kAraVADih3BO5l1Dvi1kghjHyr1CFW0BCXJMon8D0edZyzJZmcIg+HIOS/8rsGH
	DEoZF+iYLxPpMM+nOUxfjeyLx5d4yppeP9AUISiittwc7zDZMbPrVM26MX000OhUqDtd3
X-Gm-Gg: AZFdTZfUdGuhtyHgdYXVQ5eXYRT7eAkPqD0bEOmTS+bqCGcj7k7DkGCGv30iKxF0TnW
	PNOmu5sRYmitiZ2wRk3B7es4KPIQfuPuWVD4cy+QYdAdIbTuTBi8GsMwZcGPQ4JAGP44mBPhql7
	m04kNinrwVO8nOGhytIgrmlvd3R4sgnL3Va2od6ZIe/VaFXnb6QnF1o4VufrkFVzAo8DRiTHYES
	n4EMqzrRvh/dAA/AsIJzRcfGlbmss+28504OqzvNbYFg9XNa4CZzFGTKnzW/QL4m7jelY7pNk0F
	oXKEYTVNtmzio9WvcWuWhys7h8YjfzsckQoeEHI/Tq45bP5zohdd96+YYLyNHmIpkznoqV9gtwP
	12uTQyq5G7myeYbzclCbfFgEC3b2me71FXR3nDPMM9UhAzUQ2/TPkwfngaUXcx//9TQTxWHg=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3742101985a.3.1795693387942;
        Thu, 26 Nov 2026 03:43:07 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3742094985a.3.1795693387401;
        Thu, 26 Nov 2026 03:43:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm769058066b.25.2026.11.26.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:43:06 -0800 (PST)
Message-ID: <91e80164-620f-482d-add6-cda9cb8550c1@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:05 +0100
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-arduino-imola: name the QUP
 firmware
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
 <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b081b4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rtFBXQNc0A1WECV3onsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3pfFzkA33yHD6rKEMRlZUQguthBHI4AG
X-Proofpoint-ORIG-GUID: 3pfFzkA33yHD6rKEMRlZUQguthBHI4AG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX3cXkJbDjyjQk
 8dVn5nvzFN5otqTn8cxp2qaKBXfT0xy86wsA0BpMKVTE18JscqJpvycJuWKsBP7OLBJPKHZVhGb
 Scy9rN+GTxEUr7e0QleDLoZKl+XZBROFwIU9DhDPywVxhbwdxVL3Bo68NTjPfnUspoRv2K2HC3r
 JiHa9QAl+0+NQWtZxrYWK8LuU2zjYM0LBc5hckjf3T2cRkJ6U1YEPrlzACTIxkPhs92vUC4sqF4
 uLgzgAP7khINr9GhuNMK2KGKSAZ2/4YNQrA65XI2DemV97Va43je/80PUd4hFniq0aOCuy7agle
 qgYtSloukqrqmGPlUd9I9CHFskuwWDrKswcN/s5MYagRIykz82CFdlkJ6T5dGqcUpNmtGOV4LVw
 SBxMjEVFBWohCFz6RqICXaXtgjFDttWtbiWiuAZTdjY6Olwjaia/XrfA7cL2DZ1iQBlUbCp5CtV
 eO4Qz1p6Xbu9RNUybLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX7O/6rQfTjslS
 6V/iihpS9sbnLsWPwXQxNOL6EpH6IVHNT/pM9Ql84WtUC1jCoCDMnqNCwC69sdjyj7BRG+1/4NX
 1J4e++w37NpQ9cGdBiIEctEzqF2YQxg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> The geni-se driver loads the QUP firmware into a serial engine that the
> boot firmware has left unprogrammed, but only if the wrapper node names
> the image. Without the name such engines fail to probe:
> 
>   geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22
> 
> On the UNO Q this happens for every I2C, SPI and UART controller except
> the console when the board boots TF-A and OP-TEE instead of QTEE.
> 
> Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
> the image the stock boot chain loads from the qupfw partition. Engines
> that are already programmed are not touched.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
