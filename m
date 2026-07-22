Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E8F204C3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726276; cv=none; b=Xdb+SyRxPKvx0Cfpofst2H67JFbo73m9PtU1RyHeNWzfcziVHoZgkTjmkpNe63Cch37U7nuCzg5SjBHvEBhqTMBDmxMm2sQO4qWhr8TdcdQCLWkDILtGbu1AOXQ31n1WLxf0PIZ3cF58sJYi5SvFGEdSwUEePcJymuVYqiDGL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726276; c=relaxed/simple;
	bh=sh9ZU5Ncc8RUC8V42Rp9x8UPi3xY/aC/ruJVJxi2z8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC2uGILGJFaWgdIPG3Tcf9vyt+OXH745vPPbD2m7vbyM4yrta8wxq+yHbZXVvKqcSUyU8glAXqWmBl1oS2yWKNjtVDUkvYs3cwtpAM0MYLsXEOtilc9kujaf0+Xvmpx1m6WfsmFlWzEMLJBcT6+wRB0AXcw0rQ0dVMwVYVFHIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqU5K5hl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtCxttDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqU5K5hl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtCxttDY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1UET573878
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f/z7Vf0CFs4vDGQLLJUD618C
	7Uy9T9x3H6mGeOakJz4=; b=kqU5K5hl5hqAHl193dF9LYbBD1n6i+hH+eRENipq
	F/kc+RwlgKLOjraw99yyeEPx/Nq5GbVaQfgg8WeWn/Ug+vXer9jq11xaazD8fMh9
	KrbQGTT9vu8Vpfmjx9VnoC+6ESAjtY4YpZJIuUYUrvIYXk0Z1+zFuGhkOd0NIaTT
	WxWXV+VmVxDCfvsbEjAshb4wjZyK6K5wIGIDRH00cRJDVQHrOnCtD2qHkXcx+xZf
	UyAj/k//BodvU8oJUteC+8qGT2cQlXBv1zpZMmMnnsyL38ic7qZZ/RQe+bY+ra7W
	1iVTlDKlrnF4vZKO+LJA6E/WgpzS4ULLZ73Ya4csiZdYWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228ys2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:17:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so233194751cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726272; x=1785331072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/z7Vf0CFs4vDGQLLJUD618C7Uy9T9x3H6mGeOakJz4=;
        b=CtCxttDYStBA3OJevCcBGryx2izzuqPxm+j1jOvrDWv+1+hbua45pFuJt0NJu+aKWz
         Oy7XauuGmVI9M7UPeYz8yf2gu56+rGr3v/ssXMhQhv1kZfz1lH0QFQP2klNjnk7OTcmW
         2ORlNhoR4RzljcAS/Y+xs7BYsO1EiqG5Q/4MQyKnr6DkEQKIyLjD39ZGrZKTpL39vFhE
         lXW1uUdw9krwPZQ6ug5VAfiS7IFeTtAYHiBAmjyPsvw6YTjCUq2ZU1DWNPx1RYD/1f9v
         7D5V8W3Cs7fOLWPRf7Zw1TXSKeUV4SEHO3rIav7b5Zw8sGSIcxi/NQagVJvSerq9TyHK
         q17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726272; x=1785331072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/z7Vf0CFs4vDGQLLJUD618C7Uy9T9x3H6mGeOakJz4=;
        b=PD3yFJCdxBroSP/tnYiG1c/8FTGySKu+7pxjZpowNO3dMzRQQyEU2FiyElKvq7AzBs
         rHeuihVlXcVZAKbMyQklq5qyc+BydAXbNzBjaWa8jkBlRH4GH3v/P96ob6znwy5kEDOW
         7K71h33jJBoN+dv/NzY78lb083wzz+K4rdAggx1Clg/SXa/GTfmxTJULYFrP06MzQJJK
         kN+kXgz2n2oTxCdqNZ+Q8JvHFiZvGY2te9+AkT5uiaIq4GvvTHwdRGlLMHv+JyTTPiQb
         YaxInobDW1RTjFnyuKgS6CBCi683AdmvlDwV/JI+5flbkjv+n/geg1fN3bRw20QmJM6B
         82OQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGQWFqOVucSdGN6NZSe5R/eCI9c79qSEgR5SLEiycBGQZhJ+k46e0w1aH4LLBNB97BaReZ9Lk5betQDLSe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Mr6X5cKsRUP5hBNZHwMhJMp2xg692bVOAnphRcBF3ZBoliDb
	b6c7UV5yUHG7NRoyavkmutmDZ8jVWdbnVzocqW31ag9IrGAGk8IMl8uhWbyNbyHww+6deXFsc3M
	rCegq7nk7fwDBNeh7NbbG/Fg57mY67Llqc2NffjfeY+tgie5mmcGeO7tYByY5Ao9vIjSp
