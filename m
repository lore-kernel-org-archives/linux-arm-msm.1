Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA864E3255
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849597; cv=none; b=mDcG+KIhtcnOfOxPKg3fQOtS5GVpXI+8U60yM15qEGaNcOnZC8VhTvZyXOMRnCQgiqqn5Mg5fmUb/XmlRRP8mCIMF5ynaLqwriELWL6SkAvhYRQJYx0IpvMvEN/VLxwtD4bsWmAHC0K7lhrwlyZd6uF8c4QiFGxQ7SW37BCftRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849597; c=relaxed/simple;
	bh=Ni8mGAMCiJVRaf4HcuQoQwnIBpWX2iUMvv56feaCAAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APb73yudIDuzlSDt1GKqlR/labm0fNtp20X21jmWIu+ry737RCCKIpas5KFKkAzHDN06V7QZ+4irs3aR2UB9ioOtiopE6unRxrAq7dfxoYG/EAXqG6YU6vw3aR5tIOJ+VTXSNlvDfAsrnUHedRWvCvA0vAEf6UktNBZHcEg3a3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlEvhpvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9l7aF2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlEvhpvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9l7aF2W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xK8u2805838
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bWmNAyB9T4vvPsM8pT9vVAZU
	F0SnZIMbHucMu/isPPM=; b=GlEvhpvbD9d6wnf4sJxOj+NvdvoGuEvrwsy6HTjQ
	yKdJRuJoO2eS4JeFVxNJCHtIn5igd54m98UfTe+9uu4K4fKDI+fDT8CcCn+Pau+C
	1ANtMa7YGZaEcgFBnG6gy1CVUmFnCbPMRnSMZwUllj1bT5/Un70FNzxSqSbOSasN
	UO6hAEzMmzQIJCb7JOLxCpfCIhNgjW5lUMFyaaTNKZRlRECvzdkOPWB9BudF+Vz/
	5jIXz0jbxyLExl7uYsg82SwBvCbLbkmOV4Y4S4rJ9QrjEnnoltoblTNKnJ7cFz1J
	I+IVu+l67g1/+sHgThxoCPnkgYb0xPZXwv28TpIto4jnKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkh29g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:13:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso34985485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790849584; x=1791454384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWmNAyB9T4vvPsM8pT9vVAZUF0SnZIMbHucMu/isPPM=;
        b=R9l7aF2W3KdKvHxgc8bHsqozCkAC/3ZDrbRiufohbgg4K8dsIEbNxCU+WfzIqIJO4+
         cDiJ6AUwbPFb2P/c1UtMf1GhCuPHV7g2gPhEH+NuPX0HFY8Ii01kMhaqC5Psof6Jke8d
         cVFr7Mblr5CEPph2rWpNCQCqIw9KvOETIPStTMJFDSKIfq/VqjK0K7uopLT2/kofxg/a
         9H6XFwGX8YXxK1rYc6eUAfK/rNId9DrsXV6Yzg4ltMx14qdSbs/AqZmBUHoQXygqhGJD
         r4RW/B0BluR3hxnZgzwX2dFbmw7S7ppQQ1qyPf3X9GejKN48po7O4lnTCdSx6YvPsF4L
         HI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849584; x=1791454384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWmNAyB9T4vvPsM8pT9vVAZUF0SnZIMbHucMu/isPPM=;
        b=rAz5ZlGTCaqpMHD9jblaRyQncaXF8ul32afbSIClyARV3Nj6Lgd7PpA3OkTkjZa+9R
         nP/JW/MyLUAxXp7/L0XxPzknKeUHAe/MR1UVvNFyWQoWJPVlwHh06vsvz9e1LO52KYs6
         NuHATM2mtXDM5/CF4mBUij3AcHBS/wPNWJJeWMpnkjMuhkw2RCo9YNj0lI+x+huR34Fo
         c27KNofVHaI9B+T9jBzhEyTDCMX/i5BraPyJRqx+2BgAj1YAe9Kr9g9rMQ9fbE3mXxpP
         lugV6O05mYDsG6qhikverQY9fUIXFRkNmI9EjfxOWWwTf06rbeMyB4BvUA6S1DLmig8B
         dj5g==
X-Forwarded-Encrypted: i=1; AKwUvBw1Z9CbRU/Lu+T2PQ9kHkwA78skgQtw4UK1mTWwUTTFonvFpKM4Wum1g2PGbxhKIj7MAWeNCXCMs301tDN6@vger.kernel.org
X-Gm-Message-State: AFuF++kPjSnxY0Okueyiqy+LMSoRAuShkd2FTrz6cbTY0zWmDtW1EGEY
	/QzvmfhAn3p0z1FwfztN+tCDpcjkSKXYlDrWM+LAqqpQtZ/OBdOx7AhpeWa94pmgFdj7WVf9dMn
	uUs94HnF591Y5T//mGCynheoa9iIusNd53JRpYgwO3pKawMWCa+OgeCrYi3dIlvs74NIOowIuoS
	vZ
