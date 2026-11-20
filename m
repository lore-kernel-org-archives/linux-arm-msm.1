Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168185;
	b=QqyAqgVeM6aZSa4yfkDRZy6Tbm9AUqYJySyieC46oESfyIYpMzSAhl3Fz/5FaIhNjMe3
	 FL+mKjVg1hdmKi514zvkpGYp95SP/jPQwzPwn6ptwj2ZxWxNxZ2+z+vKxUlquLKyser2E
	 Ul5/wX5TTnsPhcAW5Oc2eKHNZPv1SV0WFaqsQrj19Dbdrs9bF329MA3tgOM8xvS7JVI9U
	 qhofbDA2MIikf4NEzesic9AeYQ5ULy9t8PtbsqphgxwwaWicYeLpFYjT4//hnzLHYND4s
	 T7eSR1wzclzikHm6coZhNUonlQmfib6vd7QJjyyQQblwQghSxYp/66Qar5PAhTl2GAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
	b=Cw/1rBVsHEt/Kei3zqVFfBlKHVaOlsRpv1bre0HAdhpf0t2tIIJFgLkH/ArCpXw7E0cm
	 u033N4WFwiEBq7WswAtf/U/8OiJTYt/jd+2zEsN4vO1t1FpZCW+QKWu10w6vSQAS/kUuf
	 Qgd1LW4JYhey0ZsuUO2oRRh9/s4x2Hp0ojxrcn8VK1Z+y2EL2+E5OPYzmXFYuiB+wOy96
	 msiuRXvODmeq3cUrvO4VkrZq1UManwhwJdYe7qNEW28EveHVrPupnX1omSss/QPmaNnfN
	 1t1CCfBxJaYQQFJR3EKQb9+sCWrzJfkJK/GcKLEGXeqdwObk9c6AuiD3kE0dmaNkP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRT9DmCy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2Uq1hnP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97318606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97318606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRT9DmCy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2Uq1hnP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7equX144444
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Qobe5Koi0hqdQPSNyvly2xZ
	Nog+FVkjUKeG4gVX+Ls=; b=bRT9DmCytUwXRpDtGoTds3HLK6B3uF11frldUEDT
	LfO6Nfek7yDpJ9nZxe/L5HJPsj8m09jNv6Y4HIxu+Ozsf1dnApWEIe6WFjDFCsqu
	iznZD9bZJCUUQmZfGQlgJHwfiLv1ghJr/Ou6ifG/5Js2yn2Y7feiBZ4WQIAVdIQD
	jr4f8Ca8jRRzxAtwfsbNJhMQWfJac+PeMheXMrjKj701ls+iGB8wUmAc7kPPV06p
	994KH9lBe6Mnqu5P2UzlrtyKKrz5OXCE/4v9Kf2JPaMkrNUcLrDgjQShbbsXTnjK
	alho0bsO4FaPR/D/Rb+/5XIpFQnOAsdugptkgOp2VJmxZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh4n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:49:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so134447585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168183; x=1795772983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
        b=f2Uq1hnPi6UMSwFZ6zV8yv1uN4V7cktNZQUpg7Ma7DPo6jOMVIWHF2WPB9KVGDcPvc
         4JKSSw8ojq7FAAfERwPMLgE/GyvbseMKUR0cOYxQ6p8ouFKuDgwXj4AdurjBskFvC7j4
         NLPFvM/UTWlbLlYXNZWS9CtKdarD8xnV5qgIn2QBkO3U2C3HI797686KKjGxy2+vEVCb
         ImE3Agtx1TOE24xtRhTWT01c5zlsZnGgQstuaqOuvWyFFycT5zToSwbdCJSnPjdbHJHX
         l2o7hmHDnx8VczAEehzeQ3DrvqW18HVN1QFF9x+itcW5k0OadpOROM+TY8KvTABX8uWJ
         294w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168183; x=1795772983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
        b=JARppFQGOw7mj1UgEeX9/yPTrB86wQFnSCZzC7y4N+5iaxTyIVeU6AUHD2VyQEssN0
         KdFbri19z6oRUiss2fI/H1WW7li8LxMdiYQfvke2+bbIP0G53ar54rDioSTO8PeCLUZ/
         zt5QZ99dzTMXlRDwwLllXcdE6GV27Y+Ex04m4VkstKlz9XoV6QQmlPU1eQWQfp+Qbr/M
         +9PAbIYlG7Lk5xL3C/aj4c9+2p9GeBs6EN+9rQCV7PS0Fj2daw4U6WN2WmVv3zolpmom
         9NDA/c7wVggNsJFjTJAmz8C6TtM5n1fkiGnmpc/cJhi3e3v18BtHxD+CyVZFw/Rzae7s
         kxxA==
