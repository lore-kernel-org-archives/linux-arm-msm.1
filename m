Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8DD52CCFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072933; cv=none; b=f9oPd2sBq1/Tyq33MlD+f9jF6Q+EtGzyWMQtHODogs0k1JTVxzDTbjXJ6F+0b2zoOlBxql8ZgzlbG+GdMvsOpy1bqpHBV+fOzOqCYdyUwOOzIB2jlMf/xm1TOthGeREJEMeGGmeY5fEtjDMamQtJMOlillPs/CcxZep4NgkJA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072933; c=relaxed/simple;
	bh=schUaY7dyl451VZO8g3HhdjcVmhyLtyRRPBvzz1ZL7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjrBgon+qTgUH/+T8fWDt/AeVlYIvkeoQ3/zAQyQx0GIG1wnWz+sy4Z+WqeQiwEZZia6NUo9bRyaXw/qy49bmeEPm52ORzM2Jv4bst0/Jcxs07oXZpmrInBbtNcbcCVHVZV6lvXEdKxg/DQmohtaJeQ5ALXJyf9qzICSWx2+OgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kK71gbJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cxlnd8Ci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kK71gbJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cxlnd8Ci"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPen44100213
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bg389eeTV21m7IPBaUUrgSXJpvs8Auq52lzO2Add3j0=; b=kK71gbJ8yc/chBbo
	iNBE/0tX4zPcid5HHbCO3s0hUdGfnBJ0oRLu28ZHZ1BFHUro8AxdUzXEVzJk+cji
	zwmwZrBg6jvt00lVEYVXrl9YCcz9cDeurFQMmvYHuTzz6epxRnFGJhb89pJmiWo5
	e67is8aQOPw/1EX+r9QmxXhnEniloENU5iEDUB3TwAVINYUUkHfs43dNZakA2vk1
	nklgXVULUf2gAT5MUpn1hnTC4D3dotEy/tIQSVdOQCikPyqcAwVHy24naRReeL0j
	uVsNNDlNTZBUYDePW+ZzCOfO5Qbrn4uPdRm3fu9XbV6bVQKi32aeFOpnHJamYucy
	M1pZPw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8t62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:02:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc081f3066so22156137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792072930; x=1792677730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bg389eeTV21m7IPBaUUrgSXJpvs8Auq52lzO2Add3j0=;
        b=Cxlnd8CiYmn+BK9pKseYNQpV1JZYMOabwbLrZxz0iy/PNUICGpRvAufrSNTblK4a4F
         85TsrD4wJUrb1tqZbmfOiQsQLCTOnOqw40sk05rXPbNq5oHCOPqKNjPY8+KDgasc4K36
         QCBEYKYXbg/ujAsqLlMoUOA3Tm+c+aZ+fkzTw2arTd+SoAIFKtgCQ40DaDQA/Jid558s
         a2WIe0Zu8OOwSkq1iFD4k0MGAwnDMVz9O6kTFYNZjg+vXeLbvj4bea+cng/3YZuzNE+u
         pe6gJCIQgKjGM4+YbT2e929fG4GK+iipIAx4xq1TUT2OIbR77vSqYsmPXBYxpR2N8VQs
         2Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072930; x=1792677730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bg389eeTV21m7IPBaUUrgSXJpvs8Auq52lzO2Add3j0=;
        b=OkdTo2NpVWGUffsTHWboJnhD+SFJNJjwD6bN8ZalKmLXEWotatyW0WsDapqX/8qVu6
         2ho9jp5jBRfvn5VdI61XZ6+ym1QqRLHduVN7yur+Uq2A3lMbxxsIAjfld9BIhpJNLCNv
         fRYmCdMusxuPHqzw3abLlDZs3JeXXFN+fkPBZ5CvncTHiMIFUSCssvDLnCJl8xQguCwu
         nbwus+MVeOwKSywvhk5nfe7nLm2Urv31CJlUvy0ADnVM2bSfvIiFL4pJETrIC+rJIai2
         ARV+wGhynmC2UV5kCBdgzmJCRsmkKbuqw3R57tehjnI4yu9yolySA7x+3v3qgcXdyFqW
         vLCA==
