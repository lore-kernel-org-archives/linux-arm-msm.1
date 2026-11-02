Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618488;
	b=Cp9OypktH6wzcwcFM4AcnyAEGwlV5a/HoxoBnBO8mw2ZJWdkd8VskFnnLR8OAHQHUwSg
	 No5aenjbWGg+VSmqmQteStIoNHalPTPSFuxNWDg/MNtL2WXXfTylZtt/RIzi+RSjeBkUm
	 OZos5uwBn38oQTU6xHlIuhWrjuQ+a54zSff/0oPP32qE3Zvbscj8gLPkCb5NBQOcmzM4V
	 KYBOBn8+2P6taoKpSzCzTUMa83uRQpZrkYVHEhGNdf9rhybNoqAHJDQczTb/W+Dgt6ioD
	 8+wifyBagkvLCYR2T7DNhvDYvaEFDq+838FFz6Fsm7D2HIeN5thGBrbc5E6rW6alofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
	b=pULJzk82j5UrHj3veylggMiuWcBTZi3m3o/Gg8zsVr/QOEFTi2+fNdbVjO1TZzGQH9UQ
	 eVrdoAuXD28PAe9DUuLDRx4VTT0XqldnS76TBWjOo+TcXIP3r0wBYhb6KZNL63fCuezS+
	 3rZ8w10UjvD+/OgY5LwYItrtes6nff+LG8CWr2wSaQ5G/qwYkhmKTBjFfDdblI9pOYyW5
	 QZ8YDkFzJSN1Di5H2TbYSY2xg8Hwddw2PfJZUlQBtlT88A11sG2wi4iI8uwAaUkIooete
	 3S2YpA6EzWkT7ZDGwOY2o9gn8B1Juy0wwIhA0iwkKjJA/XZBuKLCWTlTICfBOSRav+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ES9IIK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmbfcXGk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF11606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF11606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ES9IIK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmbfcXGk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJVt2880820
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=; b=S5ES9IIKNcnmiLF2
	D4WY3xX8TjLvsvqzoRrYT7+2OlHiOzLmw5J42N7BB+OisyNGIXj9c2FGyLTqN596
	8hrr2Z46JCYPYOOcyTYXy5BpTUDmCmN7Ha7+mZoiqlHcb2B/Gjifx5mGxFfAz6Ta
	TiHpS/kEUpcFWAFDWzHAfk0IlUHEVlEdbJCPoJJMlnJharZy+L/p3435dD8REyny
	kzCWM5yZ5Q1ieTE68rVyZZR9y7CmjxKqNcbkbeGbUQ2eGwFy17RbSJwvHMNtc93d
	0k71iYPvoVP+n2z0sxp56+1OgyF1soHjZEkcsRNUOJLVtu4CIeI1j3phUYfJEw8i
	SBJ7xg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgjkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:21:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so6705791cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618487; x=1794223287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
        b=NmbfcXGkR7oPxeXBtyW9llbNn4f1LuGBjWFcdSHJfgVXJdRqnusO7b4LC3gGg8Xp4E
         bEebv6UIGg5sqAPdE1ufpHWsXqwCsI7yYuJ1LMJXJoyJiBsysg4KfLqbZYTeqdZYXd28
         NeP8XAyADMA8LWaWOqlZVbA1Uq6dTKybDQwYQWlaIu8pov15f6SN1XxNoPD3HsI2U2tR
         dbrwaBwgcdItfHpNbFY2KMlvLWKQEFFtBomPbydVqmQZ/8tMN4pi/lrQ2gqH6VIsv+eS
         u0ACUkyN3YvmT6Ng7IexF93acw9LF/q64dnkmRkch/SMoHb8Wx15qFKmzTV0yXts7UQH
         UHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618487; x=1794223287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
        b=0cYaIN0he/JuIndy3BTRRzhXZo+YduELTVfWFOKJcojOjksxXvQy1uTznj/wEQSLzO
         FlL1w7Mzgqd6kR/SnYtHS9O/cvKmsY3RtPpjYVpLG6LEueqWYLltRpR9Tk/4lm6oVEj2
         vAUrDUa2+0bE6/N9dVS4UZBxBdHJdyF9y241F8js167Abu8yYPo3Hi7vQe6MAfQIuHND
         H0IdJE6jdrmX23D4rRiPtdmopepFPtbUPWnIWiSF6DJkLeuQfAxYAV4ermVeybg7ddkr
         Zme+rmfCvf+UuugeJVlTmyClwPVvX3sLlc15W8Wl576IWhysGNpK943YeHEZdGYfKcog
         u48Q==
