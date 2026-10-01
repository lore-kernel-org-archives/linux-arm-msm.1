Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA74B1486
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850231; cv=none; b=fGC80j0BrGh7z4qMamNvmzhoFlvtU26bCbAH544vUkbSJwdXTEIahtP4S9DMZdMoegvNfMIwU37cUf38Tmkw0mRvZ24Oq6rnV1QQpeZkBVemdnftYHk4XMWGin7t6sLoYlXkAV2ySvRLQ9kTFDthuNSXZ9BoyQyFIQdR5id4A+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850231; c=relaxed/simple;
	bh=28gSEAMplPj1l0fuQTtVo8owl1qoPoCfBXoJ+dhpPcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVRXdn10+UfKGCIEYoqKyV/lM4925qcQVeeUJlje4rTFChRuNDIUfPSPl/T704NLLf7ZmxBRS/4mrfA+8O32RPmTeHuiiwkkCqgQSEc5z9DJ5+OhONV3pR7qcTnyQxZb52MyPyspKYKiIE3cQ93iGUu5wItfb780ij9R2PUeQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIrt2Iam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBPAHGT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIrt2Iam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBPAHGT5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xOXV2176831
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yzAz2SWMqrTWqYRsucc7HPMS
	f2cC52cQm3KTbr2oPBs=; b=MIrt2IameCE0cj5sY1K8wpPRBmwy65JqkGjc1Qsp
	prgKmPwhBAAB6qFYeHuDUQMpfCYM4x6X1BVIKr+3XO0g/lkaW8PeRlGdzGN9Sqwu
	HZkmowlmhOIWGYgd+I3u3rTAZb7bTa7zaa9zn9yP628KQX3pCW3c+Gv2kF/RWdKj
	5Hpz8FktqStmcNBdS6HuXDy8ZigDmmvwqAuNhqoL5TdfEZRAct9V51WA2dmjoyFI
	x84w0mQr80Vww7ZLFxvkLwOGd3U6IbQLAirCaDg20JbOnSNgxzgZt6mTXnPy2+LQ
	sCi/ZTypQqPDvRnlduXsOjQgn9qGGvYO5YIgm93lWg5uHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsaqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:23:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so971106885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850228; x=1791455028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzAz2SWMqrTWqYRsucc7HPMSf2cC52cQm3KTbr2oPBs=;
        b=RBPAHGT5Qh7e5jCVPGOc1VRQ0nt/sQ/1yqty16DP47Bc7by3Zl0loUaLzqoHlFWUmJ
         xlf/rCGFAX6va4+nTMUlP23J73OR82LpeTObyuSHSRQdcntib+6i8HHWT9RmFtYEbdvH
         BXO04a8lgYNXP4eZP5Vjrv5QE6BHVTc3Iq2aUJkF1TAovYraIJId26lNka3HD+7ORd4G
         Ez8P8iNKM1KqpqXbOSLLUKz98SN/Ytr97558fNU+57PJkAptbmqNrK4bwOj7k50xgb4D
         /COV8vgRq15Gt2hZpDSMOfLjI8MeWeduTArVzdcOqv9UBEwIrRRb4cch2qe6mUD7KfIz
         65iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850228; x=1791455028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzAz2SWMqrTWqYRsucc7HPMSf2cC52cQm3KTbr2oPBs=;
        b=Z6CewB+SmlSo1CGGUz83AP8mTNgjCJDAxUyqswqmXoJoPInoFYI7AlMmgFRakK6zeJ
         NOstOygH8Kw74tkAea/K6lrdLT34neI9ozKm6KE8EMibXs81Hv+u3+1xTEpG9gbXw73T
         fRg1xriKSFqerzzTvxdr3IQkx1cN9z6CFQxnXcNP2XWfk3OW2BgpN+sdGov2ieKTRyAZ
         KzAfZxAlRN0zZhyt3QQgfYeIgZ1NTiASLwypyz3CjxeqaHCq0WE9us3PrXpQ4Sd7HE6I
         VzxtCFh2tdCr6mfcR0f5dFCTfkcNchRpKBOwvJh57gNr4HaNgmcMW1zj7xzKOt6WMzQw
         o/QQ==
X-Forwarded-Encrypted: i=1; AKwUvBygrthVx05o+WpCXwZiilOEKGEieNWdMp4mGS2sRkGLiWKRyQeHI0+N7i4Ocmom//Z4oOZyakUl/o+y4S0L@vger.kernel.org
X-Gm-Message-State: AFuF++nfaO/acVJOPU6lvJunr6AdPb8Q/8SvhmRFI8RV3PE7JM/scI/A
	H64rkZMIibj062y/LvoeOpuFMUa59ds4FAEhPz59F2jlo/QT2UKP+bgyyqKKYuHiKVbAnfujU7B
	GW65FCo1UEfxHtk2KMLxaIAxgsbe3LZ4vyrQ1ei+h3veDGWPYsDG72VJ5EgigOmHBL1wp
