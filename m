Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1D357CE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725564; cv=none; b=hvVmKOBEIw5i4rUEKYEPpqK3xhxH6nxkXcFOi8ADZWXqFMqlszoZ3SNvo7o2Osnk9E1R8QU//no6EdlKPo9hquXCMhFWWAGAKW8AzrnN9pJO4FVFUaz+fvQEh2pVxGDmrH+cCOWv0IJS6fwjHXLqVMi4B3h+0ehj7GgzdHqol1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725564; c=relaxed/simple;
	bh=Vk2Vq+VXn8LONW/vhgt21cIe52vXYnSPnpPTrDvoAsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqtoNECKkpJaHzYPnClCiUCvieKYoly0KUkdlFjoPEwPQ5b6TwbhHEvtQOM429HJnzMfJbkG8Za3czbxuQLt3OvkgcQRq+3uMiPczjGNFX1ewTctliSPRP2N/TtGGvBOYNdrMgPRe8Xo0C4qmIrpoKkdwC8CDrX4u8D7TXMy/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eU0wrTlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXH85kpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eU0wrTlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXH85kpi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1cus905348
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SvxQL0a/Xxqh7SF65Tm48k+c
	SHEQWzeDDxLTjplePxo=; b=eU0wrTlZRaKN/raHuNVHEcEvs0l0W9FA4qCFMwOq
	1rP4gwvDVzDP01wbxcmp1nLK3QPqCjZJpY4t/LDYoFqf5NgN6l7KgCokxMG5C1Si
	Bt8XVQlywd6iRdKiRtUUoi+2dmUIFKNDHpTuUQwrHvpt33H1pJvpwzKFvOO6knvR
	mDfnCPZ4f1D9HeMIlyoumLocTuFn92vnQaONFA6hQNbITDEmME41pRTN0HVdaaCN
	bmE8Y/c7ixwideqk79IrnqZkTdmBBbK3GwliJ+m4wtmTkaVu0JpdZPX5qLzyAbk0
	7N07vTH4rprNUyP2khh6dt2ktYHuedDZsaXTkQN+RaDxVw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu78mfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:06:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9774ed4a25fso37515241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725560; x=1785330360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvxQL0a/Xxqh7SF65Tm48k+cSHEQWzeDDxLTjplePxo=;
        b=TXH85kpiJzklN1I+NIz2ze8ewDnXR/IsyT/o/N+GPzGEvu5h2lwW+513gBPLcMumNu
         u4fT9/GWGV8OI6GCjCCHWr4TAvCPk9Dr0plXHRiEGBdjontiXpjIxP8xq8DLZ1gJZubC
         TcAFEuE7zxwACiHeoj+oXZhgNtDNh3jcHcrclNAO3hbHB8tVzHHN77/kPhxZcmUH5TzW
         02qf818c426wcV+XJSA1r1836fT80gs2LzUxD5LTbh9t/J5zZ0aEDAl93AbUbrTs48zx
         PucxC7/1YL9rQqdHN1hYue/aZ5womzF7XxvhQHc5xJezkgIxKZFw0ZCADp4p9D6mSqG/
         S/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725560; x=1785330360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvxQL0a/Xxqh7SF65Tm48k+cSHEQWzeDDxLTjplePxo=;
        b=RbIjtwxJ2QYPzjmc4Tx5z34r1irXdVBUQBLMMnrBZg1r1N3mHsBPyKIZmW4+GKF0DL
         ptUHpfUs7RGD8QiCaBFzzq6Nvb6yB9sAZGRhiV3m+3vbSBkJOMvnvOEfHG3PFummAFmf
         Cbs8+CSzax++vX2KDNeGpi7L428X+Lw0C4XiO0UA2B7N+DRMjVlrsQRRz1F49c5HKIro
         JElCAdYM9wYatwX32dZuOi82PTmr1pNmHate4rEp3f10RpIycEG9gyps199K4Zw/KamG
         jkrATjF7dJ4K8oVXZHmV1ijxrXyVkIUFF26nyifSHQ9K1DfcdlcR2ZNiu6rs0F7OO5IP
         ff3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrCXY2V5GNz1gB211kVd3yANGwSGLR4Ie6StwyIpcjX+HRGEBp7/CB1Rikv3HZPBehRO6nXykuoVUSB5xRO@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJha/lKQfvNHLq5qehWb7uvz5R5T35/nomdJM5ZCpYOoJoesr
	iLes/fqzOTANO/3dJzwlGJT3+dnTvAR3Sz6MThaE8tW2+BonFr9PRA4z3CqO31zAJ60io4GMKdG
	YV5xfMJY6WENpUfN5vF11peTVnFWgdfpCCScPSwMhzCkW7S3GW4d/b+PTnt7TU8D6IfLX