X-Gm-Message-State: AFq9FYLSUY5Bftuz4kSW54oRfP5EK3cPcXi2E18NBhPI6E78irZJj/k4
	TEflSgaz/MfjMhinF3Fi/lhnr5MTkaDHosuRwb1YVUQ24bp5G4rv9E5GUTuddQmoGQqnsraw7PP
	x0Hduk1IXN3Ox/CjKtEhx7rbXikp7GkUd4ElFUJF2n6CGcneW6M9+e9r9O+XNRAyxX36X
X-Gm-Gg: AYBFou1d8cxXByPT+WUTMgNUH9GauJ2l/DtohVxWWpBHMI5EICqOEiqL7DGizOpLHNF
	Z9WZeG4RV8f5Ea/DdCr5tvNvsfMqtp49rGjN57cZqesmzp55pBu0rdxQWfyhW5IVoHvFcoA5UnK
	1J+XzireDbQoxWfXZv3rwaYrMHcz8IV/kVmEDf01Ug7uSndsUTaMzlbyjDwOc3ajYqq0pUld0Ph
	EIZwR0T8o+REViIz5MfRaJggkPrKxCCK/a5yfZAQevSvYXwz0A8hsyrEORRFVhmxP3sAzMTEobP
	xoObqqOuBJIX+i6W15LvWxNzHH8yP0yLobhDrf2YIs7Wqul/gK/0dvV9waHEUier0ibKkeXwDQ9
	JevwK1zq3mw3eJLYtGEC1QmJZ7GBTggaTSiNLt1vc2jYrRlp5iMOvjJqc+lzARJOei/aI2AU=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1736507685a.0.1793618486697;
        Mon, 02 Nov 2026 03:21:26 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1736505385a.0.1793618486284;
        Mon, 02 Nov 2026 03:21:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm374500466b.7.2026.11.02.03.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:21:25 -0800 (PST)
Message-ID: <939bc61c-234d-407c-8300-638367d4fec3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:21:24 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87237 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jGN_E96kn2IweV2Cx-wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: gVKdMZE-uHe-xCh85to_w6hD9zwxNqWx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX26d6CFAopuVe
 R8TEC1xL80DNFww40D08UVcBNJNYXAok3leAEido6ND+5OdfNFTyo33eWKFbD69Fp+ctYlb6/f3
 MYEom0zy/qspjC1WXIf+obWIdib5XeA=
X-Proofpoint-ORIG-GUID: gVKdMZE-uHe-xCh85to_w6hD9zwxNqWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX/yQVP96Wgtzl
 C2R+rao6bOAdmTdSqAKuqfRdfGo9F+AFu9yDkbbfVbHQIq9BOEFGLp7KMVLl7FfX71WHJr985k3
 t0g6JOg5cITxY9jVTt9xBw7Tf19dDlxwv38dVD9nG+dIgSRBDAGrr/3k0aVf+QE49cU+M/UjMZl
 r2dpNf5E0NyoGeC9owH117KJN04RCJ7BP7AfMm/zPJHerA8zTkdDkoY+QOqrkWb109FkzVkTkaX
 1d22N3HLUvYJuDFqEvKiEt/Dhgnr8wx522yrUiMA41JVCAIE+ynZsbbKWWpivn0TZOetzaL7QGM
 KG1q4gy7m4nybtGCUArq84BTWq9LcSX9jb6pqPpVCypGZGb6macyGnO+b+J4zpuHjRWTRwdKMzm
 h/hlp7U9Un61ItsNsGeKb+UbD66B1pLUoR7bZZs7XVUhITMeWAhEgQPpvrKiICsqeHFNtGoHXxp
 WO40QRNYkkCZdSBMVkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020045

On 11/1/26 9:02 PM, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

This can be removed, see

https://lore.kernel.org/linux-arm-msm/20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
