Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA7403B0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156067; cv=none; b=QKuZGVI/RYTvjQvFweZ7lmRGsT/JMzfiHhxj8/M9DWxvN9vyNRZg3RBd9TUnHvurN89YStW4r2MIQbVdTADGWwDIadMwyOuujHQ04fAdY8hW1haUGmXhP0EFABzdY2IvRu/YKp17EFMWcNUMHg/isXWsb2oxDP/aLy8FWBOSoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156067; c=relaxed/simple;
	bh=sJ2exgGHqdXyhKxtKpJ6m9uWK/d8nml1x3tu88O+52Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1uiST7OnpLpkvkLb/OWwCd3Q4Hgt9d6M7rxs5l6gfzTmNFWRQCWL3RlD4QaZFIXale+3X5Hafs6rGy5bqMc+lEAKKU0/YdVrWPMreDO6RDf+FnrJJeRBB+DgB8pj/3UFToYra6qDI+l42tyTxjz/uGkJFx+mg6xY63wjeXNlgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fH4A4/R9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuYJ7oGB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fH4A4/R9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuYJ7oGB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM85W3322335
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVexUB3agwxAM0MNJD86pBuHInnQ2bvKIduo5SVBmXw=; b=fH4A4/R9uVNkOyRb
	ze2eA7KDFIl7qr6wzP241lLEQ5BQRNWxUTrT0m5nzru3VBkerGw0WPaaFWa+xcWi
	RJC2YnUzty5Sa0U86rAg3I7dAkT1lXt2TThHEcwihujJ97hTE8fjCt5DDON8EGn9
	cw1XH9nyKBo2hdWlkV+zKi4xOjb/BcGnvxyxgU7sVofvmrogCLlJlxM09TBD46mW
	44RrOf7/ltDOgxEeJoc+20QymNiUjdDpFMqPn/eLYUel6a8eIpoSEWYEqdhqq7PP
	Ru9ii2fvZUs9IKVnzrlzcPZgmqr1E6HAnpkhNn+kSRqnLggIdNQoqvv0sq0jr9zh
	JaLZ2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2gwpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:41:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so56011551cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156064; x=1785760864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVexUB3agwxAM0MNJD86pBuHInnQ2bvKIduo5SVBmXw=;
        b=WuYJ7oGBPmLhwxq2qsT2BNAOKKiJXN/TYuISTWvi4qYzlpYbz01g4haqGzmG5P026P
         GW/0kN0XXhNHplQP0+oMnE8lpaMNW8opfyBuYMwtxbyXkmvEe9RbuEzkywi/rR6cX8ew
         H+BbF/rk+kt/QihCbf8uPWJAUyxj2FRTLWYSJg4i3FBcI5nfkehoSLykrpWO9fgF3j/F
         JKiTWAnUHi8clEvjhvlm/ZjN6Qpum8naFtFDgCuWHzsZjptvXhzqztVBJmjN+TyhrnRz
         KN0Rv4UvfB08MIhQak0QxO4BfZzXZBohPxaue3GiT5FLpsfGPV9smjxlWbnZV8FBco52
         4saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156064; x=1785760864;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVexUB3agwxAM0MNJD86pBuHInnQ2bvKIduo5SVBmXw=;
        b=VXQnkuDH7aGrfxEq0a/pGGfI8hRH9ZNs/sFo9+jIl0h69beh3ReBHL+WRbOEhmQ3OZ
         nQtVeHUbmHPC3iMrxt0y61ojqgWncnktP7rMerxuFOc6+cjOu7eXUqQmfvcgY76BhEUD
         EERMaUaprQa2v3WakOM1J0dLy5sSo4L69AHSaCyjeSh8HS04QK13YduLjSfL9o9sJvI/
         CxWWkm3YwVQENa13aTUd4vVoezOduyrH9P0bzR3ddWlZDpv5du/VjDIBzopN81zOdZAB
         PSSCJ8kBcTbJVGD52KJOkNb/SaVrY//n1CfjWPfMylUtbXTjZgcZczDCoDwrXALp20he
         dqwg==
X-Forwarded-Encrypted: i=1; AHgh+RqNC+YOboerS1P74U4SBnSgKXuMAulHGU5gJVdomuAyHgDvyNyg617FJ7SiuSnerr9CD/jVNKXwGRm1ilyr@vger.kernel.org
X-Gm-Message-State: AOJu0YzN9JUlEkz/eG6Zvjd2k2bMS2gm3OgkNV2mbAmTyRaSzaHSQV+g
	Iq1J6ZgvfKZmwLGWUpksu0MGXuSnMejjIiL+k8Oz+fbrL4TtkrdxaKMB3u3mMgZYAHZKn2VbxYu
	phCdShcG0YXWnTeNxN8HPCyPclZdBiKepy5iO06mF1tb9lgviM5GxCOQ2QZMpMmXScXSx
