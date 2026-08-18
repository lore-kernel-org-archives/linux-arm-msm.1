Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474D72D63E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053450; cv=none; b=ki9Er5yZXosKZ4R/oUXCM9TBlIlq21M1MhSqLaWTJRFqoXvVuOeVm1BEQMPLqzJhcHbuHWIlf/yRawZ52aX4AgPjz5CP+flOD46T1syl6hZUuastW1dPdwMZiCL9/RnYCtD7tg5+Y2rtQYg//kw1asRwVuPVAujjJV0PqhP5qII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053450; c=relaxed/simple;
	bh=+2pwNFiiyN0lKuCdv1OZf1UR0SWyla/bjbrwODVj6CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3fyF729oCnUwrgFO4POPu5/UhBB8CUalCBEYpnviDxt8TuiFLjjuGYZeL1KptfiYv6H/ejfGAc+NPbyOPDOVAeVLt7fWFYbMVW2MLTYDK7HbJMRTn3PvddvMOvFmi3hv1mC6SHbQHPlUan1ntRzAmfCvW0NvUnTEFQ1FSgVFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5NWV9io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NV+tQaJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5NWV9io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NV+tQaJd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABFnh514924
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXd5j6SL2Xi/34Tfz1UjGNeCoI3Dt3uZsl+9ugBQmTU=; b=a5NWV9ioIHbw/nHJ
	6hix+YnVLwr/VsTkYJYrMpjm4rBA+pqAAqkRCMxSffb0TcaJCtS996Z+nIEs9Vj2
	7boszWp+z9xNRiiPoQtvPsT65CzId91s/Ua2ULs9I7ZtsjjWxiZVVAwdwU877XHs
	08fGzZ+2APfc75WcosttQPkTE8Xp+wMAwcZ6hVbwposnhMl69MjfUQHernk1TY5t
	xXFDsdxYmq5Je68YDoQxRiweht80WpROAVyH/j5isBw5KNTpcqXcE4y6WvajMGTG
	jF/p58B+M4SER1MYoaBN9qJ+l06JypnDbMaeGCny1H/wL7h31feVy2tEh5rR4ask
	0zmhQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2j9u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:44:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d57d17d6cso6296461cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053447; x=1787658247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXd5j6SL2Xi/34Tfz1UjGNeCoI3Dt3uZsl+9ugBQmTU=;
        b=NV+tQaJdYpNvzAh5iG/GDNBPlJOkFqGrHhViFb3Zhbt+tk47u7E7X+sOn9vw8nFRx2
         8jQ3gHsYtDWbsyyWJUWPG+Ib/3Y1a7iYgw2FxR7zwBKel3NiQx+rnYDNDdWWl86kDwkG
         rzfyKxv/U2EdXOp0h48VafCIgubxSrn8eJFv7t1ZhZx6SOSyS51Z7qYv8LAFpJVKWYb/
         SQmbRIdqj1Yuz2Gyt4F0EPAn3fz67B+Wl+Lq3FEQxYg9mUhVnJ7UJ0jh50GVRNFBPKvu
         9JpqY5FJWw52loWLLDlAFAgwzgmtE/vXYPrchoNWl7+hxLqpxv634vUYiEOFDMKV6u1A
         E35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053447; x=1787658247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXd5j6SL2Xi/34Tfz1UjGNeCoI3Dt3uZsl+9ugBQmTU=;
        b=Kw4oA/vpT8AqVNCAZKpk2+Rtc9meLYdfpAT8D489Kt78QE+ZUVbhnbrTTc1r0bCuMb
         811uy22Agrowpr8OcnjF1OJoCKCMPj5/sXfsp0gLM82bbuQq/cNA4OqQdZPMT50t1cOI
         0IRgv72DIbWP1w0Fe+XMHXBNqBSaT0vJSK2rRblg2vSB0rs+/68rK1NSse6ZbxnDozKL
         XB2RrC2LtSIaCtGm2wGxWrehWWbzLSCrycK6N8btueoOaXm6hQhqW/58TwvS1xRlDNKo
         nEG6LduIshWObZOfDyfzM7gF4QUtbFn0cPOhPOWdqYchiZNqvWXG6ymqZRec/+p50HwT
         aUSA==
