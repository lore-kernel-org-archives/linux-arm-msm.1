Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71F443A80
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675558; cv=none; b=mVBGMlE7gD7RQGwgL4gQwQHDXJ/ehutrEUzOIO+aV2KSUnDAgPMT26r0vzK7UNeMgXQ0zJDjJCBHnZO0jQ3ZS1W0vGIQ2R2Z+Ai2whm9C8eWWzWw71VUPBHfWyjQHOOIXrhgwPZHD0rapDMYdnPlWOgv3UL24RyBVHx733Il06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675558; c=relaxed/simple;
	bh=E1xUp544mD8hGvP00uo8LYF6vpui1oe6A/h2MQI3tcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foRr6aLrrvC8lERbig1EnK+lTVZxjcbmFuN+ZU880iMbtNryKQNiRkFKzL3wbo71H9T3pbVwxXtCdtxolnydXmlmUBP33wmNSdQsRPAP9rG/XhFP0NzCq356M05NBIAw26Xtikmf6km5g+JD5m3VZstHX+yorZO2NXBrW9+kmaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyjhpNuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpzEF/OJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyjhpNuQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpzEF/OJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZHkp2812323
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=; b=TyjhpNuQp9BpmM/V
	hfQs5MsNOrBW1VnKtfA0geUyje2hqOzgCxZOTVB14J8kQp2pNW0lnHztMhjd0miZ
	WUV0rQLcB2+sOlmqMFqUgOlXTKVtdWO+28SbCedt24QqSUtxq+Y9zQclgnwh+/Lk
	ZTysoWbUNMJpkiV4aMXq+5a8NYnx6S4vk+8blIndxvy9Lr/NnADPPRIPPewNHLCf
	0+EWoShyXWhhCpCCuXE1h2QYuCVcZvJ6ugfBE2ofp/zGdYVNY2/d97wstKGHK8+k
	COMstR8LkOw7eaBhk8wgzgfabf788U2GzvuUEYubL0TlKoVPzntmaILtLebPUmDJ
	YH/4lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e1870-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:12:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-520a00c7a03so147016241cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675555; x=1785280355; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=;
        b=CpzEF/OJpi2pVhyPFqSaRd2clSv+no9zjpxf82fdEcWRIEtZYwGL/wBE9rEWaHsiSH
         g4DYoyeq7SwVITyoVeqdkZcAslTD41RbfTz0QsMEFoXeav2NvXlvBwwrbGwOglSGcxsz
         IkzK8ZrKhGN/TWzh8OGG8gpKNATuWY+y+n2KhEJz+nq7JUm1rWcPclRWiFT0l3Fv9WZb
         NKhz60nzpXr4LQm7nIdo9FZ70KmmTqjZ9aZHr2i7ZtY5s1QEu108RDOUDuinKhkU0tlM
         2n6rGaVcplpYK+xospyMKcHJTutwVMR7QbNPGPjheu+5cUxlMiQVC6/FlwnAYjEWsao8
         YdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675555; x=1785280355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IF+4fh1OWmacQfGFecoHPZmQhHgE3MzLCqCvWU+XHF4=;
        b=ckoNYBhFBs6Gk6pDvekVfncaE+RwT8g5PqkTYD6fUzrRz1Bz1OEqDQPbsaE1xgt+lu
         h86NkvRbe7kH+N06O/8z1ImRSh5zzvQhtLpgf7on3RUsaVNAm6KsbF49Nql2NX/ghxVl
         f6XHbs2n5VNKDOiZ6rb7dZJnvBhp2bCOFjZdnMs/58boOPt/1pzXwyRVj6/4HPegWCxD
         WkoEvS57Iw5UzS3qxQR34+7M/9XNSSpg6+YMtd40Xm8DkvRM9XrQfFJdcVhr6O+0DnRm
         ee0dveOTRzY+P7gHB6qR+aNkm8P8LN5Y2QKwDnCtHTERLcWNn/m6q269Xp8fLBIBghkq
         h/3w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Ox5LiG3YEdvK3xUW1ZHsidyS+VBbcH3RCYHEauJS12lV2MHmtecKcIW36XoQlYSFFvlg7OnSgEehMJOt@vger.kernel.org
