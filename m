Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364733;
	b=t9hNdLHN/iJHyOqBY+XCg7WuOdYr8mZPmS6mBFMer2zFpwy7ibEANX6Kire+RQpnMq4B
	 K4nK4f184370Tpav7lOe5U1KvtO4pSF4NYHip4j9c13voEBjOXWxyYDMXmxs8M7sfqaxK
	 rVT0mfUN+WVGlO9GeVKghtE571+mWe0w5V5KsaWwfRL/SmSgUcBxWts5WT5KQZX79GKIj
	 syr8YoiXg+MYgPIC8JF9nJd+CXyEBAH5zMITNLDIs+dd14RIG6suSsdVqClPwBSjDEnBh
	 aYYgt7Xwkhq48ETBVEET8ccWHNw/HYxHzZLJUd7Sp7tse6qECBYIeazEQSWMPozkSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
	b=HmFQae80KtD2MGNfHPh+STuTlNozT6q9hwAAh8K58UO2G9SAtsKx7lyABik5YTXwaQ8S
	 upMVHx+G7Z8xkZb6KSeYLlh2ErT+QAz/+svV28BN4k6z0UJgtKEv1PyDg3TvWhenlJzeV
	 3nT3FrBUOAvwrRwOGBE9qz0uDVF5oLCUUwq30y9TmZrYMDxDBeTley98x1rjqF8lntPLJ
	 bTpgI0j+untuas78OGZb2Wb30JVpaCuvVMLF+Pm54zctaWc/WJVTs132cO0Vv8ZRSCC3d
	 ia/Xr2zBPa7j/VppEa/r11o67zfwN8Erzj/MdZ73CkWcU8HTBNFc8Ka/jRQQ8o3FYvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWUR43P1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jK1qQoJo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB61606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB61606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWUR43P1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jK1qQoJo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGGNx1527604
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=; b=lWUR43P1ZeIlVjK2
	ZmSo7UQW3RomfjXI+1t4RPr9mK+JvIKxVWkWa/OvIh8QCTchqU8Y7n8RxWIm0IXK
	cB0pH7uY/40livhE6OmRU15rWnO3xpa8fiYrJ/OCz+AgExMMpN9FyRGgWVvQdqJk
	+sX9Vv6Ju6iDz51mzXc2LGx5xCBL/FrWlsx01+n3BurSVU40cT99Ss5659ydJT/v
	tHX3I3XEsPhOcTeHmNoOWw+0T9Tql+EiWkXxxxh5spClLxlbBILggddVpRQO5uvX
	KfIQs4iEexSsVYwVomPzDd13dLYPWPkm0gFB9gvoRPYSNnlujKemx5OdQmRVE7/O
	Yj73JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pk3bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943fffbc5dbso13258785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364732; x=1793969532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
        b=jK1qQoJoGmhSPr7c0rryh4H7HcbxMoqd9c0zuQFuHxCb5jgxNdPX9OhplAJ7Zl2T6B
         2492vE395wR+VXFGY8gCE/6hDzYDe5DDwQo0mSAjI8hoquOA0qiWgQS0hKZoNVTbUbDv
         jTIxHNXIc4R7Oa8LLkpd/PH0Cb0MR8XHkq0eYKQIfFd3bD3QaC//0ljM6IwJMkaEulcE
         ETOuMmh0bt8934L+7Gx8eAJLp+MKmo6D6EfyjJOipbVskLdU33kSBxUuPdE/paOa9B3J
         oTpNoxRsfk3NAv/zfP54/Gh2oHDpEdrc/LIXk8HgHZD12U9i+9MnZG92N4yPbthSBWhy
         41qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364732; x=1793969532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
        b=c6N6kiluqsqG/NbS9V+lwL+yTDktIssfSFidGbtySwarqQlzx7FlkAObKLw4gKl5KK
         hg/ZXcQaUdnVVzWAHput0+4w/wwqVw5NgVTCYdpDUjhuiySNnan8SWiJyznayvJ4TTWp
         J+bnpoDi6ge7armt6esLJ17MxPQrhCOnxa7/qECYaoOrcZfKpv7MOBUwC+iF2Cqgz34q
         8mmA6434++Z51CMlW0dE4FIydYlCjjKXtQL4VoY58nRmoUYZ0w+qDHyBCftd9WlQmBMY
         hxb4yc4EnkiqQ/+o0S5DBNJtTM0NmcFKY207ntuFipaXzazw7wPW39BlgoX9+/2JU7WB
         nyqg==
