Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D6C1E7C02
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241372; cv=none; b=pED4Od9P/MVJZbcKgou53bz+GWS+L1lOw9gjRlnk9VAxJ/Q/GOw8yhQda3ps0m3XkwgLFz0xsnQfgC1ykhAhsQWDqkNn62XaD6pdfUin07OQMdzIzTahLwRBpPlRB7oXhrAFOruLR614MgR4zLcIzuOMyUHNNtwopF/q9TsztIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241372; c=relaxed/simple;
	bh=UIKstqurvDjxzL0QWKccHfdzWCjnXAwcsfxWJHVXiSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tepQz4hiK9Q8cMRyqFX1rPTMMc/KfwvPeJZscrGBvbRKRrm2SPLOL641SeKCZ+mGCNrTxgkAaVuUlhAdWQkFvucduln5vJ3sl9PVwReVdIc0f2gFcfw01j28dKrHz/IdhxHvkLOEOy118yShcfV0W2xyUMHNEpbUUm7lZbg97Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ul/wv478; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj3F3Mw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ul/wv478";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj3F3Mw4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68143Iai1645887
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=; b=Ul/wv478uHinSezB
	caeZKYe44/KP1hBaIuULUvqNEGuJAn403Xcu0ydSPZYkhNIG1qgD+g7BrmZ7C67i
	wlSGDQP0fc7DQX2HISnzZyO/psDGs77O1gADnulW1KFFbOpBCCfSGfInHR3N9vfk
	37Ne+OHEwH9cBT1+s9VCnHIPsjhobrFKbxh4lp7XfUxY4HGiWMi1MCLMi6Qow/kk
	Q1eyiA/dHSL2QBMDStbZ88VQUL7jg8Kg0OogQD00KhlHu1oqEMWEurya7H4FVQrT
	EfUPPFOeRfTmGc68ev1rnYrYPLWqOkWZbQncg+9qnnZ0WYtsSlRDXh+BxSBzNK7N
	rAQoyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0a7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:42:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1004232a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788241368; x=1788846168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=;
        b=Lj3F3Mw4AXKPXSB3PBut5Dovl2VwauBy3rA90/LGub27Btt2769r0xxEakKX3bR7vd
         UI6mCdZq0gohhFGpvEoRdXZaXP/2P6C6R24kD+Zoft9X5sRO+27rMea5g6dzZxh9EJzT
         K2ZeNEZrGc3+ohly/1CxBOPR4zWSsFMj+vtsC3ja8w0Z7ouEvO+e46cC8aQbHIaGFoD5
         6A95yMDtI2RJ6NDSXhHsDWC7IhvHxsXBnWWobz8XT3IukZbrNZCo/f2EI2bBbbjF++KD
         wrHUTruppFzAmJBZ0tVeznB+bLQxe25yJDA/6C1f2NghM8owUlwpWCeSl86U5aQ0OPLY
         eAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241368; x=1788846168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=;
        b=HP8Fhl7JsEvO0kpcjJ7PnBwD5pBruMBzpsfFji6x4HrtJjRefaM4OeSDssqmRfWoEK
         SVeKTh+KhNoKaReLuZobIFQKm5KPI9c7XNiyBTqUW6iWfWTTyk4KbqKi1PflTSGuXlNK
         b/UJ5tPvnS8gsBRKmMCmCySXkInI5ftFvjEXBNLD5qHgLFo4TnuMfDHP+MK6yWDAnNZg
         AVDT6KyQjF65U9t0qfm8ocMs/gfqTuQUhL9elSc47OELEy0DxwwF0jb7Aa+ZomzMuIdg
         4twqIxjpEavWVvx3R5BDThXWyqSeWyOv4K3HSpMVnwidF5Cva52/6Z1CAyLUSrOcxGBs
         cEgg==
