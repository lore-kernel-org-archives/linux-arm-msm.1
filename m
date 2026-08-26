Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAE33C198
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735472; cv=none; b=CHPCJqxQ5yJQgmBqT/OyRWBzbLkdOBj5YLRQT6Q38VTft9KRDy+dOOqqLO95JBzM2Y4bELJXXwb8ZsUHd8wKTQl1d7sO1cLaBCzS1kyjh+nc2eUWgNd4N058tRU5wFzPgcS/clZX+/UPfmnvs1HWcC6dX5S0Pm1idqKaIYaL2+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735472; c=relaxed/simple;
	bh=2Uo4KFY5LgZJU0hGjjTTnHGiXoFPb2e6vhQ+kK8Xv6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUzm5RhwmAET6MGXM1CcztyrSaCzpmNdLn5WMg8C/v6SIDp2TKy/JiZFVbz9gaemve6vay0oNsoxayfwF/9APvxW6GZeFEmDdobvhxCkvgZ+K+cIfd2WNhv23hHVMs40Tv9Sfu2jsHgGze/eeB2cG8/xlh4h7HBPPXcpQaybZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSrmyoVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILD1brgl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSrmyoVs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILD1brgl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RudF451449
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddAsuImZipDImmWt3HzNXTcYStnvmM3SWFX8+qbAOps=; b=TSrmyoVsGP//TNCU
	eMEw0flt4lH5B2HZdBQwcYaw7tzExOdr0nglH0WjOnIfXGBGMrLkZlKeChnOVRIy
	ovyu6ZEUWLP7+VdwYl1sEI/ILKI1wbhpW86adBtFj+SHrU/phV86Xrsq3NuUhHJE
	tmIQX5uPcpHUsbrDeGs2wQOPf0doA1JhZFsrR9AQEj0s3UlP+81I6pzHXbByLA2K
	VAgRnI8YWywkmniq6W5jbKsjX1t6HhM2ShFrJhSf1UkvE43ps2Be7l4jKcMGanaG
	VgsD0bs8cNr/nTpSQ8fsNPnQO3h3e7AaocmIYPSQhw4DUwqc6pZxxd99FWZPbUAf
	lM3D0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghayq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:11:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so1299441cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735469; x=1788340269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddAsuImZipDImmWt3HzNXTcYStnvmM3SWFX8+qbAOps=;
        b=ILD1brglRgnU2UgPQObR872Pzr6UumR9PWzSJQn0UFqDFIy3Rvv5kUmOYLK2598yHx
         AFviNdPZauiqA771SmoZgaIGVMXiFtsIsq2w+VO8JW40wBmcnrX3n8Bo/CYSYqAX//IR
         CcAKeq9p2aHhi7uoBahGODnQJRdF/JyIAoY0rKik0CNxbevTL+7mQpQ5GSliXt7j6cP5
         Wvfus6e+Ub73dw47nUDnhfUwts6YvDhH9u9BUZimojfoYUIsmALTUPwO8Syy/8KzLz4N
         vCNZYFQQEPyTDlQEvAjoScYezj4Q7N9mnyt1Ku0zoHKpuOS161aNIhOWnPTDMBKHM2UC
         EE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735469; x=1788340269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddAsuImZipDImmWt3HzNXTcYStnvmM3SWFX8+qbAOps=;
        b=EZwavVQvVTfw3+RvaSoSZBQPG9+D/UqzwgIOCvfXAeBP04UR3t5o1BapfDY4k+WHPA
         JZXWURuQf0uWsnAg7jAfdMtPUM0fQiJbiEPBSx1mwfdGfpzT+EV3T5Uj58JSyWYmcVKh
         KB2xkEtFYA35EdMhvA54yU+dyJhonQ06iI3HeHpGyv6OPC/UwZ0PQ+HElT+DSUizkedj
         8sgzdqOvADA0wKSjm8gU9KXxQv/+92xUoxDysZb3O1fhVkWWYDZa6y+utZjkeRfdhwjH
         Hv8Q0NlITnpGVJbPJfZ0Be4nyx5LdtyQlm3EoNoNRmtp/cDGLu1ny9ChBjTPlJoWKNZ8
         3k6w==
