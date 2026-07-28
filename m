Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC935975
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246953; cv=none; b=Q2G+ImBf5PG3L6boatKALEVIoIfuU1a1vul1G6CAyJ3YyNAOhF71Q9eOTB1Thr4ISqPDsmRnLwqOkJX8j4ZSc0nrdXriv8LY8Y4mA9J3MBa7HooZoazRBDDb+MR5jeBOdllQ9RXOEw8WEfN4WxpEBsg3Knt7e1hTrxo6RXh2ePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246953; c=relaxed/simple;
	bh=VQCqYipKhaYc3drzMi8ohW88BGCSkhkC4BLjw3w3CUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyWQtabhg/dF6fInsUaJM66WprTLn2Hbd0ihgP1vsb0KzdFTX+YK6SZcIEoLscBuFvaa/+Zh370PyKSQzzOxnEBdoIeNpWNicYlSrXl4/ivsIwEpjBV6meA0J9odi3G5h0vH965l4Sn8OSE4bg0LNhKiXGA6dyvF0oYxtjucyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgCnZ1UF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6KzTRlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgCnZ1UF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6KzTRlJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOmhd3059617
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mtoagmi6BdOTkZj+CalCqX6q
	gly/BGfEFFLqULCMY94=; b=VgCnZ1UFOd+Vpln+BIZJre9jovBCUuvDZFHkoO7A
	Yn2Bw9kmZORHexbZqmTG0V/1plV3SDSrhJt7OFst9KwPT3nX0Fk3y9KZWMzvgOqZ
	bBf3X11z7dJyXJitenqGFM1C+3EKMHZefRye1Dd4+ESacetLc5869eT55E3Zhxce
	sSxzsIfeBVyymeSkP8EZLnZd1sVP59btLCMl36oRnx2Rux4LF+RQ5vaBstl4mXAJ
	ro1g7Qo+TG1FDpBuwgX4fenjbMErAk9fgvkfhbIbLI5WPpJiRye8lehvSNKz/zxW
	96eo647D//xns44mj00ZiTtXWIEV/alZlyfSrhnBslByGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7k4eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 13:55:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so38371721cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785246951; x=1785851751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtoagmi6BdOTkZj+CalCqX6qgly/BGfEFFLqULCMY94=;
        b=L6KzTRlJy7yeu/BfKwzb+mvqZIARVwbBtU0AyQ4uhgpsO9ZT5fUnUri0OcIUtGNM/N
         OL/V6GTFIQaYVuDdz9OHTlveXHimkihz98pO3ae/4mJK5JUsYGNNVF3luF3dkppMdQkZ
         NzZdIzKTDXmGpU24uvQidsTznDiNhz6uFYyXiErOG+vzV0qhjVrQzVRFzy9Mbgn+5/1s
         pWafNnChKmdhRjWkjT63BJJS8HNTtlp7QF0qWGMx0tVu0I89MGeTIcxYjqTCjgdKtvE2
         kTclmdH+PpciUSUqFkhVfbYOXLfB2IENRkSA0dVPrT6vkda+Xy3tYZGuBxL2OnfQNuqY
         XxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246951; x=1785851751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtoagmi6BdOTkZj+CalCqX6qgly/BGfEFFLqULCMY94=;
        b=aiVF23uaFcGvuxFZji5RPuvWgo4ue8f6DMjsnMzor4E/QIA1k2hgib6UjHb7P8nGTW
         VFyq4GIcJtTKio5M77ueYE/oF1jqeySluyTxp0VXQlpt9FPTNUHQscU1fyTL7H3MGSDS
         FdO91FJPCyM+K9GKsI+kZxuiEPMcmTDqhqS1g43CxYVBs53oS05x8iQ4BZ7DEKSWyae/
         Jh5QO9iMldYaF0O3qR8q5eCyM33j21po6YM7/exjEVuBnsY2YmuHDx56XQU+g63Doaak
         iSt1/Bqfx96tVytRVjFd1KYX5v72WrWBwIhbibSfIBMAjkLdG4NcMa5AM2XIuWUHsrwn
         hRIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrfgp7EdV29tbSSjD5ai1pe0/73/Q3+JV26qJ1ZN/kjgqT/dmu2XZw01FaX0wwjyCr/Pylt5HTRUcr8etk/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00G52F1Bm1KgkseaQhkuj6M/7MXUs75pYrumNcmF4lIyM/HaF
	KrGfnWxuD8KIhkX/CvJzcMyaYtH2fqxXcKQyZu9eIcJW25XPHUkXi63WXy/ysHiJcUKFGtXr6iZ
	m0aY5VD2ZrpaoNU18MrCQDwVIp93r7Zz5esTaPqQOyttBp1NolqCNbRbjuOyod0xdbbJe
