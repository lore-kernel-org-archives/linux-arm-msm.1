Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578585;
	b=fiZV+UP2QDFtV+bSnBQHc9+B+3ow3MQ/63/bEn2P481PYt/Y0AH3uIosdVtNMIQeEbLJ
	 1VL/7JwJqx9n6DMfQQjIHzDEL9z+r2ZnyLtpL1F9scHFcJjKqaP/SB4NLCPN2POF6PwCz
	 ebbB/seWovD0/4ryRIeIeVxqHAf42BnVwcXm/NnKpLBGQymBHFXXXMFWNuYPfUJrUm5qN
	 L4qlAGRtHCHC6uvB7UvFFM/zzESkKRX5sUPfej6Waf4LpkmKQcEYTGCZ2sWfC4Aj54U3Z
	 cZXbpkv9HcCICF8nSgS4u99AP033z6/7nyyzpxFjObCzAfivTBaYzh0OEBzVdGySNOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
	b=xlHgd2elhMbUJrCv50ropfchb7mE5sMZrG2M1mkGRzE/7P+io8LM1Eoxmc1xtQb9outl
	 qAHilOfsjibCHY7YiIzTZ1Vii8uK6oCdtDDsi5jQ+RBSXc/e8F+rpjCdy72hAwPFauNbg
	 ZNcpE2u/0wrJQ9kzPY30If2tc2gssbAKZgHooMdR9gkUPEcLKEnQVudr/p4xUU2VY9BIB
	 DF7NJJmCmfbH8viJ9WlTYDlYh/KHVE6gH/Cxj/y2ZpOoNmyoL8LIinl3mYECJVGZ2X0K8
	 jTulmegLxJk+zouXPi+xVWy8oU567pxgT9KZGCFCtiP55viKTjHDaREh7yO8zkcvx8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RH2Avjfm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A60606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A60606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RH2Avjfm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5fw01356958
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=; b=KD0TTfdfaEkJ+Yel
	xsoKUVDsJoAGY8KnexfYH+f8Jv/TrEWvYh+k7bA+RhvgyLbR71zh6sWA8dHmswDo
	FCf+o5rV+NA0ZOROJiYVnAqNm4qPWg128eE0yICi0VKaRYBliukjgOHvlsHWeeeK
	70/jpNo/5wjEmOknYkaRhnK6WLrNi9N1AfiJSRmpwvdyRg+0sIsz53KhtLU/G/KG
	Mu0848esElpWOWpMJmdyl3Vw1xQLbNCGsmEvbMuq/UQa8tnaVJCVSaix/P0FniVF
	lWdLamL8lFa02RNlh3jBhsSl6DUGA7RqG4BYw1ECZa/MIeSG90ShUmxkmh+qaq0f
	tptwvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ues1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so3117546d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578582; x=1793183382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=RH2AvjfmKI/+PNPwqAGug+RpM08POCDnGILP7/tJdH1tqHSCVUVYLat8Z9OSx90nMd
         M452WzyDOVs6JHxZBAO/NfXqHPYhcmNBRZrkqC5noVUpoxKwtiSu5OOLPDNbHqljJDdV
         Mrfk3IzlLIBcqTuJC0fqO5dvGHJDxc2az4zVdg+gvKo5xUbUHzyGlnVLO9G49yPX23gn
         MYjtL3KDVp6wQDCtJORYdedElbETPAOwa7v5ZAxzF/K50dbx/dlTmqFza/6PTEcHsmJg
         xYSc7t1iahrMtF/du0U4CzPMR8iQcl4gEr40pcNbnf0EAxCzurvN/WIzwxURhJGKsni7
         xT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578582; x=1793183382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=tmQAR3ueuY0P5abMUsjnK1xH0d9A7RGrT6wPtzgmSYhWZIRUoegVoBv5a3/z3ZrIYL
         Wm0sNq2902qzsdVJRU47HiDvxaO1uwTKgstY70VmfnlDOHXRC3eI4Zk85Q55a81vWchB
         l+PGZagZmA4BmBWH1uZTYqhZHosos0g/zfBDsJTabpl+Nz58BTXalqTatQfdMhbBVK0d
         gDCcA8X6k0kGw84g2mlszu0LNXXWwjEojXYrnVPIcQjIFJ0xFuhiUJ8Qnal2Mip02LH3
         fbUXJTaZRBuJgz7FD0W2IuHMhnkGEsIfiSQIm6PQ3RMJcRdoPLizNyG4KVFuwrWOd2qW
         JhCA==
