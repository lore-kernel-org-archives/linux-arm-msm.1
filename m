Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35B566C5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093026; cv=none; b=kUJbGQUK4d49jmUW1TkPuH5I0l1UMnc2W3vKHcXXxCL3rpDS7dJbkdSxV7vXjU0UJqPrH6ruct75UzZHbpv6SdayI7Sex/xsESUvhtO3yleMGC0HNedfpmMnsW9uJe7SQdoSndIuXh3SPQiv7tX5GZMhSqAQ98pIfnG1J8/qjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093026; c=relaxed/simple;
	bh=3Pa5vevgeH9L1GoM3IyUEL/eARRqFWTdTHKPE/pFyV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sH2IzKqeg/eqzy9qCviORtxJBAEsdceOvCy3000usqJCeulRd8zorqmTO2LYLGEtEf+k+a0TqFf1DHyib9rL0ffWEn3r6exz2vGs277KxreJ2qsEGexxdW4Tl2utOMjlfDriijasR6x7zj6VGIGeZzsej/wEZIaC9y6jmxUVSQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtkoHJol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoOYrhhb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtkoHJol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoOYrhhb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVZL1058335
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hxFL5rS+2MxjfqN4yIib08BX
	XXF5VfMlIqKMQUSCXFk=; b=WtkoHJol4v6Y+fXMcQMEi4nUTtD2TlHoP/OzJjv1
	bMLJuOJuXIb7rGt8umdLEsGioXs6MYJJZACd4IF0G7qg/Nb47eNRjNeyLuNSqoUv
	JVeQoWYVFN6MH/RuvHiEZfXP9bEz5zxdUPUv4p/8wQw+8s/x6Qj+MZRe5U9mASq3
	8zleboGb9L+VZUGPmqoiuUZBhFpd6kD0rImToV99vdZngi4xPQd9al3s47z5gHDv
	1L8XzkdEBNuBlZZfFlNfMq++XdVzbVUm/HmSySgid6kmzCw/245ravg2x3Jd5qzL
	IaGrgYnqcBWTx9SOm140FvSuY7dS3jkjz4uif6q5lHGvIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5u9eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:03:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a8e3cc28e6so1322306137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093018; x=1790697818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hxFL5rS+2MxjfqN4yIib08BXXXF5VfMlIqKMQUSCXFk=;
        b=IoOYrhhbDSoccGkW4cmbuN6XlU1toUGC/uu7bp5xWmxIWgqSNpr6BixDr0+vof3rsC
         NcO+XWjYGR9P6Bgc+jkjAuctsVJFuU7mUXETL3hCyWUUhsMD0oTa3FDYkD3v4+YiWHpq
         tYIo2nQOh3JmFh1YwPyXEDKgwR72uV8XQdJhIHg+h/rgxN4K7H32tvkoDgW97upZBEVJ
         DqDBzJ+ydr9uAFASf/V7I2PqtyyXdkkp5mr4liHYl37eKvyTMod1szAuqpib+ld6xB1Z
         vmAsoLlzMtKhEQ5hnxsf6kVv7hu5GdtEMWJPms9sKs6g1X2PhkiJrKbGM+erfgFz+aWJ
         t/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093018; x=1790697818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxFL5rS+2MxjfqN4yIib08BXXXF5VfMlIqKMQUSCXFk=;
        b=u2jNcwOimjacJo3o9nW/IO3ta6Ur+FSCSkUy+PiQIZuWAAfRnL9edvpkmb+/LU3TrM
         CbJBWOcSVz4JHNJBUwLeI2PljAhckym95EAe/KGvhlUDa5DVcf0uEplFi83/yJOw+cSp
         cZlxKK7a7rFbRhDrnyZ5yPJIiiWu/WhpyE3d67jwn7kb0Kqp9PEGoGEtkHL16L/Ok3Qi
         JwidByjT3doC2SCMKEIAQCh+u376xL9mY6GS0tesYPJ+nlMymOY1y3Ra0isKAiZ0Ul6l
         ZED/GLgOMdP2gQY3fTw6Nxfo4X414kzTs9AKOIORl2RSArTlw7gGxJ/E/WeGokXZAeri
         WBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYvcjd0FXzoyAtxkoiVnpZHU7NQiULkicl0Jm3seyibCD29Ot/ZKA4p9vRcHfrhkY7I3hi0vRdbz6bP14b@vger.kernel.org
