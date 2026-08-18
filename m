Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1645FFCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054012; cv=none; b=DfjKY+aMRiJxojBken2IBt4bND6Xkg9S8gEEaQJniUOuPk4l9jAuVKLPzqrNvAWh9F9+RXB+dvpxoZVTqcuq72qM6nL0jDIKgFAuUrlb87KQrXtqZs7G4dl57kzP0yMf3D5Xk5JYYjwzR4kFKeSQfhjllxzCZnoK6d2c1+Q2//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054012; c=relaxed/simple;
	bh=91yDQ1nBepGzbCsP0Yu1GP8bdXconghmvFeq9SitlUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTRcFo7hBGWexArvRg9rDfnAaWleQpACqXg19EEKXDbnPnbIcdqhQx0cVcdXedp8jDKByoTOa/W4GeQa0Hl2VPl/4qbE0Z9MNfGOMzGSIuzcvYREjLuaelnBziyJkCemylXPPEaqrUyGRaNU51m+Elgult6zQCIq6QdLkVDQ0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzMAJUpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPOSR/14; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzMAJUpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPOSR/14"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABjh3599505
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	91yDQ1nBepGzbCsP0Yu1GP8bdXconghmvFeq9SitlUo=; b=VzMAJUpQD/XGtPNa
	IFwluHfNtcUnKWfF56pcUUXcknzv3IhUCvuMdXfAKXAcB1LrplULszyU0S6ux4x8
	A0kqZdupzCDV0MRIvoqhCwhAAgDQPNm21GJEmux1Ck16Fw80OfR4cPJUZ8t4pXow
	DynCDCSIVkffOtr9O/5icLPgFLW48Fxq9WN6dC12C9yxRvAsPptD2U7pBhEpRhJb
	/Ca3SqmALc6FkF91gYFnCvKH7r74lMbG1koZlIdu3W3QhlgWTGMwFQWmSmLjCNot
	8JbXQSZUrXLaxpV9ZcZwce8hVdrdV44tYFYO+hlJI1+0hhOCwxhOSPSs5t0WLVFQ
	S9p8xQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtt63j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:53:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so5727081cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787054009; x=1787658809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91yDQ1nBepGzbCsP0Yu1GP8bdXconghmvFeq9SitlUo=;
        b=NPOSR/14o20sszJ2Kp/V4hJ8mn5HFoBpIWR8IXjeRyNhgQaeQjZ/4jAS4T9EPkC1Lm
         017p9KzWiOvC8nYOQC3NoXHYAH4/h9RNrkCwz/g7Ov391Bk8dI7YZ130ir7WhE8oPwyr
         dTLUyvvckGsA10mugm2jqjrI6CA6L9NGLfR7/PzvT6pNmgqtkbRqzlJXnf+0q40NPDwQ
         18S1eK3y9rxAwSavr/h4qEemSJ3obAa0rOXpYvN+xaEa4u5MYABA14OvaqIXJvZTRwjy
         izbsh2lhu43GOKBkNlQDt3EKoyu+S0HUwiK/VvtuNVlvoc6wqiBilMCUxBUp9UZ77OOL
         l7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054009; x=1787658809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91yDQ1nBepGzbCsP0Yu1GP8bdXconghmvFeq9SitlUo=;
        b=oHZwCIJggnpEYwVVpPf56+2S4EtPPy2t3g+M7S0M9PpwQ69aJqTnJdU0JJE40A5e9q
         gLrL+NudGh4KIYGXc/IQArvgzCVQchQF/Vz04c/iedsL3KfvgwP9wrOMxuuVByvhA3xj
         I0Jd9zGP1T3BZoCwfseB/iKRA9CrRqdXk6xI32IGc9J/A7D5akxglO8WzVTW6bwww+lL
         wTQeSQwQVlDaqc2OUY3Wt+DwpA1t7dYyH1hr/uAtvCOUwkBv+7APjUkOZG6E8crNKltM
         zaDDcznnZzp+LvolTYQ7TDSq+K3ZRRxHX5IEBhOD++9BLui8Lt2xVaFeml2AOcfZGiAx
         fPyQ==
