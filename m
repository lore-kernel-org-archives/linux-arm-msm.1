Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9435E950
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429427; cv=none; b=uOSEz6ajATVPyWyDcPzwNuSBTJBqxW6w8/7sg+vRD2kl704geXSE9RXuKyJVIscQUhvp43RyGilBUHv6b1jvxlVzGRhJBHtFdbvf3Fm/P9usu6edausYoaQoF4Q/sEcXqkxYGYaMBB2KgKKf650TmD+02uoPAMdG1f9r7ADeN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429427; c=relaxed/simple;
	bh=Y3olCbyLOhHlhjCxssiMWBgjXhC8o6LHsdBxdQBrldM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alYY+6KIIar7+X3molVl1kzvHXsExBfaHYlGQO7Y+TKFlW/3CYoPOLsuZMpvWiRJQjGRqYBtrTUWBhX3evO+ryCNndwrXGTlLSeNVBgVm0ttpVwfmPQcIMLL58QrbzbJ++GiYfGAXaZxGO7SLcfo4YjiUd23plRLu5RDHbw3Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1qT1mQR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fs5tKWsT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1qT1mQR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fs5tKWsT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWorW1643391
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPnqQZ66kzg9dc1O9uImVVP8fJW0kM4WevNUHT3C+5s=; b=N1qT1mQRNFOUiCqe
	fU5Id2GFAwGIx/Y9tS7NuFP/RyyCpUhb120ITJ3JhKaxC1F4TD+gRG38j+bpadWb
	ASJXA6ZEyCq1u3DaQWBRHvDHugooNjCvaIGssh3d8H6MFJQfH/sVfquhJELwPVRG
	p8zzVaTqJqmSxMqn2KyPKRx8Ezak27tHFLwzc7Q2Qr0r5KIShkDh7FmY9HGMpmgl
	zrwccJZqYNqNWnJ7q/Bo2UXn6KTdHlC3FS4lAfsZY1oBcKFjw0zO565ZmcqN5rKL
	QevSZ3F7N693mSjo40TjfuDyZt47kF1qtI2G+scTQj3D0HFXsLK+ZvDtQtbG887g
	xZTAYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md0mqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:37:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso3334241cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429424; x=1786034224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPnqQZ66kzg9dc1O9uImVVP8fJW0kM4WevNUHT3C+5s=;
        b=fs5tKWsTzoiUQHf+kK5pBe2Pnzeq/kj2QjOjJohODvScrPXwU/Du0jqvXATE+Y7hzh
         /KiJ2PrjRCrPa+SAgnBuvZbcjjDNL9VL84rttHz2cHJAfAQYTt4XtqRsd3IMbrWxRoVy
         yPA87b5WrRgdyJ7zZNIDVdh27CjbZjkVTBUxG624gBRD4RForOZqC3eXUPkP/X429emi
         IXRASw9NfAidkO3LsXBzBTt4itfIOQpkFsZaJTU1rVE6YmsDhqfbefuVoSAKcXgRQKk/
         f4sEL11tgWdQmMBjxy5UUkC8z06+/KrJCiN0WSWx0l75oN5Fs243+VNl042IlHFRuNjo
         mHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429424; x=1786034224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPnqQZ66kzg9dc1O9uImVVP8fJW0kM4WevNUHT3C+5s=;
        b=B+TPCZtiPcg6/Khk3dppT4XPIdjbL1euV8xwqW5zZ0eIma414FZuU5W4PdhW6+Nz+b
         n8vI97xXRZMyMyGfdlLU5W+xgJPA4yoN4ie8MBlEgrilGKizz+F+WCIixjivibgodKLZ
         gFA4nA3toSJiKe7RK+2GmnjIPM1XtAndJKMxhyNZll4mdDZLwguVensILZQQwlPPLP8y
         t9dQM97Yjq+i5Cveyh4HJHxNzM2XFPfkqf5w49CyyAzhRQB5TOh8XqaejJ7vWC93McCN
         by3qMEdOkKrR1aDvI2MABvolFwyjlO98yVSZRioMozaKDIkcjxV0/glgekDyuXsL32G8
         RTAg==
X-Forwarded-Encrypted: i=1; AHgh+RqApAOvxfxqXyNO9C/aB3yqTCXQ1WiljR1BILNtSiMm/2DlCNKzATf6qCAuI8xVKgiqlAEnkiRDzkI1tUMW@vger.kernel.org
X-Gm-Message-State: AOJu0YyILaoMjwt9L7McvhyepeeBwbLfGQtWwiO4IMliKUUHuWpFjz/b
	A7hJ9IwwxwPNfzYkH5u9UzhVcdRmTlfyuq0kEBNlPv9pl5q+V6bvscFPUrP7Cdz4GgsXsKn5e/p
	ak5PP2cJoMasaHAHAw8CuFxWcQQ1Ya3oLK9El/HXh1vyIshrmyiZakcLDxRVvNj5gSmFZ+180F4
	zr
