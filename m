Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4516220F2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481061; cv=none; b=cs72cZcvJ6+2Js4WutSVhRzJ+0CegCX960fDl0ZXYIvRC3osTdmTh8U7DqHounHPdAoSfreNARDcYWk76I0tGWbMOdi9otKh6UQLRxwkG53jx/+PaXTFQsmOxmvmgZiNNySV2p7Rkax8goryaBRM+fBvngsnESORpvojU+R+q3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481061; c=relaxed/simple;
	bh=59ZmUVP0cwQan1rzg1L4emztWLU5wPZlD7KY7rl98Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQsugBbUQhvU6OpKYwnVMC4oOgds/rXafAO4N73UIS0OsQJsXH+lxVGFS22PQ6S+z/69z5g28iVbu7IjO+HvNiZ4aB8JcmAw9JIASecBzPBKFArcT+Cz/lN2q8WtbQnWcEQpyTaN3JB3Z0VJxNpQUhf8e3ejsVY/mngTYoN0Tuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ks8/RlLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SezgBEo+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ks8/RlLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SezgBEo+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6bWW53703697
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yeoMnG3I9e/DLxw1trT1m1DMzEITRAh6vsr1I63XEME=; b=Ks8/RlLZStJh8O9T
	tSegNnRWHOzwPt/+CXHVQsf8PTbIJ99+WEqirjvxRAytKTf+hUEjrzAnG8jrVbzO
	ynnEu3jEijDFiqOFmDM+BdtVCYujicwyCoSC6clITur2RzgIW+lR4cSakGUYpBtN
	uFHbv37Q1OJtwkDusN5LvGNKzpuooEkW+a7ULGDPITKlsQ8PD6VYMw6BXIqihlIn
	pTiBQn0p2WWzkPN4OpCO1zaJVi4EJcPYBipI1z5+sCglrA4pvf8ldERqsAX62jrD
	036LrJ3whTyrhEuofOWOhwctfCVGJ1UfkE+Tc3LICsmMlDcxxB6mwAwxcdIk5Yxz
	fWanPw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpkt0294-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:57:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e01a62d99so1028087b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785481058; x=1786085858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeoMnG3I9e/DLxw1trT1m1DMzEITRAh6vsr1I63XEME=;
        b=SezgBEo+SXbfluOa+MPA1YS3i75KPXQySNlQg6EOCvRv+Vp+63CHciD/OngoT2aAWL
         ykmh2UeUG+s/XGOd9e94EuLCbdDmu1bc/OwLiHRBss8mWxlhkEUmkghPadKvcZBBHvRf
         QlYlFNFj8WO/HoK0RbWPM7eFXnPoj2tYkhrVKbcUixczTMzWKTZthVSwCk83X5M6iMG6
         RmM+cNQSHnfSvi9UC14UUpoKE/eYgAwI1DpJAjetDMme5c+k1K2pS6V1dy4bFyOkkbLX
         yUPoopqx5aKMVOnJwi57TwDr9WYM90n4cXvpWdndp7y9ARaxnxK8WS5OCrjRdLtJiLCL
         SAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481058; x=1786085858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeoMnG3I9e/DLxw1trT1m1DMzEITRAh6vsr1I63XEME=;
        b=kqRaH46V8nRxe5sfp2Ot95CIWKi6NUnZFIJjpHN5ZlsRy4aJ6V7ITqZ2YEyJymur6/
         gZo2dTyCqDgJN6tWQyYrpyRtA6ulOKZdBMgPOaKaVamam2DZ351otK8ufYdN1POpUvPL
         hEZBmyNhaE9rsa0gdVKcTT6vdByIRVYlikzsiR8vUE0mydwCAjUAxY10+9HOHNy/23k1
         W/+8vTEnQT/8VHMA8820wJE8eEajgc564sa/vFCGoabmRP26qD+tEqb8RbkiNXJgri/c
         geSn0O6JXJbbVs24l2U+SY7Hh9LxTiOtbTeyNcD5NrjPfd+U2bZW23E1Ljej+mgyQpsa
         o23Q==
X-Forwarded-Encrypted: i=1; AHgh+RqhGOn2xNRizvjExAeD8JTOm/r+POJjGuo6qMTjwGqBqEBFY61s7KTlmSO3eXgIS6d5bMpGRYjSdmhZiJ51@vger.kernel.org
X-Gm-Message-State: AOJu0YygwMl2TXBVGgV3wWW132Rko2rSolZ7gbY5dUBmdblTKvhEpXEH
	rFafiwTzPQhxLcesxw/T2sd2MRVbco05uBELVBOe6w9Ply7hQKKWT6mAQ5ryTRq4FTlk00z+drN
	NYo/v0dj3ubm2FTb9xX+8NRHDFigCrOQYN0KuQ3WW7Tvjbd1UDRSkoO1NzaLV2fdQOCyu
X-Gm-Gg: AR+sD11Fcvs2z3Px57oTzaxT0N0iWQkMo6PpVOereNpjRIT0B5f3Ufhd5MNIHdMjOJW
	MU1Dat8lNeBucydXyXAu7DgJG1b40x762yZJD2HV6dudXj3F9KD4t5VaTOAiYOL+r2C++hkyxyZ
	Ao4k7+SwrQXzMDMZBmknJmmYeU2nwzDdjQMWcYh76CqGMgfpk4d0hVpgmuXE+UMPCgCluPTUqMo
	41BL3J4c0EE9KXA98AKOVJyThc7QWaX5YSdnatZvDmTVumbwrKkMi7ymL5L0eROfXA9O6aGUWVh
	fUO4VyQ+GUBxckILzQYJE6teI4Yj4HwMQYxwsRU9RlMEqK2mhtx1nKgEYOgeHFEmHkwhvHs8RPH
	TkDTCFjLolIa8A4Ut1qk15+6n8AFrWQ==
X-Received: by 2002:a05:6a00:b8b:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84ed71df47cmr706022b3a.51.1785481058360;
        Thu, 30 Jul 2026 23:57:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8b:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84ed71df47cmr706014b3a.51.1785481057758;
        Thu, 30 Jul 2026 23:57:37 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35a76sm43031b3a.6.2026.07.30.23.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:57:37 -0700 (PDT)
Message-ID: <7150bcc5-c378-4b18-85df-cf9ae705f7e7@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 12:27:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: initialize invoke refcount before publish
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260624185427.1451-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260624185427.1451-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uLNL7-dyjYAAS5jpHEqacEgcGvv6i7K-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfX5Nqqzk04aqky
 CApVexTxpUJ4U1W+YuzTRUQMjg0k0ZwNmAj9FdLHlhIp8vbFuQ7oBdN5avI5dMAE55A1S6DH3Lz
 ncK52abjNsahy3BpL1DKtuZ+q7Wv86RDoYEzEy9MG8gWflIGEgUgL8OJeG3Rq1qX/rDkd/i2Fl0
 Nwk9aqOzBdWze9jmhT/0eq6cmjIW/svDlq9z2U2WOAtYp4LfBuf2fd32RCqE0Cu4ZJFs3Tn6F3i
 nwOq+k9t1wiu9pWPuJFUGVJ0F8ZEkAbjyim10yGr6lzchn30H4o2/c3pR1KcV82sxgtS68u/rTl
 zK5rBBkbzxBlkHrPvN/q7DVjNdPgi23eMui6cWmZ4nGMuwVFlWb7WM6jI0fwZ2fL4msi9+jOyJy
 DIbuv8gxQv1dRK+ejSHPS4St+K4RdP4EbYpV+owBXPM7KgitdcYdsoRfcVzpns8f2Rl1B9fJwoY
 tGkbVyiou0zLVM25czQ==
X-Authority-Analysis: v=2.4 cv=XYa5Co55 c=1 sm=1 tr=0 ts=6a6c4763 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=WQc7OmQVWAu9uTwc-zgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfXwPHneEhxSNp1
 7B0pf0Z1KEgePZEEXu36UepogAYXRstABFI+qxF7WXR+ltdZvA1TmXwKCpsxLxJeSzpdl5x+oEO
 nsXIaKXYhFjGgFnpBx3PpSY6tshiLFk=
X-Proofpoint-GUID: uLNL7-dyjYAAS5jpHEqacEgcGvv6i7K-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310047

On 25-06-2026 00:24, Yousef Alhouseen wrote:
> fastrpc_context_alloc() adds a new invoke context to the pending list
> and the channel IDR before initializing its refcount.
> 
> A racing DSP response can find that context by ID and drop a reference
> before kref_init() has run. Initialize the refcount before publishing the
> context.
> 
Please add Fixes: tag to this.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 6ced210ca..42fc128e1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -703,6 +703,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	ctx->cctx = cctx;
>  	init_completion(&ctx->work);
>  	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
> +	kref_init(&ctx->refcount);
>  
>  	spin_lock(&user->lock);
>  	list_add_tail(&ctx->node, &user->pending);
> @@ -718,8 +719,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	ctx->ctxid = ret << 4;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
> -	kref_init(&ctx->refcount);
> -
>  	return ctx;
>  err_idr:
>  	spin_lock(&user->lock);

