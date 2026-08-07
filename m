Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA23E6DE7
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094395; cv=none; b=S4UTc5MUH10j/6zuxLNYpJ7t/32j2SbiK3e7O54n5xmIrbYBJ4HQIPCfzKPzzjUTSBW1dZvY2pKPWAppzJaIoLaw5pH8QJi8kiwKnFryXXUulRT23LydtGyazx0ZD7+nJgOA4KHKQcrl2LNhFvyOC5+qu6XJ1tedrI9nNNyqrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094395; c=relaxed/simple;
	bh=VLymoo1NLN/4qay65ynTlcAnjVCFuFa9yAlX4jrrcdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPiO0VF+UbiI4Qxme7xJNYdTh5Jv/KFv7avQtezxGJIEwqQloggmtshW83hsShjPntdMKuygVhY9OYPVmD67drD35N8G6uzos6ZDdVj9kdnv72jctzJndCbOWXfzaWSePiBUTuXc+fhbUW7dJPsvDfqlQ0g/Hj+yJ7S9sBCdC74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8B58HHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJvZ6cOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8B58HHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJvZ6cOu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778OuqT3477289
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMGMIjVL9ndWb9OpAvANId9/
	R0HdmcQK/ontefgBJUw=; b=G8B58HHDuHSId2WqxCoJ4Nc3RQ6/5m/G8qk2U40S
	WyPn2AmVppDsRaclS4Gtf9ZMUOTWV7k3u5rYWMk4mYZBTVPLaL1HizgzoqCtNXn3
	459Wm8vk5DSF04f3UWY0h/PvTgnUhqipKDjYfcacRaQ1eMhkPCCLuZOQrxLr4j2r
	KRVFBmUr8c/V6qV5WSlmjkcKo7NZD4vsP0BKg1fkBjcKXLj3vLd3jlqFfyrzjmHv
	hHaVEO6EPMN/N0sawIQyVSelo5HNDjcpTrVArTtH4YGXcPEpJhaiI7u+tUMnZUs6
	w3jerkcprDHr8EKR2b1rjCGvUZVyq7VRuV4sT+J6MEBQMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hb7w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:19:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907b38aaad2so36077526d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786094392; x=1786699192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMGMIjVL9ndWb9OpAvANId9/R0HdmcQK/ontefgBJUw=;
        b=jJvZ6cOuOE/E5f3WxSIvqmeAq21GRRjm3SEUywlBsyy+m5J5EqNL6x+XP6/E+IAcan
         PU77sLR9xhStWvXZCNFLw6t/PB4w6uXKY42oVat9gj/PvlnKJHzgiNTtnbzt2XDPC9JR
         oXkr5JvwaxD0jRfrl/g8c1OcQX57dW6F6AdoAv4WZ4ShkzwXh0n2QKDITLemn/l6prqr
         KTyvHCPUzfeR9WwKERy8er9Z6jQsq+186qohaAnzmNkBgKXttLw/PhRLKaGlmjGoV+RF
         dIBifRJVOHn5ALLV8Cqtk8NeYBd6GoeHySSJTfmUXfTSk6SmGZN3Bp7HUEQin7hCvYni
         vp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786094392; x=1786699192;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMGMIjVL9ndWb9OpAvANId9/R0HdmcQK/ontefgBJUw=;
        b=dtCcxu3aEiFf+aZ4PkGOBZd+z/dhIrwZRom4wvwTmBG/Fw1+R0jeq24UES51QAQ7uG
         uMHMFZJGzqmY2z8a+bdKWxKBp2V8S9xSpKvHyfOheaxHuqc9TBM/9gAsoLS9QPaNOqiQ
         2Y35Eg+7QO9hTNAB5K6aDx28VoP7qHG0T/DjGYty/cyxn+7gCvB6KczgRMnPnzspO9RS
         Jt05gzfoKkJ+eTA/IO+UYuN4jz7MvZWI8cKbZPoEsMMnhNctfAfyr2wP3K9c4VfT+T/p
         nIemA7wkfShLHaDl3x4Xfg36+lRGIUH0ICiO0LdsZ5yB1BNwdUyoaVyUr0nEFP5+/l+u
         fr6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAjYdau2UW4HPb8HjdNPFcfftHFh819+zfYJpvvXqcv+Kcmdab4PhI6ZxAaSxItRMdSxMsnkYpgistI19w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6wqtrmzBoXakwE7En5THFg5MNHbR/C2yHFc0483lvBmiHKH5
	oGwe1/G2UykFbXBY7tzv0LPPG17PiYKRz1F1/GYhC5y0dAiBA6W9QfjKlrTmUz1QSEAo+GuQzjB
	bLFWCtvGctkyi+aHXnbnx6Wvj3Un/3kVAh95Qvd0XbNnpVcLnbioo/ispsHg3i+51r1U8