X-Gm-Message-State: AFuF++m5bW9xoWbsWxDCJXz3eqV+548d5QTtKiBOxySKmIThgKcU/wFf
	tWuo454sESoMOHeXa46nofiak7rqtZhG8tiLETGUf+Yki2Ilp8s3KO1qAyQ0DJwSRyZPMv194gr
	KF5beC2zk3P0XPYVqnvHl4tU67t1xwRnDBhKlNrO50NRoirboSkbcwm01zMoNkKlojaLj
X-Gm-Gg: AYBFou1tSsRHu6hS4cdE4ICz0E8rV2R0c5ZNpsz6MSj0kPVp3LyUpxGE/A9xlS+ZBsM
	vJr8xzWP9mXE6bK1Y6fWcrcm3tm5FjSoi7cFSuneTfSnRe9Y7BUEF2urTKnHVdU/2NXYCgb+T9Q
	pDtMyudhBVqyeneCpxnPNxpMzaCGmxhEefKvpu/n6D6+EoHeQZFJ2X2nu0x76lS3O12mCfRY3gS
	8ZiLN5tkR0e+Hn7SXcwZ7duDWmRuVJVMtlBUqbTVQhv1TQrS/CmDAlYISH5UtZMwy5cx7DeYlOO
	FWe1R752b4MzPaInNkzDLNEXrLZ0S+kkBMhaqkgdZsXuhsalCcbj6HMGqKAjEq3lxUTmtgomXla
	cTfZ9/P3Kk8BVUKf/rX9+o1qsLPrPJVeiPHGzqEQ9ppmcb3F2j361impXd9yhAj0BRTNShs+tfi
	pCMWdOPo0L2Sgm
X-Received: by 2002:a05:6102:8605:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7aa9ec93f8bmr2537020137.15.1790093017843;
        Tue, 22 Sep 2026 09:03:37 -0700 (PDT)
X-Received: by 2002:a05:6102:8605:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7aa9ec93f8bmr2536990137.15.1790093017426;
        Tue, 22 Sep 2026 09:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f47162bsm341071fa.4.2026.09.22.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:03:36 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <4jjdn4tvuq66yutjqpuwxrlruw6lrjuwaf5jvpatpkvdroanet@64dipmovgw7i>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-GUID: ypPCcYMbSShr63th8ueXnXQk0JaiwViU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX6p7UOKJaeV3E
 lhdHNtEvir4DSTfb3xvxqpPwvK6SBniNdao5Fvr2ip5KrbyBOGqgBCdaweskZk9pEvxalJbTOtg
 LTzW9I5FXVpBIqKDdiP4qbk/r4p7jgA=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2a6da cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ypPCcYMbSShr63th8ueXnXQk0JaiwViU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfXzwnZekLTZDdL
 SupXnKGg7V7cUxKdkcXaWY9YUhZgH/m3yNs7tKaEynZlHEvsozVCxN4VZSvyR8MdzoR85HvIUSp
 +JtfNePG33sUPHhbW00viL/1Hh8rTIx8GF3gr1YZ3dUR+OAKDkR9OOfYqIuSTlfFm+6kjBGckC1
 /KDybQWEzbldwRFsb4eFcqJE8WrYPiko/0YUI6tAVV8LViOGrWSQMPNw+wYWoFri9a215w1/oN5
 wjFAV12OvaSvPhegZrzw+Jxxv8YTKq77236ItwpxbQkZRgEa/N9qT3Sz+m/bLu/ym1JiGI2UDM8
 jR4r0Vg2g9a2qRRGEFQ7zrAPebmG67fEOeguMpgWULp2heN68GXcPTNClWne6oG9tA8pu5jgisY
 Rgr4+j6DPQo0d/w5ptWfwKSl2HiocTGPGJr1s7gJB38Cu222/zYVlrj4/bdmWJaIcXtDwQGHDHN
 FbLZQXtoKyptpPjYaIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On Wed, Sep 16, 2026 at 02:41:21PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board and CQS EVK board.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
