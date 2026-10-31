Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483333;
	b=NH5TFGzyCC8f8UXhxM/QVLY43Zb/NnTAdPMmsbDd4nlAmH4OJLss/dsK8Fk15I71Svkn
	 2vgoQyfV8V5tP87DQl37wznckn7iBY0COY1irTnfcdK23xcfk1O7DyQ1dhTX/yC/iBsdJ
	 zVvnK3X2v9CNJRDQ0HC65e4Q/9RHPYmYFbFSry1NGlXkdWLd7mkUYLG6qN6HYEWWFJd/4
	 c6QC2d9r07LsODn1tNCpR5TxNuValOvkZI78Ali2iG2wqa05BsYMQEu/zJyYjgcOLtDVw
	 yj9y06Qk+RsBDP2+DcNNl7bCFinYmp6f72kj65XGvg006k93b6qEjN0nTyw2O/Zj7PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
	b=GbG3uYheJWZVRG7Mf45q47ekIuK4tzSGYyYP8FOdIoCwYzX4vHGBMgLUCChYfbh+QpJJ
	 Ca/g+8G8heF0wJcE4LC6Khmzymkgz72qXwgpOr+lzUJK1yQV19L5RgeITbwmcq5Mhue5d
	 7GpiNo1vdmOUlA3ZPjcwZfoQkSx2AYOJWH4Z/qq+APEcc5x/3oLgeAa1ugeiqrb1e+GNz
	 sJNYyW/xzVQ092eXHzHHRzqXPZtJfqylfQPfhjHaCzcx4s1djlPlUudn6kh/UJ7t8i/5G
	 F7WeP+a+VuA8GYY+S/ZfY++zaZkQPjb+uKFW91ahdhlguNIjp3tKieSe4uCM29P3M6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUG10rbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC5xRwEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD273606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD273606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUG10rbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC5xRwEN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VKuGUL3736203
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Lhjmp7pZXEoSu7S8VjkEKvS
	Y0g4l0O/7K8WaJ0F8JY=; b=ZUG10rbO1FpoTeNiOmCzs8M9cp+V4F7Kt9yOHcOK
	eyxrWHZY6Cm5oI9tudJT25wC+RPH3fVrJeXxiDrB9ZRAfcEt6r8xfh5UyfzJR4iC
	x7tf3RMbDGL/PGxKKNvC0ySFsjwtZJkG8173nYLK8KH21dEMlthhzc/8ypjk43Vo
	dvjr/kpXgLLleTiHgMRX/f4qzh7RfZBEHSjP3b0nYlaNT/fgtDNnjnnnGzHEHjSv
	I7f13wQiXGRaM/ANEXB+/A5eyto+2ZjMUOL0JWqnsOQmtwmVIsFDGVy1N4TCxn48
	VY8XAN9b5zSLK0XEJRTlyXYrU81rgB0t/xz5dRzhtD0ndg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j8m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:48:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c84af45c8so38503756d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483331; x=1794088131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
        b=VC5xRwEN9dJF+v0bQoqtw6h1aQYnrjoXNjuxvamOOLwJQHGTkCey6RYucq/J7n+es3
         GPR7uuW/3iRwOWBm/ZqoOix/cXE+N5r+JBrIZsdNyPOv6IucMe0b2JaSFoMEs5ZmJMBo
         XxlbpsuVUeejzVfdHZ8UkjcmQoGvrvQBt56Q68xnKKbF7T4AlY1/TDv94UAPIPy4z2Op
         YWr3IM1YQmTieTI9SYkEqcKd1UWWMHAHZNh5XP+S6ChNrgbMUNzkkCcFvcmyl27PbNFz
         mELxTNYxvN9zWJj7dtZt3zaHJ5+HVw8JWOoxzwuu/T4OtMnZZNVJlaEHHtnuLL2/riWY
         wEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483331; x=1794088131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
        b=sSxVoW9VsIKdR/FWQHpoiqOp65DRNcdblKLnaqQicmV5IMy0ByOty4btZLdzEAYCCn
         1bxYRaS3mO13aVFOE+89f2JzI4Nu+zVA+7vUoGOJG14cut4O0A0xcxCkfo0kPyXzGEuz
         2bqKDxfOoamFeIU3aBf0wb4FGVmkW6A1sxsqtmHgsk4dghZjxge9FBUHVHhRwSEJaisf
         /fn0CZ/9fX3dGo+mYcpWE9L5MEJUiNx1cJVtjJWP01bMRK0pifmUKkwQAQ/5HvNDZY3A
         6iYM32cE4upCU7KXBuQOxGUGSDbMy5TdhxhJrnWai8USUI9qKWdVPa1my9BgkfY6+0Ir
         THtg==
