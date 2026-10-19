Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E89487CD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394518; cv=none; b=jA0irfsLSDMvEvAXiiCNPqzp5EFCGcUtwgiPh8oNoDFPrD7YYssFI2/Z7IPM92HgcHqrP285YWtCr8mks6OBvGpnMT6f+sdqp/mKjozHgJI6wGNXbinozjPRsb5aRWrhfBelphgevpYmNRT1vkVvD3X9u2hSZgxvOmr2wyHthbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394518; c=relaxed/simple;
	bh=SBY8z7gC6UVEgwMXUaxuVvdl1jO4c/aNNzHV+sEReMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YB8qcHQ5R05xaqEmtHLoZjLlh/QxoWTDtLJrSLC9NUVra4m6dU1igQmeUB3Xy5hyW3ouNuP+JU6jHwyNHGooTNu1HF94GIiMMStp8yJvcfqFoZUfX2kGA82rd5oEXmFTtv5kn8xZJYL+yeDT1PYRCYL3HmTRLQoAiYMlJnoF6f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoGjtrxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2Hu8iiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoGjtrxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2Hu8iiZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j38u2264935
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RW04UJAChk1zLpmtFuvB+VwxtXHR+RDaCh3ieWKs66o=; b=HoGjtrxnPrkHoHgz
	Y7Hz0FVLU0lVIHg5+7tYaPGEM8xZcVuVdv9K7zWOLO2Ki4AEWgFEyYEImDYFfwu5
	WGzIcPwu5bOXFlzvggYKxxGQpQJxkKwD74iy0b+RT6wnyQY5Xwjfscznubqt4CEw
	0RcuOpT70kDVB83QbkB4NdhMlNtXQaaQMjb2PYwRMAl8VA+BK/SsQmPAB29Ki2jb
	GiJx8wKdAz/kSwy7RKxpy3DDQPVZPwGP7gIffUJN6NgslHReBasW9yQTqdYNPF/2
	Qs1+i69qv23SL/D4erXrY/VgerHSfO3rvscKu71nuUDm94qQNiM1vB7dDNqMhIP5
	MFhCtw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxnh61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:21:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso2654514eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394515; x=1792999315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW04UJAChk1zLpmtFuvB+VwxtXHR+RDaCh3ieWKs66o=;
        b=K2Hu8iiZ/hzWrpRWjxqgyP9fsNY2FNuOeiX1lWCB3R7j7psQn1RRCROc0UX+ilcdL5
         G+TWi3wSeApYr433daSTN/FKwAnfIMYTW3SiC8h6pvSGcX7kz5rtxy3AYR4bJErm71Jr
         or8FJG5Ssne2UW+f+t5e0MN2Wpptz3F+W3mgjU5hYSQpwTzMOIvzYSVKgdoJ3fewMS5y
         aU4uf+G0xq+X/msT+6JT9TtSBDNTtGM7A/q/n11G6uHNNJRWNFrj3CcO6qJdBPbXYPXA
         sUOjpRxZgeIsbTBz0L8sP5UnNObnCyOiqcf7wJ21NkMhd/e007lGfC3GFO2QxgSUCB4R
         2VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394515; x=1792999315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RW04UJAChk1zLpmtFuvB+VwxtXHR+RDaCh3ieWKs66o=;
        b=P65XUjAqkc26WHN4ZqUKrvU/La9AR5ae2u8LTNRuBdot6XN/bl+JtyYxyC0uShDocg
         dMgpGE+JaiSC4cgFYTbEQygZ69qnyqOtkao2Mog3Dn2niQXIK7cWFTKwgwWathkMmlc8
         LUjfLHZygcd+M0RMH3hEfNQ++c2GHt7he/H29dyugCKxN789eL9qR7BWWdOp1QfQtbtL
         oS8eMOH3OWRMwmM2LQrZaZJOMmIg/+Faeabsq9cwquxzO8bNpdW3hO8L4u/PIJSKecTq
         dyOAX1wN1vjqUsT7xcTe8eLNNAp00DcDEVy8CHkLbfMI+f+YCmF1i/92w5XZeyszv5Nm
         Crgg==
X-Forwarded-Encrypted: i=1; AKwUvBwqVuIgrln9Q26pcY1L6VOTdbisMuzO7wTHgwWL8kKcjEUfvUJU2ooQ+axibMDSmeI8eS8a2p8QnrQVq4SI@vger.kernel.org
X-Gm-Message-State: AFq9FYKd7yri4MOgO+qsGWrF+Ov40w3tIqbkR47VBO5+7e/JWgD+0fbx
	n1MYBTLw5yWGtbO+33w4aEP9co9MDo1jhS2ERxHj81TMlAbzd20dCltMGa0IX7uBUmMJaeiVU6b
	Hn3zeArDdbrU5ERda+PUvD02A/SJATYhMtmu1BoDl6SUwILy8YNXP8eUKC4vwAq2ke3jU
