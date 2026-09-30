Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C850E594
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784442; cv=none; b=AE62kYs1RWplIMenhQEWc28ytsBSC5Xk4VR/I0Rg1wthuKTfS0rm4mKcYCDvOvxjMpgeZr3LgVDr1XJUjPee46HcH5qzgcnDalYqDLG1K5eW0eoax3VXPCnTetlnfV7jmN+wrEccvCly/LCp+3t9WFmlLMPZIQXC5awiUPmFY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784442; c=relaxed/simple;
	bh=j8LORNlGinO+sLVzCgOaYtUFKiWkhzkzQX9KFW6r63M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1SVD4Nv8DVtxMdt2kW7PFD5Ul4GRgrl1XFPH6O/PtrZ27fE39kUdpThmgMEplG/JvRs8K+4BdvQpMAnH0NZcffAp5kfuxLy3m+gfLeXraRA95MUMwaYpt/T2vwerj2e12+yikeFCKf4Asvps3AOiJzCbGGCvAHh1yd984EQLXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ceg/Sbhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUovToBS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ceg/Sbhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUovToBS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0Htj705358
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=59fvn6HNCxIB5d75o9AyYwbT
	6TRJJUb8uFgR5eg9RW0=; b=Ceg/SbhcGM1koch9h2BSx3RC0GoFx/hQKhQuktDZ
	lPBh6arfjeh/UObm74Ri1KTrpPCFZHKA525CHGg9fn8Q0RehXPxNCJhDZLok1sGc
	/3QIFqci9rQ7F/Brxd+mtc9QRfvianNIZvpaJi9eeEBh9nNJl0Wrbb+rjN9c10O7
	dIyuM5/K5ZJGzHrk1YiTSr21OW9Fbwwnyj/New3naAB6cy1ZFT07LIJi6YiyewOk
	L5sCXR6kVS5FOSclPkLHmu8pDHuY9GFVzAAij17eJts3mEEh2hgcLubIxXZEoyEa
	mzKmFDI7s48MK13Q2027bDDuBheXB6jCr1Zk5eBHs7ModA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tgr1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:07:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so54592137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784433; x=1791389233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59fvn6HNCxIB5d75o9AyYwbT6TRJJUb8uFgR5eg9RW0=;
        b=BUovToBSMQCanTyPom8l1YzY47mANwMBgpJgUZk1OamTt3obJ6JExygCJqc2EHtHEg
         R3HHbx/DqM4zGy/nYG9yWjUoinTbOKsOAvWuJ+Jcnd86RmAZfxW7MFHuy8puWnmZW0TT
         8qieIETBow9v4kyqe+8eFJ/qut/5UDcKvFJxwyd7B+PwpcPTfF+UoqY3Uzbz3dY0DFaW
         VQrRiVc6Z6lnrif9N7xcChH2mUpHSGbQCjwFdSKsLeMzvcB3e1Z6OqsSs9aNyU0C1B/w
         I/DCXDcgZBsBWREwDoWmYQ1ESj5hJleL+/bYVK4fbXsXm9pe9+PFWu5tM5ST0Qnt11JD
         kzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784433; x=1791389233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59fvn6HNCxIB5d75o9AyYwbT6TRJJUb8uFgR5eg9RW0=;
        b=PEl8UWVZDS0sZtgi19kbvG0nuTaM+2vLG4XJi3LDVI+pO7waYdkfCRWP3ahPsb9Blx
         pRLxhipELnjvLIu3bX0p+xSPyb9llCzt4XlS3Xbu36zqiJ4Sr18OKE9IK/JTZWV0lziW
         cy6GcmijfMOoNfm929UwpijYtZHmPaQsE//6KFXqVfZaBNXbtg9E3WN8zuW+wlC+IGJl
         mDNdGVs22QS/2UvxwNXeJmqknSuA7KKbGV5t4AKegK+KZSzqMbl7/aGrp3Bipx87OvVp
         PbwCNSP+tuedtkhpGDXA5yDyUcKSoqNFGG6Hn5TbvnVw/38DXLGlMIrPLfHs20wH/RuV
         3aSw==
X-Forwarded-Encrypted: i=1; AKwUvBy3MYnz/fydBV9bQqXyEHi6CjXKkNKm1Y30toa3cfyVlonFJYQRllXkGo4BAKCdvAwVPztIlkWL1F1NjPpd@vger.kernel.org
X-Gm-Message-State: AFq9FYIp3qGZVCSORyezEHq7hONNSZ0mAb2EilXf9NKO23/vtOaqismz
	tPyR0jOB7P3ktdbxw+3aBrjttXd3ykdnmepYglR+lMEzJgzkG6mc0ddf1JQ2lPnvpKN4kjyA3dU
	5kaahIbi2GuNr4+SHybP3e4YNn28yxocVw/I42tBUcyu2rEQv4cXeeKVDauQNKmaq7Rfe
