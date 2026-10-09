Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64C3D7A01
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534901; cv=none; b=nhRRttGbybUJtmSmq1CSlelfTuwiUpcr9dR5PftFL3ZsI32nglk+NwKuV8XRp7Iz5JiOaaq9Xv0In8LugqzD8NeaAgSEeIYd6+3Xy5CZO50N07gWO/kswFAiAzaa0WxIjDT6XoR/36AGso94c7PmjOCa1I8rixsgtfQSUCeAI34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534901; c=relaxed/simple;
	bh=NC+2eeo2n5QNMbUUG22T9VrtpoJoD3PzWFKPk2u4F84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLBRUmXXvqHfn+Y76BdUQNgFDmFUg62ovbYLcgs1MCEQ9AhEzxYq+stZikk3oeKWn0YJNuLx3vg/rNe3SSAeQrIHYcmyTL8FYI5TIyDq7k4rbjKJJErbz2ZPBZv3S0FbVK9z17smrYLdTyNJ+2dV0Fy8kiTtmjFPq6V7Wyn5JQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty7vvkaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3YJWw/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty7vvkaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3YJWw/1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNiY1223232
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s4pQsGddClrCrII1kmbcET5k
	ZqpNT7v4RjJRYWDy9+I=; b=Ty7vvkaMmZ7MDralAPHqHSDYwDUbfCAa43KeasGQ
	rLEYQltkHcCPXhVtDYD+nzS00pGeRHaK//i+cRlWM/bgEkb26UrTd5as5r7vQCE/
	xiXkMKtwZYX/aERJHu2a5P2mf+gQtgQkg3pBUDb2+ZYLPAP9DrJEYqMRjiovwRBi
	/TaZDYy58zPDhfhpkjTMwfLgUoOWKsHmZibpzLdujJlszB6vOI8PfJIBoLbsxs4z
	mkfJx1dnP3fB9Z2AbvX6JpIJd9jxDr9I5t/fmgQmk71oZ6m7GP0QVUHOruxushEK
	l5aO5lEoYt6GGnMe0rpUOIdVQpZNkmjX84Qxd6/ieXnYnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkam2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:34:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so358963585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534899; x=1792139699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4pQsGddClrCrII1kmbcET5kZqpNT7v4RjJRYWDy9+I=;
        b=K3YJWw/1uSB0U7PTwoIlOdeEDVTKHk3mdgiqHPnv4phC4nIrZe6PdxGTXZ20Wck6qL
         se3c9Osda7wWtQGiLn5I2FeEROBtXq/3ieJBzstv1reTNcz8EQCBWUHayEy4BC+lEVTN
         cgIp2SiIoz49yTmJOO5U6gmfHcs5cGh49bmNu34bK66tku8q9j0Q3L0z2l0eGXW/u6/T
         0HW9fdQFD5gP+1HXHHRi5hC4+RUB9YcUHtLmyVMfRDlJi8akbI1Mra2xGhhedTfKH53N
         q2yYarQ/lA2uzN7GMHXQ/VzK+Eck6PEDrcsxisXUEa0+L4eDeepPaUlQrPOI0skDoyFQ
         4imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534899; x=1792139699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4pQsGddClrCrII1kmbcET5kZqpNT7v4RjJRYWDy9+I=;
        b=NHBWy3afvLyM2/Zdr5Fe1GjKsMZFlPuWiC0keytF/wHgChzkNxJtYbDQ3Bb3YFCtWf
         TNeas9B53ouE9xym/4ux//8tCXxO1Qjm3szTkulFOpdyrqhbOJPQOQpH7TmajygWB1sE
         A6UgUOTWD0yRo7EAtrItDVnvDHINxwoFjwOp2428NoeKD2F8YFXWkr9fc/3SCnDg55Cq
         ZKF9o2ACU5Z3CMj7bz2TlBmfFqeeaqoe1g+B05P7FjLM54/NtpSyh96fNObX254t93CJ
         B+TIqu8qBC6RMGhNo3JYxUzlefhnbC5CjgwS+/NK1LrQKsl0dQPl3kI8YheY7VWdT7DJ
         NHSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6LFbsL1TgHaesfW4zkcm3S0+DHesM5ee6Czh+YHv3t/EDdQeTvykxVvAwDqt8mcofEqnhg3EjnIzr9e5S@vger.kernel.org
