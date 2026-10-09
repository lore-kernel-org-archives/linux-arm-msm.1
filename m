Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880993BD64D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556651; cv=none; b=jAZpycWgMXfNBiA60x713wZgVhqvzrxChYzRT00Y8zkTbP2Tkkx8t0oPsrUHTYZP9pHQi+xiGrVlG68KvnTgC/2zz+VMriocE1SsvLKZREYx3f/JcEiI12GCojdx4Iht4H6VbD6bc2/d/txsTWSuK6j1jn9x912IQcGwnjaosEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556651; c=relaxed/simple;
	bh=4Z/B13xeXzf4YPZIReMjXwn2fJtAzbXk6Calg/Vkz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFpHVBHRXVB0ZpHUiqkTYuLlOZTQ2L4+vK1QswokGa976YwEmozJzb/XHJLaVY05dEkmSsJwZRoC2lIZ4Ux/wKjr1Bv80KCyoie8yrqNUbzI8XRvcltH9QeTgfOQq5fKscNtXZ20jg2534b+r23TLVnHYWvg+DOMGVVArfs7kzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGXWYehF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKP/hhMu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGXWYehF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKP/hhMu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKc071061303
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 14:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZKS8ycvYM4Xi70sP59B/TTRP
	HMYkNwv2hxl45JH+Q9M=; b=HGXWYehF1iN+pqqSimfuU3NqI0PJvhAcJQcn9Lq1
	KSZgXEanez/fntA9HQ9CtYNjV20rBxmRA7R22IF3q3+i90vHXxbP0tpxmslKJEAC
	adpp6khJtia8ihobi6KvIIWsJgSR21okQ6Oo6+MeQ/h9RJQKo9z2cNq9uI8QXdu1
	fdZYaHJZ5WlDpQODUrJ0pszKzK20V2GMTi8jRNYEWF4jL02GxzMKHRjl23vs702x
	zmUEp3xIJf1qK7n4lVeAw88oBM/wvRq+tvPlOvN3wbr2bpkRKzmk8mAb/6mcaJQm
	QoixRQLtI5Sxrpksy7FvziBMNtGZst0Wbh+2NVBdfO03Ew==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk40my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 14:37:29 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28deb7ee3so9624718b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556649; x=1792161449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKS8ycvYM4Xi70sP59B/TTRPHMYkNwv2hxl45JH+Q9M=;
        b=AKP/hhMu4R5TW3RIaXcfvnFbqwe1agZ0g+njgaNtIOH5HAF9JhkjnuYENhdMBmDfbK
         DCZnd+9HG5eZBeQvUfaX9gkr0EmnrEaNdD5Bbdj/LjXpg+apT5y+OhKqki8jmtGmxMU6
         TIGTAH0UBKnsas376WjTD00/C8pogfNcSflapviz/YMxwjvH8/4r7ELK3QtRfPSuiwm1
         Ldd+Zh2d/FxWrIyxdU67UXCmGXc9XY5WcpBwbo4Iqk5KEIy+oEHOgxCZ7g3ifui23aGa
         RFz20We2kWbPSqGTTFR70LRogq6yMhHFSrNEACh102HNZXzR0PHHmzmtTa8cPdWfuE4U
         0Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556649; x=1792161449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKS8ycvYM4Xi70sP59B/TTRPHMYkNwv2hxl45JH+Q9M=;
        b=Sd6CgYNl/I44Ehr/Jr1NCxIcPBtJaEr7Qe2/qtsSA1rHcKtEEAVdMv/su+FTH8OwfC
         11XSEXeLLyeR2IwBm6UCN8a2yKurAcV+vmAAdLRGQTbgHDHb971JOAbuv0D1dQ/s7vnX
         4A9Vn+SzZM1GGETJI5yZroWBxwRn7Fx1lk65wVwJUGj5cXnYkKrkuJXyR/p2Kjstty6S
         Ssr76IGT85leSEan3XdQ4CWvGaHS2te91tC7+0rCMGrlf4Lb7cpyHj2bAw7jx72h3maP
         3fzYYJvrLjhJ+wYN0H+nhRgZw4VEBmXp2sy1gY3G6jhNdg7F1d+f+qtg6N1tJKqJwNck
         knMA==