X-Gm-Gg: AR+sD12BwvMR5TI3k9Cgq4olRyBWelkZCBi0L6T58Ur8KRsrntshAFnr3bEOwErqBRz
	8QTmImsQ6FIlHNxY1/kK3A0JJ/RiDeFHnVENIV5gaOk121+ZmVRk/Ukf41OtoFAX6MyIekU0OCJ
	YKP3IB2jtbnBPyFarQv09v2vT1/FcNk1Y49wWjjscRLW+3ZRIxxJEkuwMK8GOugYhX0iNIfQreI
	bP43J18TkKQ7Yv4SzyCCSOMVa+mhg3ihGUPusQ/GzGybhr4Al2AUO8YKNxRbdOKuOXF/noOkLFw
	6NEdIMrmVBvP/5R0UfgGD6Aq3/eT5lrEqAVeN2opXwQwS58pGQZnrc0PchgSVjO/GrYNOO8XISB
	vJ83Hop9CGEjPjrjJySfM7IEiXYU0bw==
X-Received: by 2002:a05:622a:38b:b0:527:9603:8121 with SMTP id d75a77b69052e-529a87193b0mr75783571cf.64.1785156064273;
        Mon, 27 Jul 2026 05:41:04 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:527:9603:8121 with SMTP id d75a77b69052e-529a87193b0mr75783121cf.64.1785156063546;
        Mon, 27 Jul 2026 05:41:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac9d79sm626768566b.21.2026.07.27.05.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:41:02 -0700 (PDT)
Message-ID: <e345ec9c-6496-48ac-b4bd-8e0cb6b0cf18@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 14:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC and
 QCOM_MPM
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
 <20260727123141.7loqcpcnib23hcgc@hu-mojha-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727123141.7loqcpcnib23hcgc@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNCBTYWx0ZWRfX5Rau+N2KhDTu
 1tzRh6ZB7w3OJky4Y9ZBUVgIl7FFhb/ggLzu75cUZvbCsLuzIULD+TMnnIz7QPw6VOw0dwKS3IJ
 lELJeaV9UlQwOzJYbNUOOeS/J3LrQF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNCBTYWx0ZWRfX/zNssUA6vWf0
 q2wxhTNj4U7dmoZ0WpaW6kCLBnTew7clGXDj/wBoz6vBfzz4Q6KLXayyXHWuhOjR09GGifbD35k
 ezQyH7K7wbxvhczQmdj1Bnt4NlOD//eL9NvWeUR0W3PlzhnQf8A8+n/8hmuezJxCDVplGIbKxOy
 hLKyRPMTUylHY6W9oZicTh4VNenYZEtd8UcvQ/EjHZmZl8OV/0amQ/+1YECDzfZtyOD6JbAAaWC
 B8u2L/hQb/Zve0TA2hufaAgYa544ZCrgpLJfOB+d2RpOGeoGtl4BGTHklsZCFrho/b1KFXmipdw
 uiwr4qRRcXZ7HZ3hV0PyNfhWOUnCE/KR8XGiJSBOilnd6AehBEkoUSMkddH8zmE3ZAr/a3f4oZw
 +jTeodwNGjH1NSR0J+U7ikYp2R2xZZAvJ7HJAB+CQz8CM+THrHPs13VA+yvYEZQ3nX1ezrDQumf
 51+XEaIkIDWwAsfCMAw==
X-Proofpoint-GUID: WuKllYl177o3GWUiK7m6jPiI8y0JFTUx
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a6751e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UPCNcHXCk93v0Sf9j1UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WuKllYl177o3GWUiK7m6jPiI8y0JFTUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270124

On 27/07/2026 14:31, Mukesh Ojha wrote:
> On Mon, Jul 27, 2026 at 01:44:43PM +0200, Krzysztof Kozlowski wrote:
>> QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
>> should be compile-testable.  QCOM_MPM is used only on ARM64 SoCs, thus
>> there is no point in proposing this option for 32-bit Qualcomm platforms
>> making kernel configurators life easier.
> 
> QCOM_MPM is used on ARM32 bit targets, SoC like mdm9607

Ack

Best regards,
Krzysztof
