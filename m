Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92067393DEB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631879; cv=none; b=MTmHtw9tI2yiMqv3WEZIuxiw4HzSam9IyVKivNIVpYB4tBSpTOnehPgSAFBPZ58oTTb/7fBQ7sWlrqaRZmon22rPT05GiVkqljI/x+4FewWw77+i0AQzaOgLhQEP7qhfcLk1C5WEyPMZcTPhLk0liCCxjlYqBNuXXRdlJs8GsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631879; c=relaxed/simple;
	bh=AInxw5BUNy+WMl8RQs6XmWSa2E/VdQdztujuI4c8Jkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1Md+lCv1iIH5uO2J5TXqQnCy389meupqNb1cU3xeYYFZNzh9ZJbXjMqrsMX34uEovNbqT4/tO7KL1xRW4fB0173ZLpgqRhhdlrraoN1geSdr0Mgv0dCt8HilaYj6huAUX4YnJJR/+7UMej9TTPlmDfvcfQSgcm79c3CBOhn9gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo1+jnwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4BMRU2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo1+jnwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4BMRU2b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60khc663574
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X2X4St3guWcAoOB7DILepBAA
	o65atjpLeBGdoNEmPWA=; b=jo1+jnwD253Y9s/9j/kyAUTfZXO0R/GQC+5l83iZ
	ivLxqb+qPrfHT/1GQ6KyQKQ+UK2Lk45I6c7plEkXTQ7AhVGeE66mVWqgolDz8G/X
	kdZZPgXHIoSDAX8mwl5OacZN6n27lm4egfUjtcI1TprQmntg3rOeJkS3VsxeS2v3
	4sZ+UepXMfd95DfP1ZfWkUDsxV/303zQn0GcTBDod6avF4an1JVRo8bng6IKgpYR
	JQ0jpS0v4yNhrXmaoEBJHQbJjJJwGawkY81bXAlCz0SJq1u8bsjF79sae4MUIsFM
	mNqbLu5F3iKyf8AriJS97De10q69KEvJwRknLoYzjaB3ow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga3002-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:57:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso124924685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789631851; x=1790236651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2X4St3guWcAoOB7DILepBAAo65atjpLeBGdoNEmPWA=;
        b=C4BMRU2bCSG4hOQFNW3+VogQ4zaZ0bUAtTSLOY+tNzQEwibR6yTckN7Ise0v+Si4dA
         axAnSNJsIOKUKNFXe/cZT8t3xz3uIPj0NOn9RDuBvNeky2No0oVhU0Gy6NUi7AoU4EFF
         XmQvi9TDnFQLSCeZKjiO8BUTN4fGU4+mYGo7EC+yDyZjzR1XvNphk0YWDXetqhcfPBux
         dcUwFeJ86FLQTFsQbPmav1wcZ4ThnoZ7C/BTK6l2OHDisXB//ADEZi2g92+cYQFCOjN7
         l0mc+SGSaEnOSrumnBHLHri8+v0gRaVi1iVQb2h47jbt3eMLAVOm+KAZuJsJplEoGZZL
         d4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631851; x=1790236651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2X4St3guWcAoOB7DILepBAAo65atjpLeBGdoNEmPWA=;
        b=RQPmXC43jAa4B3IniVfDgCPaiVMSKKY53fAOVhXHeQaKYiwXKA3nYKJ7/anRrHyd6P
         CR5NwPiBJh+1dOD1AfKEoGgJGqEKPWijN0mrPxI/b7RmnA5ZLeQaYHfHdlDvY4Wvwhmb
         OVFdVWX4Nay0vWp0T2fEYtxnmDnyqYS50O0V3DOb5hq03nkFGoUvdl56WM3nXFjUkiX+
         HE+QYencIkRGLBq+YRx42lea0JDokT2HgOEUuHwCscgSt/mpcGkY3KZrf8f78vzNkpJj
         vPspjYmzW7BZ0iVbvVhu16RagO3aFBWtS6f1nb68ZgSkrtG5ApUaOD9q8byPmme6yoq0
         JjKA==
X-Forwarded-Encrypted: i=1; AKwUvBwfrc+HnseU6dihELXFP7AhKm+SzHvKpSVC+KCN18pIJEnulctU8s7iZwdOCWrWYFFyBDQdzR265aDo+UvH@vger.kernel.org
X-Gm-Message-State: AFuF++k25ICNkGJHfohmnbqJVMNkB8njRXQFZSY4PDf6KFuYvN/EDP/X
	pfnSL9XMpUp+/H09SSWKBnFbMV0CQDVatRFLOQcXVR5mwyOba0XANeIyL47VNLTbRP0u1cz/zdi
	648+MHqUMu9OkQ0kIEPgce701ztj3lDIg/qQyVdYkViC6JbrNNZS81GDd/MeuzQqtEJEC
