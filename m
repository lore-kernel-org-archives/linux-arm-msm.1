Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810759;
	b=CApeneTd2w5AlpLEk90UsFA1J1G88IbmWOQceYuMd3ETtpoexdgbdKpLIrDVMo+a79jV
	 TtrsZ2nkMifv6BI8apJ9IqN9p7McXnifagqdKMg73Tb7B6hhNsdfhiwTHfWndLU+SKMDf
	 vZsE15cEZbk53KFbg+DzP4sW+ee2UmuctYBUlCoi11J2EA7ZVenIpdxhZEwxcowzTCWGh
	 BEpiR1OOiB2Q4kd1ai8a6J1XBOq4E7BaAldiVgBqLviJIIYD9od592YVBOA8olb9UgemH
	 fMTb+LmuwBlrK+QDlQCnh6Ta4xSlpEiyLN1waVnROoE45gCk6OolX5SX8NVVtbSE+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pX3DK9XlkkOLl7dfdN2RnxYOIXZktAtin1GQHKKihSQ=;
	b=e4WLaPUIBFVlHG42tkZrgug9pPllcm7lS7BAT26Cj7reG/bL5e2bHVt50Yrmi8zQNNbj
	 JdLkDbkNFKWd0hhwFC09YZ6vgI1jm3UeeJZDvd/Tdi7acjo5Yv86ch0WnWGvGphzNQ4F+
	 8rkfc7rAzgLKU8Tu9xEaeVNdWRL4w5lUKpx6fRb4o9sY3/5eIM+AWSmRQtVXsUFZU5mcn
	 UvjEUPu+o8MpD7f/7t+Z5d4qCUiD0yNeime9Udw/PrcLGTZiP/IE7ElcRGpii4MSTdxHB
	 dIfW4pdtEEhziSA+76ILaeVOU3BSotsk/sShh0ksnTKR2VGxnNJtZhM+NmSyxsEJTbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=THB1VHR3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwIBGXa5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D3606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=THB1VHR3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwIBGXa5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB0c23752734
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pX3DK9XlkkOLl7dfdN2RnxYO
	IXZktAtin1GQHKKihSQ=; b=THB1VHR3BPbeTrE5jcBfGHagd0b7D30Cflz1I6AG
	+Xe/JSSEkdoyMtgBSzh62/PMtS3OFRkd3S6nEtlkCE1GppafxgMlC55IctQDwFJS
	0ZnsQcbbq6ap6cMPusM7xr39wlUxQSqx3O3oTHtWM4ViLjy25/5AEjaNVp56XXNR
	fzddVCajG/9ZR2LNhXPiqn+iupBAqhs2VVEMhNcYNA+s2+bfWTtYbfTmoUjjFhBu
	s3aX4VmWrtbacNX9fAt5BHCm/BRCYLTAHNEGzyur6mtvDLrX7FghU0AjceNhljgB
	0tONtfEsHV8136UnDDrAwaEQebEU6+oaI+cZd5ZiD8xE+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74ghas29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:19:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so1389919485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810757; x=1796415557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pX3DK9XlkkOLl7dfdN2RnxYOIXZktAtin1GQHKKihSQ=;
        b=iwIBGXa5zFmFlx/gKzgswdpjuaEci58L9nJsWtANtAExZKy293nLO3/tpY2FudKzHF
         L4qswi+Y3nmuE5xR6T5CWdIr8FxLyJKP8BParJq7iZ44Zc/jLQdOX3yUHA+FJGxdv8Sp
         JGYVwDdiNbJnjywvuXqpSCnLhu8KtA8Vheu4drCmM8ThWpwzijc2Rfs3wnlkmxvbfK0G
         v+St/+AKR2FWC2CkKlJi3feDSokZClAo58MwdJD89940t9TfD/5U0QkomCDt3T6ZNPWl
         YvJsa2NDMtQAtdzjEKHGDK5je+RFDMbey54nyiNuD3uRdB37ohH8b14gnJivNl2krwB3
         aOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810757; x=1796415557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX3DK9XlkkOLl7dfdN2RnxYOIXZktAtin1GQHKKihSQ=;
        b=SgjwPuyJXrfaGvQQR30GapCd44EqWPa/P16yxMfoLsIhyvIueqFRe0/B72tmLBCE/z
         OeypvHkxkH3/uLdxI9HmzZUOpKfvsk6KxlJmqarP5wDxCZp/piZqX5iT3mMB6CHrGIQc
         1CqTgdszWciNP8KAW+HTtNmq683ACwu6nMtXGJCQmotjsQobl1Bmnly3bCOuMcq17mMX
         1O34acDNKfRY2o5+lwpkr13pq5Vfiv4jWWdvD97RqBbAPtfINcv5ot7zdwbS2qnJsk+o
         la2kzAygD90hxkFidBzL1O6J9r3iBwRZiTr4IyzRnaYiURvZU83mr9rtM720ycSLJ6Qy
         HN4A==
