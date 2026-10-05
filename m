Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB2371CE3
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184254; cv=none; b=FbqILL5rGgKCuIFFbb6X+SrgVEyls8HkJG0UueF6aWnI2F+C5fpgN7XxgotTJjbRcoBz1D46czlAkq8Ru6iWVeOBOiCt6r6Aa3IehOQP5Whwnvfhv6Wcz+w7+MyREy2SElqhnLPLPW2w3WNcyNY4sodC26Uyyw8hXTgPpEmwxE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184254; c=relaxed/simple;
	bh=TiU/JSZ74eOQTRk4e0IYylKZJ1OTH4hTNjksDkFeTus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAIva9T0G5yigNxUEgEavIaYsOxbqSZs61btoReRlg7mCkMy02jCYoJ0NFkblBN9PGs5Lqt4WPQUJfLeaVvbGzpuG6gWr9jtSZQ9d+Is/l1bconWt2sQX805oy7y0vPro8w9S/A1lRK8v3desFmmOWPXylRA+m5YmDWT/puOE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXM92+rV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjwJWYyZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXM92+rV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjwJWYyZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695108NB3242506
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ekJ+QIxDug/CGTDDlwa0cFis
	QBqM4wqLUQXr7Sny7hU=; b=GXM92+rVr+xbTJsPJVmdbrxsMaB5DO9CRTxmE9Z4
	NtjKy1lJs1Hqw9ykMa8PlP6IbpkdRBTn2lUvRA0WhKmmXjI4yosnVRfpS6VnnOPD
	KpW7It1TU9lntq9d67h23PrYNveoFxl0uVStM8Qng4j9vSiuCmzCi2hw1TYE6SJH
	pac3WmJzXDampdSRB9LsHUa6iE8oycK7RO2UTvon9tvmIDadb0x52MjqAo4Zoakb
	LrXWYpfdIiQO5K2DvHVNBg7ayN13bGA8KBCefkaC4gI10jOHI70/yxUyHEJWV714
	x2lxAywn2gupmfAKeoUOt1AT2WMq59n0jlcAeVt4PYzwyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvevpu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:10:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so225761985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184250; x=1791789050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekJ+QIxDug/CGTDDlwa0cFisQBqM4wqLUQXr7Sny7hU=;
        b=RjwJWYyZhiA59brDkIh9H8vllP+cjJWadeQkD/D8eQOM1DCEBRR1eS+V2QUc7rVC/T
         4lqXrWw1EE1iWZGBwFCRLhHBBIf/VnA+FBHJDBBVoWCA+y/8EIZ/K60WeTOUsV6qgMh2
         oNNNPlOdSSHaSHdLtRuU1c1Wq0ZUY2+DVM4W+uslCZzLd4zAaMAH+mkiRhweKcvQ1k93
         r8hgW3jGyrzi3Wc15dcmFRRJAFvHsCM0DzMjTk2Bw5gLG9068mb08ZsXQL0mGpR0Mm5P
         BvUKxXcWhOS2WLWSQox8rVQaQgYP02iHMZ6WketEG+8o/eMK3wrLiy3LLQ6/WSi2IOTu
         QT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184250; x=1791789050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekJ+QIxDug/CGTDDlwa0cFisQBqM4wqLUQXr7Sny7hU=;
        b=pgocJj8XVu8vBrSPwPwY4jkWQjhLWQvUG8zWbGDWv1A0Pu0hF8xtoC9NeI8PelTWvt
         teYsJXc+g/l/Dn9TSqausUTimrWA3+fM4YaSuJuKeXCNcieXuNvSCPJB2j4KfEjU18DX
         lA1XVNQeGyLso1/sJNNL0n1yGhdz97nwtS/rJUJNusYXpGpnA+6PRLPYJ/HFW5fVYphX
         G9jIG/olW4hrUGlOdlQEjPo2HmHtPHHPt39IAesBFQp/FItRIPrmJmPU1S4lGDFyXEL0
         v7erd7IHNushDYBWJpBGU8vp9TrI2uJDFwL9bz5U/GJixztrC6NdkiHcSSEGCc5a08Ya
         pS/g==
