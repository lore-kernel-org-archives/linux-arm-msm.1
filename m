Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=CciNRQyUXrladKFohtjGjoX87WlD0uZTT6jYpyhCdpkpaMC19uWUQausQDiykaLIVvYo
	 Gus0nnCc74KQnBWOe/1cglAq/7gZAxScGrvTjrTCS6o+y3cK2Cyk63lyFYkPCDfHiOX0U
	 01J15MGEbNnSrK2EjECSGesYhXBmN9qjGR7cVqo+9Ia+1Kj+VKYc5YxAdFGBAf8UHHXLs
	 Xu1KjYWqLKQ16gxs3EQe58oNznItGqP5N3DVxsw+F6DChVTXaROS51nXFJnaZOMhbO7tN
	 zvJqVGz9kNeLznAI7dtWVzZWu7biluXriyXJ74fDaUAF+0L/Vge/UmysorERK/0nbMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
	b=mGpGFWFK9S8V0t4239fm45/JBykg0+VlwltJkKj85R9z55RwqNeIEYh5r0uDvuQ8sA/Q
	 JQ7Z10sknGlhdrG88Gv/rbyTo905gI7hy6gChUVseus4pEGxFimedYQ359a+wnHk5MhGK
	 EBCUcGUJsFNWOvrxm1GFPXl1kL/pWAqC9xCQEFAux9vE0wZvxsg3eAmOI19XOIj54oQDv
	 hxsBtDNErwq5y6If07SJqubz8kuMj919M2g/YNEVFWrjvYstIhnavIY0U+ETC8jg993xu
	 G9QTeaW/MtOQaxb88q8DrrIu0ct9l432tmd+kZ4RNf9BapxQvt5rrzf8bh/yWfUtp3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPF2g9Vp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDUxPHQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0615606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0615606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPF2g9Vp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDUxPHQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB40h2070701
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X7BsiEJvpOtzfW72L97F41+W
	NVsWQvFRDOudbh1Aepw=; b=XPF2g9VpKEEzf757oCYGSqfWFGVr/Tx88KHa6+1C
	UDRhUIGXYOkMJHbtqsCrueXtHvnJpPEVIaGAS6j0NXqcfyjsptzwBOkCeG5r6b0P
	JTGEISoiKpcew6AwYx3kakTq9o9eWSEgPjhfP7FKEdWdSBJvRaqPrEdHKcZrp8Ez
	VJLjIqHBp2sJ7rVpreiFM1tux7TRLIm6K+REyhGgMTjEAK1YH//QpZBvVZ4VCRpS
	xqs/I9jZjCVKZ64FNZpEm2kxxp9uGH4F3NOrwJKLHbMaiILW4bEubQyNe9Yzg5Pf
	v+QezbqZdNhMCvMv1oLE4sBrmAoer0TM3EFAx4xYQADyyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jy1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:36:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so129015385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
        b=FPDUxPHQ4nvj0bQlFOqnbiqgnO1ECYtZ8X6kdXhg2ptbpEMd9DIB/QyNbh3uLSguk6
         zVy9TiuPt1xDZ9pN2guZdinKfuVqesPDIFTwCrtjmjHX15hBS9Tgrk8C7p6EntUgCSjx
         mhXTANC7JGsJ48kUpy6GaTxGYjk4Jox1hWYd56Z7doApIiGpnawUvYk/+R/aQ6PTFekk
         H+5J0f2zrwVBpNQKbnCntvPwbPO3RJI9DbI/0nl4t9GQNAg69lgvFVx8QUgJ1M00sFul
         HUSGpq40SD2wo7A8m7n8glqKXX2CeiOEuMnA5Wao+cq2Rac/SQBDBR3+kD/iiGZvQX1/
         vlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
        b=z2h40kXpli45/hjZ7Wb/gpUw7c5HUfgfEV2iGyenCgFgu2LKvn85V8Hf1yzzSyLBYL
         Le3MZHIJqsXjIWpGY/gI7V5PmBAcmx6rGLBpvRZaH/hRA8YXrIZQWVfm4vhs/T6A9+gU
         g5EzPN9uKxaPN7MogK0tgqGxa13DDgz45Ji1MOvXbsqP7xDfjMEBY5+1PdsEJ4m/Azaq
         yV0dunicTAeLCsm/F2wZScjhll1aaa04fPS06qR30z5sAWjRnXDhnYsHqRUpoxlSrq6q
         2Z/CLPwh5SJiZZMV8kD0RHfAKU0e8Yg9BMU6P8T9/GXoOGXFH20zV/1csVPiHwmurlgn
         SH7g==
