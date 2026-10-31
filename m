Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478276;
	b=iVH8ushG5UmP2V9EphqWJAWVG4YyzF9ojsl3Fxvky7ZE2SNW8hwtXERvTWsiUkEvZcPY
	 7I5npFLgtLZiwXhmMvgNge6JG2VyYoxrW2x7kyORTPZq7ETMdAbbcKl5T77q3XXGH/MZR
	 mCpM0msz1yvVnBaxVB6O8Gdo774lonEYbc/zam0KEnvn/cPy0q2oNKUPg7ggs95shMnK4
	 V9smHhk1fzwKWLkFghtkpGAXgj0ol0tQFQEt0Em8vgU1HECodHBXId5zfHFjxnG9PbRjG
	 SU3x8RzM425AnNneeBfiYywY9Zq8kqguBtcmiw5rNeEXhituD4gd+UBj8DoGhgzaJmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LC+7yPvVyik4+Gpd7nEEb6EXAVPzoW8RCDIH4uELTVY=;
	b=MLY1X0fzWcFcge2sCi1BvJGU/0HZyDSN/4mdMfyqiegKdt6QnI6Xw9/E+my0ceTGkaVI
	 lbXTf7Gt1W3zJ4RMj2+x2x8ddM0T2Dj1+EpQN2pAMFwWiuPXytqidP4KRqP64xVU7o22a
	 Ui8QUnqnvdWehOJhWvwq5T3iKprj1deYm/ult6lQnaPOQKbSHO+H98rmJ8Th5bdBlLNFV
	 echaMRtrvq6sbriNMRHXb1Y9bnzTywjl1n2KNPbbWl37Rq6tsZJ6lZ90Ud1eS9hu+ZbX6
	 IhQh8BFddjn8RjOWCYyooVHQkzOVXVFTkooGq7KPkDY5TKps8cOogq/UzZKRNCm/jnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CLUZaKpj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LWo3pBW5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7F606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CLUZaKpj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LWo3pBW5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF5Z53976312
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LC+7yPvVyik4+Gpd7nEEb6EX
	AVPzoW8RCDIH4uELTVY=; b=CLUZaKpj1g6ex8FCQS9pJcuDpv4TWX1jzc6/jDUi
	FcLRQVpCsXqEfFD4fRBfDD4ODU/Ls5M2UzJGJ5KmxZ7JYmAFXz6jhMj0ENhwbR6A
	B1wTUC9uKrcyTHYnr2p8RYfIrKzgHEWmqfz12f/SP50gazjlgL+oSHB/0HmWYvyS
	BNa1+kPp5hHvOxoA1BQoBbGpfFW/iBmiPgNh5rUTJqRU42gLE9D3zM8+FtK2xoBA
	m97fzzVV3pr1pnS43kNzkBLSgLEjdqKNVb3NaIzm8CFWKKbjf8lviSrUn8AIqUVa
	h5Dx2ZQNsSDS6BskLCATvsxGPLwMED3x5BtFDHgueQXGaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rt4ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:24:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so367307985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478274; x=1794083074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LC+7yPvVyik4+Gpd7nEEb6EXAVPzoW8RCDIH4uELTVY=;
        b=LWo3pBW5BrR6BJQq7DV67ez0ZIF+7epsL9cWFYM+ib1yN1mv2AA6yfeuZHi3N3bKto
         z4ZQCgfoBwPhHqAJpPUbcE6PcxzRQLYzOSk5e0wzYjo7yJxiCQL0ZSdl4o1VXtP4poHN
         ap0hb0cx/On6Kv7AxgkfpZiKojwjnRR6nZ8qZItIdbXBlzbwNBvrOvMWWqrc/A0B2V/G
         wgCcCXTFrOwoYz/2k93BR76geT7llcf6/DlXUEJmmHKVXRTujcmarhEwag1T2g6bbtk7
         ZqdOukE7JocMsUxxxsJ0wfq9JVXKZTKc9GQMSOK1Xn4MiTp1e215QgoRW61iNr0qLxWv
         Q6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478274; x=1794083074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LC+7yPvVyik4+Gpd7nEEb6EXAVPzoW8RCDIH4uELTVY=;
        b=Ds1RqVWcpo2ZDEhdJzRvjqdcbrqkzC3YYTFzjNQHRDdVHAfAL4hVyJkbXeFHg13NaC
         HbKBRohHLQBIoCFUC4vXRn4Alp/mU1SVLjjrDwjXn59zp03Quwpy796PHNIJo+N0+HoL
         6FGHL+Y/Rn6PMzdUr0FPJGv3Vh0VPyfsEtrXrKKosy3AMBYP7Mxxs+TMioS91DzMG219
         Uu+nFt3lFWa5hS9yYkgqPVSx2AQnDo4+nn37oPIwWZ+rfh0UivBk89N5p1JyO1yDFWWi
         BAndgB+LehfTTxX8rhubOMHKvRRp/B3v+MRZQmS/Sj4QNDwGYiOl5F7PZZoFaNssjgkC
         pHbA==
