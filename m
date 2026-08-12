Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DF0289E13
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560427; cv=none; b=BOTM6SSpXNdyyEDRiVYLPhoWa+HgJ3lmRRQzjC/tAPyoqSv90nZIMPKgY/DdHjY1llZtLDpAHQHMZNDspT9zHz34yOvXp6JILUPdLR0MRsySHh9ucGRlhyH+cdQQLNLnSkYsJAuPrsUaK4yggnpukhCUY1ZCEBWNVk8GqrjRefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560427; c=relaxed/simple;
	bh=vgLcBFjUyF9dsrQARImHXFlbmGo8PPdF+S5lujB9Py4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6CykgDrJ8r0JuhBt64yvRyWLU5p007Nl0KF7qXQLZsQJoMghe5v9F2NBZ5ugyJ4Wl7EirlrrJTsCEWw4Y95TJpq59dMO8X9tIMKR6cVwOY0vHaHfqmm1gnkK5DRzSr+MFM4GrmAutnvH34iJEHi/nKh7FWoOIPhfq2HbCy9in0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErEW3HU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7xlFNME; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErEW3HU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7xlFNME"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8PGB000690
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 18:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+9KjwlB+VepBlVYOnDYLDplB
	PswkuldRjCac+kgR9nc=; b=ErEW3HU4rCmis8W9Rx1wQdw35HHUWPbpH37tRq2r
	/BPMzun4rk9ZWt0CMq8IwLXztHyfrO999oh5Ut+kiEIfCGLJE2k9IFB3mGOBGFXb
	kTir3lIgW+1YTLiXJPJSeu3Ly44LStpujXHXkcTFgHVQkVxOk6amPxCnlYk0oxSn
	jzkyJcEDxnOiaQmVdwpVMu9tzG9/tLjvu0bnicExrIS54Lj3GnHdI1U2kmgjN9kh
	pw8kt06ei/8sdBqlNZHfnIvgVNzhY8Q0lS0YyEbrSJ+41DhqcDcXaEF6W+WcLZ2A
	W4AmDuKHyLJhr9txBHKACStbyTrk12ZBGO4dDjrNA94HxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts0v77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 18:47:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so17698581cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786560424; x=1787165224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9KjwlB+VepBlVYOnDYLDplBPswkuldRjCac+kgR9nc=;
        b=R7xlFNME9QhiWY2SQoGxminlhJ+MRYBG/VpjG9hFxJOPdvzCQX9pCF9v2MKPqrr2y/
         IQ14GmLUeg8XITUxdYYc0tkF1TRIq5TC4qfnK5k36iXIrGQ6wg5j16uPu+CLj82fW+5J
         Sht8OWnl7cfpHUNwDVFA3L8bwPPfGdN6HzgdRu9mwf9FQQhQw4NuM3qd6uHadWi7HbJx
         otQdFb9HcMHwUmIm3RfJv1+jW4ZeaiqyOUSbYICaMQIAX+jEYLcx0Q+l+yIfBzVvU5RQ
         rIsnCsPk+Sgr09Xs2hmJzevNm93aI69n5eTcHOtd3rgwHk5PJjKdIosIVLG629tZLMSQ
         Tnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786560424; x=1787165224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9KjwlB+VepBlVYOnDYLDplBPswkuldRjCac+kgR9nc=;
        b=E8aEw+1Lg4/ufUrVmq/Y2RZ7b7fohM+mh+VvDMjKE3BK/naGLjfdgQgIIuSMhnwjDa
         tBNnriaWlCk39H8ciC11xOWDKcn1/y+13Qm2weHnWJz2jL759NIfbc67KrbBW8ji+AF+
         I2QbeWtmt0eQFao3nIrg5W2JYQMFXUjxE+qcmcJ0GTcr/eBzU9C5sHSTNxR7VvLyyLU6
         5Yhy/be5X926xArxKTOMdn4L/zWU29uwXq9cxTwViZfpfDhvOgHePKBAT8526/MY40kY
         1MqtucYoiOJMH1ocPRiGqIyyZXU1FJyPDHE/bZbgIlhniQj18ULiM0LaANtDXlZoQ1fg
         +dWg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8W4dv1xoQLN71do9IYb1Ryx/bvVhuQjsfNjuMe/L4UjOz08LV1dJ0gcOR6E959kgKEb+yHOt+rfWlrbz9@vger.kernel.org
X-Gm-Message-State: AOJu0YzAOfzNlrXDGheE7vLilFpIgjzeWkCV5hmnzGICtWR3dNd7/64Z
	9C+1maj29qSY4E4o1ebM2uIQoGgN4WjZo/6hXyqBPloxah6j1H0Daf+SJv2BVhVwiFaxwayNgwx
	Ntj1kMbhzpzUerUfHMNoHO1RJPpE00PUn3+39sSsklNcJ6eCqXxseEDkZ4PC436k+QFv24f2ZXB
	VX