X-Forwarded-Encrypted: i=1; AKwUvBzXTTqVdUeGa0SO99OSaPHFdNa/UjQEaYtUiaEqGqAY5O1pP++ZdadSVbZM4oqnHMk32ndZM/5bedZ00nJO@vger.kernel.org
X-Gm-Message-State: AFq9FYJfkGGv1pwUWpJap1iNX4b1lzhMaAwVZQ3KQpPOBMdQ6XpYvZ82
	CkW7fcjNhh7rm4Gha7ifGeNYJbh+LgH0om+qzLrDXRFgIEwkl/WjTJ2J39GJpCJufjz+64My7Fh
	ISnnu+QIr5JgSiH3mUY5kwwXV8YmCGCzZQaa8BgjcP3mHYhtA5M5VbUWvQ7O/Pt4tPhHv
X-Gm-Gg: AYBFou2edL/LLN+k4rSgwWX0ZBLIxS/nktJRwr/4/9Ua7NY37d4Lrn1cRj53XR2ppTw
	8y4V1Curafc2b+Kl6KGpa29AglK83p0OIZg+BTdoemAuFOrJxjZR3zzXTszbB35sAxicHP1egTE
	DY3FUjNxkhN8Pi6us9TDjOHjCSxGYm9XbdgtlBfAsdIoc17HHOAs3SSKAXwe0sSCy4y9GnjdKtr
	wCvSe3Cag5rZoErsEWxEjl/rThhS1wxyurC1h/dlwadXchPf95vzplZU/A8ZUbHvmRKwdKSsLJT
	gTZwTO37+0HxoChUnPG/lhKWPfKmTTzqh3y2u6CKpq12BNuByoTpQPvBBllMyQH/83ZAtIWIlhF
	xj0e6qwGGNuhR+0us7UA2breZpC9urTYTE6O6bgHIHPq/pSbIBCkwWEoODgSyJtLFrA==
X-Received: by 2002:a05:620a:a989:10b0:944:9dd:b6 with SMTP id af79cd13be357-94409dd017cmr240087685a.80.1793201767688;
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
X-Received: by 2002:a05:620a:a989:10b0:944:9dd:b6 with SMTP id af79cd13be357-94409dd017cmr240080885a.80.1793201766973;
        Wed, 28 Oct 2026 08:36:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm51470285e9.1.2026.10.28.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:36:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:36:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
Message-ID: <ytxypmtfd7opi36ybmb4qd7arbfcb5mu3acthmpo26l3s4fkme@hbmfvg7xfqpf>
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX33y2uu3ryyfG
 hGYSEypwXW8mh9QLj4tEoe2jIHVuyTEiqzeQ7xJobo/4rkWUyrM/oSZqiOqmjJwLSMRC8YYHVDg
 CBQE1tCJ5xXBWBfiRMOWYoFrhZaF33U=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae21668 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WKNOtjYE1B8OkmgEoC0A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mF1ENayp4UMAg89pDQFW469ic6QiswQ2
X-Proofpoint-ORIG-GUID: mF1ENayp4UMAg89pDQFW469ic6QiswQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX6S0ME9C4D8n3
 unIpxH4TuxjJHcrobRKJKwIrYrgeh5y/xrZLn5u/KNu2Wd20xegUFhogvv0YcciDoFPuWw9Fibg
 Vhm3ywovTbJqB/fenz5Y8E3A2IGYHTNxoa00xzbfzJfckwJQTeKkDVMAD81PRTIQDvBZtA8QlH0
 SpW/k1Yx4ciPmf3KSQTDL3m4GTd4BGnaLEhw3cZWG2aUUZ0WtT4g53tfILVd4uJQRppF/O9ytcP
 ucg8+uymN5tzqrf1QKXleZosrW2PLP8QOW/7SpiNR8G6Fhxf43m8I0Nn3pMj4TiD9O4/ZPUEbKU
 2ZwNiuajyDxM25RY+RJH7evJvqh6NZ36vwgIIGP+LkWEsqvqH6m8oiZ/g+NysaSVYZIaThOMIpa
 UzFfcs3qEuR7q81OcUxlaKLDLBDv2iNPN3Nasv2l7z0ERe9+lSl0FYsjK7CCwXv/lz5sKSmUOIq
 Aev+WmCcmvZbsrKq9Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 18:44:20, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Deserves a Fixes tag, doesn't it?

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
