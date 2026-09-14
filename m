Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BAE1E7C02
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347039; cv=none; b=pERSAKyqSPzqI9jynTjUVw02tgdeZ+8GIwnoNMhITGqWzZqUTaaun19UBRq2t9aCbLcMB0tYRtOykt3dUadgjNmVKs1Fl1IX3bjfQFnBuuWgzUqk5V9vNuCmGc4lSIS7gNDg6GdcWOkHtOOc4wo2XkRcLC6i3+MEi2xc7K8VuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347039; c=relaxed/simple;
	bh=BhhLq0kAUoP6SjkHOa6ihyiJTZuMj7B+uI7Zc5zJhAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9nc2Pozy9qypoyka8JApKQxSq6m4yMH11kg9U8DrHwyr0HjNZ1r8ihaznpGeFPWwjP+41RY1WitIO3aD2ZmLF/hV5ZCY62ABfUKqtj7etsqhElR5LQYG5n1rDSISJXekz5r1Z8qrdM/c88GvJdUKDrtEpQIzbxutLz8py5Mwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rpu4QKXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBep13df; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rpu4QKXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBep13df"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E063t92421566
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asdURPVQzX5whnoLxzBXSnq5
	avohb5NjScAZbrvWiNA=; b=Rpu4QKXY3gQNBMg6lx6rZ31xdK55mimRsuaSryd/
	hQZtTAddl61kn8ty1TCk2sFiFblA567q3CEv1wsb25QIcMqPUQ0+3DJb7sHQ+yfc
	UIiBaTzcXMvrrG7RQr23P+togK4Koyb+GqPm+g0pWZxXjDYhMI+EJFMg8CHJy8IB
	GrLAAFa6zPLb7zTgxi7EIeAKjSj9PZxXtUhm9CLKpODgs5gj8HVqxLBsk3qBGeOG
	Vehy247I8VBID2TjTd3PxpwV5DP90CGNfgxPTrYxzZXB6/FqGHMM41GvEPUjebME
	N/U5xfrR4zjrNqXTVv0yEEqZmep4HHTUMpD+yLDv9S0WGw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018mb2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:50:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb9f59781so2437744137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 17:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789347036; x=1789951836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asdURPVQzX5whnoLxzBXSnq5avohb5NjScAZbrvWiNA=;
        b=RBep13dfS5OIq335Y3lsGYYHR7Ow1BP6yEE0cVdeNK9r82C9peopy5q/fLO7We7lhb
         hnM0gxullC5ImMV5f02/zy8ZKLcsUnyJIkWFum1Gk8A/3QNATxuxHZBjasnSVxefqYh7
         lM5CVCC1X9w0BioaSak5+pxp1sg71GcQga/VZLIdQi9Is9Rsb9L9BImi4QCLQddZDJVh
         8+zntyHWD5RONp6UbQgM/aTGYv/lb9SEtlVjCRwtjKNa1ODRrOclZMI7cLTBXy5xeP5E
         /6aYGB4hm8rjNr9IYbQ4LHO2dxegS3WoIRP4tZWeLnxgSTsBzDvJ3XdRf1ZTAvXAKjZr
         Yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347036; x=1789951836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asdURPVQzX5whnoLxzBXSnq5avohb5NjScAZbrvWiNA=;
        b=PS2XO+0BVC8C/41pCifpj1npzYOIZf5G+Vlc8RPAUH0RIHAxdtcr7ZtEIJCul2LqC8
         2Y1MXcFCBEBadzutxqFiHTGKzmgtJp1cwChjIZi4QJJ46/Pq8Qumv1JzPTYx2ydxpO4e
         XJZeEdjFfXg0LepOri92LFtOUZYY1yzVA8i6V+5LfNUtMPbds47LrmdggooxxTQBWebh
         U23Ebe3Wd+pe/6Eyzpmu4vs1/VVXkGBP2uJp+RAKOirMuTO2i84hx02HqoXV9WZIK7/4
         bqg0cZLo8+0XWYTrRq/oNn26Fq8SFzUvTiS/tzkA35pU6bVmJU5Nq5dyvzPCIP6Ru2la
         cLXA==