X-Forwarded-Encrypted: i=1; AKwUvByVAVp4RNa9dk60qRY05tGQMs9Xn+H6IqIzoRqEsORX45lVhUeRFaUomteS6/3jfuraxgXZBHATPJdz8i0P@vger.kernel.org
X-Gm-Message-State: AFq9FYIq8tW+NbiiHTOyUsbCazBSInBeF5QXagG0nRKUDrN3/9uD/How
	84T1UsECpu3maFH5vBpticZw6KBQj2QDw4yVVISHn1qOtWveQ32uiHaJRB0eGhb9xjB5w3XweQ+
	dXgAqaKdUJ4xiDyX0kxQcCIzY0G5p4ZRIjbml+ubA9kIg3RRIAVVwbyO/QIiQnFShZ5UC
X-Gm-Gg: AYBFou2C/iomAn1WwCDTHUXgI/4kvcCx6BKy4isTOGnxP38DJCzrYfzM5yXUV0m2LP+
	C8ojJg7jGzmelQc5R/OIlD2jDapE3l/TfXENn7blJe+2b+UAO+JmbVijpmb8LJYmu9M1AU4hpMa
	pWy6nHGDTHMGv4S4yY+vF50D17Sg9vafvURjUFin+HYOtmmYp6EtuF9TtDpMf9AdS7uNrPzW/6+
	1Kw1nA3lKhu7XZdtbiSzSbwlilaSeMLvSLojvfB06wBa9EG2sjOavC5W0gydWNxsoaKq9m4SSYZ
	y6TBtIY9rgR2VuGzb3mdr5fm5Ox+DyiV8Bsos0R3+88X8UL1qpDWSfICnNY+lkAg6Mq9ju7h8l1
	DxCnVM8h7R/rttwrkOd51qvCr+iQYv0Om3/a0r89tAN1YqIaVj2zmIgg7VL7JI26RmUO4iYJQnG
	TmB8S9c3BrM4btaXfEozAWZwnM6tfnKyaZGerguXoToi5tdWrdTNmqZSriFHsw6Q==
X-Received: by 2002:ad4:596d:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-91ca4ba268cmr99988486d6.54.1793483331076;
        Sat, 31 Oct 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-91ca4ba268cmr99988266d6.54.1793483330659;
        Sat, 31 Oct 2026 14:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm13744921fa.20.2026.10.31.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:48:49 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:48:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
Message-ID: <ms272llmwo6na3e3i3qxv72zvxedblxdisxfb3lswmjrbobbej@zq3hh6srj3fw>
References: <20261027-icc-sm7250-v4-0-f9bdaa3c1c7b@brar.si>
 <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
X-Proofpoint-ORIG-GUID: 5PR9ALNEL_mgGiuqCVNpTN6nhjUVtiUD
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae66243 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=rbLHc7TusOZuPl1584oA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5PR9ALNEL_mgGiuqCVNpTN6nhjUVtiUD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXyWwTc3xvHd0B
 oDO7nyNHXSu9EoTWL6YpKuQ8R5KowcuM6GA+vTS/ziw2GxaTZfMwNdk6kHgLnFkTEi+9NbZvyM5
 mxS4mvqnykkBEoyC6vTPq6XeUwSGi2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX4QUU5OLDbxfa
 40NUCbcBdK3HVhIXsn436IFwkRnOU3ZD2BmayqlXpCiHCRaeITbkCtbEPtjx7Kg5T6CezSu58PO
 aXHGfVlO20WWNQez08PMjFT8BC+zTTymWPsXyQVd7RqiC2kHG5op0bkK4uIymvbZ4pQf1jjnMjv
 OQd5+eEW821QXQFZHnhhpkcEuPG08RobADHrdQWl10pN0XkIsDer9JqNThQVyYy/klh3ujSiWu/
 YN+YZOETbT7Od+dN3PpUFrA+Z7K/x9q0nEiqEocuYOmasfbfIlAxX8q8s1cH/weUWsHTJOIcEiT
 P7oFuKjsoB6tK5T0UHDvawuVSn4z5hpg2UW424rg9l1Cki/55aCY6XNpH0H0qPG0atsaZD16R0m
 BzqPHH163qETXeWuU90GwPuzc+u8428AID2qYmXQqiU0oz5WhIblvsuJq6i/rDE57hysA6n608x
 TJGhPvbaPdMkMP+spAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Tue, Oct 27, 2026 at 12:42:25PM +0000, Ishu Brar wrote:
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/interconnect/qcom/Kconfig  |   14 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm7250.c | 1489 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1505 insertions(+)
> 
> 

-- 
With best wishes
Dmitry
