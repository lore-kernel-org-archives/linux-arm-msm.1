Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C33B05BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980855; cv=none; b=uqx+/p1Y2fRkX6AnJUxmLdwdS2EIsIlUgQU80DLl1j5nMuQMAUTAPZdBYxWpQzAjBMC86cDHWQ9svsUuTZ1h2i3SKy2vOB4hw6rJqgi666MiFp/+ipm2UGaQljK7/e+Il1ofBqXp6siu+4/XyRALQyt9H84bogQpFImDZXYS/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980855; c=relaxed/simple;
	bh=W8MJq2ugcAxNBREyuEwjDGFxF4U27Ey4yhFzDVrZm6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLHCDjWE3fw5+LxNASHz5HcL4S84arNBKJCh3RyGNPIFcCdilyEPaXAXeIbLtuftGrt0wtuXdy65nkdVi2wh6OfHasGW/XfBg4e4qdUgBUHaGlnKp6eOu5qfOAc4sX90kTag96c0LVMMb3nL5CnuY40M6wvNN3zj3x8xi73kQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF/nozWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT8rNaAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF/nozWl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT8rNaAV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Ig2m62772404
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 19:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9plG6Wp3KDjg+jZPLptdEfry
	IUfYFr/lYfEhcs+JKgA=; b=YF/nozWlQXvL3b+f6IiwTg8uZf6osWcyYjjK+jd9
	7MsjId3ivpfa/c/gRS153RaIQbOoikwHRDqLbPIGggWH90AcrIE16bjm1m6wfOU7
	PL8lVwlrF7gTw0n/7OfPg6ve+0PcvEKNRKnH5K88PB2GJoXCRfgwPDf+8ElFxEA7
	sC3g2jSE/wgq0tLCuN7voNiCaO07FFq013CUGynKHqFx93ATtAQYXt6GoLuTcwTH
	Yftfwm2HtMaSj2r4eYTWMEsUFLPcBnG+lyrNXRZ2UKf3QeSZ7nWxXK8fObt39IL8
	Vf8M/AHcDPaReV3/HFtB5ep7EOgAWB4rBL9ue/70DPMq9A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd03pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 19:07:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so5077734137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980852; x=1789585652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9plG6Wp3KDjg+jZPLptdEfryIUfYFr/lYfEhcs+JKgA=;
        b=MT8rNaAVgEpdyQD8Ley/3RlmC6lLbBuhxMkKSDza40Bx/0xIg/lYbavK0rXdC+Zra5
         kJnWX9XFSstcCDjUkp13H3MjSdVcirzt8SIR2WvbV3yRWdcjH+KlFo1oyitp2E1Ql7US
         qv3FhZeTazvlu7lPhsPxzfYcS06X6hFX/+vMecDnswWrQzJQKQojINmD83apWuOAvsQM
         HOMDW/dBOmHX51J384opgjyHE09KXHLSUxt3LxY9uZ0bCOGaeb48BDZopv7wplnyER15
         4fHa7iP1p26z+F4zOt7ngwIMZOCzPQWv4a+HN9h0W6ZCvGtKKuLoHfHdLINyRFfkFUpX
         ir5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980852; x=1789585652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9plG6Wp3KDjg+jZPLptdEfryIUfYFr/lYfEhcs+JKgA=;
        b=tWB2ENsCX8J4/GWVW7x2BwoB12SvNCgLSfpGzqbHRbbrZ0ngaSHKbuQR49jJSIIvTk
         TTEf5cmUSPNrfiVMRmII846/ZT35XUSDbg2MXdCUYq8gGuhlVLRRZDBWuf9ZEsLaKdhc
         phW5ZY5DT4LeKuLgyk0INRdgbrPXUhHCleLiHMPbovbUERiDIDVQFYPxSEQ6TIwQMNso
         bXi2SUUpDbQIY77gwKdWbiTdHFVjxyL6g1PvUrdoXAyk3L8KqfnKj0eqYQpSjlGiF/V0
         /1oVeFHZMHs67RnPgh0xtFHkrF74+SIF+YrB92+skSFm49ctNt38qXRJdPHC1Ehh6n+0
         zQvA==
