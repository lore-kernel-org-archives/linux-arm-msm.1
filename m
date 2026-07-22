Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842F3E8C65
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704472; cv=none; b=Mm/czRGZdiHOB3Fm3uwO6qejW0fX2Q/dCvjUHf6YyMnVsJhEwKkz1/m9SeENxWyMHsEffwVknC7IUEYoV96wo4PNfZwMhOgc8QuL1eSPx+I8UHyk3j5onSs8yrXd76d6jS6ipMtiHZcpKjFgLeQ20FqHIstFfn2nX/4B1DlZHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704472; c=relaxed/simple;
	bh=poo9J93CiiYTownm8oTrSBfMdjoeuw+S4wZBWxJ/QL0=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=Iw95aDti1dtARjXrWlZywXuWP9i9pnKQs0qPClLcAAEGIekClXqbxrZds0BlwIJnoL2iCOCxCQnyK4NKDr7pys8juNo8Nnknug+uB7a/9VzutXAQgJZYkboWK/QHcPyuHM9EOP+O3eavk711aPktEPMSqOQfUeOheG2wtzFky/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjAqo7LA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIRhwcIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjAqo7LA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIRhwcIy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53jeU4055077
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6WZlUuh3ud4p8X6xsya3c8SjjkN8PuSsK3pWB1fpMw=; b=AjAqo7LAuFLPTaW+
	g/1pLskBeOz/IJGLF/MUAyzKMnFXDB+lJCR73CwGumcStABOBxIR1lpMmopSJhFE
	q5WMM6C0Cwydk+/tY1R3nNXG+puSausZOvEmMRMTOpkwpWks/F/9B1sjf18banSH
	Tm4p/TlUtC9e+EMHndKx1V+k6KCMnxnBLSGbeHWDS0dzVwUH2qMcKGe8WDYPxDl1
	rudj16LahEaZgvd+KiYtIgPgPcmiZb8NFleBZ8iaXkEPrbiIk13jvJOZZjvQQfkq
	YxmMEpTvyenz6MnTT5dPkDQ39mLpJdkBPgYCORVLPZM77jGSUPoIjg8cKBsEmrwo
	WD//vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgjfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:14:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso9626747a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784704468; x=1785309268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o6WZlUuh3ud4p8X6xsya3c8SjjkN8PuSsK3pWB1fpMw=;
        b=dIRhwcIySRfNtI8tJ7bSagbs0EWPyK9et2jT1qe0Ut4cbQkyV4Qd7DIQoU2K0UJ6XH
         Bcs0g52dpzmpzSpfxc1dGPATtxaaJ3IhtbZoSO0QmHEWlKOwC8C+zBoEqBbWE2aTmfPN
         sLtbVDGZdoPtgPYRBT2Ymseq+CIblLSOU0z0DHak04ii8OCIbMBZnWfglafdv2i/voHR
         lyq4CZzxJpbQknujzzXRM0NdVyeu6cnACLW8vzO0IafclRNV8Kxy5XUOnMjv2yFXDHuO
         ihzqASC+QENsN6LOdqYSvSbcVV0GYTwrwqKxOvVtE0PW3peCWnGIv69do/eUVjBUYgAg
         E91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704468; x=1785309268;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6WZlUuh3ud4p8X6xsya3c8SjjkN8PuSsK3pWB1fpMw=;
        b=rw+0zyaTPCi76ZZYNH82IsdlkZVWlc89UtOmLYTu4zqsTm9FqzjsPdyj9ZoNsSVHRT
         Ao+JyyUdqswtFhwuW54BGI422VTl8ntSO6wOUE88LgCh9VD+bw8C1w8j68lbI3DWcDnR
         vmU3LoL6sWq5aHgIfdWipYA36Msu7tlYSijlGuHf0hXSnqdm5n5k1NhpK4ktMlU7ocUx
         dsX9vi8GNefvpU9xZs2DN49BqUTuS/C+1Ayi2FNHqIayFLTk2JM5d42PoPh35W+VjHam
         oZCnnfMHOT7uzE68N3M7JOeTajhEpbE6SvPnZ+tbvPJKjWHpx9NkYlXgVNJrn3+j9Olr
         wRzA==