X-Gm-Gg: AR+sD13uQS9jZtesiIw2HvGvHun+jilw1CgPMLBGOn5KcXQQaRBLFIZ2OMUaslUG+WL
	qEBTnp7/3LbuVZAmhOGzOxsaL57VP7bfcivZ/kP7BbkrbEPApA35fvYCLBLyICprNQFmbGrr4/7
	gBi46QGEyAoAewn8s0QU+iO5pcOHgPSou7FvqiSd1Grukq3ZvVxHfks1RcZcyXO6IMOWPXDZw+B
	y3Uasz+SDiC2t4RylkaF5hUnTCzPuqVufSoGStqP6zQ5AMz+5MhQdUqeRRDDn2PR0+mJjrolNdE
	3gMOSZ1Zs/p2OoeBQzMA/dwXwgo+CkvCd4wyK+fBcTZZR/C8Rc8sIAY6CjWhdqogJRiUHfyTWsb
	ILdhmrYxmXS3GnZobA2n7n58JhZA6bMWoRezOLD+Xsp9mzWIzDSkD1dadoVb8+0sU4tYQByShwT
	H/DW0xWDtDbnzfNA==
X-Received: by 2002:a05:6102:149e:b0:728:68cf:c76 with SMTP id ada2fe7eead31-7475370d2e9mr6967684137.23.1784725560001;
        Wed, 22 Jul 2026 06:06:00 -0700 (PDT)
X-Received: by 2002:a05:6102:149e:b0:728:68cf:c76 with SMTP id ada2fe7eead31-7475370d2e9mr6967669137.23.1784725559500;
        Wed, 22 Jul 2026 06:05:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d433f3sm473527e87.55.2026.07.22.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:05:58 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Kalambo CRD
Message-ID: <t4m4ct3dgqu7s7g4poc4uxflzxfqb466xckpodonrcb74n5rie@wixidwx3ohd4>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
 <20260722-b4-kalambo-crd-v2-3-32d4addc1ac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-b4-kalambo-crd-v2-3-32d4addc1ac9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0d3_3R6TUpxjIzXA8a5e-YJSFNpLxU_W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyNiBTYWx0ZWRfX96O/TUxfE3NN
 Q5VtnHoxepnhckI1HRTwo17+ivV4eHVIjSHaL+CJ3RT5+hP4I4wIQ1EoOBVEqsMd75gf6ASyWvn
 ZOlnmshqU0verOZD9SD7mKHIvRj08Tg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyNiBTYWx0ZWRfX7KVyFGE8qw/D
 TM+dki2+oHwXdU0Gl/4DfRcUmOxNzlQr7Hk4khTwMx8wADX59keMCh+gTR0RkohFvD9Z42EbDv8
 AcRlSuznu6s+8BAXh9XDJd55jaKZumepnA/WEfTa/HP/CiUbFKSrfD073WJ2tOFKbm8Fysbu9WP
 qjeITCgOwj4OtgJfKjm2e8i6kHrMIeL+ohKs0ShpcooA0vDXypoymw7eJte0mV1HU7d8//C8xXG
 v9d5QmttJTmmQbLxx9CfmJJeC0KCDxXBBMzi/82hMA6oQHzm6lE+ILXo9GAFO9Kmi98PH3MgvW0
 OJaKHKc+KNZlhMlDGKxH6OhwBLkHgzZkd0s4alBB4r2wheLwNPxgCjKZauhD2kqRzhvv2mpmC0r
 KOGXWDGDRx1M9z3HFM9FXUM53HAxxwanh9GsVNuvGrcex4LYmGUYbH5PvtooTejHYm82VrNVs6h
 dcJL4Nn0g2oAaICZf1A==
X-Proofpoint-GUID: 0d3_3R6TUpxjIzXA8a5e-YJSFNpLxU_W
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60c038 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Hkh_rGh67Udisc0sesIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220126

On Wed, Jul 22, 2026 at 03:55:34AM -0700, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  1 +
>  arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
