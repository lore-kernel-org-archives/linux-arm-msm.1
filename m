Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7373CF962
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632439; cv=none; b=Xpik8VJW3/rpKTvs8SjW/AGu28qu71EPR9kfSSwyMSPdtHYMbMAvW4UwK70xLcgtOswdPy8uF0HH4MO6DLpstZKKjEHGC/PJjpjHssA5jOcaE8eN5wgRzBV1vCDqybCLBvX3gubxAOLjrwQglB4ajvDLWJlDjbe+PppkVqYWddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632439; c=relaxed/simple;
	bh=acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1vYIY6fVtlmfIcN81GhCqmbIj//f9cxGPCO63Gt2GSyf2yoK1aHJahCyBhn71P6jUbu6Te37QXt10mE9/b5iuUf7doNzkJOaIaNTkQ15uvNwmkfyE5BAAonleaJTG45eJmfuxhgNVAsnjEPZOS2NX804KQ8XM1fHA5QShEWh2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+bP2huD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ztu5siX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+bP2huD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ztu5siX2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60NkD3702435
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=; b=Q+bP2huDlwYG80P0
	LAeQbVXRBKo3CYwj0/eUqNUp0vUxY1Jn8s+SX7KSOtlWO6BGiwj1JnN+51fOebXw
	4dcwczrWKibMQK41aZxOGDDwspwaGw2zv2kSrAIeDmYlFQ6258U65hSdr3kAjuoR
	xo6s9VnaGj2oerKU1ChkO5bxaPj89TdZEYGvHvXifDccnWNbEOicLEtgo6aoa7IL
	U6eDjNjuiiy8K6/hh74ZqvlMbelGmHOcC1bqDQn7b+aJaRfRmhGSdH95RCQnoNGK
	K04WRSGC02euO39QMo3H2cd4eshgyQPAUbHkN7bkDkjaNy9bvns/aROkiwgvYMMz
	/zSVhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc942x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:07:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530a0a18108so1458581cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632435; x=1790237235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=;
        b=Ztu5siX2OXaWS0XMjUoNr0832AMwF8MAm7B9J2WWQFa6EZNaqRo3wBon6NI8a+syZM
         Tcrk9gLL38Fi3pkMS4P58j2vBArgmM0bRLN2F9MZXakIPMtdRoag0Qd9rItk6suJZdHm
         TUuxD5wtJ9FXFiF8lpsHhV2P6iO1GHQ9Z64OPVhdPKOSgD+zwej9KBpSxwWx1isJX1Wg
         XVp9rl1fXuSrqvizPqMxuWUxGy4yPU2DKit1PCqRCBd8ghz9hIss+SJPJCnxnKpQKvZ7
         lQUDrt1UDulI2i7O+ojKwDZsw3LA/ffzMWrnmBi3WHHsEpeaxsgYmllyUpHlyraYq6Nk
         gWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632435; x=1790237235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=;
        b=L72XrXCcer/MvhNf5wPEGN3R6jXlN6CRygVoVFG81UmTfWWDsfQ+1aqY9cpKYNacz8
         4yLppWbP29CRoOxc9iVFMxeShZc38ZKREw2fhJTnUDB160BZpbOz3VV9nBeWH4TPAtFt
         6pWqDGhYzr9+mMRtGNwf2cq9gw+b1zQ3bepwoJZAipnXytbKaqsVntpNKKy5Ro0629+l
         EI8S2YFC7EBnX7SlOrUaK8ba/mYr8hrnMeLVCBmEIFvfLOIN1EAKHGWVhB5z3aBXoPb/
         DM4qBBGLt94tORoPNd2Xx0OlIMalNzzFWyy5G72zPkrMQqclTUaYT9ccINBsVy1geCB/
         74hA==
X-Forwarded-Encrypted: i=1; AKwUvBwic+MOCrJyP2KvOPiBAA2ZGc2UAls63eTxfB0n4VPoYk+jfrMtBTrH4gyGDXVC34IZMnpM/CUK5N9k4C8R@vger.kernel.org
X-Gm-Message-State: AFuF++mJl6yXf+P7cJMTSv0d+MtXwedJh5kH+NFIl+MDhg9m4S3alWPG
	WabDa7gK/PmmjoP0zT8a1lgqh10Tl/jN4cyupQ8ZaqG8nlejkyz1OkkSjx0htmQsGRNsvFS6NlE
	CAcXyl17+7J3F4xlw7VMashRct39lcgr3dECMG6vfkwOe1iugxKUAZ4jnttTzc/bpnnl9
