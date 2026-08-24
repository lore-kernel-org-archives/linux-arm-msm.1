Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF138758C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556881; cv=none; b=cGshA5k7Oh6Wj28xNPD/Waq+s7fdIcxrW9lAHqWSO6m1SKcP0WHhtT2VaUhzRcyekU+Jqo2IYr7tSeStjXsx4ftMaGw7eVuBRvOizn3yUi/BwzKjJdR1/VJn2XP7RWST+j8oNXuVV1LRHuT6AsySCHTkeMn0v1EKsm7Hn+YdnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556881; c=relaxed/simple;
	bh=fVw0SSHsMEiKeyQ4qfhJeyUSMovRYzqu4Hi6JndnW/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6ZfZNysmJYwL7MMznHze4wZzWsG/RxBXOXCrjGWQl92wx0qohx7J0GgN+97X4+Qo/2tEylCCfkMphJ2fv7qEHo9cbXpR6to29s1L6Bc0zCbxh6q/yxRg04gpm/mW0H5/Fd8fVP/9nh/Kitf/Z/eDoStxuR2BqSCNk8BZpop/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td9kS31K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyGccLOF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td9kS31K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyGccLOF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9cB1937605
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	id9aBbeEjT3dXN0EHxiuQDmKmD2lWlMPUfgX2k07GYk=; b=Td9kS31KkFUZ8VDG
	ILvYYMBSX8hW5Y7Z/YrBo6EZxsMefkhjnIHuoGiMu5ROAuz6bPaSsNmuiQSFM/W/
	VRTb1X0dsH+z6TStZutHV4pRRYEXQ8HuK/UOd+EMhk2HwYbRh4QBeX29BI/wKh8g
	gTbq1SUxqcTMQLvU11TvzBMY3LP7e11NDE/j77RBPgmi5VcWaMHqQ6SdQgZlek4X
	aISd/hoFol6zS3nFiMpsAD+lwflJ+bsTotuDihEZEMmegvmC7V8nYY1wERwzWZKT
	kAy+vii70XLSKH2h/vXXleXFCxtcbZ2JY+LpwsC/gsecyCPGMdbOY02X6wEC1e4l
	5MMXCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qx0b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:34:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ddb567146so6661431cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556878; x=1788161678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id9aBbeEjT3dXN0EHxiuQDmKmD2lWlMPUfgX2k07GYk=;
        b=gyGccLOFZBk17o6zfOUCx6o6k8Hqv1NrC3nx+Nnjnwe/hmNlV3vU9AEbreWx8I+L/X
         T2etqthBWhNOjE+c5i+Vgzinm2UtAuIwPLt7W/mrQ5DKMZk383sBaolPEO5efIJ0/JYK
         MqYAY8r261ojh6i4OhM419WZIbIL/3D5tO2d3Trare9QDqIxvIuxKamsWU7OpZcQ2fVF
         Lq01P9q1iNEqCUWevuOcO30vZq60W7UYL9veI3aQ3nk+OJx5q7MY+HlYHOxqLCoYIHLF
         cBoevyjAJLsDUiJsy8O83geBBpbITSTi0URI0YYBVdg/3wvX8pITIppDbyeabB9CUPYq
         of2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556878; x=1788161678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id9aBbeEjT3dXN0EHxiuQDmKmD2lWlMPUfgX2k07GYk=;
        b=TK+1ZwtwHY403OCLKDb4JevM+MVUU2wnvGVGSKrQRDp4qWxq/It2JhtbUfVZBn2WbX
         goiltcfFvFdTjecmNyMEkjidvuAyIlil1ZeBtXzl/YnTk+QDJM8nAcKicl1J45yNsbGq
         5vzY/iZDltNTjSSzESD3a/WUfJFPtV8YEbhfw+XO7bxcgG/7yE6NgfAqESvK5MORTqKW
         T64sc8dGs17T+lMxxaMFTJXnSwc3FTTKzBWWADPcEKsH7q6oVx0uHs72nUdCvRfXIZft
         Vn0Z7pbPXLXoRK7fz+c9DbhGHsYmiSN21lWmrbXVasB2ciRJYlbANMbfuMP6dSFfrxt6
         tgDA==
