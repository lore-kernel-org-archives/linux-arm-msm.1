Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408490;
	b=uLaJI/m3D7/nZp2xPWNkpQ5Enak4G8dT6uw+Wl7ceuwcqcG0a24zFNI6uVrIQ69z0SFG
	 sJUBw046htTXdf/snE+cJ4exnOVcMyB5bhqJE+iW/AspwBoA5AhrmQ/JPTnHh2jTF1iYv
	 hV0W+IQ7YZffrE4jPbveBlOdHe8eCrmeQHNT2jZ24MXz8lgho7hsyA01hXqOTPZIb2pBU
	 NudQ1UKyyNUCa0gsiNysnvxe+I/J/yN3RKIvb2tFir+TJ0jmWrifJ1huq2EMkfZaGIKC6
	 euW0JOdmyVUbevPqBUh2zju+AoNZ/OsWHDhFNpannDOp9tr/nyWbvJSeiLoiLLG6FWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qX3b7mQNELxSpZp5mVmlrq9OPoeMPx5UD59wpN8yb6M=;
	b=Ur6n3CX1sS07tmS/20m3sN926eTq2xMRm/r2Um3uS0zediUcIycEwUa4PPVxtF+SsZD8
	 N/fQZTqKKmTf3NcbBPgPgvdyUkRi7twdxUgiIKdSmkyBhdkq/3ytarEcT5pcPnXODN6X3
	 y0t4hIbcTwDF3Gcwoo4hVvATlIQyLsNk3SfkbOmhyiNHn/wfIoppf2yvmuzRKa/voxa4J
	 r870P7nk3/nmbrIGLwJ4Z8d4meDWB4Fw6ktw82vAA9P1I0DgE6+zpcxTM75BIxNP+eHaS
	 r3fUks2X9BjKYLiB7hh7jy79VVlKtlnC2utKlAVld+yYz9pbQ+zrtTApdm+wqAyeAdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoVmomvi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jT1ijWtm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBA4606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FBA4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoVmomvi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jT1ijWtm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHqOj1471412
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qX3b7mQNELxSpZp5mVmlrq9O
	PoeMPx5UD59wpN8yb6M=; b=AoVmomvizF1l7f377QDbRDNoulbx9eyKJ1YmXZyh
	uvxGsXnNnOu6t78U9/HukjPPHOX54n1EQsc7NM4WPVv7vf3DrpQIDTYKW4lZqSGB
	cP+9wSEL8+muKM83bEKG7MW+ULX3fHhYBJvm4zjjxSFKRMmFx91rRm6PYCD9EPPE
	64j5L70e52VAHg3+q1kEFsks147c25fBjgvvMJ/noNiXZOUfu9lYJTQwzkEiQpga
	VzOVcM7rebK6Koi/JlsUdVBmYlEi37QcsZGRGp6qO4fT+u5NWYWYDxd8FV3smueR
	elpZHOkF8VuxxJGZY9UKSAHRsyxq2pu01ePf2pMqzD0pzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m0dbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:48:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so741309685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408488; x=1795013288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX3b7mQNELxSpZp5mVmlrq9OPoeMPx5UD59wpN8yb6M=;
        b=jT1ijWtm7rL11u+gzH//OiIeBxCAW5uz8FcHBjpty9n7jlJm77aDdqwtctfey+lgS4
         qW0yxTLPZvo9ICau/C4zrmkOAk8dBNNaxm317B+rbw4TUMehwsqhlCgEw55AH8FCbBhJ
         yMQdTlURsYoKdFsXqbcQcxNTuDDQCEiqDPQhqncTqy5CH8UuY4O2PWJecI1qxAlg0uBq
         1LMug6CUQBAEctamRa+jc8qjVzUbskmg5WgOfchQPY30jMAe8KMPZu5Z/IeqJubuDROz
         Faw9aDhuyGRQjaGw3uW64LDxegoP9dvsK5G2jGzsXeRlZCaRoqvfeZl+mLfFOeg9eyu5
         Dl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408488; x=1795013288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX3b7mQNELxSpZp5mVmlrq9OPoeMPx5UD59wpN8yb6M=;
        b=fSe+XOTFNvMR7htNyelgqiEiPODA/B4e14BZX0eXT2avloSGyntH+E4T8sPFeKOul6
         y3BJ66FqmLfPeZaEV0e5K7EjOu8l5m2r0vJCqXsj1ZiLiu+OzvSCzVtyGaVawoSlC4IT
         O+ns8hlThjlXlDRQ9DurB+sFppJxf/4PdXFoQkrHongKWBIx7w3vlVYBsVvr8peh6lsE
         HVqkNPAj8l9JXd+rZzHPuOMhbslBIqNG3dc0IOmHAPamokyEZ1K5OixYF5j69IVLPjWu
         8L0jR8wI50+nfJ3uL+hCblclFVO/k1tMUeRnO7uBUgv8Bn6qUZPNd9nTNj2csCavyCLs
         TNcg==