X-Gm-Message-State: AOJu0Yx0duieQI5kFf4vPEKXugZL4pcjsxXbrh7FEziTbuMOep3SNPsa
	7ff1ivmJKP17XRmBMylvW3pX/SEg/JFfp5KJ2s2Ri6jXTl+fRbS3i5EA+PoCeKRDuiL/l7FdLP3
	HX87YSzs+2zMvNe9ItHOp+u5ZNyZkoz+sy49rd6GDrUZ0XbJuSIfmclVCQYua0XL0oqpw
X-Gm-Gg: AR+sD13LWQh6YtZ/dAzcIqUgPt90GJr/QjT4frPLmfKsPs0PwXXJa+KdZPn8jb/bISU
	3xitXLXiFpwhahWLYfYd6Zda29QvSCmImZwMVnYk/DgmemqzbiPLpkFU13CwqwlYE6cCOuwcUsQ
	teqDB7zfgeyKB9i2lOTi2CJcmU3K+XGkPra132pzTvSm62pAms67aFsdbi2BlSNTdRlUhHNWjIP
	RGBNOM01jttfeuLMGXabfulVMr/Av6aUka+OShZu+KsHcMuJywX4GY/WRRzsQ+CUPTUumKbMMJ+
	Weq4PnAL4uygAdVFSgJpNQMEhuGRvj0GE/zO4oY74j5LfloKI+eWH6v3pGvOks7t/HPZuOWAaa/
	LzxqqMhjHETJ20P/yxobG5mdr
X-Received: by 2002:ac8:59cc:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52d85478387mr245384931cf.3.1787053447411;
        Tue, 18 Aug 2026 04:44:07 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52d85478387mr245384631cf.3.1787053446947;
        Tue, 18 Aug 2026 04:44:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm118450766b.41.2026.08.18.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:44:06 -0700 (PDT)
Message-ID: <44c59c12-56f6-4526-81b5-11ae8734cc2e@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:44:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI
 frequency to 17MHz
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NiBTYWx0ZWRfXygxVnYJC3Tvu
 +hjH2PdgeQ8M4RfFFa/X+vbeaEBinWq4isbnd9ELuvtnPSToHF3kJrBZek8w40hYg1MSpYAcazC
 0MN27Zm8IfwseZnk873z2Ndkh02NDxsFPSjDv0xXSIO5+/p4LF+Xo+9I89p/xlz0DwdsCx1eUt6
 qTt1l0pLJZEBxInecWQXYEF+ffz3MzzNHwrniKqNcr5vuyfvXoYczzbdqSU+yLvK7FcZ/NHNaYd
 Be9/JihhQKzmkxg+orwG5ocAUsHdcfe3lj11BPbb4oYZEmAp0pFyuxGMFUQnJ6cYOqsahn2LznB
 pHPoccmGDFq0APyAplLTpSmms4QpBUWULcg9V1ljorWHXF9p53aIhSXdgFeaUVv9oRbJGImEUEC
 O6tYNYsjUivgEq58dIwD7oHwSDUyy1tSvZckCinVoXlOMDkdEvOvgbPnknd+jZKX9fkwPqgeqIj
 rsIkazUcNPgXTzSLeTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NiBTYWx0ZWRfX18aOmFDm5YS1
 dR6qi/17NaJYSC/olUG6QEFSRWhr2cwti2dop8ZOaqfau16GaHzObCOJVoO1ANV3SwUsL3uNMAu
 QbvJRCVLcj0ePPl8CKZwLI743stiqh0=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a844588 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Lp0PEPXvkPng5LqQ0PsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kk1IJcd-y_0NAYxNc6lsv1YvLeEeUa6X
X-Proofpoint-GUID: kk1IJcd-y_0NAYxNc6lsv1YvLeEeUa6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180086

On 8/10/26 8:30 PM, Viken Dadhaniya wrote:
> The MCP2518FD CAN controller is limited to 14MHz because higher SPI
> frequencies are unreliable with the current SPI3 pin drive strength.
> 
> Set the SPI3 data, clock and chip-select lines to 8mA drive strength and
> raise spi-max-frequency to 17MHz, the maximum allowed by the MCP2518FD
> errata:
> 
>   0.85 * Fosc / 2 = 0.85 * 40MHz / 2 = 17MHz
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
