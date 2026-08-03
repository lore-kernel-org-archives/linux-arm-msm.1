Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B76636C9C0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785738; cv=none; b=SLXMmZobh0m9aEDf9qdpZ24abFe4ZyaPNY/lAz2I5dGnv1GK2TC2AIZ993qqLh6sEqPH0B68M0SQRz/y4TCrK2PXzWgPfsv+YBM5LpXve0X7T+8v1C4/ej9rwij+IDmCrJGLqSd6jfZ9/X0Y+NN8+Q+ko64nl6KA+ut4IKhlQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785738; c=relaxed/simple;
	bh=EbmFd0Tfi7XIGnEjVIdD9hbEBtJUqdGWpGo27/LFtD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut3RIBx2vnWEBpHzf4FNvLcWiznBHHFyP3c7YRSkbMpdSB4qiSTu+ycQk1Q+E+Qi49pdXQPM6Cx34AyffmdLzXgxJkw3Lea2zV1LbLdO0srFuTNKfpVqBMzfbfBm8HAL8jYZrE+LrRaMDzVOfyw8lZwrd14a43tj11elwHPAUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzTQp74u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4oeQ+9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzTQp74u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4oeQ+9y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H7Hwp1535999
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEmBlZfkkLSaQ1/YnkDoGRjN
	+kXC0cFm/yBC7NdS5jM=; b=dzTQp74uMWw2DQc8roZht2Hs6aOX8kzzanl5B6BB
	zYbBY4AqocfaQ+EYJhP/wrEriJMFIa3Ze8Y7Po6Tvo/t8i93U6hLS7Tx6LteJT0e
	dh5TqQsHrpGc46L8FneR/rxkxRciikayGGDHGn2ZBtdZZU4Sv90XNEdNJRGvX1tw
	67P1cBspFUN7hIdvcZH1MnaTFU5q8eBztrrCgm0au1k/S8ZNA42AMUfs5yMUKNhQ
	bHhHo/tjZDTemtLUyQyaRVovyIIXZiNVUSm+g7/b12c78VZ/mPi7nDhwDawgv5RN
	Z99nh1x0jhK3F2OUkImwTplhsbnXkz1t6JAPu+2VINXbSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sgmtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:35:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso76512691cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785730; x=1786390530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEmBlZfkkLSaQ1/YnkDoGRjN+kXC0cFm/yBC7NdS5jM=;
        b=L4oeQ+9ymvk3kgoKMuCgCtpZdvxKBy+DIUOrEK4HN/yMWI8JWIGtUDBhy2IyE/RE8p
         hJUqcza+EGOwxKD8IouaeX5/GpzO8i6pUfLPZFKscUMlIqCyjcLai++cEE50Sn/PclGy
         opcS0Wsyc+H9lV1qiuicRnvP/K2l2xjABpF10LQByieQRNVfdZ/jvxYsMTxT+N9z008f
         PIE/gfylgypE1KmQyaifTUui1G6mTdwSxGBlDcgVUq9AezH1rf5OZdyLsOxuhA9MDBmP
         QiOEDFyJ6j/E8VWHLPQdLIDYOtirDRfwsjn4t4U+G4bNsPjR6fKWmJnPES41zFDb+Jr1
         W5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785730; x=1786390530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEmBlZfkkLSaQ1/YnkDoGRjN+kXC0cFm/yBC7NdS5jM=;
        b=EUgfi6G0jw2zvEGUfLNV8yxvfQovRbBgB5a5Y6ewc92nKl8/+XWFI+DWkwY+kfZSvb
         7Ql23qb/nc7Rw/fR05y1bYDAvqz75im1r0JIA7nBtDhbkmq9jhn2TOwpche5RDkkTzpf
         tOVGHgk4eUSQhnNe55qNzpv5FjoXtTKxUzlu5OrESPZjpisfkR964N1L/NSvKzTX6W2x
         XfsmZ4VdBW/TkMX/8TkbgkGjAQ8RMAGcqa3qfM+85FzB5/YMHZQt2HO0mDh+azap6ojp
         LmmoZ59WRjYa/y+kDWdEmXDiwSyW8fypdwass9yDqX2l5yr0mo3S3hoJsDa36rnZmfV2
         Ydwg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2zOKUKvAlx0iU8VHhnso106S8lOcrEsO4esFNTST6Qe4FgIe5y6Y7HSMyGrXnUWb2xQLc7Zlm6m8n8Gz7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/9bm5G9SLhE0WQhpBlp771nYjyVTNkXdIM+QOyAt5Ja5362S
	cFBWf0hdZsbkptgYXsY78ESM4ZpUdfhJYrZpEHwKKsyU4VceSOILgBljzMlrYREOna4kx/boo0Y
	Ht3uqIjyvksZUaOUgXDbxYW46I/gB6JQOLI21kE9ZFjIO9+yigWkDgjQCGaJIrQLoOfzqJbhm1T
	PP