X-Gm-Gg: AYBFou3y4p7q0nSPUmdvGHXk+X3nIacMzFhAUWZuOOQcaAhw8gSst74Vd+3yX32hybQ
	0EY3lfnF622fbK50fzgC++Z/XID/VAICBKhaZI8TaVJ4ysCBFER9KdfGNjjgMfqlEkVuJSDHhpU
	lm24HuyCkL8G3naBJsovbQf1lPd7ncOPKAQ4WLlHKYtaH/T1K2Kmt3tMoWHQAqm2yTXuv5cPMV0
	eepLYJhOIkrOo0b0sRzcUbptfPlaNgGiPnWi6XaC0bxw42uM4TXRX6ymDiwveesMvv4A9Nt6d5w
	Z/QF762HuNG3qApiB8yzXZkbqVDFvRisu6rgdWyEK5r31Ux26B2PtzN4CndqlH5VQMrh0r+Oh/u
	N29RkUMTfz7a7/pgX0SlBgp5Mi5he3gx08knUt8sVhrgDinY333fEQlTbCqffa28OFfANcNmz34
	iioOwxW+KDba2y
X-Received: by 2002:a05:620a:6844:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93cabf2a14emr658672485a.8.1790850227835;
        Thu, 01 Oct 2026 03:23:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93cabf2a14emr658668585a.8.1790850227258;
        Thu, 01 Oct 2026 03:23:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc529dsm618361e87.80.2026.10.01.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:23:46 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:23:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 04/35] drm/msm/dp: introduce stream_id for each DP
 panel
Message-ID: <cef7gvd3v3oosjsgtoij2m2doaddnlrt3q7gaq7t7ih5w3em5l@a562vfmjv7y6>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-4-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-4-4b81473185e7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe34b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=einhxy-9zUKzVd8CT48A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX0UKc4yDEzcfF
 uWcBWPxCgoxNO8sDdyS3BfJywiXNwD/biB16dE22Uwlo1gVmqBubUVO9FQzMHgrJIuvbMKZWKo8
 UEy9GkDc7iG6ySScMK4eoc0U7QEKDaY=
X-Proofpoint-ORIG-GUID: Q8CmMT2ZNz0IyGO6-czKTW4lkbKwFlkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX+LO7x64w6qGT
 6XbnnJYZPZbhp+6/Go80ruYBWHftVJR5mB9R/JQMTEjgH4wCrMT+WEqHFi6+QcJBEsi70piYOx8
 sp4LVIdNVnTOJds9LnbNsWK6BcEZoTEvXssTYoUwc/Nt4AvnI7mQfccdtCnE9gfndtJ/3hbJLSk
 OgDFTSVnzUl/SqIinNj7CkZl9p43v9yB7/3eOWn9cNQmrZwfKfiIZu1K3FuEN6suMz3zSOg1Qrt
 PEXsaauYQcRYZV2rcYdgHhkv2pxUI7zQ2j4TlzAhNRIN4cwN4puoGhK1CcGmizbZQaZFM1scqoY
 ql3XYAhPtv+cgK9tgoPeUK6hCrSRxII6W5jwhEcJd9E/ketU/XM6MpEKstvEXgg2+piHAITXR7b
 aaRReGTSyF1rsYS2rnts7ZYaPmPmMFlUSDnsNErRLnLtve3Odmm1PgXS9tWFsP5Hs7r1sPDWzyd
 GTeBjLOAvlV2wbTIOBg==
X-Proofpoint-GUID: Q8CmMT2ZNz0IyGO6-czKTW4lkbKwFlkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:28PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams. There shall be
> one dp_panel for each stream but the dp_display object shall be shared
> among them. To represent this abstraction, add a stream_id field to
> struct msm_dp_panel and introduce the msm_dp_stream_id enum. For SST,
> the field is initialized to DP_STREAM_0.
> 
> In the MST path, each panel will be assigned an actual stream_id at
> stream-enable time by the MST layer (added in later patches).
> 
> Use the stream ID to control the pixel clock of that respective stream by
> extending the clock handles and state tracking of the DP pixel clock to
> an array of max supported streams. The maximum streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 70 +++++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 ++++++
>  5 files changed, 57 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
