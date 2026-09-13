Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0C3E40FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343465; cv=none; b=BurQw6VSpRa7Qw1g9Gbkr0QUJa7UoayzGHLVip/Wh04M15p3qX+aWoTWSUfmqw6/gC2BuOGIZIxOcwHDNOe2cNEeZLFaWaG1Jfg0gc71owlXG/E0ut3rfA0MTsSc6sDBmgFaWp0jmP/byepw5fUJiqYHx5wvBJYwjCNQ/2FZLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343465; c=relaxed/simple;
	bh=p5+9nTdkKqAXTX4kQasxfAOPRcmCFjL8NQDhgdpg1Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2+coLZOZ4hUv/PC7Xew+HUbp/maRx5TS/YwodW3geczuzlIO3a9CB9jIPoYKfRPo0ZrkGHgbxemjcQ6dwu/bwt9m7EnOaukfcT9y1cfCDLAZlKz7fZKZQp2RZ9NoA28T43HvLQrEdx4qEtmTabuXRYB7gxKxpRcY+Ccm+DJfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzPkO/LT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUoy/ntV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzPkO/LT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUoy/ntV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNZ42X2359038
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WdFMlmauPwxaVbgf2YMHJgMA
	PrT9/NnB7w9Jx4opmZw=; b=LzPkO/LTASUrCu8bMp3vKWoq0UZutRrM5M8jGYJP
	A8NZ1JwKpiYq+CvFymCSgTfoD4TrZXJ//ZeknSxXaGDfgrvmGOEhBH842JdlkS+0
	rTuYHXLq/JKCHi0M/MS2JVdmwcsyBxJfrBnhAGHiZeidDlEMmfFlbZsIloEKN3Xs
	Uxh2fA+uegD4dQdzT8iIMVdQSrfcyLD+5ZAKWSeoaFa8xwUwRBwwivYTTrbc+j7t
	cYJHVL/hHgXyRCII7aymQtsJ/41TG7D083/kVSGIcgu1zOJXP/mbnyBhhTLdHcaG
	ct6l1vUuYDBJ2k3mVKbfLL7DPVliAxuxwWyRCrgr4of5fw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018m80d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:51:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7909e307799so2694721137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 16:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343459; x=1789948259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdFMlmauPwxaVbgf2YMHJgMAPrT9/NnB7w9Jx4opmZw=;
        b=cUoy/ntVSHBtlp0xOjKr+qNrV19cPgbyuSvuP421g8d9cGEkdRmcXg7tUFNZPn+An/
         AhIxnbYJjnk7QQoXl+2du6Ki5FB/1+m+T5sgykgUTVEDcQGqWrPJ5NNR3FEQBLsU7TTU
         8qTr9S2E589ZT2l4/6jcUouvHoeD8zlhsEQeK9LV6XcOAX/xCxCTiBin1DCpJohZWVvj
         XGchc5nZ6eEQMbgMA8QCC99PQgXjOomWE8r1olEpN5YDsTUrjo0XH5WETmiDv13ZPU5T
         gOcPwC0flRXXO2l2FAIYcaedb3P0hEyHavNywjcFQheWHPlM1MRy5Iqu0f/xdZYG4+45
         030A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343459; x=1789948259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdFMlmauPwxaVbgf2YMHJgMAPrT9/NnB7w9Jx4opmZw=;
        b=LLztw1eOwV1x2NHa/ZPliCL6FHC1cDHiHFQjvmVrbpgBy/wQE26H4mWuCs2QUs6rwS
         dC0BVixdS2doeBmPzZk8IL2gwrs17pfgsdi8qDrx+3brilScDp5yk6AyU7SEFBYlnFUP
         DXUESM9V60U4PTdNusmsMsQOCLT+vPGVdzRpOXGyGYi5vkH6UJfKWye+BkEmBTz5k/5T
         WVRwURewT1hYcHFDKUecToURG2gB9XfXVWrb4szFCxDZmM2L64TNNhLxg5NZvxmIR/wk
         ie++ZCb8Q1cN243aii+RV5MFpP7NZSc4ThqZTUuzUK9T9drU/mkvH/FL6Jil58NAEmSu
         +XtA==
