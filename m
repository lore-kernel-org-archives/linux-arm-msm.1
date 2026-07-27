Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF34071DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155510; cv=none; b=Lf7Bu4AsckRXb3IpMzUDsBxBz5GJtKAvZg5th7/rm1++lSGpOYxPf80o3Cu2d4WXSLwHG3qxiKpy9ylVuA0l3b326wdQLds5VEAUySIklJikGdXFrKQvaaoXiYn2UYUq7kZndsM++y/O8+dZeLsuDrE3n910n3iG9d/+z9Bq7kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155510; c=relaxed/simple;
	bh=IJqWpC8UcUqY2r4bh2/IBdkzLw5g2ILddT4zNzqR+jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NThS8JZpI559vtl1+kzHl6ZW8p7ONMaY/R+ndYah/njIeURgMCV/j5UT7M9sx7Yogr1Qmifa3f2iAyRfHadSW6zZzxLWjADceXanaMaYoWsCwcd/NmANK84SFo4D4BQUStqLJpf7Qm+cnYv6EMeG52/4ym8Gd5yXNpucHXoAQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3lo2AnP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vr35hICc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3lo2AnP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vr35hICc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMLSv3604753
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BQtffaniH8VUOUH9ntUQ33As
	G1mcbkLWXfaHtehEejQ=; b=L3lo2AnPqNnx1vC/w335CGg1NPNaYAUeahcLkOeT
	7OjENIIJ8r4XHnmDQJkbbG4vE88qbHGG5ahpKbOtfKLMNY0EDKakjubaraHBA4pL
	7ZqQwxbsj/QIkFWCS51Om/xqCev+os/bUH3e4t+54Xyju/U0o2qdJOs/L02gM+Je
	CTWG09wZGjEvMf682Z4VDy1HKGYF3/HN/E61I6aMVy5Z/otX1xAz77iyiv8NKUKc
	cImgype4BuyEi4KlLuwtFlzhx2zTDd7VvBGLlR/hntITSMB/EC19SY7OUw9+W8tM
	73xc4BnIKKiW25HB+dsowPIdNWdV21k7JvnUDTgbChpN4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysuem6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:31:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so25783925ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785155508; x=1785760308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQtffaniH8VUOUH9ntUQ33AsG1mcbkLWXfaHtehEejQ=;
        b=Vr35hICctY+h1Re/O3NtJ1tWmAiLWxcs64Cp6O8o0C+VPeiUDF215ovYA9MGZ/ciQA
         dprk9tgRN1rNHGTbiFXgUFJdxxMsXKDm12og1Xc41TyMDi9SaPLNksDzJWS8yltCjMDg
         TrwXDFtDE5loLDnQQkNptzRBW0IC3qc9ESj5r1Y7l8563poscvl47weOl6VSqybw8dbm
         3Mu06b0NKIa7dlosoOeWbdBA3nxr0gW4soD06IDP+0oPRelxZU55nsDLVPkwQ7XDwX6G
         0o+jor0axSztGosjHcOOwOYqb0vQuu2aRlyk3d8k5HrxhSRLb6Cuowiuv1P1oikJ8K0u
         hoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155508; x=1785760308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQtffaniH8VUOUH9ntUQ33AsG1mcbkLWXfaHtehEejQ=;
        b=oGfeQcBOKWK3uoW63imjOKJ66IrXHAlDZa4Wz//eGggKe196bWa3wQEt6/e2v0rAaL
         4493AfCqRLZzfGPkqegtyggC+ramtM8vljiIouQx+U1OLN5SUWIJulLn4hqKting1Zbr
         VlcTolA3sNJFtGhG40JJU0er6Y5caLsbXKBi2M0PGSJnrko9foVJd0qIoE53OZjJAvHc
         yUKaJrqEK3FLkrAwyC9eqe945hi8mw03l+JWgKD0T0UsalfjLUkgtK1cpZ5J9x3WeYzX
         JEyXx6RPbdcQIp20zcS9ms9Wic2iaFS1H3UvW0cAi8lTglkvvXEQiuuO4g3wbq3Opa0E
         ApEg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx1D6ko2DmVmqT8+J9upjAOVXqLbZXc5IYg8o34wsLhxzHM3hJZlPegxSTCDGE2wdbxc2xrR8fV5Rqxl4x@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcaSUwhPCoXvEAvSFqBC/iTOTlXYhP4WkcfJPvI7wLgJMrtt+
	OoFmQgmd9ONY6Ez5lcneAFm7ExCAyCW5OcYW5nR4KxlMpKYLPGci8MDjQ1RgGZBd7H62oqSquSU
	8VeqecMhj7aaulkeK09OnMr1/A7tQHIF2pZZGpMcZUZjJSu2t7Y9QSsepfUBGpMF7Gk40
