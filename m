Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31F2DA759
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135459; cv=none; b=I+30Wwx7SPi+V483eUWvp6CRlgw/htEQgwYTeCWn58vF9bWt8AlKuENlq3XzvlIFD44gD5QPvKD8aQowCCzwgGxoS9wAZqcqlkQ7LATOlYvMcN1V4hV5L3ijXM/9O9pU91Ywk/qqxsDvapxPHLxFteK8I8PNvYl3vVMFb7LqNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135459; c=relaxed/simple;
	bh=FWvJQsI7vX6te9FCEvtqImFgPeYI0Anod7aWc0Gi78c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQGKD0COayqvnWPxRSrF8ihy+xrrK0APo/B6y2EfsLWmD+dF9cFjd5SblA5TmZNSE1tHzECIr/J685gHdwCp3l3T/mj1hrTaz2HbdfSMCauxwKzaCN5BeoPYGqH/1N3kTxtgn+Kn23eYf932/ZieLQHcV33xoDa0TQhLyWTVyw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM4SuUk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVZH8mO6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM4SuUk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVZH8mO6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7x3w3983906
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feZlpbqH6L+6P/ifk8/NvWAAI1OsZ3npZiNA0uBBozU=; b=WM4SuUk6Qnf3BqN3
	aNWPQt0KqxI43RRRJ/bi7/ONXmHuCX+M1LSJ6wUzmUtwy51Kiw9FpncQlAH+a0Fc
	GY80Gpea4iPQFSfjd+2OxPEw5l6k9q0jD5CJWZ9nK5T5Vx/84nzsv/q3t0zHfPWK
	at4lWGSojkJivYEoUvt1GwfXRPUnA39udcFpXYNWBinCQmXdksktPh8vpBnGhR22
	4gmmXAPch1d2yJPo4NLkUi88e4SmRotZYKzuxmLI+NRJfGv4ncqk68fFXEPDEJMm
	hiNfZc09xaeVY40HmZ6/rk0LcxSnRdD4mH6FYGv4pKiAtN6d2W/5xUsHD/Pin6LH
	eRyPWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjjrk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:30:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so20100585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787135456; x=1787740256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feZlpbqH6L+6P/ifk8/NvWAAI1OsZ3npZiNA0uBBozU=;
        b=HVZH8mO6pWkEsKLLsORJiPv9a4ysfHv/McpbmoAP/s3WeOkgyqzpmh/d8s7VCbRWq3
         3k3Xkl15Ms2Qwmur4qzyCl4WnrNwU8cBm0uwx89dhbZlW/sEXhZGcSZdA3xGiln8Zhe2
         cdI8Zwoi+RNk/o0vCkNZY8MUpO22cRbtDMCfRWqmoJvwq28T9oVTqA8USbnv1KLsLy4c
         wnHeeKgdieLZxI5E6fx9bFicCy+h59FXsRyW3i9k8QJSzFgFagPsR9HNYhrxKk4/AxXS
         edQ65rkt9kHYquEVyU8hhVrI6UYCZQfaJ6MTMhaTKXsQG9e44IW42hAmj3lQ7DHPFCws
         jMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135456; x=1787740256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feZlpbqH6L+6P/ifk8/NvWAAI1OsZ3npZiNA0uBBozU=;
        b=A1Zh9my+hwplTDihQuDtKySEhN6z6MYU3MglzrovpHBT0LGCQVEVsrDni3hjWz4tBP
         cJnZoBY8d4O24EEMkR4Mi7J7cLlnhUiHZsRuE0/WtgwCevmZP8n2oO1JwDfxYe7XcVum
         0BAcSevMU4Ass8R6bXYnGmtQhRtcHOPVwLXQhllkyXYLcNgCaKEX024Bl1FSaZekyvHk
         z+NOmgq4wNQTyTw2KA/l4Rx62Xfb/jaWfHzhou7D/ANgmk/9pgkApfqAPcSexPnNzPVL
         UpV6awnPWePjbzRpmAUSG1C2N0fMxUCIFNw/MdmTrRCEtu+VEygV1mS/rzff7FNqJBIN
         2/SQ==
