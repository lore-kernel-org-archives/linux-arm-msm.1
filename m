Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A3513575
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165983; cv=none; b=NNQKKmlZ+jlJkHcSfVEVhF/lPKaJcL/rpzZUclXwohLMBKLDKeZGNrCLSPjS7BIvyNMQaK3mP+65Vud+B98fE19G5o0ZrSgh1drxExNJsOCR09pvU/hFZPJ25uXazbRQoDHhme7aDLhX/NQqo/n6Nb5S3THKcMPl8eQ4t1FmUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165983; c=relaxed/simple;
	bh=FRdZr1Qf2ewNAG90/1w19BygcGtrxeTxuYozL/kI2NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CP6naOJd2ySFBF2iD0WpgfuPhAy5r084RFocyi4hn1fAylAZaE9QiYr+fsbO+Q0NP3ox5WHzZXdgNih+cABx/l2DfFKZQ12XJM3/4k2DTwXoqfPkHXsVj+0S/1FZhxXX0s7uvt6bEZfmeq/gxUCa2Gz4hwdQ/EtY4q3RV/YkNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSFRmsHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0oBM9n3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSFRmsHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0oBM9n3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVld1831826
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnMmorU5z7ubvp2RV2au0vwumoI2G82ZHEvqLawCVIM=; b=kSFRmsHs+oW+GSUU
	LEz6kZCbnLmpB6rmdxPPBwFZ8nEOw6U3TrYlxIcfTNQg5rpTCFb0P4h3jowlyhRA
	HkpRBwcDwfH0kDYeBBhUwa8GRa/Z+H+mmVWHOHw4mlbl1kjQSo10i3kN5LrrPcdm
	knEs9W5dcHZjmPCaoFnVPTQKtchQqGhmyNFg1xf7jYj4cfgyizDvxcQGUmf00e06
	1sjSaUZgzZvoo7wcoRn5JT20n818K2hSJOWlNULI1wz2xV+So11VZTZyIK/lml3g
	8HR0IsaDkrXUpzcJUFH/m6yy5ETHH+tyjj+bTYuEnUGPDq9+6/y3ursRtUiGw6j4
	ysbULQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3uth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:19:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806a17a7baso25175241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165980; x=1790770780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnMmorU5z7ubvp2RV2au0vwumoI2G82ZHEvqLawCVIM=;
        b=R0oBM9n3EsHbNbGF+9YMcC/vXlvEigwOm9e2vI7nSKjQ22Qb7wK1t6oPKhgEo+TqQb
         drf/5EBOBKpD8MEqg0T2Mzca+0yJxfmV0mLP7oQkmfHnFA/HF7oXrw4KcWs6j+gqHUtb
         4s6kGhCN/uY20hKOKV4iepYAqN+2fZDCdV8hlKliTs3CYmF212jjt7zrPjh6TYMNK0FF
         aRWqd1prUe1apnA0M2L1smnqhYJW/omid6ttEpgGv6IzurlcGmhjtvjWtcfav1+vlDh7
         j1TJsG3WoCNC6Dl0bvfxDMlj5rOtvc1ZXRYq4H5TV+wMPKx0OUONksYdrw4fzZ+9SYoD
         2JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165980; x=1790770780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnMmorU5z7ubvp2RV2au0vwumoI2G82ZHEvqLawCVIM=;
        b=cBKrN1mlaVGyeuTi4pisR4KPYhhYcQeXU/pz3PQggqN+Ek+RMD+teUXwTrYKR/NOSV
         F8IPzVuDs+59RTnIzw737z/h+902dUbTjwpEEOUCngN/4JqIAfGKGlCvQ14kJ8KkFmre
         5L9HKk7YDNTlQBkUI4nh/9ExeEnz0h5lKPioSSencY7142uwx1OzyqFaVSjLcpdhMiDA
         T/xokZHKViC4RtixYw6MJQJ/3NxqAWypSgtfp6oRq+e0aY+04tkvxkV1CWfAZwvACXKe
         Lp6eT545OKWBqRlxbxargSXf/AFacW0Dny3HCO8FI5jGemFVRE6UuwJ+eoxgGQR9yjMP
         v6ww==
