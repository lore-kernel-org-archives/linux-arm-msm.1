Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E537BE95
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178044; cv=none; b=QkjJYSrNENEaSTjjwNxNe/oAQzQI/CnsVUGYyFQD0KGBBZPLMTusH2EFIKxOYwXlIE4KgMLzW63K+yDOyavfBN2iiCAQ60dmgiK4B+TWH4hw3TgeF9qzqS77vB8+HID7Bf7595UlUJpyXdUnq5VY7vjx2suqVm6Kbj5P8Zfw1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178044; c=relaxed/simple;
	bh=kyEHalccY5j3hAHpuFVIDa6QzI7wa3NGYPf/Wl+1w9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1O0r0lruwSbcb/KXIQZnI62bQ4Fll45CVuk5OkAemR2ksrhkuvXdcywANUwZvcW/sMoy7PzKz+xvh6BRDudH0DXQnsDPTXTrw+N4SlPyiMMc/QHULU7EYqliP5WoI2xCbPwjtXw49FoFi1ji7ggvRYP618AYwrn4Q1XpJD6KAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEa7alHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6aV7919; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEa7alHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6aV7919"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICEDC310004
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kyEHalccY5j3hAHpuFVIDa6Q
	zI7wa3NGYPf/Wl+1w9M=; b=UEa7alHKkQHrL1P8pJOPD6clscBoMgUn0v422lDS
	WzGalaC8G0Ic9QzeB7mC1D8E5WDnTKalW0+H8IsMhIAd4SX8EfmwADHm5aEctEq+
	6Oh91sPQgRncD9m10rnxtpxeGFqlIUf0gea5gmwM/lMOv8NFtAkUM1wItwT2XrY4
	ddbVGWuAEwkmT6WP5OMpTB1KgDoXD8OGthp26ruwFw1bntjZnpb5Wpk9e5gjmRNb
	JCkGg3FT8LhksiRpQ2344uyCv/9JSA1YiLku1E5Zog+sBjaK06OZSpxvFjn42poF
	d9OBwu021WTxqtyaKsvumXKo8Hb4iRqZDcxYrHQ0+mGtVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn88ccs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:47:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso83204495ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785178040; x=1785782840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyEHalccY5j3hAHpuFVIDa6QzI7wa3NGYPf/Wl+1w9M=;
        b=A6aV79191ZEAHX3m0+Xfe6Ct3Q8Ran/6vJD8cgQMXFaWf7S7L0lPrPkqjQiHM1bCmc
         3ByCem8im9ptx2pLXkxtELlqSOTv2GVrmMOsEGxdTQc7f2coa0/iLNkeG05a/WO8DU5/
         2SDhwSMcCh2mDGRWHoCPZf7jT55wjnPVCZnDYaK8lWKVgRl3qeIyq0wW5Zs3dj5ey3ta
         kWUUNyCEEGPgQ+xbSGHcvJP9jAb6BbtsN59IicurB9wBjcbc+qpD7mC0I/4kdblQbKJx
         DWM+884efe4iON+2p90hO+2VEbqpKJu0YnNMKAbig+HtvsnIgx7b8dAj1h1IoThJrxZE
         GMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178040; x=1785782840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyEHalccY5j3hAHpuFVIDa6QzI7wa3NGYPf/Wl+1w9M=;
        b=KPs6SBi1UqXsSS5w+LxmXEOTBXl+jgkgwWLslXjqkolgQtaMXaJdSFqyvxdGXNNr2p
         N5JG2KfuuSd1qOC/fng2YeTxxuoOzzTnwmYId0yjYGyrKIB+LVWbAa3Bq/i1mFgA3Gho
         TjCLnngCROJVV6KjulvduzGfB2S2nQb6YFoXfA0lqphQT2cm31q8KoG7o6e/caM9mr95
         rcA/qKiyqmQ2fHKQQJjmX41epFcTFA7QpkRvBIBRIcLNNET33qP9hrP1j0XXA8QKRlJ/
         tcOEDcVoeomqO8I8PhHBVBnDrW3HMfDLeN90h1Mo2RyXZZwRapyzHsEf917RnEXemLdE
         xV9g==
