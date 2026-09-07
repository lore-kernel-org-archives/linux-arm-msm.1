Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FB411693
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771471; cv=none; b=pt+w3aPblkQ+mG+zobl+LtDB+pwIxL7R0PQ9tZBOnFAVg61k3FYk9vri8ycZ6bzvVoIqBJRI7jPDvamxZuZIAcU8X+etUs30lCMxAlJDXdrUtLeNy/sbaGqQC0QCt9NaUPUN5NsBma3acHwPQDs7AabhhQZM+yINighIodlAI2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771471; c=relaxed/simple;
	bh=4aJo18FHRehxOaJ9Xrz/eMPUjHWI1EAd5TrqCQro/uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPoAgzakYM05nCrIvlpcbkhF7p8ekaEeBlm/9kycxB16kBa+mJnM4TtjDXUb1ADsH27IcSy6vqS+Kf/RR0Q5VmJ8JvrVXlUHyw6FxsbQHNoieouO/N1Gy7RR6ZCym2mKMJKOLax/yhPPnT2mQiMH1zwxH0ZFvpcGz4BWT8+KNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VodQwFKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ss15mC57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VodQwFKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ss15mC57"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877osng3657422
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=; b=VodQwFKP0QTeSldL
	/q0gfonYuwP0mM5BVL0owLZY48r90M3/qnfaT/q4RQUm/a13DtEYF0PdSjPcT7It
	zz37vtV+WQ6HMYcECE1eIks/8Lje9LG+01UUFr87TPWg/HbwqesGR/u6P1puuWH0
	sMn11nWQoHBrhfZNSDJdV/tvl+taG60Ao3eWx5xodyCME73m0gdw+Qp82iE6WV8H
	0/szOMJTTgP9E3QNUWspU1OhmuQtJsdPoPcWOoxdt4EG/MUmrJ/amcNMokNuXT2H
	4soZcBsfXZ+K11BMSeRhl3bFLO/SYKTu+Qzj7dLvSJjyUIdZrFNgTpRbLlHEW7Pr
	XUYmEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r9fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:57:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8e3e6ca0so8012756d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771466; x=1789376266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=;
        b=Ss15mC57QqhGUF0wLGi88JFttcx9TpFfMkaiveoi6IrVtnuNTROp6IT6Xsv/uOdIaW
         pF8PO+ikKb2qSYtImJJj8BMWqVdV7m55e2+zvAiDpLYJ9qGM30/dlqZUOW2oOQQFY3EE
         dkFXCtErlznlPwEC5gumhocKjeuABvh37KJIO1Aun7JzRJOD4yGSdyI7aLC9TcRFTCRg
         4j2VbUTp978922kHV3sqc9gDQQY5NjJoUPX0VyiKck7rAxRXGMM5vl0C4heppKsofT+d
         zEVMK8gbMrXEq+K6VkARup8tZgjbSNHgYM0kucoe5YXy7rOo4WLdNzuumpkPfxuUBsb9
         ba9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771466; x=1789376266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep9eaOqym9ehNhI9a6w20x6DXgxHjQXBK+pWd1Nl2xk=;
        b=i7gnOgHNyJqi8RapmGhU76XscOKNbKMXx/tFqC+8HRLadlES7nt220T1Jp7jstV6Ug
         kCTG9zrhBk9tEuClqM3r9PCz1xJk7AubE52Tj3/aydsj4Wdrho10A4h5x7RRshe7D7dt
         uLVux2m03QT5VWsA0MwD9BVoL2yRaiSV+FUZ8wvykEAHivHk2QoR3/R2tb/HqfBu5cFU
         WwQF5hqo7QhqDNUGYTW44BlJxN3bDZnEgSPu97Ftl6URGCW9k3RAwGx/Qun0z1EG7k0S
         d5DhhJAu4YbAEcR+VBuTfEkNhx3eLHGMiFgjCVdP1e72GJVpXis/56QlcF3nZXpirLUi
         brog==
X-Gm-Message-State: AFuF++nSdddVNIezm4GUy4+KLTHmezYaGX6npWZtI1v7i58BE0no1CZo
	MvsVNSbCWXtdNzwVRmjXNWBkgREakE4lBtdPQu+ckUpkJNFXQxNtVuOckZBsJWvViX7Mk9p9C07
	i1bvd2S9YxhE1Q9yHXlXsGSqfGW9urvwcFx/8Z6FVJAHEOqRsRTxDfkRx7YFLLCuiPgLZ
