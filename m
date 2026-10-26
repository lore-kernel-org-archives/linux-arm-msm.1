Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007569;
	b=2/rsWHklz1nQ0hXXsn3+knFcwtMPx/ik+hugIOeqbnma3jlXRA0NmhBePFz20I7iixAE
	 472BEqidDe+kTmBv7QP08EXL26aZ8K5WyypWB1b4CcjmpvnBPlhCmRoUEmL8P9rNfl45M
	 Q2XpTzWVKbjJhrCnSB/iQFxOXNqHd1y123fIN8FMDQazbR/UEYq820X1dUDgLvBJNn0j9
	 buzVQdN9NlHG9KsnElULjV3E+54chWrLA2kZfr8voDZVYRw4Q1objrb06N/CLGfDWyk57
	 5Kz/TiBYG+8P1kUK9x3yaC6wKpb6/nsLc0+XlGnfFTXAuwB12RR+bYFxX8GwFXAxvSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=;
	b=T2kNkmJLz7U3UuwEpW9pkGGTWlmEaMqYDCEAiJcmlL9ZZ7z9XhRitKawhTM1my4h92fT
	 xaK8Uqv+wcY6e80aOWo/Uga0q8WqZq6gQFUBQkr/oIUwRlpJBdwnv00SrGU+A7EX55oMg
	 4nCqDzCDIREnz8lpWCb6CnAivcihCEiCXwcPf9KtaLyJp1BxaaDxOP41d90f9qo3kkH9s
	 znAT803zlHetf+oxq0VLPpXB8P2oUJ9SmfFjDUXQZ0x7awBO9xr+Hs/LiIO0P/77IoopQ
	 wa/nCIRtmvOQwdgiMQjlzChS98+jEYD79/vEVdfRink4c7OQuHP2wwaio8vfDo8GnVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqEqEuWs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE0SoHYa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E09606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E09606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqEqEuWs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE0SoHYa
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1l12206204
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=; b=VqEqEuWsgh56Xb9S
	cpHo/6LH6TuyV1z5cwX6i1uDLS4x1T//86MpXUTsu5MMWf6+TsnwGF05rtpnEZBy
	XjVFds75SQXXXJSs7Ly7Be+PQvWNie+qFOL4SWh55be1xsvqKSJ3xFFnCC47axBj
	j9IUjBhv0yob73caB09JK/n02LNy7dv8vqkFDasko08DTLjQRcm/IjAsOnOs98zl
	KduK/fnyxop99YY0zy+25gySF14ZjfKBN25wOimjCHVjZm3Engw1GNMNBct8O7DX
	uTjseWvxN1hCmQpd6h7dRp3o9unLBsWC1pWtUj33C0CmiWeH2qCxiBCRn8HPC4se
	kqS/gA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunr0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:39:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so35708985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007567; x=1793612367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=;
        b=YE0SoHYaUVjPTt/ba12elAL1JSZEet2P7UDF2qkn6KezMhqtjYoSjOEr5BMYc4NNAS
         xthyb4prM4OELFz7LB7A2E/qmXKOJ/DhNMeaW7GhxVh7Xqt2zlHC2MioxNmPmgOKDn10
         lzfXGVxcTdqlLIpG0FtmBEqX46HF1glZ8rLOlbRXorONd72HwONmATCweTvU3pUHIgXK
         F6+QuTnjBxefIhDwg3or1GM1qxIVlHeDdo9xLJfP45DCfbgjAjiiRBanhy8FXPc3Z/GV
         NMy9/oCbEV7/Gujyz5O6W4oGfegr5uQpWaF/9t8/OJRRi5OPCa4N6CgG0oYglN3X6pTE
         ey2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007567; x=1793612367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=;
        b=1lozbm0SNU09r+1o1bfdn77F8lWFwUBMt7/kOk+LaaFhoevp6JJlIeUhlvr2eapcm3
         m4wFRKUW7zeSQfzK9vfBO9F90Q0CxhY1UbvOc+AYB/DxHyngJjrpyCAq4FiQvZQfeiwL
         1Uerz4s6nSBMx+XZTyDLSH4W5u0Sf3eAe8b+5KN1X73xvFC+2xeNA0M47EC7rAIptSoe
         1erUBjvS1toGYCCkJ65l5UTVKWnni5MMDzVEbRQ+ssyRvoE7dqAmZ/06IiUUvEu6uL2a
         776Hgsmv4mBTOTUjve0ZyF3xx4mV758mCqCSwexNKUwuBZ1ZU0w8wQohrCnq4BLB6gA0
         5idQ==