X-Gm-Message-State: AFuF++nIKBwauaqlEqjFpOJFX1eZ+UtGBoz4WmnC0Vuf8Nyol5dODuUe
	jmxArUnPRKqzbAFwqGsZcmBv/LsACj/uvn+jwVgmQAjwjMaoWaN6iY79y+wx3q212G7Djt9sCIy
	g4z7QmTCKdXNwafHpZmwnKOc+YbmKpyZk3/syADEqv5csYTd8+MvXoNmMPuFo0cWc1wjA
X-Gm-Gg: AYBFou1Uj+BE7I82rKD/e/avl+foNwweK65U12/Y6cqJTLMwYHeEDP9kvYA5N6ipUPh
	DP9L2+yFC+1wauizNUHTjS88qTZVUjSUKBT6oN6plH7wL4i3iR/PbenZIppuveZG5gX26YglkZQ
	yB1qhI0NVHOV0ihy1DsAsbaEoCkrYAYybZBpyNQAJFRiYRZ0Gdxt9tMXC/8DZuOVPSu+UsALhK7
	j0laHUfrAZwnHhTdWg40zzc1qGefX4y9Z58RKLsXhdOhXQjhO60ZZf9+PVK0jRFhZ5D5kY1LGjP
	ZHXx8jFUOOFh7iCwl9GFsGJSFmgQiSEwOf5ajcQPRP8FZnlxH/N4Pl0i3S/YjqAxU7abMJptGOh
	OT2YWup+09eJ+iAWQXiawN3AGykPS+xOcZbF5IZAsZyxZCAyAcHmOFd+o/9lZ03LtEVt7HkWkSO
	/gUJxJOnl6vj39
X-Received: by 2002:a05:620a:3181:b0:939:fe55:402a with SMTP id af79cd13be357-93eb966845dmr239801185a.31.1791534899063;
        Fri, 09 Oct 2026 01:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:939:fe55:402a with SMTP id af79cd13be357-93eb966845dmr239798485a.31.1791534898596;
        Fri, 09 Oct 2026 01:34:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm446004e87.8.2026.10.09.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:34:57 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:34:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
Message-ID: <mh2mmbrs5omoo25u4je22tq32ka52kusz6u3xkeohea4oa5o7p@uww6ugjnutho>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
X-Proofpoint-GUID: Mk1LMQ-TzSMTO9pS-TX08Aozcjbc-mDk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX0xulx4qJXyDH
 C0+1VrF9KJZUP8kWwefP/Y3Z21j2uoRWx4hTr4frnFEEMq+H4L053En4aP1tDwopXY6R5x7VnLf
 V89+8u/cL+8piOxt33YcxAtpB+If5jU=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a733 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tbCzt_ceUV_s8fUbo54A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfXx+1ZRcsMJShA
 54eDhzQjoH+7RzMMHxYqTa+PFQGICwFqkDBddJtjbCEb336+Yr/gs93m+GcHk0OMAS40jBha2yp
 pSdumdrElf7+CZApPVsVre5lSBJtYKiP4/flrzZXj4HA4E6CQpPioqmjDW6MWSNMsm9zVV73ZGs
 GTG+iD+7lwlq9XHc5IVWf9WWtj9/DjzJ0SNj5GWDj6rzofJ3fbOlbeJmmhnX1pxBAv1jty8SluM
 d7PgegUAv5S9L2mFNS/ctaGaLoP1CXsetzV4+TU2oxejKeFZALcju6TBgmJuKmnDYplbUz2XYCz
 qSY9vr7/MG9m0Qp0ZU4EodnrfkyVLLKQfHACtw2V3DsX8DoVNO7JAJE2U/2FKjiaQO/hyYPDzoS
 IHbI3KXgzi4YQZMADRpsTND9BisE+5Uij+qOowlDmfr+52YwC9sn+dq/JdHVvoWmYJXVJiDlb23
 Ck+/yrfe2h0jeYoRdFQ==
X-Proofpoint-ORIG-GUID: Mk1LMQ-TzSMTO9pS-TX08Aozcjbc-mDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090034

On Mon, Oct 05, 2026 at 12:54:30PM +0530, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
