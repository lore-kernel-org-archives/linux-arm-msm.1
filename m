Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19FD42D75B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177597; cv=none; b=Z8G3gTBPnyhOYNWGuk+f7K/ZNlYZy1b8zMH1Gu/vPkBHgco7HFjQe5RLLs/X91DgrT4Jp0K1obzQ422E+KOn0TojzXhamIMvQceUS772Gx9XoCs3J6cJP0+hX2nXpHK1vlnpzMdK+SX5Uk5HOFTYDtqM3atg+WWxUawV4Lq9zlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177597; c=relaxed/simple;
	bh=37zguWih+b1UsT/1ZAs425jIctLpVxmJlwIfFLGvVNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6Jivv8cTUQQhZOrsuEywQztWXt2zKj82Sh/4hn/tCC/ZUgoBEdvs7q67hkCuCFFk76c3awbjAC78eF+cYJXqNojCtwNSs06O3fPgNSj2105Ebuumh5+PCB/0BMMe9oZWHv/r19AxJDHBrlCIRda3wdbb468sWyWLtcPNbLQefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLYug4lU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQ4qaW2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLYug4lU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQ4qaW2/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICAex321874
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dc37tfIhue0wL8SZOw1sGO1g
	+jEfLA2LSgFTGKid14E=; b=mLYug4lUNYQavzoriX4+2X+aKdF1BXiq41jo+ptT
	x+HzCYj44ICsmvWRRcdfokZu/8JXxctTTbc+92Esum7WPtk55MCWoqRrFLpYg4OS
	Wx32g1seYldyPSrFdUkrOaLVZAxGwy6sVEgUY9wJd2dJhIaTR2oH8EPifk/jpjfi
	YmfoBJXVOOGO98nru9ZXzvEvkUBiyiTVfpLnyXh8IRyiiVyPrQD3o57GSvAnfxe3
	468iZcBkWVsV9lzWRKmWTdctiWfPowyESt+N63J4tIOfpeHwPwubh2dlPXbpr2Vt
	mS8dBQa8XAcq7GJVE/lz+xcrj1eAQ73AdGiiPXpfqVdypQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4ukta0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:39:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so30505515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785177591; x=1785782391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dc37tfIhue0wL8SZOw1sGO1g+jEfLA2LSgFTGKid14E=;
        b=IQ4qaW2/USSd4za6E5CMXEmlY0HBOaWvYCZYmAijRnPbAkvtDKNNr+e6SzAalNKQrF
         DxYt5U0OdV2hhq1T+LbsGZyQefuZCCTFOamJuvC9ihTSFhUI9GXtRtXWED6naSj5HiP1
         RD1WLAta2Y7s2+tlmfFHLt1m5/e9wh28CHj5TAq0parmvqITiBU7sH9DZa+JxKtF1KMX
         JcHRHDOOUkebTR+iTcb6+/cnsJJcz5S0SP1axzIuh3JEtEOIHBajlkvtc/5XAVsIh+uF
         iQ70lo4guj4F8V/+6XhhFRQhT6NKFyXdaZRe4yaf0BmX/eNOgYVCvExwd3RVtNGXuK9+
         wAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177591; x=1785782391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dc37tfIhue0wL8SZOw1sGO1g+jEfLA2LSgFTGKid14E=;
        b=P7QnE6K8iieRCsJSO+R38r1Wk06VDSMFzgXrmJsrruNYrjQQbyWl2MM2celU9OaZAa
         a29vkmoErGKAMyt83MBtn0Ln5f8l0GnWtv5YlNxHwSzVSlU/T6UrEre0CvPlBYS5z8R1
         h19RKZiU0nB3eVba9QMReKWivB4ZtI3KJJIGfGK98KvqMooIB8YgH+LYwFGwKcc6ld+D
         ulhxN7zArUnZBED5ewS1ROQjdQFqabLSf0YI/gX9pgTO7OA9KQIKNqTiygyD41jDx3MH
         0La1uFTLrYOH5Q2kN3j/ACyBUgJNUpudUwCE/mEMdaYs3VUHqKKJBQE46yegHJkxCFLh
         d+5A==
X-Gm-Message-State: AOJu0YxPlFF9n0itNJsVW+uaiJPpZ2J5O5jApE5PHUAGzXGX+IRm1F+F
	58mqnIf58ZBpAhzoXwY96I6HSJCvGikVX/1NxYdbNswd2axQfn+IWB8gTeYskXiTdB0OPW3Gwbf
	d51JZuxXbZnPa+GUYewiz6BtZdNoPQUrK7G8EUMPfwqCD8z+BeGwa7gThdAvZiKdeAI1m
