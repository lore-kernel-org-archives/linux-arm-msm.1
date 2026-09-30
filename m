Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4397050E587
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778234; cv=none; b=tA/CoAr0mTO3bTrEB1xXdvipqlehL0UoGgjknduU/kVAmUL1gHLIJW5Kb+kdrV7UF3JCLgjRiWT7liMar2/CIwhquOBZg79BvbxyyAS5eec/HTRf+N6ju4BIbz2Rd02bCbFTUZtQQo7lnBumTnaobmtrLEuicg8oQYHLzBWvLjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778234; c=relaxed/simple;
	bh=ljNGBp4IFC5/vH2B1soisqS2RsIGB88Aj7oUyA6gHH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFUiry++6VitPzfaNJxjG/siDcpdXcPdeQwe3XDKPk2MLAXXmUfzuxUSycltVSb3YYhLWJ1uaWDP0kRoepYRqCBrJZ7wijewj50akpCsCHYtqmI6RJbZt2NkqRu5SYQMYNBs1OgtQuU/z02Bd84WuqsN3xz+JF26N3Sir9LsK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7tTdA3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksQhpyC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7tTdA3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksQhpyC1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxpZo704409
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=It/I7bqJvS/GZFBfLizAbt75
	7ur5ymNP07ts+oGXT5M=; b=c7tTdA3mD/CnWZ9IGSeWLodmuO3veRo1jHRv4RSk
	sOllNiw3AkPJMayA+GVn6H2QbYnv4wxklLiu3HSxFe/EK4KbsmEh0ODO+w43h7Hy
	kj8jRXgu4of2rqHzs8gy7d/JT61Oj0vkwO/9G2PDdY5vrIbSzZqpYqYatX27r7LS
	qy7tlrOhYfnosxRtqK37axr21WoK0O/+y6rK8ykIvS5i4A6FSU3V90EausW9R96N
	wB+XPmYcGHahP7ss1E7z9z4OB0Nx2S129ttNQ43j67atedhWVShVQBG9hZmpwHLW
	WX8h/TkSk6DTF8wwLTirNgK+tSJug6JRmg2ce6r4p54dSw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tg8nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:23:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b43c5f2b6fso544549137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790778212; x=1791383012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=It/I7bqJvS/GZFBfLizAbt757ur5ymNP07ts+oGXT5M=;
        b=ksQhpyC1ZD2uW6u4FL8ws/28WG1n0DGOqrlrlD7yfI0XCQbwPI3FC17ybH1mgaOwXT
         /EKjQbh5nbFuUEQ9FZR2RG9aHoHmAUSQomf7zdlaIUR5AsqzkafOpkHLehww1PHK5bEB
         0eSW3MGzN/6gnBGrh1v8SIkETR0yQ/TyJ3kYQOkj5eNZkAVnwydZg5KDCQVl7VRGCx+O
         1upRlpWvcr3l81hRJQK/uF0lOISWB2fdeueihahD8ZhTmIIMwrp+9zn+sErLR//p6TO8
         itPKYqsKOVMP2Ar20BYpehwxNwy8fHwcfFUxMKSDltoytGQsK4URWCqIR9cXkkER0gWt
         bSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778212; x=1791383012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=It/I7bqJvS/GZFBfLizAbt757ur5ymNP07ts+oGXT5M=;
        b=e4jijviAu3f2J5yNpvPowqvmn+gtFgMU+xDyMHAxWKQFnCAvO8vAW24RFGXYqzaL7H
         76Ej7fosBeMtfVXPSFvPh5FY4ZAgG6NVquu5UUIfR2aK1rP9YxGKBrumWR+kj4Q2QL69
         G5H/5gd3DiSIXI0anDdRIM1TduL7PmFX879eBf0nLeO63ogWD06tEXsNjKgnBjRG1Drx
         vuWaYxCOvYvfHuK54FoglMSiH9JescloIt7d/eLgFmlnjzywoTgWbGCKuiEuRsIFKDQu
         slWFduj05N711r3XOnTHo3XfkzK0VYSfYNL5pjbhAGjFeb/TEOdZynQJaPGg5IEoD4jg
         +fJA==