X-Gm-Gg: AYBFou2lSIC6v+pIRP5I6b/uIDc0j+l7L9smCM7zxYixb6xjCmHJL7l9iYfiuyNZyJJ
	4fmf4JjLAIjDKPJmujiBqsJ6TyeoBTxHkgOMhat9lSdoTTCuVSKvvISkNx1Ib7636IEs25W+dbu
	6hrzMwybmFiLUKehH4Dma+2kE0a/e9vZ9wHTEqbLzw0OAafNc5tfwMUudMv+cA5b7I47ttysg54
	NJO5sWbvrjVRHen/Gq81LgsenA8No+FTUKr4gv9YO4IUksr4MrIsx7MRqlMcDu5AnURXQT4SIs/
	EWwLrRIb8QzmSkAd7sG/mJXUovEsbHUnIW4mCUsPRIsTow4dJD/gXQ0gFS7sstq8u5QuYtEg41S
	PHGOQuNpG5PJptz+DZQjyZQ==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160798685a.2.1788771465875;
        Mon, 07 Sep 2026 01:57:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160797085a.2.1788771465425;
        Mon, 07 Sep 2026 01:57:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8ba1sm428317366b.22.2026.09.07.01.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:57:44 -0700 (PDT)
Message-ID: <a8149216-536a-44c1-a981-54ec169f07c6@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cf_YEmriBdMfQAPUBA-yr5rOlgEoqWrV
X-Proofpoint-ORIG-GUID: cf_YEmriBdMfQAPUBA-yr5rOlgEoqWrV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX60gyUdQdVwFf
 zExNg5Eey000VZJE05/jJqGpsysooiSblVUx5BKPxux3mB/YNGybyDk9zVtFLZDh+hQJYPe7VIA
 Cz+qhRnLcj+wPXWQ00Z3OMCoHzU2898=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e7c8a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=-LXEPugmIqj59De_QcgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NyBTYWx0ZWRfX07I9XP1gC+nV
 ZaNcoktsXV/XNUzzvFY+/J7H3iNvZIqkVr4AtD3IElm9Hgayc9R/GY497FCFBXFBOxZ3kX52D7V
 v0gTei7amcAOgx5rStmeNmtsSZF7lvyNapRkLz9ozUd0htG+Zh/Kt+XoVR/2uk0dzgJ8kHqxD34
 48EuAzWEOZPVtXAweKnzjLO56VnIy2JpwFqQsy4ZmbxWkzy/DssZKS1JjruSdhiTh7f5K6aqLCY
 4OI0YF/3oirfm/+jxiHaskpaz5xZL6npE74NFeAUycA+NfBzJNQlg4kMaIxKsFKaetuXgVJERCQ
 jGena3ZN3jm3GgJQ7T2NFCTTEAVHu4HJDHC0bWEK3sTn6vW1WSSOQ5XF7prArzmK3SQ9V4LHyKB
 Y3x1Xi+3BBTzAks7bPUW+uTMGZ5YFoMd9h7q+LDPT2x9BecN+H2A6gP9L193raTj78tk8iUbzP1
 u3sO398QMLjY6TAF8Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070097

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> chassis, different silicon. Stubble and the DTB loader need distinct
> compatibles.
> 
> This series splits the board description into
> x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
> keeps lenovo,ideacentre-mini-01q8x10 as fallback:
> 
>   lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1e80100
> 
>   lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1p42100
> 
> No qcom_scm change; the fallback is already on the allowlist.
> 
> The remaining patches fix the common DTSI for both boxes:
> 
> - Build the Hamoa EL2 DTB like the other Hamoa boards.
> - Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
>   is required or pcie3 fails to probe. always-on is a hack until there
>   is a real M.2 power sequencer.
> - sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
>   onboard mics, but it provides fsgen for tx_macro and rx_macro.
> - usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
>   usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.
> 
> The Genesys hub is left undescribed.
> 
> UCM [1] and AudioReach [2] topology for these devices are online, too.
> 
> Tested on:
> - IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6

+Mostafa - is that the board you previously poked at?

Konrad
