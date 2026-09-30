Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CB1485500
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764415; cv=none; b=aTcna8MZYJppFlLvkxGno0pC0hH4E1eNbSSRldeEOA7f7F8G5LFIAt/uswQJ9ZrIm8TNhFoHENn7Yw3C5/05leeNN+pttC1g63n5L5O1O44AVIqV+l71H8Hs35Hk7F7FrOieqXkZVFcesIXRMcqhrz92ao35xDF86TakcY8ittM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764415; c=relaxed/simple;
	bh=0M0tFS47N7lhZMQSOrqoFXZxMcxobRdsn1g4U2BMiNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qu0e0HF2DgLMC8EtQio2P2lTJ19eHzpZGbi7HiahuTo0fmg6ZG4prKzBZT+QGNsCbLsXmbYmzAwkkSfDmpKv/IewPI6O35V69u5h0pmsGbyppoG6U7j3Kpk3Yzj/0X+GHxyyzJm3z5OYVsUS98aiws0VmdzBun9+v9cWHztr/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8udcbDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHlKVcUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8udcbDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHlKVcUo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dKah4047186
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2GcS8YJdyPJLvcVPFTZGMq8aLk5heCCS7anZ9DvINg=; b=V8udcbDJH1dR1GmE
	KPLYTwcnqL+aJzbNNSzAcft/PbbAehAai8PuiNN1CMt6pSMEJofITZEiao6jY6t7
	353MfrvlZmqA7vmUm/zuP2qvuRTDegn/nvrYQSM7vhR/CNU+hgY7uFYGwVWL5mBt
	Y8X6I/fVweeICo94DElyFi1JQL9ddCTQ+mtkkq9PfcIZbVWpv9tsa7aRChuMQq4X
	Cv+2tO0luaVqWaxJO84Yl5/rlEBXW8/elP8ajAQpnokEyDRtQftVMTK7jNPlahFm
	g92cJsuMCYPZM2Oc8+aFIWojko9pJ6cmuhTXWuSwQ6xaDYNfnaSMvbGFwjBM78sa
	vZGDvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfab5qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c9a1cec69so26831185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764412; x=1791369212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2GcS8YJdyPJLvcVPFTZGMq8aLk5heCCS7anZ9DvINg=;
        b=fHlKVcUop7R8oo1/BFtXs5vDN03Ry8hKjcdlwucmEfo1qC3C1PS0bawx9fuzDXtab1
         VaF/S7TYafI8sNvgnU+wh0T78Pf1G70LPB/bh64AnzcerxFe1y4lfYp/aWzsFioKSVmC
         90KLRacCpWuGh060dD7lIwO+bA3iX1RPO7rvXrzmmjevzFpY4Wg7RAcSb+3SMlp7uOvV
         I+Xlkr6DQeb1bxpWGaAcnrDsC/SVBTg9iL+WmJzEWjjLO9v89C/smKlSsiFkK3fR1MK9
         4oimzya9HYFP0bQsD63iefnYpeUo8W9vk2ph4sMlvnLh54jctn3ha3KCVsHpIgoWiBcD
         sReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764412; x=1791369212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2GcS8YJdyPJLvcVPFTZGMq8aLk5heCCS7anZ9DvINg=;
        b=bmLRMYckInImXy97yQ0UpevSQHUf+jO1UrnXldy8ClRel1KlYw3KgsE0qWf18dzph0
         zxAFhCxMpZAFWFJiXBSRXQz9AFsZH67rknk2MJ54GXsntQcVNDLc/6ihNUr7USqsQIbw
         5lTSXT543mzIylhMFdQlMkyWrZGcI61l/uJIjnv/zP5ILu6uv1yyf00lXB3LoJZLvIVz
         RccpAUjlpFymOXRgtV/6I861Z5ZK9DkqYo+2aEPiokqygif4aQBRjuE9x6hJ/4Vrykvy
         PRHQXrXlnll3xoz4HBPk0Xom8gXS2RltHf9E7nz6p1t6FbIKL50ir26uXMFnvXDL+mPH
         Ewrg==