X-Forwarded-Encrypted: i=1; AKwUvByO4lMY7yfn4pHeuHRYpk3QDXqMifmcPecGmwmaCxjWXwe9U+It9BVe2Z3zDMABCUXpk5+tPxvaCRHH/0ky@vger.kernel.org
X-Gm-Message-State: AFuF++lMf6+fhpDTcQbwvdDw4CBf3Kno5guzlZLRhSVebzLwnYyWaNBZ
	OVdlJPnBQphmeZAx/9ltXwiDn4z4w1w0PLm98GoT1KTZAygiTSDTpzFUO3J/nvgs8i7N/C0dlaJ
	XOmvZL6H3Zm8upiPmocc2fgNjq4e2KecfalmLW90QZGPUYRwvj+L9YPQX2HVOJa7dfGMZ
X-Gm-Gg: AYBFou3MX4ySiaCqD6TG8ZsagEVYI+xxzpii9EJ0Yn3NBUz0A24i3Sfzk+2vI8s2Jgj
	VIh1HV624rpP26jOufz0ExChib+ENjM10Ot89T9mEpnHXxDqRnLm63mN8R8Vr0980WtRSJzugsj
	n1lcnbvC3AD8i34J7uKl43HTDKfL8Fp70HcIardN3YdGXb8/mjbko5FYOO7Tk6O4WY1YcgbbfiZ
	kV0cOS1FVRJyK873itUoqEL4fgiEN/3Aj5CAPM/qLmYn+20sdaM4NvftkG4y7S9QTLhQx/pKSvH
	hHcRFfTF/uQtoAmUYhlQZUj5dANefKlhxNKv/DKcZD4DkkFogY76ZzS/z/g/0J9yWpJR3VaDCer
	69THohjuzK5q0akkR4YK+jsixCINeetqwuy/5IAJq69HiuyjKooRjEdxCIwmFVx+0po3jGvYY7D
	aXEUfvyQmeMKSO
X-Received: by 2002:a05:6102:5f07:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-79b579afe80mr41615137.3.1789343459136;
        Sun, 13 Sep 2026 16:50:59 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-79b579afe80mr41592137.3.1789343458764;
        Sun, 13 Sep 2026 16:50:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456c06sm2080930e87.28.2026.09.13.16.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:50:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:50:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 06/17] drm/msm/dp: Add support for DP controllers on Nord
Message-ID: <pzcoffvcnailaqogewwys2zf7aizlxwzwz7scpixngc5ootds3@fjxeopzxa53p>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa736e4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=m5hMcXIjv9hwPX1ZnFIA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MiBTYWx0ZWRfX1FHQ2o7IUhRw
 L9XQZEyeaKFPH/YtvXm4p68lJMc9fJxnKu6dgrr216KnhbYC1n/g/aH9b0aPJXfJd0UwEMIjTV4
 cwzm5Eyiuvh7hYQs/NmhJyxUjnJG04U=
X-Proofpoint-GUID: YYQFtzw0i3aIBxJnshImCjaZTaay5V-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MiBTYWx0ZWRfX7yys6Xd/Hvde
 JacicrQ6nzyDeMS8dTPqgjfk9gqn3znj2LdH+guj0mf0er5hb70HsIojr6TF7oVxQtpS659YQ4D
 3NfJ66jMhEoafNAWfjX9qZ7512fsAdxF1T4Je2GRY2livnPliu4QAbTS7Q2JlqnLr54ZyTpm+fN
 MnPWLgqWlqzAWUNsBB0ARefY+O/btXlyDYACS7KgL7js5E2LEWFJMeRLMExVsbXqs5ZZ12ShyIh
 gjlSgLEkOGyrbrfMfxMtiLyhaz2/Oe6ZEdQ6d5lgR0ObnABP1uRZWRh0Zm7cWYbvle78kQLvfFz
 BYttLIga9QO8xzKJ1xfe7C/rZ3L8Kx679J5UayHX95FD5GpDBryP2f2Vgc3e0WCePEm8z5qAzrB
 0bUaevkpiJ7wAl5QfEoPw/4G0nm4N8yieYlH5wBrJgHieuhsWggfJe8eQ9+WgGGGp+9xhOLWN+e
 RMe9LDugnEcdFBCY3ig==
X-Proofpoint-ORIG-GUID: YYQFtzw0i3aIBxJnshImCjaZTaay5V-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130342

On Fri, Sep 11, 2026 at 09:06:37PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the DP controller description and compatible for the Qualcomm Nord
> SoC, which provides two independent DP controllers, both wide-bus
> capable.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
