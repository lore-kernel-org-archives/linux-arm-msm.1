Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401871;
	b=F3wCUFt+oAQG7Vro5jdn9C7KVJgJgSxvWDMCb0wh7UGWj4mg3SBp6x7ryATphdEsFM0x
	 ltPJo3lzswMX0LXEU6QFJ8OoYNRI7G5jA+uy7cS9cElIZXXnzLjGI0vtahL3g+XIjzGDS
	 cO0zdakl2cEW+eXE08o5oDyZMc/a74ab06dDCKviWJ+QF9C9VdhcUTfG2YIWxA/0GrdmJ
	 gHrLDbHLRJcLuHdVkBzEIzJWbnQRn7ZwmgSgNe+/jJa48NjYoDYN6jhhcHiHzBRePsJGM
	 L1635aIog0HH45WIbn0mVv4fn3DtyYOljJi9QUueojVByBu4laSTMSp7dpeQzrqZGFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SaJOe5uCKAdqnsdm3vtUW0/3A+mfnzMOG+BVnbri9gQ=;
	b=xJZkXliQoLU9VJAFXwMvqCM59yfrBhHMMYLWot73lDNGuVC6OGJok1jOL/0oUog7VWit
	 xhfAiqlrgdWezhePBe8i9if7BKOntwgp6Yib3JQLFMOUhSTUKT/EWNFUdqPPlTD0f3/8X
	 UB+YSgj9p2X+sgYeehfvoUOxO1EiBd0sUXhq4shHwhNiXKFwqYlqKyE4dXWaDE6/sl1un
	 Dr4oXYqX7r5715+Dy15rfjcLVWEV2gyQN3QILOb/JR0D0ls4HZw6c57XfKM/BHqygFWEQ
	 9xacj2NLBWvGM0Q2uK39owK86PZt5nzPC0GTJdG3ra3hyFesi/yd5zd1jaVHuOxjA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c/6tWjai";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kvuQIZH6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FD3606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/6tWjai;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kvuQIZH6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZKCU708109
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SaJOe5uCKAdqnsdm3vtUW0/3
	A+mfnzMOG+BVnbri9gQ=; b=c/6tWjaijLwPvNFT0xJmmj6tJxhUS81CmnInYpyw
	9KcgPWfy3UKlK1Og6OeCX9CvaJeBGUIgc6D2USYRLDUNnc7cWg9Fb2ET4iK9sfWu
	UK5PnsfT+Lf59S/X7qftJMfosiP/oAQjRFuA5bBGrnGEE4fJrP0l/Mkn2mofcoSC
	+W+8QtkMASLMFsCLQn1eUWAjOVzZVOWFbHOAj5ci6tcx05umF7SetWwl4/+nBoWK
	uA5MkENhnAB4Bkd1wAXZfrzKUZSLKvSD8ulxfMn56Y9RpW1G2MQEMaNvVwpOO4yS
	d3Lxu9KMW4XOXF0DLpD2dZqiruX8PZ9NzDAU3vg6aPLlww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33k8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:57:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so673146185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401869; x=1795006669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SaJOe5uCKAdqnsdm3vtUW0/3A+mfnzMOG+BVnbri9gQ=;
        b=kvuQIZH6i0iAaHe6SK1nSxEAdYKS/hnyEqqj6Fo7geACXslQOqqfTT/6QvPkPvT/gy
         CnYvrO2n6HUqFRKZ/+SLrG0z8tQfE/S9gnANKUMpx3v9fV2c94JLnwc3jC1f6NakkdMc
         6fgl4enFx8MZsJHTCXodS+jhUnFXF8iqIQ3WS7M53DFFzt4lrWS09O1Ym0E1walbTW5a
         V5/avBkPOe92kz/XM35Kldsc8fyizdaTikOQrLNq4TQL9dta5HjGHiFknSsgbUwxAm83
         h15kSkQzcgG8LDbip/oNtr5m55NcexawdU1KN8HobQVLwMp8mPZBKia1p9HzThRv+uEp
         dVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401869; x=1795006669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaJOe5uCKAdqnsdm3vtUW0/3A+mfnzMOG+BVnbri9gQ=;
        b=ELCmrNxjEnJI0Hj6fFqwMAowH2M0fplRh1y3/zrQrNXbehY9p36LX+u/CVMf5754VZ
         FQjt2g0EdBsQytPzthVIuXnWtBSOvAVDkfpfQSjYfHLXb1V2pHCGBGrtPHD/KOidtwZ0
         uDbnOcOmEiGBC22d9ZnqSnKl6Jg6dsPGEA/4UHWafdOicqnz0OBPLAG1wkJE0MRTPKjl
         hwlPGkt8og0tMkvqpH1WHVFZCac4VOC5MkXmBCQvIQOLeWYPWEzF7SX7HL5rE+t37XEs
         vBuw0elpKGW8/NNkftOdj3h/sTuA6b4Vod8wCZEew7OFPYftHy5LAa41cXstEWeYSI1R
         35fw==