X-Gm-Message-State: AOJu0YycwcNL6B+vnRaM2z8yXF182EcB5Y14wUcAgSCD3QxPm63VTPC2
	AXy9eL8vGebKuy/UChErF3Wkpb28QL6zHh5qjvGvl4dTAZuStGYe6SKVtyIK5GkU8NILVzwKIO4
	m2zUJvMe3t9JJFw6JM0gbv3cD9tpi1k3+nRFhmNZZJ5FTu9VKNIMI4s/qjPC0h1Lq8mko
X-Gm-Gg: AfdE7cnnF93vF7uO8y4SWfxO8OkqvpzzxFhBsoGL2aYeEKMkfwz4my77ds/IuFB4tUS
	rdt7nj7EkHF2LXAu4mduVhuxUjLFaPYbuJgS4gr0M2MAVVQfjra5496qdTdv562CQHmGYlVTW5/
	aPsGKeszINOc7CfzXS4jlof640CsA808ZNBut3AQVkkUdrqSGemI3ReL+2HKS8w3WVoIH4ocnt5
	r0cgdGxg9300ojlSQbcPs9mI/V61EBHoP5NmV1admT/4Y+OWdMB3luxDNNkcxLRddcWRChSOxBs
	s5nlXT8yQnuiKcB+3aSP8Oz5VEQzDEKmijOr1zhVT8gEuBKLd8USiJk8XlBgEhegGXHW//KGrAZ
	W3tf7tcQYG3Ydbp1MzAu+elXhTEIX17+QP7zjj2tmzFXc6xYmwhWZpVWoUaOS2cAfQaL/4qgLjx
	0VtjvwCl6uy52f1A==
X-Received: by 2002:a05:622a:1e0d:b0:51c:7b11:41a8 with SMTP id d75a77b69052e-5213f959c7amr204205941cf.85.1784675554622;
        Tue, 21 Jul 2026 16:12:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0d:b0:51c:7b11:41a8 with SMTP id d75a77b69052e-5213f959c7amr204205581cf.85.1784675554256;
        Tue, 21 Jul 2026 16:12:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bafdf5sm155867e87.35.2026.07.21.16.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:12:32 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Message-ID: <wskpf27kmooybswypyzt2vcadh347rfzrd5mpjwrczjlxnsczb@hjlaoqbscupy>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
X-Proofpoint-GUID: qhZbAN4V3nfa26kRx3QBV-LOBCDLE1oX
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5ffce3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qhZbAN4V3nfa26kRx3QBV-LOBCDLE1oX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX/FstODODrxpr
 9rpqUvV0jRFKIsSY61ZWCsPH60YC6BnNxh8uDzoz9JlP6sEAnVehFUwb+q7dYyypbL4MnHoYzPh
 V45SulDCXAtjNG+vLD8bNIhb4OQtkyhJDnHianeYiBFY4FJ6Pb/YklLE7QJhwYSkyeQbt7FpeLB
 khTWtez+hE8Efu4zCLUzfEeVRak+qVghhGsX9LxawpDxDkoY+xEwwckUBctKB/lpjwtbySxcg2X
 LW+WwXiWBZYp9TyncKMxEwjpLfWy/xNV01XuMpb4wKukYT7n/yq/m4wThJ/IOW6rY6CcEap27tI
 HZc9jK6AsXK7oBqYsdsiU/Mr9diA7ymS7sNjteVAhsKWJWKhVQzQ3sLISErYx/9oM/uRLsBOEzZ
 xXM41sNhtpYxKoFlKec1MN6c9VgLV1bFH8zmT/f0gqWpNIAoAFHjFObOHvLqM0goQRtAUTkAr2T
 J3W+P/E093zO54V5EDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXyr654Sp34Bbx
 BVgSYYnfMLENnk1qmNZGxqYhGnR5zbzCNsWXr0VMikEw76Xp+XSKrQiU2Bo2qwkRL0NUV1+Ye86
 Hc+h1+uQNlrKJ3Ue1rAKRSve0wVbTyc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:04AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