X-Gm-Gg: AYBFou2Xj8deDpDJ00ckmodkg4KZNRPIVc5iL6qdmmSZ/gf06IiHJLyCAYrhTTvY0QV
	X9K+bm1DOQ9Xf4n3+OPaHqM2cPjaNADKjTcXmag3l6nDehRIz/gsUfzZdmhiNHJFZ6h4HG3czXP
	gsDpRXW7CUJrNOE0jGzIBZyAAd7iNWhnesrjsdzvaXxNK36qPCuojK+u6uWmyM9E8BskxsY8Nli
	SB+Y3WvJ6HAo3TkVjxUQjSqloFSab46JfGYqv3dm51OOKDNcrhv0BHJ6NnvkNEBgXWT3sdgp/bl
	zjMCJr/AV25zwIzwGaeZzHiIDeg46ZXUixDeVnseeUvEy2qvnPGinI9n1sTtGtvD2+H7tnkSLPR
	h9PTNfJ/2K8P2zunQs3F5P7iLrb85AqHCfX7xxjmbJiBRyyHdZT1ncxCwNAaO8AyAbdKeccdA+m
	bXvBsxt7epkGZn
X-Received: by 2002:a05:6102:91d:b0:7a8:6ffc:1c25 with SMTP id ada2fe7eead31-7be72ca7984mr386873137.18.1790784432747;
        Wed, 30 Sep 2026 09:07:12 -0700 (PDT)
X-Received: by 2002:a05:6102:91d:b0:7a8:6ffc:1c25 with SMTP id ada2fe7eead31-7be72ca7984mr386837137.18.1790784431400;
        Wed, 30 Sep 2026 09:07:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faa8cbsm82075e87.23.2026.09.30.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:07:10 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:07:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 04/13] drm/msm/dp: Serialize HPD state updates
Message-ID: <zzsqfw3ncrse7mtxrp5dmny6fd3grtulhxhpawo6gahugtu7ft@qqshhudt7jen>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-4-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-4-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyMqrZdQs+k8N
 wGTjw8qu86Rmhds4EbM7qd4fuiqDqP0pu12aRDArV2+b3I1bYSljEU+f0n+pSRq5OP+y7OZ9DLi
 /anJLF57QiHlDQ8zqtZp0OSyozs282s=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd33b2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=zIYKY0NWTygHEUM1x6YA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=gYDTvv6II1OnSo0itH1n:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: ysCtIYkt61p4sZmKKCFsTBcUYp4O2jzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX+CEv2sDvt5Az
 KKCibiiQ+bCyliDR+NUE0cBOBzLtzceYdMEbW3896yiwGxGHx6wuTPtXgewjUaPWqguUQc3bxTM
 s0AAjh2Io/GaWLkacDggVY2Emg8QpuleRs0gmiHN2p1ugZzGnI2VzIXW8+EdSGUprionQDhVeeD
 RLH13IkQ7XGVTnvOishp/jNW5NF3ovF88dC4IrenqWz5A6tIJSvW+mJM9Kvcgza3+9JPFRMTJ6b
 /ALaF8UkrD7YNrq6zyGRF935BUbEKcqM9XFFl+MY3398onoFEsVFjKlR8BR2zAcBeHGaMjnqQhV
 3NUztAOvnbHVde9JPsvFRIgGcojtT8riTfADHSpa91zGZBb8mzdKGhEV2kfsnltqxXOa4jcpB5I
 byOaG0R20yiyHgc+YX7f+Cbdu/h/bWG2tJdctmhqcIPQ79SN1RWXzmKhEvMB4zVHJQYWPg2DN+0
 s1He1LmUc5bG0XZUv0A==
X-Proofpoint-GUID: ysCtIYkt61p4sZmKKCFsTBcUYp4O2jzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

On Wed, Sep 30, 2026 at 08:41:48PM +0800, Xilin Wu wrote:
> The plug and detect paths hold plugged_lock while accessing the sink
> state, but IRQ-HPD processing updates the same state without that lock.
> Unplug also changes the video-test flag and AUX transfer gate before
> acquiring the lock.
> 
> Cover those updates with plugged_lock so that users of the connection
> lock cannot observe partially updated HPD state. This also lets stream
> failure cleanup decide whether to preserve AUX while excluding HPD
> processing.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
