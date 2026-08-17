Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F03F3281
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976023; cv=none; b=brsyrrO/naSQQQfM7/+lrJrO8ZMJs/ueGVV+hSmNKFjQWnx1cVMyWYkZleRTx//Yp6b2u/algyhKdP731YpX4GAqLHMc6AunKsr6je9kvsAOUaRXBHeSgymFPEqCj18D+QikMVUNqD0aBg6uN0I5q3dTt9/mWRTxf/C5luuMJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976023; c=relaxed/simple;
	bh=k7OIn0paOAZo3wXOcgAJfsv6nFVPK+Lo2VTwLCbguQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyDJA24r2KP2BKPOsg5B0GidpXOdScByA8c4aHbVbT3Co4e7YM7FBYZn67HL0wxEJp2SQ2VkxHFI9x2Nyw4+NwUXD+FYQ8Eqr119lRbecNS+cucPFeUMKt+Vxs4pTtH+mQ3S9Fsxm/DVzzVps/1Pw+dBI6TxRDeOa7qgXAI0SUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+ZoEklJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWS8omPY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+ZoEklJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWS8omPY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6JE32431650
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgQVHsT19L5HSw7LtJPGoHYvBVum+1zO+UvRrJRep48=; b=o+ZoEklJksEw/ncN
	m1jTfs3bIKwuuaz1OMVfbhk4qYzCNquZtq6rH+QF3FKYLwGBk/XUs7hsdxTmp6ZL
	nVMT+VgqjkpkT5JTr9cNv0ucLoAxTLPJ7ADukQCm9riwyN6iDDb/DvZPqIPAtVug
	Qiwr1spnQHsuRby5r2G3MrtTRNqIHFmtqPXmUDTXaX62Vjs3AXlpWP/nMGw2ionP
	DZ40dbr4vrFWv+gdDj42AIcwFN7ozF4oplv906j4j4ue7iGrMViXQOrzSWlqydsR
	Xgk5Iz3/MQsTeVOwdV0RWyDUPb5j7EH6/PpkavDld2I7oB+SF4SFrwcdjXMHkSxh
	3qo+wA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrehkp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:13:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737ddaf8c57so52943137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976021; x=1787580821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgQVHsT19L5HSw7LtJPGoHYvBVum+1zO+UvRrJRep48=;
        b=VWS8omPYxqpL+5kzCe/T85Nbbm73OHDoMmDhpOeN5z0Zz9i/hcN+L64ULbQj/z5TNG
         u/GqVahGrcZKeEnoqZi2A4FbfEXugnbpVOeksGdxEu1JAawhTbIfD61ZsPlSQkrBHEBf
         TnEVla0PfXu60UxcIwi65K9lBepoRi568tTVxWjd6SzkHh2/+W6hF0y/Di5Oje24t30J
         P6shBcRjuQS/4oGRDpSVkUf8ULJbznHkuctE2ERTjTZHWNz9ZdWdxsKC99K3X+4EHROh
         u+YBK6HxgLJYlNhGITAtN6xvOWo28fbHDGMy2IWg5mTkpXXW4bG+dmKwv7Eh+QH+wUIy
         cXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976021; x=1787580821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgQVHsT19L5HSw7LtJPGoHYvBVum+1zO+UvRrJRep48=;
        b=o5N5sWllRRvYMz9BkijGoNvl18FIfZlGzlmK6qlx/qxwk0jKi7yDkidQwMXCXxMlZv
         1H+2N+Um+7IHm1g3Jl9Jqv+WhjUiZZgT45vOPcrkLHzn1EPUqFmHlNnaPafaVdmtx+rw
         1YjmqxJMsjfcEZ6I8/glaTHQTKY76Z/g9ez1C5WgnR89OnUUXy+2XpuDNSFr3jwbgIdC
         eNlZnkNBp8uydnTjvWJebC1URiUlOPLpK0CZNO3Oks20cD7w26eNPPxhEsgtfxT7/Ota
         HOkJTdvyCtFM8Qk2I/cD0HUfFkOyGqrGZiisLmZTebHWb3ftqo1pjIbn0RfmGuWVMNrv
         65SQ==