X-Forwarded-Encrypted: i=1; AKwUvBxE8MAGCE9T2hDmZ+L+7E/OGnsDWfVU/uhPOP9O5N5gMJMGKHjBnU4xNwqGsAStART4X/E471fx8vF2J1wj@vger.kernel.org
X-Gm-Message-State: AFuF++k0TmJt9S+/Iwdp+cqnzgRfov4pIhZDG1SbOwMyyFAYfiYn8ZVr
	p41lBi3LDtWhN5c54JNq9a6j5ni/BB+qPeYo6kK1i76Yyl6C6R8N/T6PjXpqwkBLYOpPfEsTHKY
	/HNgTX+ESDurBtQgGtxRkJhmXYZROlKols2N5+vG3zJu1UjUas8ft9+9EFPRjmKhWevTW
X-Gm-Gg: AYBFou2GVXlESb6E+JXMASm5diZR7vQ64fte+MJ6t2H0hs1TXE7vgDqtPFCvMFzzP4O
	gceKhjMfodWA0w7qRBFWWSX+vzaXKSh97NuUyLK7YRiUJCc1I+UnWLzu0QAiTZszUlti1eL+9UY
	HOlIzSoxbo1j93CTLyrjZtUj79XwUG1TifyWZy01ZYEclnChg9qFyGuBeGi5/lnOOfKmZCGoTO+
	EaQWCd1cS+FxjJ5omBRsQDIJXW8w4NTuo0I7Mq50Kf9w77HHZVfun5n+sqd+36OWav+y0nmlMKp
	+8trKqbYaWNn2BwMJwfpkKoZIFjIQHS4VDLClShZM1hXzXDQ2t15A00pDvCkYpa8MoCkpruYE/Y
	VyXnctz9k7L0lFKIAS3JCgEVhP6E=
X-Received: by 2002:a05:6808:178f:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-50c52a43b95mr1725347b6e.38.1791556648953;
        Fri, 09 Oct 2026 07:37:28 -0700 (PDT)
X-Received: by 2002:a05:6808:178f:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-50c52a43b95mr1725309b6e.38.1791556648153;
        Fri, 09 Oct 2026 07:37:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50bfe56242bsm2101180b6e.0.2026.10.09.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:37:27 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:07:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pablo del Arco <pablodelarco1@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for
 monaco-arduino-monza
Message-ID: <20261009143720.jk3556szgkwt57qe@hu-mojha-hyd.qualcomm.com>
References: <20261004101849.34191-1-pablodelarco1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004101849.34191-1-pablodelarco1@gmail.com>
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8fc29 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=05w5BP5Rb16C3YaoyMoA:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: Bv_QNN8qcwNcqMAfDWweZO2mkQOpxcAH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX3OMh/5x37LZM
 9rDHtHyXihTLYKhv/qs7D7QSnH13zyeoQPatkaOeP5pcZx2OE5uIs3NhjQZyoBDANxwxrdjaz8b
 Ff/E7KSj2V19isFLEGGznXgbS8uPGL0=
X-Proofpoint-ORIG-GUID: Bv_QNN8qcwNcqMAfDWweZO2mkQOpxcAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX1Ub87K6fr0hY
 HVfbSldnCesX+BgXSP6fz++lcFra7DjXa3Uo7wR8YXtwmrfEWvdX+Bv76KG+LlacrLh1YTTvoH8
 v/6+RNnZARvd5Anrfl8uEk+JWntTE2EYb33MCa5jZxrmrmcPW2ulHW0hmIsR1s+7wLYkYYQT897
 T95V2eQXYNqp5TEKE/glTm1lGUvjxochRs1XjkYeY5oECQUeW1mQ383ThwrmccZ4y/0Bk6OWAUU
 nXE7uqL1Kx+kx2V9aO8rvhPWTFYIXZ/QiMwdFIl9TgJnO8HAL5ww5IBGMOQY/HFgfCme6DlUmIB
 f5tOelVARvrtwFqD9qRj+0rle+9PoWiXIEl4m/Ieu9wjtxAyCYnZHuGivlmp55xUk1hZdhJUCQy
 cyJ3+Kmb5Xm78sfO4f5urND32cMBvdJ+g3SxG8VXOJ716jFbHy+M7rjZ6inowwXkcBjOgH95gF3
 WwtRyTa8sdGZRm4PKvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

On Sun, Oct 04, 2026 at 12:18:49PM +0200, Pablo del Arco wrote:
> Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
> from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
> for the Monaco EVK.
> 
> The board boots under Gunyah by default. This DTB lets it run Linux at EL2
> with KVM when the boot firmware is set up for that.
> 
> Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