X-Gm-Message-State: AOJu0YwX/3Ho5sjPryWwBEcGFImb7mbkNYm6NGqnQ4nsRHI6tyJOCA11
	zgk1kY6+h3WbGSQB/FO5KG8sxJKs1CCkXNp/DkgyP29lRk+DQ4i1G6rXpZPcfKmukv+tYDBkaBJ
	M1FFWdsot1qzo/BpIxhVSkH+SDj+YmRoC4YKu/gshkXThBhmspKkiQqgmsYAfBOMgXU5h
X-Gm-Gg: AR+sD127bvnSl/wKTqN4txQMxRGFFGgKNmQIUsunMzTeZerI2C1OXrI7CQ0du8SNVBu
	Yc7JA99TpZ9qptCVAoaRSReOSm5iumgvuNmjhjfpn54ys1rP0nVleHBJNlMJgZva6kMJfGanlzU
	BpB9bCdfKpKEwPaRhHmecaknp6lMU1IH7XWY8NPgIq1Sdkq+leGBmxv4h6rsCcEYNrvgGoNKM48
	+rmWpYqE/MyGZ3JunUypMDLGoMKGkxH2CizZ1OC56lLHP93G8JU10NyRhMJg8rM8R2hD6bSB/07
	xmv+iaUW5UapXTUb5D5YDnzKYuYHWWLC4jbdb/yvako6TEBTeJ6pEgwyU9eudEZ3xzECmlsW4Sc
	Gq/dS3Z5N5BUh0TaHT19OMthp
X-Received: by 2002:a05:620a:640b:b0:930:f930:a09f with SMTP id af79cd13be357-9371e2ff3fbmr234566385a.1.1787135456226;
        Wed, 19 Aug 2026 03:30:56 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:930:f930:a09f with SMTP id af79cd13be357-9371e2ff3fbmr234561985a.1.1787135455750;
        Wed, 19 Aug 2026 03:30:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c8e4542sm55440066b.0.2026.08.19.03.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:30:55 -0700 (PDT)
Message-ID: <0fb7ba32-b9bc-4831-84c9-b5e00882c481@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:30:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: llcc-qcom: Handle errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819102630.68991-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819102630.68991-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MCBTYWx0ZWRfX1wU5wU3g+8mA
 qY2feBLZ7ZmEKkAi5lqeVk6CXEM6eWB7DN9qjLbOdXsmJjPK42t+4nGMGZEfhEiuztZ5CBwpFHz
 6NpUXtOItiKoPT1POFH3hoqThSMjsHayBFnhXVTKOypnN5SCUOBq3aRvdLKyH6tKcFmsAINFUHb
 cM6jpjqf46ff8lcm4yZeia45LdnnM+K+DeDJXDy0JX6s4+my4braDHW2fLSnAm6YLx3fFXWpbGM
 hdeq3rNwLXbvkffh9Q/NqCh887FDAinoiTFoI9VmRqTjbvlV+lHi4/flNMVcAyd+O4r3AEGa+Q4
 dOF4LnBRwa8wjWCvtBpX2U/lW8CWAeDISEOCySrDaW2TvtRV62jGGVtyvE6XMwu2REYCr/2q8XP
 sy3HCe/0WU+X76MIAsmoOmilpb/gGLYQR4Ij0AkOy4GqUlCIUaCsrSSrepLGJxVMMcLUJx1ddGJ
 OtbnqzVu/sl8OhcnuLQ==
X-Proofpoint-GUID: 9AV9ZkK1kaZuuFGtt84HnVEMee8Cl4s5
X-Proofpoint-ORIG-GUID: 9AV9ZkK1kaZuuFGtt84HnVEMee8Cl4s5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MCBTYWx0ZWRfXxGn2m+dekYyp
 zoiJ2FsBYPCTR7VBq3LU+1b9Pc6HG2NKW4a0IrKs+h/fIQjGtKxN3mmNRzBSf0AGH02FJ867Z1S
 K9AqgizN85e1OgZUpPaRncs0ZMTPDdw=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8585e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dk0Pv1avHT4kJd7mLlYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190080

On 8/19/26 12:26 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> and -EINVAL, should be propagated so that the caller can handle them
> appropriately.
> 
> Propagate negative errors other than -ENXIO.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
