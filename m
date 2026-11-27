Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777696;
	b=1ZFPHACzqCJJ1Y9iIPWKtbF+Z2VvAeedJ9VAiW3Dhw4dAGCKivk3PfuupDqKx0PyMjHA
	 oXEsQGxOLAJdlkprZM8TTFppz2kfbfBrVH1GbyRdXarIxeIbSp/LpfthvtJrp3ys1HxEG
	 ME1CC+m7aiBIXdq4U3QTnJHbvZiiDeMP1lZKy+yg7R5AwRuSm+sRy3B0Rt+Tb7wCGqBhV
	 UD3+fP3lmWwpZM/NWl6jZ8mJv9VPSOt2nEQZlPQ3gc1Qs5xIf7VN1JDiFobb/mm5aAkOt
	 RzWOpnSrYFUv6szVs0Trby2CszWU/7R1IR1oavSgoDURq/GK7CUTClk91pEgwAvdqgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=;
	b=b+asMXZwK8xpcL9cwcjpKipGfQQxvirOf1HBON5hslEHObwL0tmZPC1yXRFr7T82m4qG
	 Q/RHStq6FRypuFfKoKPQ0Lz6m/QxCfowua1+IbBVJtlvABXZMBuu6iJMEeooVBsSh8ZRV
	 XtmBTv+hCluW19aDOL1QRfZkbkfhhkJarSmHBQyDwZlYxbZvYOrZgvjza8a3pEqe/sQTY
	 jMh7QeYTjPJDUfKET3pTzeEgkZVi90d0cK7oQXMTpNVL/eu6QP7TgQtF8gac0ZHxo6lDV
	 R4ULt212B7YKYEs7oxcG5FcViw8ysAlvDANNoGoWZjnV2D6+m35R8voN6X0hKT8OcMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mk/NcUkn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Re2JXt87;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D83606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D83606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mk/NcUkn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Re2JXt87
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApPHi1560707
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=; b=Mk/NcUknFvbAJciL
	KVFNmC/Sl9MXhBr3LJIDQahz1Iu386KoV8sgMhHA5KCReAgsWCAbUwdtWuStcuAU
	joCUFw6ejUyDz64zjMbtIUSOCSG1nneRZmKL9jEM48XOUFu1OCS9WugRU/BpOqda
	6NZr2OnVzJXBpvYqKvTBWyAi40cED5Ffgm4CD5SNnALivZc9dcF/xLAL1gKsPFEz
	L5TOHoYw7BKhresTCxqo+Dz3MD34c2FnVXxXy4pQi9+bI52Yc229D75c75YFL7uO
	bYzkTugdgh3kHyIxrY2cm6gnGboFIkGqZB2riylCLNOg6ftRNlJebdQ9gwTdBH1u
	T+Lc+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55tnf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:08:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c41fc3cso21790161cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795777694; x=1796382494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=;
        b=Re2JXt87T04yN5fFPGcM70S8bRHw4L6eJNEEtbQ7Zf6J+N+i/baeIppkH0tUQZx2T1
         qmgwf93pC6Cqp0Ogw5T7hRiDDYIUSsZyZaSJYk1TOJPGusVNTyqI4CK0hOgvAalvjFW1
         ttHlT5yiBWwuhzyRBsa+OVRAQneb9OgNVO5axkG5XrIDatssHhMl4i0moa4tXah7Z6bi
         ZCp1/C4x+V5nv0IQ8H5oSaMnQMmUakGk5re2HtS65xQHo8OgWqHg1WVx0vOc4I4OaXYd
         BNF5ASesCeysbtzX9GvS8PSYT+jPAxQZBNtfw14uz/ma46XmkBFzVkf1BHAHbaX/Lg0O
         3SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777694; x=1796382494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2/83h8lh00oTjIIn4PMP2G9iHMfmfKr4RseRlVPFLc=;
        b=KbwswSRipjDnOn6wEW5O5i+FsszK5BzwYRGPMBgoby6hfWiJLoVINTVRUZrgBXQWVu
         Mq7xmWkW0pmo5YnxHsfGHTSBXNO1G9KmgRiZg1yh5JYYnOGzwx3Bm/3sDKSaz5JND1R4
         2VwxFKTc2f7Q0eraZw2q2Uy779dMF77WtubjtNYCPc7bEvj50b0EmWq7Icso9kiItv8H
         ES8DZ2NnVyVd+8SvGDHCiPrnVmFsdF6+WO3eVKUdRXTBSZYG0mgLL+zU/K+SOGt+DvNB
         DssaRVHlO69pn0lFo+M08splaHq2yK/wkPtRRGw5ojsZk7ZDrGo/CMv8FJwa1au1FSct
         MTvg==
