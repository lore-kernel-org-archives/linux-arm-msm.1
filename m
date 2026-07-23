Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F8476CD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809768; cv=none; b=MhMieg7Nt8wMBFFQI+b/qTp52T0npBP/jugcxekphaMELPSl1PZ1Y4cobblL9Ivf2yqD7eOwBRE22ycV6ysxP6UiyN1ibnyuA26wnpPQ1oo7vp+mTkfSQet8tUNRgsor9oLpdtbf6I1N8GSWsEXKiGYsKs0WbOTUA5Ghtv1iKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809768; c=relaxed/simple;
	bh=ZloTRdZTDYA4OW5YMeqnbIBxNBbNc8MfyjcSZublLNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/5kOvxTyaGd40cZHQv6zB0nZzLAxlBq4v6DwQSsdtz/KivfTn+WAqKBEsyhmUF1qrmkAlDm03D//VqYEDhzStNJMfCqLakbAAHbeDfRTUj7o1F87I8L2psZvj/AkLj1lBdEhFp0x2qAxTh9yt5zGKNtFcOy0goFj7vvqgyzYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/h+Zu2u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUuRfnfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/h+Zu2u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUuRfnfk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DvYG3568057
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vppX2tpexLTFy9CE+ACXrq26uNDXVs/CPaSTjqOEkd8=; b=O/h+Zu2ubcuNJEpc
	DbghOqj6m/1j3g/Y+hm51F94oLl2keuh5fO/37oGw/D4MMVVmJHGY0f0nSzkljR0
	J18MZzRRoE2IOzqbD9n+FmB0mcnAXWII6PJfD+dPQatDOhaKbysKea8d5DgGqK+2
	c2bBjtr1uDLzzldXcn3lLzlIN+rBPdzv+noh3cYptbpqJLtVsqehTdaSefQHHPy9
	UkGjPHTHRNKt/McngDGwjhb0Y5G9P8EwzyFUJtuj/IEwyb4KnLKmAgpM0pQrchvK
	3awemnGDMJVJoZCyL6FhAaDGu44cEXNTd5KVlTARqmoAzPjKXJlMf1NxnaWKsFML
	GkmzTw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520quy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:29:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so1905431cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809765; x=1785414565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vppX2tpexLTFy9CE+ACXrq26uNDXVs/CPaSTjqOEkd8=;
        b=HUuRfnfkZW22UrUvrsyAKvUXFTAPA0WS2GpFSqeRj3POQZyHLd/OobP/xvl5XO171l
         c0crDxhiHRLNbgkVjFL4q1u4t3EqMEKRGkxEAfBgKMQ4pa7pqetKZNn02+iyeMgyPUvw
         AviInvy4Qmwmsm+dnI0NYr5gXuTRSWdyTY2X1w1Y8hY7gayqWsOo9WkogwQrd0u5suWl
         TX6GzT9pxi3pauNZlzlsVa7cZNOG29DbQtBXiq4nfLdUbctgqZKaRDX/RoE5SNvErZPJ
         WrsoIeoyFy9ls0M4uv9zuxG/vKeanaTQRdM0WaQQDRmP0z27LqGDQ/wbOG5cBvXprHoO
         2V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809765; x=1785414565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vppX2tpexLTFy9CE+ACXrq26uNDXVs/CPaSTjqOEkd8=;
        b=lLtpD9/VVKJaucv1fYTQzJw3ntrPqcfAtlk5XAfJlo+If9zBMeBpIipc4SsjKOg5aR
         iwAY6ip47Pd1pSYsg+odKOMuJN4svah3X3njmRmysewqYH00dOXqeFqTxpywKqgkQKxW
         wpV1TYm1/xKqvGZqcpxYxIizl4zZqoZZKbx4ZK4eBNQPD9AhL02z2gOi/cqQZNNa2uem
         YrSuZ7ZlDmqSA6QdDFfegtC9lVvAVLuXJZzUXvIFWJYDUu0pPuKd+xbuE2UL9RIPycH/
         XBUJ9Z6EtzPpXsfcfNvm3cdi1VwEMADAv/BBIb2KYccLr6jZ4AuxN7XOuENw1PRiZy38
         YuCw==
X-Forwarded-Encrypted: i=1; AHgh+RpXhn6fhBsu4QgbXUq5oo+8bWvA75bmI+UvMSZoBuZqsxkU2T8waWNEhri8LdStFhtFfml482lJXAIjX8bK@vger.kernel.org
X-Gm-Message-State: AOJu0YwnyPgt/OazY6S19HFCTA/Zn7rDm9DxUZZCv5sfnvR1VfGApod5
	FnxHwivSpU9vQ1eAQrlJOij1ZSdV+eunTYcTXqVRzFwY4MTNrJwrFIUWgMdTaW/ykRRJZ3zBwhh
	3hw/sxxeWP7lK4wzZuCSmtIMn/N6xygzMVq+0Hdu3nOZKLhGbhqcZ5WAME0z67cutEkQ1