X-Forwarded-Encrypted: i=1; AKwUvBw+arqcc1HWiuAtXLaGxAtpyGiqPci00Uifr+9kLtJXvS1sXorR7oWRsmUnN+A4Dj4FA+M3pgt/9JQc0mMx@vger.kernel.org
X-Gm-Message-State: AFq9FYIp/6HoeeFh0y/te9CjgqYs2KsiJrUm3wj8+q4pHtnYzhr7+Z82
	43W9wrswwgQ/Qx9de5XxQQgN08AfE9diKpotP/j8bSTnf0ya1K+nOVJ/ZMASDC9ebIC5Qjm0ZNZ
	nbaP2yOzR7hIkqxBZgZZKjMng5CMB4nSPDsQ/hyEMrefeVEtaXE+Td253MeJGpGh75Es8
X-Gm-Gg: AYBFou2edTGCBbTPpWBjPTzP1+sR4kWB4zGbnieQJdvNDT7WK0nwE7ygnUfTuZGgNNG
	w3HKrXdciwD+neVP29mVPNDYTSY82m5wrduLa5SvLYmZheWvBl4Ub+vCZ5RyHK6G3ogghM12siX
	QsFGkZOa32r/mDj9R5V7Mgm+GOSf/eDxDKHqUMWuxC3vKneP8LkSVaQUZ3QqyRn1Ey3IH0FA53F
	l2uK5NxIw8p/LOY5pLbHaxKmGaXKrfWH0Ckqr5da71XAsgrvpcQQl+JMuQrpxHA5HJ/akHisWtz
	cC1AqaXWWJtlBxrB6EFnJYHRLcDCAKbDiPLNDUmbNPzbf7+WNycw/n4/k57jw/WDMAXTefU5W5K
	TMMfN+cjZCl4iPD7hP69sp2SH+O722h4n4jr7TmzXT0Bz8F8irZmLJqDVUbL2pz9xGBvKDeS8/r
	26T6CvTuhMLSdARGuuBEy4jzOwbqI6OKtAsJNcALQfJdqe+jh4u19iGyD+uPxgAQ==
X-Received: by 2002:a05:620a:444d:b0:93f:4498:603a with SMTP id af79cd13be357-944133d4a68mr1436455185a.35.1793478273671;
        Sat, 31 Oct 2026 13:24:33 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:93f:4498:603a with SMTP id af79cd13be357-944133d4a68mr1436453685a.35.1793478273159;
        Sat, 31 Oct 2026 13:24:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbefd30asm13000291fa.23.2026.10.31.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:24:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dsi: move bonded command failure flag into
 dsi manager state
Message-ID: <l2pcxlml5vdv4ws75wvqjhxbjr43hfosrvd2nyewhup5umxu34@feozzmxb7poz>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031150305.1107572-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-2-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: Ghqpo2gpwW0clFBnt0J6iB3bW0WTI5Dl
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae64e82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=zRbll8i6zLBPDSgtwMIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX+Q2Fe0rTqkUw
 lbDYcG2DWr1bm13PpbPvUlD9uJFN1cZ9eizTyzJSmTi2D3MtqvxwjwRmV0n0Z27Em/sqYO1h6X2
 PEcc7lZCH5DAG6vBv8noVtdW/bN8+3A=