X-Gm-Message-State: AFq9FYJyP+YaadZYKUHxHezad/UZhw9R14I6OTtosvhz4dCVvif1M8PK
	5mwb7LP7Njqab1jeTSTC/Mxl8E+6D5UqxoXwyI01gB9wqZdwyA5WXd3kgH9xjve0XVoZdYoNMap
	mlh6wJqcGdDD8yiXmJk/kjnaXeAQuasgtwUnnQwN4DXsx0pc5ei05S/vlvEWR3GrSwwrGcltQi9
	ld
X-Gm-Gg: AYBFou2ttVL5F/Saqsp+7h9V2aHFn91pkGr7xa3yRXQ0zW8YFLSQuJuhGcpaotH81LB
	2U0yuhTewGLU8qjuqa8pImu8LPQK45nhr1zF95QLIZWGgpuIl1CcJV4RUMouhrFgcwJ5SJf6S67
	PC8/7YGJekVRPK4nK2UfYdjDh4wAid+oA2JUE1a1/q2ptlWU5Mo323n/CCDPvFsjs6nw6VHGCqP
	RjrgZZb01gXbltu7eIKw8AM4q4kIiZeO+CKBakDPIultpoPeymwonGjgFdpXpFKu77+51446CfW
	YBAyyv5WYWKXXKtITltgL7enOzejNHB7sYOrOqdY7kmCzg63mqoJrU3Y2donSfBrmNtzu5LLh8q
	ErbmbYnBNWWOfo0mY8X2Ssg==
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr953765985a.3.1793007567297;
        Mon, 26 Oct 2026 02:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr953764285a.3.1793007566871;
        Mon, 26 Oct 2026 02:39:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e25fsm3393695a12.7.2026.10.26.02.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:39:26 -0700 (PDT)
Message-ID: <aaca9b2e-d318-494b-8313-46945dfb96a4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:39:23 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-7-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-7-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXx7zy4QHp83By
 HwWzl56B4yasRI3QTGG3TkaVTlqgyaNd5+Ds6jNHsChTNPbaVaCZqufDVV02nwKjsU9lLMWPs9P
 N+j9VchClPAfJwl8P1Y9z6rHWMbSwk1bsu1Rq2B65puDH0ErE67mLSNC0h9Bt4fUVOQ9toHTYOB
 vW19OshDWn+2vfLMulVuNJKPv4eyKglc6QXD4KS+dZrCfHGlHlLelp45atx1ve3oQwFoKDL9eiP
 LIbxCciBaz1d35k467BStm8Z81sYUFsdVUDPFhgY9iDH4K1vr1ZLIUSnlMsNMup+8HbB6w3zXrn
 cYOo8Vezrwf/2LSVAyYJKsXTvbtg4fLxOy8sVxI0XrY/p65AcP+kNuojp4Ez/18AHYkG0CZvesr
 F5YRK6QP9rsaob1L5tl0D4LGEA6BMvsh5So+LyYriS2DwjD8A1f8pkjWL8WsHlKqeLh3H2BhtsU
 22Uzeb4V1MU/DxpQGBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX5qS1YnWy8d8N
 mLrS3RlQ/cKx2IHiuFmMJTSgDAoHr2OpGCmLUb9Bg5ikEmBV8BewAbbSi+fol48gXP2OoiPy4Ph
 gVP81hpj0c25+Q9PIE9Kpyeg0jBni4o=
X-Proofpoint-ORIG-GUID: 6rPHKgp-L9aughW8MCUy1c1A18NV9gFx
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf1fcf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=b3vL7svAqNHW8n6rvRwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6rPHKgp-L9aughW8MCUy1c1A18NV9gFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> mdp5_kms_init() returns straight away when one of its later steps fails,
> leaving behind the kms, the runtime PM reference taken around the address
> space setup and the address space itself, and lets the ->destroy()
> callback, which the caller runs afterwards, clean up. When mdp5_init()
> fails, however, it has already run mdp5_destroy() itself, and ->destroy()
> runs it a second time: the global state object is finalised twice.
> 
> Undo the steps which have completed, in the reverse order, drop the
> runtime PM reference on the error path as well, and tell the caller not
> to run ->destroy() after a failed init. Fold the hardware setup, which
> can't fail, into mdp5_kms_init().
> 
> Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
