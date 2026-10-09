Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA243A6F17
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552238; cv=none; b=jg6zvSdzN/yM8zXDHBOszcn8mIrfJVRAltGrekF4AcTs4WFO4Jb2Ue5FuiEsu9V/b43BcVtsEJZw0LQHdVFedm4vR54oXT6zTbTjOwFPwKeJ1xAz1GS9MPb0tXkc0R6JZwBp0Y5XHuNE8Lqjh9yRb2ks6BRHerMyfdPGJMB4ntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552238; c=relaxed/simple;
	bh=RDoVcNfYx4gWnIuXkIiuuDySeKt6FSVcYGy5RTL4yVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUZSziWM2RwrciN6P1Fgq2Q8PKoHuuSh3yJjkoIAnes3crWpT9IgfCEXrXQui8qaDe0+vBchCD9p4eVBPfh5jiGIgzaplWIGrb2E1gBAQwKL5FSkoDdG2FILVZc+33jCzo1NL+xugJA/uJ4Zm6wF+gyC26rVk5ovq1pmYg/SbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAodCrab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eETHPE9+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAodCrab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eETHPE9+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKBXr1754652
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTb/nAfNcf8kmDxbDKy+Ovtj
	nlCj5G5u+5gd5OlFFHo=; b=ZAodCrabe3fUrhjjoTHdRkIIE87+b2J+h/B6Geh1
	tmMSwvyuWk/IZnKg80VRBHtUP0RGB5IICsSGqhbUNxZCg3meVXqjUv/vyzAuSfen
	qRIwkQLhnCEbkulp70eSu36zEg4UXkthNNn+1HQHbRZirJuWG9zEDQYmXi05uZRW
	yp9125PWxK8dR5KwYaAXqCcdhXaTtZvBipdEdYsaXUNWa6tWu8Vd7b7u/hRS+/iC
	feKdKji/X+1y8JP2m4ZCPQyumYSvSbQYn+I5Pd7M3hPWX8/cQYUplxrgkj1hic1C
	K4lmOk2/oxUB59s7Z+iU/BH4MtqZwZW8eae8MNXySAwVSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgn8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:23:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so1289612185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791552235; x=1792157035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=eETHPE9+KcDGZ9EcdZ/Qc96attPkXkTbBoFbP0QaFmiVJHyG4JR8rJwLKSPuMEkutP
         KKWch9uMC2JOOUejPmG/9wra9d9cD7euLB/sVEqMknCE+EMQniPb41dWNy7BTm3ts9Tm
         u4ad1Vvx5qyB4RhPVaLBZdo5GFe0vWHbKDcMo6hQqlyZ5qg/XQX46MKF56nr+5GeoG3z
         rmKzAPnRHaBV8pHQMwjCBgxZQXELYzvl6NjW/6EJxxL0+jiIrod00poKNJ8pFzroBH7J
         26QOj6wlYjviG95fjeWdlXnUpn1dF1dJr+PkHqoiy8ZaMpgXPThSIrX3B6v/XD2FZxbm
         6qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552235; x=1792157035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=vTrFvP0nyWJa2Rs8DzLn0yuQeurMFuK9/PcL0TL8IPNqQRtuAOvc+kajHEz1uSDzwv
         oZpfmsPOsVyWm+f5cHrUHX0Zmg6GTvedEakD5wvSw7B26HByx4/Gttz4Qwjxl0XTCQwZ
         V94KEGy1wUnRYTN1qVCiww8ql85pLWuDdeIXTshdJH8TTjBKzeW8XjABfNiagohaeKS+
         OUU8VcvUdlRO+daDYw12SY9A8IgqhubjKGlm0u7bIJbCM+U4vo9gubMLzSHbmGf18ZBq
         Ol99TS5pgAUFaAv9XFpK+3eqs8Ot02HiSu5kpFnuEyBlraAqBeAAsopkhDKVliSyZREA
         /SWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkyqUYRaC3pJCeAak7J1TqzM1hvErQvzP6a8oABUVE0Kr9JeuCv6kF8QzB0wfFSk9TJXeo+dr5SWKHRu6D@vger.kernel.org
