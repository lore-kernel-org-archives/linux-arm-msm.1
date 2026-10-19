Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA734B921F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405603; cv=none; b=GxvjyUIkxvSHp09u6Rt4uLhHBkswX5ke/r8XuH0+smkvQzShWntCXlv/lSNeUhThZEdFjLcv/3rj2E2DTAlTOntBk4ATEkmdiEESFd8vRTJvWQHLZknCB54q9jthlikfAApV1RQvAbtJttgsSvwagHYvrR5Y/PZlUEx0+oKhNWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405603; c=relaxed/simple;
	bh=aIWumpIRlPngpHB3nhh9eNSESlFAuJfAAYhkNH3HxMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGTe4oAdapCOVNb9+oIvdQCuoT8OmJigwleVeMV5dgdBoObDnSz5MrPg5gBeKddB5QIgTBT7SftoNLeMDyQCR/nima61WtwBm2zanXf7L4Mr/Ds37HXfm/0dBxzTCYYWHMmt+3CN/LX8bb5O752Q9LgQSvjUTuGXp+g2Wqbimww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foXBBE0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adVPKw5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foXBBE0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adVPKw5V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1wg2042122
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=; b=foXBBE0CNdHpNRfL
	bFJ4P5xetolMMZheLnLi4PL31OGI3ld1Ve81hbDo7GPwkVa2lMCGPZCiH6OVdJxg
	GG+4oz6SyRCkN9c+zOo/Y2R1XpbHzr1n5cVqwkBDjeFVXKQMqnlktj/mpOLoc2Q3
	OTN+ypoKyivWOzMjGs0twOlYBNf8/udvwlAUx9xHf644z/3pBvl8mBc8q7qzzLSu
	o8Xtgo5VpvnRuCz0U4fmracmiF7z97BYYZ+NC0sctzSTYeehhDQnjTRmwZpgEwaC
	wU49FyVw+05tCTImieq70TmAtjc4t1pPDmpWTH1+rfRzO+ddtVsXvL5bv7IsB0Bv
	PYf0bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2933-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:26:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso49967685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405601; x=1793010401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=;
        b=adVPKw5VFxvCHheyTNCyyNjldMDsZZmobTeIHFjr+MSiE6S7VyedqvsCwgQjOoaQPF
         JvOljKy5S4ESt2Pkb2y8AvcEB+CjQZaZiwVJOCXBr8U7VBJK3Foqs7FutcEOjXcESu4W
         iKM44OtAEXY72jTL0ch3qASOrqWFC8fDfmY5ehnYpwS5kOJchesyKacbb8doZAcLQHkV
         lW1+SsTzs8vxT119FATLxmpqlkpmEpWgm7dD67KX0InNafEGlFJsoSlddKBXcZRDFSFp
         rNVO2r7nvmJIl/9TarH0Xa7h0+68mCPx+8tV3SxQ1SUb25xSGNz1UqQu+WYgGInrADz2
         3dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405601; x=1793010401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=;
        b=HKUPS9WhIdPMbNRGLqDvGDZsCufENDrkS+fPJbv3gbkD26HfP/1pJuJTpVCsibyJYE
         kZX9BuYsvegUMd2W+yqTieoC3B7r6Wijtv76AkDCd9hS4xUg23n4QEQlwjc4O+uTw5j4
         GHGf7SIkAOz5wLU3d8em7gzu5LhUBU1OU2TA5tAkVh6dk5RMAULo/rKQTSHlkvMKndiM
         0QBHB2AtGs8XIHCjZJcvwRoG1UsWupaYm1jduAxVyQkQNtq0G9QvSBiMf8iTE6RqnFZm
         6y1PA0KJkAyGHM4BdkjlN3r5oqR06PWrLej61QUwtxCHH1ozHwIMPIZcHKJ3+sGbGMFr
         GzZw==
