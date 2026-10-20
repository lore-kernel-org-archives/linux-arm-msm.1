Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480289;
	b=Iofqd4F8W+2vOU0h6IkRUaHK1/Rdbe06GH2uJONxI/j53x6zaozQMmvsSwB3FKQ0bgWA
	 PCx3zY108CuE1HdD+ilgivajVBAjdkp68RwWRMpQ7WUE4nuoHTkLOn+6yAy1JpynHK0qO
	 kpHmaUSeQxme8CgJvd29RcNgZT4XQy7LFdRxOJATk6JRvNhRWIm9UFOOEgDndQvFzddk/
	 /5JOOMT9pbYB0XyKdFpVfT/6G8PtZ/9GMyFN9HLWQIT0ckRnviLBEYbHRx+sa/IvT4hBk
	 W4kN6A7HMfqIYvwlRsmoLbh2WUxkgrJovokwHveoVjkaaDfB32iJvZMXPSbG5MCkr1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
	b=vaqvOtYsE1JSHIn/xi0QqIzUA5COwzn63N2HpubVAfDpNm0C15EoorcGTiVxy5VhiTii
	 EHUiPLwa70JstpUM2JWy1scbBZh5Dncsg7h8oxXeIO1bIGNXQWECD22+d8JQZztd8JG50
	 XZmoVZzvKu5eHgYDs9WARuqcpzbw6EDpUQD8HH6i3MCztED3CROkUVvzCSgvhfESLljNK
	 95Trh53hOa6gr3COch7yzoUOQabStJrTufi7lzscfJtrSCIPoVHMjtGoEYa9dgZ0GC8gj
	 JWdARsjpZHA5ffUa6UzPmjIcXZ0s7yAdGLOQfy/mm/QBelP0H/QiW+KHGAY6zKvRH7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLerq1Xf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evDz+Z51;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90288606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90288606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLerq1Xf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evDz+Z51
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tlZo186970
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=; b=fLerq1XfWL0LqVaw
	Ktqz+9wIp9AdPxGf5kZdqOdJj6h4ARs0mg51SqZhjHHJbom0WLOIMreSGHtGmb9x
	bno2pBWyH+3b+DKnUPt3pEfX2d6kN242wgNvc2h+Cw9CPPUJHfZx2vOvxloqkJgd
	YAcsOxVknSZ10CRZwdcWCA79VO6+oIz/QeX+yxfZliso3Cu3GqyvXoGgszgLeIEI
	g12cPBYCp6T7yhfZyUKYld/yS57OHooBztGXO53qMWlkuKWUg4lc4UN4PhDisVly
	EL56zvL6g8TQQWKmDhNHwQ3z4hgX7er0sKXTUN0X8uAIpsIhmWIvb0Cvw9lMSimb
	9FfV6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsasv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:11:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so71960685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480287; x=1793085087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
        b=evDz+Z51PVZQCgJ6QR0OfOlawoPCURORf4Re5W3IAIYXIrgtdWkOe1qgbZF/8Vhe5H
         2PqPwF25Avx4/ZPmOU/yqMuFvJH4+PTa6+cuoSvQE6AOLp/7Sy9l2IkN53LfO9T9JHlh
         gqWHwxVQ1ImHLijlNVBhmPmdlt0UjGakZN4GNp5XeoKvPZkSlxz4iYDZYNT13Pwxzv1J
         7i2455Dx0xG/dVkh97ZVizQezpqDo4oZmEHhajkyyjg+b7vEA2KosnebjR6/IIEeJTNA
         IfycqoPNlx5zwFcszKDg/EvdhTLWm8GYnajF+SI9pKHqzO/vTyGfHdo8+Z8uXKYAdd2K
         9ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480287; x=1793085087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
        b=2smrnnYzlJWL+OFxWuUuvkNRiJZz0mlI4ckC59QwjbV5MiAginN4TCninH5hDaIPaY
         PlMlrf7aDqAzuQuIZvPsFeoNFjKizF4CZiUYRVcFzx6TNqwSoSBeJU0J0lNItc4MOZJ8
         YvMTCzwXkJLp5OEg+vQRUHVquvIY90udNekryXpj08N41GKCmVJg0zFAJU+PL4HyIill
         xXarrCUZmp4ngpjMG6Y00OQ1HJbwJ6vMTms7eDGtsnmwq9oP/QR5ZWwUfP1SGvtfiS5Y
         7/RSOPZQ9R1a6NssxPIAbX+0g6y8Qple9qTIceKE5SlYKWNGthP0q9hoTLvfTDs76cJW
         WkZw==
