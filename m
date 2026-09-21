Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255F48F846
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990449; cv=none; b=UbDEu3ogll25iD2MrfeTzEa94dAK5q3S+Uvl2OlDSFMykAkCilYH0lCXOsZPsB9unv+TjWOLjJAZKtQszUMrfAxk1+XAvjP8UJGCp2l5cGWqN6OUDF8c0lovaE59R4eYeoj7LRCRcev+lkrK7G7v+7NyPFb9ahH0SGJCBNtuDnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990449; c=relaxed/simple;
	bh=rhyik7ozJLF/QxQjmQQs4UQBfumoUTwGzzLHwdymBb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdM6YFcNnus5Ntu610ZxW7uP5QGbsWVn99f/E+AIkfD9vv+Bq0S8Av7AXHNo1lYK+NGYdLNC3qb95RIs5+uO4oHZzfYWzqeDsbQ6zU/42Te+L4rkJbrbVRNaXLI2QzyW0Wlum4gEJJHK/dSS9QR3OxlCZIZuJOONBvdK59SwOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAXvOqag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqC5XCtg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAXvOqag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqC5XCtg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4r6b1130242
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPLVkzLU2SuROynD8TUPuOv/tuzIzLuttIBJIsnEFG8=; b=QAXvOqagnGQh68q9
	W0r+t+uE5oZTaAiX8wcbDPKrllhUEqVQ8RPgaVsHN8FBBqhCq8aelA9SPyQcg2FR
	LXLnEdDJKgMd6Q/28zslS93stIaW5MRQLXSwRCPLJGFZqZht9to3eFnV4o12txNC
	b0H1eZVOTM2hUrMlavyPVuIQkwF3D24TQXNMfgEMIWljeFkwNlNDbIB8+nH2gk7p
	VkJ61KhF4c3zBP3y+Yjuw7hi9bpDDAvlbzzWsBMNwnI81LkgTHZFrVO97CO499iM
	+p8jFBOlShdP6ITtXGtHql7IPITsj0C4iwnR+X/zOniUd4ocYMWHex2bCXH7/7YO
	zquZxw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg3ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:34:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so98395e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789990446; x=1790595246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPLVkzLU2SuROynD8TUPuOv/tuzIzLuttIBJIsnEFG8=;
        b=fqC5XCtgFQ4lDmpI27YcAuRvXIg+IANmSqNhMCOOgSqUyZ/Ng5xA1bxDJdJyO3B2Ig
         Krvk2X6jBtYyHFECI9lPu0dfS9Wy6E1GBsdoAnqPId6Lw+huAyqnCEsC7de4gl76wtKZ
         k3vnSFF1zjfZLXeLAjiGqLEVd0cqZikekorqTusCvtqVGKQBhx9IJnB6uIivIC2G9Ccl
         yZlRqalh1k7QF6irWSEEGiltFLod1BptYRK4XBWfENw7fGwsCEtrOThZsCLT5nhzqfg/
         i1l6/2Gpi+dRt6bRpCrCMVnTHOiMARKFTih90bp7UM8rBvPkvx4YUmy8PtNKNdEUhlAF
         +3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990446; x=1790595246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPLVkzLU2SuROynD8TUPuOv/tuzIzLuttIBJIsnEFG8=;
        b=mK/jHxpDqIH6m1dJSJIWQq4kaqk5HuBNl0tS0UbUbqkW7mDKnJNqe8NBzrtWYqMwDY
         R8t6D7u8qCxPCFLYquQ2cOslJYsy5ZCczMbezSNqJLpou8yOwTVkGfBvFE5OA6c4hIp/
         QDXp0OeKHmGr5QpZ06S1Y6j4qWc+xA3VF0mL3r4GsOvoKDMN3zvV8GnUB+2xB0pLTaJU
         G9KyorUcqbCt3MLSZ5cc+4R42LRJxuI8wjomDHJA0lsh3uFisHFbQDPP7XyZY3/YUyTO
         QrXRfIiamKUATwcMmZYkWZFjjQFSwHwWJuonowjTQ8X14oQAdLXNNjdBUz2YQq/TsOtp
         z3oA==
X-Forwarded-Encrypted: i=1; AKwUvBzFc0/PFaetiFXuOwdPFrHv2ItujUQRLzuy24RvlaHdSLSv5zf4U34c3E1hzyuna9Pd9O0TQI9AVhTs38jQ@vger.kernel.org
X-Gm-Message-State: AFuF++nwLjn9ctdfCyQM407lu0rBN0vmI0Iw69x0Qg/RBakHNgrC208c
	KIekV8X8RbYq/G6GOMgM76XnL+6EHU5o6KPGqGtRKrn+701JtY+sN9jGPwJ8jWiSCiwUyNH6eNI
	598Wxq/oHHiF3jtV3ynqakDeRFxvdm3bLdq9Yed12cQphEngaHQZSPEh31YrO0i6YFwVz
