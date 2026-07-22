Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABB32B125
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708961; cv=none; b=clOcc/GofyO3fcvEAC8j0K6KASWtKZ4TKnnZEl6RmN/ru7+D5guFyN0iynaTH89bF6cUy+8HBF+993yhWa1Q+7Yo52vSK3SeSP4tkSsQJ2XI+0SmPPhCI6UyU10SyAnQ+FJEGLnHqtMJW7h2DpLwXKXCtRZIpc4Az8cZ9sn2QI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708961; c=relaxed/simple;
	bh=4JCPT8LjoquEP5sUWnwAWD9e43vT3tf2kuymJQBp/ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cV15p6MJyRkgY13+zPFCwOC7078zAUuNqrSCjqKGNm+VkDtDNfVq43OVqBOuZm63pAm7QJhxU+FDYmTZI3f0QAGmdceOleIMOa3zVcp/o95Tg230JbXosqo8JRun3DPdsA+d2iSdCmjjf59gINa0f/k9gzTDtYI7HU0dUIko3Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfWN7Iu7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDWyOO5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfWN7Iu7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDWyOO5b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53uiT3996092
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mzFXdrmo76X20LWVaZuKiR/v
	bKcWyq5xd6iUFnb52dQ=; b=KfWN7Iu7fwbFQZvEjiz88AfvLvyzzTjEkhmsXl+W
	ZBMutJ7tS5UiUPwdMVzpmHmLTrnGhQCo/0NIfDLWGAdop6b1F123Gz9LYt4b/uR0
	q7jnqgBCMbFbdn38PzndzTQ5h4jH5pouS0aXScBW8vwids6Y2G95k/4EuLTMmZrt
	rqt66vlYWk6wjX09/gEhDDEjqifbpLeaDA1eGV3OTjULGsUnLV1F61kvAcFgEY20
	W3fzC6rzosUpxXHPdrHWaNpU/IHY2Mp7kyeBib3i986Hrz/i1q+YezREZCA4RR5P
	a0SlkhiBD97VFIK+C/OvrlI0sI6xFGaXwts9NlA2JVfjJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d32pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:29:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so253015301cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708958; x=1785313758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzFXdrmo76X20LWVaZuKiR/vbKcWyq5xd6iUFnb52dQ=;
        b=eDWyOO5bCXMlGzcqlhKuP0KMwzyAMFDfamge+3YYTDJK5+MVx1IXoeZEgqQ+0nIdvD
         dfI36FjFHeBBULpxgcgCYu7fjhhZaYrupadR9QZdNovVV+ZgVDfq7UNhlHXtMiFWvcC3
         zkggTVNFuEvEnc4R/NrfjpNSAXkTrUoaiKl4TUzEQYQTcUF/DzdsNzNNuhvavSBfhXap
         uDn+zJkY/4LUagwEV7/vfzFT1nXuVTPfvwbjS/sUO40OF1ob9WY5MiTU1VK73vO6mWev
         aNgmnAry/vmbEHvq8WOBc0diIezcTwLzx9oi4n/tpYDE4anDiIRhc1qgBkDWW6m0ORH8
         FxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708958; x=1785313758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzFXdrmo76X20LWVaZuKiR/vbKcWyq5xd6iUFnb52dQ=;
        b=gYGJu0eMZd0ANcCOoO6QMHzrH5E2vCIuNSMGPeTn39GZgRf6UQXEeFRmXFeassI0oG
         oUtDZEC1Tc+hsrfvPo7ooT1IB/hBRFC6PvNLoM5k44R2QR7EEUjs33RqfLDzH5Zv6pH9
         i/FqeogZ5htF2qSJEIvI3lBv+FRhbRYAVsnTYur8t9E3PBBmy4hZkFZf8vuFiWkM5J9m
         /NtFkHpbdikgqKV7AbfX7IHdTv/oD2eN578LiKcT2B9HzfEefPBDCv0D3TGJFE9Iuha5
         UTo2AglxwsfxTUaraIrWmC75P4aWqihIgk3OTsJvTQ62tx/kiYCM/76Xf2VMttuTiowv
         n4EQ==
X-Forwarded-Encrypted: i=1; AHgh+RowdjP8PXq8tYd3ZXkjG5XYk+O6lZ10SoxM+aLChXw10JRz9jMafmT8T7S/6lb9jOTujlYMQn3IHpf7NFzE@vger.kernel.org
X-Gm-Message-State: AOJu0YwxqQXPORrK96YJg6zcZBgLVH4bz5UiWzUmQ3ORXq2XGPSw2zw/
	WQhDhfWU3uxydPS12mq7gZymqOxNTW2QwDTVOF99z5iiQ/8GjRrssUmMFLk07CrHJHZVaG2N+7i
	7Sd+/gPSXSul/DRYAPaQl6Pvq09dbEBC+B8tW36vi0rTEcn3tinDb1zAYagh19VpEfj2B