X-Forwarded-Encrypted: i=1; AKwUvBwpDBGjSilHIq297qvKPOTl5AjzkHYjZQ3o1pA+mVAt3sPdeMgHIe4hKIf1bEk1FvxnqktJoopMk8dGCj6G@vger.kernel.org
X-Gm-Message-State: AFuF++laqVrgjuN67Piil6UJjKgnRhfLWuNvhZ1bFaK8Crr+y0DYfLFo
	ToGRIPGYu/kikj7m353yWEjPZzt3xL8mLNuSBp3qRh3ntPnWcicmWYCn9drRtj5epQK6nwDcvQV
	MLNahGURCJAHG2jtI9ssm8ZlI7kBqOdn+gpodMSOW5c7uxusKbgT2cl8IqUB/ueoBHZLZ
X-Gm-Gg: AYBFou20ax/Im3Wi9smNpBzsn28AHA92P4tBF0Hu7zn8D7gohKPPjXLBsaqa/qJWlA/
	6uiMDzF35cqfS7s2SRq5DRYtL5Si4mmu7LFqkGeOcj344afPcT4ZTRrB1hiFgzhQ/zt1WFDincU
	sSTyd2ld5PLAiep9oXbFvMthtUyXjA5u/3/aAaesnxMu8cO7FhG2Af9nMXj4wGm2BKtBwryVfH3
	yxpBZigd4JwUAX9lbtj6g+sqowbDWn0vy2iNlG9pHlFsxtkV1Thtb/uwbrq07SagSv9KAv67ehS
	fsNnqjngVoP6y+BfPpd6AKuypiZg+RdjD4NIKCIti4hyGKyLJSgrpNuIJ1JoJnLdXNL8+qd+94c
	BHRW9OR7zBCenNUq68dD0gxmTZgGmmV2gJ/b6kXg/vIpIeVGbtDpItTvcYzXBw39OKXTJFR8fyH
	TixLR45+bqqcmX
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr1821042885a.0.1791184250510;
        Mon, 05 Oct 2026 00:10:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr1821039985a.0.1791184250067;
        Mon, 05 Oct 2026 00:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcbd7a9e5fsm1036221e87.80.2026.10.05.00.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:48 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:10:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4
 bytes for read request
Message-ID: <ltg543gynh5obljyqbtnpn3mnbdpmrazttblzpuvugoshqcdrw@dxksbmbtnyyi>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
 <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: d_NLjx4NX5V5uwM5hFzH8ChVM8luQSrM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX8FnVXwbv/hbc
 /FXn0nbTX9QFvmhEHh8E7vr7sRbQ9+3xhw11KZBdZViP7BjP+YyTb7smHFgywVwwp+gljt1ZjWo
 66U79isJIqL4i+AGl4CeWTsiowPAcZ4=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac34d7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VaJONqEZ7KOUvF9uvHMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX6ydXG7NJrK+e
 V4gYhI9bigS4knWOoPd3y5m7xM6sa/Yv9szr3Cz5muV0SoTynbr9xurJkRAc9s8PJqjV98EX1ro
 +ziUV7r3sR4O6PIB8BH5ej35AJRZXyS1qJbamxoDDaF4JizN25OvVPcGAQlH8yB/qvxoQjaWbXY
 CneHjJ3p7JzhOVNvBehxv6tInREsfl3+C+V+ay7c/fjB2aOEPPUQeK1R03ATCOPESQYo1kuN9AA
 SzPn8gLkxp2OzF2AvT2sANtvvH3hGD1pGTTKb1hN+GPUqOzbdOmDJcheCmOwnsEHyquEXcmMYP5
 exJPWeGLtGAR2ciicikJc33bXAvDCZ8omcdsycAZbHAQuTdC+QMUqrC1lhDynX4rrs4XylILOTO
 zpss0Q9zkA4lNiyppAoFHX0SQZTSzRocJ0AbdeF6LpVgEPoKUC0Adpr66u9dAGhJoGtYkSgeo20
 8uQJ/3S5GL5wqShS2Pg==
X-Proofpoint-GUID: d_NLjx4NX5V5uwM5hFzH8ChVM8luQSrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:30:21PM +0530, Mukesh Ojha wrote:
> On Fri, Sep 11, 2026 at 02:38:13PM +0530, Maulik Shah wrote:
> > Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> > request instead of default 8 byte on older SoCs. The write request
> > continues to be 8 bytes.
> > 
> > The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> > GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> > length.
> > 
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> I know LPC is going to start today, but I wanted to highlight this patch
> specifically, as without it, both Hawi and Maili SoC do not boot up at all.
> 
> Can this be picked up as an independent patch for 7.4 as conveyed in the
> cover letter?

You've sent two patches in the same series. Typically maintainers prefer
to pick all or nothing. Also, Fixes should come before the actual
changes.

-- 
With best wishes
Dmitry
