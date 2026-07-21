Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123894582CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672503; cv=none; b=BGq29XBFe9neweJY6suiuNzn31iHajiip9fGw1/L26q5TwIRSb8B8BMwu0+CvEb1ubZhd1XT0QQ/gAv5//KwV7RawXds3r1V7JQfspNQiYmeqAXK8CfiLngMvrtncOfUTD4TK26am0bVvbCwQqJvtzf5sQsj4JIFGf2fmZDgef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672503; c=relaxed/simple;
	bh=R/Zzp28ZXI4WEznc4Z3EySfdvh0us080PPtKrUuFp1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiZbkajhxabGoVu6A6IB+zOtqPObhJDCCV3TkATiI8dX7TtAHSkAaCvK7sLJ1nPN4EdqZgXME5WuNJNqI+JIbqqepLvp6Q+m+J7k/9/jW4PWvleQXz0Zk6rrP3N/+Ntl3A138dRn6Dogb1+UDx12KjyfEJKZ2/th+10QnYzXplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMmXF/mU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig6CSeiC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMmXF/mU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig6CSeiC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlMnf3954291
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B4vjMLPJ5NAnEPS3jE48/Xhx
	Su+zIG0VlixIejSSPxQ=; b=cMmXF/mU9QgYSLuwy6kwoXFZLSphgeqaGXDRr9Q0
	2dk/35YQnN+jvy7Zqvv9Ec99pR/1is3GnSsN2gQSb9H0SDqHCutWvGbQevn8HdBx
	ioUcMXKuYNHgVPJZjyD7V3vJlPNc7l6TpCRz2U5BzIUOjI6bX5B7AFXjTvgNXVu1
	nLpnE9wDFsLwPtmXhjeY64b8HdeYTdIY+idV5ez5EffJxRsx65A8b0VVamPlo9uO
	JNXOL64tW6OD2AiY59Zykvxle9IHm037LB/Vf7CFDCEzaDPBBuJoo4P7hSXCQ3Pr
	IaGJqmSXOSLomP3K3VfY273fl0xar1GBsPKIxZ5aNsKE2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsu9d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:21:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso14480371cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672500; x=1785277300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B4vjMLPJ5NAnEPS3jE48/XhxSu+zIG0VlixIejSSPxQ=;
        b=Ig6CSeiCFal6WphazNl/XM5aiNqIibENKvJ7tg7dWulKPIvG7B7r4L7dnFrC4cvC6O
         0XJqk32K42Cc/U6Dj56tECcHHxihUgVO+XcIYDoPzFsI1wUZAELomUVNOyEQViJp51Kf
         NwFna3XsMFMETbvPFCGs4RlwrJE6S/Q9AxC1YKamndeV7zbOcWSEXUBXR3vELWpvoFQ3
         ohqH/SSIMHZmT+ZmvY+0+R79SXPSJlXz28SAGenaxtG70rtlpjRlhETPbsWpLoS1/KSd
         oRRlc5H/NUBlWO+1Fn44CtvjhoxKDQWnTuX9P8blK0Saqpo8YqfZaXw00STAIchL+TaM
         uIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672500; x=1785277300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4vjMLPJ5NAnEPS3jE48/XhxSu+zIG0VlixIejSSPxQ=;
        b=FBJdZka+jnD2NSCDcS/2Yf4xxOp6bWNbT8MVcdQDHlt6PT7eWBowd6PtvkBy/GWeeE
         +jFID11CKU2dXLXQGV/8SJzDUU+EduYRgtf1HZXR9pT+JaDzak+6U18W5nd0K2Pv/Ms8
         3MGu9hbMGe7s5c1pit7Fgd1U/o3Fc3tDEJ7XEzfYLMkgMY45gMdQcChxKhvjjIBDGKI3
         73j4mYEOu5AhxQEv9jekDgvJZYo68NKANUSeAC9As1yLZkeu0RPvW7T5rXFFn96hfmKk
         k38GfK7nLa6dVDteTA4mWuw+6rTQ2gIB+nTnkufJ0nNY6eqzPGZVxa/z6p5/dI5NqRkT
         02uA==
X-Forwarded-Encrypted: i=1; AHgh+RpmXgEPUWl31PdRtzlxqNB3SjTf8L8zun7WeGqnnxTEZgqT0f19D73fteo6+3ddRmf39TUlKSA7J8g9ZFoi@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCIvRnHP8tCz9p9TVMSnXZYNvygdNJrImKJX3K5ASjtkDV8Rs
	zZ3wIeT0FOeRpgbCt0xuaek3OXpBxLvARcB4GX5F76uOYch51ep+X/Z039ZPw38GGVyeiJJ3COg
	5TIgmG5jaMoELsqFdW481DgeD7pzlQ1K2dy5a8Ap5AOt/rKRYXPt3nw95m0rNB4gJ8/8kpJCfaP
	yi
