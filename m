Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0EE382393
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140436; cv=none; b=u743H4ppxfqtghtXMfwbek1UZ8PGGOdI3Ygfiv72yO+MEzwAnZW9+spaIQ9e/HY/4QVzPUGsxcU7MNtlIxkfLIzdop2SUPCJJNd+iypQN27ieS8sPdEzbUfG2mEiJTdXxZy0zcTcjRaMOtZNCiy7iekUdz1JBAITPvDSW6eRCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140436; c=relaxed/simple;
	bh=K98LCzUoZJsNytcWJhH63SDrT1BZOwdfKbqvf4GcDP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfK0eDKnZo+vNHC/dcouNNlsyfJOTgGM40OKrHsqSUBeIq6s9EhRfMhvtatHD80qQn0vLbcMuwvx9uCXPZ0t4N+VTkKY+CbsWWddb6MbVOwqBgpPwa3lMRqBRfs0BpbfXMyB8axcUlUX2D1/095yDQ/F1Tq7Ncv1ck1JpXWJ5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeM88Mcp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA05f4hQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeM88Mcp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZA05f4hQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8UIp4182218
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZiTJXcKI9gfy+xIPBAxCYGGRGEwEw+YxvDYBbLvomM=; b=PeM88Mcpr/iVI+3b
	tgR1il4aY/zyD2pXVREYOZvo00PYp+6cqp1djKsK0LtKuNJVIcpDTUyMsDXOLni9
	PrQYr71skYq3jX72CDfTrapRjCZWvpNKBqAEHleUx8jnRbDZZTCOnLWoZnRN89hP
	yyfhbgNO3Qc+nU45vRzQH0GtPb6l1EE5FRB12PlZUKu0EUVQCQqdQzcOJTTFdFfV
	HGhwOt1bCNlnXImHJdQYnD26zXNe9m4cA8DGwbcoQAOQD+YTaFANhlBdhHisLSZk
	ycC4hS5xvZJpJgkORhkvmAv6xTDA7pRirvekPvghrY6SeFffql9fp94Zq+6aU9Bs
	c2M1Hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:53:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so1745371cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787140433; x=1787745233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZiTJXcKI9gfy+xIPBAxCYGGRGEwEw+YxvDYBbLvomM=;
        b=ZA05f4hQQaXLlnVIJB47QVV6A0Lk9cX5c6RkjyY61Qm/hHDcfJDau3rEWUcr9wxuNl
         jRsCctpq3s8j4lBizfste1TiVE/DGdiP4GgI+ynDodXQ6sDNojzwcEYTA2XJazRSciNi
         1SdTEwIFWV8UZMBCg9ZQ/OJRdfA6lzs1BSC8G9DAa9bpB2V+58ccEjTILD/ahVWAL2x3
         KbaoVi9V8+65zbAgzGBKiAX5Zw7ujj8gRpxGC1IJ7Fz696QBWQrDshvHWs/0BfrN031U
         GAVWq5d2RcxstqjLvGl1D3IDpCYkAX3gLoSOElMcDmajQ8+8GhuOkV+4T4j8v6S7PpB7
         zDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140433; x=1787745233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZiTJXcKI9gfy+xIPBAxCYGGRGEwEw+YxvDYBbLvomM=;
        b=CiiLg/4rjynTa9GuZ9ysJ2uEVKRjHlhJ0t7qlJdZoPRMTfnzXgoHev+ajFOAMaBq7z
         YCjEkgbGHdeYFahAX/MBuyzeqoDOXjeMVxKSjMcf2ZXACLcT67juIUYxMw3aRobYN2yg
         IFwncw4DV7fOVYu67DqbuGC0jVufCTyB4T7b7RKDOzVV1LxZdf6FvHMV9yRVZFNWa5qy
         2ZeMcPiJ8vMNcCEw9fdMzGsQ4djYWHRFkDDhXFzZrJPRVEO0pM287T5yOtasBPeBWFxr
         XPIQ1M347uuH9kK4VnTEQ/VQ3gMdreWryL5Ype2zJb0XU8c81kFXNuMmV2KtldQNAUFH
         umEw==