X-Gm-Gg: AYBFou0eR8RLEI/YBvzvC49Tjh3fXulubvHSRRtObMMsWKsa4TeIVSdd5pjdeizXqUJ
	zILTQ2GSa+sEdEom3MTQvB5vZEANN7xy0bYmk2ZuSo28kLOKaJwVF33GAOYkJh4B4KbTwqySJPh
	XNPpOYP5QHskhQEP/QhzEwg47NXdEM32Umif8g/hwn4VMGzruJIFyLchOuREN/TOa9ZtlvPwhVh
	6WXl2Z6lbQm+OzOhktksjX1bsbO9EP1UCGWulp7tdkEGcxtuezf7ICVS7Nu7Da4WyLKjZJQMt9h
	6854RAvTGjyKBhidZToOR/6CXMt1d8vVKORRd/gFjtNmr6fSeUt5KRa72jNuk6bXW8E82i4CVU3
	H4O4NdyWApW2rvsYm/LkB6A==
X-Received: by 2002:ad4:5c4d:0:b0:912:16fd:b389 with SMTP id 6a1803df08f44-9123d9040b9mr86997286d6.5.1789632435448;
        Thu, 17 Sep 2026 01:07:15 -0700 (PDT)
X-Received: by 2002:ad4:5c4d:0:b0:912:16fd:b389 with SMTP id 6a1803df08f44-9123d9040b9mr86996956d6.5.1789632434927;
        Thu, 17 Sep 2026 01:07:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5baa11sm256987766b.40.2026.09.17.01.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:07:14 -0700 (PDT)
Message-ID: <93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
 <20260915093910.2487018-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915093910.2487018-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfX2DTUWNmtgDdh
 kvGVTbp+qNIalZuNey0Ia/o+XXyyKBZm38NXdT4r3YaLfMSMcYzs56MAqiLTEqndHe/4ypBktd+
 1488JINQZgtQUpVMc3KSbxHlW1lo/5ICX1JyW6owNUwPQ3Fjpp+m02EqWlhz9PDK+gQGhFCzArZ
 cM+fxXN9u0nAoAuE6xfuYYLBR87fNaPOiAMqZC/6vaIt3FyrjQfq/PGgNXqJeFulUyW92Bq9UJW
 1lrLNVNsERMDXNUr4W7n35mVJQINWBJlzdJRQ1e2aw4QmlB7XUSkiEpMKxmsAdLbRRGW/p9cgwu
 eqnEPs3zTB33ZwkyP6XTU2Kg6SU5JcolJou9auuVfT2xZlWbTVALovDgKyoRpd432G8EFwD3oss
 anri6nu3UlXyxqCRs3W+Bme/QSd1afInz2XyKhzPQcs9madiCaJZ432IsQfqD5zfbUuCKKSagKS
 kxZiAfa53sHHh32f+gg==
X-Proofpoint-GUID: 2weUpYyTlF3-v46J3RBb4wbj38NI3bwj
X-Proofpoint-ORIG-GUID: 2weUpYyTlF3-v46J3RBb4wbj38NI3bwj
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aab9fb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YRFV8ZECy-bxCY8ifYEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfX8tzv6+ARvMAg
 zij9wPfXciWpmOmOXy9Poahg0beJOKyZrjoDnDCWbqOaXxalHzK0qCmay4cw3i+dlogBWVpB9Lw
 /EoeFFFi4ECVx53QACQzuI8EL4aJO34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170109

On 9/15/26 11:39 AM, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit wide, but the interrupt handler
> currently reads only 32 bits with readl() at 0x4 offset (upper 32
> bits). This does not return the correct value expected by PDP log
> driver. Reading the register with readq() at the base address
> returns the correct value expected.

This is a valid reason, but that driver doesn't exist upstream..

If you believe it'd be beneficial, please upstream it. For now,
please focus the reasoning on the actual data being lost, not on
some out-of-tree driver having issues with that

Konrad
