Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416188;
	b=D6QVAAP4M+XObVyr3kLmOv/De+1hy5Dhe5W9fewVo6BViJd0j5psP1B7s25f7KqUeiSH
	 n2V8W+ml76ZLCcxRTaRkuEp03UBRef9Olw9z10xhMBxPN+7Tw9Nw2x/3ceopA9sPrKaoM
	 fPEYLQ1wA+/EXAit4g2CXbJJY7jTYBePXraFIc1gzRgZ/pENZ62/iNa9drLY6lZY+sgEM
	 Mj205NqJiCYS6JfV9L8376DYRt1O/p4g3BpYdydLU/6M00siJkeI1nnyVL3AFVRwswo1y
	 w7ed5Tg4fd+GPZJmfUhpUQ7jRQtd8wTSRetd53sq3wddWqPhfrDkrU1glMtq0z7QMYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6SGhToZVDBAmY0nSnfy1kLVZC6LifvOaMyucd4yV+pw=;
	b=qFDjHsvyOVHGgr+w1182H+cZnXktFZGuw2Bcc9PNWIw7A4hz/ODGXyHRHC2O0EH9gqYl
	 hWnwEB0+PnUSj2xSce0GvAzM0ipGBikieGOqUtGhSxf7kWL4oysPxZq2OyOSFCaZrvYIs
	 mrXElnH5T+xcyV778fh7MGaCVZqCzoSzoDCN1qCsoHdWLiU8tE1TjecO6Czf9HIhnhCXm
	 0ZPX3S0ks76hk3KRnrCiMCl+IX756psMoVQmpk1UYMVP2VAP0nR2omeujC8HIyOQdGz8V
	 ktB5PUpVMOqmMq24xIuBEedf0mb+g7qufyNxHKkK3Y56Lm6Gxrr9IK8qC+TU1Aq2kFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rdf41SCB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RFFN/9aa";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A79606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rdf41SCB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RFFN/9aa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0ORm1012599
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SGhToZVDBAmY0nSnfy1kLVZ
	C6LifvOaMyucd4yV+pw=; b=Rdf41SCBIoPctfV9yhVogRIBhB1lPP41gPT1nb9i
	DQ4s1g2CBe17SzoFCoX8njivuVdDVVwNq0dA8P8Hj2+OM+E7FyHcyXdDVLd5WjYw
	yMGzriAL+eBnsZ2aU+BgmOjBnLkUiQkeU0B36OahrEL9h+LCWItm3uYpemidFq6A
	A01FlQWo/98RUT3/53wN4Bc2j0FxMKlVEtbzH8itRqys7IBPUawypb4sNWWu/6SS
	t0v8jFFI4H1Sgubjs8cA5x8c6QQlwmMRVEFyDbYaXqG9k2PwcKfF5nSJC6gvkgCF
	M7WRnFUH7eva5QPUXhBFst/i0iOsloLb0/vn1tCQnLXbxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34hpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:56:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-945c60b470dso506506985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416186; x=1795020986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SGhToZVDBAmY0nSnfy1kLVZC6LifvOaMyucd4yV+pw=;
        b=RFFN/9aakqSJylb+lUhryrSeHlTqRjBRFgSGUKPiwWn3eiiQpckStxbSIwPxkakdek
         wnTayVI+3VQI+SVy3nN56sBkuvCnakhm7EkR6Y/GDVKVTDnEm0dAnZ6K4KMQMe+uot1I
         2PAMR4TmyswT3psN12sSmdFnQ4LmRVssmJj+YqPzb1AlGwHoZd9nrtdfvX6b7GTBEJ5O
         O+d0laDY55kSbyRCt4icKODpPb4wazZX+R817+FOZlqXV9y6hz7pQnRcu2/LU6+sLVEK
         5dXD1+rvtZsz8KPznEtWRG/yBZCemPMBQZzqhmMqkxES8cevqB01biBJJu9PTYCHzMXz
         +5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416186; x=1795020986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SGhToZVDBAmY0nSnfy1kLVZC6LifvOaMyucd4yV+pw=;
        b=xVXCPOVcRurwDdVv07TRVX8DpR3MCoQszAOUCkKdFvnCn5lmMQTCdIoiz2cCKroFgi
         hv3XUAEIB1/SFw2BaYPjUVADYLY3OCVIfl8dU7NUWJS5XFOg/0vKkWcy8qJzp0ZCyemt
         rvpHW/7f362aI12BTQpwCG6ZxmODfWvyUuX6lN2qYovOHCkNjp8GC+gato5wsNXWlqw3
         N0Oxz4rl+T0thZ3zWZb6s1ayl+jRHKeld56sORUMxO2KCU+buEOPp20wTafnKfjNA6ON
         L2ZLPNuPBDXrzm5xHjAQGBSGoOLAQ+umkuJzQ5sk+0SnzXK/OSshfACjipgBLlbloN09
         sOKQ==