X-Gm-Message-State: APuU4Z87MuUx2ll46Zj2hADvgtw0/7imD+w/3drMESuW8RjwiFj2ZFyT
	oqrv6o61QJ2eBIbHfuPzJwOHw/nukC/g333JC8SaP1JN9ELGMk2yK0Sr4+KAOLEZGuOaTDSiNM9
	pMpQPA90okmePJjGv7dFzs/ygm78Bqxb/+Bbbid0ZsphD2Z25Yer8x/Sz7Nj7LxoJCeIn
X-Gm-Gg: AZFdTZdohRAoXPX2rbDzMmL0CxpEXWrcZ4YJKKREdQGZoG0Oq09o6CZe7r+yV2c1Yvq
	Uk/Ld+DRx8ayocnKQOz7jzGsT6zDDsl76y1pLB7qsuH5CqrlMgY1/oZS5KkYrCz7cSVHVc3PKnI
	UrjyHYjYiJGk9H8XJiZp/HwIZQjlljZgTCZOmbChT/p3RwmyzRleQvarQgG2zeCyG5dns7RGYDt
	GxYsNL53B6y6Y3kaG0PB7RR22d+e6mQoqiNJZzAiOVYOOuJk+5a6RBOc6E2gGXYVriJa7ZxXF5u
	n++ae/2TEWuVzwlwbE9dGy4pr78nYZrJQOoWA2Zzbba1RdLG96EL7AjJLRHB6q8LYi+aB7Yvbzy
	W05g9HIzY6hcu1J67PtLwgUoht8wHZWqcsphHG1RvX2ALa1VIW/EnJssFplfb6w6/iC1YAPg=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3948533085a.3.1795777694364;
        Fri, 27 Nov 2026 03:08:14 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3948530485a.3.1795777693840;
        Fri, 27 Nov 2026 03:08:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm849897666b.67.2026.11.27.03.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:08:13 -0800 (PST)
Message-ID: <1559dc51-b31c-48b2-8517-870b22cf81b9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:08:11 +0100
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650-valve-deckard: set BOB2 as
 always-on
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
 <20261125-topic-sm8650-deckard-tcpm-v1-2-4af33e89ea9e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-2-4af33e89ea9e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX+wKdmpzidZrL
 YxWfzt+alAaph9CV5pJiHHCwS3KdfnjD9G11QRgXuXZC0mYK4JgWz6gYDBYFMPxNTSShsMMBXs1
 f4OSDM/h7MyDs7dGl7TazzdpsUu7+Uc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX44FU2/0WRAYZ
 AmQdo29DdhKrBhGjxGR7Gl9DqbHdE1yi6OWNPZ7aQ38BrzOOzKdvyIrayLNV/gVimCYzlLlKqfG
 oB1b2a1FMgeUeFVN2nh3/MJb7tjsm+3utZnobsp5ajpRBuyeOnY12xGw1cZXo1b2quuVbhScUM6
 IqXYSwNajkugZCjxe5UemtcjGPnPPijk/2QBgqPXo6eGJmf9XWyT66wsSS4BEzu5ynWaPfnW+jw
 JQZJae5rQvwtR5qk/vIOInJ6VgQwlOv22C0IU6AGggAU0wkQirC7XHFNHAfmP9dp6C07U0d2uwm
 ujQdBmC2FTfxGHEURgj2Dq/Pst/RYMBsws7xVPv6GUQRHJMK46+Gfz7ISGmaIJkyQa/ldlxS7TO
 cT6vUhrtkw51Tga5tgAUQJHZzVqKfj1jVgo7nJ2CoyqM2cDKkvCl7T6UtP56DVf0CSj0XiovtsZ
 zdlgw7WTgcIWUm6Tz9Q==
X-Proofpoint-ORIG-GUID: JLGocP6DDOYd0bwLX-gGrvgYeJjLmNYQ
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09649f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=56Lg4We7l9Odd2N01V4A:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JLGocP6DDOYd0bwLX-gGrvgYeJjLmNYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270044

On 11/25/26 12:54 PM, Neil Armstrong wrote:
> The BOB2 regulator powers some always-on USB components, keep
> it always-on and expect it to be enabled on boot.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
