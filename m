Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236FF4F4746
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555258; cv=none; b=dUD+qoitYj98n8eSToY9CPRg7d8Es/pRpCXRdfMMYNbPJCKM6JVbi7Kj6DsfK5o614WqaI2/MjqOmiuxXbHXyyjnU6NFqb8atv0CR4DES2uhV6CX4bgzpVXHkxJBnq5W8tazq7zuZaMcO/bePJuEl/Iq/d8AfYhnyfrLNZy82CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555258; c=relaxed/simple;
	bh=yGnIUjthxb6U3IZAyKNaNb2TbGvUsCcXifAWxRFjyK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGHRJi7D98jM6a0zPJEcFEjB/PhqdHndRVnOoqkwaVidfUF0KL0rQBo4sEI+OF3YIsdAlS+E8eM23s8xfvTgEO4APbCiJ6YvIxqaGyhCImPQx8Sta0goVzbpqRk0MI4NcqUArrke581S3QvrIKEjKvqwmyyqmH76PvEj6CHPkHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKqWlXSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVj213Dp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKqWlXSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVj213Dp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934Fs2226525
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sPwZD0T5gkXfc4kxDoR6r3lP
	6oUeHG9ZuOKOLS9rEHk=; b=AKqWlXSLblazvsrBHvnilIv0zLqZiWAVMpl1wuOy
	2Q9dCtzFaZb8mjem70clV6IkpzAWwAXiYa2mB9ZaJkviMmM92XM4lSfyaA78LGS1
	8dof28FPQGOAN08LnTtGplxaEb4bcNjsw2wPNwGcKcAJn1phjjq7JFVAoR1IgL7X
	C7rF5ETKGiY2ZUs9mZZ7PIDbIl5V4tjdrJ2NQxxbYcM2fkZ8J+aqhiyyxzHpTKLF
	L1WlBhR/1vZXg1tkI/91bNFqVrYUIuQsOhjo25lyhDucO9vHj6V0X4SASth4F+H5
	hH0AFCtS+0/sykHUij4VtxPKK3P8+xKtXSG8zooCSdE5KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9uucw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:40:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so366239285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555233; x=1790160033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPwZD0T5gkXfc4kxDoR6r3lP6oUeHG9ZuOKOLS9rEHk=;
        b=AVj213Dpx7pJMJXmXWEYu30Yk7d+K0gU+GwGE4VI+86PxxsfroYH0ksCnufepBnrCv
         d3BnkG6clev85CfL4vMoXprD8sOfJYicAq66ylolkW7e+nXvbI43WRWSq75yRb0QlpWX
         vv8RzGG3taHjyqSsKI7djtfeBwaYF5yRzPYIItZr6fZ0TKruOxuWrw3CEFLti9tXmhWf
         eY3AFQMibaF7kQbyCpjWWK8mYnxMVbV3X99a8MpGu0ztMY/R8jsXF0O+v9uSQeSwqIZ2
         DksqxH30gSIEkr1xQxlGrI9smRRJRk7d2fgaE1NeqgdJV7eHs4ck0a6Bmky0Ib+seXDT
         4emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555233; x=1790160033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPwZD0T5gkXfc4kxDoR6r3lP6oUeHG9ZuOKOLS9rEHk=;
        b=ydeU3zQsF36Y1cnRbUTJZd+c36WQV0GlJlui4gYfO89dg5aAk4rLaFmK6HDajJN7Tw
         4dPlLK0KsfZ3qEcA6bbKmCBv6VVK0wc6pvgGf25XIapJ0Zz2v3TpKct723ojVdX6OCQp
         EeTx64k2FPs8xNfAM9rtH569MZkII5g+yiwOOofu22+PwtTVbOZCE0kDuYlZR8KxAKRY
         ys0DCkIXnZM7EgPgEQNqr0H85oyEC2peD7mXyOlDALFaIzpk6S2qoLOacxwAhS87s55B
         OGcDwOYIXAk26sM0AX/RkVfsBiid/KPIkLZ9li2wFztpfsU4S3yQsN/mN9+9e6cmScad
         6IqA==