X-Forwarded-Encrypted: i=1; AL+hErEqbLhhSm/nb20170WN51mExIZXjl/iJGSBpbIGWyZi494niTJZZHjib2E0N8/JB0acWcPA3+HWY4SrR019@vger.kernel.org
X-Gm-Message-State: APuU4Z/88o3PPq6mzgaoTWyyFx3QiCGdCMkTZNaRiWgKvDyITVGfP9pC
	uQXQxU432KdI+IUEADjXNAU3b3nKjZCd4ZIR7/v9ADRBC2BhYz6TbXhtUnM3Db2cPIOxUM2j91a
	3EcMNOS121TDPKVSUkvlD2bYAfKt89OStb49+yHP2rG27rdpW9XPOgijjr/gojz3AfNEO
X-Gm-Gg: AYBFou1emC5+VPyd6EPmG/APOF87gLthKh+lflW4TVQ1JKMfqtQynEIw0bA9U+Rhz2z
	ADTpfQldFT7SFpsh7m6rOVjIVhyJhfL/fUo/dMtr1a2r7znXnnEqxg14itzAnPF8UXzMPtPvx1u
	agj+NPFiUuJ+KQHK8p+EGZKG/nU3o8XtSyDXrlPxw/VNUzdesXKR6Ts07mjND6yakCSKv5GPvu0
	kNULlrF6iCy1QfDMmGBM1PvbfbidVHdkiOb4uRmHC2hKORWEKhZc9dIAS4DXpWPXhFZ4lNnF/hU
	rvP430Rdgg+HZsPmVdLESMKpbc5JYoOruRD1rRZAnmYmLpLCVKT6IXhRjtsU0C6tCEMfE3qsOt+
	3PgsizsN+yHVP42budJ8KiUsReZc3y6FASgDppHhrFvwM63SEwDmCtQKw6xQEGf30h0BP+xEgDD
	A+dZb5RTqSNxL92OaiFP5tsIjxZSs3GDajJXzdWNyqmGPThN1yMYwGKOrjwuC5Ng==
X-Received: by 2002:a05:620a:2913:b0:940:f224:5a6f with SMTP id af79cd13be357-947b00d176emr343497985a.71.1794401869096;
        Wed, 11 Nov 2026 04:57:49 -0800 (PST)
X-Received: by 2002:a05:620a:2913:b0:940:f224:5a6f with SMTP id af79cd13be357-947b00d176emr343494585a.71.1794401868539;
        Wed, 11 Nov 2026 04:57:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09224efdsm11404861fa.14.2026.11.11.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:57:47 -0800 (PST)
Date: Wed, 11 Nov 2026 14:57:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/7] platform: arm64: lenovo-yoga-c630: Disable the EC
 interrupt while suspended
Message-ID: <knzhjpgeaf2w23c3lbqvc323m3eov6x4u766kdadx2yjgdqxo2@6vhheebov2jt>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-15-ardb+git@google.com>
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
In-Reply-To: <20261111115303.3749380-15-ardb+git@google.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4664e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eBQPph94G04ItlpDKAwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX2Yy0Z3h2HNZe
 pBu4uE9qEdEkoEJ+ZxDSpLl54MP7YwILR8DuWh6edjglRyWkfK3am6hotJqVrH05+4s2JcDcIrG
 tJvVh7570iCJ+Qcn6bhOCalNHhWXN39zRcSNfK9lTct/nDwpG/ZiYQeCEfGenzy6BOr1aimx8Ss
 +1WFA65F35Ihf9s1aubr0WjTeMtfk4b+2P7yhz1bhcQrp+KYgkzAylAhLwaz252njjflBTXVQ4c
 Fys2f8XCAzendvyb8G/IugLuP49wwvnQ3Arl+zdsxspxCZ/k5hl53RB1G4mfPNWd2PlOkV7fRkY
 46XGYbj5Jvcv06bpexc2qmPHkTGkil2JARFQL1o/gERTSckcYFoJwTcNh8ON7z0nuESdc2m/Hwd
 ef9NMrwyNVyOx4HT66BwZqbkFJuOP1mSmjbgvlUGX6pi+uu2j2ASBii9lNf8rAejI8UveAW5AAI
 /hHY8A3UitLoN7eMKjg==
X-Proofpoint-GUID: eSyUXOJeCbYO0L9gxr6l4MZZR_mkfhOf
X-Proofpoint-ORIG-GUID: eSyUXOJeCbYO0L9gxr6l4MZZR_mkfhOf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXwxRyEhGME91W
 doqWE9WnfljEflYZeFuh7v3jiKh4VLbgvfSiYvxppg9A0ic0wid8xkGxBrsstjnZj/Ddd7Lmzsg
 Mp1mnrnt54FYSrNYAp4vd5j4I17H/F4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Wed, Nov 11, 2026 at 12:53:10PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The EC interrupt handler reads the pending event from the EC over I2C. If
> the interrupt fires while the system is suspending or resuming, between
> the late suspend and early resume phases of the I2C controller, the
> transfer fails, as runtime PM is disabled for the controller:
> 
>   geni_i2c 884000.i2c: error turning SE resources:-13
> 
> The handler then returns without having read the event, and as the
> interrupt is level triggered, it fires again right away. On the Yoga C630,
> this shows up as tens to thousands of these errors in about half of the
> suspends.
> 
> So disable the EC interrupt when suspending, and enable it again when
> resuming. Pending events are then handled once the I2C controller can be
> used again.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/platform/arm64/lenovo-yoga-c630.c | 34 +++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