X-Forwarded-Encrypted: i=1; AKwUvByWJlf6kH8UQqOpKwxXWR3ndtcg5tFz4Qh+u68I11Lv5jQ9UcL1oDq5079okDKCDVF2n0lzqFqdkxssDMpp@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ6bUILG3MV5uEBqWGzXKaS0L3ZOEU83qhO30uzn6+Srv580sC
	UvicWbCAUKv0lkRhTzNQ8TXr+4S0t7y1DwfWxkB+jLg/Q3idn5+ZC2akNiTY5fb3e22S0OYWMoT
	wkzFlJbmm0sU1mJpZRR4yqeYon8o4i//paHLCvkgazUqSVJVvw84SRN1TPJyQYDUdIW3m
X-Gm-Gg: AYBFou2X7EYsbESGYjgKaiT0KvlrYJttRrzTBJAh3UbFsqO6EmBAF/oETlUg/vuQIDW
	LOiNQRWTpHBfPSFTp+iqi3alLQ2ZguBay8jo4Jb+mCssPXgMFnbTYheQxRAjd4WNonG8KusyMSV
	SX7DRKNvNw+CV5kuOmRRdylzi4Rnywwr0/uT6tE/8YXR78kf8o+62oyhE85UWVu7TYlno3e1hRg
	kJO37K9C4KlJiZ62Lc8wrm0OGkWMp65vAlQTPl9aqPYPLTPJrjrIhOqhNs9MFvKnEpdYj9+5ImL
	9XDuSpCr8znpyLZUwsWEvwVBtdIddKc1HZvbo3MRSNNOtupMHrDVNmEMxtoFiDPqlUoeJR+J/+O
	NVVwy8CTcnRNRHHLo9/qLJg==
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr304549e0c.5.1792072930292;
        Thu, 15 Oct 2026 07:02:10 -0700 (PDT)
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr304483e0c.5.1792072929078;
        Thu, 15 Oct 2026 07:02:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3abe2sm129743266b.38.2026.10.15.07.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:02:08 -0700 (PDT)
Message-ID: <0d1a67f0-6cd9-4801-a25d-32c5ea043580@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfXyuP5P9gKp5Q7
 lCN3xYFiiRYyZ8Lb9hh0NfUsV4nUDsIowavpwfWcZquD2uY9/d0RwjJfUUnq7/NHiQ6K3J8+MTL
 D71Nwfj10TN2z4QobJZnHBPhcjODylw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX5KdeAjPSeH74
 7flHi6fm1nyBYiLTjUsAxMMpiI1eQ6Lf002UY/sIAj9Pa72DPTAHeGl/mSlNwPsb74EXBv2Iks+
 uQgormgF1cvqsub6JICI0d6WQJJ+zN7bBnPUiNggn28aovrqCHHYmZiBc4dwYHFxhiCrQHp9btF
 lP1tm+rKtTdkyGMU+Gr2OYqy/nfVCEoYIUKwKOatDzCyMO0DuwANEO4Szl6b6b3H53DwYhj+r9W
 1p6bvnQqLOFq8HoaSKcojhzX514JlzpmUOROQLXqjI33YmHY7akWEBQQb15QQK6cuhh34Ab606p
 NAiS7b83D8qhmBtCcGlaObwXOk2MFrw412gH7mMU67I+u+m7wR1kFeaYpmsse8MuXpII69yicpS
 q47FsKHr00qXcnQLCdFaJtJpVEaQCfJvtfG1tNn9j2fTObvElDoPfOrn07DBODIsFgP8kyW5B9S
 di1W2AyXWUlzsSI5vZw==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0dce3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YH52cVpet1kxF2CUr3gA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: a2QM5qq6EhsA2f0laLE0gUkH6gnxxYrQ
X-Proofpoint-ORIG-GUID: a2QM5qq6EhsA2f0laLE0gUkH6gnxxYrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150055

On 9/16/26 1:04 PM, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebase onto next-20260915.
> - Drop the CDSP glink-edge description, as it was merged with the
>   CDSP remoteproc support.
> - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> - Drop the undocumented tertiary ADSP CB7 stream (0x1087).
> - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> ---

GPT tells me you should have a memory-region for the audioPD heap
(in case you copy-paste it, there are patches from ~today to do
s/reusable/no-map/ to prevent an unauthorized access after we map
the memory away through SCM)

Konrad