X-Forwarded-Encrypted: i=1; AKwUvBzZLQ0ywL/D+nJKlNqVtUlDwA1bXiwbkhf33WQZCglSvTJ1SjQc/At1TdsBb0+y/UVme6fK6IOmPuqMHe6S@vger.kernel.org
X-Gm-Message-State: AFq9FYLPcSHHQ87z7qND1ePrAdPTWzaZdniUvWxXYhH3IVuYhfP8zZAz
	Ysg12KD0dj50AUBJeB6Yh59Sw6l+Hg3RzVPJOh47okJggeouggAmouIIVUCh/si+LFUfJsTp21b
	fkdR+oh9s9rLFc29Ufp2JkmMjHgcnwTSR7Sx6apdY/m21TsJ7rO1oBXJWiI6uLieDiAbq
X-Gm-Gg: AYBFou0bJ6jnA242m3h6qJCDPyAgw9J2R2FxeOVm9iuj0fhwcRJwKh8jYPow2431Zgc
	68EQnRB7OMKc7W3gkArxTycCw/bcJ7thTQth/AAm5yduTFPWghziTdts4rgPd3isT73W119wSHS
	2knBh0L0QnlgaRU7NYxrJanUFgjGf+9WKWXWkc2VWalrZQ62G53Vdxwo9xYP7/na5ymEar7fFNu
	AgQlvuILunNamyi1tatdmxyArp5gzJe8GNc4sdVsuzLEjWmmMkz46pLlizhz92Yp0i6mE0FCUjU
	Q/c9qieVoOU+Ltt4vllWkeMg01bzegPyrcwUAtR47EFwY2Z9adioMm2WGtcKtsSAFcMJJPGQO2o
	S78h864VUv3BOpIU=
X-Received: by 2002:a05:6102:942:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7be72cb250cmr274250137.20.1790778212415;
        Wed, 30 Sep 2026 07:23:32 -0700 (PDT)
X-Received: by 2002:a05:6102:942:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7be72cb250cmr274233137.20.1790778211869;
        Wed, 30 Sep 2026 07:23:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e657287sm3171965e9.7.2026.09.30.07.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:23:31 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:23:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ
 during suspend
Message-ID: <p4dagzkkmltv2e3uckgndnxmbp6tq4twt6vb6akd4dumyuhusp@kukxl673zmjp>
References: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXyT6r6XIG2Rmx
 VtMyPArI1nGe7CO3HdGWmo0vDjQdVlA1tJfcj7bqUyYVDLTRqs51dtolO0auVDxTDeGCGAzBL2a
 IzWb+q5IbTj1jX/vlaw0Fb2WlV4GOdw=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd1b65 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ga34Rj3xoGKA-2XpnBgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 4vmT6YVzp3hxEbrcoxRk4F24uPdFgc_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX7BLw/Ch/ZQpL
 zcwxXy2x57fCOLnEm82iCsf6JAFsnjY5+zav3OLhOtun5O/oN6lINGptGHYgXRkpAZXfzr9oPIn
 cou1yKKzGNZDtBVz4+RDR2PIXdGJRvXAnibUxaoLVvBhmsuiEanqe75zyCyguOMEWzY/wueWtvU
 IlVXcnN7L/EAd8+VwgxRS/h3M7yFJ5J3siN/V0hBqnmoTfoertSXx5eLr0geGFiUb9pb0DNImJj
 3Ad3YZ4f0I9yxnkgfRDv4YI/T4hQkwKXxGnCUkshnzeiqMcNVVV7Oqub2nHzhWh/PX6wTvZUWPb
 ljxTDXvpLg0gMUFWV+WHs7CtXpm8eTo73KbchSRLjsFI1kCmhNOtfV8H7ueq6NyAtKNuixqnUwu
 6JQfFa0pHO9f2Z4f3Wch9J8bqk9O8SGIlMocoH6m9C4LtyYX/uOPsWwwRUurhVPsMC49ZfTTiW2
 kXROx4YO+FAVnP81JMw==
X-Proofpoint-GUID: 4vmT6YVzp3hxEbrcoxRk4F24uPdFgc_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057

On 26-09-30 17:18:36, Abel Vesa wrote:
> EC SCI events require I2C transfers to retrieve the event information.
> During system resume, an SCI interrupt can be delivered before the I2C
> controller is ready to handle transfers, resulting in failed event reads:
> 
>   geni_i2c a84000.i2c: error turning SE resources:-13
>   qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Keep SCI interrupt handling disabled across system sleep so that EC
> events are processed only while the I2C controller is available. This
> prevents event reads from racing with the controller's suspend and
> resume transitions.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Urgh, messed up the Subject line.

Will fix it in v2.
