Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055AC4949FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644607; cv=none; b=qYlvPIB/YrqmRd/YycIrY6Twti3Cy/Y2ji4XYimRhZY4ReqM+3BGFOQ/h8I7A2nDRCIV0MIG78ghSHUD3j+JBVywvjn+QjkPZhPqRageaVRilywtq6NcACZKL7NFvpdT3NwQw1UVk/hY7R291BSGbF31/iS5yN0pVl6l93gdMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644607; c=relaxed/simple;
	bh=VNS2F8DuQVPrWiyoPKjR1p2aeMoPTWtQW8rqvMOk5w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il9PjXvXVPinb3gbLhZ0Pg8f3/9guIjLMImxIV/yL5nYhsQCr6gpN2FptDogvqel3/lgmYVWez9533kz8IFUvxrYj+DjELWYldZOlmdj6dKyeYRun09rxN/nyjxMuTW3bWOmTkJV0OFSn0PaBvx8X2bEptiKoj/6oX/F9Eq2NbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwoQO4uR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vw7/v7wd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwoQO4uR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vw7/v7wd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0Qq1912543
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3fOp6jWZD3rD3U6d5eUkpHbkU5flf74+kOBxgF1vCE=; b=lwoQO4uRZWbuj6wI
	EvKnlBFtLaQFCfs/08rx+mBi7YlAacj/ESr95HBnO7iVLHWQbwGnfkP6F0NiAKdi
	hsFdO1mHpJQ1lIFiovq72rsYvqWpQ4lr5FgBYmMgaB8pZwdb7ZQ2ur4abeGMJWWU
	augjXuc37Nn+4/Jn5PXr47Vxiz1f3WAl+62Yai33wX3mF24u2wfGuoc1WfJ6J0Dv
	PT/fcqiNu1dFWIv9wq6IhFIDJ7ToSD0noiPw7ht89/Wq5DlDDZd9d3gx/DazoE4p
	f36rc0SRV2J2e/S/aJ53X1O8+6V5LP7UtSjMvydudPtxWzNlk/x54AoK/2Ns7xhG
	/7pJ4w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujw0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:36:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-976fd62a7e0so68597241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644602; x=1785249402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3fOp6jWZD3rD3U6d5eUkpHbkU5flf74+kOBxgF1vCE=;
        b=Vw7/v7wdjm/RY7JrtTk/xQ3n5H5NJzw0IK5+4oWwAVshgmfsWnpI5MyvRKrr6IsJPb
         1T2SupoqLmo3f3QyQ+lUaJw5v5t7hx7tnAYMXkcFc0yNIgYKRuOOzu+3zpolp6j62b87
         krQUr6ySr375wMw8Rfr/SwszylKHbwmamb3YCytZk6nkcpLFr5NQ2tCM1cNrYH/XAC/Q
         Y5c8oE2p141kWjDvLuIopxJ30WNajz2xiHAWQtscH+WhDXogLdfiQ3/Vd1073laAqOWk
         vcZUou5TTNMDH52duWKj4/RbaZJVUx8xHEfSF5CFhCEBh3Gg/n1ItucZigfyqraLEmLW
         CpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644602; x=1785249402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3fOp6jWZD3rD3U6d5eUkpHbkU5flf74+kOBxgF1vCE=;
        b=OFrLql3R+/DIYeJ1IjLwBdStpAgXutQLaDiiH4k88HXK3qEg0AmXEYXwpkQEEhqmAC
         S8SuwX7jyXmJbzoqfgFCoPgW87z3Sj0m2MnfDCdryVpnYHMyg8IC1G08y8O4VA0izz3p
         sSre1Gn+EAZWR8tYa4GzZEcE4y4JFAN5Ym/3DPlmJOS3nyzGPzdtBF4Bo11/es9+/nBJ
         O6BIpKkISPBqnXOzA7bvP/Nu0lUbvxOEotId1gqISkTqz2WqzD/kLfcppOY8PDipE6/v
         SadEpoETJ6L3bDN1DdJcF02ebwFlJeeHTUTwSNE+yqMrPPC0sIYL1dmsTHru6OjlURWj
         rTVg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0X3AqDesoxjhfud2VzQLYDb53fdtKDlgQxFVfHl//qABnqVJ6Uz+BmCmUyOobYvfhOkRAgdt6IFJ9jWow@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Mbw3C35atXOS7RwqQkVodP0pbnG8EH4PiPK2yjU7NIVm9iMb
	5PyIzCxo09sjb8jfcE3adn0DMoA41c7vQ0q60Rm2v/uLyZby49cOYtoNWgqCGcRadkbTsRhBSqA
	4dRF6zv/ErjBt2oqSGUZ4PthgmF9DLTeTJ2rCaH8F0fNUMSn0VV0CtPobncEAWvPNZlE2zgB/zw
	9H