X-Forwarded-Encrypted: i=1; AL+hErHmyHM1VKX1gemQifh+LcM3uhDEJj/hI6+KdbyZvioXJrLrYYvadphteeo8A5+RLqsuT7te3X49ob5kHtde@vger.kernel.org
X-Gm-Message-State: APuU4Z9px79Kluowj/9iQIelZdSAC2KczX+gdG3p7At9hNLvnJL/loof
	roAPkOtSWDPFNND0EJbkz6F4wTikpusxhW+OO8x9GA1TO19XUT2AG3PtLGKGcMo71guNoCvOGyf
	fhHLF9mORVlgDuSRTXbOcOTCuXQ+gMTUqckugmlsg4S5SUTMUJMcQLdF8d2UFPMHU+IXU
X-Gm-Gg: AYBFou3b/tp+BwU2QPY+Z65oKPxt7NYIn7wTc/WudZy9FnWSb/v6TrogO2QBH3IOKiA
	O06ZrHfrZmoEY9JWpekZn2Go+USg3kK99j7ViTTayM5gAPCEQpnaDnusWCdzEishi+fixdu4eYf
	3fk9G+6aHp9FTgJlTYXEw79l9vKxwx8KeHRnDyu3Lw9iJ3JebgE5lqzBZJqK6AFN1BYbG2Msaw5
	aMvEjsasa2pInKMQAUNHD/AbNjbVyHQ5LyFDJzrjVR5cGIFytqBXuJ4lESNw+xJ7sF9/e0HymSx
	kXbDnD3HXw37X+VWjO94nEbBMKagIECgemMALNDabvq/WQIJiH3FKawMkUOoSlTfimx6g/bfQry
	l8RToZseTCoasqy+io3f+qnMe5I/BtsvM/gs1iTYKakQfi2dny6/w8gizIv904m2le7HR7HM085
	miyj2Wf/aCBUL70y2fsav3cTAD7YepgmpFpygGS6u2m1VPFW9IgQDseakEaAxQEA==
X-Received: by 2002:a05:620a:2890:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-947afcd2adbmr501041985a.4.1794416186067;
        Wed, 11 Nov 2026 08:56:26 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-947afcd2adbmr501036785a.4.1794416185561;
        Wed, 11 Nov 2026 08:56:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba5363sm1085381e87.27.2026.11.11.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:56:24 -0800 (PST)
Date: Wed, 11 Nov 2026 18:56:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/msm/dpu: add source split order op for DPU 13.x
Message-ID: <scokoairkxrec2i5p2puxjbdkog6p7eo5s7rmx6q74l65rdd2e@c6lgdbvjgam2>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
 <20261010-pipe_order-v1-4-9d8bd29fd78a@oss.qualcomm.com>
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
In-Reply-To: <20261010-pipe_order-v1-4-9d8bd29fd78a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af49e3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=XSFdTqI9Vx7Z9g5_j8UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX1F/w6JI2jZLG
 GbTG7S+cbAu9JWpirHBe3zLfSsabKmDE9Ov5q9DmNEMy8OkwsJMDCpkXsCDPII0UDvxR14PzezA
 VHtvnxf0w77/sQhXaKTYRsXDwleoxA9YDew1N7pBSuVHziK8p2UA77NIxb3kWJf34ShcmMPZGuQ
 CH3F4tIciLtsNZg2dMWb0mOTilb+NXlHCpS3LdWQSztLUMsaVPryqZuEDU+3atXJfHFUvgWnuSM
 4bGWjYUWhrGwGX8qmmfiat8y356FxDf00uen/oWeL5qZLR12I0484/M3HGHc5npU0METoUEzR34
 IfaG5qOEpmkSB/xIvgPLJsoXNHee0lh6pfgE4BUhkYN7bL5iI3EuJmYcnIVhztBX/k38RidyC+/
 jCUOeG5fcN7Ry/Ve3OJEOvYxzyytPCHwgB4NPw2FdUssZmR0Lc5z8dQwz1S1RC5OZWSAG/i60Rh
 Fn8Utp4M8SuUknGMl/Q==
X-Proofpoint-GUID: oExvJg16Cc-X6P_j-FhM099qXixI9JcG
X-Proofpoint-ORIG-GUID: oExvJg16Cc-X6P_j-FhM099qXixI9JcG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX8oZpGnGOguXJ
 kzDWgUu8jxIcV0mlu6fef2T6BA9Rxb2ar0OXJJmXJnkWCKebmLY1TuZhx5GfLK+R6qNyJxG8M16
 ljFWMex+35rnbLLRlz6XcLLYFeniyAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

On Sat, Oct 10, 2026 at 07:08:24PM +0530, Mahadevan P wrote:
> DPU 13.x places the SSPP op-mode register in separate REC0 and REC1
> banks. Add the source split order operation for this layout, using
> the shared helper to update SRC_SPLIT_ORDER in the selected bank.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

This should come before the last patch. But as the fixes shouldn't
depend on the non-fixes patches, just squash those three.

-- 
With best wishes
Dmitry
