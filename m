Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDDC448B99
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819795; cv=none; b=rJ1imJvm+vaYNhQkv2R5+XvUX+DzqvoD7AaGw5T5UE4Z9gpOOzL026eLQ09ZIEiIgTE+97h+s0GVyCZ2wiAAHFRjfQUiLDP5wncf+KAoeGM9MErXP+oRmCxa7wiOOXI9h3lTdssnzG3sQY/V1wFg9cOI1as/V7UhSqYDlUmLv1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819795; c=relaxed/simple;
	bh=9VljpofNjf7N5SHt8GKoqT49v9Bkfg7CwN4KKMLeAIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH0leJTifruSTAZoXj1YMhD9f3bZo60xrLLvYaZelmXio0lVCkOSdXyuiykkZ6PPDPRsmKDtUXRooU9pj+Q1Ze0wn9SojdDuAZ9ngbCAbEj6G6FTgqCOr7zGkvoBTwZ+4dvAoV401rAqvfEfeUqVFRa/pJyRYO/amKFwL03GCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnIhWsGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWcJR8u9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnIhWsGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWcJR8u9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvYs33951483
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3D9k9IuWKG8KzLRWSZ25gx89
	8qBW9qkghsGTTfmjveY=; b=WnIhWsGlRxWxF6WBm6LyKNQQh7J0maVXNe83S66A
	OFr+/402ghA5piH2IZJlAHZdnHoLVjp8U46FE0sJguOKhrz8SufS5Dv27Cidw9t0
	Uxp+0fcK4/56yIAq2OZU6Oy52+DAheXSaLx5OidOGzcHlrC9t3ETAQeUwO5E+NMO
	nwvvo+nWwLVafIDeEnvuvEKIQPg16ympUibN8ApuokJKxxE3kW+6rnfs+gy6EE0s
	UXpkv++kXcJKAKUKljR+N0kjR5A2jWAGi4VicoymH+Tv8UoFwLN1OrzwlpRSncM9
	s2SJajIzqblp9syINPC/JPEyfaWMijWRHprVI+baHLbL9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu8xxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:16:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so13145715ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784819787; x=1785424587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3D9k9IuWKG8KzLRWSZ25gx898qBW9qkghsGTTfmjveY=;
        b=QWcJR8u9HygoVx3ohhBBkynkgiKWUBpjBPCOD6JABHaQmPfstzwp10Mx3TQVjfMTk3
         9Losa7MKNo+F5FdPbSynQq/+4z4BLJPcOgNAUoy4A+H1X565bmHrv21KqipatzlzWZQd
         d/6NAlVa4f3p89Ccb+EqW1nuM/tkWnQB+9obsfJwsnAbIhBc3/2F8JkFvzwXjzyFemir
         xhIhABK067CEmYarrLrES9nFYFlalN/J5qb3h5Vs0q4L/IbPsgeXNqV4eHp7t+mAJlqn
         lYiHkQqjGutM5ofYI3BL2fZocdJeYTUpSQXeJ/Ok0Xtm14PMSkGr2o/GNvS19cxcxc6O
         oCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819787; x=1785424587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3D9k9IuWKG8KzLRWSZ25gx898qBW9qkghsGTTfmjveY=;
        b=WN9Jkv/3QjbxGyFBAnKjQrckJD3V0zHfYmdgn0Im8L5zam1kF85ShWUvxBkROpbHq4
         m12wuNJPCXC9mUy4QB0PnWYlJugYnz3v2vSjQpAwEM+4oB/oPyXC8zKhrH0xUq9R+Moz
         Ni25qebciIrKQg0gkx69XJAiiBb6wlJBoXLMGqovN67anPZeoe12Vv5OYCBpk6u8dhBO
         CNS7zMmc4VIbJpYvtaIfYS6j4VHMiLU9e3FvG1fziY8zHpccgFurNNO8NDujJ64bDpxz
         s3bw2gOGop5A2ElMf7xnMnjeL8oM/MUCdoxZ9niKwYiLmRXliPcsoOlcbbp0DAvKcvWE
         Nz2w==
X-Forwarded-Encrypted: i=1; AHgh+Ro89B4Apl5CguGopB+KBlWM0TgwKQlKYAbrqB9chV2jPf7VahTJ0lYhpHBjKewXxPG9Fe1RzGb1vYNb/moR@vger.kernel.org
X-Gm-Message-State: AOJu0YxNXFMGbXlrzdy0QvoAWuRCWv0aiDM/LVIvLPETxlyxrHZDK47h
	ohUpzKvGbANQ5gjpB5gmhGrCNl0oK19zcgQedDe+Jj4MXY/RJYxHe/b3TCFok66RT4M7vqvB8xn
	pQxJ20EThfxaa8WvHSQK4yVN9tZElZIKkhiSDiO4cqIEkDhZsBy3xM7POLlP5ISjADPIM