X-Gm-Gg: AR+sD11dejA7Wy4IuFgP1N6nFpnKq9GxaV7lmLeJejPxRAlhDAA/ahj07LWUgr3ZfVJ
	wrbTbmCiu6NtlD0bEAAe84GKJd5IqSHnY0bq4F326wUf8oJKV9fMm8X6wXJsluVyHOQ3h/1U2jX
	1owslOroiZQkhbLdR80mAwAcEvN6uuD8FrR3z8MuguJMgDuAn8pSvA21Di2ihbbq37liKo8kyfg
	g3zXu5WwcAJnDVKSx3WMdv4JMyUigB4voQS74shQ+vkBXlLG1d5lnE0FZXsAM960WZXNR2RzUbk
	Unb3z7dYmlDGnhjZ4/9vbKpEZ0ENt962KF6HsXmw4nGh+xSQEa6Uj8GUOtV/2OWTcqY7m5e949X
	hnjYz7eshd+TAZZShIsbSZhE4Pww5TjCQWGNWMG4KkMkrnkbHzXvBdEU5j1u6EQOzzmEc+o8W2R
	FKJ+l0ixzTUKj2oQ==
X-Received: by 2002:a05:622a:1a99:b0:51c:1408:6c12 with SMTP id d75a77b69052e-529d70d6b93mr20832451cf.47.1785246950636;
        Tue, 28 Jul 2026 06:55:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1a99:b0:51c:1408:6c12 with SMTP id d75a77b69052e-529d70d6b93mr20831901cf.47.1785246950086;
        Tue, 28 Jul 2026 06:55:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d8646sm2123808e87.49.2026.07.28.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:55:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:55:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] drm/msm/dsi: Drop dev_pm_opp_set_rate(0)
Message-ID: <fd6hciya5s7maf5f4s2kewtnnqb25wpacmlswwbo2t4tpp54sz@vo47q2b4fuwn>
References: <20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com>
 <20260728-topic-dpu_power-v1-3-e7783b859a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-dpu_power-v1-3-e7783b859a70@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyMyBTYWx0ZWRfXy0k7tppPhCSN
 Inz/AqeMHxkfK+sPmbtIUuulH5Llbv8E+zNx7BQOg/1G1NG7f/O6DTKUG7M2UXYSqKu1Ia6lCiH
 9XpvrUTwGdRwPmGpwMkmwh4ix60DlUXmax2x453mQ0EZTJfv1ulXbxa4FsNhsv8xYgaQ8FPHi4N
 pe70gUs6Kh+9Pw/87U5CnXJOdePfs4GBvokE1AMoSvl9gjIbJS4kxZnkPdRZ2WldBEV/B5sP12Z
 nbNUPJmY4wK0kRnZsPK7cjlk3/IK5gP4tPK1Rb5iQ57EjpveCEQKIBeDWLLs6UcDSz0yxGCV4dw
 lWg5skGE0Ccg8ZLyyPr9cDbt3Pn3Cyni49LPs0X00zyz0+ZqqKhNzRaNHk1BxhlAHsWKhbyuxDm
 OeSky8zwRJpOf7TdPrIxgXG65wBCn0ZtatTgBIxvdxPI4rYt/cq2/S5whVo0qVJASDqwIQxEAzE
 ywUnMoTN8LpXcPZFM6Q==
X-Proofpoint-ORIG-GUID: pS-nTbHU0iPuDodVvdlE7kwUK6kkMtd6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyMyBTYWx0ZWRfX1HskuQ16hzw5
 RNIcw3CnrNTfhVuDHLLotOmjqPOqmwGsVFhn0v66Ppv4Dy27xO4BxkLMML0l5bJ5c89yvltBfj6
 Kif9xS2b1hLcoGyd6xZbim8iK1m1Kgw=
X-Proofpoint-GUID: pS-nTbHU0iPuDodVvdlE7kwUK6kkMtd6
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68b4e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ze_z4zfmBB5lhDDjiZgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280123

On Tue, Jul 28, 2026 at 03:20:47PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> dev_pm_opp_set_rate(0) removes the vote specified in required-opps but
> does not actually park the clock, making it run without the necessary
> power backing. Drop the explicit call to it.
> 
> Every call site of ops->link_clk_disable() is followed by
> pm_runtime_put(), so the power vote will be rescinded if deemed safe.
> 
> Fixes: 32d3e0feccfe ("drm/msm: dsi: Use OPP API to set clk/perf state")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
