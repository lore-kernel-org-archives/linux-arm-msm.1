Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22FA3A3E88
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766930; cv=none; b=TSnPDE9CAvEW1iNnnE+8m0QoZqqV/QnSaxgMCxHaeJVJ0PckmLO04Bb6owE0umcwYd6gB6MllQ9ozbARuYfqs1kArw4f3pTPWvhV/bYAmVCeZgN2yv7/GoV6pvow72xtlZpZiUM7Y1SPCqfqHWoN1zjrHSwpxURsc28vYHLlNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766930; c=relaxed/simple;
	bh=NN9BVKvXAv4dz1TXazQODq38tvHPJK0LZJ4wY9jR320=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olpL1Ath6pEIVb0jYEwZuk4yItIPhwUBwyJKRPg0OsskyQPMnClDzFOyTYHTllW4vyGW+HGhBh9MjS7ZngsDwh2FhgueZh2kZHtW0lIK5Yfmx48IZk7ot01wsTv7wgVf6yijle+ysRPShyYi5XcwZsSV96ko4+RQwQTQRU6qH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGqvbNxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUQQtqgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGqvbNxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUQQtqgD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNnM333062
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=; b=mGqvbNxu3XVIm+ju
	ZvWYo9o/QLbl7wOQ4TeVKhBhGHEgAjREC3zz4d8/6aP70WwlPMGC4IVNX1yxmXy4
	PWF/UuhSJldSkPtd/YmEpieT9f/LL096gXYIjPLVxXXgE5ffVXXp+fh7f26HwpCy
	pxDAXhFeox1C6FgpS94WC15zc2irgQ+AO1cioGCQoudpwVBTtrJ1pU1ALakhjqUJ
	l1w9zAUKXFaOe0C0o/33xhTBKNcbw+j20MRzhhyvrwGuu5I+7GW4yzLXGsiqUdNJ
	fhlPO4RV3Z4QVkWV0uooore9uyUmZDwRNIbClkztwNI1HhN35B4Quu5m4beIJSP+
	S0HB/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua867g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:42:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so40840785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766926; x=1789371726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=;
        b=kUQQtqgDVhpo4W6IVJmCVkC7AuvicHG1uHCUHQZ7hDPV0Cm90b90u8h2areWprepul
         1JDvMAHurEam7in+8XiiE4yvpTh1sgR9rUK49PHUPPPsbYAklAz3mms20rndvlLNYMor
         Um41cAZMNMriMctQUKzVOxZh4lHPN9n06PyVIcWtfi3Ynvci+Vg0EUhtyyaqshUCVn25
         O+mtxk8SMtff/rL6UsY3gyIGtqZ0Bf184YoO3jra8N7XMdH5Pef6DwSp122bTwZ9eZsk
         eMjlgosAxrCaHUMolfC/QKNmtG8/C5xJycWshOg0WA8k4uMS7VJ18lchLX/NIa3AiXPN
         EeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766926; x=1789371726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=;
        b=ig/qxJ7qI2hKQ2YW1j2miKaHz9FcXtg2lof60TnCia4lcv3kMdsoVaJeLk5gYxMVOM
         xdrFR9C0oaOQPlOAZ/luIHt/v2WZbHlFD3s+J2l7YUczWcD9JSU1mE/iYti4stUOlGiY
         HDVOUijkgNXiwzLy/5heKPxeES9Vv6EFNx73pJNPs8BbYWPoykc4rcovoLABkkpY/WSZ
         rxCErEw2qkFQWoGY48EedFv2RO2IN17QbCwDJdZsv+1aQ2n0MEblkPTEteT/5IWnFGcM
         7VLACFA3VkGE9D7aUDoyshkYc0TmKe89zngc31OKDE2TSTuH/Zb+S7BjzjxYQyMrErEp
         a2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSDj2cW+XlkaVfJf2edelXEyM/QpueHoaIhQtQXxPmMEFhonDwWa7bk+XiLx1eJegjyVSxiztirLeJ/kBs@vger.kernel.org
X-Gm-Message-State: AFuF++kOzjSBjdePgZe4jRxPj0mjwdr/Xoeu/migMsfmalhRciz2T5mH
	D+WwomtpCMEy7Oc1TsY/Z0AIEnQyZNJLVEcwYKhOVCu5Kp72W2s/axA8/vhTlH5Or5IoH+mBOAD
	+/0bwLUjdSMtXHqSFdM3qfJsc4WBmIDU/8rg5MwSEkVbDIXjfYP32tMAYRY/uZbkQDwH3
X-Gm-Gg: AYBFou27LcN/hOf2QA0es7PJmmTthVe8Ul1G0BJMgBeb0hOXsu7dX8Es65xS7ImwD6X
	kucbRqrtr6dAx3cT6UwWX0HzVWUl10OX54y1toBpnLo0mtNUFgDaFj5WlqBvUQWLhGfadheRloD
	9MM6tvt6dH+Nyk/cwZBlLzut7hZ7Nrv7aXA2+x9RLN3Vjxv8ZGuiozFXpPr67fTRICZy4S9vjYR
	cKpFeVyqiYBxT7AoHmy2YxYwHx73k8/uim8Rb/FiNZSBjWeMKNs2w3rPaVGFvcu2oqhG0381JE0
	HF3p0LmzHflfU2gM7CODiz0rjLYLk6BOVB4JSnkomi5POwXlU3tL4FfQRH2o46LEhflHY2Mivy5
	eFV23eQNe9FWTcxVDZpX2RQ==
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr1727368985a.6.1788766926634;
        Mon, 07 Sep 2026 00:42:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr1727366785a.6.1788766926220;
        Mon, 07 Sep 2026 00:42:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm266442166b.18.2026.09.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:42:05 -0700 (PDT)
Message-ID: <648cd3a6-653c-45f3-98c1-8608f599f941@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: fix repeated words in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
 <20260904120601.18363-3-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904120601.18363-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xFQGBjlbZ1BFoA9-dyIaE2xaCjg1FtRE
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e6acf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E85TfxCPf-EkNVdhPEkA:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xFQGBjlbZ1BFoA9-dyIaE2xaCjg1FtRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX8FAakmY/I7aq
 Dc19sxhCnLIq1ZhllQvYYB6TZLrncwgfKZ4Wu1igeKidis6CfDg9SI/yN16hCFG8uO8HDIIV//O
 gZeOc5BUbFlNuyE/ZAFE89MPw4ogEnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX6q9JJPaoRCA7
 GbR1sT1v41WECWEe6Jr+080s0naTFFBcUDfcvJodmEdVHhx/QP7KjIzQd9UZGX4pPzaLF//Q/48
 MJOcFx0eembhva79O8sQQ1FNzf4BUEJlTGDWd9sbXUs0ThBh0uK/sVeRdEpSFdqpFeLnlhsE2hX
 ESIQs0szeHIS/Php5Jmv3TD39b3sorCKJMAg4ANNEI3AnX6JA0sdNeNWVrcvYy+PyaXgyonXuY3
 9v2zjWfDG8h0LAu23/SkehY2tI5upIu8buwUUFdA1ZUqLu3sT6JmzLpfavHTtY73EbtIUxGdf2n
 eCagu+3KF6WXbzx3kE5wFubnhSrXIbNCbNKoLX0cGF4K9cXynJ4tkeHWFidXXZO7hLN7YNrG0xU
 WNEcHJ59yOED8A3cK0X04CnhonhYEZ0xL4TSdku5DQFVpJuPbsJ6kPnUSrBOYnf4rwmFlxewsWe
 +CVmD6BMuek5drh4Lrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070082

On 9/4/26 2:05 PM, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.  Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
