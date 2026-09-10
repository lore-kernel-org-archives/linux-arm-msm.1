Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98753242D67
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 04:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014391; cv=none; b=jd8gMmwELurXKNaP7X9w4/YO4U4NAVMOvyoHnY4BhSHEF+wq5kv0gn6qyRMJWkvEDz6nEN7r5GeiayQZDktEDpz7TO13xAh1PwMNUJ+Q5zEHtJr1fJz+jN+e1iYyL/mYwQUokAstPfYDSxS/hXpKDB9WUvkut39+HMhatm3KmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014391; c=relaxed/simple;
	bh=v0G2sJ1qQREPUV6XVlzPNbY0zKZQxynU/y68N+hdbIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGGjtTEd7g+GbJzL+SNFglJLD6nmMvjRL40y7e9xesYL4++1ClDQC4c4trFlP0QnZoK/+RQmLb1aeCdh8E1vJNxHzdLtaEvk/9kI2vt0naMl6JjS8ZmdwBuN3VmTaPf/qcFEQsGuLSfStOmunhjNJNZNnq+kQ/7lnUQft3lAn3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoH8TLsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+BGcxXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoH8TLsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+BGcxXi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1llEX062927
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 04:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeOR4nXYfqSKHwdV3Tld3DkJPSD7Fac5r8vAEoZUvoQ=; b=RoH8TLsmpPeBhKbz
	KenHoPMWcuZie+A96yRMZF0EsBpdEOdO6g5yROT9FqsLnOmkR3OLsNbwtLCkr1rY
	qXoqaggKpPGg5zwIB+PRihdKxI/EP8ll1tbXWE/n2iPIW9B7Vq3nXfKeDaq5Y9sS
	UrPrprj0NxkwaRrYJ33pZ6X68qkyQ+tO/9UEVr+AFx3NimBk6YA04RN8z9OZlAEj
	6b0ZxIs+22DQuKsZsesDxa4snuJLjkWfkz0xEkH3xIhbn78edI/19pUVn5mdYMLJ
	jTtn9WXwrbvMBMW2S6jx0webm6xMxzKkk7qLgw5EWs/Q4LBvD7I27oZijPHIZ3OZ
	zK7eoQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygj0hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 04:26:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-399311947f6so11524990a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789014387; x=1789619187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeOR4nXYfqSKHwdV3Tld3DkJPSD7Fac5r8vAEoZUvoQ=;
        b=d+BGcxXipXKu0vQ5Hxc+PF1P7e0AzjPKi2ZZytK48MDo7wyWNYWSvIfSUhJGdXzf3/
         ESpvoYAADfuKIc25RTY7FvuFX1LDGKgyEAKAqBdRlZY8y02fTdGnvNpYuizylR+N0Slq
         7mwVjKhcYC51t1Dzy4k8AYdAgpC7jz/b9z2ppEpU3NReFwc6fQkgVjTL2sERFfBDgY2a
         NKovm4ERfXmAGB0KpiIDTdmr4Cy7KVNUPwkC3fmNlUaYqtr2tt/um12st2lospwmqVVy
         xQNC6BBvqlZ0tgt9loGtKVqFyLadn6knA5tqCaXhYBIjA4doJ1fGcMUCjhcM9DGgkTK4
         kEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014387; x=1789619187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeOR4nXYfqSKHwdV3Tld3DkJPSD7Fac5r8vAEoZUvoQ=;
        b=eFUx8fJocGBF70SOjpChXg259y6KNInNJNtOAZ7vF3/8SZPsssmVCi8DLRv8dt29tH
         CUxm1eMu+tMVBknfmLyuAjtt/feW4rbX9shF6XRrP6rQfO5UQ1hYCK12sqfACV7R4zg9
         MAwI6768TIBsycd4E5XndPz8JFSdQcsLGV0iyzPOS/RkyhLG6JehLavB6OdHyTy9NfQz
         CA9Ttvafq8Rfgvb2OMmOPC0JohsPZLyKbnsPt2VNSff7ki8SZZFbqni4fjeLV/1wMv2G
         YehWMloREYDF4EkZPHDzh6o5OXnutZQgPkok1NS0sdFQ/YVbXr2qWVSef43R6Qz7I1hY
         qSOg==
X-Gm-Message-State: AFuF++knajSJO71spz7hBsUpvtEXm54RA6nZ7bOsU7lHHtMviIGgi2Lp
	z3YGopi7l+5UsdPrWD3PGiZXwjwTJ7XTnUtr4Yp5g7+0wzNQFDYbYVxFMfMXOk70X+bkwTy7pch
	KNxij9/49rTvU/XKqrvdym+FVnBm+kBeBjH20dyXe5WH70Zvw1UHSmIkZp9cIgdvW8wwD
