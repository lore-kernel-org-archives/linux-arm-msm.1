Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027742;
	b=4rFDx5BP7Z5qqE1EG4LyRuL/v8pKVtKY8q5jRlbWPPkltSPlVJOwHi3LxfrbsZi6g36d
	 yTd/oACFICkJBaHQRvIpMM/ID4S8wq1yLSqhr3JCdopimFl59Vzi3SQv98TxAW9yGvAju
	 6kq/xEJ9FJRZgK5MIrBNmGPCwVvWUStCY5duWhwJVkmKBb9JYTw21yhqhnmhw78EuFMlA
	 qVZondhH2s8H2vZnA0TrvbGkyzd9ErBseLUVWT8aP+5pJk2rUrO3lW9WDe8DSH9aF6WH9
	 bQPw0n83M8jVka+TAmgDySomUyWw9E+uY8o0zn0Urfqizyz0GH1pRauIioxKuGROQ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
	b=Hg5vmyd0ICFeRXzraGWjlahGEqqditO3tERDOm9T8TiaMZGtRCg5s6jNTph7b5iEXHu8
	 zJ1kZ4NvxgGSxBpX7m/gKIyJaC56Fyp67OZtodUwqGVaWcl1Ly3P3I4EVXYYbDfGL/SER
	 EIijH3QEVnInnfX4z/KclEIJJO2JOXmggPuVkkzaaEyeM12f5Axe1HfX6CaEEGl2TMKKe
	 4u99+eXO/4JA9hh3ERniziYm73eGvpRuBoOPlNXnh0JPBdpWfk61pS23upZYSMhK+1LEh
	 7Xgjk01Jgxzo/aNdMpIZzNzvvt1m4CMSTOQFCLjLPEnqCMDiWzrk0WOABRwaY6ed6zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwsnPbGF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BZBFgURD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B160A2601
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23B160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwsnPbGF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BZBFgURD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHG6lX3412710
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=; b=iwsnPbGFYqKmaNAt
	DiGWZ1M01D/wvg6LFujZOApqG9JB7y/vmCHR531TUjmKMEc5aG+SYlIZMOxWjDRx
	97NiHqE5f0otAXE4iDSEWz5dBMmhDHPOQP4o9dvaMuA180YBbiOjNGuaV5OD/VlK
	Y6OuOvW5tQMCXlvsK+J6vqCDBClAAJITr8i3wSuSEZd96/k66O3PVYVuw30kMmjJ
	qJNucgABrbEfFbzrsdJNHKIRA2LE2fA8ZEGVd/0PF3kH8yMKltVMbGZlqz+pIbG2
	/3HB4bY/NKc3wJazMpV2dZq9mW4cg7DgeEfw4GPzwXW6UKefqXmaeJSEjKNysnz2
	yRmlpA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnrvvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b238436265so1021588c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027740; x=1795632540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
        b=BZBFgURDnhP/eu5Pb54YAlKjgI5Mv5odxLjCmBOe4BbrxgdfYm3MmJlJlsyOu7kf0N
         hgVRGXNBfmx68QR64MqsicqSxXfzGnrOd9BGpfUyx3ZDAgCPDQM7twB8QNCQR03m1quv
         Xpehhcf3v2oFlmXe0OmqKNyx9ZaCfoGMfcduuINOvPco0L0iUINicmD2KHO/+eJDP2kM
         epewktkXVn+9Ll3T1t663XIK4tMc/ciwo0iUcRh/NT1O6sip37ESY8g1WZiHKrZyxHi2
         3NjgOaAfusI6hODh8rfYDADLoAhTGaq/wEZZZnzlcjQpJg+TDIzDSnk0dydGOsnHY8nd
         IP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027740; x=1795632540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
        b=pgwUxM0LswT8C2dIs+3HpxzFKnv656cTU+V8qT0q5xCzX35D7mroxE5+ZV2oql1ar/
         nyppSbIIWecVBy7Ux0oo0I7WJ0lTpZYIwmHL7T8RwQg3XYC/5cIg0z4KXWJ6iuOJSlPq
         DaC/LTWa2I1LNl5y19y7S8TkXSL8dmRrODjDdf722WAvHZN1qfYbMRPPjwcLmpV5KUSU
         xLO7CP7w2/p1FJ/l7Z+/o848Gv4vv7yGDatrQnMWPx4YFzcO57wkdxTeD+yQzOxmRbhR
         nHVF3fHZ2l1KG/Aaumh54X8B8gHwdZJre2QnLr78n00TyypFvzI/xqxLb7I4jaI8721y
         fThg==