X-Gm-Gg: AR+sD12AWgs8Z5KJLJZdLRMwi0wXCUtXc3KG5mpPzRRR0drOQn3EgroL0VhQLqeAhEt
	WSUteVZFt/IBJlxNKZo19UNLq1VTzioT2CCAKxnrBVikXYIcAdsgirtPu5KLHstkiuKtCj4Xlnl
	PORH7zD7l8yEPcV4vLtHVo4MHOSyo16w6XMCcQlxV6XUMONAdeFCIc+aI7E7mb/8Hhe0L21JqtM
	yCXqcAjgaCz293WpVW1pp9bPoJd+jOcd7sax/e/WL7245dH/qStb90RB6LiKNYy5qhw5qu4WCcg
	5Lkvi9iOeS80Q+DVvypdmk2GCUQqIm/oEgHXSgpIc0cdhjzoPfCw4l7jD9vHwvU33/hvvbl8DIh
	EadtURegFikAyg+YcgvHunpNL
X-Received: by 2002:a05:622a:98f:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b42cbf073mr14036181cf.3.1785429424223;
        Thu, 30 Jul 2026 09:37:04 -0700 (PDT)
X-Received: by 2002:a05:622a:98f:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b42cbf073mr14035611cf.3.1785429423794;
        Thu, 30 Jul 2026 09:37:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851d4a8sm92441266b.5.2026.07.30.09.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:37:02 -0700 (PDT)
Message-ID: <1f327a04-d549-4cc6-8beb-73fafecc0e03@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: iris: guard against a NULL hfi_sys_ops in the
 interrupt handler
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
 <20260730-iris-fixes-v1-3-413d6cfaa8ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-3-413d6cfaa8ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b7db0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jVoYpzX3SzGjTSnWZ1sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: MK49EmJwmHJYwleoxjuMBGtmcBl1rrG2
X-Proofpoint-GUID: MK49EmJwmHJYwleoxjuMBGtmcBl1rrG2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX7PWkjRNJhGOM
 2p5CeFxF0F9Q5/NkXSG4S+fBAagmEckZjaeQgqdiLQKkXXiC0k1UeBxpjLHxUIXLtF14/hWVmWR
 Ggfgep7sE6h7uARf8/HIAHBzMxnyaGE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX4riNHWh4JupZ
 FD4sXgc9S/CHrScGUsZEfnT9DBb/6CwxApjW/p5Vnc36/pCnYEXnbIEgl7tuPpheqLlOfENlNkC
 rfS7vttTdZRMhLg5hM9fKxAVkxzD1Q1OVln/0yy23929ZpwDXYGQmjMHyir0+ed/oyHCQqhAhXR
 5/g7Hoci+P+oYQSfAZQU/tGGDRh8Etl7LMwcMB7e8z7h81j+tjgCrbtVf2nTmGsQ7Uky2KFH9Km
 1k98x4FdD9m5by9m0XMvmGKfb5yKRq5h3LcuCnZXpgb0yV06DaEICw8Tx6MbUFsfZuTgtb6t2jk
 Cy2qHh0fHv6Nmnd7F0Ea2AKPX0uto7XMy+FHzF9HDV7TXcBnZl4AfM+MTyERb/reNsxK1KHBF6a
 9RaDX4ZJ0EsdVWwwlkpT4qyx7PjsA2cT3u5sJgTp/bsftsG6CwzmMxTad63qeJQYKm92W66d2WT
 iAVMliMWng/kqQ1Emag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300125

On 7/30/26 5:26 PM, Dmitry Baryshkov wrote:
> core->hfi_sys_ops is populated only during core bring-up, once the
> firmware generation has been detected. iris_vpu_power_on() enables
> interrupts earlier than that, so an interrupt (for instance a spurious
> one) that fires in this window makes iris_hfi_isr_handler()
> unconditionally dereference a NULL core->hfi_sys_ops and panic.
> 
> Skip the response handler when hfi_sys_ops has not been set up yet; the
> interrupt is still acknowledged and the line re-enabled.
> 
> Fixes: d8a6a63372b8 ("media: qcom: iris: merge hfi_response_ops and hfi_command_ops")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

double sob (it surely makes some people sob! :P)

> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index 8769ec61f117..36fcac4b40f1 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -109,7 +109,9 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  	iris_vpu_clear_interrupt(core);
>  	mutex_unlock(&core->lock);
>  
> -	core->hfi_sys_ops->sys_hfi_response_handler(core);
> +	/* An early (e.g. spurious) interrupt can arrive before hfi_sys_ops is set. */

Slop comment, drop or mention the reason behind this

apart from that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