X-Gm-Message-State: AOJu0Yx3sZorIZvSYj0pIRJ7zI+SmnwtHigZsHZWfFreO5D5QqPhJxDe
	69aaciSM7+UqQW8WsthlfyUJ6P2rKkTrHCSO0AVlZM/kOuEi8PqOzRlUPREoLMO44DVl6Q2Z74x
	wsxLpkfReKulOKFsliO7hU92I3J9SuCvXn9w5cUg224QbEOaxZ6g1SdvRULHyrWQivk41
X-Gm-Gg: AR+sD13rPh7T4I8N8AYMmA3VybfwH2UxQNDr4iCumg2cH6r7VJdJYC3LsbHUNsd//VS
	fIrKDMtzZgGrJuIGXDAMLigM0rJcu/bhGD6BE9NlREdtLGx+Kq1vyE8QAYg1fsshZej4oV89Jmt
	WtwuSPvm5H2levv+H0AZ+EJXPd5tsMpDu7Zfm9LrKIWCRNFCDDpXFIgtIAcApMbkmUSfSXiNHUa
	JGZLJ53zEL/hhRzAvZ2ov/xP7TQa0WKHWKaTY85U9cN3xG7pET7eCts/+fyLwZExTRfWrGZJJtL
	Keyb6P2uh38T6AcrQ/ga8d8BbwcrAaYvnSTo/uPcX5MRDsgZor/H3hIDv6OUUaznh/OzaKZCtbA
	GIYilRAdnyKr95WSQTvgidFPV9xGWlfeRBTEJfw==
X-Received: by 2002:a05:6a20:4304:b0:3c3:7427:5ed8 with SMTP id adf61e73a8af0-3c67d9b3dd2mr9365053637.8.1785178040518;
        Mon, 27 Jul 2026 11:47:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3c3:7427:5ed8 with SMTP id adf61e73a8af0-3c67d9b3dd2mr9365023637.8.1785178039993;
        Mon, 27 Jul 2026 11:47:19 -0700 (PDT)
Received: from hu-pdahiwal-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548f5dsm40503318eec.17.2026.07.27.11.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:47:19 -0700 (PDT)
Date: Tue, 28 Jul 2026 00:17:14 +0530
From: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
Message-ID: <amensvsgyWycuorZ@hu-pdahiwal-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3NCBTYWx0ZWRfXwP7HJZUuufJn
 ss6Y3H5EfRNgXSABRJIsx6Utn667lvuI4Lp/t2FZIYsER1UjO+3r3CcjxCKqRn+Uy3Gqdi3MMzW
 G3/UjPbOs1/wFuErFbgyWNs0AsEbTxyPCxm2eNwQLkZPm/U2diuNdxJaBu2QEuqvPUGOWg0t6bd
 2cwLnazgf6UdpOE2g7zNrGzlUF9fC1hI9TrMGLhe0JXjzZCXIW8BfVJyhc/8MoX1UeAy4wGqodM
 FtaNpuuUocGcj6w1efe8+mRss6huxkjXQMQbAN0YkifA+PowoUNn4haNyzc2yXsfNEh1h/02N4u
 YpLuOyvBucgE/quw77WkawA9tTSN6ej7/6YTQ7NTC6xzz7YJU89wyrpvqX8UkqTBkZKtbZ4P0/C
 yrYJdrchqQCP2wl++hS9H3uLk856PHZJ59v0Uh+42WOz6KrGbtcykxwLObuk0vx53AV6wLjLpW+
 QP1ZLK9GW1UroOuSLKQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a67a7b9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gFLKI6dmmxo6iO6rY8EA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jdk7RWQtVehhv_fijM1BpOTbYOcprjHi
X-Proofpoint-GUID: jdk7RWQtVehhv_fijM1BpOTbYOcprjHi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3NCBTYWx0ZWRfX/XU27J/kiPx2
 tqO4h9vC930VxG23+ZIyBSwgBl4Wb0h5IZFyTyldlWeKKr1nN3WkceqgpJlRIaubWs1/u7Bdrah
 uotNPNFNfxLvxjqdptUZl8KBWHxJUnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270174

On Thu, Jul 23, 2026 at 03:52:29AM +0000, Bjorn Andersson wrote:
> rproc_del() is subjected to the reference counted shutdown path, as such
> a remoteproc with more than one reference will be left running as its
> resources are released underneath it.
>
> Refactor the shutdown path such that the reference count value is
> ignored when called from rproc_del().

Reviewed-by: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