X-Gm-Gg: AYBFou2Rvv92JE/k81cUJEnykCkURtqBUWsIYO6PZ048UOyeMSFzvjuZoal/idktwNW
	l/T8HItfHtoxUwPBxSdDzRDfLQc3Mvr4twkJBneK+K+cVSB+q1dRT72AjgIyCNMMY9s4J99VjUo
	TW8CGHSlSQAlT78oBQHteWnZ9IAttU8DSMMkCYlfBRJ/CKqZWW9Zrf6Nxh1OY4SF1EWOPsozbxT
	dXVVH1OIFqkAHk5pcgVsM3UesLIPykykwCq0qZaK8RJhbwN4+bUB1PW+ByyLqmGmKcmIqNZ/8Qm
	KmL0Ru555p8MD0OgTF09CbR6iHkogqW85pzDPu8hYnd/CaXtSOU3Mn+8mHE7NBlgTTuLPpB9J8f
	uNr+1yCppgK4wDbxfaWtW4w==
X-Received: by 2002:a05:6122:4a03:20b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c9b5735dc3mr3751956e0c.0.1789990446438;
        Mon, 21 Sep 2026 04:34:06 -0700 (PDT)
X-Received: by 2002:a05:6122:4a03:20b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5c9b5735dc3mr3751944e0c.0.1789990446070;
        Mon, 21 Sep 2026 04:34:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dafe8csm4051196a12.13.2026.09.21.04.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:34:05 -0700 (PDT)
Message-ID: <c73b2ae0-e138-4472-8acd-b0ae3dcd742d@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:34:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: enable SCL clock stretching in standard
 mode on CCI v2
To: Hitesh Patel <hitesh@ebytelogic.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
References: <20260914132328.976902-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914132328.976902-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NiBTYWx0ZWRfXy+uy0ebAVoW9
 /lTOKsOvcbIVnb+pZ4mGZ/8oBC9p8RlHk1zMESSI/5CFt6gnvjjhrIY545r5xU3ksbarCovN6t7
 GD0juPvrcyTJCdHOU+3fhqYQefbgmBs=
X-Proofpoint-GUID: AepwhGfdoYzQIiJNrA93u70AzRHdR0OX
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1162f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ZovgdgjKAAAA:8 a=JPJhF2pIthm_ftW-UWcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NiBTYWx0ZWRfX1o6kp/NwE5ZI
 zIC1MdBfdeXkuKePlk7/4Hb7G3cBd6ZOiID/N7NFadNo/9MY0x37pNJEwnZWfgYhBYJUUognp2D
 B2TplxTYG6sk3g57+3N51L4yk3VS+8lbS/MDG2WEy3HZux6/XNiNWXLWqcCYH44amUdc893WF41
 /QHUpO2kFuwELJADjcd2kCsWGzzfbna+71zGTK97sz4xIczc9Eww/uYHpE5nUwUcg60vyqDMjak
 UGWcuA6vcIsyQwmzQw5AxRAkJw0GHVY2sz4nW80EM8TRMi2+nHt3jZfOgMnOL/KEQVH9KDXDYj3
 H2CEulnVMbDdZlcrysvFBV6KxnxBFZrNjkchPvE03zVVbJJ84Jhwd/+0mcI1r/UApRQO13TqEsu
 D7CCJ1JR+KqD7SAweV58wgL003Dof60hEl5U/EEQ3/V77tekKgFnBvqsM2MvvqLnIf4Q8zy+5y4
 G3xwYCc4yMQv2IMEybA==
X-Proofpoint-ORIG-GUID: AepwhGfdoYzQIiJNrA93u70AzRHdR0OX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210166

On 9/14/26 3:23 PM, Hitesh Patel wrote:
> The CCI v2 standard-mode (100 kHz) timing table leaves SCL clock
> stretching disabled, unlike the fast-plus table for the same block.
> A slave that holds SCL low is then not waited for: the master keeps
> its own clock timing and the transfer fails with a NACK or returns
> corrupt data.
> 
> This is hit with a camera reached through a GMSL serializer/
> deserializer I2C tunnel (MAX9296A/MAX96717 on the RB3 Gen2 vision
> mezzanine). The deserializer acknowledges the address locally, but
> forwards the transaction over the coax link and stretches SCL until
> the remote side has completed it, which takes well over one clock
> period at 100 kHz. Without stretching the register reads of the
> sensor behind the link intermittently return garbage and writes are
> dropped, which shows up as random sensor init failures.
> 
> Clock stretching is part of the I2C specification for every speed
> mode and a device that does not stretch is unaffected by enabling it,
> so enable it for standard mode as it already is for fast-plus.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 25b6e4e9e..327efa86f 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -723,7 +723,7 @@ static const struct cci_data cci_v2_data = {
>  		.thd_dat = 22,
>  		.thd_sta = 162,
>  		.tbuf = 227,
> -		.scl_stretch_en = 0,
> +		.scl_stretch_en = 1,

Would it make sense to keep it enabled unconditionally then?

Konrad
