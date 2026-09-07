Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191744161B
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771353; cv=none; b=DI3cHj3XXZaqqXlyHthuOC4ngLjhO8Yw/O3YRRVDw5bNXh0Rzs7G3pa96Lq2C75rnWPS5XfsinjVCzrBWfq/4OQ1jCVVEgmSUKCd18tmEtrWyxNDu5mcUluu2640OduEPqx9lHp0WIzqshX5+ZZSvGaFi5Qw6eoCGxS5umR/p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771353; c=relaxed/simple;
	bh=XOzHawz5Dcjn9dRfX5rQQlpShEe4bIf6lApL0IJkG5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFbokzekcrElKlc+JCViGNn5Oe/EbQkCpw/suJfTohF8MU/xAwxJxKKLpvgD/Q5JAyLmcjPSjQt48qMCn5X6SJiZFgyL3YT5einNXEHu6WZ7Omp6B1h55p47/0lTE8SqodNNGNgz7N07vtKnMfOc5wm7SVAqQJ06zm2FaSOTC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu8E79IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPmqJVne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu8E79IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPmqJVne"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777FX92838621
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rY0PTOhwHULU5ZbkRZBDsGrM086IAdUSUoe+e5W3bY=; b=Vu8E79IV1Q8Nm8Xs
	27AaE6B4uH/AumL+nXBq2HBK2V1JPYGYDsjcKkC/DYIN63KX+HSYIQ4CrO1G54mh
	onwxAtmR0z87l+x8NU2jF9QjarxbuZ4zdTjgb+10AyuNKazXkhsC/LsIbl8LFRgz
	KnqAwKD4VYlK/iCFLXNJ+EeoAC64Fa9y1Il3tgM/ug7zeLG7TDtiqWGDONJSj4ps
	Xj2W3NXwbfhXZQgl2kNpW3g9GezFg2rZ1ugwl37zRBVldXwdTgBQySpuM84au+Hz
	9PBJQ/yFH1h0tH52C8BGvQj7TnBzQ0l55tiFpMzyyS1b0Orx9BwxKRzPZlj6w1h4
	RONn9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuep34a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:55:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso7273856d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771351; x=1789376151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rY0PTOhwHULU5ZbkRZBDsGrM086IAdUSUoe+e5W3bY=;
        b=QPmqJVne+K8Il7+7RmfIwXwfTk/KpXeYNdZo1a9MOYLwDlAfTEE0zMmemIWa4f+GOJ
         PTojncG8ew8uYg7K3wg3lGs0GtxgDyJkRglYyA3saPVrJg+Xqi7GOTMcShdpYWz7Q81J
         Jdsz5Oy7LFoX2FaO/xR7y+GBH8hmEDvBcOqKFs4J7vYBjS6/aGfB/NPrx8gSrCryh0zl
         A/OFqpeJ0wUYtlAerxs9rZh0lH/pNBSSYn6DSIR0FVHrH0on31IkW2INK93CKFy9As3t
         pZj6Z9zrx76OgWYxQaNyuN/C0N5rtooUU0u03WXadS5kCpSx7lJ6c6b8EDIhqZILY7a6
         7D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771351; x=1789376151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rY0PTOhwHULU5ZbkRZBDsGrM086IAdUSUoe+e5W3bY=;
        b=etddQx0kbJW0cHotGOIFABPE0Qd+WWR7kEvp2H2ltxfOt9npcVUFAKoGMIHJmlRiJX
         kwyJeNZguMgYoWodQ9PyCOkc0bKXMbt4UDjOyfDO/oJbGLYhqxOu4dbsX4wjnA6cL4ik
         VXO3A0IPtb3MjxAiBdzdHj076libpbku/gDck1xXalX+UIY87B9Rw5+YXEA+ilyYIsl4
         eSufvs/haBTLiT9+WXZWaEoJQEudD6ATGbD/nQvBTQuSLO2xrC2NFXRl4VtFkjgfK02A
         JTC57lhhrK9C7ivKIA7Cch86L/nQ58o6WRCwMkCjRocg+GYGhTGw5fknTwLvFLhaw04r
         gtoQ==
