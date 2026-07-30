Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2CB390998
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420153; cv=none; b=sZCUaBHkoG+bdrsiih8uCDgmuLzUdbr0HOkwSA8VIFiebmYkEwWQhh+FLjjvQWFArgMd6O3ceXfXmE+hbARNPJ9k05vO0ye10dkFUqmvqyfbJTgam0z5br3EqK5Ih0n9ED5SR4tDdX16Nf/z+SlmhCj455xW4tTLXc04KG9EtKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420153; c=relaxed/simple;
	bh=vT6xob6R8cMPRXsfXZNEX97W9kMkYGpJGpPklbXredI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXjmzzC5tWFn2vsV7V3Sexwz0GMax+hsZXZSD3PI6gJjgrH0dYIOb5MUTDUcQB4DftiL+cnmidzbIK0ApoOcvQJA1AZ7wfF+nSOAGqBQSocD/4GQsBye4QDi+nbVlyUW9kqLn+kumJaAgq4P54rzYiBv8HZuztCx7oCagirfABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3nZH63k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQnI882G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3nZH63k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQnI882G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE2TND1483378
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzEVooO9hFp8ZHVA1dLwQE+qoYrnPnjCgqp26u21Zqw=; b=j3nZH63kOzDZPoWx
	FQDTxFNfJm5VL1c+Z2Y7npadVf0WkT9qnhP9Iz8UDiHOcL9gzL34ivWHKb5dc/Wk
	2yccSEIq7AVVVvLaK3qJTElL//YEh6wjGGsvct4fZXqxJ9+p1MqhZcv7smR//7K/
	QX3viVgQWF/Gw52k90gFSQdPcaC/DueNoFmIXDMnL9dqkQ2BIEQ3wTXS9i+HcZFS
	1rqIqW0hJh9l4fl1YNUNhwN+7/oUQ672Q1JE4ZbQpF99ZvimXk6P9UHg37fCmkId
	YNBqOvohFGj9uq8V/MEgODpRuPFVhPdvithuAEJqrFrJyZyMZj7hZUP55khNpYZV
	dKUKQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr815802b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:02:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso3725501cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420149; x=1786024949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzEVooO9hFp8ZHVA1dLwQE+qoYrnPnjCgqp26u21Zqw=;
        b=OQnI882GBnzu/GKUellaIvxdJ6uyWP12WlbptWi5qBLPWk2PvuR0YYDfzZgcshdHZY
         zucbq0Q7jnr6oSbtu99cuxicmNzJbBINjUqxHOGrXdEO0b1h/PD9m14vHTeVM8oYYPDi
         4FRezx4fcd0Xc5sq4e5aDRKN7ELg7AaxS0lRoyoTC5R/s6sVaUTlh/Mml1HXny8J3EIy
         qRFJ9+PM5kjEWFUT594HuH+mHKypu6iYXdCm2pZtY5Ve75cFGs4kU8KW+gVt0/lQ75H7
         unrgsTOOGerB1ocMDiqEYUY+/m5A7jDHwVzMocZYO0iN1XbABIE/vsS99gPszE71+BaA
         CCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420149; x=1786024949;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzEVooO9hFp8ZHVA1dLwQE+qoYrnPnjCgqp26u21Zqw=;
        b=QRI9UCosdfo5nvL9k10S4t2dsIK1d84NDo4tjSqJdU56kMg6Wq3siqNforNpb0Ro/q
         QMR2jGILHAyRP3NHNe4846U6RZwOdVdicZfO4vAAtq4hchVpOtTjSKrIw2uJ6XCPoFGb
         NOj6pehpo6byHZR6BaWyOdaTyGvC4LK0nFOfsMA5tOhACc6Oomgfp49K4hbGYc5zIxfZ
         GrA4PsGfScVL4CLGOoUfxoM4RS+r7rQSCfpc0QfORNpDKPKxt9fKKHt6+MnwWxxkyeG6
         VMVF/jjYX7do5VwU2+OSJfM4mUKJN29D/6cxF3/mTJs/zBYm7bJUX/WGQh8CZYrfP4Os
         wuLA==