X-Gm-Message-State: AFq9FYLp5NoKXpz5D+P7T181uvfjsnHw/WXEc8mJiN/UBhpWhFHCTqSA
	vuGe1xwprtl1I3qQdDkjA9orRNNk0tgT4ytAZ4p3VhSCIKg/HOs4b147W1PQUXufMmAEqqnTgfy
	KhySi7BQ1ul3TED68sUcHwmbIDKv2JabEh6ybCaFu4DeUK7c1Esao9godYnKz9J3CR3wSJu3HXk
	5J
X-Gm-Gg: AYBFou04Z37TARU0lYoy/KH+K3hl+TolPRTP2LXgL5L8673yyTRiTD6o2OF3j3SG0E9
	2V+YvC1AJvT1mgzJW659fXfyic8qZDLfOPs3ALmNSJgJu2I4UZZ1MPeMbIColdeWOl5AcS3sLhC
	RYiXs9uLVRyFzp0oXjeuwsYCTxVOOKvE7+nkHKyxLSnX529d2k+fpSEDk8dWoWogD1BHnAdNCSV
	O0lPcEIVcm0LKE3SaSUayc9koKtetjBD2bgtVGw4KeBrBS/cgBmGWSuBXLHdnuVUhYN40fqZudE
	OxXkNNaSVlShnfXE78n4OjRU7SxCuU9M97uEkPotL60SO+69qaAfTlSG5uB4Ih0SUpwZxOlM0lW
	+NA6QPRNPe0nk4K0Df2CapQ==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr95242485a.5.1792405600585;
        Mon, 19 Oct 2026 03:26:40 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr95240785a.5.1792405600127;
        Mon, 19 Oct 2026 03:26:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm3935320a12.31.2026.10.19.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:26:38 -0700 (PDT)
Message-ID: <adfd320f-f253-4f13-9e76-3a2305948419@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for
 LCD
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Haipeng Lin <jimmie.lin@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX+nsEPhee55sG
 2dkvyC3xKOwn/j50xQb+96tF1KlGwhpHvHJf48fUl4uRXarevc2OWNnRH4p4Le5TXBFCvoOr0fh
 0YbVhsM3cgqrr2jh5R6kyiC3CP711iY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX3fUx9FR7dp4o
 XB5Pg7e2tWjN9cesex4q+jL6KTUsZWJiiGtzq07JjjEzV6LEz+AP5umdGcAdMSKj5CGV7ycBc4H
 +Fr/BidhZ4p+qQhlXDyzM420YCVFclsJQt/IXTlk0Ad6S39EoDD7ZjGWnZjmz2HHiDQRIMU2r4O
 OXk8e3JsER5A+BpwDELj4xIvitNvp4ao+mUL03vXmjAu96g12diUk9uIBPjEDfBZdzyoNpGr0ua
 Pmvv/c4Tv6nJe6DM/e7tmQf06P1OQ56jYHTOWh3CkfrueF/bzlWg2ZOdrH+zjwKQ2mltK+7HstS
 R5+zXH4KIf1fRBPeHZ3kFHHybrOpDXznbK6TdOLSP5W7JFzA8NSHdTdkNBkl12eaKIzV/krhwQA
 wkTd0BNducn7PIgqhNvGLMR1i60OO3kB1cg2wI9G/nG1mccbE2ywqURGtwx+nZdMZnxb8rebkv9
 yvPaqpsts40f0xxcZNA==
X-Proofpoint-ORIG-GUID: ebCifbAjiTbReExbyYzmyR84XiHzKzRX
X-Proofpoint-GUID: ebCifbAjiTbReExbyYzmyR84XiHzKzRX
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5f061 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-uL8lm0AAZMNKrp0HWoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 10/17/26 7:52 PM, Dale Whinham wrote:
> The LCD variant's backlight is PWM from the PMK8550 LPG on gpio5, with
> pmc8380_3 gpio10 enabling the supply and gpio4 the backlight, as on the
> T14s LCD and Surface Laptop 7.
> 
> On OLED gpio4 is the panel enable, so move it and the panel compatible
> out of the common dtsi.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