X-Gm-Gg: AfdE7cmr9GLqkWgThFn2Q34jDDuJKbvbKlUkfS0CnInlu4baKEeTpFT+OYm7RNYvBH1
	UkIXtcGpqot8uprVb9KMm4st2XoIv598/g8E5CbkxbXuRNDYHoavVvF4ApjVttxnFGCQRoY2WQP
	4RNIPJyq5RKf7BIfkn5SLrXfG04fCPVH2G2/RspAI3htwoqTqn4SsF5OGIAYxzpwvvTK1k6K2ZQ
	5T8gpVcL9sBnqpg73apUNA5G69Q4/uZ+HvQe633qJLi0uFsN3VX/QaPpVDjO7D6tkzaJQIRLy2A
	OH1d3GAHZHOocfg558W6lspebswjZtbavidVRY9RxIV8wS8BIlRD6LHpJFxCsMBSn77ku7zGKgQ
	V2Od3J3/71GkXU9xRbWO3HjxYEc3G14W+5sVjr1uQZAOdnug5Mkd4XHMr3LR/Dc5o35lOge3am3
	0eEH/ucMZ7SME0xw==
X-Received: by 2002:a05:622a:306:b0:51b:fca2:af71 with SMTP id d75a77b69052e-5213e28f185mr198251791cf.42.1784672500116;
        Tue, 21 Jul 2026 15:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:306:b0:51b:fca2:af71 with SMTP id d75a77b69052e-5213e28f185mr198251431cf.42.1784672499566;
        Tue, 21 Jul 2026 15:21:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm136668e87.61.2026.07.21.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:21:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:21:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Message-ID: <uhpxceqh5xafvnxvzi22fvifsczzdom73sew3dy3oedrhggzau@ygovn2qjy4s3>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
X-Proofpoint-GUID: ncTiIvME3Wc_EPDGsuLfF1oF1TpnOgnX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMSBTYWx0ZWRfX5eyepYtpBaH2
 LyVCtlfOqsxaOWjGKEx1vwx4odqaei2vbAzzIs32nco4s5Wqv3HIVraG7eo6IoipuQ5LQnIwCn5
 r4hpNbzkAeGjZtOtM/sHwXNh9ww9VP4=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5ff0f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=13kYkAZBl8qwplEETVoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ncTiIvME3Wc_EPDGsuLfF1oF1TpnOgnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMSBTYWx0ZWRfX59xy9rU1rm41
 BTGm/a89jduTnZ3KUhs8YzYXTi18H55I5Gpk0vdf4WIb0ODYWFKW/Da3fpDIWDU0fSwg5enECFh
 JWlU8kJpU68c4Ul4vusyzit0C8M4RMPVHfX6PXkSkcy4EhYYrjNLkrhz1nFEEE0YxuXg/wFcSrw
 MRJVfBUvUlWw2fZ4whxIHrOZ/4KHpWYceXUvXsumnEj4USRZKDrR40z8AwNR9oXaTo2N2xlvQJ6
 8epQSUwf9TC9gToiH8ALxZajYHr8b/T1wpA+nyoVTSfs+ytXYc3Hgo4ivEu2kJC7Rtlbl1t/JVx
 ItIH70gZ6ze3aZ+YXsH7SZAyk3bJo3NSMdeqM0PqV2tb6evmoZHWA0nHoUQWcrw7nDZs2ELZIgf
 SrcWN0DhexTP50qkvcOaFXOowCE/DbxE1t6nNSWurQoOe/klOL9b2/7WR4sGbj0JBtQfrTUXT85
 XG1acNcwR5yk1iFUCoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210231

On Mon, Jul 13, 2026 at 03:55:46PM +0530, Sneh Mankad wrote:
> Do not mark MPM device as power domain since it leads to idle-states init
> failure because of probe dependencies.
> 
> CPU cluster power domain node is kept disabled and hence CPU cluster will
> never power collapse. Do not register MPM under it in this case.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
>  
>  		cluster_pd: power-domain-cpu-cluster {
>  			#power-domain-cells = <0>;
> -			power-domains = <&mpm>;
>  			domain-idle-states = <&cluster_sleep>;
>  		};
>  	};
> @@ -281,7 +280,6 @@ mpm: interrupt-controller {
>  			mboxes = <&apcs_glb 1>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			#power-domain-cells = <0>;

Replace it with power-domains

>  			interrupt-parent = <&intc>;
>  			qcom,mpm-pin-count = <96>;
>  			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
