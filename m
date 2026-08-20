Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664B3B7B7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214291; cv=none; b=iDac8T3Zy7b9rx0Rak+acLkUrApcLRU7yDr1ki/psRPTWi4fvD7bw5KZ0+XgaJnorC4lxJMQBSi9KCPH7aSCTak0sib+IW9wqXeD/tznm2iRgChlmf4SG/Dk11NdqT4Z8PgI8q1rgGWBuCxbwdV++e5odPcVTta+3+F7oYflMv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214291; c=relaxed/simple;
	bh=uhbvM1A1lkYcLVt0VEQC+1D0xdK/L0Qexms2FDRDGFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+AaVPIVHxL3Fpihb2pQyNZXeoF61blt/qex2tWbmrJjOR7GKGjs8Xrl3djP6UgQrvKcBZJtrrLaYFG6UFZfHvSJJgwO+ZLf86Drpwd2pTWuEsPY5huxivrCgkfupfBmRq8pY3K2KmQCTR485NK6AAEVHYgYrp3EP3gxYGyRB9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVxTZkdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVb8xATf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVxTZkdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVb8xATf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eX812161052
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tx3cBEJCJNmhBvYLSTPoH6tb
	pxzqlnwnHOBsIUd32DI=; b=pVxTZkdTM6PNoYSvxz8XPpU1yOKNTKRQgfbI5drW
	uZmB6b9/y3U7h7vvS6UVvlfWIrKp6l67LN6n23kg/PAFrh/kXmPbU83byOAs/WOX
	p0evbQAYZTLQZ/vn9T6NIQzGCraWBm89Vp9o+Dd6/faOZnt7DzcJ5kYVOQr1dljL
	vG6MkYh0LDuyQXeuILV9+McWl/5HZeXBEL6UJ+hpPXFgYlkJbXeLsm+27vB2v4Xc
	3BR/WKFDjtcWdYoArNm+I73WGSy3YhZ63SL9pjDImtYkujElRgpTXC/F5vzAETvF
	SOCWZeQ5Dt82HvKrUMUJdP+xZb2hbpIAocgpL7+EFfJ/gA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rbyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:24:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso171808985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214279; x=1787819079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tx3cBEJCJNmhBvYLSTPoH6tbpxzqlnwnHOBsIUd32DI=;
        b=WVb8xATfqpi6PUaPgC4NKa4G34RrjwPT5epQ5fV3FTwfK7pk1JHPedqa3HrngQ+ccG
         YeOf67GXvn6/5VBlD4IffOQ0HRlM8VyUsA1Z19KTwhlGKWbwpPgXG8mS2LNBNeyrY2bV
         /cBEZNl+nCszxsdpq2s7Xqy3Q9EGKcqTGuQV5P82i+r/4RIBlJdiGzac7R41HCVPQZSh
         elOcIRUQG4nyEdRXai/vAO41AcsjiFu4lKgeGgLUF0rofB6DOqPzncOGtFwMhpM7VBUE
         R4jbLwALBysbYi9O9AhRevPc2FTv95U9rRQbzPMNZYP0cmY6vvcMcCSZEPnemX9fPazp
         2JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214279; x=1787819079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tx3cBEJCJNmhBvYLSTPoH6tbpxzqlnwnHOBsIUd32DI=;
        b=QhJ6AZBugTYxBjwiaz6Y9nFqSXmyi0eq2sA8Q04hDhO+o3duQALKEAo0+pVoP4kjuF
         A96UQJOx2ZwkMj9OJZWDloaxkAjKo8C+7SRtxIHzYcUbWX/4tKQBGxGKqDow75v3Sf8B
         rtGXlwGfDz4VZ+6tuvPEeVDZFukDRVdGyttw5oX6ghpaEYfMyZFK151oNay5qR32HKEy
         p3X9gJ1odyAW1tBc9TwUTk/Ezl3OL6RANEx5n6nm4d5Tz52lTQWFgRzcO5QDMJab0wNC
         cLEa23qc1j0poKbqqo3ddAiClmjNUq0ayCgjgKQa8hk7jMs9/6cYPpG4q4f1pZgfr6Uz
         54BA==