X-Proofpoint-GUID: Ghqpo2gpwW0clFBnt0J6iB3bW0WTI5Dl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXxH04paLIJrJt
 ysyV39VOFQLTfnLFTIW0Nm3RxnPt9wOmN5SQfDAYDDYHosYOrXjhb2YB8qsb8s8nM+JNZbySI5y
 xdZmYdGt00UW1PSfC1WBTebwbgMlbT4CwcwP+nxdhmGHKG8uRcyYglSHpug6CtV9Rr55PlzendX
 ZHDtSj4HgpgHqTKmPDuqVI5aj4TA/uEiubBCydWcpjtP+v2w0muoemn0CTHa27wUrZghR/vXRR+
 WBVyOqgE2O3Lzkx6/qq0dOCjQFLzVguNmj2Z15hRxsPRUZsTSOBVhrPvwIY+FVJ14W3ggRXF/5z
 uRLjVccpyZufYgmWdK6L+RjvtYmxFfZYt/rCpSz+olYDrNoaz5kgXd+w3K+O47HTJ1mDJxqFq8Z
 W5XG7/jrgIPn3WuqMw8GDQ/ke0cWCaOTTwHKQyJ2gbB/2pO7znUHhp+NwMBDH9ZFVNgZHZFD3bV
 UNO2NTvIcwmcEpmGzaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:01PM +0800, Qianhui Xu wrote:
> The bonded-DSI command path kept a file-scoped `static bool
> dsi_bonded_cmd_failed` next to the global manager instance, so bonded
> state was split across two storage classes. Move the flag into
> struct msm_dsi_manager (msm_dsim_glb) so the manager owns all of it and
> nothing mutable stays file-scoped. READ_ONCE/WRITE_ONCE use is unchanged,
> so behaviour is identical.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 559c07a8b9..93d636220b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -30,6 +30,7 @@ struct msm_dsi_manager {
>  	bool is_bonded_dsi;
>  	bool is_sync_needed;
>  	bool is_sm8750;
> +	bool bonded_cmd_failed;
>  	int master_dsi_link_id;
>  };
>  
> @@ -37,8 +38,10 @@ static struct msm_dsi_manager msm_dsim_glb = {
>  	.master_dsi_link_id = -1,
>  };
>  
> +/* Serialises bonded command transactions; the failure flag it guards lives in
> + * msm_dsim_glb so no bonded state is file-scoped.
> + */

If all fields guarded by this lock are held in another place, then the
lock should also go. Nit: please check the recommended form for the
block comment.

>  static DEFINE_MUTEX(dsi_bonded_cmd_lock);

Hmm what is your base kernel? I don't see these definitions.

> -static bool dsi_bonded_cmd_failed;
>  
>  #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
>  #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
> @@ -51,7 +54,8 @@ static bool dsi_mgr_uses_bonded_cmd(void)
>  
>  bool msm_dsi_manager_cmd_failed(void)
>  {
> -	return dsi_mgr_uses_bonded_cmd() && READ_ONCE(dsi_bonded_cmd_failed);
> +	return dsi_mgr_uses_bonded_cmd() &&
> +	       READ_ONCE(msm_dsim_glb.bonded_cmd_failed);
>  }
>  
>  static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
> @@ -374,7 +378,7 @@ static void dsi_mgr_bridge_enable(struct drm_bridge *bridge,
>  	if (!panel->prepared) {
>  		dev_err(&msm_dsi->pdev->dev,
>  			"panel is not prepared; refusing video enable\n");
> -		WRITE_ONCE(dsi_bonded_cmd_failed, true);
> +		WRITE_ONCE(msm_dsim_glb.bonded_cmd_failed, true);
>  		return;
>  	}
>  
> @@ -646,7 +650,7 @@ static int dsi_mgr_bonded_cmd_xfer(const struct mipi_dsi_msg *msg)
>  	ret = master_ret < 0 ? master_ret : slave_ret < 0 ? slave_ret : len;
>  	if (ret < 0) {
>  		/* Never reuse a packet buffer while either DMA engine is unresolved. */
> -		WRITE_ONCE(dsi_bonded_cmd_failed, true);
> +		WRITE_ONCE(msm_dsim_glb.bonded_cmd_failed, true);
>  		dev_err(&master_dsi->pdev->dev,
>  			"bonded command DMA failed: master=%d peer=%d\n",
>  			master_ret, slave_ret);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