X-Gm-Gg: AR+sD10X37eC1lYWgZRdSBSU6yYJqMMymreoj5GLCgnfqH8qydJrY+zFvPO9OFAy52y
	1wNLO55kTsC9Qk8aqc/vcHWvZ3u5mczXirV/r68adx66AODurUJSdHxbpJQSofK2+tc/aH+0Q6F
	X+FzjXeEcXn/IB+s6tByF6TaAuTJBOR4SmB9OMBEaI+rKmRBMwZpmsN2YzG7RBfaCBYpmuWknMB
	bLOBEZQOtkzBTJ0xhSQ8Ijf8CU4WnvIexNEGElxcwBexF8qlXk/v1eqeLiQ/WJ+eRuV1d144Zzk
	N8X7eUPw5wmTvhHmbPuyXlvbFnUC7yeE2qhe7Igf5Qht/zC0JsEXXstRYRyGEvEGQLNKsFt/sFz
	ubkOPlmCvW2i9jx1XtydXXuRsM3+vJ9ywag3MQg==
X-Received: by 2002:a05:6a21:339a:b0:3c3:90de:60e9 with SMTP id adf61e73a8af0-3c67dfe0e07mr11436273637.62.1785177590896;
        Mon, 27 Jul 2026 11:39:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3c3:90de:60e9 with SMTP id adf61e73a8af0-3c67dfe0e07mr11436239637.62.1785177590465;
        Mon, 27 Jul 2026 11:39:50 -0700 (PDT)
Received: from hu-pdahiwal-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm90229752c88.15.2026.07.27.11.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:39:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 00:09:44 +0530
From: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <amel8GzMOTlIM8jL@hu-pdahiwal-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-GUID: X_jkS50mVAKk1d7fj3U6XUjVxfQrlPNj
X-Proofpoint-ORIG-GUID: X_jkS50mVAKk1d7fj3U6XUjVxfQrlPNj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MiBTYWx0ZWRfXx9Ntpoo4myI2
 TNafIcZe2LRnN4+26NGDoAmTYgI8HtXWBG7kV9V403/d/POyGGuMfeAArdAmQbRdjM86MWp7wmX
 7qWvmU2wDhb9P/9r8s6P+9vhM64AwgY=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a67a5f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EbPn-TOec6_ywVBdj94A:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MiBTYWx0ZWRfXwSTPW8cHrwM6
 5FzrNwnxeKZe7mtpP1l+nbSRU6lYBCKFObzxsW/k0k/GsjwZc+YfOb8SvJVO43Nkf+aqqonYst2
 2z49whNbIVVDFVfDlI7AUJWi8UbmIfkH10y+JrOc4RjGTOm3ubvH4RxF5iLPTISycBUXrRX1Y9l
 1z5FZPKM6xP+icv4eDv+2f+OM2RqPeOvX8IUDVgpjWgxTqqJtzMkGCd31BzF7jghqDDGq2aStrT
 mbZF25ZVditwQSMchpvvU/2nUP1dInRS7fAgU30s2E5eyzCxEq38HNIPcJeeogqd7nAlkl04pOX
 g7gMq/qJMBQVdB2b4rxH/bHWqoXhrAzm9t2PUHWz9KLDocVtuFdR07iuD7HPbp7YT2BiOz5WrbC
 jh5u8DSyxVQkmNNtdE4ijjotayz8mfiTyFewwUpWI1k6QOVvuaclPMN5uMdYuRwqE0qYhC6S4D2
 Fv9saYQmABn2ugADSSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270172

On Thu, Jul 23, 2026 at 03:52:28AM +0000, Bjorn Andersson wrote:
> @@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
>   */
>  int rproc_del(struct rproc *rproc)
>  {
> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	WRITE_ONCE(rproc->deleting, true);
> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +
> +	if (cancel_work_sync(&rproc->crash_handler))
> +		pm_relax(rproc->dev.parent);
> +
>  	/* TODO: make sure this works with rproc->power > 1 */
>  	rproc_shutdown(rproc);

rproc_del() cancels the crash-handler work here - should there also be a
matching cancel_work_sync(&rproc->attach_work)? If attach_work were still
pending when rproc_del() finishes and rproc_free() drops the last reference,
could it later run rproc_boot() on a freed rproc?

rproc_del()                        attach_work (still queued)
     |
WRITE_ONCE(deleting, true)
     |
cancel_work_sync(crash_handler)
     |
rproc_shutdown()
     |
device_del()
     |
rproc_del() returns
     |
(driver's remove path then calls)
     |
rproc_free()
                                   attach_work runs
                                   container_of(work, rproc, attach_work)
                                   rproc_boot(rproc)  <- freed rproc?

The deleting check inside rproc_boot() dereferences rproc itself, so it can't
guard a freed one. The request_firmware_nowait() / rproc_auto_boot_callback()
path looks similar.

Reviewed-by: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
