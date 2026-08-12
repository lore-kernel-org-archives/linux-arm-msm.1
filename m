Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13C372B5A
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545132; cv=none; b=sQaZN1W1folm0ZT8+ADmFabjPYRdpFjeBCkeOCYTtcQbTDtYs+XavLO/ynlj+/IcrNkqVIyTgQ4sItRDyHX8aqCfms6WMuhnyE/D+LKCOk9TO+Qrt5OcAj3ohjxg1jvCCJ7WXtEZBdI/ZD4ajy5kq+ruOojz7FHaoKnn+XS81l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545132; c=relaxed/simple;
	bh=gM0nHJswYsQGlEMM2wnxGSY8PgJbTqajHeJC3cGY5tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNeQtVutwPhU1x32+qxPSZ65bMwTsou9qcoME6Rb8dleV+sbh2y9MARxca/q2NIIDLQNWkC0hbRSy3ZHfBVBkMILfsjyOtOwbH2j8N/WmBBnQ9g3+MT7WK/EiyhD5mhIgX7Ll0SNhNDlBqkTa97XmZfSgPoySLSw55aJQx/HdKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwX6X1zK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYeOtqQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwX6X1zK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYeOtqQK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbcqp3641663
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2b9ucQbCOcJlMYk8xh80lY27MxbfobDGiV8HSdx85c=; b=AwX6X1zKLyNH68Qr
	NwQI1ywuw5pQNvX3SCRTBf5hvEwtFaxF4nm3T6ZdxQe2ORLIZX5I5HzMWHYLCLo4
	j14btvFNrOQLkQdFjuf9TgEuRJBXOHHW+izLP5rTdhiyrJEKmLcIvt+1oOPo6Y42
	ERZpyvq1EaLNvUtadXFWKnOqfX0sw+Vj3IXqh11XvtnQwivbllHP+te4yDudbHsh
	k39Zo5m0UFr+Z9vow1rJPdfsjjhMvyiVuga3b/SfnVRRpEe8W5eoYm/v0jGi4XKI
	/++geAyAwkxERcU04cfsi7AIEgLeBjZluqiS7tPtgx+BJ5ms663rAeuaF7eHKgKg
	ANqXbQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d1871-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:32:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7563011591bso159178137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786545129; x=1787149929; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2b9ucQbCOcJlMYk8xh80lY27MxbfobDGiV8HSdx85c=;
        b=PYeOtqQKgP1/GEuDveenx65x4/ysHFRzhPlizZexkf/hUwjDLTllFQ76oSOCmLESti
         HNgg2mMz9RBWoMhYsO0rHHnwpMurQLpHBid07KzEb01IfEPkyLwap7F3NoXapZw5xioI
         2Yll6Ko8f1xP+4nlf9hXcbZ0cjH2jBFzQZXSAnDnFRauCXJk7AiRf7DzcxgixHxE06s7
         WrB4ipzAVt/5C7+Pz5rrcoJl92HSaceIvl5RAS4TxYxVHY3lKqgiLbtfL8EFmEWYA3ij
         Twt8DwIC4sfpZD6DU5+q0MEOmideHkr3d9ObBBzWAVTemOSxqCVfn5EOeX5ajNsKRhMw
         i+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786545129; x=1787149929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V2b9ucQbCOcJlMYk8xh80lY27MxbfobDGiV8HSdx85c=;
        b=ownAQ1Dht8Q7BNV6aOxDqDOX/LU4YNqJCIJGMGt5h/57bLKMEzIfLPKYFmgLEByhKR
         65UzPv4+uLMMCBHB570UY/ztD5AFN1PviCGy3HM1mFB7eHtQNT4wHQpUE9MX3nT64J2T
         fBFb8vsfncZHQc+/oLp5K/2W5n3qthlb4ANMCUmvdpOVJlqttPi35PLlU2aSjNQwtANA
         cpnVrq2FOHGaAF4RyFYRrVKlt0M/8fDhwHb8UnbCKQAbjw+Sex2A8Qc+yeeS9Yz2F0iO
         bPzjGN8be+csVEnKfI+Fz5oVnd1JybzFuz9LoDxhpMcLZ+oIxS2Q4MhpNDa4GiSwaiX5
         rhBg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Hguh7m3rfQhNbkIWHt7EA9ZGboLg59kwrtzjg3jXYo2TTfsJhnuJw6b3uV3jxACo1Fbk0+AJxJcZlX9F@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFK+fJbyWEnB2/GHo+56D+eeyn+ebiPQwx1lw9B1hWJfVe0HR
	f1ic2N6l/0ZTfpjqYd5CePQTipq3bvnCpAe7SSOFtMKwSrX/TXYrl+vLzngAEQ6Pq3zvGGey/2P
	4NyWRdIYvXUZNzfWFjXAjXWYApUiwydn9BCm2dJQtN+xpPWeMrB0cSX4ZXOf9J3/Mq/Y7c1V2pl
	Wh