X-Gm-Gg: AR+sD11W0LjoD1kZeejirtS+n3E3DHkVDee16kefX7Lq6E/Jrrq9IFVMiN74MzOqPPb
	X2uPVvqzT9LUYjE4Ox33ZhJ/Lj7d6h46KppuCEU1x44C72Jmg0yUhY7E9n3iwrJxkqK9klZ26lh
	lCor1UAGJOjM0zsRY7DdPpjzFa7MvLPGv1IqHeDmgGWJmPAZ/rqcyd/bWeZzghQeg1qgSBVmi7r
	KRil8xYH/5yEPamMknKTQmr2qXRciIzYSM7mjpGs1fdsC24OiUWAVUEnDKUCioo4xTYaQiDABHt
	QxhY/3cQQQgWpKn/h6ircmBRm8Z7A2ho/b3Y0cBE1aChkCyysRZ8q6sSyEDBsEkdVnrV78REhcj
	Q7bNMtCh76W4jxK8otbvX+2DQJhtfbT/Pe+VNtnWCX9zU3T+l2l6wmLbwBYyxKeY52irrN7mx/s
	Id5cHlMrPKu9CQ
X-Received: by 2002:a05:622a:c15:b0:51c:bb79:a52d with SMTP id d75a77b69052e-52d73c86f42mr3220751cf.14.1786560423932;
        Wed, 12 Aug 2026 11:47:03 -0700 (PDT)
X-Received: by 2002:a05:622a:c15:b0:51c:bb79:a52d with SMTP id d75a77b69052e-52d73c86f42mr3220091cf.14.1786560423479;
        Wed, 12 Aug 2026 11:47:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a548d5sm7054e87.39.2026.08.12.11.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:47:02 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:46:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: Constify struct qcom_icc_qosbox
Message-ID: <5nhxxcayafpu2gknp6hazzyvj5q363eqooucfijbmz6oxftkjd@b4rs6snqkhxt>
References: <f9d9ab49e961b3bf3f9bad39f22cf8b06afb2381.1786554463.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9d9ab49e961b3bf3f9bad39f22cf8b06afb2381.1786554463.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: jCINodBGenv0FDAZfoYRQWntNqehGSyM
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7cbfa8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DA585B7Y4R_hzP9QSM4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jCINodBGenv0FDAZfoYRQWntNqehGSyM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE1MSBTYWx0ZWRfX8GIlqW27HtLx
 ohq7YQJw8Wd788tTEPFUde9Kh3sSIAAXMPuA2abuw2apkUeUaoKpQscz6Vx8QGkJoXl4snwaAtP
 5YTRG5hjMeilJZXJuvXB8cai0+GdCbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE1MSBTYWx0ZWRfX3j6VqfvRCPH0
 GNzg15uRjOd2USMJhImr8zbhwTcg/F/G16BvC3jkex1NBF2Lm9gtzTx45+igdRFoR/iq9qvFwhh
 /q7DmD63/c5pjeFGcjUipXVvZZu1BITPpKwEznQ5FuNH4VgbaFfVWwjQwkraZRCspPADoryY6f5
 I0++t2WpqFgQSe3ZoenviTaOhIhbex46cYNmWEZ261ldj9frO5ac1ThU9EugXHDbcm3jE5aP31Q
 ku36WLP10iCGPFbkNZXsWXDJTlzHktyVijg0ku9Wokuis1lunKQiKXPOy8o+PWy5a2owGmfeGwX
 5hW6dab8kXfck4TSoe7jWpLPqgguBBaviQbwyU7ALf6THSYTsGUywgkmgHLrGucfqsFxUH/x3ko
 uoUDjKEtIjYMBiG7WtjdILKoAR7FFLe8ewjGjOd+DfXaqyDtGCgwZhTwwim6Bas4Ls3Oo//PZ7t
 xl1dZMYq8q49mFDtqmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120151

On Wed, Aug 12, 2026 at 07:08:42PM +0200, Christophe JAILLET wrote:
> 'struct qcom_icc_qosbox' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7807	  18632	      0	  26439	   6747	drivers/interconnect/qcom/eliza.o
>   10027	  20176	      0	  30203	   75fb	drivers/interconnect/qcom/milos.o
>    8768	  22640	      0	  31408	   7ab0	drivers/interconnect/qcom/sm6350.o
>    7626	  22000	      0	  29626	   73ba	drivers/interconnect/qcom/sm8650.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    8095	  18344	      0	  26439	   6747	drivers/interconnect/qcom/eliza.o
>   11079	  19120	      0	  30199	   75f7	drivers/interconnect/qcom/milos.o
>    9668	  21744	      0	  31412	   7ab4	drivers/interconnect/qcom/sm6350.o
>    8746	  20880	      0	  29626	   73ba	drivers/interconnect/qcom/sm8650.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/interconnect/qcom/eliza.c  | 18 ++++----
>  drivers/interconnect/qcom/milos.c  | 66 ++++++++++++++--------------
>  drivers/interconnect/qcom/sm6350.c | 56 ++++++++++++------------
>  drivers/interconnect/qcom/sm8650.c | 70 +++++++++++++++---------------
>  4 files changed, 105 insertions(+), 105 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