X-Forwarded-Encrypted: i=1; AKwUvBzq1eth/jKVbdPlXV2TZoKwSMQV68rXibQWu/jDctdfbEpT7C24Yxx9WqFtbkbNpbQ6OeQj6dz6XLG5b4Hi@vger.kernel.org
X-Gm-Message-State: AFuF++l6W4SHyNO3XxOEdnd4OmGPG9RuzqPVMBAINWjx5tan4iEwn1Qs
	bKAscxL83Zx1GgwsDLR62cV31YVdR++KjvvAgtx3ap/uo/rsvTZIKVDx89oKi/Y9z7T5nYg4tPu
	YD/oLvAgwI1LbZ7mXc761+ejqW8U8IaGgmuxC3u1ZNjSx2FYzzrPi2AACaI96rLAJMvkM
X-Gm-Gg: AYBFou1Aa85fhKJ7uHq/hMTrULNY8A9Wd7BI2I/vJdCY1cTda690vMN7zfSBky1CZbm
	o7q3p4QHRYaSR7xzZsQsWnoSTsg4FyiH2pvLxj7Bjp8yR1nRui9k3oFlzKpV08pDhNiDMArlxyc
	CLc8SsRwnrB1wmdETO6X0zljeZDIbIaZO4FyGkx2Bn7Tg2DgmLJa0zImHSWJZ629kNkCmZ6KYis
	1MPwSdaKnUmaP5+ghQe+IBCsWY9NprpoL+4tvErqLFFk2/RSvDKxR4/r39Gq6zT0Ste+i/w/82b
	Byh1mo7SmHH4WQ0+Mn2SF0w92Mp4OgsUDcQcO4X8yt7+JhIGGLB3nNuxc7vitruflnpD4ynCZhR
	cIbm1dnVDgZoHr34h8mQ8HBoW0x4a9iCoNBtnQH2lla6dN13DJSBfhLWm8R0UXL8d3B9zGnifxn
	K/oOEPu8OSntyc
X-Received: by 2002:a05:6102:5792:b0:785:d308:cc2e with SMTP id ada2fe7eead31-79b5acb5481mr108156137.9.1789347036241;
        Sun, 13 Sep 2026 17:50:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:785:d308:cc2e with SMTP id ada2fe7eead31-79b5acb5481mr108147137.9.1789347035856;
        Sun, 13 Sep 2026 17:50:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04798d2sm2023587e87.69.2026.09.13.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:50:33 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Message-ID: <6vmbxuukduj5tpvijgltcizdhhgllj4biep7dqs6twj7qte4cp@khfdliq4agqy>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa744dd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=5Adlwl6woCA7rngLHykA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX9LDzThGZxYTi
 P4T3T6HHoK6jh50LHQBvOBaVN3HLNyVz3W0/zA/Pz2dd3Xv0OS6TDkupGE+rwoTC70+smSOwv+x
 0/uwMG/sTCTi2w2yFGZaHvi4tErt2zk=
X-Proofpoint-GUID: ql9S_O68UDvKeltsQZHYiop_7S6xv2Rc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXzDbJqMaKJBQL
 RBNlL6+RE2xHdSmNoNvw3TCRLFfCYpohEMpPMUmZs2K35/1O679lO8u2GDladhuIsbADuDeIt5H
 41w8zBWcpP+nxCxl8lzhuVGx+2HHhok4OfSG+VxgodXGjxQkz0ZSLQusKdEqf03Gu6FTDQI3JpF
 cmlYHyWxLciPqNwXdvqN0h8TTeshWE7LP+esU4pF9vbug6WYwknmCFMtINYzixd/1JcGNzgzxvq
 5G5NRBnklddQofunXXTsbFuyh+qekDsMCTGCdW+FWrT5c8xywGZ1+ofMpNPTSnqp60hhET5V6ex
 fmjKJ4dBa7+FrgWnSTePnJyI/Ar2zj9AHQTiSVtdOS6drB25ns0LJprFAy4oboV3xiid8lcOHWB
 M0BnqeAtBd3jegtIvTiCWV74zl4lexr5raag642pRfrAmOmXlW2DoIQXfJcqL3+xcvbq9ASlJUY
 yyxbmz6m8qzQ60/Kvdw==
X-Proofpoint-ORIG-GUID: ql9S_O68UDvKeltsQZHYiop_7S6xv2Rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:40PM +0200, Krzysztof Kozlowski wrote:
> There are no properties in DTS or Linux drivers called
> "core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
> wanted "-supply" properties instead (which are defined in the top-level
> properties of the binding).
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Fixes: 2f14bc38d88a ("dt-bindings: display/msm: hdmi: split and convert to yaml")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
