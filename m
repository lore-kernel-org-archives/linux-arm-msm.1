Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370185;
	b=uspT2PeOOEWPHgIItD42bb3UTZ5VkX4vdBXSKLY/XBAXz3YHO3sQUg5pU2H9gwAxdw3h
	 bb3EzMzDdfCyZV6NDhoyuHn24jar4zKmDvjRfC8yKnqIG6LKrB9HQFb+yA/wXAnM+6i9b
	 jlj9NU+yofeAcPrjB43xINQmJkIXcoIHpOi9NsREs2fLgdiuyf7LrB93vfkaRHTnnJ8q1
	 j9ZjrFrC33qsnTyZoTsDyv17pOQ/WXTNDVvVksVOgx5zrPudNSijKyjETqrJyUv5ihcv6
	 xYEGYjYBk571daxgTFFecON2AdRM6jhbRr8PtZEOYKKWE9+hjK++MTAzJj5YGiKjsog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
	b=fpiG7fWDHEYfWwyiEW5jwTxmaQ+p4M7gtbaODWhK5E34QYOCZE5+GzxUwGoYJPuYqa1D
	 hLd9bgAW9FdBawKYMSswykuXgmf79dIgtYsFjazz3Td2Az6/AF3CuMcujfLA3yIYTLdS+
	 /sGAAv5wGsRjPWB++ML9esbCo7aM3kxqtkPEDdUBc7bA7izPFlHWvSaBJG7o9sFocBtlZ
	 3D+eIIILDm2B2BuLZjbrU3YUobm23fYhDccn9mJhUgdFFJ6Sx+MgDXB6ghWJtPpmcu/K7
	 iOK2d4lAiVYLqb3t+K9cByDSZlpsBK4wsZNRKSuAgfKzKmsbARL0s6qp1GcsxbnRh6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hjE8gb/B";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRIa302H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F1606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B6F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjE8gb/B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRIa302H
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn8hY3122899
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=; b=hj
	E8gb/Buf1te2qD5qTJO1a2YL6QQfCZsKF4VOQYoPrfzziWccpC7DCMd7N9os00c3
	wcoVX8ULmhHOyswUm8tJgAx2MkIrIGhyCUsrEuFJC2A6icUPauFGzEUywLZzWnUI
	woNEmnj/Ugm8Iz/Uj2Z/VYP/Z9T3aWfbeGYOKPRYsBAeyF1Qo2PUX0DIW10IkYO/
	jC8MXE8OXgdpgoL701MqonhfcOA11m6u1ZeyA5P90Rnf/AMMsjLk2Qdh/V+uhKU9
	eovfZcTeBmKSLbTwCRhYCZS8FsXcRJdxZvyRbgxIuLyvmWycI4D+pLQvIcNXRth6
	vAEcYLnadSvAED05VNNg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkf08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:23:04 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-458326d2d9aso898476fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370183; cv=none;
        d=google.com; s=arc-20260327;
        b=elImsUW7jVio+PlcPrWZanXY2dCKBLxNEKjv7rtOwDghgAoOMs/kfY2TJDAlWVcXxx
         Ssu7jR0vPE1t+mNo+tjVzyO4J6ZDvcmOMTavzV5w3z/ei+9OGxFIls3LD0eDKUR8Jqj6
         7yWVz7EzQq9SowSjdomV1jwphkk7jfJAo76YGDZxWKEvzT7K7EL1/ZWBaa5fcSYA6F4d
         2UwieeGz/OT+vTieFtxoK/jTbidz+niyNPLl6wLiiYbrClwAriH0IrQ/h6ADZiDWJd2y
         RNBwadVDcKFz4KAFI7JSnHeH6lFqDZi1KRFUK7tZH9noEFpQg5FU3QSCQmcGBXfwgHzO
         1teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
        fh=bITV3e2b2/RGf7mgxG8JFRLvxuoFeLWDgeeJBmTWadc=;
        b=dmufqkAH2Z2LesQZua2AQMTXfn3AO+scQZxhyW9F9RUHBdys63rXLtxPdc1UZG+68i
         7Vg4jUXjk63N2Bpw89cBjAEp72iWkxf2KhGn/5Kk77XiJCn1eqlPowvZ0sC8P8TICh2t
         SvWtEgHrCX3eYQPKZpdKM5FiaSjSdnBEZTkSPVUrCeJAXa8qIgyMXQchSln8wwoE91WF
         mD0GXFXdPG58sz78MlhSWIBTMJN1Eba+zkl/SBcmdZUS89kaAoaPUCtPy2VhoFgi8UAV
         1PzHi/NfiOuJiEH/olWjmlW0EhyO+kdI2t6TIHrhABll/R9nsellpyVYkl6YRt5KcnzR
         uLZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370183; x=1793974983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
        b=aRIa302HyE08UfmCorZdeydGshGboJCBe3HestU0xBXoUmMRW8ytuwR16s73SMbQO8
         KYrGcvOSm+o4XGHErBye689yzGm/3THHVPGRLnAcNixV9SSofaD6Z2e+sbmuCgYagPZr
         1EAmch1+vTn2wBIftyC9Hmbd47HEoAo60Tw6aEjFQ63fOcFzRJZFvZfCiIGmmSl0z3ri
         HvZoJzySJMfDk/w1IeNKZaj22QCens7Sq6SY/wMsNb7DFpqvYtMEhWKn9+ctUpcfzc3X
         L21lYVm/H/l1U0thWiRK6u6G5rkV2SGtyWzwSOnc9shIoUVCkSLo62VVwOvjKeHlKMwj
         L/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370183; x=1793974983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
        b=aGvHDZrMk1IJRxXrmM0pL8BuGNxpg1f+VOztO/7nFSxnuer521L5A+QE6RquI8d46r
         PjGd6nAWeRPlfozY0QnQULvd7+YzJ7LoB0fs5AQobhxPomw9PIRAU+s/s9ucgL6XfmzT
         wAAv/tenqH0KSm84msxaEuuC/C+OeSB11f1K9wENKMJgNIEnSJlJSTI74LegXp0y5Dtd
         8V9hWRjKScmuuLbNMZkLSS9cvq5Kj6uh80CU8sQf6vYk0pD9Imf5ZMoS9SSJ+K4Xp3AG
         xo5ujGUjIwurkiQ6KszMRf4DVOFiFyavzFqMrLXslH0gxh+a3sIhv7fgjKWCWRrdhmwj
         aO9g==