X-Gm-Gg: AR+sD13MH71AcqhfCIWsV+KrUaaFUbweU1IjmqDLn69gm68irpDPWg/VVMPcJN7ohg1
	NsoCotw+1N75UiaQxgg85ZpkAA5bkp6qQzmKpp5sCfljXWNnYbe6S+l9mUHCYy322VZNhr3+1Nl
	UF81NQloi+iYUahpiIYnEjzFABVicXo/AADWeOBzBH6IwEZYpNB7by9FsA799ff4ZkwS3Q1DdVG
	S2CE+oWlkr6j669FBHMobEsSA4GPzsE7NDs+HP7FOEnddzp/h9E2nX9c07V9e2qETiLRadjFujm
	lJYfNPVJr8EPnOQnl2fl78ojgJVjLRga2GcgZKiCsHwzqyXat2Pd8PVptt3jf/8+/lf0atyoVS9
	A5Te7sjMFOagO1aMBV57bPf5h4Jw=
X-Received: by 2002:a17:90b:57e4:b0:38e:4b71:8b0 with SMTP id 98e67ed59e1d1-38ec65663d5mr3416569a91.25.1784819786972;
        Thu, 23 Jul 2026 08:16:26 -0700 (PDT)
X-Received: by 2002:a17:90b:57e4:b0:38e:4b71:8b0 with SMTP id 98e67ed59e1d1-38ec65663d5mr3416531a91.25.1784819786393;
        Thu, 23 Jul 2026 08:16:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm17563890c88.8.2026.07.23.08.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:16:25 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:46:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <20260723151619.jmlcpjog567tph7u@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
 <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5q15fks3WsCIdPay7fDvYeoOY8pDbB2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0OSBTYWx0ZWRfX/+8lTUGVLCjy
 2X1c79MUroq9TnU/LuGCQzBP5TNYq5N90p+WWg2I2oybk2BR2dm4xoN/Vong/qeBTBcxbwAWs4u
 SR/ry0lrdWlVrheXPtQzc6GrJRC4OkXknt9i99oEr6S4ooK8V3sDfUbwdp5e9MViEwCMSfpdGE/
 ZHYrqRCBoQgJqJmKgbM7/03faH+iioNwKTXvaWiGDK2V8BWmeIp79h31JM3QaDDnwZl9iqAifr8
 aWw9q4FBKxujDtMTkqi3D8bJYm5LM1OGDWePAtIbCParjb2RUewVZyEZDEvTakId4W9NJobQgqG
 q0OtXYhOkgYw10Fg4ahn3jOMuRrfoAH2gqRgyWhcylzm/nOg7aLUJ1b6nltjRWYb4h9jWWAvpMW
 NNpetUrJnLZ6MZRO2qcUEylV10D2b8KXoSZzt6IHY8oNd90nMlD4m5pOfntYMxmFHJ7NupW/sxo
 mUbkV1XmPZi/H0UhulA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a62304b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VB_B4jqjWnTxunsdJOgA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0OSBTYWx0ZWRfX9t1I7kn8CO6J
 rf+3Of1HQ777WwmQSZtCin4XKwIYxle9pbSzwi3lQxArv3RJ3LfWp/nOdfP/NnJgXN26Wc50uug
 jYQVFkSuseLOZntltzV2fdvJGvVFmnc=
X-Proofpoint-GUID: 5q15fks3WsCIdPay7fDvYeoOY8pDbB2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230149

On Thu, Jul 23, 2026 at 12:09:52PM +0200, Konrad Dybcio wrote:
> On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> > There's no synchronization between rproc_crash_handler_work() and
> > rproc_del(), as such it's possible for a driver to be removed while
> > crash-handler work is scheduled, or even executing - resulting in
> > use-after-free issues.
> 
> [...]
> 
> > +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> > +	if (READ_ONCE(rproc->deleting)) {
> > +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> > +		return;
> > +	}
> > +
> >  	/* Prevent suspend while the remoteproc is being recovered */
> >  	pm_stay_awake(rproc->dev.parent);
> > +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
> > +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> >  
> >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> >  		rproc->name, rproc_crash_to_string(type));
> 
> GPT reported that the rproc may be gone/deleting at the time of
> this print since it's outside the lock, so it's not a given that
> rproc->dev and rproc->name are valid (although the window is pretty
> slim..)

Yes, this can happen if rproc->deleting is false and queue the
work and other thread cancel the work, completes rproc_del() and
now this thread running dev_err()..

-- 
-Mukesh Ojha