X-Gm-Message-State: AFq9FYKfUwJNk8nPtKKnZTUZ5ycz+WZHLUR2MSNo1lCYaESRMLYiIafN
	zhlMN1esvbhudkFIBMJaz3Rs3wDs0E3T4VdmCLpbqx7O6SnhvEpELzoHMqVa1MS6Wuj9igOUKPV
	AXJJ4C8ZYKXDslNpuYjmRHRLmHMkpPG9L/WmtDu+Pa0w0RidMQ9yXDZcAt3cC+KpMOeQQ
X-Gm-Gg: AYBFou3Y2dlyApRwbnqlkZfPAz7jtdPVWME1+7ldqLD5WJAzuPn5/5f8eUb/tkhgt20
	Yc9qGwtJonc9mvm7AnRte+WIglOHNtwcLmcztz3ch1WF606Xt4UCVI1+P6U5N9fqhgXNccHynk7
	wV7Y5suX+ayahH/qeaI+ZGTBjnx9bFmxXr0EPV1uMuYOKd1J729gWqHloVefwekidRGL3xtmn/B
	SolTGXBKgvayq//pRvwShre1eVQP0NbZBZR1VkOyAnj7/TebTnemLI1GsgtcUtMLZh0OKcBpDxP
	JK0nob5B9Vw9a+N+TUIvncRBWLLD4t1vPkoPbKeV/MFZjLY8MHWeGODozAIFtL/zqiJ5OgA1X/4
	ojCBax+MdBQn1IfH9084MTw==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26734051cf.5.1792578582562;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26733781cf.5.1792578582113;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm64407466b.78.2026.10.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:29:41 -0700 (PDT)
Message-ID: <9e60b65a-f412-4026-b84a-6a9bb8b5d42a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:29:39 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 gpi_dma0
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: huh4_6fY6EMRe7QnFHlaF-wLu0NfOPcH
X-Proofpoint-GUID: huh4_6fY6EMRe7QnFHlaF-wLu0NfOPcH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX4G/qDjBi0QSE
 PPcCcp9YzUw4A3J109lwphGJe93NW1AZWbdePzaJlPs2By9oAofRogeXMgTl98VaTrf15jMtZQZ
 kDGfvTEQoLlEQVRh6axF08Rg+wTaKdI=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad89417 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qbaKm5uNP53N5VyfHtwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX1toOwiwQYeqF
 zme9o4FUpGy6+CUeiwPiKpoiN6W/2ZtDnqp4vcDJVawk10TeNCKbV84cqrtBByCdSC5rhw4mgml
 T8zskBKvSFb87FCRlrYcXcUf+IOMXSNDupeJHGlCmjKgcD4ix8/IYGzYtcn3AM4A6JPiOffN8vq
 3/aPK2nmw1sV1lzBUDGq+m6rCdjIy1OxNmS+Z0zUVyzl55zA+yFy23b075XOdjk98PxOWjFEgsd
 mgYk+vKm7erfyiLSfhB+4/7HKBeDBGRbArQqGWpkH1wjCiA4mXo5ZBXiK8zcyUFpMHRTbghLaxy
 +GOuhmTltWjj+AfqK8hs68+0sswmLuO6hmPSsN5Tnr2G0CgNquLmVCGqgyfmZoFAibfUa8x8E3Z
 RhcTT+yDCdW7wzbnb42Qtr4vT9+PXZF3OpsDWCboT9eG/9iv99wQd0IscRFIn0dd21udfsgE1tn
 soDF4EMX7A0vaJN7Caw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 10/16/26 8:38 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Used by not yet introduced tas2559 codec connected to the i2c5.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> We don't have upstream tas2559 driver which would use it yet,
> but the gpi_dma0 is confirmed to be used, thus let's enable it.
> ---

I can't stay this patch is wrong, but I can say it's not
particularly beneficial for both of us to go through the review
process to offload 4 boilerplate LoC that don't have a functional
effect..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