X-Forwarded-Encrypted: i=1; AKwUvByZ7bP/UuDAES+G9hCIg3LLZ5WMFsRKYvYAqV1imhl5rz1dHf1YQMkTlRQZTDtvdidlKrJAdFN06t+4ByDp@vger.kernel.org
X-Gm-Message-State: AFq9FYIuElNd+MoqirKS/dZQV2oc5+JdLIMlCTQ5E82k/flsroOHExUp
	nFuY65C06FYiYmSzG7sskWzCNg6dy6ep0JNt9KKCgHBKoKmve1XnslhHSr/3HUI0S5GD9PGwbHp
	tdQLbk7R9TtUKKvee27N+E+NaeHaXU1/weASvWmOjBvIqt0dAGu6hDfbCbosNVJR/MqYXHK5t4r
	b0RPzM+yZiWRnp+/8/K12rBJYz1p7UvbFIotOevgPipY4=
X-Gm-Gg: AYBFou1CXPZH3j3YvvzzUPg8v0bDZbmzeFpDUjeo/npNNyKScFjxVo4Ni4DLW5IbxA1
	V6XSW4+2I0txgAFw/PkkhXgerSjGFV2nfzZ0QmQo5m2sJcGA5pM6YywFgLhh6KC9DwTsr0HRmT8
	sNHMd3jKuE5Jse2WPKr8K1fJktbH5aUh5EISplD0ZFRgmUlHvLCoLuDIXEWg==
X-Received: by 2002:a05:6870:702b:b0:4a8:1837:bc27 with SMTP id 586e51a60fabf-4a9072faaaemr1677697fac.3.1793370183359;
        Fri, 30 Oct 2026 07:23:03 -0700 (PDT)
X-Received: by 2002:a05:6870:702b:b0:4a8:1837:bc27 with SMTP id
 586e51a60fabf-4a9072faaaemr1677666fac.3.1793370182955; Fri, 30 Oct 2026
 07:23:02 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-8-robin.clark@oss.qualcomm.com> <0103e15d-42e0-4e8c-9f6e-ebd0b56bf3cf@oss.qualcomm.com>
In-Reply-To: <0103e15d-42e0-4e8c-9f6e-ebd0b56bf3cf@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 07:22:52 -0700
X-Gm-Features: AclHuK_L_2HBiXq59BCEL1wHfkKwJn-aIJQ8gMMWTwWyz_La_kw_FYR72xePUcE
Message-ID: <CACSVV01QNDTkri8WB4nwEHjOZA24x70LfKsqJa4sp9NmJp9_5A@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4a848 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=WwG0zxbtD6kTrJi3JyUA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: HM62Ql9bFUrbaF_JWcc93TdkVfc3adQO
X-Proofpoint-GUID: HM62Ql9bFUrbaF_JWcc93TdkVfc3adQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX52ctO2gtQp7z
 uPhiKgoyUAVblWZM4SK3psq9uAtdrsQAlXc30GCTJUmqvG82zdsX2reHUCLdGLMhLh8N+ItAKAu
 /uJi8PERvWFO/gPI0gVSC5OXRwhy0DBjMtzm6K/SyuZ8g8aWW4oCApi/WmXomcjeQXd+at7G235
 v8hfXaDMvf2bo4BOgElrvdrxqVUoQL85t5xDy02NNLMyHLw1dP3uK3UKJtsa7S4OGFOV7DbM3DG
 lypmz6BSbWcluRHeTWBPBMxIpoHqc65dMEyRHgLJpoLhgB4CGJnq2VxDFR/rPym7hwnKAnMn3fP
 wlX6E5yulRjjWlHvDMcVkFVe4o5ykEbDSd7pKEMwZqQTuOQjrElTmS4q+4BAVR2RJGTVDnnRvLf
 PECIECnUD5NIPzwrj5CNW5XxWlg6pvXPBIienw0akzPCsSmdv4wyXM5PSe3eez5bPHM29aIMn+f
 HSjeyVfyKgbzzaBblEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX7/RR75juv+TP
 JnyrIuhzPyqS+cFq40mO8qZuu9gHdG6FgV3HT90fmsR90+qK4MAKcJ+ciZzVwuS37uVH4moaBHR
 dR39ZN1/kJpw3ekxvXJOy6BPTvYefOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300057

On Fri, Oct 30, 2026 at 6:43=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 9:16 PM, Rob Clark wrote:
> > We can just simplify things and calculate the value, instead of manuall=
y
> > adding it to the nonctx list.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Should we drop the entry from nonctxt tables then?

Yeah, since I punted on using generated nonctx list for now, I'll drop them

BR,
-R