X-Gm-Gg: AR+sD13aj3I/ObcYRPJHfWlZT7EHMEG1dOiHEAV7ytcCsFSRi6C7wyKUFx9pykFSZa6
	7iRwlPv/+5wSAXHqGtReElp2/FwkziutR0SBRp3sjQ5zWJ2dmmg5D0lvgHk4fB+bW73kjJqLtn1
	z134aFgDQRli0SHHkgTCu09ZBGsGbi5MDIxcWtUdhCjN9dUhTaYNh97ltU9xhJy3RFTfcbKysaM
	wwbqifazkaQ2hffgAplrwT0KAePD4bZB5z60VRifhpK73d75ItcApJWec/oYZ7pw8/sA2IN4hOd
	97O15UtQyRAyboXpFXUMVcBmI1R6kx7dOW0piVy5arC2+yg/0I5subjDLKix4YJQnXi8k4PTVhf
	3cDcx7unW8+DCL3T7PBWCPO+GFG8=
X-Received: by 2002:a17:90b:3848:b0:38f:1e1a:5163 with SMTP id 98e67ed59e1d1-38f2965e5ebmr7870292a91.31.1785155508087;
        Mon, 27 Jul 2026 05:31:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3848:b0:38f:1e1a:5163 with SMTP id 98e67ed59e1d1-38f2965e5ebmr7870265a91.31.1785155507482;
        Mon, 27 Jul 2026 05:31:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm49566300c88.7.2026.07.27.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:31:47 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:01:41 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC
 and QCOM_MPM
Message-ID: <20260727123141.7loqcpcnib23hcgc@hu-mojha-hyd.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyMyBTYWx0ZWRfX2z7OOjdmabPs
 WklaeuuZORmDBgnZXeaICZtPzkQAHTMYKWFJGWE+s1lMnntEjVHGqUEMUy8v9H+g4ZPhwKCmeTK
 CMMfMNg20mi1AOgPp1VdZLIGZklcPp54KDd7HhrdKVlq7bZgUWSjE0G1sennzKKhwOKlj3ksfSD
 HCXuv/d85gLSspwgR+H/AP8L9zJy3CbBb4dve7qrC/yhCdSZiTdQ/fUyHreGh9sv+PUiREW4G7Z
 RCyH/fueFSju6SANPPLFZh79V4ECM7hbFtD7v9qUBc4t05V7Ryi2qumdVG02+Oa6DOnarNgK+mm
 ja/y3iTrqxmG/H0YJMjp2koGe+GfEPRjqpID0FnQcIRb4LqgsWXlMmod0R8qBovBcnBqOIClxts
 l0DQXrE8VEUCYwIFBGp5lEZmOsN1aLUPWHpeX9sKG/2BPHEQUs35EjzNVhshcNg0FcuDU/0WN+G
 ALCNjkOqyKMcm6SM7fw==
X-Proofpoint-GUID: KX77wV2GQt3jJjklb-yTakWb0j_JUlPk
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a674fb4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2MkTBfida5u9ap4BuHMA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyMyBTYWx0ZWRfXwzUJ52OHKD8v
 AMtKRAVOwun/Tn13+2M8JpT0hBtuVoT5/knYyBaQUXZ+Q7tr8i7lwiUym/jXdAFvIpXr3SxalXE
 JYUDHo+ACoTUqxsBjnK0YQekJrJZVnc=
X-Proofpoint-ORIG-GUID: KX77wV2GQt3jJjklb-yTakWb0j_JUlPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270123

On Mon, Jul 27, 2026 at 01:44:43PM +0200, Krzysztof Kozlowski wrote:
> QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
> should be compile-testable.  QCOM_MPM is used only on ARM64 SoCs, thus
> there is no point in proposing this option for 32-bit Qualcomm platforms
> making kernel configurators life easier.

QCOM_MPM is used on ARM32 bit targets, SoC like mdm9607

-- 
-Mukesh Ojha
