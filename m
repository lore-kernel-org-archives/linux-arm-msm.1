Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704772;
	b=XxazOP3m7wn8g25WCAEc5Ehovx+kNZN/JUbC4CEVr1HLgc+i/jSsHV527Sa1ndF+nj3n
	 jN+xRaAE0v9hRlQa4LxMgI6oP0lAzn1RN5Ol4trLxTXvD/Z5SsyYtnKKM488YQjWq6prq
	 u7G4ui2TwdUtBYg6kLATNDuPuqi08/8raPlBiY1r3rayAcZQEcpUTvBnOCYNLDilfENvk
	 Tt/Zlrm5WVBeev32WEADl6UJVgpeQH7edwM3p0JoGfy2UPT1GTSRlN18ncyp6bHwWv1IA
	 twa5ud1hoYEWfWtGQBHDX7KJeec65AsuU+NRkgeY2Z2gexmAgMSehDe2BWrahC02yWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
	b=god0TtLyABW6u+qWZDRIGrldjQCrFJaSLOTndiL/GSjhrvkTKX/WwL7r2+Mye30Q9sZ1
	 8NuhjyZwEcLOfKrHG3lKWx0ksVtp9UGBUXXW3Qt2ZBHEo0FFfZhXU5y+cck/CqWzIdBd2
	 s4VLVMQdqf6p0P3WBojoPoIPvIAVaIPewrnQI8hM+2Kqg6sHkg3FqbYezoDrt60QClbW2
	 xsyAv1rrMGtOZ1HFX/VbpYZGr7LwKV8QS5eXnuRfvBS+tQbTdmn8yyBXEDixphKeLkSfU
	 rB1WutQPR6spa+r9b4BB3+A+rlCHYhvUpNcXp/nWlYG6YMGlYTFoKos3ZsBgfb+h1Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjbJMrJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6iM0LX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE284606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE284606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjbJMrJT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6iM0LX+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVETI3143467
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=; b=JjbJMrJT5aeDGri8
	zG33fdZozbqBvxfkvfhHBByNX8MMIU3wGoacY49uLACB423vT4lSKXvy+w+XXtxB
	fDxbo0bHVlsuByp5tr/09jjso6SPoksizMONP6xMkkowQPfQNRTNQH/eAaOaxtis
	veycPeN3CyyG5uGnQ03k3rhSk0xM2BenEZB0KRVUwyYTP51ey/Iaerbz8dTodDUK
	aYxPf7758708J+/bXrhkyb7/Z9IC1xuGFh4BmK9YfM1MLHBUFaZ6OlCOCs3SALOn
	TS6DrRLU01/EPGVHj8m4d49xLDTcdV7Tg3Z7fgS9VEWzazrkLdr7YGY0sLiYlBXu
	bjIK8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvuxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso100221185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704769; x=1796309569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
        b=F6iM0LX+/A1pLjMl/zTVtqNcxBkgRdcl6jqELl6Z5vP8pLOsRvk3X5zBEBABa2wizz
         Xlb17lGvvaIiHkGEbSpENUFPVkySyKKSxVHX9ERKj3tuUKXtk4ZncRKHjShv9ZaRMDBq
         crYNWnXAEv4qULtR6ya+eulufk3qfhnp4cqRyIwodKyyloMi8fxBGKVFisoHgT8CdpGQ
         aH7i+iJSUR1avbST6iBipQSzr8/h7Cec+V2AI3oa2oOoTDMR/8qM88U+VWnaRyg25Bz3
         p/jC07bph5lgkLM3bZXd5aV1A++8E8+9Ku5T/3QV7nY82rStIoeyym2DldFtngGLoAX8
         t/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704769; x=1796309569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGzTYdCVsxmaWjlskvTq5xiHbCG8jSfhPOvjHrpWhpc=;
        b=M0e3+ghdPtssuaM/UQ2C6leZAVp9uMZCosV3phaMzbYDC0AQCKVxWwaAQyyr6W/Zel
         TlRpKkd83fIJXat23b/JO84Ygrq3jNAVmGEnRyzgm6sEoT4inl25MQH4szg6jDgvp1we
         yIMMnLU43aZmJDcbiEdMD45xpU8bXjz062smsLh7to/9TwJ4j63I6cjeuT/esnv/P4Pm
         pM7lMSpWLjk9jIp89fFv4qaqY9A7I0H7Qipwr7O+W9IZN4Ng/kq0IyaDeKBec3qhdOz7
         AXfWLise8D7Wb1Pj86QzdxAtUxpRAJ8GXRvsYiVATPoSO4bU28C6IkG/cf9oWK9Mju47
         5pgA==
