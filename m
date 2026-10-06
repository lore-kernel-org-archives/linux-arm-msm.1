Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B43750BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278877; cv=none; b=QddUnhj2BaxoyVNl7g3udKR24y6OAX+ABjCbjef9d65w+pMZvevFdOjgj11Ozc6AdMaVKlnmt0DwlZRG9mcrTE3/sjw3S/NxP8k/Ji59voqVM1MZUC6uxWk8JvCzh72V2TV7V4Z5ZL5wZnC3Go9+UrADjQox2tDY7VSuXk1+Pk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278877; c=relaxed/simple;
	bh=jQKZXbdyyBJka8+xVCZ2UeYpQeJaBJHonIk7U4rIEek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7QKfW4+YywNf+40KVZ7BqB+To9xq9K8BlagTmYrhnMrORklagTqOUuymm9T/7U2G+7ljmAGTQID1mJtawlT4UnQ2ImcnPXYSk4ZOc4bJsTlApm8p4smaCWFTrgTMl8rF2nFwCXQp+BpIcPFWP9Akyr3AcLJZcSoZ2Ag36joBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2c6v7Yc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZ0OrH3O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2c6v7Yc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZ0OrH3O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eIEC548471
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MfDikcI6+/R6VrhQqwRyMt9e
	6q5NL/th/h+Lhoth4QA=; b=N2c6v7Yc+ccvgUFvY0tBKg8HDcyayqogr0b9LNyy
	qMsLYXrQBRTjhUUae7dHFQEHRhY28TIL15lVMTHIG2ESL7QbhezlZu4N57Ngl+VJ
	K8RIiJYTDQnsBXP+N+QBHHDCE8klbOWSB8AH1zaiefOQnRuIvVWSOLdDgeI2jJQl
	vidEhtIIAPNP9y+PLz827tD9kxlwwzhaXK/ORp024XYmg/cNt/JqfkuR1j1NpF9k
	PraA6t6Cj8wdo8ZsrQiH6ZLgSrv2jAilrVgjlqvHuzchtLpmZ/CMGrtsA+CoSy+S
	PYPdjqJd56UDPgSWnC12gWeRgdsoHq3sA+ZYYGVSh+dq/w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvvktm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:27:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14fed306427so10322123c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278873; x=1791883673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfDikcI6+/R6VrhQqwRyMt9e6q5NL/th/h+Lhoth4QA=;
        b=AZ0OrH3ODcHa92PEvR6pk+DQCsPiECh1HcAX4fquu1gUPXo1LkMA1DZ/4tzyDdVcyX
         JYRKE5Ky82aLzuTJPwL03ZoGIHcFaIqpAeclRmqW0uGn9U2lNbum+gLIQtjbBE2C8Gwq
         UXUAdnvxLMv7Xk/VRtsZMPruN8d4SJ3ABOC6Xy4uQxHGXe6/zv9oDIiXzMGmpjDssVnx
         4Ee9gtQPQ4voz8h1MaJeQxL7oig4tS7h5bsSnJClMaU84mycXatWHt7fFZiNBw7sDTaJ
         hCxpG4jrCjpKTcCrQbRhB1z45GlcGhyfoNC93smcCwrtrrMdVYDGIbdav7DSet/0Mey3
         VaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278873; x=1791883673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfDikcI6+/R6VrhQqwRyMt9e6q5NL/th/h+Lhoth4QA=;
        b=BC0jYz4YlRMP6W+g3E155Cyhv8LRTVQCRR+WYwsNqGF+mKMyf6ywK6TdoarNyM2q1i
         PJenSSVlzqG7xpjoNZMPM5z5H1T+JiDgD4MlFiJD5eYfcNl3YhyCIvQX/RaBRuiRkDDv
         iCqo1fhCRMXZWr7QmljJKi9mSDXSq/hyilWUWS1b8zV+WTMYOkcWCoLOlkh8VMuU++jQ
         /AYpuINb6I7xSLScTag+wJxDS5+a09FXD98X1gRtwUKC1o37Nd71by8YjfLqQ2Qte0lX
         wiX+hmVLuHi+e9gwbpp8ITwcV8kh+EQpIuJDAQRjp5BroOuPZOmisvhRGHsy9xGXEHr/
         PhxQ==
X-Forwarded-Encrypted: i=1; AKwUvBylZNsTWIpx9oCAlBRg0DXmc3E9d0sIH5gBrlVykJLaOT5jQ4/qwzfTsSp70zU+/mzzRkLPzLV4bWXORRC/@vger.kernel.org
X-Gm-Message-State: AFuF++mI5bunTwzyQVm6PrlEEsPeuFIDiKCHu305Zv/VI7+kQrBQ5JYM
	852CF96Astus5RxY0aUsn7cx8UKdsDp3VyhACv1GePC+rs4V90JxgFiAxbMWIeqCQZaadwZxoWj
	iUMdjzCL7sn1CUeXK16cZlOye/T+nKXY+tO4hC56pB4z3C5W3k/ZljAHA/sWrcxBztcEr