X-Gm-Message-State: AFq9FYJNfI5XCgT7xS2dLqSu9jFuDpVwWrHMxpFa9KBvEJBei9NsKLpY
	7IkdLqkODUZln2/bIbPo+Y+vzWqUj9qThlAdlxIHP8wVBvB13E/rwCc+geeyQirnMRkv0SKmZEy
	MfnuncBwghrucsUVS7pcoCBlOF4+pAwCPZlmUhhoWaNrtzcKb59ZMZPR8P/qi+DTH2yfU
X-Gm-Gg: AYBFou1smMUZPODPQfC1okV8P7Ff/hKX46f8XXqCWzGE/rujUbg0rIcUTqJRtfKlvw1
	adCNc6Xf3gxcp9dozUJsg+55AoXc2lcdo1cyJucKTOSJjNo6QDdaMsWN/3CQF2XfrMRefIHpz2h
	FyyKRuMGKA4QX+C40uCi8NsWNfXIDUz1S19SsAoFTUQS4UWwbispQQS5MUWyhKKMj8uBK4tmYow
	JcgdyagupMoQGp3Wxw67CTnpmBNLEFjSvr5s3NImCUppvxKUp8z6cNfFZXyuAh3EbcM+YyFhh90
	tUdBl+uvkA5N0ju/Q1upyGT4lZy3mfaIURoRC25/XakNc+yzd4nyDzCDqESBBenqfGfpwZUW+bT
	bGWdBFIMoepWlB75GP2QOnwrCBmOUFH0B4AblfreUYVBvCjMVxYEmtMF/Bnu2cCeaW7dzrV4=
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr372728785a.1.1793364731263;
        Fri, 30 Oct 2026 05:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr372725785a.1.1793364730769;
        Fri, 30 Oct 2026 05:52:10 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc05sm62773966b.24.2026.10.30.05.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:52:09 -0700 (PDT)
Message-ID: <466f2126-4890-49f2-9e6e-679a4199f324@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:52:07 +0100
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 panel
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9HZyc6qr1tS2
 RzksD+ajmnJSeUGo7LKyaeOe56WsJQrpdZUGLazhxUJBcn+BLChwX2t0L3rS+l+zZLczRzwFN9i
 QElq0dIMSLIq4TTGgA5ecgxS1KrKFl5OfyTrSKWS6bxI7FcSwnV2bWdsxowgKI+MqTfiUghDlkF
 AyrxwUbc0jE/dCWEa/18cN+Y56j9tv257HYcIOvHhshDv++0RSATSq48bVXwnuKo87bojXTgRFl
 mMnF8AGD5j98TFW9Gej5GTMindBln+pKgQCEpG8VTraZPLZVwK1A5bd936aXlWzOJQ4LhMzruvl
 wrg4caUng4TIx3DBvD/cQ1d/p2qw6LxrdWTlmxonv2XL4WCNyERv3Vi5UkyQEbKgr0i0G19C6KM
 XcGgitHm+O9g/7O2M6Jr5E5SlCtFy9r/qfoJK4nV0BRrTWaKhDEys5QzoToHgDng+Kw6gRDO0Ez
 UR+AlSuz+7p3GBcNGlQ==
X-Proofpoint-ORIG-GUID: -QxR-y5H_DbeVwpcaV2T4I1_p9bfqwB0
X-Proofpoint-GUID: -QxR-y5H_DbeVwpcaV2T4I1_p9bfqwB0
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae492fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q4YwZ6-Wyup7NEOylQYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXyJ0p2s3K3hfk
 MdrF3mC1MlInlCRJ3UnYL+Lsi4UJU7mx69MddfF0OBHKhMdJBfrmmNI30MUZZObA3QTQNoWgaMF
 Ldi1ahKiDTnMx0MzdER3kQDQWDTN1g0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 11:34 PM, Alexander Koskovich wrote:
> Configure and enable the node for the BOE BF068MWM-TD0 display panel on
> the Nothing Phone (3a).
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
