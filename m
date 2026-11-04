Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795416;
	b=SEb4/qiUS4EC3hNY+a+DXOd21B39qBJz+zvYns4AoUnGcONevvZB8tT7XgK6rqZfW1hK
	 SIHrAmn8oUysPLr2mORW0nhJEPmwopK4uCVBgi8f9K3B4Ap4UmCpE+zccMJyN/+AjW4xU
	 IPJYKIggIEiOz1BPSfNExRr1ZpPlKU17Y0G8fxnvBSWbFhzAI1GjuVx3Ru97UwYGiNF1l
	 M5YvCyYAilAzwvYw2xpVIbYYxZEB/pqBHrccHYbSmDoRClBJcOSajPdGTbltkBs5pTIho
	 s9v/gCDj65faQx6feAAcTFcpJEcK40o1YRvAkjehCf2lqZlvrZi6kFWyep5YKTFrkFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
	b=LHZLXcuYcX1L2JpC8wBCS5p7VqGXrrdn6BrgbjQB+4ABCAmX/6kmjSi0OXqqLxipQeKE
	 R0jLvUjLGX64B5abKzNgE+oAprLWNoVB+a3F35aL+lDEE65yGf8Ya6lCRaa4ekB3FH3eF
	 cT1C2pW0hi0S/mRhrR8PUfrrgMGIqASZZq7hdz+6coy5owJ1zrpekFJb7U98GUyyjch5Y
	 OPEJ2+IWaYtCOmynQbsuQERYBZEN9lFL0yjSSBb45f/EbWpDCxyHEP4WYtrDdBrhtchGR
	 OOK/6AauE+vfjPtByFFog+1ALrXsN0nAj+1lX2gJjrzzIyVsvPOQyKj9QM7F8rTR6Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQvOdCw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzNTiid0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BC5606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BC5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQvOdCw8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzNTiid0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtoi1667531
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=; b=OQvOdCw8iR3/Qpcn
	RAPANZBLVtI/4IxZVS5zfn5LSC2uFk+caGz9dlK9yy8iBboSuW3HwgAk5y/p8M6A
	9GODdQVIOi0k/CkRvH2pMRxgBrc8A/qXk1AHvf+KLtBmIj5Jq0HZlsSGwnAkhvvF
	tJnmCZL1fHdbWBOmfgd9AGgnZyDPuW/QT6fmi3JgX6ZlBYAVcWblcVhd6jHGPtT9
	0mwIUMAJ4EWCi5xJCRX4gP1dcYAYMx3tK1TPJ3wREWRibA9q6B/o1GseqSgbFYhN
	hjBeNFc/ivN0vf5iSFdKM1ehx0QFn2kolc1Pnyc6Z0EmhI5D3fwXuircSH23i1JA
	Z9I4PA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nkt5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:30:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9833e1390beso15885241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795414; x=1794400214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=fzNTiid0T/kQUlFUr3fUVq0IoOBStEJk3apy4DOIW0ZFGd1Tnv6RzPGbh/IwWWnL+j
         +rY4cTVBCaMbf/O7r/+hw8+WjxoLbsAvGZsdbtgZHp53LQ4k4pniLqlYPA/vP0PB0MX7
         DQr5ZwZi5uTk2U5pgisEcQeU5/CA1W90sV+z68UmX98DPbsNid1VGglgWTEtzJeMJgez
         w/kVNOjaALIV/2fay5bNZ+zoZlAHwmFHGnX8DvJqX5gFWGOO+YQmkUtRRSJjqurrrGvU
         x0m/SoHfPDQap3GDe8MFwin+E43FhI8SSK6oRaxbLtjywKp4KmN7A2duI/WLmdGdWF1O
         rdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795414; x=1794400214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=hHGQ7pyPzu4oi6Qiwe8b5XXU2RJayGvJYmYj3HsZPFbCSQFQ6gagwK5g3anr2tKYpD
         HYfDrKTm8TEWeJkUIZDcPXtXsjLOUv9J+x49mDeOizPmhM/CNqg/vMrXF+JFXwjdvAAI
         CQjwU07zYHngc6t5CdarX7rYRXbRJk/T/kdslksigHGoZbQSJ2vqOPkyo8WW8VEM/Oy2
         W3LeaL9R2+HCKMByCD1a2CVqAq3iVLMOVvDDAr/82Vk5Uku0mfUQq2wNudxI+f89heRU
         qYnHReSDz4lfH/Y20gcinCpy78BYLgnAUn8zt8FIYZgfPrmF1x8zw8MJKbyHdw+baTt+
         xkFw==
