Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7362253FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712914; cv=none; b=Uqi9i0+5eEBjHzLttjuW4d8WdLUuTSnXvNmZ6l8nBVoZkWATrPMP04F4rqXviGqkRUBcKdmc1Oc37s52FnXCmiV96kJlI2G9EDQjAj13QWxws6szOVRNYgfuZsnNAPUA6f/m/Rt4Nio3JzSGxiD8pHmBxi3a62ivjuru3BhIRLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712914; c=relaxed/simple;
	bh=EAdT7SxED4NjI7nW0nd4WdQ7ZlHtubM69ukQVXmyiCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksN+giAxF//0qLIrM+2yb1egdmptCAfCGVj22qlQZOi/o+dyCeuxeQP2u1DL/giG9x4vbQFFgMquuUSHAxJBhKg+cxChAAif4g5jNz0JBwrarMxfrUlmgzByQvHRmulNspLIaozyXc2ej8FF9aHn3sVfSl68iUQg9D2+4zB1LAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRQLu387; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kq7f7KGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRQLu387";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kq7f7KGu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q07CH43269136
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qZwlu9DXHbG3KJS9HtD5YN5O
	QJT84r4Ko7CZVuzE2Ls=; b=PRQLu387WeMLi7r71RcObG9DOZLhwKIC3x6olCTA
	7LRAO/lCJtJrSsqKkoHmM2FTPphE4epZkoSUtx2M7LPDujh3KZxc0NsZSAM05WyD
	Dqt+CsknW7V1QNuV2EchYXINnuFJOXklc3nxCxzT+AkZZKyxdvcgg6OkI8o79Xrw
	hIaYQ5AIWa7ExGZZmZp0c5VISXYW0m1ZSslzz6U/Pt68gk9nDHfWS6kXX2LT0rmK
	17SNCvaX0/6rKrrF4cvS5wDTg0xk/CYEUL2pRA0H2w3mWJ8NiUwEM/HzR2d/w/Bb
	H/6+GGes7crB8F1PiZgj/XkjADY/NexFhYmbwnM5kkkvLw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcesr6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:55:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1521854a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787712911; x=1788317711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZwlu9DXHbG3KJS9HtD5YN5OQJT84r4Ko7CZVuzE2Ls=;
        b=kq7f7KGu2/3pbUOcafBtJbwxh/LTAmskgCPifgC7EFTKR/Ra6/8RNx3djzhzeF+m7O
         GoGWNQsMcRQnNFP/IaQ2AIzTBjV2wnPOcrXjwyD1BYTJ/1RqJTPqwVGd/f3nI5lVj2pV
         UCVEXrIGTdQ3e3k5YguwwfJEqU92ElSxdsYYu4GnH0IMuakrx1RZjVVWbHjhOaHvvYAG
         FWwPDOUax6CpC666xrx9QeC4geFwQRWYZcThN+UpUauqUcf5+LWn3CZj09tPlvjwmah6
         FOiEKLRG1QC5TFnq/r0A5IckLHZJMSZoYiS6LgJHTd42Fo5As5/BWY1NR5ifw46M/6Mc
         CZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712911; x=1788317711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZwlu9DXHbG3KJS9HtD5YN5OQJT84r4Ko7CZVuzE2Ls=;
        b=rm3m4AVN3j8bcXDMfxK9ZYrBuqjN3wbeBOXmJTczF4DYqm+hy2YHDNKTKmj5NFXmI3
         57W/DNIuWiT9TJ3y9rDCwuzDwZt/CybQyas9nRGymwJzgyuHr6LrwUeSqv7TS/prrWDP
         0ZQEb2NzmIcBMbCC6wtjli9Jc3E29laVDYWF/MixSSKLMhjkV96cu4ly7XZspRaqeIXX
         6ES7miOPQ3eSJus8RnLn1zf+kSEI3O39BnkPjiUj36uwUZtgY0qyR7Bi+DCVggZipHUS
         1cCCqDk5+Tgxajr5M/JSRslIO135xVj1kv4RWOuj5UOykVODqvklGdqBfmtRMfqKBUI8
         Dqdg==
X-Forwarded-Encrypted: i=1; AHgh+RrwpY3O10OgG6GQyBg+ESQe8qkBqByqQmbl800u5fse7UClsNaadfRobQgESvjUOKSU/FtHEl3x/IeLsYdf@vger.kernel.org
X-Gm-Message-State: AFuF++k9xtjeK4fe+GEOiklk5IC2NiypoCVMqA0MGVB+YhhSLTmo+UiB
	0jqA7MkpqzYLH/zr9dMbzhmq/hr4+i2KqHvJEpLZAbKo+YFp7eCzo0FeQa4oGKPycNijkAFzTRk
	HiNX4ptdpGVH0+76CCR7lvSo7UmeUTqQUARWhzRqxoBNH35Vauo1XHMvvRZHMs8JQ4X92
