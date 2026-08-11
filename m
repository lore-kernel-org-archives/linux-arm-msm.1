Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B10E42BE8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442763; cv=none; b=ruYZHnMlF2rH6928OQA5Sn7bfMKZgBsLIHIseHJ9C8Qa1R0rNJeRyThMSGIw8Wy99mn3Q3cttHdd7oZ1AA6OtK804ucA7Me+9LLcp2Dgbw0iDAQnU9ufg7uAfYJwA9MSTHmNTWvADUpl8QQbLcUuTxKkFnDsO7FfEFIieAnlqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442763; c=relaxed/simple;
	bh=ktTEmT+5ZCdLLAguqDaOlMD7mybeku6MgyCkoYJJyok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfIXwsOlnch/A1dGK1d6r76vi7jgZaAVF9lxOQARXrST8C2GPX8K9xZ/pV6IksSHUfyS1b7S9d1bJ74rHfJXq1TGJ/6Vc39pKnuOCiOuZ1biPvkh7+a9UNfD2BrGCVPhC23TnmwONy9ps7fWGYEusvNBLj9qIjqWJakFOIqdzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTwhXW5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Set54aE8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTwhXW5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Set54aE8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B71HsI3309896
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TmOTgYPPkpFvJTXXFDm8eL3k
	XTyQIN+hUBgXJOO/hpw=; b=jTwhXW5Htavxdkrur1UbGJFeLmRPAm+n0+efFX/6
	zonYQrjLEe/cfTIbQD9HkX8EUZpV61QAyLbK0okYSQv3Xw8zzXqWUBUjEz+GzBDC
	tGyM7vsyGBmTj9/w9+ZtshGL/8Ceim3kSifNla7AKtu5HBAaX2n47eEXnFtoi+xg
	o5oosIOFE+Js1sZ+gVZjW35ILkgew+ALp0U5tlvHP9qw8wvxn5sEKrrwiJU+bIlO
	xy46EcpZ/fSAuzZLVBpECh0Q8GnqsCRkx7RkdvCgnGaeWexQttFWmUtc7ORsVl6g
	/QxpNMMtU8z/hUJoxJhylIMj3OTkIcWz/FAEqt2c0oCaVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfugfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:05:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904ee4473a8so5834306d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786442756; x=1787047556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmOTgYPPkpFvJTXXFDm8eL3kXTyQIN+hUBgXJOO/hpw=;
        b=Set54aE8qXJNSUxiW1IG8KU2cy85lFX3XJ30TOl8dpFbBWt4D3v1qkFf1NYfaheKWH
         ghBzEZmT5dp+g+CSgYdkJ6bDZPdSHciB0KMcX1IK1YmlnGCkO2kLdAFW6YgKCGsDsgRf
         pOu7/P4j4q9TNU1SSMcXg+sM0RFv0oqN7r1mx7KUXEq1ui7v2qcFNq0y1jXvnQqfCiO8
         38D1N2mOW4LCHiwLYSUxsZx93SUVsp2b1zEMSWEHyhh+d0wwsEpV/LCJeVYtVV0jBIk7
         TA/fYbMam0Yu1UKVxSj0yMNPKNNVB0gMIppxcYkZ59wVNrVt3ewM8PWLUf/44btZ7nDQ
         pJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442756; x=1787047556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmOTgYPPkpFvJTXXFDm8eL3kXTyQIN+hUBgXJOO/hpw=;
        b=Ts7tZj+SYTG/8lr0euWHzC780SoL/8G03nLTk1CL2K8mLcpT132AuvdkJji0X1HXMe
         kRzNT7Ni6F9YOshIFwYv48+2vcK0gZQBg9qFTVB/s4l0fC1R0ce1hYozVr3vMBtALfjr
         VZdc2FnFt+tAZAiHIO1NBXRmBvZ/2xplJvr5i6lkQuF7ypSsqQ836AV+/pab8/7CPncA
         xruvRDJR7l84unfuPV9Iqg48nkcM3Qhdp19l1pQlpF5Js3HYUGK4JFKUIIwZOTlgpjtT
         W1euDVEJmtS+tju4NihfFsuUW/DN071bfRwWuHRUMt8cpWrktsD95KNA2VSirIazb6qJ
         4hlw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg86GRv3obb1fjDb4HrB4Zj5FblJQ+NDq3lb0VamEh8It2fjaFy3pWnFeyP2+qf81deSFc9633ED1OWEPO@vger.kernel.org
X-Gm-Message-State: AOJu0YwYE2ABvR2GZ9iVS3CEtzUD1+6B8KtcgXCmpKOzPgP3Wa5YdsN3
	DI4uVopaomD5aZlXysriiObmh++SOz9VB136NfICYC9DXXLJmVXVj25CixQxvAv8062hl+42mMz
	7DX2QtfDvKNFjHw7VPSlRXADdmZRCMJ3iNC0YSvEfBIdJoKR3LsgNNEEm/k9aKJs75eF5