X-Gm-Message-State: APuU4Z/fxHyvknHK63zuqK/j3IUFFiPqQvejQLwRMEdPSsxgXqB2Pbhz
	JSKHxhtoOLi5FU0wrYvWvj4uQoBKUo0klsPbfbLgS7Ii+ag8WhkC3lJBQJNu8rPcAmX9aQAIfTW
	A7+9mXD/ykx2g1o4Fr7D8Q/YiqMJUpl2RJ23PkBC0PrM34mwQjkV9EfTyltd3foUOwvYw
X-Gm-Gg: AYBFou0aWkBSOMUZ1zREqFFJoLlN0tuyGieIreD32dOJudtVmGEoxJH3AhhWzQ+1syk
	SbbSEihn4pUHv0riGp1zEN5ShWk4r75JB+iwMXuQf8adMNwPGgNXTEyGlIW6Sli2q0c9IEO+6Ei
	g0QfW/e7YWxlRCejYqPs+ieb4FJlTydxDxWTpxShiL7Y97ybPxUcx3eYM0SJKQkpGa3fCOZzyhh
	qXAX4VeUDSff+9z/f9neSkCWRYR6DuLIQ3QgQWIQ6mMsU9Z3qqlHDIXkjr9Rk7Du31QRLm5VuP+
	xZwkWupkZMd/KR+NRub4vDo7emplXXcpT+1hLHwQAysvUduHoHaGh1pB53585q7DEZ40u6qWny1
	hJabKWZC+QZu2XGvVVgq5YPo69biJKWMeU2z0mbVeFxz7pNfhdsjHHvgMwk4xKvOjYFOF
X-Received: by 2002:a05:6122:12bb:b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec6897034bmr6619479e0c.5.1793795414002;
        Wed, 04 Nov 2026 04:30:14 -0800 (PST)
X-Received: by 2002:a05:6122:12bb:b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec6897034bmr6619402e0c.5.1793795413275;
        Wed, 04 Nov 2026 04:30:13 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a48f8sm62828266b.79.2026.11.04.04.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:30:12 -0800 (PST)
Message-ID: <2d8f4e21-9ee0-4538-b5c8-dcd159d40dd9@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:30:11 +0100
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
Subject: Re: [PATCH] mfd: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX1pXRlaNYwa/e
 rqQUs1rLQa57TZEhywJIxMsykGuj0/2j7I5/10DgAC8y6S7Jpc/GGZbZcmJer3McFXKujT5oJ7q
 b5MgMHND98Uu+TtG3NlRHDieyptHGF8bnKOqDF/Hdoe9olNQBdHsX4FN0pFDoy3Ns9jA+eelBXH
 WVelYimpJS0YwPFZINz0sV6N0c2NXTHvHA34LLWO2zCCanFSXVT+/yxKfDgOJjT4Yrc+iv4DJnw
 3FfWEZxKTYV+p/I83Pojatr6BFl29nLxfwqhp8Z/4clzMAWOTP2MM1Tebs+RoaV+oBWAXoBFmSa
 //rgPq7UCFsFAL+OfD16vCZrZXFbaP+QgxVjD1teTCxaedhEHPKeWV5r9ctHLyBg4ghTTVYaXsH
 2tIxU4Y940YQZeECiJCwn3ZBOIbDstI/W7COISgV6nGc9CZxZquIsjwuZHYSRBaIftbWQxSdxFl
 VVMg++xqAlxzfjswI/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX6f7F+vvpLmUC
 +inVDgtZravpuqPoDDDF4w3qhtgXJNj8qKbT/gd6Qh6Hlxeky3sTqpdqO2xlT2NMZq3lGul+r6n
 mm4TZ4uZEzbfE9INCza6EOD5ZPcQDlk=
X-Proofpoint-GUID: oSYEDEMORvTpfPJEZ4jDCmifFluUDmR9
X-Proofpoint-ORIG-GUID: oSYEDEMORvTpfPJEZ4jDCmifFluUDmR9
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb2556 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On 11/4/26 12:33 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
