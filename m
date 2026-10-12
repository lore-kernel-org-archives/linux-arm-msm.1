Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7B49BD95
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819314; cv=none; b=Kz86TxpLBWAoI+Ntnt2lc3iR3X8c74KG6MMpVoTm+Y/Fj6hmPw/ZvKPkkL4xQOsSySvpSAoWlwaVwXd9QJm2n401rznVtNxW/yPbcaVrHMjQoyH15qzyyZgdT/9KwJ4AFKGCNpW7QjHcHIElHMpEq4igixK7jsAL2vc//7DIeL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819314; c=relaxed/simple;
	bh=w4lePotoXe+nX+H6NblvvDqxQcCb6RktaTtqvtH82EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVJ81x+3qlzJNgfI8guVYp27u3d5kYiq5ebVPjoyd/dQrNIYcGGqABBMnne2ZDR39ROfjiKD+O7E9pzZU6jgpqiXeafBoF6E9eoNYUDbnQI/v+xtFO9/iB/bv7rtvGaD42MBdcTb8EMMfL+MXQi5OHa7PEooU4OYAR4MSJJN2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SygvHYei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmpzixQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SygvHYei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmpzixQN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0G0J1236392
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=; b=SygvHYeiQ5snGSw7
	BZ9iQaRIJrMLonFFtuJyJy8krgi6JS4/BUu82Io77+2FSvz9qKrP5n5RVB5V66hO
	eXu8Hcnc7KwsV68q3fL4CyaWdRoFNVMsWh6bOpnrgolt04Iog7+snNZmSTAS4Jon
	SLbLOdfxnU3qLTFDOl6l7vbAOsMQQl/ULMbFrYOKY0w3gWxtXCjCPMP9A1Dw9GpP
	bv28YcyXkCXfZuIZQVcl7N7CCuULDC/1jAsMsM4kT94PNU4Nmg6rG1ApiS184zRL
	ac6qCj6TLxSY8QvsE+XpD1D3CAowwGoK00Plsbd6c4LfXO8rNLBU4QsTf1h5Gw3A
	iotksw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkqqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:35:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so2855081c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819311; x=1792424111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=;
        b=EmpzixQN4szYaN4yM828VeNo0bViGvnnwOP1QFKzElzQlSBut4YHakfjtfDj8qp+Ly
         2BEKEbtA8F/TEZLN9GFln2qQp4R5leTZKNQJyt6OHsLrv6/bCUKeD0wjq4sajGLyhFWp
         goVm7jt0ziK8CkDTlbJ2jYdiasO03FvD8899R81k0SnKDpyuhY/cjcplluU10gDL3hVN
         ufnfT5h9VEPPHCxRp0pzCq76jsVXTMjaG+dQ4bD1YrnJXuaOTqcJsXwgOUBaZ2JwhNzn
         dG752kkjtS65Q+FhVYyrJyPjTlQeFw0ukf6D9QIU6XpP9Bzy15JzTAths2Ey5dfJrNUl
         o2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819311; x=1792424111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=;
        b=XwX71hdbXkiofeyg++PV3RtX0ctqeyy1CYn3EC/I5Lq1fNM/lM/wWIvWSM5hO2hvwo
         /r5ND4snqpwXI4O4g1P3F5MCD/fXYquQktYzOMeRCu3fWkAqFShjzgs2gX2xlXCDIeaD
         y5jWTxYMqNT8mZuD75pd++XTaTEqcvCd1WuANbm0Db4dy/IzAYoFRV3Cc8RyFnHpSYw9
         30mfPG+iRUofBg4u+MUCWLZ2UrPGRR59iGSXO1AFQDMOHr7UZRLAhK7w+0Bs6D4FCm55
         3K8BNAXPC4ET5/BcXf3CI78pUKlluxOCv6btfMxePJVSNMY3BPWun4zTtC/c9YWJrMgO
         WRyQ==
X-Gm-Message-State: AFq9FYJSZnBoRguvzir45BkLDF6ebQPs/Fn2+LKRXBTIoeS9zm1dmcYQ
	5d3EDykC1wkE6kjxxxgsfVA7X9zP2Zgw/ZSWGmbm0giRn0+NiM7+Nlg+dcgufWsBoYqG5XSsD+z
	ImVPiul0ESxkqDLqVY2/qLO1hAFvMd1xMAaTQNWYSb9lvkA9XkUARoLjOuovSrsdQF00A
X-Gm-Gg: AYBFou2IJHAQGYNmdoxVT6sfCGW/+AbEbOPSB6+JlerRDFFlwOsOSxzN5TwIBZfi1gT
	Fm9K990iYoH/0fCcHUD8WAblskAeD9s+OlEVnqPuFKax/hZ/6zvV50DIksSZdNREex3O6vyQC/l
	l+sTPsUK5N3maBIyNGqdMvLpcBmEL0oAmEynrkS2k9WRoxZG2NpF3zPqr5YhVNzedeK4DG7xmco
	uyob7Am91iLvuLCz2ujtCbWjffKpSoZppDjUnKPtXHfY0L6XTVHgY0BdPa6lw+cyIohIUBY9cCo
	WSQ0fqUX/qOutqGn5sM4UL8075JFjItqA7PE9P+3wBDPit6Y6OWMFqCT83XWZnAVuG+qprr2aJM
	kSRsmKkVCY0v6p1FY3J7rSCceoIxDHIA=
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr12748824c88.42.1791819310896;
        Mon, 12 Oct 2026 08:35:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr12748759c88.42.1791819310129;
        Mon, 12 Oct 2026 08:35:10 -0700 (PDT)
Received: from [192.168.1.4] ([122.178.59.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm31244885c88.20.2026.10.12.08.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:35:09 -0700 (PDT)
Message-ID: <18353f7d-d9e0-4e2d-aa79-ec6be0275e47@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:04:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos: Add EL2 overlay for
 talos-lyra-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-4-dcc9316ebb59@oss.qualcomm.com>
 <9fa51ba2-5707-4d39-9038-c0983d138893@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <9fa51ba2-5707-4d39-9038-c0983d138893@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfX/ol51pDtEtTk
 1i4DRkNGpaRujy8uga/ND5WdOiOUzyr3tGjSGp80B9Xp0Ndae282BcjxMVUeNENEWQMMZ762JlI
 CFJlME4v3SBVBrz5gBEKnBqByw74mQmVZj32eV3fF3P3iMxd3ZLMYYfiypbM68TUgOjiGnDIB8u
 CGb1xTxpLik4rZ7hNNbFsssHR4rnHazDlJ+rVrLPNyMDM3mTtI/w4EUIoCjWeS9WsbtJQurJ7FO
 +v1upzv0qHGT+6eG/izJ5GFWjMo3zQ9hXcZxA83Lpu1PoPsteFHK19dDhrt57+E4aqXQqQlOPca
 dZReFxpYoMvxT/UOwsjIMb6vfU/bA6RqT76H7bnulm1tpD9mit5Fi4DUoyTx5vvMS0GG5Imevok
 mCq3IMBVCCF1PxfwZkAXuAeJTdmDPErGE4vE8lCQtp49t6ZvuRKMPqSd/BG+oAZlFvitdRqQJqF
 EksbfJz7PIA6ATtxKTQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accfe30 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=n9yIFlGNEsxdxEAB/oY+Cg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KqQ6fI0hE-5oTRIwU9AA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: kEOnLw5k4ApjVo9KCHe1BEDyt3ufry2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfX9j/M2eIKYqn7
 h7Wj71P3Bm7LZK2aQlEYx8d4wls1/r2NfSopdmM41aqKuAeoYjeZufMc/VlcEBqL0OFQ76S/CHA
 RjL5X7atRbTp26nxlNF9uC2INTWuKfA=
X-Proofpoint-ORIG-GUID: kEOnLw5k4ApjVo9KCHe1BEDyt3ufry2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120062

Hi Krzysztof,

On 12-10-2026 16:56, Krzysztof Kozlowski wrote:
> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>> Add support for building an EL2 combined DTB for the talos-lyra-evk
>> in the Qualcomm DTS Makefile.
>>
>> The new talos-lyra-evk-el2.dtb is generated by combining the base
>> talos-lyra-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
>> configurations required by the platform.
>>
>> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 2f25575e6efe..4f8ca3112fed 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -458,6 +458,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>>  
>> +talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
>> +
>>  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>>  
> 
> Makefile changes belong to the pathc introducing the DTS, so squash this
> and previous.
> 
> Best regards,
> Krzysztof

Thanks for the review.

I'll squash the EL2 Makefile changes into the patch introducing the Talos
Lyra EVK DTS in the next revision.

Best regards,
Ruchira