X-Gm-Gg: AYBFou2G4iuAk/eUXvAHN6p8ee7O4lOECc2ndUBZGL2ZvIr8tDRhaxsZ5iyF3ZBNZ3Y
	KhDHGSEPSfRhazLsziY+FRezqvtddb1j1knvWdfAFb0fFPkRp7XvOIg/+0j4KqD+ySHo1N1D/bu
	wnghJ13Wj6BXmZf9aCKaopCYOQ1DUnL009R/fOrnIkl6pDOGZu5WHb363dpm+XB2FsGKlxTXGTR
	7xXxfVyEhVH2R6p4YlPZ+2F/nL3dR3CZnI2gnZ4tOXIOOfNQdcBiIn4QceKJch9EnBh36bLPmgA
	2t2FXQmYT33dFlnfm53LE7KzVqcsxuVHOZK+8FDBb1nwD5494APNFrjqwKuMD+skqDvV2Mucyq9
	jNl7p11/cAlDseXAgnZestiCKZx5oWLtWzijyR7rW/PN2hCNZyT6STA9e+uC64gi4SresLTuHtS
	gwGIPVUwhjxZih
X-Received: by 2002:a05:620a:400a:b0:93c:c162:125b with SMTP id af79cd13be357-93cc16213c8mr80110685a.39.1790849583960;
        Thu, 01 Oct 2026 03:13:03 -0700 (PDT)
X-Received: by 2002:a05:620a:400a:b0:93c:c162:125b with SMTP id af79cd13be357-93cc16213c8mr80106085a.39.1790849583434;
        Thu, 01 Oct 2026 03:13:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a8793a25b1sm895251fa.25.2026.10.01.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:13:01 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:13:00 +0300
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
Subject: Re: [PATCH v7 02/35] drm/msm/dp: Pass panel to
 msm_dp_ctrl_config_msa()
Message-ID: <fczwdw4dwd6tkzaznbvnt3yw52ldeuacvye5v76rom64xhh5hj@pg6civv5gtvk>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-2-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-2-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfX/dCQX8FFH6H6
 itLsMOyu2gQbO7zAVMUD4Z5UsRwXe0n4P2OrjMG7P3ldOjsfNU03e3wWMJXCAwN9tw/j8D61qhu
 FUF9+wOXPI+D+NH7OP1vUtjviiAfGd0=
X-Proofpoint-ORIG-GUID: EAH1sa7BRl3XlwnQT5mFqhdZxMjUYnlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfXzVSQf0rEnlWo
 puylYPGvCAosisJxYbNvTmLcemm9k0O8A1xK7hUlgHKX7tHCOSjl43VlPhlUGarBl2/Gm8SoTwc
 h8s+QbK8HTFko9Gr1WAmCoWPdUFFV8YuhaeV0O8uGRYJgEtbvxyAsR3oNRhQssUIol3tzzzNxlh
 Cq4dyh69EpGVZN9+nG9CNighgU5NJ6KwCDo0z07ArZcAHcA1bBGQd2u+0jWZQhkL7MFPdxeabNJ
 O8uoFjhiv8c545E6cpJa4soEDA6JoxcK86cqkWDk8a55ECXSptUcT/0teV2SojzAD7KCzKR/QI+
 7FSAj0+c3mTaYTqLQHCIikGT/9EsXc1+8UZw5luVJahFwKAGs5YuJ9WKgUFpiJRdTnwNjYwXStm
 QaEX92aVxqMfYdTQpPpUP9BAAennfdtFreKXrczDSNCj7g1fLkb0fpAjOGpGHdjaT38UT2jUDoC
 BI244uleYMUb0AG28Ow==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe3231 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tDZS55ivhwD-za0uAH0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EAH1sa7BRl3XlwnQT5mFqhdZxMjUYnlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010040

On Tue, Sep 29, 2026 at 12:25:26PM +0800, Yongxing Mou wrote:
> MST requires the stream ID to select the SOFTWARE_MVID/NVID registers,
> but msm_dp_ctrl_config_msa() currently has no access to it.
> 
> Pass panel to the function and derive the pixel clock and pixel format
> from panel->msm_dp_mode, preparing for MST register programming.
> 
> No functional change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