X-Gm-Gg: AYBFou06pKNGUDV11YPgzoroc25MOWUaZ6WgukUQORD1Pnh08AIMuC75stwdIbyDZ4L
	Se9VB7buUNE2KsKOarWQnQ/IzHn3qHH1+Nm07BsMIykhdNpcjjcKL5YVccsoxoFvNvCQmtJARU/
	Qz5GwHebVMeXMRyIQwW1N1FcNqR0BWxFXqPIgbN2RtKYvx37O/bO5HPE5bkbUlS+06KH56VaWCZ
	0w7ymW/cgGHupUn84+0MYuN89WycGUAuZj1tpPKIQ4yNBs7oJVIn5Vw4LW7EwtTUKbgl0E1WEYZ
	8GVebgmhbh6QtyChIiWqnxNEs3faqOmzWUu2JTSyAl86CUGzgUSxWT7OlIEEj3mvHXvqcgxvpPb
	syhH+c5BJnEmidqxVAEb/3fvh
X-Received: by 2002:a05:7300:ae22:b0:356:9345:a07c with SMTP id 5a478bee46e88-361a1b52d40mr10457795eec.22.1792394514786;
        Mon, 19 Oct 2026 00:21:54 -0700 (PDT)
X-Received: by 2002:a05:7300:ae22:b0:356:9345:a07c with SMTP id 5a478bee46e88-361a1b52d40mr10457763eec.22.1792394514172;
        Mon, 19 Oct 2026 00:21:54 -0700 (PDT)
Received: from [192.168.1.7] ([101.0.62.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm49639768eec.28.2026.10.19.00.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:21:53 -0700 (PDT)
Message-ID: <2e1f73f2-5ac5-42f0-abfd-93d428528e40@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:51:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] misc: fastrpc: initialise channel refcount before
 exposing the misc device
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
 <20261007084447.922-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007084447.922-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfXwHiCtaWw3Fqp
 hp4Zo0VmDcaKBlwi+63GCvBKPdtx/4XNq9ThvEPlcMNu3g1+N8VHFhyyMGCyUIFEQSOVRqW2P9z
 RHQiqVhVQ6FMN0/rb36dvgqV6BIIJPY=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad5c514 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=sC8K8RXUWm68HHFV/PXcoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rhkbLGPNnmkQcCxMrrAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX3GdBIQMqvOGu
 G1fHzXYvOnAdqHAubC0rFGVU7meAZm2+Yfx8757KSef3+03/MYC0v2i0BIfsggAQuScJYz14m+c
 TUh3M5sL3HfUYUF6JRbDsqi1GTBYOgY4EXQgwDr5HjKkwlo4kI84tkPey6R/VANEPuegPtc5XbA
 GEmFYTvQo0haTALRCWic/cuPm7606qul76f2xSdSPilFK6xC7c1TBtgFPwKzDkXQnbJZ6fh6r4a
 SdQG7TxiRwqC8gXpdURDVd6AdpCmoDrxslAWRuSDgsYKimQ0mk2C63nE0WEHHWrow13VWLZl4YA
 U61AoXInoAsQr6Y6iAJkaPkPAVcuqcS356CiYWwh44q5gYyIjJvaXajbyLULRxz7caZ5XAmgLF3
 a+r7YPpaZSNX4GHhD3Efu1oFOtUNOvlOcSfVFkszAs0OeGp7TAwM22hsWG+dpulTsqGoBFsGbwz
 47HfxMp8hCuT/w04NJQ==
X-Proofpoint-ORIG-GUID: LeG7t81LB6Q1SK3B36G_Sv-HwwhvNDi5
X-Proofpoint-GUID: LeG7t81LB6Q1SK3B36G_Sv-HwwhvNDi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190029

On 07-10-2026 14:14, Jianping Li wrote:
> fastrpc_device_register() calls misc_register(), which immediately makes
> /dev/fastrpc-<domain> visible to userspace. However, kref_init() on the
> channel context refcount only runs after the whole domain switch()
> completes, several statements later.
> 
> Any process that opens the device in that window reaches
> fastrpc_device_open() -> fastrpc_channel_ctx_get() -> kref_get() on a
> refcount that has never been initialised and is still zero, which
> refcount_t correctly reports as a use-after-free:
> 
>   refcount_t: addition on 0; use-after-free.
>   WARNING: CPU: 0 PID: 760 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x144
>   CPU: 0 UID: 0 PID: 760 Comm: adsprpcd
>   Call trace:
>     refcount_warn_saturate
>     fastrpc_device_open [fastrpc]
>     misc_open
>     chrdev_open
>     do_dentry_open
>     vfs_open
>     path_openat
>     do_filp_open
>     do_sys_openat2
>     __arm64_sys_openat
> 
> This is easy to hit after a subsystem restart, when the DSP daemon
> reopens the device as soon as it observes the PD coming back up, racing
> with fastrpc_rpmsg_probe() on the rebind path.
> 
> Move kref_init() ahead of the device registration so the refcount is
> always valid by the time the node is reachable from userspace.
> 
> Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index af18ff1992ee..05b2e7e4ad3b 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2599,6 +2599,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	data->poll_mode_supported = soc_data->poll_mode_supported ||
>  		of_machine_get_match(fastrpc_poll_supported_machines);
>  
> +	kref_init(&data->refcount);
Need to move all initialization before fastrpc_device_register(), this
is already being handled by this patch[1].

[1]
https://lore.kernel.org/all/20261001-fastrpc-probe-fixes-v1-2-1376d93b8b3e@oss.qualcomm.com/>
 	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
> @@ -2626,7 +2627,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		goto err_free_data;
>  	}
>  
> -	kref_init(&data->refcount);
>  	atomic_set(&data->ctx_seq, 0);
>  
>  	rdev->dma_mask = &data->dma_mask;