X-Forwarded-Encrypted: i=1; AKwUvBxkIyAynzcZhuoxcZub+Hrq1NPd9eps3/mS3GPssoLesm6Humd+odVXYkP1BKgV0p3/SeheZIYH4YN+GxmR@vger.kernel.org
X-Gm-Message-State: AFuF++l+rpXdDuXNKyjZGAwvVR1n46ge1wk0i9s80/Vq1RzgpRSJBedP
	YNbdH4yWTawtq+b9WTKsWqgdYdclblVq7HZDzJIkYG2O4QNA2ltD3UQGYkBe61nDlK9i1/CgKGp
	xu++Z2SN7cbQhL3fiXshrmPm47UfFM7IGrBSVct/UtghjfTvnCr+rLnctz/IOj33+RL/i
X-Gm-Gg: AYBFou3W/G7/F5A+7OVuylCz2x3vHLEOtyJEjm6RS+u1MZaT7uBEhU+FlCqhOoD+YHX
	DwW6Sb/OsV0WW3IcEVnYE3uCRfSS+6VkNWHEhWcKGrx2Arr7cd5blb/PjUDBBH7Bd5Q27MLbDTe
	l2bwtMsP6KfBel9X9MhhlYx3zvacj3kI0A5/8UeZdeCBICCR/y+Vq7e8aRonjSR/8djhrQQm00T
	H00Jo6wT56cUs2LCFaBAwsPsMkccjwcT8y25+K8j4V/sENwnUMfrYQHWFIc+Q85dxTx9dboo4Y1
	7Pezv35yvv0quDBc4hDi7LsQoZ5qrQ9tlKvi/renT4ILHSQcFij6ywKiS+TlJTY9hI7zksYwsi/
	kCPLgHoOcWx4o235dnx8VWRo2jcV5
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr34855711a91.17.1788241368204;
        Mon, 31 Aug 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr34855637a91.17.1788241367755;
        Mon, 31 Aug 2026 22:42:47 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm52133553c88.4.2026.08.31.22.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:42:47 -0700 (PDT)
Message-ID: <8a4bc155-9578-4f9d-9258-022ca765a2ea@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:12:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: nord-negcc: Add the
 secondary QUSB2 PHY reset
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
 <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX0DBkhGJ0G1cD
 BJmDdl1kB+CFAh2sLD5ATRLkEWssvfMF5m7/1lNiu4dFFBhPlfekcWSUWPAMdWc7Z3hBJDJp0cO
 GIMwemOi2jQjOOjqLFxs14ljafAAK98=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a9665d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sx9h2hvFvrCHTrld4NkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _6ftdw_NjTWPdEx6NC0iAVvzKxGzzgPR
X-Proofpoint-ORIG-GUID: _6ftdw_NjTWPdEx6NC0iAVvzKxGzzgPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX6scnnkqVqnho
 V4Zqe6sl1s1/8soAGsDjwGimrDL730icbzYKS7Q8Ym68yodJTp+o+4a+ZCkcpSOtSr6EFK/Mbjc
 VQxXIppPsjo7ndykKuFYbF3Yr85ZBaKnJoEw4gjS3LTnAKTcURJP5BnLpHb1He2DB6TNXDDXagv
 8s2dyAwEjh1mkmhHV2vNrKE0Hx2Z8FyjZzvIP/e3eozJaEqBiKXT909dy/wXHpDo3FGdqa0TMeB
 K6b4wFJQrIdr0gN0aObrDZGvI/ssjNKhyQP6VXGJbOG58rp6KS38iIOZpLEKmD3Om96GtHLgf7B
 T1uXEjcIU2msuNRHsjE0JmLRbwADi+4Aoq3rbygTcHaXiQFgKrVMMw5kUrmVq5tejk1U6iboJHa
 bKLz0u/LvPiNJw5Y+x+o5L/QoXRyuDspVVJLLLB/48tSqVD1LU0royamUGsK8Jq5tQ0lj/veF6j
 pWul+4V0bqK/htQrcmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010048



On 9/1/2026 9:23 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> The NE_GCC block has two eUSB2 PHY block resets - PRIM and SEC - but
> right now only the primary is registered. Add the secondary, which is
> required by the usb_1 eUSB2 PHY.
> 
> Note that the SoC has three eUSB2 PHYs but only these two QUSB2PHY
> resets: the HS-only USB20 tile has no dedicated QUSB2PHY reset and
> is instead reset as a whole via NE_GCC_USB20_PRIM_BCR.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