X-Gm-Gg: AR+sD139i1SaVJgm20Fy14zkKhHFJADSM7sXqCUTyoC4s7PScKazA2OGdQSZc3kA0Y/
	puDydpzug3Xo1U8//NSvvN7AD8wA4drTC+g80tME0v8Cyj+2jRME15CFAx21PNOS8a5t7y47xp9
	zKMJLpuQfvrubdM/tjs7wMBQBqIX7YCtD2L98WwzIgTjq4JpXzb/o/3eXs+Yju56cMmkD2UbPdD
	spU32E9cnAmUn6CWnXiL6djHREdXhFMqVUfefBDPmL4JmgmlUbJ55iUIYY/f2p7TRUb/SDtq+3x
	4q+i+QvpECWksx9q6mRSEiu2mKlkmF5WnrCxcCsEykMlPvhcPCvzwhls9JMVvRoCA5l2xulZFlU
	uVkh7O5VxxoZNaSB6QVkhVbTA1ps0PfhVQkS2E6J8s80T0hds66AH8hAxMZ/PAi0JxoWFCAIqHx
	sBcCpbOQAGBtfv+A==
X-Received: by 2002:a05:6214:21c4:b0:908:92e3:a37 with SMTP id 6a1803df08f44-90a66d85163mr16959196d6.32.1786442755808;
        Tue, 11 Aug 2026 03:05:55 -0700 (PDT)
X-Received: by 2002:a05:6214:21c4:b0:908:92e3:a37 with SMTP id 6a1803df08f44-90a66d85163mr16958766d6.32.1786442755419;
        Tue, 11 Aug 2026 03:05:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486cadb8sm195738e87.27.2026.08.11.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:05:53 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:05:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc: Update the SCT table for IPQ5424
Message-ID: <ep2lw7kqnwnqlrujhq4umi5h7aqcn5sqp5hkjpfbwgouuvnvlq@2h3opyv6kkst>
References: <20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com>
 <q5b6lkfejj6ejqhl7ta7xtmwk4qetnelyxuy6li62vccko27gc@ys5wru2sja2u>
 <c4a85f53-e84f-451e-93fb-e53335e02d17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a85f53-e84f-451e-93fb-e53335e02d17@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pSE-vAa2bEWJHVOLiCiznhrW8C7HrSxm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX46Licx7DAt4S
 TwKkm5NqsqGFgB99OvMu5XQjrJ6NJ4m5wwCUpDnz7pTpIauub/nYid49cjuE6ArAviPri9WNDVI
 ryLIKV4VsjwL6C0svGIW+Xg/d1Wdmq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfXx7kpk7JedCMp
 BwVCIYMBdOA5nH06onq3wso6JLUjT3a4xRq9C3qSJs2nvzEZ789BLU+7hucdHMGOGSjNEAe9RM1
 7mpKjti+CKD7USkKuxBGe0cFjDG2zHaQaYyjO76z8jVGGQmf86HnlfI/0JlzGkJtXls2bqTjuUw
 yPd9pUptBEg7+SQjF4EJKDn8QmsUWdyXttpV8GjNf2rYzZoY+9JTp6dQqoI9QCt6DunJ02Y5Btj
 kRQfIyqRg+OP6SrcJz5Ol3Q3afxpFcdpA84i5tUvRO5X1S6kldQZdhrni7tCH3/Ioz5r+Yu+Xfq
 ZofKRZFIz2qyaPHVJVlbzZ7lZrhIPKbi7n8cLeZZFfJZLLrcptQSI1MbgoG0U1kh3p2pXGWhujV
 r/rURfRvKmOXstOfzUUaKxpYxtP5hoChDmZxh0uyIOUMu/ipp8gDm2WW+8PX/hdeBirOHJxJh6h
 Xk49nWzm884qobJIx2w==
X-Proofpoint-GUID: pSE-vAa2bEWJHVOLiCiznhrW8C7HrSxm
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7af404 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LPPLA72WD4_Lvj4Ln-YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110083

On Fri, Aug 07, 2026 at 05:14:08PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 8/7/2026 2:35 PM, Dmitry Baryshkov wrote:
> > On Fri, Aug 07, 2026 at 02:08:16PM +0530, Kathiravan Thirumoorthy wrote:
> > > Update the IPQ5424 LLCC slice configuration table to match the intended
> > > cache consumers on the SoC.
> > > 
> > > Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
> > > slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
> > > 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
> > > and way masks for these consumers.
> > > 
> > > Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
> > > LLCC_VIDSC0 do not describe the actual users of those slices.
> > All of this: why? Your tool has provided a summary of the changes, which
> > is useless.
> 
> Having the dedicated slice configuration for each of these use cases helps
> to improve the networking throughput by more than 1 Gbps.
> 
> Let me amend the commit message with the above information. Please let me
> know if that helps.

Yes, that's the typical recommendation: describe the reason for a
change.

> 
> > 
> > > Assisted-by: LLM
> > Which one?
> 
> As per the updated guideline [1], this is what expected.
> 
> [1] 816d9992d9ed ("coding-assistants: simplify attribution")

Ah, missed it. Thanks for the pointer!

> > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > ---
> > >   drivers/soc/qcom/llcc-qcom.c       | 56 ++++++++++++++++++++++++++++++++------
> > >   include/linux/soc/qcom/llcc-qcom.h |  4 +++
> > >   2 files changed, 52 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry
