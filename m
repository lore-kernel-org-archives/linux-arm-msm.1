Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC334749F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952784; cv=none; b=JKELJ1aIcRP3uieFkQT77aARP9gNFKn8EFNhDGMtbPSQKpyb6FVV3k+bQmcoiuMBf2b9cSgBrY7SGIWsiuFlZztNT14UdrZaF3VJjfhFfAmMEdYJGdRmYCBfPS/LitLhR2ShMJwKXqkM+KlxFPNDm/yyxL9bCRKghl71nO/SVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952784; c=relaxed/simple;
	bh=eETRbzMJn8kFrHdjkPv75pWI84ym/O2XGiAGVOJ3dmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1XbL3o4bPox0piReSE4pMeifWhAAnGRFH4jk26jduhDNaQBFEAoSV5wyzW8dMHNuREnVnekXGy04ATTptoEg1XSRAz+vJ0jxLFKN6egIJ3gvjEMF0Yfo00ozkMwJljnfLoJu6aC9YrsO5laf/1w8R0SmiBq7DWMF/1Svf0R5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCtARrMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGfJc4xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCtARrMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGfJc4xc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Apmro1100321
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=; b=gCtARrMhA9M3dbNB
	vhDMIGhuwVkijNSSrJUZtxtvz9cUrHiyRlvO+Pett2QQuwSv90RltunwSYAR2QhF
	bBhWkKcxK/7XF6p9Z4NTkGhRJuYe/KJnq7uRc6xESK9g8/Qvz7OD5EwgdwqJpWe4
	+Mmf7cywTg4mMMTs/fO2bJKeNhh+A9MBpu4o4V8rBzK2NXOgizPriljKWAHNP9Ao
	NoiUZ/dwYFPyBuyY6q0ge++NXWOUikLQ0vJI4zELg0sv9EKkw32TCd8dUvIwvDww
	grDsZs8/rh64C6kpoyU6YXpDVyEL9lSww6KeExHZvb9Ans/YLj6FOWkNz5TZD3w6
	TksE9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rb1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:19:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93102454272so90509985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788952777; x=1789557577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=;
        b=ZGfJc4xcRilZumF0D2Ktsqc/HJqvRFETryG9oA35bAKcTRrZFRjaGyUzD/59ZP3heN
         FPfjGY+HQ8MwdnhPq5hcsjMODNzxoDKzOgx9rtIyvvCnYw9dCabt+jlm7HNZG7VrjPZT
         GNQ1Ngb//nNySpBLRnsm2lrNaWFA+lNc0dp8FlidEm8bGoi/K0QH/l8EAy9I0XYO8aFM
         GrcjapoVadvqP/GT2LvVdISru//Oou0K4cmpIdJNZXNMUWpH36fyQHHiCpgZn6WE9QaO
         7dhy8y9VB1vPw9LnaCn/dam/BK4DrA30Gp0qgOxDdtNBfUkJ6ydNvuDkDIGvPZHN8GUo
         0rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952777; x=1789557577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=;
        b=sid3uR7aK8WG5xJ9EiveTUfTJ+Ucn3BU459NAtaUN/GojKKH4yE2rG2Od2MikHp0XH
         nxlDHU6hMklfbBr3HEiBboDLVhhI+BVL8uGR4CO6JNhGY5paZQL3LCUyy/a8JEpy7HQV
         Vr5NaFT6smqDHyzEBTamLh9psSGfYKrGl2pjmKXWQEFsB+4SElYF/EkqaiaHTqe1O9uq
         qcTOnTi07gn2PLkvM8L9KBngiR6VP9OHhrvg9WO27+E4JhZlbAjEEqlQDi/xM1jupsb4
         hOOxVQFrhHPe50FpdKeJZNR2Wzd2xEzFTa3hbilwNWmzcXMUh/q74+OpT8bVND6Vr2Ag
         ku6w==
X-Gm-Message-State: AFuF++lQvs7BBsIckc70s3xgQe4xo1s5aREyzqzRP1/AYMBXOpthEv8H
	4meD8nw31q5BKWFmx1psML+ERsPAShOcYEVofCLZ8R0vYMv1eSTaCXZ5TJzcnEqCH/yHdEQ9K1f
	XIE1gyIniHrut9cqeYXKuU7nrnJuDx0s90G9TieLCZdhrrBGkcS/7Z85811iWjNDFeAEH
X-Gm-Gg: AYBFou2+jFDQL7n0h/qicUQQhjrxZjVuklOKf0Loefwg90ZopwLC5WZeG/5m9UpHNQG
	LA6+vj2oPfZ27MS8L6mqJhOfK5rhsVy810cWbfF/iVQ1Vjf5CUMCsN/IVr3/phtnL+rtUn+BLfn
	e206WuqOAdMEbM4/p91DkYdYPY948CNwTyL2xJG6yfOc6GZw/0YEpSgL0Sju3Oxue+7MngkjoHe
	vSn1xOtHXbqaMpV5XzK7VGTeHUpqr6FpGT/CA6scmg/LPxWjmIA9tWM9PDB94jJNOHV3SA62B7x
	gq3+0wM5arnM26fNnpXveg9sn+UtVETc8yfZwgpCofcyMFxNbVoyPMQwCyO4pJ+m+GqjiyvmJ6x
	MMdcap66qNgEw8cZXgXrnGA==
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr3076522485a.6.1788952777456;
        Wed, 09 Sep 2026 04:19:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr3076515785a.6.1788952776923;
        Wed, 09 Sep 2026 04:19:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm1367440a12.4.2026.09.09.04.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:19:35 -0700 (PDT)
Message-ID: <5c4258be-27eb-465c-b6c4-a0826904e48c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa140ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fd7G5nQXjrtoiyqt_gIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: flhhCk2pQmA9Htmy6TUbDdiOQD_5BD6Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfXzW3B6cq9UEGv
 MMeOzFSxAlncjwhU8e4vBhePnqCS14HHw/EsamyhFVrumzUO3nsu068I/+fKNfAnCaQyt9UqL64
 V5Vy1u+fd0pVV34gcWgFJuYN4lQwSzs=
X-Proofpoint-GUID: flhhCk2pQmA9Htmy6TUbDdiOQD_5BD6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX6GUkKm7ejynJ
 inbOy2ajV0KyvjgBER5nEW2DBjImXpm13V9rZgSFCEcHCvJWis4Ro1cG0ntC7pDWdkD3lZ8MW9e
 2kjVM9PNKF1DA3hqn4S1+Z5WGJYAZXOz0FHC5So0DRulYcJOvQDDM7C9HPMEQRpzhbZRQWu53PU
 Gmep2nDwYnpLBUZ+TJiNcJoYG5LyhPeeuKiNW380KxMfkTJpY5R75ziqS8FvJ5oSDPsMUM60DCQ
 1jDeKX/Dscc+zYdABbBgXuQzGpFJdzmqewK7c8SJ6LMbDUWj+MCKwrKSqYAqFfjKY/N25/m+ymP
 XO5Pl97UUgO8YoPbg1OwbB17PdFx5OTZiB94zT/GkMa6Cw+GV0sodSJZXNji7sipQb8BJXYVLeV
 0rhrdAmegRNCaIMrrkbgudDgFtO5VK8z9Kpgkti47dFsDyeqjGfktjhPnq405RUENA5xJ09sUUE
 611XKOR31PNxoM9b98Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090126

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> The GPIO mappings on the IQS variant differ from the CQ variants.
> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> Secure IO pin; the latter is connected to GPIO49. This incorrect
> reservation causes the probe of the second Ethernet port to fail:
> 
>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
>   (GPIO_138) from group gpio138 on device 500000.pinctrl
>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> 
> Replace gpio138 with gpio49 in the reserved list.
> 
> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
