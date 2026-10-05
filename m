Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F8735B62F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182068; cv=none; b=DWR/yf/O7rEL3NIP3BBAfp2Uqk68jOtVj0cI6+wywVGWv0prjlLidDTTRWrz//NxNH0JxNPcJ21M5/IAKF4fIRSU9p8Nd2pv0cZQyU15N9t7GWPxIs973KkiSwygYcAFG9BHppH49qWFisH2jRTj9bfWadgbVm7656S1jCrOUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182068; c=relaxed/simple;
	bh=Aq40os1hExCvC1MAKwXlkNhOD00JAVKrB5sdw+Gp5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBfd3W4j5WKKFdlNRW00WRemdsj1Ckh00/Qzo2xrLteeNox97Qg+wPjG9KAa6pCAwPyC6Hm684OKH5S6XaW51nGv4TnPhejuKkSl2R4QHazz4s5cpNFKMnQG/akd8J+IiGqsvXAGKdOdVH77QZ+74W1phBkDFk1yENj/FTfN9lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPwlFgnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjpWSQm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPwlFgnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjpWSQm6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695102AS470523
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n0T0IOWboKdZzgixZTEBycGe
	F7SAtlri90r5Da2YU1E=; b=BPwlFgnFC/fFgks+dPqwYJ6/Z18qCk0hOVn6FenQ
	OwabMH+ND1jxkfi4ryL1eHaGQg8Y2RB9uqmXtrkUW0BqVEe5hSp3MIo1anEAxMfG
	TX1yLBR6wi7Q6VCJgUOKQGZpIs5bJiYp6XLcUbVkZybhJCrc7lxi649nvUjjye2c
	lG3vriQHSnsnbs6IxJm5RQtgygMdtOabx1Ra4oZHmaJlxHCwwgYfiWEphA2p6UQO
	RMaazbwkIOeXM7AZxVdliK394YpaKgrt+IlU4yHd/anNqV1sZnsdur0l+1qRww1V
	/askKGtpyyezdftFCjigoUB7d/BLosUVXopwIkjOXGDjKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucreb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:34:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so316529585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182060; x=1791786860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=;
        b=bjpWSQm6XMV+1yM2ORPOpQdbA78q4232vTwuM5DIQIMD/U/mXupV3+4v7eNRSkhjyI
         0Ko/9pPDfTytrqTZJAurEKhFEfFvN7HGsyf3JpxM0jJgz0bs46thGMkITct7udlCr2r3
         HTJevNNewmnKM5XjGYpPMOyWfv9Kwsufe6c90RAxxnvuGJNiJjCSIvg2Vdx9obPMsjTM
         sUBGuiYRWBBHFIAJaHEZcBaw1mXBNNcv2KdPgfR9gyAtkJ4YDtWwfySV0VsSC0Qi+7jn
         q5sExUfMmV9KFwaoAtmNo4QIcP7pF3BK3y4c+13isIvKuS9xO9n+BQyosjYfLc1rqjq+
         fmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182060; x=1791786860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=;
        b=KGiGBR75oqwjXUKh89/oook6VOxgRHpDeuUPx6o08tM9kWlVPDnkSkWLkRV1QV3I4H
         pagLCSwp9pr1Gs3nXaj7qqVAmR9DY6nnwlrhuPiZDP+dp/gRjeGvue/0pJvxvVpXzPUa
         B+T7Ym2zpXjjIaGWHkaRS3uKhdMIhF7Flr7rzVtrS9BnsKnWWgKeFdK0Z6R0WJDLgNNp
         iFZ+vx88HgNDBiMgrYcYNwuyP25AxWnpRWFB8tutB4emFYW35OKuaBaF4eYDQgDzH7xJ
         pq/xfDzJ+nR3soQ5KQ+zGrZ82z4RFwv1MY3ptRBiLFSLEoCeVONiUb5mio71YYicAUVE
         O8jw==
X-Forwarded-Encrypted: i=1; AKwUvBygvCfgIOweZh/tPI3OGYbkLp/YVSbTqsEjhOKmLLyPBfCGMySKCZ3R684KmGyAV3rJFgX/HJZ+FEZUGAtd@vger.kernel.org
X-Gm-Message-State: AFuF++kD6p1W874QbIEcgnDS9KfWAUtKC0GO9Wlg/3SGEK9JX/p7FLgv
	LjYFJr54EkEEShO4HzGPpr3yYstw0F0yKzKrDT5VHfsVSdOTXI/dM/9DCvaQ9Smq4VnGuCcnmUw
	5jEvA9706HWjb94Lay7BKkGWY1prK/lULPww0EBIp7EUAU5VDwmMq+RKYkaIxiNewJ2oQ