X-Gm-Message-State: AOJu0Yx7wxj7LmuRRScMFwNLyRNcD3GHkTJMMHK+piZGaupAjOhm88hx
	qVuS6LYLiijQ+ICopqAQTdA1nROFzGjxZ4Ce73AVyfuVt3WpqRWs0YuFJaNr2G+HYM+IsT2B5Cq
	pL8at8hKGu/A/uNZbQ/QqiZETKwQBejLCm+OhL/lstTtCuKu092ublJbFGHvh/RkaPEPY
X-Gm-Gg: AR+sD129q7Pr+/X4Vx18evQgix1uVBtew9GyovhQ5mmZl8Nd4DTVDPyR3zDzmY6C2qt
	lfn9m/m9JPQmBex8B8A9AHYLN5BsPhZHB9wpvdeqmRlrJezOaCciSVzJ3QsTU5pqL+h6YP37Ri/
	COGn7UJG1qucqzrYcVGqd/94LRv1kka15lGVwmEnS6rnRhw519U+2pb05WzVXdoykQuY899wbCu
	yWCx2HJGzDTKqs/d+ZgfvxHJ6Eve4YyGu7l0OF18t/ihDa7WhhJ5lS9LXPhwCOVi36qfpPBEW/y
	kX0BljzlTgkd+4zWO9joqI1ivGmBRmBmWDcBFKaB0NPgPRPlpZN/Ozk2PZo0HdW9CdsrI+Dakdt
	nB0moNP7IBduLGIZklAG877a2
X-Received: by 2002:a05:622a:1a82:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52dd4de3db9mr25734991cf.0.1787140433274;
        Wed, 19 Aug 2026 04:53:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52dd4de3db9mr25734771cf.0.1787140432769;
        Wed, 19 Aug 2026 04:53:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c8e4542sm63048866b.0.2026.08.19.04.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:53:51 -0700 (PDT)
Message-ID: <28bffcd1-4743-43ae-936b-9f9f92117a9e@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:53:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: llcc: Update the SCT table for IPQ5424
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L0DZT7p_1Ydu_Uyio2X16HTYbt4gx_O8
X-Proofpoint-ORIG-GUID: L0DZT7p_1Ydu_Uyio2X16HTYbt4gx_O8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MiBTYWx0ZWRfX7J5lIuhqxrMg
 B6Uwe+nIDuFi3GNfM1PALIVBzkHIf9PkIrpFTlSAgasv7W/UXIgq/Tg8kFD44tGh2KsESbr0b5G
 bcEjGvOT1iMjmOlZT2ATdZRZxCaTVEFO/BzR9+EkO3mRSpjjgl7L0lXdHorqXm9owLM0Az5zWwP
 aYD9qOFgHdNfxT69kMmH50jUOHomd6voD689hD1eCxEQCHcgsQ8kywIXxAfxktDAoS/ObEZoqzs
 1sRLVzcR8TmqzRCAObzqWcn4smTRlHoP5A3tVmCk994dY7jGyoUeULGnXroi+nF+V04EqW4w+JP
 jrnw8Yo6y2fxwaHCeMeUIgcB7KaZ82Az6g4U2YIy86aPZhTkAo30+q+4jlp3HBPXDjCYXqJGPGO
 OB6MraO07cCT/PpPzJvkP2YrWCuZHgifOwoYWKdewem+pw9bau3DC1+1PJD2Roh14wLZEsjY1i8
 P78zVa0Kd5VG9TflwVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MiBTYWx0ZWRfX22WReLqUn1dn
 1MCzluBidwwmBmtTmu8IjYswzXgHXOuHKm2yJBnWBjXpttFgLb3yflBhVOPd2n0rcdjis+Qp/DW
 YcIkk4CVLwqNG7i0xPL8zbLf140xbS8=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a859951 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IS1Qt9pk5fpaq8mrl2AA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190092

On 8/11/26 2:34 PM, Kathiravan Thirumoorthy wrote:
> Update the IPQ5424 LLCC slice configuration table to give the PPE
> and Wi-Fi datapaths dedicated slices.
> 
> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
> and way masks for these consumers.
> 
> Having the dedicated slice configuration for each of these use cases helps
> to improve the networking throughput by more than 1 Gbps.
> 
> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
> LLCC_VIDSC0 do not describe the actual users of those slices.

This reiterates the diff, but doesn't mention the actual reason for this
change (updated recommendations from the hardware team)

Konrad