X-Gm-Message-State: AFq9FYJJoh59pgXllyAAU5iRUbyM3V0WoenAziQ9BIo6Vi+fZTQ0TUS/
	pdETf3gZXsz4ulU5qCvQLdeW0rTsPiVq7ZDn2UsMgAZkESpphnS59P4zRGeK/SFphBiSFC5CbdH
	C3heRbIAkkOgImhzyujYZ0kaNWt1tlMQs6mC2xUMySG23dHhc9UBDmttsbv8tCi1EHFj2
X-Gm-Gg: AYBFou1V1riEYF0NozGU1RqK5yUTjv6Er1kZD8IFNylcCCS3fT+pVmjf1t6EFvdeTer
	GTfNFAxHsInFp0gphjPPdVOtS7n+FzgM8ATgPLpf4HsBZJNeP6yivGvRVd0xkI6mjiR3/qG13KL
	Jrs4+ZlvEBfPOP0VZcxKNLprmoBagXzm8rvzLSjF/xgfohMiXNaYXya/XcuWMABZk7d1YiGleID
	Al41cpnhmUQpHsCxcWFqJmEru1b/PU2lX21o02/l9ofy4F/k8A2L0FyQ0pnSwJUiIrNIwTCPvBl
	LeiwBhSomsld53lVSLI80cjUmXHQP2XtPusaJmApXQspg5hms8ApC/zENLHUjukMGyihIyPCpgm
	XkM/CBwQ7u7MH+uLnkt9e6g==
X-Received: by 2002:a05:620a:c4f:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f29cf1ca8mr1876235285a.4.1792480286848;
        Tue, 20 Oct 2026 00:11:26 -0700 (PDT)
X-Received: by 2002:a05:620a:c4f:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f29cf1ca8mr1876231685a.4.1792480286369;
        Tue, 20 Oct 2026 00:11:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm448370066b.82.2026.10.20.00.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:11:25 -0700 (PDT)
Message-ID: <c694383b-7a22-4cfd-81e9-0a06ded60393@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:11:22 +0200
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
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8998: add interconnect provider
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FHGSDITixdajmT1wE34-IlcZg67be0R3
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad7141f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QbpiU1Sgz_2JnChUH38A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FHGSDITixdajmT1wE34-IlcZg67be0R3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX0CmNdZyb+leS
 RW+8f4BvYZpTDVY0RQaQh6vTBXFIap+DtPrAtXmhIflrreFbLG0YmnbOgJ/Y7Uny0uQ7EbIjYK+
 iIA4vkfgaWV3zXAyEHLIIC2NCFE9LJPcx9TcI2MICxRIdySoelKflSlOfROCKv2xaBTqQzpQfT5
 c1nF05WqWWJSVW2SgT/ts48/qZaIwM3UImpufjTo1izOO/o5srqUkRCClPZuFJ5VWmfL2+0/3Cp
 vyDUpAMyC9se4QaIdMhQMJ8iPnFEG5mheOHwn83A6wwCx7hfIi7Zw4PpYo7bemwvQ+1W9Y/vZDT
 qAjaDPCXrX/Th4lZRr+W2b/ysvXU+MUMG5kUpU4Q/WAlVIMNg7pMjv7lD1fwVjc2uUPHvj2eGs/
 AVvh6yBvXvArQzAzwS5+Kd9cOrNsjAgiEy6aC25Cal6CW9aWhzj7alXhIFcumuGBoC6TlU30YxN
 JkQG8CYMhj/iy/RRttw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX6cI8NmPtyq5X
 SMxjHkCi1W2kF3XCpBqLdu/OGPMpOcsuiJorGXgBhWWjpUuKJiehWBkZlQZaC7fSMb+qnFzNHqW
 Ye2iIQ8Lpe2SlNbFvRDD72Yzv4aKWUQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> MSM8998 has an interconnect provider driver, but the SoC device tree
> describes none of the NoC devices it binds to, so no bus bandwidth or
> NoC clock scaling is possible and every consumer that wants to vote is
> left without a provider.
> 
> Add the eight NoC nodes.  The AHB MMSS NoC shares its register space
> with the MMSS NoC and is described as its child.  The A1NoC and A2NoC
> register ranges are shrunk compared to the downstream ones, which
> overlap the SMMU and the MMSS NoC respectively.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