X-Forwarded-Encrypted: i=1; AKwUvBz5KMA/7TcCYqKxLd39Zuz5/vg5sD1jX0PtLTyu3ID9zvxAceibRpjAiU7swWcewNAtwQ7aPkp9iHf9/E/w@vger.kernel.org
X-Gm-Message-State: AFuF++lFpwdx0dIFr+YwpfD45sjOvEbh86ZAN7l9zLQfpYTy2ucaaZE2
	2NVkWtr9YJcknuaWVbRWqPY3IHnHD+FlYWrUrSkU67HbD2IXAReAvGVJXpqYdHyF3slPfsOGYsg
	1mC83nAmbi9zPxUkA2whM0beBfwspGcMwQAXs/IWXheSb+b8GtHI0PIBfZ0SbHUhVQHzW
X-Gm-Gg: AYBFou39KFMsKTeSp6+Mt0pESeITMslTFbFCYI5ZCxpNoURqlnSM9svV6IxdCmZHjVm
	924xbeFy4PCm8mKpJ6gfmVsVhSv6glm82xHr5a02BFnj5BgyFmViJiMPn2VoL2zqDQn43U2BXoH
	0jj/+cBm76nSUmqf2YtNe/iRpOMorFiW+CX4VTAVl9HdcesDqf7mnMz2N16QW9Tqjnk/lb9k192
	7ORHHEOl1jki8zI+DyRSwjfpuM1N4ZDelapUBA5c5zLNIxcc13cQgmc9kwcWK/1nf5JfgG36anb
	TaP6Ft4I1W05YGlM9VzX3gDBL1r635jNhaeT2C2zO1b6LBn8dBzwybS/QM9jIGzSmBBvNZcxHbB
	pMssC2dE5Y62cGO9pG97XHOfuW/h8mfSv8lNVbnZ5O3iI0Vh2adkgch1P7F3ytIVC4isvv15MBQ
	==
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr19493156137.10.1788980852331;
        Wed, 09 Sep 2026 12:07:32 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr19493136137.10.1788980851937;
        Wed, 09 Sep 2026 12:07:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899e5612bsm96412e87.40.2026.09.09.12.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:07:30 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:07:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jan Paszkowski <jan.m.paszkowski@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, marijn.suijten@somainline.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable
 UFS
Message-ID: <co6oc5oag4olewddatuelkma6myc7wj2t7isulumuqjntgeiit@ncjc4anjesvq>
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
 <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
X-Proofpoint-GUID: JkzThlNeLu83hfHwYivYFbtlHtZ69Gok
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa1ae75 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ppofqrV_mbaKQxakh5YA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: JkzThlNeLu83hfHwYivYFbtlHtZ69Gok
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfXxu5VhbqkRUO/
 LPeFg76nHvz+21L7j06W5GOfL14nuMwxYcd184KuuciU1aMaqkMonY1MLDG3FEQ2VGWTIxUA5+C
 sOtGEckatNWlA+WS6P+4R++iogJ83TM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX84q5TalFxynO
 pvDgKu8eEOWaK92LsPjSPL10lZCaZv4rlfUXuroQ5gxalXDptySc//cwPfautfPbdUy+TDoCPqy
 kv3AXtYK9XWtWrlrnzWWmEwEZEGUYSI8CbeXuTMRFCjX7VI+fHs6RK66tKx1aB7actFKHo+LUTj
 BfZWMF+4QCkW3gxB8zTXnvVM9XrCepoSH3XVrgI2CZQYr+LRZ6n8jLUrEhA+staUom4VJs6qDuf
 G9xIeMm78FX3LcPS/DPURNDi9tgv1VuslsazRYCbMJpBaH0Bkg0xP93ujIZH8xQq/KT/yZsszl3
 GftQtu01xdGpybQyMC7CINW0JTv6YgiWro4XfkZpsb01mhopuF2DenQvm2X8SekOQMkkYILMvVx
 b4kEjpRibgpGGrDBHBdk4nvsVzu5H1EQ+BRny09aU4jJ41rZnIMFvTpNU13UGyD/a+uNgfD+Ofx
 zpbRfOeHpawDNreWecw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090213

On Wed, Sep 09, 2026 at 07:13:12PM +0200, Jan Paszkowski wrote:
> The UFS bug that haunted the Sony devices seems to be gone this
> generation. This patch enables it for the ability to use internal
> storage.
> 
> Signed-off-by: Jan Paszkowski <jan.m.paszkowski@gmail.com>
> ---
>  .../dts/qcom/sm8350-sony-xperia-sagami.dtsi     | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> index 4b62ee50da7b..969c8cb31df9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> @@ -893,9 +893,20 @@ sdc2_card_det_sleep: sd-card-det-sleep-state {
>  	};
>  };
>  
> -/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */

You were brave.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
