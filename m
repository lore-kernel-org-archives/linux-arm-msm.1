Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5B3DA7F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282293; cv=none; b=CxyJ7AuVkjM81hlDg2v+EI4u4eB2FixIkAAkFVPDhSLJrCwutUf5qOceqnHeBmFzV5hmnoOx7MamIBKeidRW/PPO0sRsVFgPApgAsXcA5v73jDJKKUcY8JsbRTOJolmI1QW09QeIrYikSfHVh5o4Y6lpbGmUWYdYoNfDXKk9cOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282293; c=relaxed/simple;
	bh=GFMJuZ2gCDqk1g05GaRNmg9RIl1LY5Z4UDH8PVL+lpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o99HcqViYCaPYQ4wpLY4uEF565/SYKU7uehO5QWAmwncDi9sE/5JvMUc6FE99GNsV5lCBw9LiO2dfRLAUoCAvuIunLREwLJJPpWNvV4vL52dMse3Fsl23OouEg6J2/S1jAHIL2iBvetxaqw7TmkX3dQ8S0Lg/ncd59jeDLHkNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jooec1MV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQZpevPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jooec1MV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQZpevPC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9uwf01120381
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	savSOVyHSFB72wTBtsDZSLcoDOJWNRm4u0Xa/f3dJGc=; b=Jooec1MVsNRy2JqQ
	DVzr0EPDuoCRgMyXZBv/8BQNNAnbXFH9buSeVoc5CwuR7IhuKB6me6uCtW6sgpt0
	LN9iVmhU8Okvgf5N5jsmez4cHxVkYv4sjA9Eiu07sB6JqDvXzSXNOK3aRXfboAVc
	EYStoNzF+jZDAjja0JPAp1s1oiVbj3sPhQoK7/VX5cDNRqQ1xpu2Cv3mTbj3psFj
	fv5oZVAMRupBmFiiWT6d0tINjbue27TXq4WSAM86/RXuGn5N18d/8NSNgWCZaZgU
	0w0+cYjmnm0AgUl6EJqCrdop97YJzoD2l8zanqRgRYOy11d1uo7jTknRTnCBJjoW
	2bpXdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r04t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so16509321cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282290; x=1784887090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=savSOVyHSFB72wTBtsDZSLcoDOJWNRm4u0Xa/f3dJGc=;
        b=MQZpevPCq7SniQVEvmof1c6aNKBItgHK8tj6pYg8BtK5bs84NzAe9YE43eZQuc+isk
         PygrUnJnTycpSydpxpG7MDEtSbNvAxq7zwO6AxCvglh5qusbQXuWhciMdKZ9iEr7IoWJ
         p0EYM9St+YpFavLXm0slY4pZkR41QD/xbfWpe4MIZ/UD34o52xGW4oAPWETmLaVsXzvx
         nlTKxjZ8W9o0ymu0pgQOcxdGepn1VuvrbJW/TsrJ+4fH0TYTlsA9ym7A/Mhzo6uuwrCg
         TwKFeJccrDj9XHOTAjt4FzmqLfd4dBtTnD83oGZ1/U9XXrGm0NNVcFjZXawsO7JSL5lQ
         FsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282290; x=1784887090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=savSOVyHSFB72wTBtsDZSLcoDOJWNRm4u0Xa/f3dJGc=;
        b=TT59vCqyolotCckP8BI2l7+s/DxVf9SkFm8s1jQ4lLhOX5cX1KmhvNMv8jDppjfwr/
         XkOIHvtXk7kVRZyRyN6QqxZL44y1tNSoKt9fGFKJb2EU43dtSNevOVlXaHLIJKZj/MyX
         oIaq32RmB/UfMqTzQfcClEv9dlJAiZ54S/aAAkoIbYA2HH6IYaEmYsCiHcc6EYZHx4f+
         D+s53bEwPxyF/pvBfTKBfo78guwCVBGtlwWaz8QzRtUYv9ot/DsBSpnePQ3/DdYWIkgQ
         d/BqgFdZOlc+zp0DoLqBsLpLDlbgmAiEdnqNPFMvPfJ/fGcMS3gu/yvXLTtMe4jnisNZ
         A4LA==
