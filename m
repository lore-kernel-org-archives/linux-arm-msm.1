Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2F311C07
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253002; cv=none; b=pOUlqfwU7cXeKmNFyUT7igUcaih0zvUpe+4U3oofSVjeePJ499+uQKtDg/MA3K6k40NmPHQhtKgq9u/zHluM0tTtsGv6Z5sOgcGqfPqS/Qn+e5SN172ZfwZ1fii44mFMrW+ZQClvsrtF+8TZh2RsFyihd4fRWSLw9dK2pAezAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253002; c=relaxed/simple;
	bh=jTr4WS2NYmhdyKOHSsxcJ8Mk1kaJnfIYHHyXs2tqjO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocHrlDZre21ZrGun/1o2L3MKzp18rwoY2mpwTg1fzJlRj339PNTYSIs8Bdj8FbXspUJEGmp0NirF4fzl1Wv1/Bq4ciY3nZQofrnJKpZNbNAFzG9uqzLRLaTmgvMKDfhrrSPtTamRPFhZYDgd/XofclqfgHamJXkfHtMWBAXSVGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVg+TAY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHCZbHcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVg+TAY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHCZbHcY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcn6G3075665
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tPfAbLZDTU3izOK/EgYpGIRm9s6aBpybhh/ZrMzDac=; b=OVg+TAY/dAw+y7Zf
	V+ME+TAlrS7Nvi9mdfUxLKowKBLCryrMu5XIhs6GFXnG7xAUWQjZJvUJfEFQaVtw
	6HW0soS25wnJmmfjnH/PxZ4BoU93lAIuxK1rd+0GXgAMD6DQz7KEqeRHsH+HwBLB
	eAFWjV+Gdem3Ectc9xH1h4OOJ7w0ogImDc6Ne0GhXaYpHWVxJAmyoLM/rcXTsq2F
	IIaA1givqxar+teuS7AIRXtdAZC3LEz/eAubtgGP6FV6ayMPKe5sDKce0Ktl7J2L
	elVWjWXK9NWJWoOc8NJK9lWJxk+9u6cGbndrfGjNA8xt71VBXBZvPRpC3wQgkXU3
	3zUdqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19jxy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:36:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso71635871cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253000; x=1785857800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tPfAbLZDTU3izOK/EgYpGIRm9s6aBpybhh/ZrMzDac=;
        b=SHCZbHcYOq1DCafiGnBBHF0uWvddDSbxGJP8IBK3Yrq1f4lbHXgZrtBtIdEJr9thZZ
         /GIxjuZWVC5WsKlgvq5EnFoM3Xh4HxR95PhZ8IxIt/Z6NR4AFVxEb7kfflyX76Rq6M7y
         c7Ga/TRn8QdZbVJfCnCI4lfIVwwRFOPqlO1hz6qdJdMdM4H3SaBFPwDGVQr4Z+PlQ83m
         bbUQ3gfLe2qcjAmRmO5FfN9dkWUHLO0fySYNZwnHvg+yQ6M7jG9vnaW4OVAMo7NzA/F5
         eseGzhTZw8auf6bmwD6XNztJWzav1DKL+uG1WsLMkVfk0N/xJvjxx9CBGAsFGFVAtyll
         ax3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253000; x=1785857800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tPfAbLZDTU3izOK/EgYpGIRm9s6aBpybhh/ZrMzDac=;
        b=SP/XZbiYxMhbnBojkF7aBohRvIbLMYXw+AY2dRVSImzejWV1xFviHvW+7XHOIvRt4v
         gNI5DJH6q5nLwUpshbWW90Lu32SXewAoz4G4D2FWQNkehNTbaslRUc4AgyfhX6mgeXID
         ime0loxXxmScHc7jDaYwiffHgYPI48KGFm8lB2oFSZIRsHvXrYkrbe2Z121ZPCt4aIZ8
         QYL+IVK4c47HLcjSdkBrj/fzzCl1QcdLhlY2VMqSmSjwRZjIqMFDxsWJsRYO7lDp+7Og
         WtkS6Ja7Ty1lPS+554571SX/No/LJ/1IEonXhVVaB8kRzC3p63dIzOpezWvrNRWd/XWM
         aT0w==
