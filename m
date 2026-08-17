Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C23B8BC4
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953058; cv=none; b=KKkeDV4gX3IYpnIOYPuxyl2VkV2A6qgAE2jkiVRTBC0vSvS1wAcBh48e2f0/CpWngtF7wPysmlzIgk86d13dIAhLl2CRYRr6qv6ZEPWAP0nwgk39uYJcYXJ4yLi9NXxk3X+80cL7VajysfPyghgxckankLEjCSeeaGw4b3JCmEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953058; c=relaxed/simple;
	bh=iJ9uTyPx21Ma+AiVc9vFSRd2u+j4vmvxOrrrn0JpHZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Es8X9qjX1QfrpWupSxJkyUu0nZ/NBrv1frWN/gaYqALsCbhrVQG0YtyHUQyCOeRTJwkGLR2zNfLU7xMbBEsarmS1ZzGTiCo6KAZpLAr96Eii3CSimLED44YMokwPz+KQjqJT2kmWnUu38ppQb/Gaqp486XmKbTXiJ3jT6Pao0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPguLK+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIoYL+GU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPguLK+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIoYL+GU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H716kp162592
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbchPXr6LQ5dkGa6qhJAuWCOPufUJKyI0pw6YyA24A0=; b=aPguLK+1yAiq4H5B
	hx9JtXdyJfi0j6L2bQv1yibOXQ2dZsjPQi37xW0lRFMgdhn/Cw6hrkVbM2o8cV/E
	XmohjoIW8qFZkCLx03Jg7R8Dny6AQKsLtilE6/qdGAFM4Ekj1Fr1H4Jp5SEVbCKu
	KTZWDP2NCYZJ+YqtK1PGaWFOTb1FHeZNhw7YX/rJArSEAeFVypZQPjelv6Z6mJUO
	hNhGJd2Y76Uh2PlrYqpe9ZSuaS2g/G6mWcZfBuiSQ8K8ksdDmocPa9kox43MrV/Z
	RNzUM4rD7DJf2oqGevK8AuQx9tAL02gBpGvr0Rx5bZbOt72xCVrysnUspcxZrOve
	df/npA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5wmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:50:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso9006881cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953054; x=1787557854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbchPXr6LQ5dkGa6qhJAuWCOPufUJKyI0pw6YyA24A0=;
        b=kIoYL+GURekfq9nn1QzRqa9MBtpvcNXUZKRZCCol41Bnlmn/+eLVx0MY4GCVmmNmRc
         oOBoKbCvfyktE0HMZ9mS2RxgttKcDuLjsioyUMsAesA4GesXOFaQgRZ7hzABfT5/wegV
         C98h7FwNskCIel5Bgoo03NT6S7w+jwvnycTuHxQDQsiBcr+eB1fT072CJKUywvlcaRxE
         NApg9MrjENMd87U2U7OMf6TenWtHFYCptIDWhG6IqT2GG/osveBbts5OwHZCDcIeMa8u
         x/Ab/fgMSAYFqrYqrcB1b04W3llJdtgy42jEP+DeHSUkUKfa3xukrFIujcDqUlSroa70
         wtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953054; x=1787557854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbchPXr6LQ5dkGa6qhJAuWCOPufUJKyI0pw6YyA24A0=;
        b=ZLnGg/RkmT3Qngq1nM8vKyBWaEpoECHrNkyJFswN2PVWt/BQaQ55fSjhTVfNJYqjtr
         7FqpIQkKQNeMQQrSC2ljKlLFByOeMHJRHQc7UG1H8/QCknCqTP/k3en3ks/kz/4AqFVD
         gGOBr6EYiC4kVAmn3daaovHrP1qKLvklDSUCrk5DZxWU6MzqUZtz6EqAmYH3UqqcL9W6
         CjaDFu7fxKE4PWeMV+2FXmv08QNyasJCFei2+vTF0EcMji4hXHj+CiwZ7XLlKwVU+T7Q
         lkVbgxWQep/+MMGOisf08vUBQKEskGCmxrz34+5FK6ug0SWrMSTVzttoD1UNFgdrQJbA
         LIgA==
