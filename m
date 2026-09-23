Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80AC471D10
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154503; cv=none; b=ATSNqu0d5TriF2tnpGIlMrIQlQKEct3+XwxqXDC5J7+NFCCIBnoyEwd6HTUYIzPPUscM5iJzasbeS1yD8A3TI9Iexn9GTyvHCyGwZMhzA1fwAZ2x9kc+KMN3M/YGzrXe6BcJxng0EYpB3/Q+wDNpO6sN9YJGm3v20DWkSDlV4jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154503; c=relaxed/simple;
	bh=HmufmJa573ysgcyW1CEuJjyNusgAqKjgAObGCw/c8mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLWK2E2WCYst60b8TExmgC/IJR+xNNUbSdbgGC6OasIKL3XKH5M8SzhMKXPjvqw13Bz5e6Ntt9avhV2IvBrht906CP955yYpsExHtb9Hy7ZQLXngc9uIYnMpMyGiUxFV1sepvxICu6TZyPn8BzWKeaCnWHYbk8yQhTD403TQTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXDeY9Wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5cSHzjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXDeY9Wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5cSHzjo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JNk03853510
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl349BSr4sinrvJnyePpP2EvDU4xX5QhfwTLx6yJvco=; b=KXDeY9WvLIhUXMoA
	3WDdAypjF5G9norND4P/ZssfTXFOjDOys1dhEZ1WmwuCJPscQz8AZf1yBsC9RaVh
	ZRj3j4tYaN1S6tf9UwV9LrZz4WcqF44nCs1+TNSp+QtK4+rWSJkxhDBeNnmFocig
	H+0Z398e5xpPxRDJdmruH3xmZi/BF8s3nKW6Hcvhu/PpOfCSoQ/l6uq/BCnRRLAh
	v6qjtdwInEXtdhSFeNz13bRydO52Zezag04Xcol7ZK0VSR/uw+fItIT2pU7rjb22
	gFrTf0UH04o1njiE7qvMVsR2yiz9UsJEppD44C0/AppXosMX+APmeQzCEEcXIIOx
	Hg/AyA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3hcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:08:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14371f7ba1eso1072018c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790154500; x=1790759300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tl349BSr4sinrvJnyePpP2EvDU4xX5QhfwTLx6yJvco=;
        b=h5cSHzjoYAkXYII3aNRMzfxh6Eff8275eqTYeL+1LbI1bU9iEt+yNTC0n56vJO3T+T
         LJZNkulDUuwMx+14BIN+Wf+ZuwVw+uEkoK1W5dIkIMgzV+9o3vte4ZglfyS/vJiVA6jE
         Uah1v4GFtXej+Akoa7yQJ8vVyCIEMrukKJwnN5zsNEtItiw7gLz2KZ4uTTUr+st6SZHy
         yk9e7ROYxq8xC4R7oedk1SDk29PHQzOmcYZKYlcUoJjcYQoVRmIqxNGewx5hXANRJfzp
         XIWe3h5i7Qn4GBz4h0wwNk3O/AnGhN3jy8oaOijDoVw3dWN4GBfnhVPW5nBzYPYRbF08
         aUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154500; x=1790759300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl349BSr4sinrvJnyePpP2EvDU4xX5QhfwTLx6yJvco=;
        b=tb7WlqLa7ouwwP+yAQx8sgYej+KoHZcdbHevQey1HhuGWJODlJrHt3F8LQPYCVDfzZ
         opaNKGdNpuZ63yLAAY2OIwzadTVrgTH6u6d0fMghx+zIJlxT+Wfuv47rzERUilP2Bn6g
         DJGxryeCedY+dxIyHYqHdh6KHW4Bf/YW7Bv6YNfd/r+uE9CYbceJgPiIwSwrIZVRTDrf
         nmr7H0ubAPnrTc3EAKfrVMR5KUIHNbjEjTMxLHtf8eKcJISBPyUlc/HgcyloG4nuwzSj
         onHHxkmi6XWdkLQdUQH3em8Dkj6/6eh/HK0ZeoJawBn08ik3DWRVyiykoS6lG4GsIwSG
         nO2A==
X-Forwarded-Encrypted: i=1; AKwUvBxvmXhQtYuHPN65Xps7I8DOAY0Md7BDVBg30koRHcLERrGbgXjioI8+QUCSCwefzGBg/ezCJs9UPrYdHDuc@vger.kernel.org
X-Gm-Message-State: AFuF++lF0vfswqfSI8N6Qxmd3v3nvQOf2j2aOzYoeE6c5b/ILEKG5GBi
	AhT04DmaB+Gr6WUmEWVEwzA8gBOq80I899PSTjr38/y0ZEg0Pgf7lJ+rSMOqyhmB/e1DC738CAo
	Ms+qngM3EuwGBI4qs0auWku+ZaP5v1psESnE8K70vXoK8cnTxEjwtf6LSWqZzdQPYhPOH