X-Gm-Message-State: AOJu0YwYr/4dY81VO3kUi112m+rPLAJ/nhPqu/LtdfFXvWiGycQrafXl
	d2DT+NBZqu5vG0pm4VJpnLJJAgx5f5UVC7sZ5snfLVvfpXziCJE9e2sJMA79p9A13XYW3Qbpf+w
	SeHkhdCcYbcCPQG0UNQzHKWLP/5BOQQmAS0RTx86RuXseRoScyIl4PPE7Ax52chPhhbS4
X-Gm-Gg: AR+sD12qIs8wEbW8f5QclkO/STla++3QpUbsb62FWPRMwqlZGp+ev2KI9dMh0Y5SaAU
	UX6gMHH3oobufrV97o5w0diVyzGwyHNlBxikl5p6nILa3AlIXoLpBwOUPNGq6hVC/bF8juT+H6H
	XlPlvy38AAsGZ9LjTJFXRJZjcJ6/gSTx+hSvZN2RN6pNuTvBTru+iqs0w3nViwo0puhtC9hNMuB
	aL3T6yMuNxd82R+Qfwb1of40JFNXZUmqfr8DHfPY9KgYvyuqNPzsGRZM70QWcYBnkJ6Id5kRiD5
	HflrrI+6YTBvHJbeSXkBALpbzKQzxf9Orwt0Yx0j0tiljh9qdyiM0sckM+xVlVXvbcz6ANzRvBH
	bAUg8Vdl7y4pTvrF3j3DK2QvV
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr4935331cf.2.1785420148766;
        Thu, 30 Jul 2026 07:02:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr4934121cf.2.1785420146312;
        Thu, 30 Jul 2026 07:02:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9efda8sm355483e87.76.2026.07.30.07.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:02:25 -0700 (PDT)
Message-ID: <de744784-7885-4320-85b9-db0ef148357d@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:02:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qcom_stats: Remove unused macro
 definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730-b4b4-removed-unused-macros-v1-0-2883fecb9e6e@oss.qualcomm.com>
 <20260730-b4b4-removed-unused-macros-v1-1-2883fecb9e6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-b4b4-removed-unused-macros-v1-1-2883fecb9e6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX9nB+ewrhCvEZ
 ATnmO6xTQwRClHamfaZAob536+iKjwzSXulFZwmpe5v0X8lS80qjP3RZQBf8Hj755wEYvJ32cGq
 nVz1DlrLfNxuUeJNQSTdLB1GFpoYaYT+yNwWOoy2YJk2tPe5EHCPKIv6t2yNZOiJtCouH3md0s1
 Wx9eY+mXHFbuIjC3AnnNM6bTNKfldyzHbzAf9pGTsm5w1Gs//YcFqvf0KZh3B8Ah5BAa677YCKU
 BnpaiQJTUNJuX7LRcB5P73YJbYOVAn7neRxbSH2QozZeoC3BZCgt6W9liJGaFdFsl6rZjK/7Z4p
 yr6KYwBkEF3B1PbeVtmEnCDVABsyWKapROTj9vwz3VQVxq2OtJyVJinCFWPAnAgdRe08RXiVJym
 j7TqrfyCr9ztH5q7ElxdrILzdJWrWz56Xsc3l6y4l91Z56uEz+DU39uUhpSk6pjeygb72Xo5/xH
 2TYlh8z5RQEBWvnih+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX9tKEnrUybhYi
 9lsYuux8Q1JX8LlxsiGdWXoPRmtow42iihTcRtowtb2HhOSOC4RH9e1DoHzobs6nG9+pDcAeHn2
 +Zo/jo9ZmjSgi9DNa+jNdraDS4rRB7w=
X-Proofpoint-GUID: uWvzaQrY-Euaq8rYg9au-CXZcYZ8SFxT
X-Authority-Analysis: v=2.4 cv=GN441ONK c=1 sm=1 tr=0 ts=6a6b5975 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ILO0eQ8q7CO-LEHb520A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uWvzaQrY-Euaq8rYg9au-CXZcYZ8SFxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300107

On 7/30/26 10:46 AM, Maulik Shah wrote:
> Remove macros that are defined but never used, as identified by
> -Wunused-macros:
> 
> STAT_TYPE_OFFSET, COUNT_OFFSET, LAST_ENTERED_AT_OFFSET,
> LAST_EXITED_AT_OFFSET, ACCUMULATED_OFFSET
> 
> No functional impact.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