X-Forwarded-Encrypted: i=1; AHgh+RqSqekGdWNCllK8/SvQX/pqsK2rnX+fMXkLQL/jwS8U3kqnM846okO+KoFumMK8KFgleMmKsx8V6NJQn4zo@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1fpsTKISJqbp9gBHvI0ayu/fO3xAcJn1KWYSmHhAQc6tEeiQ
	f5MqGVpBxVRTS8Vh//boPIWH26sfboK5dWEs3d1AH/oi/LnmkLIf3G7UW/KssFgJsErwe64THG7
	zros2rAjV/swddiHejRZ+Y46BSvgKMljwn77NxP06CBnFcM64eB9/lKyw+n4FuEAhFEXK
X-Gm-Gg: AR+sD12Kv/32Zw2J3M3VfqGnc6YCxpKO6axQGxuWiLf3U5avIhuZDx0RRmktPgLhWEw
	iIFAPprhEsRVrZYw+ve+eYMpWzi1jYwSsEUCbLK9mM6BrRwa8cuSx63dY7M/5EGXcX43YcD7Xv/
	2L7rHtOgtk2i8MSY4N++M45U9GoK5YjYWjWBaAmjbWxpb83UaJ+zgC0w/k5HjzOPnHE60IIB89Y
	vPbXGM+/unWXGLj6a/EoVPntQ2Xyqfhhz+ZSYAEjdbDO9HkErUmaakn6IkukW4FNDOK4BWzqd9S
	50x0dM3yfbdrVfSmXo/AeBuAgiAWDhysVfzWBh92lgxp8pemNMFRklV3w/XmCSotjIbIkfatfu+
	Wnx2+sVrwhlqd3o+kmKVXIr07
X-Received: by 2002:a05:622a:11c5:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52d85333bf8mr183797091cf.2.1786953054551;
        Mon, 17 Aug 2026 00:50:54 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52d85333bf8mr183796931cf.2.1786953054122;
        Mon, 17 Aug 2026 00:50:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85173dcsm314100a12.3.2026.08.17.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:50:53 -0700 (PDT)
Message-ID: <e5cfb9fb-d4fd-4563-acc6-9b62e9c95ae0@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, imx@lists.linux.dev
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-4-daniel.baluta@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814141724.1006382-4-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfXy8vUZ6Zd8rbl
 x7q+2xEH19SbJuKq31XMIs4Qb5NMIyfgGlRchT6C3YDh7WrEryngTwxC5Yh/75bVdz/Y/XndmWg
 SjiPjL0xWdH34Zs2A/odBRNBhpeCRRM=
X-Proofpoint-GUID: UCSY3-z2YChAJjIyxW2RRZL-MAcwRn6h
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82bd5f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=czfsfouh4VKptltzzNsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX1Lsp9IYjE+wa
 flbgv0m1k7kE/o5MqE1SOD9BMUnVL7FBgvky6qUmxiTyNDbsxYi/Mg5KadvjJ4YAbYvI9KZlSVx
 xS4AakyAomAtOy/vbUsDQFrTP9MOTEDt8flQGUlpEesrxjsIAGFCdn1oI45ThEsdw+XNmdguBrc
 kr4SJCRrKRrY/jpN5PiHGbRBwv3EkOQCACGiKE1aaARr0h2Ttr9gAP+ZBG36ZeSnClc/0fgTAiR
 DIwl1knBSE105/UIGz87miI4MfB21jEmHiwLr2A4UoVbbkr945x19VYbVGyQXxO7Ef850hJikBX
 zEtw0BK0rzx5r3BFk9hwUIEGwWWt4CcXzBxbMDl5NqfudZZy35A067SXTANv0axshfEPRrh49/S
 6ox9SQFjOxHNn9t03u00lmGtpTq1RF0/hTfpm0gl6A0L835lzE8O5K3O2IjbplKpOGCpIp3xkIs
 1nCceAHCnGFHjJPfE2g==
X-Proofpoint-ORIG-GUID: UCSY3-z2YChAJjIyxW2RRZL-MAcwRn6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057

On 8/14/26 4:17 PM, Daniel Baluta wrote:
> ubwc_config.c calls qcom_smem_is_available() and qcom_smem_dram_get_hbb()
> unconditionally, so QCOM_UBWC_CONFIG=y with QCOM_SMEM=n fails to link:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
> 
> Add the missing 'depends on QCOM_SMEM'.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
