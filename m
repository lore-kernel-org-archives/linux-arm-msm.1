Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AD642DA29
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800835; cv=none; b=PygC4ClVeZdPT1NTjzB4EAW84gt9zJSb7FyHfUAjYozaPKa7+MxUpSUe/z7kkp3bUa88K5+b4QgabFlm7h6auNnDcB3ZLhdh8N/fd9QrLJVOi0K4Bi0dGisS+739w1Xi0rNlIMwV4ItfLs/AdVWl7RmDlXwfGWVp8AK4RkB/JfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800835; c=relaxed/simple;
	bh=VLw6u5uJQ0A0aDtacuxkHmJKmF7uVFvEbyUyO50WYAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0ALIJ4TweVKenhSEA2LX9fy9jrx0/MSzDScMvrARFrwMfcbkIDma5XojB1Mi6q7RDxbacTiWm4T+J/3sQ1uf/JTIVpplg4zX4AG/R8iAaNXQQkaYa820vtB261tZU9chNyGJ8Rcd7nzNRnb4abFDRJdIsXKVNgRHMbrMSLxbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLKjhQ5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfQ7jQji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLKjhQ5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfQ7jQji"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWHX3044647
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MCAPhmwzwrd8RGe5r/R4THSX
	uofPqZMNQCsZGRPWI8Q=; b=HLKjhQ5kOFJmzUZ6j5w0zuO1mTqzz//wqjgA3VqG
	92j01WMU0EKKMcYTo0PdA0ofJeSt/RgG63lMudiSSiKzk4snytGB76c4yPitCn9h
	DLCxsKp4fQuAh3mWK///agGv9u8jYLLqbvfTwG9wYjPYGaU0rngxRORq8jRONV8b
	pPs40skveGvQL4HbLCcWifE18el4GuznvJRcqQR8xRyxd4vG0qWrcfdCXOX/sNdx
	ec1Zpw+ocuKbeq0E+2EkAl9MPQwhoXoGJWoMADjYOjiA8Mz50kaTWTFGZ07n5Lc6
	iSZXDMJQEJx96Q6YPbLZUX2xZ5A7/F/jFoQsijZWpwl1RA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8gyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:00:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so3198575ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800833; x=1785405633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCAPhmwzwrd8RGe5r/R4THSXuofPqZMNQCsZGRPWI8Q=;
        b=AfQ7jQjivVtcsmz/+JXByx0Wux2pwx6IJjpLcOk8z4xGz30RcyWsytDMqJHH58C6Jn
         cBmpKfcaLVE/8Kf/rodlWMlzNrUHloRXgvNw5FdqOB/QUkCE2EM8fkk7jc44GkwtDoPE
         YhOs2wairsUTrlyw4ILHn+oRVxvnjUME2qHM670N20+bT+Y81IfOoNDMEpafpEsCzV9F
         toiZb8AaZXARHmcsHNfYJY+jsSpGMLhaqWYsL5RhoXbHt6B6lzJYHngtg1RQgbYXo68o
         QXJhkqAalueFkblKzIZtt2SULqO8jxUrNFxSst8trYz8p+de8TQbDhWqnClVWcughvM/
         pZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800833; x=1785405633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCAPhmwzwrd8RGe5r/R4THSXuofPqZMNQCsZGRPWI8Q=;
        b=Kd0AH6DChqkxZFHmfH3Fz/scSFD++ZOK7MyJkX7amHSxQ5JpZL7TaJvLE6crzAZI/y
         UfvYHM3XWQJp3xfRSkLNDXlKlSdocLZcq1U0iP6FrjwuZ+ajd10YcVk5fEOCi1DWRVtz
         hSKKX+O6WrbpwYq399/Xh38f+NWhiy2/VmmBCFvZQx0Ilr7SrlD+TPyWeX5C8G/1+s1K
         JlzKiOuWukEYJNR7gmuRrDWZLkhXCM1VNxOK0o2Ydq2fMYhE2sXZXWfpI5QAdPCF32N4
         GpnTGSqLnM7O/cDwwoKZwj6u8s/62PcOCBiV23FfWVrXg62Dl/oc+2ckv7P8Vf6TKXIl
         wOfw==
X-Forwarded-Encrypted: i=1; AHgh+Rqoejjw90lnAUh2afmfVrcT9X0g3ec+Oz5vxxop515hZdrczKBpxkvk3YtQ5H4nkG7g9Kfuo2OJYwuBVvzx@vger.kernel.org
X-Gm-Message-State: AOJu0YxhDk/GaFIF/PL7ggJx2NjCWdKrC+TbCdAe7TGcpCA6SVSKemMa
	+CvHhhwjiRi2TciXDUNYEASX4tGsqLwWswLJq41+LCz/tpWGAfBF6m05SdV2gcbV9DHIVDXKeQT
	FmMZOIheG7CNg7Y+azf8tjsB7rwmzJyrFXTg4czuZaMhktZFQnAgnzpJ8hPnUL0M4CXhs
