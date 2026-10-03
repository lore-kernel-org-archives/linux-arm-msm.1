Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF4830E0D5
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988444; cv=none; b=pScun/tcKdXqacWJVVPC3UDkgLLUdhSBkBTP3gF/BnBPUzUSoR2uejapE+w9shAsQd1Jn2iqZ12Lr3yGcEs2jc4GlLZzZIPywNNn89iCDk2m4L+U4lI+g/kGf95ta+zZG7YNyKjwlaQk1Bk4wdXXAW8n9a3r7NXpkfjnS0Uiagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988444; c=relaxed/simple;
	bh=0o0ms8dJbOwJRaKWLVU8vQyHuX837gIUUcVr38XClQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zp7dvjlXHHqn+T9Zu7Bomu1cF17HhqVDaC31U4pjJSyaMnn6DvdSwgKsikxGbceU9gPLAgBjPdiiAQoGgKCYse1j+N/DbFDOjyX2zhQPEM38n70WSMw4z5puHHHDQRZp/GbDrnEBbVcF3IXb/5+eop8uyKIX2M2bJf7H49NlbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrauKjbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzqISB/4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrauKjbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzqISB/4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6930gdiI4011623
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNKPeOeJtdaJwaskI61OzrmziGwa6U3Z+vrqhZPHVsU=; b=VrauKjbTTwYXqkVD
	TsdUCpjaYl08YKzc+LMrbrTusxasGKlMI8KZEjsZEMGW6hef6LdA+Gh5jdKQyh1N
	ILTbVCUZaHlFqJoz7BISXOIkRM4crqQoXc2otqT5r3LEGss1jmAn5zX9sNwUjp77
	Q4kxSQdoyMN59H4FrwGMsIZFjvH0LcgMvGFCBfjyDuzERSdsh/T5z5bis/Cf60Am
	ilyfbaczWYfgAxmLW+Ediub9EQ8nsKFBacLoQBNgtUxykw27gV0EQ5g0K4Pxg/Mg
	LM8GdioevVYJIFJXWZV2veIVcwQt9xOb/X3yGuySmIQ3SVkwRHnKT85YCZafrlue
	gS82Gg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2qdf807y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:47:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91064f6e75bso11135316d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988421; x=1791593221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNKPeOeJtdaJwaskI61OzrmziGwa6U3Z+vrqhZPHVsU=;
        b=dzqISB/4xNIp+BwJengjOd4On3pjUJCuduimeBbNAR/RBrbyVxDeDJ5BRhv5t49+12
         l7/YUfzPyVl80fhgnrsRS25aydFVvpxzr//JIpMA8ikVTqvOE2x7Ol1JlJl+aliIGjHH
         usUOYW0P0G9fSpuKge+DOS7NGO+46yqrKEfpZuXbKehu5g4tg5QgnmPeEhsF6YsVc2hZ
         fZuFFJr4rgV3IGD9e/LS+OB1QRf90txodGSd5krY74uLYOdYy27KSqCqQIrJYxgX3+Dg
         w6Et1vzCw0ZHUo8+/qSwBPWI8kSItqIJsZBxaod01kWXPu0WPp6TJtbrITuNENz04jGd
         sVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988421; x=1791593221;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNKPeOeJtdaJwaskI61OzrmziGwa6U3Z+vrqhZPHVsU=;
        b=FGIg+5rmJD1GkfvtVs/OYBuQsUPhqrUQhrPec0nVfUvUy1U1S7Pc5IgIRN+023odkp
         +oAdg4Yv2dWlfxBTKVW0/E6BShZk1gkRUk7IUNwE3velHmpI8oraEdsOkE+Jk4aJGVE2
         iFCw+5X9SjtkzU82HR/S0LXZeFD0/CLrpykK1/N99uCpAWLJ2gXhssyTXXII5c689DEX
         eyh/wNvVnVNlP5MGDLNx3Op75/dXNAIi5xzISiqOxRUje9lGlm+rRzwLRMPzFThPEzvg
         TxZTeC3cRf8QQPg3wlSbx9ynFZhJStByY4Ahbq3tA8LT4/+Ciikjxvoz1VCTyYM0SDnM
         G3Jw==
X-Forwarded-Encrypted: i=1; AKwUvByYc0T5qZdPiX1eodEr/qvsac61h1iBVlQoqw132Gs986VSI4ifwoRKPp9Z2k6k1L/bTTbg1R0f8uapk4Ex@vger.kernel.org
X-Gm-Message-State: AFuF++nJRd0Z1/HPnLd+rL23cBWdm/z3bcS4G6Y8on17U10tGa9Jlnzh
	mzNRAHP06tl44mmObC78bT5tcbWACR4XyMW4XNRjC1Wqs7qrbODw4WK4WnKb3E1d+AGt3LTRGsQ
	vQmNIe0T8Bwslpao0xJoR7/mW+SRubITp6mfN3rOHzCkOIhKJyAhkvP0dz7bLsR9ARerT
X-Gm-Gg: AYBFou3DfQAc5drCzQb0kEvtLYFsEz2cjTqjEdTWFrO1ik2VdwBVXIxgI3jMIkHNXra
	tq3gPpNLcNSTtXIF92D3/bV1cZkGQLBHW5Y9hwPVSrBC6JQSwhXO6nQiyBimthYhsVWKxVvcBgc
	BLZo95nmOtiAnn4k30t5DEn1mQzrKH8c65zHGTygtYfSq1UVKt3JYCr0hR1eEKCmyBxNpxDlNiJ
	IpcDESkthEcWfztcnjqD4T6i7enykFtZXn4YwW28i5gBIY1m34gyvC6K6w9o9CgJGDK+IqfbvIg
	X3W0Ezrm/dqxjgRIBaZwVZpmvq/l9D1hieJmbNp/KCVWesTDf2dLApYRmi0MiEniO/1NfvEPihv
	Qv5/KBuDYldgVMrWRse9G46hgTmr6prm1JC5nYdtNUZGeUe2qCl/dg9blcqSYdpcnqWRP+SwGOT
	Vlv4xaPoOqWpKp
X-Received: by 2002:a05:620a:4397:b0:93e:516e:a8d2 with SMTP id af79cd13be357-93e516ec2f0mr203569285a.4.1790988420912;
        Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4397:b0:93e:516e:a8d2 with SMTP id af79cd13be357-93e516ec2f0mr203566685a.4.1790988420385;
        Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
Date: Sat,  3 Oct 2026 03:46:53 +0300
Message-ID: <179098834067.3641559.16830029168243411653.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
References: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXxXhk/URZMlt8
 QthAJ188Bz9vtQbX4DmAWsOj/VJy18WtJ0EiX3odgoJg53BgWp6uvq1n9NyJyNV9oJE0m/g4bNx
 M736PISSWkeJ+V76V4ulnW8KK3VABjw=
X-Authority-Analysis: v=2.4 cv=LfapeTfi c=1 sm=1 tr=0 ts=6ac05085 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=9kEJn9js-EPfIvdKjyYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX6yA2gvUaPwYl
 gH0F7k+xbvXYJOUkuYEvhT9L4ULn4QHW5ZECr4Jy5WILL3cwssKbxx0n37CPf/zQEVY4ci7pKJj
 hQ4YQsS9Pi6mwYkgef/w3GaHxjVI5Xrb4CpdqAuesUGcCw4c0gTl8IKfCJwsgwwW8UODIpTdli8
 ArGtfYG09yTFzTk2WfoMGgFMs4/iiaXTTP8RxR6I1bKFUlekI9VNpJpyl3N9+Erk1hwfxOCu1s2
 UKUTUxudEPTG8V80XLZ8mrcE1uaT9sxuxmbDvF6rc6c0w89JlXPRCVIyb6KbADybqsaoPIxFXMO
 nMXLUMDC0p/ec+36Cf7MMPnedDR2+vCIuDoaDkp3i5NSgrmbbYB7+QVKLajzqGrYBzxJZ7UtaJE
 BPswCfhx7adfDzCtervtac4Cdd1wcq/JBSaAbgD/TlDJNofJZAp9GaSMxDXj8DTBeeBrz5WeYPz
 7GdAG4Of0T+p7RN9zUA==
X-Proofpoint-ORIG-GUID: 0gI-72XskagTAa2KBh5QkfyD62IQpWQQ
X-Proofpoint-GUID: 0gI-72XskagTAa2KBh5QkfyD62IQpWQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030001

On Wed, 30 Sep 2026 08:26:43 -0700, Rob Clark wrote:
> Add missing GC block.  Fixes GAMMA LUT on glymur/knp/etc.

Applied to ttt, thanks!

[1/1] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3389406e6a03

Best regards,
-- 
With best wishes
Dmitry