X-Gm-Message-State: AFuF++mCwdZLSAjLyvCWFlwP96saKxI9KfVIppuSRmZVzewCaBHO7zXM
	1f6lk0cVd84nUTqrvOV8HK05z2AhzrMk2eXQLTLTLmRPUSlb1dVpiJMhPNbst6WvVkbxUhimcr2
	i13Jcc1e2m8RpCyqSV/Wn4Q1coXmPR5YmJOL+JKbs+U8VB/6HIo9bMWzTRUiqN1u3vNGx
X-Gm-Gg: AYBFou0g88hPHAEwnjiTjsSN877R5ed/zqMLZuqR85bRb7hZm0BOM9I0In+ZG5oaEVU
	kIfVNI4j+yihsP9OTpahU1T7Fhb41IJmfJ1IzaN4HG5NAw7/5glP9ZJodOP7ETBEIP5HUYyZAGa
	n6y3NJde1A5X4RdINtWuZ3MpK60D/UA1ICvt6nKRDN1IfGsdMcn6u0vpM+ZstheNGOZHKFXk+lS
	GXbJXSgAwX06uRn0IFlrw63Yr37Ui7rhlED1Q1QmYlKRM9fyI/4dkDrFfQj8rrxdwk6DEVoj32C
	31NcLGshHTyUoPdPx0BHXDnlaNah5bHs54f2eiVxOYJpI9kGNIl5QYbgdndASje1I3qy6BcBD5k
	IK1UQoaGiBVmXEy90qvuz2w==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160420085a.2.1788771350627;
        Mon, 07 Sep 2026 01:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160417285a.2.1788771350124;
        Mon, 07 Sep 2026 01:55:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm436417966b.34.2026.09.07.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:55:49 -0700 (PDT)
Message-ID: <1db9a798-4935-4fe7-a2a7-a66791e75a6a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: ideacentre-mini: Wire up DP sound
 names and VA macro
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-6-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-6-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX3Gv/B0uJT6YQ
 PugTbtCF1XVaRl2bB5hAKIFJvjYRVmk3dEd8yBoCs7z2qsiT2OxPeSSdBizcY1JkQo57nOrDwcV
 Wboa9ptjsh+5kuDyHoLdOsJpC+fN2DqsYjQFXLfP/bPfZkFnRha95BVldNnbFYs5ah7vAzSHIHN
 de4bOKFMmXVhydmBpahNGrW4bqqpTiiJVR0wTx4umyZqmbWC7zNEYsZsfnRQrXFM1FUWreIp4o/
 WxaEMQnsUhbFZQhPWi+oFQlXsW53Wgj0l6mWiWSIMLDX7+gkoVcprUPTr4Duct11he9pgbN4yyh
 CTWoHNrGX/qgzmnLPvZlSkTKc1qE9PPhz/1FSOEpAN+YAmZVGLaylbxjDe/HGZx0wRFn/Ujz4E/
 gJtJBlMFp8Ae9+eLk0rMkXMqnGP8l++p6+wuhw0axitcB4j/BDDxcGGloW+5MA9nTjEyWe3qcHG
 aowEQyN6NRcWOR8XXIg==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e7c17 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gxl3bz0cAAAA:8 a=bNFII6xwy7BPjvP0o-YA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: -rdpCOc55q3szfY0uyb4R5Fzweb3_qXG
X-Proofpoint-ORIG-GUID: -rdpCOc55q3szfY0uyb4R5Fzweb3_qXG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX8vKUw0bBcBW6
 1JNeiA3R6bSajnK4S6sC0AiJuLRDq8Vxept0y/2J7+SSRe+aq359LbiySjaSu+80ZBKyGPmsiDS
 bcsGGJ3p/J+evB/EHaW7r/vtHb86q9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070096

On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> mdss_dp0/1/2 had no sound-name-prefix, so the three DisplayPort
> backends were not distinct DAIs on the card. Add the prefixes.

That's now part of the SoC DTSI

Konrad