X-Gm-Gg: AR+sD11MTXGBtRiwsJm6Q1jIVmcpxjo5FT5lYREXLyGqFmnAws+5BorH742uTmfD+Ii
	LWtsVYZd6VDE50zuGyTC2QugfzkTBuGXbebFYAIndqwMytGhGS0y+G81lEuemq+XO5wz/nSvDEX
	9D4OIihj+MWApQyzspPl9zExm/nHyfA2UvpdZmGY11afKhxZHMzHTva2isK2QV5OdwtxFTZe2HM
	cHiSp3eCjbwzPrQJ8X1yJ1XxlWcIBb0C4nG1aQRwiReuhVVZQhQ4GPjSZBhXfdArxJ0Wljqc3QI
	TIjj8K++nvehgiXz1PRfb/tI18p9GaBAVurvtRSnksHL5N92lZ41Nrh9a+wk4ozEYjN6RnVE7th
	cpWwBOvrwEAK1XLQ2Mo+PyVWwdPUm4DFGhuj4f4xkecjb9IvpAo6y5Px5ehxFZlom01bMS8rNmN
	XDQa+t+9vaXNNkVQ==
X-Received: by 2002:a05:6214:3187:b0:8f1:1bf9:5119 with SMTP id 6a1803df08f44-908811af231mr275772796d6.8.1786094391919;
        Fri, 07 Aug 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:6214:3187:b0:8f1:1bf9:5119 with SMTP id 6a1803df08f44-908811af231mr275772516d6.8.1786094391448;
        Fri, 07 Aug 2026 02:19:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd26b6sm371552e87.10.2026.08.07.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:19:50 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:19:48 +0300
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
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Message-ID: <tnxp7geljvcoaoa6vjxhqkgn3ljx3pe3sp45ddtqhbdhxhenac@ggpantlfnvvh>
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
X-Proofpoint-GUID: sfpbGY35FKj964nQQwr8RM8Hzja5fuWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2OSBTYWx0ZWRfX+zvx/DEdsawf
 FIxvwloK0eh5ttajWCIPAImriP0L4NVUA88kxisKjEjhR3Ocz1ALgsTCJr3x/jfmy/mjjX4utC6
 gPUFDer5NIrHk42hGwDPzx0dboQyqugoDc0QtAtDbu8Rok/5R1KjPXjaQYvhsas2BpkR4JJds9X
 RRWl/BivMweFj0ev551EhkthG7vSFQLJwcHU9064i9ytmh1SFWg3L5BF4x6mEe7kTxZV9t0C/5z
 XuIkrBxgkri9luJVD/XFfbWD4dnarYD7AUpgHT0+VycOtJM6eNSr5xueDF36gGghhpzlFpkn5V6
 SkDGgZIOH4/2mbvLZ/AB++/9DXzyzRYDLoxEB4Xd1UU4EVGDBNdoGGB4/OssiY3i6VT1eL7siPo
 jduEjbPt+NfRY1UjAxwkfQZLWtJ0kA19SwsSEZnCOPdHqEU/W6gHksmk0ODuux/Y5u7pwmFB8TL
 zProQpQ376jviUj1OiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2OSBTYWx0ZWRfX9WoAm2mgql6Q
 JESMUUsObcjq2USm8f+RBxIwzEIDqdTnczP9TA/hdvzVXEIlBUd9h38i1R6gY3p4nMViLYLK8QF
 3/3hKWI7jRKIpYJBjztvcB0PL2N6xEQ=
X-Proofpoint-ORIG-GUID: sfpbGY35FKj964nQQwr8RM8Hzja5fuWx
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75a338 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=u-a0JlRQecB2z73C0TQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070069

On Fri, Aug 07, 2026 at 11:20:56AM +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
