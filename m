Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55A545DAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082146; cv=none; b=hc5ROHaaGqQW6C5EDozlXf2riDrVTtjKPRw8Fk1NXs+tf4gHD6utukGxrd5Z+Er8Qzo2z+WwF95IqEDl8PQuwWJtxP974xF7RowmTlj93E4voeWpgkyP0yorHVC8TnY/HMCcxbhgTVS+CR0SNLAyFKa5jNlxI+dHJghWCliYcRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082146; c=relaxed/simple;
	bh=LLUNgr+JTLVIsA7tRQ7tzGf4PiaoeK1+F2kHwWJ+SUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXkx8LZNRkOh5iIuL5Bwh7/DppAPKmzeo+C7lwKC8mJt0tsoFjhLFLKFr1uFIPX6lf5hyYl8BnS3OU6GnfRyRMBPeJeuTK+Jhc+9cCsLti2raVpP9ZQ3KATPv6Zwe/Z4MrztaQ8lRnvN781yen1kmssoK849jhv7+3bQReNHVL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq+N7rmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtejeQ8k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq+N7rmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtejeQ8k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP6iV3670878
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMPZw4XRMMmJIbHmlyrL3fJr
	7/HG4Z5DoMUR3Yhy7x8=; b=cq+N7rmMhHSRdt792B97zQ4tvO6DSCzyCokGEWgP
	0l7nkIikD8mjnvCxj0XfM+sExJ7pauZdmeyr5WuEzEgstdeVyM5IQYkK/9jAqLHy
	t2AgS6URL3HMRrhXZ2ojUbN+pSVIDMmTiRXcP9MdDucV8QlgaL7xGIMTKLCiXSng
	1j6BY1HkLDQFRe0E22et/Koh70oEHiOcgW1caZrJhgsQ6PTFXa1ohFHBnRtRox9i
	Pj9CKtXGkjuhWudQcS/NPYIm/ycI9VoJ4k9mbcgBVQPgKEX2xTRZyYFU60l6fBpv
	o5JmEsuAEwKiszx7RRbOQRqWqH5QhM612JzYXUaAfbg+Sw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8ena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:02:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c99f26dc74so2536782e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790082143; x=1790686943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMPZw4XRMMmJIbHmlyrL3fJr7/HG4Z5DoMUR3Yhy7x8=;
        b=GtejeQ8kE3dCYYARJMusCvB79QBEM60DP1rQL1R7EfDg2h5clA9cwe/06otT3/rTf/
         h/4PXORBmVP7o+xq/PgyVxX3ERRusJ4Yt2tky2Ub6TC14FAfVkIuaYkd7+NdVIlPARBj
         22e1Xujhgf8guz4RmhLt1pjOz6CQD7GL09dpPnNAxpJfySXpPGN0/255SNU0WaDwwcP9
         yYPoew9nPgwGoZw0Fq1ERE7a+yuEvCg4/SgAhOmVx8RLNSEND0H4ODh479sP1xYUkdR2
         y0DDn1I9LXSRqV752zYe/nifJtdeXDLT/dJ0w8JpTC2btmFDM62JefY/M8J8G+z+Vufq
         OXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082143; x=1790686943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMPZw4XRMMmJIbHmlyrL3fJr7/HG4Z5DoMUR3Yhy7x8=;
        b=N9fbRpeU81/Y0WdFPdrGPd32huMdEHGrL2/mh1CV9NMCFbznpAQomTWIYcG+6A9Dln
         2bRGWFxjIefQowqXU2QWm7mqotVsmaMhljYikFXRKr0yGzjv6v63nf1FVscJ8CwdM303
         PpJW6DOJ7a5criK8ro2/FtKOpsPb3zYb7PpWGE/NkJs2e4Xa0WQfmTxNXX6YKpBJUvBk
         dqxrLhMiVaj2PafRJXPfYJs4J7mMsCQQDEgyDedSHWdcF/ivcziGGIKA3pviOHkzjZW1
         RRtADZPRAkwVYgqnx/hURVr46Zth/bs0C4qc2mL8Q5vW7qVwPmTK7vKnWTFcPixcqe/U
         s4GA==
