Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7848C40F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808428; cv=none; b=BZkrz54SL9nWtFsNEJj7ZncwTVBWCJio680JnteZ3xEwbwihScx4LDP8vEs/FaCjQMQKkUUz/w5QEQQ5lhCwMsc1XqrXV3KL4fsGjqzQ4d8X4DNugmYTh/d3AfqHljSmNMqyXsMnXpxrW7zBnCf+DZUesk/B+1ix+O8/Z/lOal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808428; c=relaxed/simple;
	bh=WS9OC0fkUbobmsn7gzpTP5x9fAGQpJR6UbURn2RI6qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tor5Wz5DFOvB/TNv2IalJZDPtbFJXlCVwuxXaBIjtyWpepuiXR7YVcCV4ln2D7WQp5+2PIO23UVr4nrdY3XIUsVB/CnpV9rKci68BbWDeSXGLCU6RBLGhBTfaV30WEUD8mxuvrSYOr53B+dw7DPnFFQpxEUXY9BwlV9WRXGolcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDMJcHN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyOY5i4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDMJcHN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyOY5i4E"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0WNZ2252714
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs2Jgzs7Tv+fLgxyw08H5RN1
	Ifr7kpK1dx9qY8mqF68=; b=lDMJcHN/OPzq1UlDCuCQ65E5z1RzyVIhBJCOh8QD
	AcYZMy5DsN7x6i0KGs2sryjcj3yWICTOYdljhsJZCHp5YNeHtNSrT1tC+Gh1QzoV
	avhztiEp2vcnh/FO8yDSAhCIK+mEKcD4BL79euU3FtK9eiE2JKGYcPw0HG5IUeFZ
	4507/+Uu3ClC+MovwFh7WB7arRHwVkk4y9zKPx01QYnbP3irlWzExK2sF6RK8RCQ
	cOhBWh4JVbPaxFCquDxV7wld/w/BRw3IEJOSwP/JLhUj0ZUgy0b/03/DnOnyTx1M
	NS0NaNSPm9B3kSNnbafdBJtd2Hh02DPZE4z/OYgKnhj96Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j712yrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:33:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so437181685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808425; x=1792413225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=DyOY5i4ExZfoeDb4dtY9BWDRmLaQi1QJV6lwrnURWbkkkmgTCpka9/nfDR/od4W49B
         jKF8PaXmCqPSmCP4Aekzq37TGN3XMQBYYpt25/7ZM6XnQOxX6ghbNDfS5hAtFF3h41e4
         1C87x1/U8b8ZmuE4mJx0KSkDYfaKGDKhHWTMHmjIjRAAa7KfHskc3IPHDCKxpWPTd2xq
         BZ/btRkHNR/TeGNhTztorfUwft4mPYeVEiw8ZgMK72lXgNNOsEFUgn1aBXDsZYJS3/1+
         s2RbErTucIrKBuVG62G4TIfmbCqz8NnL25+xOtYKUAfvcU7vmVnKPOG8APz8Ajkkf8VK
         d1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808425; x=1792413225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=dbqsQielSN6zO7QDQtXBQbipbEOS8YWd73f22Uc8TKmRnCP84ldRmPenzLA3WwpnqU
         7HiMxQIK5PYxCeCsTMQUiiiBB/E/93htsokZi3GfiIGxRLv2xMPPDue0/2NE4BcuthN/
         GXv9zC/awsThbsqULBx4JAW7v1VnBxcABX2S4mGU0UHr8yHjPolJ/WB2hEYRpzdy6aAD
         +1lQBwQhd04awDw00ndgb1NNAW2MHqp0PI9JmDPKinGhLRRDpQ7MvlU0pk8dxNb5sHHx
         JHkogeptlgwKbvo5zPS0WnJHhWxJQyTYyd7rJzpPAdiIL6vdMA52n9eilc5sGLa6MExH
         umiA==
X-Forwarded-Encrypted: i=1; AKwUvBxXxhNc5DPI+6Y29RxSvRG3+KWmwHRl81+l9MdbKwa1K4wAmWj1n7kWhJms8zqVK7FBVTJrIBTztjUDnvQK@vger.kernel.org
X-Gm-Message-State: AFq9FYKpu5geiFSw96rs3DsFBZE92YnUVVitC7JZ5F0pdRv01RTGSQek
	K4zbikDfSl3IR0OmYXSISds/1TbVyslnyOfprBuOdpPVhRdIMSIv3buX8nUaniunhuTFUsDXbV/
	JjN+Mf7TqrkeLfdAI/xzbXm+DPG4jXGGIeKQCMXV6yDcWvrOTiD0Sincl3As0j63Zj1G6