X-Gm-Message-State: APuU4Z8CzZ/2V5+hwmMN58f4ul5ZSWKF1JkV+tk4iRTcDhTAhclRV/VI
	0WINRMaWfwgH+sdFn0kXkKZ573WWR90hua8E2ZWC8YDx9shfCKC4JJN3bR3AtfY6I1NNf7Dp2u8
	rkgFY0lrJZpU4Vskkv9w0voB3oExHTMIepF9trBNGfFyTMGBoB0dam0mR1uoSO0oiVDH6
X-Gm-Gg: AYBFou11/cKANHzaHPA+hDoGYy4I9xePzi56M4FEsUESoiINySM+QIYJ7LhOggJjPzd
	w7ifbQ9oFGsLZIUVZo84nAhZoQRhPz3U8DHtzZC9UANSGCTQMthZ1QVnvETWoUdZeFgZGP2ysRk
	MQd473uqTYMSNJGyt+uFjMPx9b/AN/8LnVDvQnVwYG+X6a6qvffzM/A2aVytueyaA7sLHeSIV7u
	PU/VV21dutjw9QKABMV2x8T5j1zXARWE3p/AgUckoEPrEbKcM1qC2CshTG2rc9Fn6Nn9fx8OHzM
	hFprnfzCQ6+YkaATye3cV5EAYlN1yrm/gRO8FIT5PcOnriuCwOQDTS53VYdVcXqz3tXBQ+0DV0i
	dMgZ4Y03P6pRZUFqhwDw7Cdd47/V/WMlur4mwjN4uzJwjhLsdshT/FIQyPa+FJQ3wihvbELK7gg
	==
X-Received: by 2002:a05:701b:21d3:10b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b543cebc62mr3198334c88.24.1795027740387;
        Wed, 18 Nov 2026 10:49:00 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:10b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b543cebc62mr3198301c88.24.1795027739680;
        Wed, 18 Nov 2026 10:48:59 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11782234c88.13.2026.11.18.10.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:48:59 -0800 (PST)
Message-ID: <f38edf93-6df8-4771-8e89-c1d150ce3f71@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:18:50 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afdf31d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2DaYFnQSzUVrrlYHPwYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: MCoKauQX5uzWPdGIkr9dkyv924N0hAMN
X-Proofpoint-ORIG-GUID: MCoKauQX5uzWPdGIkr9dkyv924N0hAMN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX68d96gDyf4J3
 3nPr1Oiwk6rVa7CTRPqARM0uXtnqp8D46bsopUaAt9d8gNYGgd5yGB2lEm24R9N7q6+WMuCczUt
 A+/ygiglsDO1+RckgNcOdjIXL4H5cvo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX0M2njGCELoRF
 uYDnj9zH1KuWnvJVR8RowInUxBFZvohB+a9ml8OXbz96D56YV9+WJWEle+udJSrT0vl2tXRUUDw
 c+yNdQOUyTlYZAFo4WdYI87taKxYtmXD2oNagxSyoXLsVM6HY9lOvcTACUd/O+9yc9uN6nYZjxu
 W/zfrHyZy5WKACgo+9Mkn2nfok/ygvIC4DrJl636SihnfNtDVx/oJlzwdJThkEFKvkEFUiOajip
 pVnyKsxeY/M74RdYJnyudxtQRGcuurQesVoWcNFkIJfMbhP8bwEUhuES0w1W9KPz0WZxHZfChXP
 fYmc1pgoMfJFBVjxxWazDAPVnvApUHBJnGGGmgp4oE/Rw2REt33UxvU30a4w0sNW14bENoDEsVN
 odHMrbFbDs4UZV2BFotk+6CDLiN+pCrSQy1hieTcaLs3hjK62ATAOEv5c0cE+7S/z5MPqv/Kuyp
 VTsr8OcBjaFOA5A+vmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the A753 GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 3e29c43ca9ad..cb5ee6b68779 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1717,10 +1717,12 @@ gpu_0: gpu@3d00000 {
>  			compatible = "qcom,adreno-43051701", "qcom,adreno";
>  			reg = <0x0 0x03d00000 0x0 0x40000>,
>  			      <0x0 0x03d9e000 0x0 0x2000>,
> -			      <0x0 0x03d61000 0x0 0x800>;
> +			      <0x0 0x03d61000 0x0 0x800>,
> +			      <0x0 0x03d60000 0x0 0x1000>;
>  			reg-names = "kgsl_3d0_reg_memory",
>  				    "cx_mem",
> -				    "cx_dbgc";
> +				    "cx_dbgc",
> +				    "aperture";
>  
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>  
> 