X-Gm-Message-State: AFuF++k3Cz8dnrNB1boajhKOwWWdPCTqb/N+BlrWIIy4m+u5NUWPQ4xA
	GcO70EGMilufU9FyF5WBR0jj33ZaljIk3rLPQnk5y7tAzeVzcfVJxIGYIhTDZ/3XsTfWwDQpLfo
	8CRHzCQiqNARREguTG3APy9JLs4FLo2SogdmL6QI1ONDs8+wZn5IyWAAyv0gw8Be+CGzM
X-Gm-Gg: AYBFou3MpZE9tPo9+iViwwFGnH3j7gKKCUgz7Oo54gKcvflSiQXc+UcN3o/5mL/3mVx
	XVQXC4dlGRMcVMAuA2SktA/iVOtlzBvCyJnpRU35f8vzvqGXAYhwH0I61KSoAte+AASkUXmOCme
	8j+h7FtQ4sIKsHF+4sDLROm5ExBaNrlxgN/KvzeHgrfK5lVhgjDH2F2DKpl90Lgrmm7VtgFQJxa
	TZUDk/Ch3wRHQPkw0AV+FbFhFDZW4UaJgLOe5JyswGAejZjPZ82MFOUznzt/vSvttdVXnqcd2lz
	cYM9PtEWudHML3LR2wdUag1InpHZb+R/6O6I6rLwJUzTvkdfJqGdVASX7ZyidzclJYcqfE576PY
	FXiCBo3iz93rwgx9Lu+sBK/OkLOaIrh8TamGT5qa0a3/DntGxxnEZ3/bUq8+te//c6J0oNrkcPN
	X5r42iJqnqOJJt
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr253000785a.57.1791552235213;
        Fri, 09 Oct 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr252993785a.57.1791552234456;
        Fri, 09 Oct 2026 06:23:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81e6sm634124e87.46.2026.10.09.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:23:44 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Chen <stephen@radxa.com>,
        Junhao Xie <bigfoot@radxa.com>, dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: document Radxa Dragon Q8B
Message-ID: <kzqftw7lugumzzkafcnsa36n6nix3kmwee66bzlv67aoqrkovc@7lbdhwfchvp3>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-3-eda11e5dea8b@radxa.com>
 <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfXz3grG8pykUqY
 CNRk0sn+9TFjABsnnWedSl8/8U7lxElAUgdZ4IakvXIbGIQcejvqlmoJYM9wfEJWHc7aMZ0Rkdo
 cZdF57gb12KQPP4bJJQPLJiEhNXB+Ec=
X-Proofpoint-ORIG-GUID: voKzZEkXX2m-Nktp2qWjy8rQnE3OiEfY
X-Proofpoint-GUID: voKzZEkXX2m-Nktp2qWjy8rQnE3OiEfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfXzVAbB+HVu8kz
 0o6GQ76WJvqfZtGXdvdjOFPm3OnAUizLQJjnHNjtfDkhhhYzme9xgH4bhblvvyqQl/MUyhDxI8E
 xiHIUGjC3YyzvvgKIGydji17WJPahy64dLLakfxMiDP+DdNcICeVoYi3+mYu2vxA4uF5/BuWAZp
 O9suG5gW7cBl8JBtqy1StaIdXjGSOf2l3pYNM6zKs2WwYCUmnxaBSyXIXvQTRmlkPy0J6o7e1/b
 je94k6IcGYotIVM2SiGhq/z5y9T5Gz9jfBKT+f07/gTZRotXQh74497OYyY6ZroXT41wryduS74
 AfWeUG0u90ilaecDM7NtvOvYjvplmi/gbKpwKDlqvbq5LV3/IBQtkSxyybB5qGaYd72okpfEy0N
 JC2Ej4dSLQRtsvD6RlK9hktejdOLqyl45fBbh9aPcgETW6lf3XALIdz1nkppchdWYfkOjz1Us0T
 hJzCMLnCSf2tYXx7/2g==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8eaec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=CDNH-pee2JQSj4idvpEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090053

On Fri, Oct 09, 2026 at 01:42:11PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 09:55, Xilin Wu wrote:
> > The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> > SC8280XP platform.
> > 
> > Document its radxa,dragon-q8b compatible.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Tested-by: Daniele Briguglio <hello@superkali.me>
> 
> Fake test, drop tag.
> 
> Why is this so problem to provide the tag ONLY to the patches which were
>  actually tested?

Please teach b4 to skip to skip Tested-by on dt-bindings patches (or to
have a flag / config to achieve that). This would solve 80% of these
issues.

-- 
With best wishes
Dmitry
