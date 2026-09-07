Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D704E2372
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786078; cv=none; b=CkO7UrB/FDFTOYSNo6aTtAH/TLX5FTfT4+YEWHzrVu9kKztyDTSQMvADBL3LcFBVc1y2ijGi2wkczangk3HtrWOZ4f0GcPnnab0XeTExdybHJhyMAZGdngcfBxKKeL0JAQ1ldjxANv7E2T0Ft0hgYlTdHHC88Wa6Jjuov76rDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786078; c=relaxed/simple;
	bh=yzcBe8CWx8CuKM6PhuNC+5srTyX+HIdMDmFUULGmUx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GB7fHeN5QtYfjgDk8TTy00BLdIl2zJdWg2MT63SxPT5ClToxt0ArsoVgWEOv9cUQ8eiJb1YFGxKR/4DtkuGQA+xTs45zIE9CEH0qJttVpuW+4zIRo9y9t4jSSZbvIipD6dS/kltryJIFPcI8U9rm0Izcx6QXO6opF981y9lE07Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYNkjYRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/Isk4cM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYNkjYRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/Isk4cM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmvDq3349040
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=; b=LYNkjYRbHTev5ej0
	8iVNfShq93wGtCm+CPnKZ1T8naeU6UCiM8db30+Du8vbocb6VR05AI44IZ/GtHHH
	YiK63bcbMI0MHAuyFXqiFcOyK2ap147FvNB64sGi2aFTHcSylc1HpfQBT9Wm6wRS
	RgtEdiy80Jck9TB4+QbCkJcv9B/r2Cno7ArZniWE4JK4CWOB0kDBO9ieKhMWN7A6
	CiHjHTttfUZdEpCDd6nYFrtIvE8Hka5212z8H6Q/hI/A8lLr1Cw63iMvWLnFc73W
	zxJMOxzke5SpMrxzMxxJ1skbunf0Hghxp4835v+lidPHYIZKtRyjmTAeUDIB5j2b
	womCWg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0uuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:01:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c4292d5aso690718a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786068; x=1789390868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=e/Isk4cMVgiZFVXwpulJmrHaEMppyu8O8IL+Qjx8gHoSWIbjnuY+JRs1XYjAi8Oed1
         wtFMneCbzVCamCF+TGhAxVpsT6QtRTnfGKZzlk1CJflHJeJ7N5ZyiUQGKIjkslc5/7mQ
         qyQo36MovMcl1qXX5xzj5q/XGDk0/G1epiYi4sLxFua9Mv8eXoUViNlTmcRKpzKLlEBU
         RbNMMSrrJSH8Qry6ECFDJLu29MA0+jYsaZAeiyUsf6HoYC6q0cuh2LbX4h7jYSIZh6tI
         F2MnuIGGzEthkRoeDmTZyc98LzPf5UV+UEtXe1Y6f0TlCJfdehP/sow6IEhQUjppKQsQ
         tMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786068; x=1789390868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=jbB5u2Ym2r6Emg1Add72+xLhU/nUY7AKUe6mb8y6D8ZmASj1Z8cpMU1r/7htb3yzcl
         pkY4Cm0k4CD77/Glkuki0cFWGqpZdUhRXwxyZnGYUFjhOq7RldO48n6w4UVi0pPHqeII
         E8z0y7FlCTkD1RF80C6rlFWpTzuXZHr8pDIVnHZAjAuTEPbARn4aOUyESCg9fGS3YNPC
         Pgu23/Jzaacu3YePfM+3sLHOCGunY422JXvozCwylUpnIve3bXjMdSrl6Ku8e3tFO/JK
         hxDIZ0cHoM+edHh66VzLX0i8oQLU8cp5EhNa9F3RKesTlkNqo/c/4FC2Zc+rrOj9Zfev
         XbOQ==
X-Gm-Message-State: AFuF++m5jiV6Xnf0DjzUKW2VUY1++QhuP5jqi33ukjVwjfu9Z4OG6AUf
	hIPuW58lPqki4Y7j3N74oZIzvjeZOwNSY9txw2Gi9QLhGupsb9IrFvGdh8JJnMfgQXZWmwD1cKc
	0ft1/lbSeu2zwEG0V78X7auksbZwRzSn7hSVAslyxHGr2hk+zGheTPyBG5u67Vs2oi9Yhul/h6L
	qt
X-Gm-Gg: AYBFou0uWXUVbC+8TNzX5XU2vwuDtlt0WykAI/0eshmgCeQ2jodPj2hOeesj9Lg/yAw
	OiMC5THx4eyiWEvGFzqhjPNbPbM8/KzXm0T6YeLP3wtg3pWLc3A1scNrPP1k8pYgNF1/tlt4Q41
	nP0P23w+pOc9yGr8r1H1cBD2nHgSltMG2CS0Z3DfpbEdwNp/QG1tcs6o0Ne1L86PnNCYxYO94Ul
	5JT4wJOmLx4/HzZPI6Kv943GjwJRDjn2uFeXowuCLia4iNBCs5iOJMtJjd3M8T2bVGc+bF77L4z
	IwY/EtOUaxYvDxLY7BSY+AktmByNLa6ANHuVsgL6yhtPRQqAnBl6N8pGKfwozn740eqHI0pl32t
	+677gpuWALJMibUCf9UE48w==
X-Received: by 2002:a05:6a20:43a9:b0:3d8:8a58:f259 with SMTP id adf61e73a8af0-3da575e24b0mr15598387637.1.1788786067928;
        Mon, 07 Sep 2026 06:01:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr1133602985a.0.1788786048213;
        Mon, 07 Sep 2026 06:00:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036652sm477639966b.2.2026.09.07.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
Message-ID: <4740e69f-23b7-4b3e-8d75-d7127dd6b140@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: ipq8074: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eb594 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BCToOkYIF-vvb__y--MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 346ykcVgOluKSNvN4DH6Pr2ByzviiVcb
X-Proofpoint-ORIG-GUID: 346ykcVgOluKSNvN4DH6Pr2ByzviiVcb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3a/kphqHB4sd
 osiJ1UYr4tI0awoxf2n6/ax4w4W78TYZiIJ7bRDafe122bxc87CFH6y4GfJCX9T+nlLJcL7dOF6
 TXwIT5IFwV7lbfQOJDhhKDK7NVPnbIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX29+yEjyFwitT
 YDTt/Q//yelx8EVoPqASAmew7QqoywuvsFyaW0q+IfZd/doDQ0+BLboAugUPZYOLiGjhWuKE1uK
 h7lmcbgyYFVicSo2whcUpWr4Xts3/pxitA4srDFGc2GPfFZB7yWRNUm0gEymDQ/T3wg3lw69rba
 w24mGANhuXhU2qq//5h4QTCnPpJlkrzM+vTUJ9EzQVqUIlSvyHW+TB5We+AMHseJDb+CNT0/Ol1
 4ygD9JMx4FAX37mWbXSRtCeW0We3mgp+n32dHaPDB0gVwAsULTETOLEMfmuReM39OKL41JJL8iX
 1IlKP2aP98nWfIVNlQPMBJysWGUftoItukpkfsSPoL8sc6kEaK4G29lxExnU7c/txtZnq+mQDdL
 attk5V4jEVBIgOSednx24V7TVZ8GYd883WINClW3t0D3+YS6cACn5uQ1hu3HHlND4M4ZDhfd5Tm
 vtICUL9Eah8CSPIfueQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, fix indentation of properties in both nodes.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