X-Gm-Gg: AR+sD12S3nja+0M7tl88zb9spccM0OgNIs+4DB62iucET/GewtBP7lGlcyTIrw8OCyk
	7eYKLjZ6dCFfTbyv7/n+4qTq0wiwZozItH/auUCEm5dXt9yFKb5v32asrWWvh+zbrgY/7rrlbdq
	9oCEqkKgX/Z47N1B3uCM7EfBvEul+0UutPi7G/MlU2O9H5sdBF5cteYvVwRgkPQwG28NiaWBDQb
	ouLyehaY+F/BUWifppxlKCOOVRavOw6DNLpgRz3xUjgpMnL3mDelbtevSQtasCPUbPxBGdEoy4l
	yxka4ndfuLdKSjnWzek55mcP4AgxQ59/UbBoUI++DWNKEBB76gj7WBK8BE2dpTtp314Il7BJ9sO
	YdAku6P3hI69l/bF0Fb4PaJ1TZ5TfyHXn2u3x+1xlNX9fkNbLxvXOSAG2XNGncAtyv9lXtwmYcs
	HXGwWp8G+Hvaej
X-Received: by 2002:a05:6102:1481:b0:738:d6c:7104 with SMTP id ada2fe7eead31-76c83c1b82cmr1169663137.0.1786545128788;
        Wed, 12 Aug 2026 07:32:08 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:738:d6c:7104 with SMTP id ada2fe7eead31-76c83c1b82cmr1169643137.0.1786545128321;
        Wed, 12 Aug 2026 07:32:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfb28d9sm548643e87.8.2026.08.12.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:32:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:32:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Fix missing include
Message-ID: <5fy7l6o5nfzclsmhsqys562xwoilbo4xv3af65kcqugtitgltd@3fw2w443pw2g>
References: <20260812132621.679515-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812132621.679515-1-daniel.baluta@nxp.com>
X-Proofpoint-ORIG-GUID: TC0UG_eJ5SVqCoLDd8Ubwma3lg1k0cMz
X-Proofpoint-GUID: TC0UG_eJ5SVqCoLDd8Ubwma3lg1k0cMz
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c83e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=xo27-gyItSoTN-3JJZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExOSBTYWx0ZWRfX1j5XdNjaIi0H
 F/k0wRmjdWLtjLZpCogz0SogHoRqQy5NOy7cwuU+JgHw47WQGZPEQT8Ic7VhUbrYx6wx6+XhnWA
 1cOrf6Mhkaj+qevt6EIdS2e8PkzYkMeIG+5Frl/2XD1fG83xs8wdCemgFleTAQUETTcqPRlJS6O
 markya0IhpPRBsMvH4iaF1H5IqtMyiHlElvkU0uOyaohFhJQ8bZHu9ngyc5KxkbHGTjeFp/MoiO
 fB5YKmfEpI5aeqwoSmXjOjilyu0ArYEK8wAlMDC4yxpSA1qOk9csbM5Wr0IKEtUDGH/DwRkgsT7
 YUVgrwcwMpZN0k1OdbPCq4j9C5OoIZRpbD6vcXJyIZ1NSzp8uMG9k/VtG8+UJmK3jGcGldSHtj0
 djxVq2ZZRxa9SYOUAcX7y3C20lD12nLH426dzJ6Phq8S09mSvEzru0BYEjTdHSPedUwPjw3YIq/
 z33g9AiUvM+K7N+hzeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExOSBTYWx0ZWRfX2xx5SlPU6w5X
 YChm8ev8/h8mWQgy4I28HynjVVUQ8WkwT9jvTx1lMcn1I7OQmcv+/QGJyQUyd5B8jfpCxe/amUy
 NVEylhE1GBqHo+cuUzFbo3lAFaDav+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120119

On Wed, Aug 12, 2026 at 04:26:21PM +0300, Daniel Baluta wrote:
> When CONFIG_QCOM_UBWC_CONFIG=n, compiler needs to know the definition
> of ERR_PTR otherwise there will be a compilation error:
> 
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
> ./include/linux/soc/qcom/ubwc.h: In function ‘qcom_ubwc_config_get_data’:
> ./include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of
> function ‘ERR_PTR’ [-Wimplicit-function-declaration]
> 
> Fix this by including <linux/err.h>
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
