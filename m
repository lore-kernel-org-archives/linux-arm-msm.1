Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DE3CF1F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881103; cv=none; b=VYPHG1PN7Anj/fX70tEVV0eDTeFvMFzhoIgnUBFj88vbzINrL+0hWNm3tbSfjIqE3Rewne5OUDLRqP6iAtjSC5BF+pIkyGySYpeE0WFhDkbA3mg4Db60GebS13DzeBFn54FqOCoLvNwGbmqlvfkPx+XbP5eDO59CbjTtG2e9GS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881103; c=relaxed/simple;
	bh=ZlgCIIKhv+E8b4gXgFAYNw2wxGCrNmTgOk774dEyXGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CraGsQOCbTfNkfCwinpil21BwAeCB5n7pAPrd0D/uErHAbfmFEv8HiulAVIiKLDwNAPt4rToN8pgKkvz6kjdsvxaz0dy/W2rrO83wda/1Af7RDF46oszYSNsCBGjbzIC1FcsxrolDaQbZrL9KMvAkm3Dj4sBa8VkbcFww8OsANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqVOkXSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUaSRvjw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqVOkXSV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUaSRvjw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lTow2162992
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=; b=NqVOkXSVe4i9Sm1P
	1uVfvfGWNfKwgBApFLOtq4PJdY+ARYzf6BVB6oWsSaAD7SwfAri3oWsGb/2wrQAr
	L6rE/Ii+1HKZqMVZPA+DasgafsQi3D5C5UNxdINUzWP7uqDZIqawBprmdL26KRkw
	F1C2QNQ/S4Ua6DZkEFHKRnRImHugliRA6nN8gXmYxOPIcbTdD9UX+EA9OIlgeje9
	FfUnZwOJmXDlekCCh0vlYpluJ//2IwJmE4jQDco9vVXeVhIPGIyNLRv0oTVICP/F
	FND3iYFtBhCa/Y8FVc4E0Ac3A9bSg6aEbCE+ZnnbpJMV755vn6fMmPlVxyoaMwgA
	l9CMIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vk7k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:18:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so473041cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881098; x=1785485898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=;
        b=DUaSRvjwfyEsaK+puUDTTHgousixZtEDdmf7vYhGjhDWYL3lx/n8eXPkAQPJ8YpoKB
         Ut4Vt0yKXaXTguvEiRh1qRPpDFUAWxuYSqK21Imc+p6FFjRa99HlsrNt7MSxvZ+jO/vc
         QCtDDU/n90lfgErqY4By9vleVpiyB5Yiqc8N77wIBbo44H2ZUROWNtw81+LzWY1osd+3
         ngkF8iMHBauy/gyByPL4LQl0hlRk9eP1dAoHAJkYjWvzngw+jfyVC0YadFyrj8bnLmBt
         pt7kXFH2INiPhm/UBgsvPeG5l0d48xpTWeuALz4S/N8cUi+uTRwRf9qyy8qDQM3kY9RH
         T79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881098; x=1785485898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lzhd00Ny/U6qtLdjxtqvfPN+RsSxzcK1jqP6oL1M14=;
        b=ecvcbctseQ8cX8A5VKTQpS1w93eBUGqEZ4OSR1QRsvHuN1oiy64CMRWra0A3oaOQGz
         PKryDUkXMAdkm846zMW4K4SZhjod17cO6fVi/GsbWQBrw9VKl1iHq7Gs52pL6DVObjKf
         pZ6loK4Drl6jYbNUEVhK9Ap5xN/ivhGXEaX8ML5ji7VOsHJ6Brk6JpuQBJ/EbpRjf7S5
         SXq27l/3kzmPmOr6NFz4HrjKbtmsJLGvyK3scYfcf0KZ6IhQADVJMrLc1mJq3nWgnxPd
         S5htqUYV9keWgHoQShD4gZKIpkyB+RVCQzg6SNmmWALA2gpygO4+xw5Bbo3CWpApCXkZ
         S+dA==
