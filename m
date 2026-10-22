Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659521;
	b=ZWEn+ARqnKtK12J/2UYtG/Ew5cT2P+c+Qxhl7x3isSh4OvdP52fv049A5dBavpSipu9e
	 /xJIIxbFw7XlU1kDotjbnqiakVi/XMQMhlLB7kVKglQKbgvuNG/SVSOOXImNLeqoYlEV5
	 GpRAjY6Ucv0X+4L4Aje38IkuT4TuyeeO8bKjiEPNER8V9OBO7kc+QSIuWyvMZ1y769i6i
	 EQm0Y6KjidpMl5YyeTJjXea8vIAH40kWURNMDMA8R5w8vRpnrEQQenlqt2H7AtC3Gvymn
	 YhHihmrw8OabDPpMDZvKSP+8z2Wk84c+Ku52xf+pa+/jtereBVgSY2siHEmsQPE7zdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
	b=OZMtNalBIWUsK++2JeDvGacx6XLpTUm3CtICS8ooEWTJrD8c/FJKm0Yj+uKBP/ZRspIc
	 l19EEoSKSpicG1iMTuSdX9mobT1ZtxTZliCJ8MxFKL7YdRaBVQz8s7SyGW3Lq4BcYqwnW
	 alIFWhvNEqYYw8xOXlYiLBvtvpyCIBpamQgJGZht+6sziLEBLKCHMTscmtMu134OoeIJ0
	 s+1s0AcFfE2WcgvRyNn/P7vNUQ901SMskbAbIWR/FAOU6PjJ7jpTaK760C96uLOFIP3Da
	 mIAb21veDuOo55Cp8M+7Q2QRZgyHnS+S2221PkPUIPRBqY1DRq0h7FIspYbWBcq+JkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4OfLAR0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnh87nLP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78323606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78323606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4OfLAR0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnh87nLP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Fjl2516224
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=; b=e4OfLAR0dHMk5Y7m
	9vy3FmunungJ3vq/maAunsEkz1mlHYpsZ04UCZp0PnPEzRsYZJ2jKlpVn9SC7rm2
	FHd311KK6+gmuF1d5+Kv7t11ZYq4wFcB61uD4D9YqyGRzyAwDupJbbmHtaPy5Zm2
	6H/n3g0fcT6E2T1QFLyk4tjLy1BGfK3hqPpl7rhdewM9JIjyb01dH37I4JmYVsG2
	Y38DhuRCnKLu3eak1Nv90+Y4Al/kvpSVHGHPN1ZSD5oARl7Ftr32jrgwA3PYn0YN
	8X5/Yq2zguHH35spgXhxxZJ64YNV4exxNUuj3X60ZuetgHLnWWD72xmTF1EdZkOp
	cb16eQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9k0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:58:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso28699485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659519; x=1793264319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
        b=jnh87nLPjAwofu9zX9OE3+i6nCcEQwlylDaq9IlriJwBfGDNvDBD054oR4uGe2XW6g
         3btP2BjCOZwqgWFTi2STOrUzcfS0EO2Uy/5aIRku6EdYVSIzVuOP37Q5icfeAR1n+8L2
         r18VsYzKqEfv+asc5Btbjl51ZikA/OTNY5SxgJsplmWi+8SW0Rop57AWSCMY7oeg1mBI
         ngjOZ/LnZ0VaZxAqCe7+ti3t/DYOGH15DvLwxCkQiMrUQc45V+eijDUQFmmsnwAJ02uf
         w8K1HkORyAwPi2BCBxVGDD8gDN6ChR3ZoSENk3t8BEzs0unNvutTGLBeBiiRDWNqsd6q
         Oowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659519; x=1793264319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
        b=i+FQg5SOX5wRol2M40DClcgBTx4d0X5uTC+g3SY/AtY0LFuJNkYuBrZAtQIxiGyQWW
         qT/rNj3QBgSiYLYBYhtbT4k5nTaKvuzNpAlHMeRyLTxdqFJ/0lxupFramzCplQq38P25
         rIoYFmUdCyP2NArFhsTjhHupBQyICnIoTFljyYSDMDF7/QRTJ/n2mA8OuJo4482WbRBV
         +LzmnGBSNsN9mR7PiCK0NVYyQgXFM+oC97+9BoOqLkwJkeOOv+Syj17SQheR8gi/9xA/
         erHH8c3ip4WQxiUufW4cKyePhf9CeopBgL+PrAkTd9PGIZf0WD9pIcVqJBaWTOWc3i4l
         vBlw==