X-Forwarded-Encrypted: i=1; AHgh+RodJDIo/uYPyafw9gHsK2S2T+BY8MtjhqImbdhYlKL3Z7WDzS6KPQqZWi9XzsgS6+W27ti5lTls+m2eYKe6@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRxntSZxKJ1KdVbzbNHmwRnQ7TB4vJTGoLfYrCEwYb+ax1V2J
	tXm3VURbpgbb57jfvi/0zkVnGWJ+B58HTXSBueOmiRTIlQmugucvkaeuzAT9FAxT7gTNttLNASI
	nJPXRl/fbwWhKNflMZS4GHQRSTaKoL4U9o96/Ce8bdpvOCtEee0hD0pGxUuxPf/w5s5O4
X-Gm-Gg: AR+sD10iprmuGAI0p8X3nZ09nx5JiWMsBpAGlSp/nApVGgPpzksEJsj0yBiv2ia5+Dg
	4EudImlw2QltQYGtFIPcESiyMrHaPOO/iaZVnhxmVryByuuPHGUnTVMPZ9NcJ1ntz5U8oJB2Acq
	uUVOv0oaRnBsPoCpZgyK6Qd5ASp+c0aT20Bca+Gf6VIBcl5ETrUEWzrvgYeG8CBmb4dHIkOS1Pq
	BU1wjCZ7Tnsc/LLOwB9Ifgs9sIoSZLp4pKPOED6l2nN48LMVCh+eHZZR8eYPGteqEmVeHPNHFVC
	qfNtWL67JsjyXc7cOcXsNm/qpjjAbGnpJYRKpDEcnZNoPU/BLqHtdH+APxypeSG9bKuB6KIGBAY
	RsXm03Qs2WOZOzXA=
X-Received: by 2002:a05:620a:458d:b0:936:d2a9:1dba with SMTP id af79cd13be357-9371e204e3emr846860385a.1.1787214278625;
        Thu, 20 Aug 2026 01:24:38 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:936:d2a9:1dba with SMTP id af79cd13be357-9371e204e3emr846858085a.1.1787214278101;
        Thu, 20 Aug 2026 01:24:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm12926289f8f.29.2026.08.20.01.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:24:37 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:24:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 HSIC host
Message-ID: <unxuswp7lghhaa64rcerxdxi3n3sc6oz3iket6mf4z7hqtji42@7temhlkxanse>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX7JmMQqh4D4rV
 RJP1HMY0yKQ95bVkv8T4D6rxwS7eyDId4/FOCjfIDnaS+GeFgVIzES2f/EBbqBc1oBgBjV6o2og
 396//HsE//dF5Eo3qzd7+qg8kIfjRPmHSQLwZhB2sGCi+PR9d+3MF1NndiJmPBLAmQNIXQ85QNJ
 FZZ/jMmgLc3+JeM/UQ+a1tCBYiH9Y+L5B+DVt078NxwL4uYXcYrqc0BY1d4DofxZD7sTGZVffOS
 6WsfbF6Mbg8qn8C+WBwQdIp+UFVMB9wvfYR0Lqfu/mo8yIywWHfkUPnarBfF+Vg64R+jsFeSoXP
 id9q0XuytD4PVngufV5wehmnb03Ots/rMv7yEM3Jj3OfkIljoiB2p2+Hn2DE1XZflT8O+/+dqk1
 iV9e7IfgyHuFIGewt8WxEC0dbwT+2Izro2Twa1Vl1krKO3y3pxo70vVcKE4S0l5yZeRlz6lAu22
 IIcFnNrZqWqG8RCD1Bg==
X-Proofpoint-ORIG-GUID: spw6oHxdZ1swnl8gNeXVprsXTwaINarF
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86b9d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u23MIztejtzZNv9v5ywA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX0a9hDTEWfH2u
 XliPDEcBZVn/3fC79fwrczTmM45cDS0VKYdNmU2Xu8MiEZ1A7FCLw/hqmjIUVfTtZ32U6339XaT
 Cg5PY4uE749fhulT6H69K2LfFYhcRMw=
X-Proofpoint-GUID: spw6oHxdZ1swnl8gNeXVprsXTwaINarF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200059

On 26-08-10 18:42:14, Dmitry Baryshkov wrote:
> The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
> controller undescribed the whole HSIC-attached part of the board is
> dead.
> 
> Enable the HSIC controller. The USB4604 hub isn't controllable through
> the I2C because of the board design issues, so reference it as a simple
> USB device, describing the reset line.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