X-Forwarded-Encrypted: i=1; AL+hErF4gbgr6R6dhgXpBAug+Xs4PzArUKb7mD+IaY+QNKbv6k5v/aJT3AC9Pbn+NwNOi/iiXd2/ZC+o4YFqTGKr@vger.kernel.org
X-Gm-Message-State: APuU4Z9gSyu1hu2nCEiX9P7ILcv40bcMJT3fNFdXWGneelQti7U83l/5
	NtFv/VYODGj1Upb3pVBnm80KBQX3JtWDsZ8Io7mGXdUZqgDk2/OgiuaBweRRUFfJOhYTbZKJzRs
	4lwpd8Z7gRvDsBtajVpMvm+ID8H4wb6pnuPi35p46H7CDGMbtNaCOQfKVugtO2D8IMWYe
X-Gm-Gg: AYBFou388AtS4vO+IEdd6oDEwu8imGE+OWB38rA36pfLcxixkvI6wa7FK0O7xne9Q8o
	VswFboWn/CjMh0K0kmzph6bPY0dLcW4lF5pWSqUsWEQ2AMUivZpU6TmAp5UdG/HD5CG9Tj29Tob
	uFhU8AMIyHfp54XL8JBsMAS6DlJgFXt2rEDrh1WO2B/mxTYEiofP2go2RxTV0eRoYblu7mXPMxR
	1N9LYKx/dSuY91ulGI15Xd8GZ+ep8voA2kTRBcTWrOMlQZDSwkllk090IuzNaDw6SlL2t0FnZgp
	rdIkcPNM28ckfH9h9R/ZBiR3dTVhECaK4m+UWmUrs+IrL5e8moL52u1AdpwDbqTChL9ksssEr6L
	5hNhnWks5YqjZNvG51cEEudifXkrlCeHzhk3inxtIce41RDUt3H9Fz1nbFw7AJhxaRUkMSTTWOl
	1GxQyo6Za0GXLQW1zsCs1uomlHvNmVgqiYeLJZkk1X0u0sQC3zUkc2zK7+iw+5Bg==
X-Received: by 2002:a05:620a:1a1f:b0:93c:e83:6ba4 with SMTP id af79cd13be357-947afff2be4mr420475885a.25.1794408488424;
        Wed, 11 Nov 2026 06:48:08 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:93c:e83:6ba4 with SMTP id af79cd13be357-947afff2be4mr420472385a.25.1794408487992;
        Wed, 11 Nov 2026 06:48:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a63fsm1027158e87.9.2026.11.11.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:48:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:48:05 +0200
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
Subject: Re: [PATCH v8 08/29] drm/msm/dp: replace power_on with
 active_stream_mask
Message-ID: <yff2ymxuchwtpshwleockscsxerjwuy3zmwm3paspu7rvfoyza@pxarnmxbdidw>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-8-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-8-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EII1KGxGQNGv812UYTCjOdp5lBMx41h8
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af48029 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8J1jZnWIjLQ8iHHXRFcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EII1KGxGQNGv812UYTCjOdp5lBMx41h8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX2Ydtw470diQa
 vspQMwbnuxOHALTND0aiMY9jfYkkvL9PDa1E3oOwLLhNjOtVm7VNZrPi3G1qDMLsLOwxdBRQi6e
 WyXYGFxym/vV+6c5aCfEekKdDUlsQaYYCeit7T8hSfgExeH3sSRUlii9VuahKpjnlFgrce5Hk3S
 f9ubIQVxS4yQbjlQxl4eShTMwJ+tz2ZNXp23Jiqm22BPDJ1YghknEJdqba3mascuJ4qEGUnvZ/B
 hubncA0BUH4ZZaztYI99Yv3DfN+1k4yGfmJ0wkVM1qpzaZsifKgfbTDpPYtsuMsfCVRvcG0A2ks
 a+2FwJ0c1vp7YsOJUYYEGZYxjf2B2U4r5DcOE1qTUNxfanJP5IcHhGoWv9g/bV7VWyslVyHZdr5
 kIWp5ZQj5doFIWlvq46YvJc84RXpgUz8wg02mGzp3BNFJAWmL3obBB7oc2Qw2WNyuM9AeMf1DBR
 kthcG4SIfkVZ+K1+1Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX5ixuvrmCsFYj
 cBxCsB8GoGt0ehMypRQxnj8V6DNN14MwBDMR/SGDK14f7cW2Enka48ffOQwcvZx7xuiD9g6iMJR
 LITb2HeVvZrggswlmQ6eF0QM/jdNDS8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:29PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The power_on boolean cannot represent DP MST, where multiple streams
> share a single link and its associated resources.
> 
> Replace power_on with active_stream_mask, a bitmask of the streams that
> have been successfully enabled, and use it to track the lifetime of the
> shared link. Link initialization is performed when enabling the first
> stream, while link teardown is deferred until the last stream is
> disabled.
> 
> A per-stream bit rather than a count is needed because two callers ask
> whether one specific stream is up: msm_dp_display_disable() uses it to
> stay idempotent, and msm_dp_display_disable_helper() uses it to tell
> whether that stream ever made it through .atomic_enable().
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 56 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  3 files changed, 32 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
