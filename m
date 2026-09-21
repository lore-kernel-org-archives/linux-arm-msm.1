Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE57493D44
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993007; cv=none; b=c+/IiW/K3SbK/nY/Xx5hUkY7vdDvulB8UCb9zWygXeYkxGqv/0PA6UCUG9zNjxdGMOzeTsbkeHmqGygF+4wLBTOfVhB7bb/SPdQFO0dDhDavdMkKMzkei7lM9BACTOjLi4WSn3b16HEiPJHsv/eaQ8RribmwCYd7FW6bPBkVeHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993007; c=relaxed/simple;
	bh=QM2U271Acf4FZQW/OKK11zrMNJwcmwAno4iDnq07zd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwQfotNP904nUFn9OfrA9cv9GyH2omnJ4qF/smqLatFFvQVjI0wdqXyQBjd2+KDujCQ8qHyBfdOMvQE8Q/62yMIrbnzHZFljAsUEMRdwEoQj2wEeenwSXmVVXRLEKnhM7dPHPeUHxQrzmWE39GWyo5p7MY60+xAuDQBlNsp44mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyfwA9Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnKRUpnN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyfwA9Tf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnKRUpnN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdiNk227709
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YnyPyFINax9wnSB9nSbsjE759I4nGw6hd3qklAH9+0=; b=KyfwA9Tfj5P9y8XS
	ML7glImoY61B+lTic2LQ+NBDDeuKBVAd3AIuNGEqaPD0HWcwTAoSvO4HSedAd2j2
	j8zpmfqdiUqnYjK5Lo+P+iBzNlxIj9/TYBNwJaaCpLHVQdv7cBExnWUhAfqpCrk1
	pMsVibM/i3Viiv+2HqiU9Vp3juuKzJ+w60HGPMwPSGiwZAaE7dV1P1Jdzp8ewuHe
	flSxESm6CbwZ4TIK+u6VEl+RWEay4WH90JQ09hd9jR8cVKt7h+49nLjDofmZr572
	ND+o0Av6p21+yQgvri/B3uKkdEIQ5Q4pAQeSVsMPCMkVL6PYJQAmPsQFak9R78Rw
	BPRB/Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gruuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:16:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9d5f0c3a7so24102e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993003; x=1790597803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YnyPyFINax9wnSB9nSbsjE759I4nGw6hd3qklAH9+0=;
        b=NnKRUpnNv7BQ+VDM29pl8t7A0Dmik8YCJg4g8c/FIb2X9zg4AWt15eE5admcwOLG+0
         67/zkcMuxDcoUVY3VRWM1UBpH9PUILUTAhHoFbZSNtClAgdVgPiLHTf66QGtVrddxfiZ
         M3h/+3hoWmdAQSbvInwLmNAWbDOtvJyxaN/YxkAn8ODEFWU5oUVIvpA5wCuBQDbfNZR1
         SiynNLCqXT4Y+5Y/cDCBNgDedO+d0I4x2Y+oFpG0/pWW/ak6lS9KW4FbWhSUDqzbWc6w
         3zqDkRtrFd60xCqeUMmy0sJ5H1jeXpmqLczrBoWHyWPLLmlVb87r/AswiJ+m0JzFfDS9
         r+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993003; x=1790597803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YnyPyFINax9wnSB9nSbsjE759I4nGw6hd3qklAH9+0=;
        b=yY6CwHG9wD+rawJXB3hoDf+zvxyOyBpIBt10pRD3Ev0usM6K/YtV7v48MxHr/DQl9k
         45iI2BhMwaO6eAzAfDo2hRWPQUXhr41BEYxlxngvPnoqNBgSxHCs54UFRfjCVV9YsFnA
         e69HH7wkawrA/HiCq47C6cvRZhtWJG7zOv60WXr0HUFqAp/UC4BbWItX2u64Fn1nSyEE
         nqb3AMyGdtxgW9TTbuMhFoTRTs+S4klyXcG2rCGqRCXGHOb5iHM+3vZsj7ghPE7RK/61
         ryVi4ka0JfyLWX45cdEUqbKyLMSG8Tjop4gk6XLi+FGNLo9q0MdaPawgvdxUiXuvtQ8z
         Htbw==
X-Forwarded-Encrypted: i=1; AKwUvBzlhvrThBDHgVRmVwe58GWhzTB01gwmt3sWqQ0KZaqOk5nSjYZkBDbAb9qoD5Yvi+SJOElJQPoaItj8f1eT@vger.kernel.org
X-Gm-Message-State: AFuF++lUN4PN3fbode9au8tv6HXbTv+nw6e2QsrRFms5B/A2YhJRRulm
	l87WfQ4rOE9Cio/ky7rLh87FlRx6fiA3BHmMux5A2yOlZgGadWemUH0POyvpXrM9nIlsqRnhtec
	Vb8DKk2SwRYMO1VtWQBz4fiWJAtEEtIQdaiO9JYtSyYT7mw9y+H3Zj1JdtrrN2ppqu+Vm
