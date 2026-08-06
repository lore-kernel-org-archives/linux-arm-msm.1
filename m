Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D6318BA6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018387; cv=none; b=Emq4fu6jRxunDG/x6CtPFcGbD91+uUkiunwsajobHTQua3y3bDnn8NBEEH03PdmlpOsi+4i9h7fi6/Xx4p+fag9daZulvxLV2F8r/RtW/BWq6EU7gaRpRv9NAZ4jBF6pedApQGaBzRnrrmGugQWqJHWgixFJRR+HE23LaBfMOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018387; c=relaxed/simple;
	bh=/HFz+tROyi2XG0C6YOveEYH1xGBIKHTQ1yyuq+1e4dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dG9EfQdUBGPbe/Vmv++6ZB/rNnsDP5/lZ18HTYZVKaezWz9V3MQwuiQjXASD6CpW9qVDfxVoizfrTtW7XUe7qwO8h/K656R/WEVZOHvHudMK02iEZFQoY4VIWaa4mra1LqvhazA86XVHN48uM85LWnKtVuRhpvR3HNvlf2Yhx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJ0tNGSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuOC+ZAW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJ0tNGSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuOC+ZAW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nelt1876440
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 12:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sM7RDCxH2vl6P08Gm8MUGOs3
	M/Hwc1SGIEKlBUKfEM8=; b=TJ0tNGSGZRGgKQSZ/w8j8GvIrg30RpSMkj9ARWPv
	0A4oGSadxzpAE5CbIohg4BgfJnTIzy+egJL1Ta56BkZYmJI9DiOwov/ZisGQsc+g
	Y33UNwN5M2R6RnqsbSeDeiyYg6azRHArHKPlwmo1vNPo3nI7aO/O/ZpKeFwEt327
	TPkf4FPgjAtM6m4uNkxtCvRDjJWc0L8poytzvpMciqadtw1QKydljirDrzKfGAXD
	hkDd9mLr3jpBJLE3QPo64uxxI4e9uP/DYALMHgo7zSEeUD7OkqWGMckxJ3kAImPG
	9BmM8e4jHoEVHLoOg/kledKVRYhHb4DiMalbdeLWmARUpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucj14p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 12:13:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so20326691cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018384; x=1786623184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sM7RDCxH2vl6P08Gm8MUGOs3M/Hwc1SGIEKlBUKfEM8=;
        b=fuOC+ZAW0XhcewuvrMOTtugLntlhVHOrGCaIXFDaig6vFH6U9rwbTn93438xKH11wg
         iegRaunU+Qb702wKAxSJRWkOy/TtSZGSf5mVewdGUx8kDiCRU8W2QEcwPp4zCvhZXitS
         QNJSjiyGcTjTyjY9VPmhlyBmYMnI/QQWy+uNeGQCqfI+sFjcJqtWCZrSeWRp24KV5Qf7
         HclYq4YtcQvaDqWXSlPjMSn8jUFsJzALi0XQloFpzNnDGh3yLekdz+KU3TSw3ng+oPe0
         /xOWg6VTHDO1O5NtsPkN/gdlNdpLbCX32yMSeSEAGNqDLUIF8U+w6tq1a6ASS/kaWVht
         QL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018384; x=1786623184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM7RDCxH2vl6P08Gm8MUGOs3M/Hwc1SGIEKlBUKfEM8=;
        b=aDNCj7WR55opWEFp9qDm1H0dmYrqW/y28RRFpTQSScGN+N0xK0y+RhEc1tsX1xjqAK
         bHTp5LYbqvCFvi8bdQyrSO0fqx4EJcyipYGFU7MlMWDAu/4Vs8Zqt3+mHWocOAx2ks+n
         uuD4mq1GhkYSW5plRsgMScU2KMXKQmcL0z11xIxvgQCcQvHo5ogo5Mn1X7ez/rhRnTlu
         AikZswpFI/9cf9334GEsZNzFiYHwjoVxvSaPTkpwm1kEPmJ/03073G+hXT2dO2VL747s
         k5imCK5RtsFJAXFbcthrNq1Y3SMfIBn2VUKuLbb2fDzVwmwvFLM/v5xQYlw4NdxM8I3G
         0R+w==