X-Gm-Message-State: AFuF++l5qWJ9BfIUj2YqGVyfhk/3qbUeNRZQH1fiA6CIi/8Bpfg74QN1
	Q/Mpx91Ow6dM+x9N07O+hT5nYQgMwp5yi9EjuPFFoy4EdycZ8CIyNbBxO3oFca0ol5uX3hNSZXN
	Ki8Rcgib6Npf/w8lR7ggWbHlHL1xXHeWBRYwersan8jUG2i5X9WGZkqggd123/PF81TuY
X-Gm-Gg: AYBFou2UVAh5fEEXE6MhB3JK/MLkrEbnrn8k4P5uFU1V2KLhKcYr/Xc8/EyjlMWtCsw
	kM1hWufGnyaC0jzUYwg1es9amOFGL9i25kaNkSLVc3BLq5xOnqmnHVw64vqvsJj38qWS+kgJLBP
	QbfHSwkoRY+muY4clj4iN3n7+gk3kMiIyV279VUyQynzxVWha77t1j1ak5PUFluItftoLfhj6If
	PaqH+WYBR8xvUEgQCil3qZ0AU2xEs6lF2VJlA1ryy3pZuvrE+ZLseI4EGTkYALS5TDIrUIHg+Jp
	+0enIn/Auu6JePuj4LpVJK88+I/rumER5oIn3cQDGq22ZoFTDSxTEi/I/F9O+agN3r+e+C33Sx/
	MeGdAQdklToUILO1/ooaLeg==
X-Received: by 2002:a05:6102:5e93:b0:7a7:ad9f:539c with SMTP id ada2fe7eead31-7ac1ca9015dmr1987610137.2.1790165979970;
        Wed, 23 Sep 2026 05:19:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5e93:b0:7a7:ad9f:539c with SMTP id ada2fe7eead31-7ac1ca9015dmr1987594137.2.1790165979587;
        Wed, 23 Sep 2026 05:19:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab0aae727sm92143166b.0.2026.09.23.05.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:19:38 -0700 (PDT)
Message-ID: <07ad0b0e-f666-44f7-b5a2-bf9ad016b297@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8SFbGi0S2wNtm9exCAlNEOvtVCJN9Jzo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX++fyYHsTg9oH
 wguLZrsseub4TgkYpihczq0+q1R/3o0F8F/TZg1/YZOZYA89oa2v/YdGOEtBSSo0NUhwX0BR3P6
 Ojb4j/atg2YTo5i+UUVKzEPOwnT6VeU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfXwOF32n15eFm+
 ONOF193TDXZpThGL19qLm/tobhLGpa48G1F63Ai4eyog7t3f7ZccL4kO2I5xeWFZ69ds/a/ZusT
 mmVEJDrBl05wTNiTRpvId6ToWwNuj0bHC+pMJefvq5K/ReSZHLTS0VSkSQ5P6FbS41r1E8Fl5xt
 Cg4nHDvE4TeF9JHwbT7XmbS2mwCkzqRKW3Jwb5nq0H1zQJPVFkf2PXrvHJwGZctkHiHYrbI9YIr
 vMioQIbc40rCZNybX1Nw6No5Xp2dDtc4EBSV6uVrpwZ3OzdwJ2yJ1mDrFYJ52+v8bEumEOnQsBp
 WnlI7wE7wqIaoosw1L7oBUT05W6h++PfPITGo9wmKH2xiB6hNTyQRZmLYB4IUrzWB8loW/it/r+
 mQUHmK3PaUVliKGYEhRvRmJh/YSMLxs6enlkM5NiFhr4K0QI+4fc4ty3BWCZRro45vBcTAJk0lF
 SS/KFHlx7HGjpuMoYhQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3c3dd cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Z49P6srHwRQ8gCsPR7EA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 8SFbGi0S2wNtm9exCAlNEOvtVCJN9Jzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049

On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
> Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
> the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
> add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
> tuning parameters.
> 
> This allows both Monaco PCIe controllers to operate reliably in
> Endpoint mode.

Does that also apply to lemans?

Konrad