X-Gm-Message-State: APuU4Z/I13Nxv3WEfIuUhG2J3DFOKeq7d2cBGcM45BcZAFf+2/EwaUyZ
	XyBYRwjpCI5wW0b/JSdC6IWs+N9KGI1IK3UTI4J4BqZkOGdJpCI109qAN08e8G50bNRBR4SiFxZ
	/RkVvgzStUEARPygmB9rtTgQKRhQfLZHVWWU3pTNT6SByD6Zpxw+kSTBIASuu0Sk7X41K
X-Gm-Gg: AZFdTZchm/qXGQcTqzSF+dkcEIRYAv6S4GMmENhX25NVGG8Gkn0mSldsrbq1DAAEz/R
	+iRI4L8x5tats/AExb2PU9WAivflYOrgfyNf5USCROAoLqOb9VAp25/JDsTbtpozDNbleoDr6pg
	iP4FKkftSSdGFKDqzD2KiS+8xnzgDg8x9k8VpBNIgO4bO4Ty45fr3KSnZCk3Obhd6N7EePj5stC
	9ubT+l9jzge91AzTxYZMYjI98xFbLkU2EftZSKgkEBV7J0y/097k7JqMDZlXPWWgqygl+/n5JFg
	oo60l/ZDZCbWdIzh8SL2zQyyPcFxr+m+ZSW8fs+mr6n4nPbFgLx2gnX3/HSVQjSU+n6QpCOGz9p
	w0U7a7qcv2/5l08h71GJTKddRa/jPeWLWmPk6RHrcBmmcbEYSyoL5Xrqzw7Eczdz0dsRjRd4=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3715304785a.6.1795704769138;
        Thu, 26 Nov 2026 06:52:49 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3715302185a.6.1795704768733;
        Thu, 26 Nov 2026 06:52:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370faeeasm10019939a12.22.2026.11.26.06.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:48 -0800 (PST)
Message-ID: <8b7a834c-4e59-4f87-a83b-5d30aabf5269@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:44 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 PM8550VS-C
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ag8v6zKX7JcqrsRKujU1_gUJTC1ubWIm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX8gZu9Qd/y/Dl
 ffRj80KcBYVURtmM2kYREtWsNzWJUoVSvC4rhJ9EsvxA9DNeEFUDiD03KERUIVnfK5AQIkqyRfX
 dMhKQiXL0v38ov9fmSPu+5g496otkmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX7nBfeLLEZtOd
 M2t6OIaFTQ7+2I5Wvmoy+LzKVTjXhthvehM1B9huVkTnh7kMO4PV1Tqk46wQF8/87bekTmsto5m
 SpXSKw13dDhrsMB4QmwIG+bRyFuJQG6x4a095ik8UdYm/aViaLEwaI7JiE/VtEeQ/h0/FMk1DTP
 7VGXozJB0cPIJG25xWZjEpt2v4U7cgiQacdnJt4kN/Da9OnMMCv2+tJy6Z5fat8G9V2/Bn+2oIJ
 A8QtIDNbSvUxR3Rmnhb5hLuSrCUl7oAdAVA44S+5+35bVg87z91fD8A040/1ShJwpnPv2Oax14o
 2ilJ644S35N+/zuGNLW7f2uzIiDe09HsCIDkxH7VdHqtxcxLbKeQvQGTWBg45wmD4k+x1WHUBCu
 AXm13R27zw8zUCdbb/iy3BqlLv42CEff+WEpLaPj5TOonvImMWrBVqA/LrzWyfd52C+MHv9WFDl
 GMtdLdZ7O3X4aeHfcDw==
X-Proofpoint-ORIG-GUID: ag8v6zKX7JcqrsRKujU1_gUJTC1ubWIm
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0847c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The board has a fourth PM8550VS, at SID 2. Enable it like the other
> three.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