X-Gm-Gg: AYBFou37XbzH+Bu6aPzyjeSQxABEZrmpL5I6MGC2AxJjd5S9803J+fTavP40M3IdVNC
	LSMxI2E8yeZfQsrugFTTga7kdCEFWJa/yLjNJHL4DIj0Ssknr/slnEQcJM4LxEQUQjnldDbh1Lp
	aKn+hsU4XUkLj9Zorn0R1STTXKPF9fy8y4YifVJhfU1lO+LptzUYgaqLzm6GaHJwrrlTFDL69Ra
	+0wFg8qflxO8OhXc+rIuxpyNZjEP1wytlFocRc3mwF3hb3/USUqiKfCAD5Iy5lj09Tvp6Tn/+1f
	6xk+x1KvgprwTUFbpmO5f9e3Jl4sXl0TSfzgdIYUAPRhTuUqN35NLzuaY300T8Dn3D6aTpJEWxY
	qrzhKtLWwp+dIC6q6a0Z4bDvX4KQLGaEBgEQUbULSENkhyoowVJyxFM8xFmuIENajV3wibfmHbq
	gdo5rK/rg9flR0
X-Received: by 2002:a05:620a:4152:b0:93c:5951:38e9 with SMTP id af79cd13be357-93cf17937demr1638677785a.52.1791182060394;
        Sun, 04 Oct 2026 23:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:93c:5951:38e9 with SMTP id af79cd13be357-93cf17937demr1638674985a.52.1791182059963;
        Sun, 04 Oct 2026 23:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79da2bsm2924985e87.48.2026.10.04.23.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:34:18 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:34:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNSBTYWx0ZWRfX46IbXgRHBIeu
 kaEF3aqO9o4ImhijNbN18UZVl9dq0gBSEaAD2wNjX+IWHhpMvqcHHJjAcrcP7+Sy7/pQxRm4R2D
 uirDvEwVRBjYLkGv1gRpEGB0rZMTENU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNSBTYWx0ZWRfXxJPuRZsXdjcv
 E0Xl8HtlWXvU1/J5KuQu+GA7PdSs6sfsvWX9JhgnqBWAr+HzbQbJIyb0CDYiH8XVSrZRnBGL+p4
 tI3illuf7pOQY+KxYMBSti9sQaOIno5WMuupGgW5KQwlPrVxGiJhKSdWvYF7aL3zTXqvehsD3/s
 SUlnA3E9FbN/9yuoalqJ51w700ynjxgu/Ab6gznd+ie98NE4PSigY7QSitxIts0Zg7fYFmyMFFh
 jr0ZFvb+ZR5Lnl8PubyMV5IGJpOSzFxchbLY+0uIk39VgtjTW0G2iYU5DR0PjBr3eRprrJGF7Hi
 QhRFxoBglAdPWH26s317oiCX0HE3CZ2UxiaC/aeJHZhu/UpcEDVo4iASa6wO7RcAWKdzPZWYioI
 SwqNItdYLJWNWzuDEpje32KVDWeOvFqab8oSVj8ccjBifnF3P2M1mvXG5KQz7SrFSOylx1useGh
 LJ0UO5rnj1xXREIzPGw==
X-Proofpoint-GUID: MeJU6I5pm5XCcpKNd8sZNvOHsKxDdiyQ
X-Proofpoint-ORIG-GUID: MeJU6I5pm5XCcpKNd8sZNvOHsKxDdiyQ
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac344ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wyx5Qp5Zs_5CJwpGNdEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050025

On Mon, Sep 07, 2026 at 12:03:53PM +0530, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 
> +
> +	reg_backlight: reg_backlight@45 {

Can there be an underscrore in the DT node name? No. Is reg_backlight a
generic name? No.

Use regulator@45

> +		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> +		reg = <0x45>;
> +
> +		vcc-supply = <&reg_dsi_touch>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		#pwm-cells = <3>;
> +	};
> +};
> +

-- 
With best wishes
Dmitry