X-Forwarded-Encrypted: i=1; AHgh+RpTZ7nMAzroVC2a7OeFy9NNKVwOvQPiu8dR5WTVrxUjGhmknX4i7QJEBAd2x1NrMqzJXNQU8cVmKdGQAIbU@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8ife9XAWRd1oYJMRrj5yrcaB8wOYi62yMVU+Q6YivFFAGpf1
	AkyUgGbc8Lr0rhNTU0rWSYd5rvvxZtLZnaaPStzqZ4NRM+Hn5/RVQxoKsRMqyArIYrUKbYf2LmX
	kSF7gncIXO6tLseRx7LEyHmAChbPoN3+7JznFW+1BlpFAEk40FSpxPKwD7Hf28NAf0m6q
X-Gm-Gg: AR+sD108FQaSTedZgrId+yRYYmQlBDxEuKjijvpNf8Rfz2kPAOfRLzOQ/NCGnAx7AcP
	7bp7b8O2NbgIwTR4tuCGe7VyU75w9sifbJ2rjhhKBAN+ILbf5SI8yoLD1tYxAPZltk6exeq+dJB
	LFZshdar5e9DHkNCvnk7GXWTjyW+jwTlnFXkKt6tU/6IzBCZ8vE+1MXXApCPi+7wWhg2LTcgFmL
	i7Ak+vDWdoDL4QkN0XOPNAPBYngnRGjC2X41COQSBaogzCjH0wK91VpSFjBvbniGdgaCb/i7VWu
	2rElj1Cze3YTc4GX7QBp4xKezXcFsnzN8T+ekeTd6Od7Zwhd8PED495M/WCHD7k1fk0bVVZK/7y
	58QjOzHnanSIolGq7RQD6JZZYomw=
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr18504090a91.33.1784704467799;
        Wed, 22 Jul 2026 00:14:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr18504062a91.33.1784704467297;
        Wed, 22 Jul 2026 00:14:27 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92091875sm2754093a91.7.2026.07.22.00.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:14:26 -0700 (PDT)
Message-ID: <ec502fa5-9e9e-4396-9599-4b297061bfec@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:14:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/7] media: dt-bindings: Add CAMSS device for SM8750
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260721-add-support-for-camss-on-sm8750-v6-2-a5f841061d18@oss.qualcomm.com>
 <20260722-enthusiastic-hyrax-of-zoology-17bd7d@quoll>
In-Reply-To: <20260722-enthusiastic-hyrax-of-zoology-17bd7d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfXwpAeDEjBc1SH
 pz9uAQelWOZJl3lShoockOVOlfY7Dwhma4shWtJcqRuzvxL2cmmV4uFXgdbyRLrj930Fx9/b83K
 aymyS1zLuEBA69I7CGLN1xLfbn++1iKk0TXfY/5RrKA2TWSeAmrrza68lKqap+i/bY3VxD8hsQS
 jH8RNlEID/9aHgERIw1m+d4uUNEMqQuI5P/EFfzfKsaGSNQUFw/z3R8c7+PuU8pM80+Wm2qiEYp
 EKBNQmHOZqHv83ntQGURH3AP57dbIzZ/T5TBdz/bonhIJB0/mHRVKk1uBFDPOIIepQb4fHWPdEd
 tw/B/5rKk8ygTJs1LZ6q/UJKwhXvIrj3TAn96TbW5sXatpk7sla6v54BMPe1ol1sO6ynoKgWkXY
 fgb/3FADTsEi2XMcmO0jTn1MLsY+znlwSBOm02Ml9Wmxexy7cZL+96bbveWIPVIqvhVFPj4ZUiO
 rTO8bekvCRFDLxM+ODw==
X-Proofpoint-GUID: 8RXILi3z3FKijEiHYE9LOoMcEi6wOLhu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX0yLOuB7anjpu
 JGxOWi4qc5vPQUsnZC3IeGs+rG5+TIDsZh5vC2eSAc0AZIAn1bgklylRCvFq/Ba6eUU0UYlGPVz
 MUX21t8/76RXSfp9B6CMLHPimZGdgMk=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a606dd4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=g9Y63sCnjjm7CRfqtwoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8RXILi3z3FKijEiHYE9LOoMcEi6wOLhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220066

On 7/22/26 3:00 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Jul 21, 2026 at 05:46:01AM -0700, Hangxiang Ma wrote:
> > Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
> >
> > The SM8750 platform provides:
> > - 6 x CSIPHY (CSI Physical Layer)
> > - 3 x TPG (Test Pattern Generator)
> > - 3 x CSID (CSI Decoder)
> > - 2 x CSID Lite
> > - 3 x VFE (Video Front End), 5 RDI per VFE
> > - 2 x VFE Lite, 4 RDI per VFE Lite
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop both tags.
> 
> Binding was very different.
> 
> Best regards,
> Krzysztof
> 
> 

Ack

Best regards,
Hangxiang