X-Forwarded-Encrypted: i=1; AKwUvBzwxh1WofY2y299C4eyBGxy9ZYjtWxFz6mi4+fBpfIJhcw40RD6tcdK8xvceVZ8lp3dtCp1IUNHvsB5Xl8T@vger.kernel.org
X-Gm-Message-State: AFuF++kHPRkoQrdFuMLrhxG4H4d+Qg6GaG9kVU0xG6FwvwxYDkfdbFa6
	52zNnr/RopS+O+HoBLcQXajGYJ8nDwLdTAa2fWXozXVRdpmL0D4zKUhSZ4DYcvhNz4FQT8fts10
	LEAYvalHEXscpiXAyfxY1Yq/UGuz65hQqFlQSMme/96LqQ7eDwxbuHhnQ/ZVnyQHZ0RTn
X-Gm-Gg: AYBFou3CxNcHmEn88KsjoHH8nQrpwlY1lLLSZtfSJsMTDJ/4q73AaAzoPF7+1aAo7xe
	hNgoJlnKXaPM3hymL+mUKnjeZDjzGC2eyo6lp8RIdxzAPpWCH+G0lTj1CCDxGSfT2Vfs9SaAbtC
	7okBxOp3Xn+R9ZFPjMYP7/aoM6O54gt2EsFE7y2GlxBlkS31CCTFceEJK+a49ATSAgmENJtEKbZ
	BWNK2i/noiZaDfqcFDKR4j+TTPsSPp8teIfIbXCy2Hc9xLzvb0x1Xp6Gm/LsA1RRO59cT7hwsPm
	OffgvjarCDCCvzLDRihql+tnzHpDh/C+3lF8HYM+GmlOUNVfpHOfvLizomgRTLHGDy5UY0VQfI1
	QnKqilECCDElGE8fzqyhc7rHVDm3Pmx9P13DqbeYHubGHsIXC6z0QCO/eyBRuTBP1hMlEfZERSR
	OUVWPphOYx1yH0
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr5853085e0c.19.1790082142760;
        Tue, 22 Sep 2026 06:02:22 -0700 (PDT)
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr5852752e0c.19.1790082138994;
        Tue, 22 Sep 2026 06:02:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d670fsm479365e87.40.2026.09.22.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:02:17 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/9] media: iris: Add power sequence for glymur
Message-ID: <f5ynb3fixzn2fy4f4cjvalw7n2jbbrejd63t4p4455gktwa6yx@erkmcd6x7vu6>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-4-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-4-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SS50cbSmVNR_j-2D5fOt45bcPvBNRqnY
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27c60 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7ng__jp-IBtt9HV_xosA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX4SgD3bSllWlY
 L5ycKmpaauRuZkZ4E9fl8pMTvcLfVF5ctzImcHTDFzilMZE7B65X2a0PBgU9fQNZALZpEwN8yi6
 44YgWFq0So+opUw0ZUzqsomXMIUzK6r8Jw7KFkezH6fCyvQ9cSUA+5Iyl1m/z2nPL+/fAaOf6pR
 yGNOQ8IV0HV6RY/1EYmMdovHrE9SdA50O/lfbNhVuTNZ0KN5TeOuU61GF3Igi2YoVE8YSJkUhDw
 tOXVlB0OJWeP73iGfxGevkYWep72O9rA5bomhwT1QFHLX9ZpTfFxN4WL5kKA6T5oWyv5Q8npETL
 U4ij6MWIAtk0n4TqZ9iHeEPJFTJdjz9/qWzBYI4F9zIffUT9ParZlAprcQl7OAG3LLB4DhuMhmM
 +I2GXnApI3A3GAo/ts655msitkR1PMtF1yMTOMA4n4XZoI/+avLFvAKfhdvFkk4lo0WvNnJ6H3E
 eMfG8dPrUE4Sad/xnbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX96HnSOgC02F7
 a0hA3SYfXuT39c1L4RQVkUfukBtyBB42NTURnl2Bf8jVMk+SXnRTHKUcIMIoKU/gEzFdBDxhHzr
 Xh3UjWbPRyemYMEp36EJnbNEL2rJGAE=
X-Proofpoint-GUID: SS50cbSmVNR_j-2D5fOt45bcPvBNRqnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:23AM +0530, Vishnu Reddy wrote:
> Glymur platform has two video codec cores: vcodec0 and vcodec1.
> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
> same power rails. The clock dividers between the source and the branch
> clocks are fixed. So when both cores are running, the source clock always
> runs at the highest frequency requested by either core.
> Since both cores share the same power rails, the power corner cannot be
> voted independently. Scaling one core's power corner up or down would
> directly affect the other, leading to under or over-voting.
> For these reasons, both cores should voted the clock and power rail must
> be based on the workload of both cores.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 127 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  12 ++
>  3 files changed, 135 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