X-Gm-Gg: AR+sD12IeBbySDhtyyoo5ql6YbuHMxK2frkS/tRR9gZkX5ufJAAF4GmnNGSstsUBVmS
	iRa9pNbG+xEofIqy1bb/aGICQHdUOP5QfzSRenJUSNaWw7uOvq5AXHoMbiBFpChyOQvsantEd+v
	FQvHBhndsTE6kvtBLXbvRpUkMGzadOX9uqSckUYcy+b9cQXA8MKkCykh2F26mGbDnwrXNuTuJ1W
	E681W+dbcvV9xm98bR5RH1n2SIotVJeq6+ecCPYeB+emXDAVK3ihmtRao/U20mHlZD96qAeTWmG
	+HT0bFv7n5zQdrqYQvcJONEaCFRv+h8o6ZnX/REY9thDhL8Om6sGGyeOjyciyg96g4xi/jo0AVh
	plSriAmLyMrxn63Cf09j08cTJ
X-Received: by 2002:a05:6102:800d:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74abc0b9b24mr601402137.1.1784644601901;
        Tue, 21 Jul 2026 07:36:41 -0700 (PDT)
X-Received: by 2002:a05:6102:800d:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74abc0b9b24mr601395137.1.1784644601491;
        Tue, 21 Jul 2026 07:36:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfe7sm603614366b.6.2026.07.21.07.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:36:40 -0700 (PDT)
Message-ID: <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iiHMr_Rrtfe50PJx7ATm2Yb2z_zzHDhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXyC/ryQwvz8fy
 sTQAUFX66Jwlb7hMvyg1H4gCBNCbZKlT8Sg3rAu+7gqvInE+ZlS9vK7yBKRAKx8O4eztBKSP4ma
 oI/oXU0atLN9VlRwlDbOrx1MwoXIVnx3y+A7Nw2/k/K2+QlQjPdbSiDL8JreYDvv0kQJg+yfL+S
 kx2YPc6TobYVNQAGqAvubvUEajkt2eqA08uTlW4X4VcnnfOJPd8FfKHBmO3QRX7dvUqtEXsPR7w
 Kmyz6aSxPnDxhMbIzxN/pGWzxST/M5L4pkTA1T2/TDWprrV8dZNN03HmeM8raWOdhxhdg4rNilo
 UT79n/qYAeyZKBgzX/Tu+yCktA6lZ9OEL6bTLJa33dt/SdcDvn0tk58+Ljka8TsJyGgrQXacNbx
 2SrH5B9vO60IA2Bnh0saZ8jcrnT2JPPF92ddsqnsGTQZZzSj0F5KUIslm00f9gu4a0hqMG/RWw6
 BLEVQLnKFdU70Hb4IXg==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f83fa cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mryI3Znvg-k109Y4wc0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: iiHMr_Rrtfe50PJx7ATm2Yb2z_zzHDhy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX/1uy5mobdElC
 Ux9w+lYhUzOrNSY9HMyvpj7gch8fwDRDM0g84ZrtaognRpD7OjrfmkpwqJoSYi7LW9Jac8t9rd3
 yto8parKY80J1778FAqC1RhUHdm8mgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210155

On 7/21/26 11:30 AM, Abel Vesa wrote:
> Describe the glink-edge for CDSP and the FastRPC subnodes for both ADSP
> and CDSP.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> FastRPC nodes were not part of the remoteprocs patchsets because they
> weren't tested in time in order to be sent along.
> ---

[...]

> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +
> +					label = "adsp";
> +
> +					qcom,non-secure-domain;
> +
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;

nit: the doc specifies '0x1063 0x20' etc. for the secondary
streams. They are of course equivalent with the mask

[...]

> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>,
> +							 <&apps_smmu 0x1087 0x0>;

Why does only this one get the tertiary stream?

[...]

> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;

also 0x0c00 @0 I believe?

Konrad
