Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC94D2EFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646598; cv=none; b=C/ZFp6VZkQgdyE8g6jEfBKqP37yskvQFz1rAiv1Ea33f5FhSQnF/nvgfTzNRjv2+05Bp8iDKmUw+2XNWX84zqt1/XjGTnSIBPr5wG0U/T2Bj1jWTmzKvsx2QameTaEXlxDA9bCWqZv+kYkN91XMFZRniZX+3LXGJ7VdxM/6xeRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646598; c=relaxed/simple;
	bh=o6a1m0HuqNr7c3ToLEVUTzzKYGBAGsWWe8f7mvioaOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFhGX3Em125K8GbTNJvILWWy2V2Pqjpv7k5HL7/W4kfbzfjC/rHPwRZwLBzmQmoLeOGbGlwEnw8lGaD5Tod+DLpuxS+6bSILw15RAFVx7UQgaqx72QyMPodx/e0XY+o1C76L6cxqUY5p+4ww/lazT6oQnZCQLXp4jPPfeZQ6osM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARgmDqlx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzL6DQ86; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARgmDqlx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzL6DQ86"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfuTc1804780
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKVVqmdEIqPOS771TQWenwJogzVCfuDF4qm/BZD4He4=; b=ARgmDqlxagw+Y6vS
	6A1opmdopVT1+Orfg23khbC4FaI9n4aIZpwB37E97WMl0TEClSRRT2F64HiYGx0d
	/p0/qBnG5cIpEHPyZab67SUfADUSTjriZfhGMBVYeKf0HszTsuhSi2y9FxudAny1
	l9Y/ENT7x+DpFy4BjQby3deP4kEviYKxg36qW8vBLpdHhrvqzAR9avdNo/5uv3Ms
	oJ65e0hTNpIJ/uweCU2Wc9uxadnila5hyY3eO4XMYhL20ssd9oRbRXVNJVffcIaF
	kCtdxzR+nM/VcAs5Cjw2LA5JlB4+fTtRtz8+pxFIv5f5wqY4Y3yME0zfpliFb3ZW
	kd4hpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9dfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:09:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so11227661cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646595; x=1785251395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKVVqmdEIqPOS771TQWenwJogzVCfuDF4qm/BZD4He4=;
        b=jzL6DQ862/TDfAcuZQz27luun/R9mcIdpD0GAj740MiFooSbGxIp30A/jgXS7IuRtG
         LFXHjCZ831QX2lu0PfiGyj1Qo3nqeoa4J12yfx12JRAyDpeXa/3tZageKPUN9XIUz4gq
         K2Jfn3GJKEjN5VjZAjB6959Rg2e8gfLKHUezCOlMaeweTlFt9/CeBR+RxKkOHLG1/pa+
         npoZXIqwzDfgQYjqdRX595RAisnRcyvFkJo2bz35YdxxPy141MJR27NdLOpJem3KWuFx
         WVkXgUhNBHBfaAv4o/j9eeZh0hNNv6bB2qQDh3mkY18ClUcU1PdvT1Sm/ea4dXgaAYky
         okpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646595; x=1785251395;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKVVqmdEIqPOS771TQWenwJogzVCfuDF4qm/BZD4He4=;
        b=RQvCFl6WVkq4A31sjqzowthg5gvmIvhcgDHGBCEic9JNCxKlMe9PeAq1sGO0qS0+N+
         9qcmK/lXANHQYhkB8ecNEQxXFVzaeV3mhITfGso8rZhTdmeE2vLcOEXZm1LfU96ZaA6N
         SfC1RjhhsV8yP08VCp7iUPfwMc5fem72gvo/R0WHZ1hftvao20HD8WgFOwV1H6tceg13
         97U84nA2pQinzoEB3yv0AaYYyDu5676tKLDnO7oNacWL9K3Pb/L7v2KqLI/qDAlLaVJZ
         MCRm8DV191BehTaxJUJHBJEQLCVJ+385Y92rsrC+BQSmMdc+pZSsA5fGX5B7xnPaf+rV
         fPUg==
