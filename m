Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446ED3403FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273779; cv=none; b=KwcwfzZ3Nyu1fx0o5Gqhw6R6BT1QglqKnYWaFqnc61ManTMZGNkIlXYU1juJ1BRwZFvNrLZCBOcz3OmuEYTl0CdQeuXHASFNZ8fP941m9hPcx1WZXoUA8oKgsnRMdqXsW1+qQxklgNPPVWNa1FkvSAhl5W6kMOgAysAqTLVz/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273779; c=relaxed/simple;
	bh=IZDUbHKMIMWw9GZtaaY622c0BCnjWRTff5OD6XNIH7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJsEXKfl9vXu2u06H70d7iSMp9Ca6l+HWZhgMO1sPG9d/5wVrtQVCuKNtNjJBtGWACvbA6WbiO4JeNytiipnhTwhVuv9l5PKdaCDiwjCV9v3zSUVKhISgng2pSMlfBUcFCMlY6JQKEsDxdnEWDYt56ex6Jgiqk+pJhIZcfBrBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImE9L04U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsMriSrs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImE9L04U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsMriSrs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d338821143
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NW6RQI9UDAbY0cyHYYXMDr9odRZDv+nXa8Wh08S2C18=; b=ImE9L04UB6ab49sw
	YQG1ulxC96csZhTtpQEohtd3wSouduH1b8jNE8rMbG+hgKwlT/CWQ5X5lHibhUbD
	EBT/eokG4UT1/IuItzCC55oOHty/cRd1pci8+5o8u3pnBiEdr5DcCAjUAabHXoo1
	VEH4a12B7e7YumEhocIpXu4X1aQgdGvgCM/oAfSvpv476bKhU7LDvJ25CbAf+HvO
	tU5PsJ/zrhTL4IU2TE2b/okXswxljQLMNTTWMLOrWKnBWjkASNKJ6q7qWFzgp0An
	1DbX3v/oRjcRsNWRYE0/ipJG483M2yhwrN2g7N0bAE2q/9H+znhNqZyS8fp81I3J
	htyk9g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag86t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:36:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca5d2474c7so109958115ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273777; x=1784878577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NW6RQI9UDAbY0cyHYYXMDr9odRZDv+nXa8Wh08S2C18=;
        b=UsMriSrsIkhJ3nx+MRPsFKfroNBujlP3nwdPFWDRMOZiqMmbtDD5DucrHOPJabywt/
         fsYNfe7AA/dt7b6cN2MMpfJ+X2zQ+xHz+m+8BWbY0SanmpI4VaUaJsqwuQfAAYEeqSSy
         njgraTvL82+z4Zubkh1cc3mowa/8lPT5nxhULeZXpXyg2nCWtzQvlh4uwft0S/WEKvDg
         6reS7WpTGbo/tmBRTh9RcGBWZN5NuOt1Z0j05bvP6pdSb3J8qJ4AVgc7QSoqybIROAWs
         ZtF3oq6n/1pdJvFdknk+czTrJdg1L6SgaJp+qFOtWfNpTl+bL803noEZT8YGD3Im8Ij+
         i1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273777; x=1784878577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NW6RQI9UDAbY0cyHYYXMDr9odRZDv+nXa8Wh08S2C18=;
        b=qKBpSPkgPGRl0lFBjRCCoMbIugeBmbi8vRfzNIDk5zSeYzA3XvcSxX5tWe7tt03vXN
         532Ia1pOQ+1DfBRoZOJLnYCZZ/8oxscX4JBtI7xy/jSMzTeZEafuEbiKR6+ql0r0s+vO
         jFO5WdB8693ich0GMOt3QB1CqWPDczHmcHIP6ubAq9bdgqiEtM6Xjr07wVjKafOLa6a9
         kikAIrfamZpK4mnS8LzDiv/vaXVzibNp+I787OXH+J9lQFy5iG50cEAaxYhRSsV1X0/r
         UT4s29WqDqXjhdYHs3eSm7rjmRoQ/lCWFuSIEHsLLYtn7WFm/bUwjSTwf7lY6wVrJfU8
         ga0g==
X-Gm-Message-State: AOJu0Yx3QcQrWY3EpXwMA5Z3FTWXepnU5tkwxh0ak5Q3TirpvAvB1k/s
	vIFd2ZRgLna9sBS5tPPvAbCMCaMOguBvWy5dnmvMjXx1sT1LKX9zzJAHZoercle9/BUawIW6rG0
	56P3msWPzId/TW3/TBG1gaSDEufe8wDLkWp6tAU7OtQsPormujjj6kdrBIxiVhapn0p7GeYHW6a
	DC
X-Gm-Gg: AfdE7clUyykMTrL0z8Ueqt0xXIHDnqz0C0Y0i48LdRtPodpRha2e5DTX40dM+Y3Hdqz
	Z2VsHQHZf0UTTXKr3ENUGhxPj2WdIBZYJMqaRKT0lnMs9fXlgr+medNxQQSh5YDoxphAeY5rZdN
	vDsLpG/HIvYLOT/XJqrCtPycw1n5tjalGS9p6I1jsUZh2Xp2UWIUeqXb3rZF842eEkg9HlsPjZB
	OvituPgyq8lnEiWjL4pap7HSD7OB0plKgr7/MKAdG/YgLxjxNgsmy2+YWmVmRh8B4x3Bc0LhFSn
	V/unibkoXoHcaUmrihwB9IxnkFv13FdWslwYUV7SD1ZcpUXPJrpueqhYYrXBVoEC4319aeJztlL
	c8hpkxIkPocCp311WvuDPaYuS5z9kkYMNsdImRP2eh9Ai7Lytn6JhcSLTJ6VvpPx0h2zX
X-Received: by 2002:a17:902:f705:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cf3494f91fmr14982375ad.24.1784273776920;
        Fri, 17 Jul 2026 00:36:16 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cf3494f91fmr14982015ad.24.1784273776361;
        Fri, 17 Jul 2026 00:36:16 -0700 (PDT)
Received: from [10.133.33.92] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm5823275ad.52.2026.07.17.00.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:36:16 -0700 (PDT)
Message-ID: <ce87b217-778c-4a14-a5c9-d28f927f099b@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:36:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and
 Maili MPSS compatible
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfX00iwKAIOnHfA
 DYS0lwIHkuF75UMsDt6qoeHg2r2rME8AgyvBLpCLHRxeu75SHI19f7KftUF3PmpbPPTVdeUUi6c
 ztDv4Gano7Nsme0QrA0ZN6GBjMWw+/kMNTKDkIm3D+gcYR9LQd5OvuI9y2jBamwxI3jkHtA6x8z
 Ve9NflEXhYzk5cHKIudWfZTzZ1/XPDqaGxwIBg4hdd2H7MG2S8kYbUn0gTWlhmJd5FcJyhKsyPz
 aHGeB3jUoDeMhTkLy8RY1pwB+NsjzhXDNnxgE/mOfKFsms7b5+Cf0Ig7oERsxV1KZWShXO1xH79
 MlLh4VUbgN0Gfcxk9VrQljvLemubEcIr/fv5tCg5wAOM44vIc75AYai4yHn/iIFYAuA5tUYCgrZ
 pJE3XgdrnAneWIsqJUAogH2fDm77HDV0RctIvxyDtIinTRmE0QEQS8ddrq9Zjpp6p4cgV1SnXtx
 8oAQcPCwcAgOEJT/JqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfXyiDH7JFc1G/7
 +RvpkOlqRbXQZhV+kCBs29tJmVH4v874h5fEbbBG0Qx9m0o8E/8dmnPvvs1vv7AroQU4e1hj1+P
 ULf/fw8amFelq1f9JpzYetiKjhKk3cQ=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59db71 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=O2hqE-0K3YR9ZxWvhRwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2QyjTA6SF3qVM-stABTIPu2Y7gHwN4ge
X-Proofpoint-ORIG-GUID: 2QyjTA6SF3qVM-stABTIPu2Y7gHwN4ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170074



On 7/13/2026 5:32 PM, Mukesh Ojha wrote:
> Document compatible string for the MPSS Peripheral Authentication
> Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
> compatible with the SM8650 MPSS (six interrupts, CX and MSS power
> domains, memory region).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index faf7b2890de8..0d9fd1598b5b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -17,6 +17,8 @@ properties:
>     compatible:
>       oneOf:
>         - enum:
> +          - qcom,hawi-mpss-pas
> +          - qcom,maili-mpss-pas
>             - qcom,sdx75-mpss-pas
>             - qcom,sm8550-adsp-pas
>             - qcom,sm8550-cdsp-pas
> @@ -196,6 +198,8 @@ allOf:
>         properties:
>           compatible:
>             enum:
> +            - qcom,hawi-mpss-pas
> +            - qcom,maili-mpss-pas
>               - qcom,sdx75-mpss-pas
>               - qcom,sm8650-mpss-pas
>       then:
> @@ -246,6 +250,8 @@ allOf:
>         properties:
>           compatible:
>             enum:
> +            - qcom,hawi-mpss-pas
> +            - qcom,maili-mpss-pas
>               - qcom,sdx75-mpss-pas
>               - qcom,sm8550-mpss-pas
>               - qcom,sm8650-mpss-pas

IMO, both should fall back to sm8650.


-- 
Best Regards,
Yijie