X-Gm-Gg: AR+sD10Gg7PSbAgVCeZcVix+mk8ipVUD5KxwbQXjUCiBgOh3Jh3ByEmUafmjppGPvXL
	kd/Z+acN2Sc9NECeLf0/cE4eXsF8lNOl/VLZGT8xWDo+yoTO1oK9G6fxix4gV1/JHSm0kD8YwJs
	qIkeF9bO78c7HvsGbMM/FL5QCSjrY5k8V/Q8rVqnNoQ7WqhD3gfmBw5iPvPBqTENYTeD8HohPdw
	F2yp9CsQ2fOIZ0iZjg+gm18zFHFxvmKMa1HRg8BXXLl7Ff85Y3B+Pfuqq3WQW9wae7UuVNHUE3p
	BuRldJe8pVwpR9cZ91cgWXPY2TtzbbzDP+Y/01RRi9k2i/fNVH6EOLPqrTvF3Ekn1+q9GL0Q5LI
	gmRk3EIlEDvYgEwdwUEr0z/kx4bp3/X3c88A3s79S+4Y=
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr7354665a91.3.1787712910992;
        Tue, 25 Aug 2026 19:55:10 -0700 (PDT)
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr7354472a91.3.1787712909866;
        Tue, 25 Aug 2026 19:55:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm3503170eec.23.2026.08.25.19.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:55:09 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:55:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] remoteproc: qcom: Support the Nord HPASS ADSP cluster
Message-ID: <ao5Vh_d_dAlJknpl@QCOM-aGQu4IUr3Y>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <81b85f8f-e4d4-4d19-aa47-97739eac030b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81b85f8f-e4d4-4d19-aa47-97739eac030b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8e5590 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=szNJ_9HOGHvmntdxT5MA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfXy7/f3GAa9xhu
 wOZyaGs6dF0ydypLzPc4/nDtz4D9RhAe/FZ490UEZqCDxy5EeQ3P7xE33rAPfwWhsSWsOeUtSwk
 X8BhywnY4v4ZembAcWZI1Ws/RmqPMl0=
X-Proofpoint-ORIG-GUID: mwAdffGwAHHPAmgmRJFxRxUwVNW5xsUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX5bHCVFibiox1
 XB+e42q9kg13mF+2sp+kOrnfSt2M+8xb4fCAEabFvmSXPPuwg9tPjNrcZhCqfGrLhTNQo0hElc2
 6unEdZkXCJDX6SVmgPMobv39oCcyrUMAtZC4xQGqJAEZKeTdIoa+v1b1E56RB3n+4V8drYYA42h
 SPOgilTOBdnxmdk/Qy9PGfv7uaASqriK6toUXGKKXMY2fRAWgNeNlXHDmtgjDcscNOhU4m7jiSH
 JqKn9FcU8QPt2UADmuFDUS6w9Uqsjt23QLF/B9eDMu0fa5b84FnOcsMQ/1XzKS13td1JfVzhKcS
 Vk8/upxYhIx/olN+AR4SWWajfaQQS3FK8AeRcRSVxfMY+ixDVh09MHqa9pn5T3rOyCDQjW6Va+j
 oESVtUQsOJOR6fILjGpkjkiyYJto8ntJVPixHcklVSJeMOpr0YyOh6q/UaBy3Gi5RXU3/2N0x9f
 AIdT5fUMkgJRxIH3AXg==
X-Proofpoint-GUID: mwAdffGwAHHPAmgmRJFxRxUwVNW5xsUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260022

On Mon, Aug 17, 2026 at 03:19:56PM +0200, Konrad Dybcio wrote:
> On 8/15/26 3:25 PM, Shawn Guo wrote:
> > The HPASS audio subsystem on the Qualcomm Nord SoC has three QDSP6
> > instances, ADSP0/1/2. They are not independent: ADSP0 owns the resources
> > the other two need (PLLs, AG_NOC, RSCp, CESTA, THROTTLE, QTMR) and
> > initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
> > boot once ADSP0 is up. Their firmware also cannot tolerate one instance
> > going down on its own -- stopping or restarting a single member leaves
> > sysmon/glink_ssr notify requests to the siblings timing out, and the
> > whole cluster unable to recover without manually stopping all three and
> > restarting them in dependency order.
> > 
> > This series models that constraint. A new "qcom,cluster-root" phandle
> > groups the instances; every member carries it, the resource-owning
> > instance included, whose phandle references itself, so both cluster
> > membership and root-ness are answerable from the node being probed alone.
> > Instances without the property -- which is every PAS instance on every
> > other SoC -- keep qcom_pas.cluster NULL and are completely unaffected.
> > 
> > Two invariants fall out of the hardware, and are implemented
> > independently of each other:
> > 
> >  - Root-first bring-up. A dependent member's start blocks until the root
> >    has booted.
> > 
> >  - Coupled, two-phase teardown. Stopping or crashing any member takes
> >    the whole cluster down. Hardware testing showed that whichever
> >    member's PAS/TZ power-off happens chronologically last always fails
> >    its own graceful shutdown ack -- both the sysmon SSCTL QMI ack and
> >    the SMEM-bit/IRQ ack -- regardless of whether that member is the
> >    root. So phase 1 fans the stop out to every participant concurrently
> 
> What!? Is that intended by design? Sounds like a crazy DoS attack surface :/

I'm trying to confirm internally whether this is by design. But at least
this is what I can conclude based on my testing and experimenting.

> Are we perhaps missing something to let the uncrashed DSPs keep running?

Let's see what I can get from the internal team.

Shawn
