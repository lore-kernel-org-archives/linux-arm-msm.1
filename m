Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5533F58C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326384; cv=none; b=PVKlmddVsKf7/wCZIv+p0tJ6k+dDDtLLGcppxvVGvBLHuTY4i+JwB+KnEUVvAv3Sz+1v4Nw5wl1ccQLoDRO2lGZ1IBQwoJgKVWKkQNVtY5kJywKMIMOhh9DFbgjMWYMGiRu16GdXHdqSj/4g6xjSGpncR1PgkKqZTKZUGEnBI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326384; c=relaxed/simple;
	bh=1cTTBQ3qWhJxNM1sV4sUI0cqeKNL3UuiEjSneSIzNU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa6yw4DARFDniGLFUxNhweHF2FUnAYTHGbO6OdPbRPNzUdV7AW0Uj28BI0dtKKoBSssCW4RqJ3eA//gIzhZzT7OP13n3tiTXZ8qad/IHahquZp9iHmFDu0js3KouCB3qzAKI4OFOWFyRXmP/B7A3ug3G8xWUoCQC+g/ylmGn9mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVwkjl2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eo3KJ1jH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVwkjl2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eo3KJ1jH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641S613615440
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj11zQeX+e/pg0HlyRM5ASymmrHqeGIypaNCd6BtBz8=; b=VVwkjl2bCCf2PjlB
	KBDt/Q8L5k5nurZ+bQjgxktoS+jZVgf7wdi4PDZzArjBBF3l3wg5CGO5b28IxEBT
	3tgBPEIFV9vrICZniKuF2O93061xqbTqI8z1HsCC/5XTFMcFKdE8ngNGBfVqMoah
	Sruz9RQjReDhyCY7WGUFN34tMd+UeGYjyN8f323Do2RqAF7V/PT0GQfO5fvqIJWy
	otPqoVUFUElLwB334/Lq/ZbQh6qpAjjNDuWg66R8/lRHplGTcNzvVm5O1XzlZGB2
	TvafTdlu8AdbjPoQ4jfNalqlobSiz8Ki9E1Gr1GJI9NDa6qvXPaD0baW21I0tei0
	VsLFYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3d8w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:26:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c08e9c344so12268571cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326372; x=1783931172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fj11zQeX+e/pg0HlyRM5ASymmrHqeGIypaNCd6BtBz8=;
        b=eo3KJ1jHscQ/LWxajTlDFe2iV21oZM+LWrf3DnNezHj+uaQUPq7/RC+Kq/RMHWBEX1
         S2JJQVWzENyf3E+wHp5P/rQ7qYmIGD3XSLWGNpyjJsU5TNhei4apwEPjenTFi/4tp6h3
         9P2JAWLsgTNmfHUTI1l2B/zoL8lJty77ZPutLvfIsLvPkhHJgI2lt8l1zOEUAzXtdP1T
         Sntwq9Ztiiwc3FNLZmqcESuPd+22SiFxGuYJLvg7gkvZrlvX6tGD9yQtF9VwzlTPiWTf
         Wc9PYU+EZ/SYunetZEpZkJB5pg5wVBftPFSju7HdTHUw5PC7l+FGWsfZi+4NmF++kUXu
         t/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326372; x=1783931172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj11zQeX+e/pg0HlyRM5ASymmrHqeGIypaNCd6BtBz8=;
        b=iOHyXE+TcGd3RhVnlAcKs+vfc7WrZCyYe3CLe2jriDhSTXE/ITRVEFvtGTMcECFxc+
         70UGYlL1x3arRsZYnqWXuCpeE4u0CIv3obmARknYQ0e/MGwtp5GzuISnhYw1wTPN8VWi
         BLGPSSCb+2J6RU5z4lVFn753NsIB93g95aDFiW2HDAENTDSLXGS+0oxXM10N4YrGO67P
         bFY61FDU2htO/r6hCZ+dGki/+e7GBF7T4gSl7adXsYgS5IFcCAX8Gjg3dj8FSsmQdy0J
         5Pv0lMcbvtmUzhwJNrw/1n3a3jU4X/H3+0ADNQ30/C9HL+bSDiBFGk0QbgFi4agp0god
         qEEQ==
X-Gm-Message-State: AOJu0YxSCykSQlXDdlx5XiCpQHEvn+rBhxaqOhLYOGk7Zw139HY+/Jc4
	At8IQk66twPrbsEFJeANbaEqIMToeG41HnYa1rV3FoG+yWk3vu5PXBttO5njkXYJpfTcPG1TmG1
	yydtkaHrpEQzigpQnv2XI4nufr/lwv/wBVqnopvOvGRl7N4m9wB8Uti1r9glEzkgtaJS3
X-Gm-Gg: AfdE7cnNmNr0nYn9/YG7AY1ijTWu9SD2HYu9bC2po4+9sF7ZPUC1noAK0tLiue1UGe+
	kokjAbAwJL4rReptoSS3DBHXtbrt1EhKFJ8EteyB83OQmp+4cyRJn+WvSKgamAd6YZ5pWDbE2LU
	+IkSpPzMt2NLrcT//fi8UXsL3dO8K8WXCw4Jxq5e4O96OmOazprPNOUkBuU01kIN6ePLoHzsA4N
	8RBSrYbnRWdf+I+a/OGFnt0uspPDeNLe271qEg57hpPcK+rTUau3bpYuudj/OE0l3zNAfnlUrLU
	YAfpUYOStsHeLs11gCmjvGAlnnbbSZIvJopI55QdvfbFLk7BT/ZfpXJ0X/jwZJsiVn/dbddtmqg
	bAgU78zpW0UhqKnZM3Jo6H4EA73gJf6brgkg=
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr84424201cf.5.1783326372441;
        Mon, 06 Jul 2026 01:26:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr84424051cf.5.1783326371901;
        Mon, 06 Jul 2026 01:26:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f54c8sm691379766b.55.2026.07.06.01.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:26:10 -0700 (PDT)
Message-ID: <0d90e8d0-1ca8-4070-a8b2-a889c046ecdc@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:26:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Correct whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-4-16ce82a2bcfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-4-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX6faY/oIZzkV2
 cBPGbKCacqROW6J4RsxC8VvHByDtTpiLqGW3gCwHbRBspWgpGLGpA0+JQK7wPWUxgnU5UNNR+jr
 QsHu8MIxeQv//hqMZFnJl3ZAZfcf2Zc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX+8QU41DC5PUj
 HKl8qsXQu+MblBbPIqzXdB1AB2yj+t3Tf1/HL7aMgVMenPci3dhqrJa6+DxnTtgNlfwvwwm6hsd
 Jr4CwswazABBb5CsmI+OyaoWUX1oI0zmn0sCF9fafF/dSrsuHaiRdz2I2SuO36G9RDHkdXAki5g
 9Jevo3k1VBcgRIIuDZoR2BeZLMBoaSuTm4pTZFHs2Kyoi0L1OMLkXACPQmJuFxfMrycTnQHJ9DR
 sM5Ve4nLDGKu9lg27kj6LaSnpnN4ILmSoyRBqe7Cl5SDGgALMUg278fqzAka3fAABZktYFOOEWg
 wnX5aROmnUQDXEr4WkLfIPTuZyC1bsHPPSj827PwgN/g/U+aza25SnzhKgCP+qyQkShjiOWQrsh
 V0b1nUmuyPsCZ7PCYdwA0U9MvGVco4CfjK88PcJszQNOdKji2+iwvuWnLxVTtOiqouvbgxrGdez
 Bi9cpvkEgAY0X75vlBQ==
X-Proofpoint-GUID: 4PKu4AJnVbAkN41SNqSp9mfzNQlpRinS
X-Proofpoint-ORIG-GUID: 4PKu4AJnVbAkN41SNqSp9mfzNQlpRinS
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b66a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NeRUaqBbCO0IiGDskO8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

On 7/6/26 9:03 AM, Krzysztof Kozlowski wrote:
> Coding convention asks that equal character '=' in property assignment
> is preceded and followed by a space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