X-Gm-Message-State: AOJu0YzTii6NljW2i6GYZFmnnPWdYHXn9FIL4/F2+6TU4hvQe/xgAjS2
	B5ts08E6whBZ/+aTmD+UZ0VYIWIFdm4u0ssgcMOIKEnclCh7E9733/rMqT9lHGbeZYSiwadW+de
	RW2hf/eH4gMojbPTHc+LtPL1FGkRjfpGvfYoQkqY81LXuB+EcCZijbYfhgMpxUm/R+aHM
X-Gm-Gg: AfdE7cl036aKTl/mRthTd3tdBW5QZJioE3z7W/Ur5CVEPWW6e3ewQmEgosR/5OTyifp
	FgjiJ0npaIsGJiyl+g1jjMnpH8z9l/n8edTz4vXgA2NMA0YGGUiz/T8wWTf0Kx2C+6C1Lofnsiv
	pVHqvSXJYg44cvp/j53YAzdO/htl0TcVhzGLgMQc+/ZoyvrvDeXL+7YcWTBc9MBeZpJ5S7S5XB1
	AFeOK3oDrrxhc/A3WDoAGf6VJiPrBWw4mvYDPLbJzea1Xtbai/4JmCJEcSIh4Bg9cSRjmf8Dgo9
	H97DlVNX3bwyJlxT1NMEFNgyy5oZ59H54aoAjL81iWRoEw24d8Da51uBaE0WI3COs4+G/2hviah
	sLoHflaTzs5iAcAZMu/GRpBjH
X-Received: by 2002:a05:622a:a9cd:10b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-5213cbda842mr9183171cf.4.1784282290682;
        Fri, 17 Jul 2026 02:58:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a9cd:10b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-5213cbda842mr9182991cf.4.1784282290128;
        Fri, 17 Jul 2026 02:58:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm395194a12.16.2026.07.17.02.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:58:08 -0700 (PDT)
Message-ID: <0dba7e7f-0aee-4fb1-a62e-5d3f991f6242@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com
References: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX7LH9gf8meMwX
 jdzMscPzivF8ERTNo5Mxr1qbRKEp6nUcyNWFurHi7Mif/1gjXR+VrjYihI62ba5GyGg7W73MqGy
 ZrjWAvZgq5lpIksK8qa6UbummpkOFv+656fq1rbhMwrYeuma4u0uL6jVF9vh3VYwQo5IJCNYiSq
 m2IKNsx2GJjE/pPIYHliMGyxSbz68SJj8r1oPZjel94jA7+H6uDzxRfPp2exsgdoERXfyNxMKxH
 3KTRA10LXu1b8Dqj+f4FC8Ov/fccYVswnH5ZnpHV98xVxYuKxhFcjblJRXXGVP0F0OKMFys32d4
 OTJ0BSGu35pSIMU9amkgqPKRCYzUy4KLkWVuFDA+lpKIfhYxJlPuK6PAObumz1zLQ9xQTCBo0s1
 OYaF9cCSIMtbLfEAoLStEni6t/9UiR5W1PF25MyvyJ9HRSRe46jqVHpw3lppUitZr9F7ZcANsDD
 38Ss+u2iTXvnWQOd3sw==
X-Proofpoint-ORIG-GUID: UME64t5l7HaeRQBgzHul5CoLfOdNCkoY
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a59fcb3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=obKXXINtG9EwW41erPwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UME64t5l7HaeRQBgzHul5CoLfOdNCkoY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX+gjIPzVMkd4O
 GEQu8s7I4Iz6ya+3EF0gjBSe9IR5O8AgrCjg0HVW4v+Bv6qDPgx3DpRfel1X7A5XRZXJ+qsDHct
 8GYPRT6fhuUWgw1C9pwH2e5zn6/TQ1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170098

On 7/8/26 7:36 AM, Krishna Chaitanya Chundru wrote:
> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> the GCC clock references to use the newly added PHY nodes instead of
> placeholder zeros.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +		pcie1: pcie@1c08000 {
> +			device_type = "pci";
> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x44000000 0 0xf1d>,
> +			      <0 0x44000f20 0 0xa8>,
> +			      <0 0x44001000 0 0x1000>,
> +			      <0 0x44100000 0 0x100000>,
> +			      <0 0x01c0b000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;

There's a secondary BAR region at 0x4_0000_0000 that's
0x3_0000_0000-long

Konrad