X-Gm-Message-State: AOJu0YxKqHVm9yKDgYkMom8vkqoffmFvHRnciIcf2kRBZv+htQJTy9gn
	2FQKfGYBPKapRN6PscK69qVTbnNkeZlKcOK4oyUy3Ei3Hl8enfGjwJxTJea3RKrn9KLvEEU7R0d
	RcZDhmbbkdExrgFWgP74xuilPFDcGiebvxZkhFu2Rrxz7Wih1+HF8QpiuXZtaR836LCh5
X-Gm-Gg: AR+sD13QU+j+gYEw+kQab/T4tX73GIyFlEbkxPydOTH66B2gjR81VqFZuf0T4bI9ad5
	7kDYXOkNrED8B62l0gaWS+Nr13JQIO9nOaJs+cFI/duGCyZNl6btDR6lVki8pEZDo0A/BK/Txiz
	DLZN2o7fOSvwDtwF1s0Tm0c9fBT4f22dE5cJNV50253dqWXBQBmLk0cZoJeHLOhFJ71emmWZQoJ
	/Zf/eTeyz9JZJq8jWTtKi8DvzzfbEvLZp/+bfossrgOXX97odEUZ7mfT69xdtzvKGppckjlAUYc
	n2aSaAmqPtCsi/g9IS7rCrX98+CIFnF1kCGueSjKOQBdEvxh9bEUWkI3KA8DV88XsUb9dvXsUr0
	kS6mm7LfaX6TC6o5RiZ7qL2pX
X-Received: by 2002:a05:6102:6a85:b0:739:de1e:6c28 with SMTP id ada2fe7eead31-76f281993fbmr1995160137.0.1786976020681;
        Mon, 17 Aug 2026 07:13:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:739:de1e:6c28 with SMTP id ada2fe7eead31-76f281993fbmr1995147137.0.1786976020212;
        Mon, 17 Aug 2026 07:13:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97aacsm34235666b.44.2026.08.17.07.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:13:39 -0700 (PDT)
Message-ID: <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:13:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a831715 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sndJhVXln6Iqe1BNRX4A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: wx6fHGgFOQSFtMuDu69pzGLTp_TGPnAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfX/DofTAEmqfz4
 p4o5TdOTTOXlP9pZJIy0ubO5gFJw5e5IA0LQhOTzcFKPnuiZGYFXxR6+BBv/xbBXsmKGzmadccw
 LWNTLutf7ZQuypQWeCssm3y0KimOBzLhl2Ek0fkvGLa6Uwtt4EeeCE18d0n0uyP0sQZwtKkGcMV
 twnbYoSz2emizEB2krlBeBqHnG6e0vI0IjF+kZIvKy8j2VVVLPz89g1WC4sskZ99Jt1TQNHWgDE
 bzCLh5KNhqlchfFknQ6R+axLWFemJccdcywJO8GCmqQjBPQ2j0Mt5/FxV1ZKwuUwUG4t/z6PI/A
 XeBU8K/0F1nO7+0eUZTb+ZB/L2g6Hv8Q+6qTR5Tta8OWCGNgoMFDFTpYa6QZW+DICPHVhSZhbWT
 sBjTNjmS9+Pkb3jL4qvmeXP5fIWuzust7OyRXJ9bo7kkhutV4ti6ifFjoghSoYDdaf2S/feoRtP
 wmZd6g1wA4/c3YzKqSg==
X-Proofpoint-GUID: wx6fHGgFOQSFtMuDu69pzGLTp_TGPnAU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfX2F2ZyM5eZnwz
 1pD9H4K3KI6p2EGeeZYy9Bvcgf4rxWdIHLSAYjXLfvHZ9ajvLEpyly5UqEXEs28OoTyKJBFASik
 4hfzzeakbKkpE4u2C2CoXR557Bg2/To=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170109

On 8/13/26 9:44 AM, Yongxing Mou wrote:
> 
> 
> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>> powers a subset of SSPP blocks.
>>
>> Can they operate independently? Does INT2_GDSC need to be
>> powered on after CORE_GDSC?
>>
> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.

Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
be enabled itself if CORE_GDSC is off?

Konrad