X-Gm-Gg: AYBFou0lx82DIJJN5PhB+qo2kPWnAwaH0IPthG9KTdce6yagYcwuEzbex61ji7batAe
	Zk6O0feGttnWOwbS1K2Ytb/8ULJQJyE8AfhvmWxgrHvJ7cLVDkLaDIWemfr9DbCzOQ5X73DBilT
	wqRyDfasua/9bCGfSUTHBFDEueWgA4t35udVEVGtPKlzhfA7PcZVjA4d9bVcXSdnLCvhwan2aGC
	jsgRYmq10++nojRdfEgClruzmXKdniJ55aXXKFZuiikXuwk8Csa0wuPLZWbhE7bx1Isj+Gs5p4O
	87IHJ6iF+qJrRrK8vQd5UwlaQCn5pYhiohQRTMJ9jkrNeOG+9XVfr6t8vW/NIcT7g47IbxVSILm
	x6z+XGNBga14+QVTcF4BQ8Uus+4yNndmcKYIfig5pwFH4r+RuIknzOX/j+BcwymvxmWAKnRxTDQ
	gZgXO7ndRKlc7AJ9D3
X-Received: by 2002:a05:701b:4294:20b0:13c:d318:5b91 with SMTP id a92af1059eb24-144f90a701emr2586506c88.13.1790154500260;
        Wed, 23 Sep 2026 02:08:20 -0700 (PDT)
X-Received: by 2002:a05:701b:4294:20b0:13c:d318:5b91 with SMTP id a92af1059eb24-144f90a701emr2586477c88.13.1790154499532;
        Wed, 23 Sep 2026 02:08:19 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98bf501sm4941273c88.14.2026.09.23.02.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:08:18 -0700 (PDT)
Message-ID: <4bd5d1ad-3d97-4ef9-bd46-790bcffd5ea7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:38:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9qXkIxxi+94n
 l9SUikhT4D4lbtz00cPd7XhRg3p2hY2lL1NQaud/fpJbaDQ2DqzV8VXv7778MrfDtVhfbeUvrKR
 3IIqMf9vEjX+AdaVGrrJFGSAYpGFFrATKtyNRtAU91acN0koR3Dw8OTbUCbBz5e/OOycKnGseGY
 C1Kv8g0fDXR2SokbxKkTTSPs48Fuj7KXW2mvF4p2BLSp5ZKZYGgFWWk59zCPcP++5ZPJRl/zyGm
 XtyB1472IOMdwOegMFo3/Wff7EhEGg6+84kxtDc5FAW7dpas6z6+CGj4NJ62lhPu5G9mMPQHlwN
 OQihwIwSmTGA8hzLUJKhQnmIvOGDJIr8gdR+bGKQb81mvYhIdO+KKuPPK7gsQuPum+510I2m9Os
 3IcuLuji78YXxdhPu7Vg/Ib2pRr4zW+/o2pySakwsuk45Py4kvclAvH/ivZnFbw5gHuH9zcVrA2
 wzrXokKlFZmZZDlnphA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab39705 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gcWZ9kyA7G0WfbYWDhQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: OuLuFbz5LPcXul_jRt4R27hed0Bqto1W
X-Proofpoint-GUID: OuLuFbz5LPcXul_jRt4R27hed0Bqto1W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX87cyIZPAIKW/
 wQSEOsAY/svETgxrDbQKKLzbjLE1URyxrtAduoiJzbGMhPSYWpegmYbzrFrn7admKmlzsc3DY2R
 zV0Qk9yVEk4SBqnEN7E+sbQMSQoupIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/22/2026 2:47 PM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Dependencies:
> - LLCC driver: https://lore.kernel.org/all/20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index e0496fd40c30..6896bda14ef3 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -2071,6 +2071,46 @@ watchdog@17826000 {
>  			clocks = <&sleep_clk>;
>  			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
>  		};
> +
> +		llcc: system-cache-controller@21800000 {
> +			compatible = "qcom,nord-llcc";
> +			reg = <0x0 0x21800000 0x0 0x100000>,
> +			      <0x0 0x21a00000 0x0 0x100000>,
> +			      <0x0 0x21c00000 0x0 0x100000>,
> +			      <0x0 0x21e00000 0x0 0x100000>,
> +			      <0x0 0x22800000 0x0 0x100000>,
> +			      <0x0 0x22a00000 0x0 0x100000>,
> +			      <0x0 0x22c00000 0x0 0x100000>,
> +			      <0x0 0x22e00000 0x0 0x100000>,
> +			      <0x0 0x23800000 0x0 0x100000>,
> +			      <0x0 0x23a00000 0x0 0x100000>,
> +			      <0x0 0x23c00000 0x0 0x100000>,
> +			      <0x0 0x23e00000 0x0 0x100000>,
> +			      <0x0 0x24800000 0x0 0x100000>,
> +			      <0x0 0x24a00000 0x0 0x100000>,
> +			      <0x0 0x24c00000 0x0 0x100000>,
> +			      <0x0 0x24e00000 0x0 0x100000>,
> +			      <0x0 0x20400000 0x0 0x100000>,
> +			      <0x0 0x20600000 0x0 0x100000>;
> +			reg-names = "llcc0_base",
> +				    "llcc1_base",
> +				    "llcc2_base",
> +				    "llcc3_base",
> +				    "llcc4_base",
> +				    "llcc5_base",
> +				    "llcc6_base",
> +				    "llcc7_base",
> +				    "llcc8_base",
> +				    "llcc9_base",
> +				    "llcc10_base",
> +				    "llcc11_base",
> +				    "llcc12_base",
> +				    "llcc13_base",
> +				    "llcc14_base",
> +				    "llcc15_base",
> +				    "llcc_broadcast_base",
> +				    "llcc_broadcast_and_base";
> +		};
>  	};
>  
>  	arch_timer: timer {

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