X-Forwarded-Encrypted: i=1; AHgh+Ro08EExoN/hChxH75YlZLjQS/uD/fv4nQ+4/DJSynxd93GBjt7cduPyxVGf7bLagYz9ohDBqGpXbVoelOa/@vger.kernel.org
X-Gm-Message-State: AFuF++mkkfFcdfQl7HdI3fe3B5b0a1jGhg9BEpZ4/UG4cnyE1cF+T+xn
	13lU/1+zFwICdUPJSYe3EVw62my4QGg1IuvZN0o/4eQdoVC9kxJNpoBoWvgqXyBKKdd82HJnZMY
	VMV2cAIN6VdfnqQ0DIbKqxk/23RX75nlPIoU9y8wbEJUH1PI4+tMe0hW9+vY2bS1sfatu
X-Gm-Gg: AR+sD137sRpkXRuK4s0Wu6iZ67Hx1Kwn+VpKq7X9lksL0QMzkG9koh8Ygy3LD7s2U/q
	zkeI+tXcvT40vnfUTEoX7g9oPh4XXVbJNxK25OGQKuqooe/qk1Qd/tJuUFJDP7j6GNHUQ1kQEXG
	REsQG7RK4lY/yJTOkzB2WExRdhq2fAfDPOB5a0M6gLnMD8OA8M8r5nqX+7pfIGDxg+dwgt3CcAn
	FspfYpdpIP3fLRK5sN1VDXiFiCsoX0YwzwdxZ+lMKmrJ/jNaxatHQj7qHZWD69wDINHEHS2lYAk
	D75Ve0w8oGad85HJN+e/sFrew/waQt731bWzCPWLlFXhbS7XbyBWeJT/my+Sd+Q6MLRcgL0ukaf
	mFmhNDEw46gZ5ulDxvUSAIuRE
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr178532661cf.4.1787556878101;
        Mon, 24 Aug 2026 00:34:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr178532471cf.4.1787556877562;
        Mon, 24 Aug 2026 00:34:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1238645866b.8.2026.08.24.00.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:34:36 -0700 (PDT)
Message-ID: <f527940e-a82b-4928-bb0b-efb3a70e9b8a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable 4-lane DP altmode
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-2-f319387fc6a6@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260823-blackrock-audio-v1-2-f319387fc6a6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX9TEHzLe97/IR
 ZCPrLWDv1NhMSykzRtdW88enPXHnsDG0efjYzm5Rcno9FaoFNYLhJSbo17NE326xcbUwJKo8egI
 VooScOrIWyjFrP39X8MtBTE+DTEb6VS0Heva39+njkRzQqT1x2Kw1828RSpaE+fSLaDhc0Ktryt
 u+AGLSwHd9sTFlQRMjoXvI4i9Nv8AUxNxgONhLfmCHqkwRf+S918EkzPwlre2sXqtrPUqps10H6
 ZAhWts4+yTVrkNgfTA9gfkHdvMZQqp2MK7d0OW1GfRLYlPQ+tBE0D9q/W/EpJ3rtXKeF8h0Vhxz
 BLGoeS3CD4Vre4rCKRuv0o/DHaK3vGvWpcByGi5b77zdOJTZCoSTUP84qUVX0+//xyaVUhdGMEd
 KNQW02f44lJJCYOmqVgvR2DQRWvT+R2xfmYcE8pSfmRKVyEllIcepJzJAjrtAbT0i1OTtqlfYJp
 eRN6rWmsbFLsmo2vXNQ==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bf40e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=ppAVgvi6q-cUoYIK1IIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 09LSVU7nPRlbRavyR-qcm7Naavz39l9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX2JCtcJAt/UJI
 KQgvLms8B9Z6vhlkPJTXkVZ5fLU0G2Bf6XZqsOw1lb2U8gHJO1ZBQECv/1q9SpO7/hDd2c2xWT/
 kZwoCmqJZw/67oP8rs/3Iz0IkZfu3xk=
X-Proofpoint-GUID: 09LSVU7nPRlbRavyR-qcm7Naavz39l9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240065

On 8/23/26 10:35 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Allow up to 4 lanes for the DisplayPort links on the USB-C ports and
> the mini-DP connector. Add the standard link-frequencies and move
> data-lanes to the out endpoints where required by the current bindings.
> 
> Also enable mode-switch on the QMP combo PHYs so that altmode events
> can reach them (same treatment as on the X13s).
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