X-Gm-Gg: AR+sD13bAjueufeoP6ZIEJII9LWac2zImVJIxPFcqQdekO39Fq0dDm31DOkzk9ZjHCA
	WKEWDwN4hhO8Ucaiz6IeRxvoVH7d/3aCtA2aiHZyOkS8nUgP7Y438PX2Qq8g3l6bt5vBnvntAZw
	jHWp/kt07fcSVNhTXJPEPe+FH/YOcxjVWw6C6cL1eIcZb/E0h/khIDD5AoKB5dO7/qZr2G5JdYU
	oDD0a6Pd1o93hdSGyHg98Er+zLIO2SnCUqvsAGZ+MFatKBT9p9BVdN/cTTFpDTeo5/xtIfMeClu
	A4IeSvJXUs0e6AjD5ZIF9UU6o7HLR3f78wZiQTiqSu1GcExikT3m49z0pEAFxDU4lsn5o7zRzAq
	vJuPFfax+CnQdIQhSv7gyIF236OOYbh6ZofgyfjI+7dUmuKJz0trWZPgEJOtBIzigyQAPs3U1v9
	F1glgjfJ8+wA7ABQ==
X-Received: by 2002:a05:622a:351:b0:517:6b31:8058 with SMTP id d75a77b69052e-5213e0821f6mr207212551cf.40.1784726272506;
        Wed, 22 Jul 2026 06:17:52 -0700 (PDT)
X-Received: by 2002:a05:622a:351:b0:517:6b31:8058 with SMTP id d75a77b69052e-5213e0821f6mr207212221cf.40.1784726272083;
        Wed, 22 Jul 2026 06:17:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4313fsm463602e87.60.2026.07.22.06.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:17:50 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:17:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/11] power: sequencing: qcom-wcn: Report power
 controllability
Message-ID: <6lxktlm5suakzub7gvlhianc65yeiqjbbodimsikvcicciag3q@ugcdr2gbg4ok>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
 <20260720-monza-wireless-v5-5-69ec6743543c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-monza-wireless-v5-5-69ec6743543c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c301 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dA91eB7zeV-DSUTtgBcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kR6Q-g4loMgOB25vD6wTc6PQwUJQCFI9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX8GRRg8mGkikZ
 IOHerGV5AdjCeYHAKn5G6WXeZRSfvwzmttIQsX/gqtwM534LVqPkXTw+63dlmYc8JBDCF4nRNSn
 leyWDDX4fb4Owsk169/c19AKSpuA1pU=
X-Proofpoint-ORIG-GUID: kR6Q-g4loMgOB25vD6wTc6PQwUJQCFI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXx30SchM9Npta
 fdw8Mglw5LhWFMWWHopPhg8GPA+Zo5wbYOc6W5a50d/rreygVOTEb5OGSlTL9o08hVDOLrhEz5E
 3Zm7BwpI8KEk0dhmvnQGZVDbelEh8/TQzP5M1KRXu1GkwjMJxyU9QnXU7jW4GbEnude+P9QWgM8
 6H3xFvGp8cStc0xIgzFEo3lu7TV/lSVlQfZNoq7/NTfuXu4fDLonBS+871ySAUflx5HfpS9+wTM
 rSFWT/ZOsXeukOWfMjrZtff19EI/mOAyOuSKVtFhwJiUQGzQhPoclN6/kPkRkqpEaEWBEJrIdnG
 hbo9OIAr6DVqQv3E86eb8efkaBX72edYx0BBD7eH2rQhp5JUOfWVw38vEDlNJqirBx690umNHw2
 SkJ9kpGfiFPs3WF6VeLhrlpeZOvsy28cZvVVJA5oV61LsaiLQwepx28ayNY3E+dnaCkKfV43BZA
 e1IpklQyZ4mnpDdrElw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Mon, Jul 20, 2026 at 10:04:07AM +0200, Loic Poulain wrote:
> The "bluetooth" and "wlan" targets drive the BT_EN and WLAN_EN GPIOs to
> gate the respective functions. These GPIOs are optional, on some boards
> they are hardwired to an always-on pull-up and not routed to a host GPIO.
> In that case the corresponding enable/disable callbacks are no-ops, so the
> consumer cannot gate or reset that function on its own.
> 
> Implement the .is_controllable() callback on the "bluetooth" and "wlan"
> targets so that consumers can query this via the pwrseq API.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