X-Forwarded-Encrypted: i=1; AHgh+RpnDQl3L4B4Yb8rGyPL6VIqZKHovk8dLy0DVqfuDdW6YKPtS6/IaOAMExvgdp3+KP6KvEi0m/oSX0TAusyt@vger.kernel.org
X-Gm-Message-State: AOJu0YwESZVgg3eHTkFh9y2HvOAp8AfTh2jXRxGsuBtow3wi6mlZNtGr
	O+DAk6YJ63Xc1non4CNrkIUaEIYAuUL3uO8tBLABUbHHNxUowtDWHRVetVmVKOAS+eTd+dOlKoJ
	isnmqidqsK8fEPyUMGkrmepn+w2mckDfTV1tKvJq3vVgsuXJAHUk0MQoMjEEmHs5Bcqiz
X-Gm-Gg: AR+sD10dTASLTx/NSgsqIlG4cuvDrLgIfGFsp1zj7UQ7drDy95qhOxmlauQZ7fubBgP
	I+ZDFpVzcJnDx0xhLn59xJ3uRXYPHr2q6o+FCB/7YfbuNMZgPxqrbS8R+Mc8siWUY1zRi0y8Vbd
	Pimq+EcHAFU9XonoaDaGyLJ4pPPFhV/9I9zsXumyrjj7zwNrmdBszoNmuAwuzVQt03YNSmlY1m9
	sXYxwpFSaS8sZNdLEwkE5uiGZlAEgeHW3AUL6qRSmYjqlKG0+9+ya20t6QRREeZacQ1nXr/6e27
	Y01vF7JhLJPHzDOKWqyEW9OS2fLrVWmSS64sBJwxB2tkrvWc4nrH3nqLrHGnNQv6r89o5oOrjav
	rimBFfy1TydsmPGUAkr7bVP4vdAkXvIxuO1dUyL6ApfSFlpSoagVci3KFEj0tRio7JoeR
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr25828321cf.57.1785252999682;
        Tue, 28 Jul 2026 08:36:39 -0700 (PDT)
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr25827731cf.57.1785252999103;
        Tue, 28 Jul 2026 08:36:39 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:237f:3a69:9c1d:e9df:6c3e:258d? ([2a0d:e487:237f:3a69:9c1d:e9df:6c3e:258d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm97758175e9.0.2026.07.28.08.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:36:38 -0700 (PDT)
Message-ID: <fff5487e-5c0a-4567-bcc0-3e5a083c4e75@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:36:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the Maili
 Temperature Sensor
To: Haritha S K <haritha.k@oss.qualcomm.com>, dipa.mantre@oss.qualcomm.com,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68cc88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_eGdy_ivWqBgClNpbDIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzOCBTYWx0ZWRfX/mX5h3r+a9sT
 86WuFWA3EKkW9vaSHvIl65SK2WOLAZLDmXJvg6k1b+lwMpf2VqELPbqSS+vPt3Dd+U81WIcieML
 A5DAqT6uWTKUWqQ+LrbEUBIrqlCbAnPe+GsYnHMUFKPdNwR28PifqtjomQppLHvdn8VxCq+RNeM
 rjY3pt/PX6vUOJFop95g4cBdVSK2kscV6k/ui4WKEwJTfl9c5w6pnC2zVEHzEe+zE/BebGrdqkM
 DYHBHNBzvbmgzu9Omx+UlZnkCuUiF3bG19USVPAz3fjyIJUpvvqSe84RG3DUhdRn3IpFzGpNbdd
 JaaSFASs2tc5GjgwRzshIgXSDK5wC/oBCf4yw7uwBCtYCFFHNBHoIhlc0ZY2ZurkOvU0UgbBmZv
 vYZmmC4sDvBpnupGd0u9y756oGU4+yobmyuEkbJPD3uMNCZhdnRw3oJOO128zUAkqnV11okGnHv
 j7eju7di1hubGXyf8KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzOCBTYWx0ZWRfX7K/6rCOQS4EI
 JUAvp6Fv+4WmgrK7WgyfLHXLsHU0PT/HHa51T31iLXBi5l/U8dcgPXMSDgAOVvLt368f36gq7PC
 WmKHf+AUScfKcy34LauDTtix/Xatv3w=
X-Proofpoint-GUID: 4s-xn0olKfpWepz8WzIDc-3kSbtvrfJl
X-Proofpoint-ORIG-GUID: 4s-xn0olKfpWepz8WzIDc-3kSbtvrfJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280138

On 6/19/26 12:20, Haritha S K wrote:
> Document the Temperature Sensor (TSENS) on the Qualcomm Maili SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Applied, thanks