X-Gm-Gg: AYBFou1GlGGCSBGUsKJGYfPqV0kSpB3CcXNjpc/Jh9vBQxXvfvt9ztd69dx9ihJT15N
	PqST4CbvnV8tSDjV1szAM6rY4PBTvM0EUIEGpkoOrl4iSFuANkYga+DoEqC5hw/5IVvBBxQ1YBu
	ntI2lnAlP8KWdgQ1rSjBhpnpi73l6ulXkLiMSyhHSvm0PJaCEXlSJOLbggohhsMw0zBFeEQyr18
	QANzoPhX/f7G6jkQoZmUFv/NzNqKOB9M45PPTDoH2eBCmOGQIlbIhkjRv5DphpuC0f9El7nZRfG
	younarIwR0ovW5KLeq1pGT9iBI5Ap7DBcy6VnQjVI2bxaj/UhO5nfdIhvzcYzo8djp4+VipDL9A
	SPSQGfhaTl9T3JD01JtAxggaXQadYmx/HxBJQRlf6TC+SgTbDbfaJm1Qn
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr56622896a91.1.1789014387485;
        Wed, 09 Sep 2026 21:26:27 -0700 (PDT)
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr56622844a91.1.1789014387057;
        Wed, 09 Sep 2026 21:26:27 -0700 (PDT)
Received: from [10.133.33.71] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm1797507a91.5.2026.09.09.21.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:26:26 -0700 (PDT)
Message-ID: <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:26:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA0NSBTYWx0ZWRfX9PSxHzaGeeQ+
 8l2o/HoLZvMaBrZEA+OtgQ4HACVZ+d097eabZD7PxX+fSXIhXSzmGt6xqVds7lt1MF8MInlUMdd
 vGxPHEM995fMfFlu/hmhSU+dtHlPg80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA0NSBTYWx0ZWRfXyfFwdUlVx3hq
 XOG+amvZ+k6E9BPuCh+2stbfC4mvFlnuFWYZhAo1IH0g59IRP+TiJuiGexmXyf9KoOaInrz8d42
 tR+YpJ4TNwBshJnF1CfbyNsY76sdOEB47FJvu2QPw2lw+DH2hfM6E5AtCQVieYClzoxQSN5V00W
 /FfZWVxyQIW6YQPPoAa66+9Kb7PjjWH5gltAZ9a2CLWTKjEQ2WZqW6qhQsPU3WTB8sxOgXFayIg
 GKPqBc8bUN2tXjaj9jJWJxcZ0h+f66bHTjuhxoDPACBkwIEaSe2hiPpfta1gkZIvlKWvVHfGvD9
 YvmmJY0fAE85D2Q/OocOMleJIv1sU1FF6cHMyLMa/o5no8+qzPuzfx1Yxrv8cYqY7kpCt/2/sQZ
 loJGmvtTgpIDIxEy62CATRnQsCVXkvx2vBBiZ5T6Be9KvCoFWfh/VHxWqyie6+4AKz0MSnAQ1gX
 QmJMnFe8EYGkZpC4xRA==
X-Proofpoint-ORIG-GUID: Ken1OUNjO6Pp3buQPMnNMTufLwGmDx_1
X-Proofpoint-GUID: Ken1OUNjO6Pp3buQPMnNMTufLwGmDx_1
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa23174 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EK-Lu_RZRIP6TketYm4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100045

Maili faces the same issue, and I have verified that they share the same 
fix. Please bundle the Maili binding changes into the next version of 
this patch series.


On 9/9/2026 6:50 PM, Mukesh Ojha wrote:
> qcom,hawi-cdsp-pas was initially grouped as a fallback to
> qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
> Bringup revealed that the NSP proxy power domain on Hawi requires a
> specific RPMH performance level that the sm8550 driver data does not
> provide, breaking the compatibility contract the fallback string implies.
> 
> Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
> add it to the standalone compatible enum, and extend the existing
> cx/mxc/nsp power-domain constraint to cover it explicitly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index c58e8a6c7fe1..cf57095cd49d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -18,6 +18,7 @@ properties:
>       oneOf:
>         - enum:
>             - qcom,eliza-cdsp-pas
> +          - qcom,hawi-cdsp-pas
>             - qcom,sdx75-mpss-pas
>             - qcom,sm8550-adsp-pas
>             - qcom,sm8550-cdsp-pas
> @@ -40,7 +41,6 @@ properties:
>         - items:
>             - enum:
>                 - qcom,glymur-cdsp-pas
> -              - qcom,hawi-cdsp-pas
>                 - qcom,kaanapali-cdsp-pas
>                 - qcom,maili-cdsp-pas
>             - const: qcom,sm8550-cdsp-pas
> @@ -273,6 +273,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,hawi-cdsp-pas
>                 - qcom,sm8550-cdsp-pas
>                 - qcom,sm8650-cdsp-pas
>                 - qcom,x1e80100-cdsp-pas

-- 
Best Regards,
Yijie