X-Gm-Gg: AR+sD139FRpjL2FORwBVvO405MeMxOARE8U9u7Zv4zm/bOjCxD7WrxkQBkFwzxUltEJ
	XrTYpvqMBRo5FycRA4x2Zo3Dk+kjpwneth9j9spKYLagHRZyasRh9kRpeZjHWOmz+Ggo0EFOj/t
	aT5MDd0o1NN2X+BmbMg0ZScXB2OQuT8FaeP+43yM9UMyKMuN5f0nk+ZQUae6JIlb4dmjaguVdqa
	D2VgfU3TP3faGT//9EzqgmlX2Az28/dZW9FZiDZ/siBQCO4+T5dPavDFdaKWDalNfGL6iCc3F5d
	1cLqWL9QeTEPlXyYSRMK4aszUXh3QZF16tr152hxJ5GN7WZyCgMjylD3RCfQpkO89O2YeFlTKmB
	lVQaZ9p1kJ1XSpm9yqQa+ZRDa
X-Received: by 2002:a05:622a:134c:b0:51c:223:3c57 with SMTP id d75a77b69052e-5283dfdcc9emr21167281cf.10.1784809765216;
        Thu, 23 Jul 2026 05:29:25 -0700 (PDT)
X-Received: by 2002:a05:622a:134c:b0:51c:223:3c57 with SMTP id d75a77b69052e-5283dfdcc9emr21166991cf.10.1784809764729;
        Thu, 23 Jul 2026 05:29:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4db36454sm96785366b.1.2026.07.23.05.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:29:23 -0700 (PDT)
Message-ID: <4afe6c0f-23e6-4081-84ac-67d43ced6aed@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:29:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
 <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a620925 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-CvMsJUghkc_xpXdUaIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMyBTYWx0ZWRfX4w5K+55UBZtA
 /ZIvtzWmcWyTaXJDW2SO72qKjbcFqy3YhBSyEvOd49+DVG96fwLYV/k3jfCO//r5G1li9+R/OzX
 8kD+TBPy+cJhcav2QgRxPxDxbp2Ofbk=
X-Proofpoint-GUID: Sa5JB51o5BdWK_UHnbLXpt6wIGSXaTrk
X-Proofpoint-ORIG-GUID: Sa5JB51o5BdWK_UHnbLXpt6wIGSXaTrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMyBTYWx0ZWRfX4q/xmcuwbMxJ
 ZR1oXP52QViVm9J+vdJdcKt5LKRaGAK7adNfDlIfVn97Ucin1Ql8s+H+RVcm8njE35x0/p//WBH
 Y39FvgmxqyutwkHiZLmm8rjLYkDkfP2yXpMvTz5SnFOBVNyXn7hsR88wiXG3lldPUSkj/4oRJM9
 XWkZ/YKyRIqqhBOv3BcNw1zwDYRomxbdXoSh7txmuyXald3yf+bShUq9Hzc7xNFs+J1oJt+uag5
 i3JSSmJ8te2vuxeF+Pp4kyRGLlHs7yOHCnGV8TNWH+c4Tw8x3SKzvsLIvChylEX/aZm1hn9zYdJ
 sYp80qAUoK6hgOOvAwKvNNGmJEAF7CVcmz1nDfhdHRkAWacYqD07yrGBiRJO4Wgg6A/JkQ9K4Gz
 AYd421o0jD1500+GOMWAWbHqNYp96ynJk6aWi9S09bToiELcRWkjc61JQtopAM0zQ2ml/AzgfkJ
 6O5jJ2rhQGU76oQxZdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230123

On 7/22/26 12:55 PM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
> 
>  - The surviving cluster is re-added to the cpu-map as cluster0, since the
>    kernel's cpu-map cluster scan stops at the first missing "clusterN"
>    index.
> 
>  - cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain 1
>    (the former cluster 0) is no longer present.
> 
>  - Point the SCMI transport at the SRAM and mailbox addresses used by
>    the Kalambo SCP firmware, which differ from those inherited from
>    Glymur.
> 
> Add labels to the Glymur cpu-map and its cluster nodes to allow their
> removal and override on derived SoCs.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

[...]

> @@ -274,8 +274,8 @@ cpu17: cpu@20500 {
>  			#cooling-cells = <2>;
>  		};
>  
> -		cpu-map {
> -			cluster0 {
> +		cpu_map: cpu-map {
> +			cpu_map_cluster0: cluster0 {
>  				core0 {
>  					cpu = <&cpu0>;
>  				};
> @@ -301,7 +301,7 @@ core5 {
>  				};
>  			};
>  
> -			cluster1 {
> +			cpu_map_cluster1: cluster1 {

The deletes are recursive, so if you just delete the whole map,
you don't need to delete the children (and can drop the labels)

You can then add a label to /cpus and reference it, redefining the
map in kalambo.dtsi

[...]


> +&imem {
> +	reg = <0x0 0x81e08600 0x0 0x380>;
> +	ranges = <0x0 0x0 0x81e08600 0x380>;

Is the size *actually* different between the SoCs?

> +	cpu_scp_lpri1: scp-sram-section@200 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x200 0x180>;
> +	};

With this shifted, is cpu_scp_lpri0 still at the same base?

> +};
> +
> +&pdp0_mbox {
> +	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;

Please keep one entry per line and use '0x0' instead of '0'

Konrad