X-Gm-Gg: AR+sD12BFZOeTnKiUT+1s7JyNA3YUjygrcH3JwH7BdBQ3Fas2McQgpi/dR9anj/PHf2
	U8BiH+4LhwPW7gsxNAHsbE/FrnnTekSKQBMe0mzarRS+e2XimTYBJPCDhT/qhDTpQ42ZJdS8p9/
	d9Of2whJKi2aGd3z4SQLoWW0+NCOmp6hjV+1L5799IIUkhEesB6BOML5T0t1FdPQmPiRqiISLdg
	mgsrAtK7EfR+qD4HdunIwSXc5BRNOLqxe7K/ekTxLQPzraHxiYRh2C57UJ0oVeGdefG41Vf5ohD
	/RsdpBWxIm5fgyuYisufSeaIHingjj30m+OF8FmDG2wZYXE4u0II65SwH+Dj2x0M1uqMKIPRuEx
	WrO3oq3Lwn0Qx2dye9rG+FU/578fiWrOINQt+Da869RATLsxuHuNLCBNTeHrbbdUGb5MHNQnZWc
	o3wIMVoVt006F0/Q==
X-Received: by 2002:a05:622a:4119:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52b5674b01cmr215463671cf.20.1785785730046;
        Mon, 03 Aug 2026 12:35:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4119:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52b5674b01cmr215463221cf.20.1785785729578;
        Mon, 03 Aug 2026 12:35:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb44bsm2166941e87.23.2026.08.03.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:28 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:35:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
Message-ID: <jx5iackeevtgqxycqbmctfohuydyarxxp4uqsu5dpihca5oc7m@gyyd6l67kzhx>
References: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX93GfGfJfny0z
 Sb2kT0lX/QPWOcHOWca8ZScVIuCknElFsHd6bzKKH8fy+tR2m2CTv2b7Sm3aV8195okuGOXZBHR
 hiEymxtnpsowyQ2X6Sa3qc1kWI2s24g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX1IpL9/QU8d4q
 cxGur25+jgzeJo9KYXCx9Oaeo5m1vNyKMBVDopr6Z4rbk3qcTRE5k8/m1XOyoqrb9hUtP63+AAt
 ddHZbVhMggrzVvgBFq+BPg+OvpiSjOI2LMh6LQhjeZtyua84haKhsWVcEHUaRlWwGD9YZ0Et1sG
 99hnWKGm3Vzyxyo+dLe1u1/XIaGnDPP4ecCk1hQ/g66ArRFDkSbkcB4Lu90uTD0aeWda5PEBbUk
 +g835y598MK+m4cvxVC8e5rTeYOR5MY7R7PZcQgYv8DS76vQ/W1COVwri/9YN3uIkDWzIDayA5o
 L+LbyLxn7u7udWLdQOIhniBhw1294eraD6jx6vnEym4lOAGTTsxMsvcr5pvyoWM37X0YJx2NGIM
 p32NffyiCWw/HMLYvrYiXtmmu2EHy2kJfOFbQlcjy4dd3yjFtLcEuM3qaMwA9l1vpcuTqQkfca4
 ZnhfTA28+FBo4gXOkCw==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70ed87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0xWNcfA51jHuHAl5ng4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: avI8T2cbogHc8hrSK5SSS5KgczDg_azo
X-Proofpoint-GUID: avI8T2cbogHc8hrSK5SSS5KgczDg_azo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

On Mon, Aug 03, 2026 at 06:27:47AM -0700, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group.

Why is it still present on the PCB?

> 
> Tested on the Hamoa IoT EVK:
> 
> USB 3.0 SuperSpeed at 5 Gbps on typec0
> DisplayPort Alt Mode on typec0
> 
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