X-Gm-Message-State: AOJu0Yy2Tq6kwtQsU8ttDmb6zJoHM6y6NuoblTk04Hox00MwqiEW5sLC
	TTqo9SqqPvY/4tsNOtXGG3bT2OtWg/I5IdXgFPI5xwoAMJXFyLF7WnVklQk8kCjC04e13zjakaR
	+pw/CsAsHT7WYDTXmnSg0cB26jRhGcjPsjejbFDM8SnBK6hHK/3rLESIslePq4OmJCn1+
X-Gm-Gg: AfdE7cm8riOdqk6JM0FVVgA76OjeyaZm+oUCQqWoFqe+7nfaOL+8kTF7e4946yMw4xX
	67uEYSSgFxfKqBHtdfNyEEVu0l/HLcSAbEAHV2l+zhJ+CEBSmxj3eXa9JTE2hE1chWtuI7cuttU
	GzvWaA+pOZtYLmpsEMped0i973grxcUyr6DIWsNeHuhaFHXJwZ2LbExG2B5KUgTpH3jmDFXcMKq
	NkfqXMJnWUec4DuTXkeAK5qZl472S5xjcZG+wwUwr1w5ZEtXDFtOqzfU5JCIJwggCVgXyMLFaum
	/gyj+dt0SgTcBqQtCFJ/yaE6G9I594bJqK5qATZNe2haX56n6k3jYi6O91sXXpycGXzdpklwTMs
	wIcbmoyTmh6t7zShgviMWBdK3OB0VFg==
X-Received: by 2002:a05:622a:248a:b0:51c:1532:ae93 with SMTP id d75a77b69052e-5213c9e061cmr179203721cf.26.1784646595080;
        Tue, 21 Jul 2026 08:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:248a:b0:51c:1532:ae93 with SMTP id d75a77b69052e-5213c9e061cmr179203231cf.26.1784646594558;
        Tue, 21 Jul 2026 08:09:54 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm41669837f8f.1.2026.07.21.08.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:09:53 -0700 (PDT)
Message-ID: <6e089dc2-6c63-40f4-87d5-4afc4ea1a8a7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza
 ADSP to SM8550 schema
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nA-ZRoCpsdLF8kfNp-xGJhOFXnLc8h1T
X-Proofpoint-ORIG-GUID: nA-ZRoCpsdLF8kfNp-xGJhOFXnLc8h1T
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f8bc3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=k9SBiAmlDrj1XZnTgNoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX5SrHUsxy4yRR
 XQLpTqL30slHgsQYo8tsZkW5FCuVcpS160G94jqMTqJlyxnumbZwGdtVkcTaE0B0BKREqEHulLG
 jFeL+w+8kW/WSGvG+Bpb1NdiepXf3r1DsrPjOFn576Kn2AGIJqSujXK+n7iubOQd4Mp541wuXwa
 oTM7Ry/Bsl9wYBxbnwSe6Q3N6NklWkl6XzPrSfn372KoOlVmVoUQhsvESmLjbGkm/1derFPcfpW
 UWh08DWKyPAl/FwoCitpVAGStUtwdbts3hjZYwhN8oJmsGRSwtPtsnnULrSNXJeQnJtob93boOh
 2qll985rwedbfzvWtpIBOoZcv1icyWPV0vkzV6OwBSFYRgqEFcSQo449LMmEasJ7IUR2JO84GOy
 Q8NOaKtrWX7wM5N5yUgF4jcl3NCDqVIfEUP/ekfYf2zhYPPqRziqBEI1Z8z/VVfoxBeKAG90MgD
 TfNXkR83N947HZp+y0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX3fy7cW5E/IAV
 GPC6d3iEW5GOxGa8eg098o9Ikdw8UxtgSE0uQDiEUxCxKWwIujJkqpIQBROI4OGU+z4BU6qwD/t
 RPJp8ItaNOrqpiJU43tBDsK4U3JWLz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210160

On 21/07/2026 13:35, Abel Vesa wrote:
> @@ -232,6 +234,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,x1e80100-adsp-pas
> 

I think this hunk is not needed, because it is covered by fallback and
contains. I made today same mistake :)

Best regards,
Krzysztof