X-Gm-Gg: AYBFou3L/tpcbhrOHRLa53nh2Edw5Ap2z8F324fPRPv3ayNWPIcBeHWb5IbMNNRx7M2
	SaoUpGTSYacwEn67rcRoFoHJXhP15+SQUpW0gRkd6wWOli3OZ6U2Nq5WIHHaldzdJUP7pBZ9J0o
	UhQ211sL/eEive/3gow8ohVpr3dcdKM6B5MCDkArSIVEf6+uB6KOwn5RyFec3OFVlKdLJkCVMVe
	tK3oBlS0KxSVp1cV8vJBI1CA771WH0xM/Qa8dt+w4NcAUdc066NIaki/CrjT1gZmK/Iir6kVNHF
	hk4xUIc4jHBwZru92lYrkFg9042XtVledMC2pj1f8s6PS2hJSgV3QNMwOHhe00QokPnmF4o9MVV
	n800SI6BAkMD6RAeriZasvJuEvPP/4Kg+ig==
X-Received: by 2002:a05:701b:4542:10b0:151:9af3:1beb with SMTP id a92af1059eb24-151c32dd7b5mr13122305c88.10.1791278873033;
        Tue, 06 Oct 2026 02:27:53 -0700 (PDT)
X-Received: by 2002:a05:701b:4542:10b0:151:9af3:1beb with SMTP id a92af1059eb24-151c32dd7b5mr13122263c88.10.1791278872444;
        Tue, 06 Oct 2026 02:27:52 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm11381497c88.4.2026.10.06.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:27:51 -0700 (PDT)
Date: Tue, 6 Oct 2026 14:57:45 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Venkatakrishnaiah Pari <quic_vpari@quicinc.com>,
        Jian Shu <quic_jianshu@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Subject: Re: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
Message-ID: <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com>
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4bf1a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=COk6AnOGAAAA:8 a=20KFwNOVAAAA:8 a=P8ZCbf3PEJK3Dg8LGH0A:9
 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=fsdK_YakeE02zTmptMdW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tIX_q5yyNBeEUKh-SoCCB3VZa7Y_4n6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX5mbPDpRDIlMa
 YNBEM5Llr4xUzy1I9LkNlYh6PF1iIkbuvochvol8ksjt50iZesHzItJHf0emA80rYOXXfMEfTFH
 QocRJRhTucxSQu6VnQnYdHu6fD9+7Z0KFqD20Hlx9s6bmOw4sdWYpkJ179n38PrH4lTDFw4B+SY
 F2fphk1hXZdJe1V1XJ3QdqjfIGawso0uOZpCK/kNlX0osSCFCBD/dv9CNMbtktxB+/NZyTzw4I1
 ghXL62Fqsv4kXUOks02shi0vV0kP0mDnza/vIPM4p3o6hevVBKMgYVaz3p3cj4y2vH6YF4UAJ73
 Xvr5uxuz5vk7CZ42DlM3WYFOOfG6YDdILAZA3Ph+c4HVSWh2zRc2iwmJwWEXGX6rUCI6Y27APN9
 W2Jl3wQNc5NHMYTBmgLOdi9a32CB0Ki+C59JV5Pr5KT3tgmobEpqb9pzJ2ACUhNV7F8WDQPxyFy
 szo6Glgu2IQEwS054UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX5a0ER/qOb2+F
 sYWofUiEBCHMDkFJlCxNjeVvHcSysCxtCn8yK651U5OCXj4l30UUn56S8mAzh0RouYllwjtn+PF
 nlrx9SVvo9wU9en3FeUr+y+UtSZlDRo=
X-Proofpoint-ORIG-GUID: tIX_q5yyNBeEUKh-SoCCB3VZa7Y_4n6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037

On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> From: Ninad Naik <quic_ninanaik@quicinc.com>
> 
> qcom_scm holds its global mutex across WAITQ_SLEEP and
> wait_for_completion(). Firmware waitqs allow multiple SMCs in
> flight (wq_cnt). If one call is parked on a waitq while holding
> the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> and both stall on the waitq.
> 
> Replace the global mutex with a counting semaphore sized from wq_cnt,
> with at least 1 wait queue.
> 
> Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq contexts")
> Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
>  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
>  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
>  drivers/firmware/qcom/qcom_scm.h        | 3 +++
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
I don't know all the history, but in downstream [1] selective calls only
allowed to sleep w/o mutex.

Mukesh, do you know if it is safe to allow all slow calls w/o mutex?

Thanks,
Pavan

[1] https://git.codelinaro.org/clo/la/kernel/qcom/-/blob/KERNEL.PLATFORM.5.0.r35-02100-kernel.0/drivers/firmware/qcom/qcom_scm.c?ref_type=tags#L3057