X-Gm-Message-State: AOJu0YwuuDShmrMuLoMBVPvek/HJRSakt2cHpmha5hcE7kXpx2MmqClP
	wl1Z2hlyZcaOmBEkZuD5by6Dio3U2DO5lYSPfgj4e2N7jaEBDwtNxbO+MvWcK6QeNwl/WGhh3rS
	D2s7wwZfmPcX+HEKGUUKOVIdvN2Fcfq7JbwYcYLxVaIHRZjNmbzbFnh+gxMhQgTOTWIfOkCH8g6
	aG
X-Gm-Gg: AR+sD11ymXqKPIgEyIm74XoE0CQ7EQ7ULPB5YgUeK8Z7ubOET2yawTG8F/0MT1/68yU
	L7TXrPFJDkCMrlYDqe06CMfn3KVMlwo24EgTfeSBKR/Ne5LBJSYBwmOAJraYP5gnXEf+w2qi/kI
	HZSpLiCC5u+3YUfJnwcU50dH+l6RbNEqn/z1cAhlpIJBaFtdt84M/nbpSVSUeZCaJ0MjuPX+ypw
	FMG5I1nbMJqVDEWgjPTiy2Eesae72cV6Z9D8FuFQAnydo3wxu2OqcWdQo5vrgQ7xTQ/BuyPEHqE
	wptrQE4emipMmcXK3HjwLvg6CP4WMCNLlffPPzbX6sd4y9c1AkT986DH1i9vQe8Ip8H8Rft9otF
	wJQVPoEhZRqLcsA08aD+eEY9u
X-Received: by 2002:a05:622a:aa0b:10b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-52849902994mr17837631cf.11.1784881097695;
        Fri, 24 Jul 2026 01:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:aa0b:10b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-52849902994mr17837421cf.11.1784881097237;
        Fri, 24 Jul 2026 01:18:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32aca777sm314898066b.24.2026.07.24.01.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:18:16 -0700 (PDT)
Message-ID: <52a09911-a846-45c8-a9d9-bdc9371acce0@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:18:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
 <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-2-fd5494471b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfXw6uSGdRQBBMu
 MzkH7x+zsd+gr1IrgDifMCcFYhG/qfeTyzXCXQr6KcFE1ZbM7M/hUWsGa1YjJ9RMRCyHPUPmqf3
 EgMbGC/b4UHYTwg6Fvn0w6YxePQ6bCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfX+6AsR7Xk7jcp
 kHJn75Tio5vIKutTLskNcew50CAtuIT51PGh7k14mTDFxfHJg6IbpOywihl2J3s+FT9wx2wTpP+
 iZ6wns+clgHhcM6PSMgPE6CDhe50RGr3AjStPiT8uD9J16+CBTLNZAiKtCeHi0eJNfmQjHVIbUr
 3FiwTVgFxM2tmOeR38PeT1kJx/xGY0vIvgrE7oqyu7hy7eUcKHyh5rzgT50WaAD0U7BNX4QiNae
 r4IsV/s210/5BEagwhK/Y+WfVVOEMgv47T+Js/aWBgug7zn3ePMWpRIWm0aHNlCgjkMjswDf3OT
 WC/4ReKuiouRA1n1nt2LehicyZprMJsgoc/h/6RLkveGc6ul/BDUlwuUqpt4xJ2h03XOuwRdng+
 FJMyA77P/doevBd2XNr7gS8hawQTG8+Gc58m8CUOKB7DDW1t/BeJpMWWlZCo87pSnLg4PJFdMKG
 ZDZFO6bjqlFLpTusRmw==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a631fca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wkgjK99CwNVckLCYi8oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 87aBHomPqJdNHcujBmFqX-SeDkQ57RJU
X-Proofpoint-ORIG-GUID: 87aBHomPqJdNHcujBmFqX-SeDkQ57RJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240074

On 7/23/26 10:26 AM, Jie Gan wrote:
> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
> Shikra SoC.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +	modem-etm0 {

I think it'd be better to keep all ETMs 'etm'-prefixed to group
them together

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