X-Gm-Message-State: AOJu0YwwWNHfEh/eVPrUw13NZpURj/Qg9bEQjxszGe2c0j+ZDr/juQkG
	36gsfOKz9PUdyKbzs2FGQDGbw+pnzDsUx6CnTGtZkbRmSIPfADjVcYzq7xLSIH557j7kKG77LXU
	hRxobVW5mC2jGNAzRw34NyD2Zq+ZmrQJC+ons+Q4b95Az6oJzAjYfyIidG9eJs/hNQtY1
X-Gm-Gg: AR+sD13ocgqrKkf/a20cN1GJR7N9q3T6HOrflNaTMXoxsWEcPr77345QFbaFUVoEBGU
	uhIVI4FozzgblsQnv95UvNE6brc6RjWCkEcIeJKRmtcL4o9Eu9C+Pt2aVCZ4hrZvx7jJEjdxvTq
	v7slskjadzasp2W46WYjJjFQNrNboupGy7FUeG1y4YjR0HNgobRxSWhk5mxv2XUTxDpVN8+SPJX
	uG60L2LdsbtE7goWQ/pPctzKLnYJPUJ41MnLQXwJJ+Iqt9MT3m7EVhWMxqd6b/33eDBkSPoqT6h
	d19jtfk9g6ZmekybWIsHYPu9oYOG+INSN+h7ZLhTFFgGjWbM1cxmjStT2/MUAYyrMrtuPkMtyGl
	5XqoNCeDlBwRi/eonfOe0gF5U
X-Received: by 2002:a05:622a:1482:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52d85453f3fmr241984801cf.3.1787054009040;
        Tue, 18 Aug 2026 04:53:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1482:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52d85453f3fmr241984411cf.3.1787054008584;
        Tue, 18 Aug 2026 04:53:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3e47cc8a7sm774936a12.15.2026.08.18.04.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:53:27 -0700 (PDT)
Message-ID: <eca56def-f9de-4aa1-bd71-3b50f1cc9733@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
 <20260802-b4b4-rpmh-kdoc-v1-2-0f5026293d9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-2-0f5026293d9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX/oEVS+0NhTwE
 94imqYGfbKtWrD5DR/clI+pbyhoIM/3+zWDoAGAyC9x/wbFzid1O+sA+ug6vunWDaVAAPp55S0o
 qLmTiyuuaW3OHXxVb8dzHlFoABc24W8=
X-Proofpoint-ORIG-GUID: AdgnVwMujc9oG0pSDFBc2Duk0R_0CUEW
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a8447b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=b5b2cZR-PgSoYANPCakA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: AdgnVwMujc9oG0pSDFBc2Duk0R_0CUEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX7aa5HRD1cxJ7
 W3icqbS4pPWbdt6IgUafXHCyt1xJHAxDn7ARfD1Nsm3o+Nb/fOPrWY+p1+a8Lz1kCdjhsurR2Zl
 4HIUq/cvXHHZH0vMAQL8Y6zUuLQVDFg1UmabcstHp9y478EKA0mMz3SQeevFMEJfsqNNUxu1ac6
 QZb/Te1G6qQTSgCGxNSlZLjnuPvegFjO+FrFYbv2P/vDUAf1mdBxFk2bybAyWgA9o8wCgOnANDL
 JbbVZ/cP20mzg50E+VLoWEc4UbWWaodbUWlVfmct5ay4R8LyqpV8n6hd6qew4NhzBZkrVqozR0x
 T7PN4VKAeZxdwCJHinW1GpL+DiLnB4jlBenYVw/RFUfnnV6ssoJnIKi4xgOrbpHa4o0EhAyoO8/
 qevshdterr4cEcTg/VcHDuBhcBEsMdmUEkbR/4rPontDCZKQudJlqCQDofyD4tC2fF1Z86LK+9B
 BF00ugoBM84ywUTCtdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180087

On 8/2/26 3:28 PM, Maulik Shah wrote:
> Six documentation issues in rpmh.c:

[...]

> +/**
> + * rpmh_tx_done() - Signal the completion of a RPMH transfer.

nit: "an RPMH" (because the R is pronounced with a leading "vowel sound")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