X-Gm-Gg: AYBFou0bs/dOnqcQzrXcTmNHi0QZESmLFGnNxH4Irbt9R/WCX38Xr9SphWXVURuZrW5
	UBnFD1ewmLYoRdp+C0hXJwqjJi9OtoyPlFPEMtSGhyYHHRLuBYzghJR8xGAg4m1drerVMIIaja+
	ezNVmHejxYwUzvIR7dwKNwEv8c/wjz7J43bCMIQ2Z7cVH3eLl3975fCKkGWxwY5JwesQEJaEW2r
	RJy3667ox/V5NJ+POZF1nHHDRSLLd5RWgdM4DH0npf2Mv5jGj69+MdFVSWBC4hm7xys5gU0JWCF
	4t8gqqeDlhP/9HuTnducAZX8MBqegEXG6wEcXgK+DJVqp2yusBtpHMjsVksvxYhFWUHmov8lFOO
	yJyJZRZtL/anISJB6JarC7tvrXfx4xeoKP4czx5Ag6qiHiz375HaGaw7oqx0tPZBhu72v3qsb/l
	0Ho9V8f34DrkqH
X-Received: by 2002:a05:620a:272a:b0:939:6de8:43dc with SMTP id af79cd13be357-93bb794e072mr928714185a.48.1789631851565;
        Thu, 17 Sep 2026 00:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:272a:b0:939:6de8:43dc with SMTP id af79cd13be357-93bb794e072mr928711985a.48.1789631851062;
        Thu, 17 Sep 2026 00:57:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c35f4sm1572038e87.15.2026.09.17.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:57:29 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:57:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/29] drm/msm/dp: drop redundant config_ctrl_link()
 from msm_dp_ctrl_on_stream()
Message-ID: <3iyvnipj7cxlhvcz7mo4i32qswhxcntqg6qmm2fpchb2i7tdaq@ykiwgyp7ezzc>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
 <20260831-msm-dp-mst-v6-3-c91d35d6fb9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-msm-dp-mst-v6-3-c91d35d6fb9e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2R7VYLiPabx0QnEMTOaS0Ql4GH9Awtpj
X-Proofpoint-GUID: 2R7VYLiPabx0QnEMTOaS0Ql4GH9Awtpj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX6EmgdqkZwnmV
 9fRwUvegJ/2GlEYuaw5GGcTX2gdxQv3APCHESLMcUeYQaSZ6rrCQkwzapr36y0iJWlI4HaaYLf6
 hOkmloix9N39uWWV87MH30AxZ+uRFi0=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab9d81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xvosr8ehAfmB6sJLDpoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX5EqM/KWtgWnA
 dIgd0CQ3w8HW6wwHGp2PfibEvXFesNuaD3fFXZBiJhoJhSYozMEWMA5Mh8FVKoZNEVWkWYS6B8s
 sSsKoJikSJfHXMNrueZVEhby8r05m2MDZX7N4DK9k+zsXKkkEnk6tyoHhSl7iOA7lKv4oFePVxu
 DLTsdOAO+6+Gv7YoPmmWESw7LVuaX8LLbJOivKGAzHHmc0oul9TxZR3qllTqdx0pt2tPkL4ffOp
 HXwQJLybMu8vumgGjlX081qit75YGypRAEwuIP3y8aN6XdYDx2LJ261yFdeaP4/VpdfWNCLkmIV
 chJM7uuW1ZMsDhtsO8Cw7cw+8zCFir+Kmdjl4WlDET8gRGElJF1FB/Ce/Zlhtwby4o2LoTo/jsx
 1mJlXdecYrNOXLpPcQiFs8uOfqSZExgzcX1q/Vlv7QZ+6D+gRoqYSZ7qvsWdrxvTw8DSnPlg3/x
 UFf9KZJeykCFUmMtAKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170106

On Mon, Aug 31, 2026 at 04:17:20PM +0800, Yongxing Mou wrote:
> REG_DP_CONFIGURATION_CTRL contains link-wide state and is already
> programmed during link training.
> 
> Calling config_ctrl_link() from msm_dp_ctrl_on_stream() rewrites the
> same configuration and is unnecessary. Remove the redundant call.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