X-Forwarded-Encrypted: i=1; AKwUvBwaijmJTc8EjmcLu6mG9Qj1kqmdtioJxSd1GEbFnfqD5yF5e/xru3IppHfAob4YbIrc/w4u1xUh8wC7DrWI@vger.kernel.org
X-Gm-Message-State: AFuF++kRgUAF8HnrbkqDk+hwAML5xJE3njIBCEG4wBkA0dSdua1XsZCv
	Y/QfS4aXLxiOwbyhK5bMocMN0j21zGTBKJcCj73MXPSr3yPuSewg1T531aDIav0bzipVGEo12e8
	48gG7pfbPVuN7gPWv7cIaqUTqVo/dTreoZQ2wy1OCfgNd+pLfm0m+c7QhmYbDV5jXKdQVP1ltLK
	tq
X-Gm-Gg: AYBFou19fc4x5aThZOMyRsPYogzz7fvtX9QdmUa0bWjWmf6RlglHUtprXJWc/5xmg6w
	jzwqpqXvxbb4ldDo8r8Ut5Q2UM4uMsJRyxwdm8T8rbIvl8kFxIl9cB+R5fcZdOANEzo/3GVSuD7
	9eSZpOLouGcg1JY6zU2nMg80SKPFu3SM/BMzOtONy7CSYBphogz3ks8ZhSxCAH+K5liq+ThzNZ4
	SMjesE612ifErGa2JZSprvzxejJToR/BIr/kE+QLUGNu4DYkf87kPkLniixk1QUBi9UW712edMA
	afM1MDHBmqUw8w5c4T5YTyRgQR1nJimdgVl+5eGksHts08hUmmw8l4z5X6rsjoZuy/oFyCAY41T
	iAWCfTiwEqnNuQQ==
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr939028785a.39.1789555233136;
        Wed, 16 Sep 2026 03:40:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr939024085a.39.1789555232607;
        Wed, 16 Sep 2026 03:40:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27a36sm5963586f8f.17.2026.09.16.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:40:31 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:40:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicko van Someren <nicko@nicko.org>, Chris Pouliot <chris@pouliot.me>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Asus
 Zenbook A14 (UX3407NA)
Message-ID: <ai665my4qklqqceqnnniawxaua6w33onyytmsjjp2dx734lkfg@ggpfcz6iv77p>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa7221 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=djCmDME5OWOriDNImSAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: b_a6Z5R0iLrZ_IRYbgdPnVuysz-6wcoo
X-Proofpoint-GUID: b_a6Z5R0iLrZ_IRYbgdPnVuysz-6wcoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX0vy2d96a9MiI
 6xFuRLoollL/vZfisgVO2OubsX+fznee27ditp1ssICjXnej3a2WHoYgv9QNlhk0ipJShMWMKJv
 eaZNeVFXoYLPlj2ffzPZuFqbYa08OU3YbQBC8i1CSWK1ox8/g4kXpINu/JT00hTaA2FO9krwniU
 ZmlgrmsJzS1A0bg6PTTuzoNVfpe2hMqNhyNInq7fJAuwsNEMRDb0n2beJKJOTp722pZWB98cRCW
 CIXdk/aobhLGPW9WKPgRhA/qSZrjKvhxppq2ePyookm3R2UGpIWVaF6nxieiD4a62X3BvEJxHgn
 fauQHMIMt1mvFi9sxKsnVelRsP4G9zgJNuE8TD9AyaTrZxQW27qxGDlbwn6wmD5F9TCRRVh2Vs9
 youQ2EE8rFFmYnQLKj/DLKVRdwbDM8V5L4Zorz9LMxskXMyve2IBfthm69IMNYhoqXkzml0MWU6
 DOKwZla2+ZrMPR3YZIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX9DlPqNkeMvZr
 FGU3a8IPFpRG4Dtn+wK4yjsio+JANcCApiK1eJnYIiptZtWzm9pCEfr/YDxsAuqZ2vNsXLA9LWx
 4KdWJd/92n2i+IyZEJEisXI/61F9T3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160140

On 26-09-15 20:54:24, Bjorn Andersson wrote:
> In line with other Glymur-based machines, the Asus Zenbook A14
> (UX3407NA) exposes EFI variables through the "uefisecapp". Add it to the
> QSEECOM allowlist to enable this access.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