X-Forwarded-Encrypted: i=1; AL+hErEh21hWt9ejVS4SVsrKKHa4ydIET3sIoNWVnn1NDvOVQ+Eeslu9qwzriB9+Oej6M0HAGpAoeerIHb6yVgBV@vger.kernel.org
X-Gm-Message-State: APuU4Z83e5A6XJ8EntIvdbpWAvAbIuvJkdy1AQJ1Qxgtosk3wyjGYmHY
	mZvey2SWAxaeZ9nxr7cvtBMgULh4e1M740F4MV96WECMXqNh0jr5zdRVKjPlt/uKkPLx7CWkNJx
	fMhXJGxqzyFTvq65daXjXfOYoSRUsz9yPCdqKrFOOKnUnGnajeY2xjVsMaDIcWeiTWwMS
X-Gm-Gg: AZFdTZfVfWxxmXZ3zcuXd1qnBHbUYqBCp3mThqROUPmS/ZUNel0mDCu24jhNOXc0lSt
	C+cJqFDNYzTFGAiV15lR8hSjCGz782AJ9hWyKrvC6QLEOjMCPSmlRN1Rqf+mSSddJh4zO0aNSWv
	oOhNSkUKwJNQ+zj9nmHrCTm/a3XOo1uAMXUAu4OAkMvnMXBwt5MIStEkDS0uZ1i6vXUomhPMEEs
	nnabYMFvWpNshH/SYNcZm9EFh8iC6XIGf0mZG1ISA3eYc1kmxUFsBCPp7JPqEPRYZIS4EE1ndtc
	owW70z3Zeza2zhiVo3eZUc2NvJII/wHkXhxgQPu4yBzms6om0JuQMc2+0DdXWTM+qOuie2IgAo0
	Ul98uXnDhFKk3MQ4iIo6XuEimPDu5dbn9gJ4wnJD33Ydy/b+hoLU6Mvp6+OUVg7a0Yrtue+jJib
	+3D5BC7wQnWHGGPJtMmTOEX3puoMxm1Y3rZmgA52J5tMqk2jDoSWTaa7dG5yrRnA==
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr4473187885a.34.1795810756936;
        Fri, 27 Nov 2026 12:19:16 -0800 (PST)
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr4473183485a.34.1795810756453;
        Fri, 27 Nov 2026 12:19:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e00dsm69635371fa.3.2026.11.27.12.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:19:15 -0800 (PST)
Date: Fri, 27 Nov 2026 22:19:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jesse Casco <jesse.casco@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jim Martin <jimmartin@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/dp: carry the eDP rate-set selection into
 the link parameters
Message-ID: <yr77nbiqgbo5mttqzzqzhwj5boxhnd2snov7zechfcsequ5tva@7wow2ms2qkha>
References: <20261120192050.73315-1-jesse.casco@gmail.com>
 <20261120192050.73315-2-jesse.casco@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120192050.73315-2-jesse.casco@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX9kyXzK9pH80J
 k4pQGUIAK8dCFnrbRKoqx3BEveCUn/eZrelwCa9gtXOO8tqtIFmHGZpIhqeSS+28wy1qmWAyXzs
 nz30f/wJ342qtPDKzieYF3B/DcGHavo=
X-Proofpoint-GUID: a8CLjOEhqwRuuegBQHw85FRUFyz7M4Uk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXxLMygY9pk/tP
 saSgBxMxZ1Ni4zLYBwLc6DbWIvlYZETEUUdOiKSIxxfFfVXuwpU2w1Y9Uq2CyWxcfSE2EYQOSQh
 jojp6UI3W6TF7mVcRhRAcMyLji7JXkysNWAM69h/zqrN9HyrY4ub/Nz5o/m+M1Ezsdf1h3DxNdV
 nE/kcdqB7jyVRNCX6Q6l0n+c87hhDGSAq7C8YqGD7mIVCbVPu+sHx8w6+meSvLF0ClAD9Ony1V/
 B2a7oR/kkc2DSYMjUScPmlyDAbDz7BeEUyr6bpaalOkzosnmNyhOSNQ7plOJ3Sglp/U+c2wK03n
 3uS/tFr9Z8Uv55EbQu292sTx/xEcXPap0tJAqh+xhAekj/4RKkXgvL4fiuRRjTq1m2OutI2gYZQ
 +VRMUbU4ZMUG+GhILtPmxXYrZxQjptD+2WaOecolwT8kpi/9CV+X9eD9r3tW94hUuSqR0zkb2el
 RXHN5SvCQETk6G6N91A==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09e5c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=OcNzFT8OvP80C1WdMtgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: a8CLjOEhqwRuuegBQHw85FRUFyz7M4Uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270080

On Fri, Nov 20, 2026 at 02:20:49PM -0500, Jesse Casco wrote:
> msm_dp_panel_read_link_caps() picks an eDP 1.4 LINK_RATE_SET index and
> fills panel->link_info.rate_set, use_rate_set and supported_rates, but
> msm_dp_ctrl_on_link() only copies rate and num_lanes into
> ctrl->link->link_params. Link training builds its msm_dp_link_info from
> link_params, so use_rate_set is always false there and
> msm_dp_aux_link_configure() never writes LINK_RATE_SET. The rate-set
> branch of msm_dp_ctrl_link_rate_down_shift() is unreachable for the
> same reason.
> 
> Copy the rate-set fields along with the rate, pass them to
> msm_dp_aux_link_configure(), and restore rate_set together with the
> rate when falling back to fewer lanes.
> 
> Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