X-Forwarded-Encrypted: i=1; AKwUvBw9+k86nzml1Q+TV8sKpQ6F5fwtc+ojKjzzRyFLQBSLrGUl6TlqecQ6es9ndgcuhs0lyhTqeR/7yEw1qGNe@vger.kernel.org
X-Gm-Message-State: AFuF++mvmBsfa7AcMIIuMPg8Hy4j9jd0a2CUnH6vUpMG/KCikW6QXNCQ
	MgUwm1tYxUwuM+/IDAaOoErApR0qDYntTTI65slIJDcl9+IQYeH4eQcwyyqpYuIUBgH+WdBR6Hk
	06FjppQyySsMNbi5DsD5O+HcC3VIcWIuwOgC/voxpr5AO8RCp1izxVlBXNL9s2QojJgrP
X-Gm-Gg: AYBFou1fwCyzbWXLBYYAQfoHS7cfMcBhjITlxa+PYr6PlqQhRsTUD9r5fCnkPLR0t7B
	9uFUBPwSwS3NgfjB8EW6lCGtTCGutr9XvGgx4yZNzhnP2YLNP8YFDNTm5wYO+vN+IZ6pjsoWf7S
	9Xy4LVf9zHjPx1bohhtNNawDIxy1q9s5ZEDPNEi8FbMfYpk0lTW0IW0Riw1ELBZyOU+5fiGmueV
	F40iDEEP0AF61miKbXwHuGwJkv/BIbLN0588CayUSLkHumjPyPNEBojO4bhiUdLNddZnWrriZ0E
	UWssMPpq0UAQcwoQ+u+Orz/+R3RjGx8fALvMbilgvq2NwAKiev525mq6y6XDGpKYh02SiDXxr1J
	3fknH4UJUZr3V2GQDNW5sgA==
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr132042885a.0.1790764412129;
        Wed, 30 Sep 2026 03:33:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr132038785a.0.1790764411558;
        Wed, 30 Sep 2026 03:33:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:30 -0700 (PDT)
Message-ID: <687c93e7-4ac4-4a97-b139-c1bd257670ca@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX66byhQkJJ4Kl
 qc1GSiIe+jiSRJRr63wd8RqkAOEUc4oEY94hc5rR4IWwtb4ckhxe2d+IAWMJi25xRMJij+L5AjK
 UriZYaLG3g/dRpLAjxo8gdvkdfIkZ8q1XaNrsQY0anFR+gH7tE5qlCliKyih+b2zkTx7EL6Kggv
 l0p7RwACVns2VLBz7iBz3VdUPnADG1k2Z84DAZiJZpOXYZ/WUxQXUMe8lU4+X5HrfVX4RZzvRXf
 7e8+IhT8xlNUzVb+Zq0n4kWeCKkx+bRCPn3AniKgcERgpSC11b8XRR0Pet5GPB+/C8e11WxM+GW
 ifxLBVW27hK60H29dGch/li9ckTEaZ28nKqNEK5z11Y46y1YEaRcwDOdtqFoiplP8JDFN92uvsw
 SPF3YiD/xfw8NgHArcvF9mCHERLwZK9SIAMDU2aYZ/1Cm/wz3wfZwrbfiW4a0owCgDyM0B9ixGv
 xBajFwHcF8ql2G2KyxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX8yKtUkiIZCYV
 ythbdu/lssnd4H/K/H3v/ETrgjTMX9+nXhTLp2oMs4kfRqAWQjFJN1cwpogt57JArE4d2W1e6uS
 YTIUGv0HCHAfJUMvMw4EbQ8TKJXasiU=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abce57d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tEjpCP8_7dmt2C2dGfcvry6-WTwCQZba
X-Proofpoint-ORIG-GUID: tEjpCP8_7dmt2C2dGfcvry6-WTwCQZba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