X-Gm-Gg: AYBFou3D/Z2APKNW2Yca+XgcJSKt9qVe9Fhtd+GBN87YZ7ei2YDnHv1yu8lnBiNVDg6
	km0frpkrQK8gf1/SNRqlD1dQP+VGDuls1m5AZfPTX9/nvXciE3JBM5ahJLgCGrvABd+jJ1tspGq
	Q+T23elpoVfZQC1uBhVnUoePjAFD282u5P/9RdYptqwY34PF5nc8uHtIaekpPxJzgqtD54bIPEy
	OFUQ/58uIKbUQk5pgAEc0+4UPY6zGzDGqJob8LxNIjodgrRp8Y1Xu4UB0H0vP8au48fLwpbTUCQ
	wntVYsOfBKb8NOHPFEVyTAaoJiWuKSMRE1HfNv/M2ZIYLmZWtzfZ0QxvdXa7pvBpB8Po/MLLIna
	8+GUfN5+OEC3Vob0ohnnZhUjwgU9uYMo52QX27aixz8OPL5khjmld9PBFGk3z74uH8SaYWSBTFK
	O3mmpck0ikIaC5
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359655485a.73.1791808425084;
        Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359651885a.73.1791808424602;
        Mon, 12 Oct 2026 05:33:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm2819066e87.49.2026.10.12.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:33:43 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:33:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/20] drm/atomic: Handle max bpc properties before
 connector state allocation
Message-ID: <mkkc7pbeh3aiyhhnbkis7owqvvpt55lyminlcnu5gun6s76vit@5pmsxkrdey4f>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX7DkbYCXpTEpU
 IIA+qjcyYXI9NvLFZF1MUGmQeuRHTfippQe2RPPXTLtWPHmPjPEdizqivIIGIco8Tu7Jzvgl5/O
 cPRvRwkoPkcr/uQ6rCyHLqObRQAyXxI=
X-Proofpoint-GUID: lbLBNAwBf4TSTbcxAG1ZEaM05WshauBE
X-Proofpoint-ORIG-GUID: lbLBNAwBf4TSTbcxAG1ZEaM05WshauBE
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accd3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ksxQWNrZAAAA:8
 a=uu4xuC75hOI6q6cYBXkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX0T3ATCal84Zc
 rWAmPJRAkKpqCZ50lM1EBsLibWZ2e/tZVmNgzWZjUAHgWT7mUjb57AbAHMlRul4GsNcVXCHl+Wb
 BS1oTYrKaJ2bES77WTaUwBamCNozn0C+52mnb//Uzluu/f5+J5tD4m8XQzimhxp2S1vjzYxH4HU
 gLb/Dpz6yHEK4y7ysxGyOSEif5IkJO4N6Oimaoxe4/qtqi8tA60v+DyWeIPcH8EgRRcr/UKLw7J
 /FwRd769sPqrL3pxayij0vSNdSMbPRdtvI+5kXpXcv5GRRm8eCXQYlNXihzHqYnfSY8l+cVuYBR
 dBObO7oSeE32gXte8R+Zet9BnfxNRebKH6ofFDpsEvky/8MQ3aA+5js9lu2Usn8SBj57ywvLpqf
 BSvB4GL44J2IDha4S5H18Jh2msvut7b5nWHsQZ8nut6Jku2Z8SF1saXO6hMT4uK6cxirXsRSA07
 6zIzTFCi/mlgCDRpf9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Fri, Oct 09, 2026 at 11:15:53AM +0800, Xilin Wu wrote:
> Allow drivers to attach the max bpc property before allocating connector
> state, as needed by the upcoming non-HDMI bridge connector support.
> Only update the current state when one exists.
> 
> Initialize max_requested_bpc and max_bpc from the attached property default
> when creating connector state. Use drm_object_property_get_default_value()
> rather than the range maximum so that state creation and subsequent resets
> restore the value chosen when attaching the property.
> 
> Cover deferred allocation, existing state and restoration of a default
> that differs from the range maximum in the connector KUnit tests.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c  |  8 +++++
>  drivers/gpu/drm/drm_connector.c            |  6 ++--
>  drivers/gpu/drm/tests/drm_connector_test.c | 53 ++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+), 2 deletions(-)
> 

I'd very much prefer if instead non-HDMI bridge chains followed the HDMI
approach, making the state available.

-- 
With best wishes
Dmitry