X-Forwarded-Encrypted: i=1; AHgh+Rrocu9jgHCpmpcUr0JWn5mmsvoEQUM7yKUCl6L932hbU4rY+YlWmmIlqJ9cdei9wFF0u24O2i6oaQLwSQpB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfrm0aDWd+1LCjCBpnLMuk7gAnL6Us/zbXl49+m0QWpWyw/DrP
	koZC5PlmuBVRVc1F243KveSDNAbOoZctLMQYIXJh+ZBLL9cEEI4+pcjV+uoHgcix6OwX0J8IgEG
	woYe8f7dz8AsEJH1wpv+twL97h0dYBcINVyERdTZF9UlLlS3jneV+utwBqMeo4b8NcAz1
X-Gm-Gg: AR+sD113iVO8xI4rSWASbey5gPeIPh8PAPptsIMz+JBSF1Tl+fX7avAHTxTwh9PY5kT
	BUyrDXtV6JLf1fWskDsskHwpbJkGd83zSyKfJt3fCDd43dgtOzV344f35wjic0zIvDZURG/vrnN
	UMQo1cqxhK+ysSRvh333lK2btC2M5laePqRFWedbVyikz3qd/X92F7OOmZmr66/CaINAcdOFu1K
	g5DnOUYWhYOZmRYcIlN9pctqe5UHB4nixrJENhCfo8n94PuQfZgh/9rNoBQGRilLzj6lT1Or68J
	r2BI71r+6CuoiJGMHKJgnAKjjY+wFDPiLuhzsKBgkkzBWypwd5Dh/nQx0r3Am7erPwivd9AcpDZ
	P4l7tBqWqLvtjTZoNXBBxo0aNhd2xdxbu0ByWpxQ0qT/I3ml53Huw68684kaAen1pVK5TzlLs2N
	ouZvOR4OYIuK5FoA==
X-Received: by 2002:a05:622a:14e:b0:51b:efbb:fbc with SMTP id d75a77b69052e-52ce6183f7fmr132763941cf.33.1786018383973;
        Thu, 06 Aug 2026 05:13:03 -0700 (PDT)
X-Received: by 2002:a05:622a:14e:b0:51b:efbb:fbc with SMTP id d75a77b69052e-52ce6183f7fmr132755651cf.33.1786018378699;
        Thu, 06 Aug 2026 05:12:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235d17sm698759e87.2.2026.08.06.05.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:12:57 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:12:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Add memory-region for audio PD
Message-ID: <xbw4lpvqi2rev6ehypdng2q4mq636553ftcbcfm6wdj3aa7qfu@d6fctcmuxo57>
References: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfXwz5KKROQoXL0
 0Os59yQ++h0Af7LZ/cbi5U57WPgeVy15yDMP6oeploOCV2pRr2ZUhwuIFkVMd8RWuzlovmV4zno
 cf8OgLYkVsJ7w4y1VVnp2avXu5xqU8M=
X-Proofpoint-GUID: qVLsSeU58yxB4lN3XRpjjeTpAabPfjkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX2fAtmiEZqXW9
 bdQuXj8s4neefVOEK/g0Jchv4VJRVa17SnXo90EBCnLBb1WGr3kLgg0aaNW5tuWUVvG3MoT1bo2
 a4Ggh2JBKU722MzcvuJGsi8r4q4gLkb1jJR8c6e/2BYKZRNYpA0c6QPE5cGo/7NKneFgYF/NreA
 RzST72JMF7P7n4HX+jx+GFvZXEgfgaKscC/n57l1owfViTgII03vVHT7xwUydVRhR+VQjLdWlnT
 ce9kLSdM6HOvCwjIc7Lbwk4/XK3kJ/JZb93BeGpUajCNfT2UeqWQfyAwm0//wRkqA+z2DgmFr5W
 4uHatcmaxHPjbCrJ8vPUKhFbnMwU5AYdmDCiScXmIANKn976UkR+azUmKGACJXVwaCrV0lbzwVX
 oLJ4gDoTZ1jUkuw0csGXYdTwR4pjmea73JGyeMmknna9vOzyBxDESc46aEvJ/+Fn/FMbrhpQWdI
 z3Atag1dQc7VJ2wVx0w==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a747a50 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=u-a0JlRQecB2z73C0TQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qVLsSeU58yxB4lN3XRpjjeTpAabPfjkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060096

On Thu, Aug 06, 2026 at 04:44:41PM +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> @@ -2348,6 +2356,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						  QCOM_SCM_VMID_ADSP_HEAP>;

Either put it on a single line or align on QCOM_SCM.

>  
>  					qcom,non-secure-domain;
>  
> 
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
> 
> Best regards,
> -- 
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