X-Forwarded-Encrypted: i=1; AL+hErFVJy6FlmYQF9tHKIJ4bRu+losXR6zHM8Qb9LyACVeAgo1AFQoaw+KynR1MaMaWeFVFN2YvWp8QUvbcU5Vq@vger.kernel.org
X-Gm-Message-State: APuU4Z++o2vZD61njAvR+7e96CPj2sDfaHGKCkHOOtxz2jgmJsXkVB5j
	Z09Sf7aY9Oc8a1QOaD/NH+HxMVmOxf4hxrFZXyFIOFKynm6URU0epbviBZgcvy59KD5A+ArJy9j
	9PcAE0mU2nsaxA+DdRjh03Xga5Q9W2lMCAB2VK7OYj+r6RjoVkrae/CZ8RE+AilpruZgr
X-Gm-Gg: AYBFou0SsqI3BFVZ+/tw6372+rm58Ig8CBGhAUWq5LgcoWqksuGiLZ22f0Y1nvUBlkY
	Rh6xNtnAN3quhDleHEUsL0Y4+grenUxxhI/gQLNxkXaGnQgXUbTNT7D9heI0wvCMr6X4CD6jaH0
	sn8yqXTpAhl0zFGQIB3BCm5HInk3+EtNYhRGlAKQ/Ts+a5uaZj1OR3MAsSwLHGncaLwwCVCqdKE
	asMr+wEL+Xv2Cw/UZBIpFOI+LUTKREDJ8r2l8YZucRLdT5x3ZuVOEWAMtOeh1KHqELuj9Wc6wv/
	7NsfKbi3Fgnxt+0ZVUSydSoBNN0VWRKUlAnonsqKsSLIkL2nnQ5suey9PaGZhd0Uz6CpzLaYs51
	AoLr/1/mjiRURrAVIfBVF/syPGLPdtIBWJ0LlB/5fNTN/MkZp2BWRcGc12XIQOZ3M
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr404459485a.54.1795168182614;
        Fri, 20 Nov 2026 01:49:42 -0800 (PST)
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr404457485a.54.1795168181963;
        Fri, 20 Nov 2026 01:49:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm4443810f8f.50.2026.11.20.01.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:49:41 -0800 (PST)
Date: Fri, 20 Nov 2026 11:49:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
Message-ID: <zdolt2jlnv4gg36pjbtcaxseqbcui7f7pemmoo3ixlyk3ivcvi@qxkutu3vxbnv>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
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
In-Reply-To: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX1SUUeQjXJWpq
 DU85gDfxaVT8cBdf/Oydw8k2Y8gxA9LucWIWwsoC7bSdV8ig0tYUqTG393TTEGBD7PqXAOYNyCT
 r34GDJXyxNtR09vhZ7qYfPeekdwZf8cGNHM4tol9MyoXN0I9ea+rLyvxru2gwCMzTp+7YAzKYxU
 c2cQt7qVY2Kcv34jLCmPeAFI+Use98rs9gdh1dDC2OLwQeSahWCGeXP0z6UT3u/YBgzaNJEyQdu
 d5Ou+9fsU+EyY0R68bO32gbJZIlwNK2Qf8EnATzDn9HP1yRey/xx939d4JmbO29pzvi3lGOjEvZ
 0uAH64yUBE2VZ4ob3ylQzlavaz9gMlxOwtby1cMuOSz7pXu34/9lvm//IgtuFCvtFoSifjl5jyp
 DmBZO7x4hb/85iJ8AudmAbTQcjVPHtBolA7UBN+UPqgjasoqyy+qk8Nc7chEKxImyWG3dvgL1qL
 QShc/yFEPejQBe4SAMw==
X-Proofpoint-GUID: mrKjEnRuDJo4a9sas2bh6ZRWm9zch17G
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0017b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=G6VyOm33As555aFvO9IA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mrKjEnRuDJo4a9sas2bh6ZRWm9zch17G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXzJlYIDsGyXTc
 HH+ysZJbmm7pFPGGwaED1ejYuf73dJ2kz0a7T6xyzQig0aiC+WY2GunBgpm7m+CUHgVxXaNsl9x
 j/9j9/EFwwzlkt3RhpTm1ALORdRRgG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200038

On 26-11-18 18:38:29, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the A753 GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