X-Gm-Gg: AR+sD10GEFG8C1VdCq/ylDAi3Oxj4iD+mvmviFhCWJma3MxGvhmBwcLFkUA/Lbf6AJs
	ItUY14iz2Cq3Ai/svFOzQABHGOk0HbA0zuuhfR6ytLQuJFFj8jNkjOaQIqaMisQvmCcQ+P9ydYf
	pdBdA4s5fdPoOlz1XrzZ3HT0uJ1rcuJIbztT0YYxdf9MqFORH9RK2s522jHOctPVaCG5Lku8ia5
	OemWVl81rXvtkVRBKkn+u5+cF2guCDIMJws11XtLPv5AVrWCbq3T0Eqbvn8NrKwZcb71qYEyZLl
	G6cBEsoainVuDVw5SH2SLHBrv7ovAXA6OyBYSSB5kDkzPxAoVuugQLGt32RaylMw0doX3BveYk1
	KANS14GqHBfXTyj1otHoSnIqmhjQ=
X-Received: by 2002:a17:903:4b50:b0:2ce:b3e5:3249 with SMTP id d9443c01a7336-2cfa95213b0mr21245765ad.18.1784800832926;
        Thu, 23 Jul 2026 03:00:32 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2ce:b3e5:3249 with SMTP id d9443c01a7336-2cfa95213b0mr21245295ad.18.1784800832306;
        Thu, 23 Jul 2026 03:00:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3149198adb8sm8920572eec.4.2026.07.23.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:00:31 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:30:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: Allow shutdown of crashed processors
Message-ID: <20260723100025.75rgmzv2drb7ufgo@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX0ISf7bwADtas
 wrITBPKyDH3ZADmvoV8qnbgy7pytYWh5WLd7nWfE91RYI/vZdJULWEF7f6wykYhy5U+z1ryHXoX
 YKrOmX+ZltSRj9Rn8esMHoi7EMwOnXQ=
X-Proofpoint-ORIG-GUID: rOSyBc7ovViM-P3QHbPXeO6tk5c5OQQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXzPrXNGcKiLB4
 o2qBRAEt7obO0krszfEdkbtZqkqKd+CA5mq5kmh0IfiVrO1h/lKGVw/dgvPvOdMP3zg7CuuIvQE
 QEQAr+v2OZKulQzVf+8eU8v71GBV8XKVDyAl7HLC7oSz77V9CES+U5irBcm3EK48lD4R8jxEWF7
 xKihPpAyDAUQGnoFVPcvBRP3Diiqs2P+lWWJE+wSnjzmtMXnqF4BKk/aMFbFCirysM2vKvzFlZA
 44EeZ/FAY5RP/wfZzhKDY8WfLxlwlivLexGBDkYR9sfkiv6dWu2MunOLtj9X9SFR5XJQJIDhMh2
 4Dvx7nwt3T84SLwWhoEoWNvtEjAxnjn2++6WYWe2xZV+4adTD8edxgv/iTu82utuxubdKnx7yP1
 8Si5WODvBMtSeGM4s6ChuYmXK2OfXv5uIohx6mLeaGNHgqWzuC3677rx+s21XJnfmEj5AGgPPBB
 NuuiGImIekw7auLNR8w==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61e641 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=olGLvaFp8OSokbd0vAoA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rOSyBc7ovViM-P3QHbPXeO6tk5c5OQQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

On Thu, Jul 23, 2026 at 03:52:27AM +0000, Bjorn Andersson wrote:
> rproc_shutdown() rejects a remoteproc in RPROC_CRASHED state, and
i> rproc_del() ignores that error. The result of these two decisions is
> that a user cannot stop a remoteproc that with recovery disabled that
> has entered a crash state, and removal of an associated remoteproc
> driver will release resources without first stopping the remoteproc.
> 
> Allow rproc_shutdown() to stop crashed processors. Propagate the crash
> state to subdevice teardown, to allow subdevices to dismantle things
> appropriately.
> 
> Assisted-by: OpenCode:GPT-5.5
> Fixes: 5e6a0e05270e ("remoteproc: core: Move state checking to remoteproc_core")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0583d3a56212..3cd4570513c2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2002,6 +2002,7 @@ EXPORT_SYMBOL(rproc_boot);
>  int rproc_shutdown(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
> +	bool crashed;
>  	int ret;
>  
>  	ret = mutex_lock_interruptible(&rproc->lock);
> @@ -2011,16 +2012,18 @@ int rproc_shutdown(struct rproc *rproc)
>  	}
>  
>  	if (rproc->state != RPROC_RUNNING &&
> -	    rproc->state != RPROC_ATTACHED) {
> +	    rproc->state != RPROC_ATTACHED &&
> +	    rproc->state != RPROC_CRASHED) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> +	crashed = rproc->state == RPROC_CRASHED;
>  
>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
>  
> -	ret = rproc_stop(rproc, false);
> +	ret = rproc_stop(rproc, crashed);
>  	if (ret) {
>  		atomic_inc(&rproc->power);
>  		goto out;
> 
> -- 
> 2.53.0
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