X-Gm-Message-State: AFuF++lsSPkdvHkyT1VClx+71WMjI4W7CPF0P9jhDO8Nr1Od2nO4Ep8z
	MSRzumdzhWN+HKPknQ5v/f6yRBso7bCvzeUPneE3pDVOFS+zExsgh73xNbmJjtHfmKeH4K7b6j0
	qDHqhYUQo7v2zTHAzN6ZrzDd+v6D5B8ESQ7G3NEic3jaL8eUyG8yJiUlnNce7Hsrd7q9h
X-Gm-Gg: AR+sD10gWTK4y+CwekKUmEc0wPF1CqSSoiQdPZ4v+qFgpq6mH/tOs92h1Cb8qKZot2R
	P3z28bUm7Km3QwWFocgjFKPhnqy4KvY4jcejEEuJ6hsmt0WPdnAUxnpHIflhNcrcWT7HCEwtA2N
	JyeXzBUmi66KJ1j6uS30DmBJZFirwsE9rRHcGJ7WNx/MKWCmS4LjkTgJOLWVJx6fHjHRVNUOb0i
	fMi7WEohxT+Irwxq0sUqw5sSIsUXoGvA2/0hMVCXyNvSiVd2bM8O6Q8XfHsFX03t1AQD8nngrf0
	RhHugrBtsAfSsApdZEY0QsyHUV9g1mCZmv9d3lWz93LTJu52qVz96V09uaPt3KMj+vBFQ8OP/sG
	OBWjTncwNTCUeGfZQYauM3dLA
X-Received: by 2002:a05:622a:14d0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52e422b1826mr29104331cf.2.1787735469363;
        Wed, 26 Aug 2026 02:11:09 -0700 (PDT)
X-Received: by 2002:a05:622a:14d0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52e422b1826mr29104141cf.2.1787735468878;
        Wed, 26 Aug 2026 02:11:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1c80sm2752190a12.10.2026.08.26.02.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:11:06 -0700 (PDT)
Message-ID: <82fab943-2994-417c-929c-7c416386adbb@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IReg6saWUe1CARtmeRZ_eHI5oTL7FDtD
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eadae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX9Mu37maBl4m4
 koyNCIseUAJSFe/9DjJWhBN01vA+IzrqNXFRbyLukDnKtTiOdeiwDn4jNl5Elfa0tVYKqynUSFw
 T6PlfH6pvv/a6RImh2JeUveRn24kIUE=
X-Proofpoint-ORIG-GUID: IReg6saWUe1CARtmeRZ_eHI5oTL7FDtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX1rqLt9XHC0WO
 bb3lZDaVm1w6sL+0tI9A6xoRs4PjAaEq4r50hG8YroNAebjTJrY8n+M8j2s1IrsGRb4Btcnftsa
 Gf2jG5sFObU1d4q/Q7EmWc4SOffQBlQv3wuweSTa073SJAZ3ZA7u+hOm2L0caP+myoTA2dlK39T
 ADeUPounmuOw1CNgLl6QUGDoZ6MyoOMdMgdVU7sKCVEHWeeFiUKrg0ik515ZFmmN3YSPmWe+xI0
 ltbnKmtNmxKYUyNev8E3cfZZY3IS9TgcU9xzh90j1nfSQKlBTLj7zL6UJuyGaQXuECgvaOjgtXD
 gV0VvIQzydZ6dxtQI7E8/3GTlIo3vWfBBqklZMSbVGScp7B2NSTIlt/sEQtesP2AaF+HixTbpCX
 0G5QNn3I+x8ubrXLJY3SerC4zaFP7K80c510YsEJC8vLiW/gazC3RmghiAloFt5vGHBMzhGQiq4
 ce6atRg0+fIUGVgeKRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260075

On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> index 8ac42ff625a0..fde7fc035bf5 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -197,7 +197,6 @@ pm4125_l22: l22 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
> -			       <14 4>, /* eSE SPI */

Is this bus going to be concurrently accessed by TZ?

Konrad