X-Gm-Gg: AYBFou3si7wD6DuGtEJyV9+nzYF3oyG43M1rAq0GppRzXpxjo24daQdLlxdthmfqg64
	mZwuKc81zohcMTah056n2xH1jRcwZphFYzRYvM/V3gabvxC+I8TPEt8kCLS5STl8cpmzCJO5dZy
	ROaMkz66Z+fjvn73LrqEI/tiywirCNxkKybJweuna+fKmsbqQKRR6psjfa5TQGSoDnJKvH7VCZq
	Z4BJfgRnShlrJGD18PtTOsXD2FScAF75Qa4jnaEXYATycO6oE2+qS6hAyqmv/U9AcMVawVAWQiL
	ibnRTn83gOtczoP/gaaNACedOckY53TEOvl1sIgQiNVjIDU2wbvna6g4G0xjocz+Io11KgPTM2Y
	K0YKjIqmRZO6M6FwImP+eCA==
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr3185203e0c.0.1789993003149;
        Mon, 21 Sep 2026 05:16:43 -0700 (PDT)
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr3185166e0c.0.1789993002756;
        Mon, 21 Sep 2026 05:16:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67c6f08fsm4064392a12.4.2026.09.21.05.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:16:42 -0700 (PDT)
Message-ID: <6d5dad55-0eb5-4a88-b679-ae3d39df1ea0@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:16:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: qcom-ipcc: Guard against NULL con_priv in
 send_data()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260916-b4-ipcc_send_data_null_check_upstream-v1-1-bfc61f5056a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_send_data_null_check_upstream-v1-1-bfc61f5056a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sTiH1p0Nu9i_pBVPQgopLH41I9GTErFl
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab1202c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L9zY5Dhm9UC1ejkej2IA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfX2r+QwE4T6qmi
 r1u9lueGQCQ/QDbO0nexqNa53NIRWWgKpFga3SUcRXQgtM9MjJHlJnfL8XahYGBnkHvdo8UxEF+
 s/UDU+tizW0fU7FfScD7lSUxdUZC+zBp6hSv7Qdi6xjjgK57vydaUt8/tyTCpyfbQ4p6/R6yc3C
 5/fP+JKXeCh5jIN+CWlZqqQa6oUc5JeBnflwkzIuVBLzLFwR7v9Ve/PQ1aqX8DbpYoMsZL5LNmI
 nZaVnqq1+Ktf9aTkFXq3Uk5HFJ3rQcRlnIfX7OhQo4aHxX/SvpU+JDulYIRVluq09KiHzFwOFH2
 itu9k97I3yViGsoHbKv2o+VYgXroA89At7PLvicjt/Hsr9p1QehJejxzq9szFS0MOLmwW1iPqFo
 p/XNVQSy73ekX9ykbdfqD9Vw9R6gCkoxZroz6HUneprwoDpUv50mgre/WppxgPKLdRzV9EjIh8h
 YDWw/uO2YSeMFq2Pg6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfX8lumFCfv/9HY
 uGMz0xdN7J37jlNnDARvlfZVQDjVDILjbwTDrxxrYdCFMBWD2gmtmimkk8BdyJ7gPP5a4vMSBmQ
 8kzJ4KYNXri0LEiUoPbVVHW4OxfgrCQ=
X-Proofpoint-ORIG-GUID: sTiH1p0Nu9i_pBVPQgopLH41I9GTErFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210177

On 9/16/26 11:56 AM, Anup Vishwakarma wrote:
> qcom_ipcc_mbox_shutdown() clears chan->con_priv with no locking.
> qcom_ipcc_mbox_send_data() dereferences the same field without
> checking for NULL first, so a send racing a concurrent shutdown can
> crash:
> 
>   mchan = chan->con_priv;
>   ...
>   hwirq = qcom_ipcc_get_hwirq(mchan->client_id, mchan->signal_id);
> 
> Add the same NULL guard mbox_send_message() already uses for
> chan->cl, and bail out before dereferencing a cleared con_priv.
> 
> To close the remaining race where send_data() reads con_priv a moment
> before a concurrent shutdown clears it, acquire the spinlock in
> qcom_ipcc_mbox_shutdown() using the modern guard(spinlock_irqsave)
> primitive before setting con_priv to NULL.
> 
> Fixes: d6fbfdbc1274 ("mailbox: qcom-ipcc: Fix IPCC mbox channel exhaustion")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