X-Forwarded-Encrypted: i=1; AKwUvBxML26zYD4M1THvBhFwfHTibjP6WZRT7l5MG7yPe8jYeP1/o3vycNJ/AqcLTxi55wCNWD60MFV7V+HPlNmS@vger.kernel.org
X-Gm-Message-State: AFq9FYIhyHgh7abkulkPJkdmO4Oyd8ODpldbqGiW2P+O+KYespoz45BK
	BrcCNtsU2p4rCfbjyqcM4VtSf952mcmVPs4FbPVDBeQRVo0M6Ac1hOuSGxfr7xQSSgbFecTZx0m
	OhLfckSuZUFEfxyPUBFfd9+LNGMHnk+omGGz81Ybiowj6nIqt5xKYw+3WiLFg10H9zCPw
X-Gm-Gg: AYBFou2SMhcj4/QOyx+Cz0euu+L5Q+QKuuYf+pdglSKnj9yk2+oxlGhHx8r5s/ylXgF
	9NRtuVxdKjlt1mJZFXa80b3XxLYSb00AfLgPYH5OPTqZM9OchHlrQgPG9uazlvota0GKhsUZ+Z+
	KWKUm3rgA97RZd1QsiulIKm3iGC2l77tZFK8+ZRtDiqNXyCa6F6YNtymhJiLwPE62yBt+5rWyh3
	Bfq0p5jGo4Wp00vaALzmKprlsHvgukvVvqfdpPPTI2qamZ4OvydJR6NA74n8Nc5jFHmmNBO7R8y
	IAMHCHUKWHERKCXbhB/hjmbZWs6Namz0ngpiGXU8KJlOpXd8TOd7OmbTa0zQnS8G6Srzj28dWTy
	LxtnrrGfH/iQ3kkQINIF/oA==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr980828585a.3.1792659518678;
        Thu, 22 Oct 2026 01:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr980827185a.3.1792659518213;
        Thu, 22 Oct 2026 01:58:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm84471066b.60.2026.10.22.01.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:58:37 -0700 (PDT)
Message-ID: <58080b02-5c0b-458d-90fa-a135cc79b847@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:58:34 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: Add PMIC support for Maili
 platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d03f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dlizgmcMvvRP8E2Vd-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KivoBc-brCAL04j8RDvJ46EPNVXQwMef
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX84Yedefy6FTn
 1rgiglpncAbJcfV6Sb2VgOmS1UmySqftMqLOXrhKYpTTS+KVFSzw8rm9GT0ICYCrQhgILOT8CU3
 GUobux2azscfWwCaieTytdWbn2JgtWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX9el87hFaltW1
 huYWUAv90sVAAqeUdUDiqX5NeEjNeix9wbl01vAEXibSg2lGfbCZhnSWSRNyZYe0sHQDz/Fl4KQ
 iyJjGqB4quA3XfOgYEoBRMxrPS2c6VIYE9mrWzOsGPOtukjitDAG60AY2qULnLVe2ZEV4WkSSmD
 u6BGbb533Fsb2PtZ92lwldOBeeWgdZjkySuhQ4iPCkKUMhxRfASPW2ARkgToZWO2aKj4kfL+LR9
 LwpwvdFgbhldPiaSMnypQPJp0q24qW392awIN2ULnsCb9UxfLYUhVcokuWut9LPxn6kR+jfP9kb
 NISBEF7e3tKnys7KW/tzWdPVfLZQiNnhf0Qsd38c759BDyrJdWI9yX817drGIbwol4FLPqiu+vr
 8gbvofpUmVibixIkULfW5yItf0mUtuv5vutiPxk1vNWzyKOl7HGe5W9x8GjmhQ0nDBa/dXT3FQ6
 Uhr15rWnDNZqQklnqpQ==
X-Proofpoint-GUID: KivoBc-brCAL04j8RDvJ46EPNVXQwMef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220035

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add PMIC files for pmic-arbiter device used on Maili QRD and MTP boards.
> Only one PMH0104 chip is used on SPMI bus-0 with SID 0x2 which is a new
> usage, hence add a new pmh0104-maili.dtsi. Also, add a new pmg1110.dtsi
> to support PMG1110 usage.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