X-Gm-Gg: AR+sD11lCYMk60Age5u5lnMbtcBO6R0UCDvSAgRgNGIZFsRpccvp7ECMDAT4TKq4iqN
	QI2rFKlEHEA6VYSG/1/l3NrQLc3JuuygTe27UFmC89xVPOMF0DRInaAMpe5Bpokqp25ik4oiAj8
	YYDVopG7PsbpczHrlepdn4yfsvXBjlKpSSPhXH36fldrEnYnAhdH+hyQpOErXhUGvrFXN4SI63d
	TwsGpaALU+hAnL9P4iPGlxtUqQDg9B5S322mxadY+onM1NSJ5PaCihBAHHQGC0EKIIkSR//ijjQ
	z0FdieE4L5VkOi0oiGM+d/BmrRfN0EPmoB21pWWhJOgWntLiq7NSSkof/w/n+9FeVYFKDHdKHbV
	k/mksUK+dpymQid/QinBjk34eCJZQz2BY0meYsjMfeuBduIvtkVKUpIqMPAhppMBALk+5zjX+vF
	w8CvhTb2MbZ+2FmA==
X-Received: by 2002:ac8:5805:0:b0:51a:8c79:a2d with SMTP id d75a77b69052e-5213aa6d807mr204571531cf.1.1784708957691;
        Wed, 22 Jul 2026 01:29:17 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:51a:8c79:a2d with SMTP id d75a77b69052e-5213aa6d807mr204571461cf.1.1784708957293;
        Wed, 22 Jul 2026 01:29:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4611dsm353445e87.67.2026.07.22.01.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:29:16 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:29:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
Message-ID: <xyfoylxowewyyivw4qkwjhtmukbejusmcucfrs6jnmrihpx2ep@koluyh6bgbre>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <20260722-qcom_uefisecapp_migrate_qcomtee-v2-5-b8a8fcbe4211@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-5-b8a8fcbe4211@oss.qualcomm.com>
X-Proofpoint-GUID: DfTzcQJcKIQXNq8YepO5HqmkUQQHLbz7
X-Proofpoint-ORIG-GUID: DfTzcQJcKIQXNq8YepO5HqmkUQQHLbz7
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a607f5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TFgC4XBF0NqNkrG4Fy4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX5konTwvTlvzk
 G2NSiI0pUalGNWDup7ksYwnoYLJbBAI2L7JNg0vZPLHNxfaBlHPmyUZy3wYiMcF33fDGzryBdvt
 BVtqricC9wEome+zxxIf53h36ttqFSKWjVeMIpBXXU6gH2skLj5WKcFz3ccrH6IfT5lYHQqW73t
 D1iUgHFvk/DDP9/Wl15fbOODOIxQb+9IzNQrGBx8PpgOwvhsAZ0mwi1cIq4rjK3nAkw4B19LvTJ
 5ghlRaWNSqP+lKcSH6MwdcEu/XBYRYN1MJdyfMe4FAqo9du7tgUqttedc3ntunFir1svpXUgqKu
 eGj0VzM8I7vQ3l8pq83bJ3hkSUbwsTQbs5Og7jR56XevTJl31Z//+CbTJDjhKwAXfEhHxZw3M9W
 //yA3x3TGn3mmVmwoZnMrelLymbpdeX9vqS0tcJO1ZAOFto3WcfOtFZwN9z4J5YKnIBtmM85Xil
 30GdZJvy2bAUlyAWvMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX7iCWGdty6hjW
 Mo0W2CvW9fgnScMfsitUwPsE+jDhs9rJspYLbqMk+MGbQRR0wqS2bPADaVI5gbksyzn+hvJSA6K
 OTB+5k+J6K2mkrlAPPoUruJaOhlSMXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220078

On Wed, Jul 22, 2026 at 12:29:16PM +0530, Harshal Dev wrote:
> QTEE exposes certain secure services implemented either within the QTEE
> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
> services can be readily accessed by TEE client drivers via QTEE's
> object-IPC protocol if the service is registered as a device on the TEE
> bus.
> 
> One such service is the EFI-variables service, implemented by the
> uefisecapp TA which enables kernel clients to access EFI variables at
> runtime.
> 
> Maintain a static list of such always-available secure services and add
> support for the QCOMTEE driver to register these services as devices on
> the TEE bus during probe.

Is it always available on all platforms supporting QTEE?

> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
>  drivers/tee/qcomtee/core.c           |   9 +-
>  drivers/tee/qcomtee/qcomtee.h        |  12 +++
>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>  5 files changed, 177 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry
