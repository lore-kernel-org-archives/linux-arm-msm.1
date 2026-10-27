Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099748;
	b=AKqYXmgwjivvumxrAgNBrcmbH4VQTHF9hMtPu0q2Mrs7I6mvm2sb4fNeOlR2478h+LCk
	 P/wYOQzBxYxtDtS9jutqaoSRje6CcZ/uV/bfZ3rLgl/FcyDb8HPjztYm+56kWP6HbbahR
	 zC7P8eHLXg2SB/NFtrS2R5JEaLapAMOpGVtZAuBP5TlmYwQrqpLoFRtGZOqfZ34eI5A9k
	 8km8sgDfiwEGUIk5Ru7tWlhq73wyt3IlX2iMC1zCtwORcGqSsvefQceUCHUo6EAFRFTm6
	 YVUm55b6eJbdAYDlrqSFUKrItLFDx7tQSV9AV4XCG2yAK0Ki8NgTkxkeziXmI2UqlDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=clFZbp6yNCB/YE/B1ve7L1IoY6Bcs0zpZMjkhGO28Kc=;
	b=TnrAZxnLZslck24Cale0ryiRuiCBTBQBoqYHa7D57q4iuTLdKdZA4vT4Ve3SasDpw14D
	 /WLVR2yEP5W2bh2UjVp8IsAw1LtT+ur7t40jioE6F7ZA2NruB5C4VbwaLb+FncZdl5flX
	 HOuGGchUKCb2XYLQUhjwVUWvquqWnsXSsNqAY2m7a+1IXexSps2hMQqZNrI5Wm8V844g6
	 mSIxej6iZps+tq/dVR//wRyhGMqwAH1gi5vcZb/RFoScLv3XmYBf3FBGfbmAiJhuvw2Ke
	 7Q61L8y77N4F7Oo2YfRZJA6vJCM+C4BhOBj83r1QFQ2aahzCj0DX6sMnDYtaK2JPKRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nYElmgpm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qq22AZIQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F321606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F321606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nYElmgpm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qq22AZIQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCcO3012104
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=clFZbp6yNCB/YE/B1ve7L1Io
	Y6Bcs0zpZMjkhGO28Kc=; b=nYElmgpmdzTiT/98uSp7vg3/UTN89eAvFjrP2ULr
	r/ddRaT9EB2Xzc1S8YxCdrFScOifda03FyieisurvtoyactKVdG3NtwLZeIIskjK
	Vsf2MgJRWuhc9Om7fF60wtLQX2ShpdrEn6j/wB3visIThtxRFRasojWOwxBKOsyA
	PBnyjkctfLOt+Twzz7PjIaYn7e2AOdHXWuuab27wPtsQRSWyTrb/2Th3Kie2nDNi
	EYZxXK7wyWtNabwMOsDHjNL6bJn6PcJKnSVhKsc09K5UDxq90f+/cFZVeM87wSjV
	neM6EFOVnaYB8kC2RpFHEEEnULTo2r1kEt6P7TZW5AC3FA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3daqqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:15:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8c60c550so104019866d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099746; x=1793704546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clFZbp6yNCB/YE/B1ve7L1IoY6Bcs0zpZMjkhGO28Kc=;
        b=Qq22AZIQWuVczKdso6Xx5m5AUhM4oDJq7JN6dkX3DyP6cJo8+xCFeleWz7PYPZNFPo
         0cPDZ9e0KSNBK2WVKHjAN1nTOaegWJBZDutFA5sgtEMIWlWk7FvnSW5I2cTzAt46KG8W
         SciRwMopqL3Rey3UKsCpZ/tldJ2z3FqqqFJNuyowkUOGi2u+FVrYGrlOUXG51e7lS+F0
         Q1O+uYz6IxIvQ5GvLIyABvGK+pgs9xNEat+wV2hIK5Z1osa+4vEwYPkuN5zIiOEMdl8t
         /MiOul6DPxvqSyvZuey2fbd/CICTU80rI/fp57dnvw8kJhPIzadpGFkRLg5Bw/uMTAJl
         RO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099746; x=1793704546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clFZbp6yNCB/YE/B1ve7L1IoY6Bcs0zpZMjkhGO28Kc=;
        b=QoXIm7a5vEQMq6CfbzoEmld31PHzV+MTHEwRIF6um9XHT4fuzgcJX1vJgAV0eZuBNP
         6+37Nc8BuiPv5LfEp8LepA0XKaM0jx+yoVm813vR6GCX5RuH8SeC/xADEPREELDk271w
         reWxQoQRQtlG4XfawsrK34ubyUySsOIAwk/8mimvmULXmHidEPkYti6fRWmzuXJI8568
         CdoRM4QCXzOQyddEvjoqPCEvZLxGU3/BAiJrWodvZblFPpJsJEY5FsLSwAJJFYdnp5AE
         fh78RnK79LlU19RkMDd8AbufVjHCWte/mAGkuLwVZihHhK4cwSJVLsf+b4qa4O8H0eXB
         PkVg==
X-Forwarded-Encrypted: i=1; AKwUvBxjsn8C2qJp17UIavVL/DsnhPfc34piQxu51hwBa1R8X2BSngsOgJnGhc3n4SDf6QRGGWmOqpwbnGjbPgPo@vger.kernel.org
X-Gm-Message-State: AFq9FYIXv7Rnpd5sJL/VylFuiggDzTDVLGrx3JoeEJi0M70zsuKW7tXB
	ZJXdIPE3b6GE633+gyNAiF2eKaZq4dYUVWD/705wSWb3QgojIJj6S2Kd30fhjv5JBGZA+8Kx5Gg
	guGe7bJEGNcRfwllJpoHCB2md9azjUkDJwr51tfupl2w2zZf3IRCHZR0Pgwgrm7v+cmIR
X-Gm-Gg: AYBFou21VuU32724Mgcpi06PFnMV3YYhdbzaL+FVdC9ktyyGb3+IxQX7RiCPNBcF70H
	lFjCqMvt5vCZV2qjSH+tmy2CbcqwK5H3Osz5udF99cG1Slq9TTr9Dx4+NjNspoVUeVhxJHifRdZ
	dpsowR0psa7vU5E918uZ707xdoYkCII7FnFUHVkzdOIPcnNS59MSKibrtlEDexL1hanS6VQ82jA
	YTBxC0ePHiLglQGN1a1ieY96IxgbeHe8GqLGYyQeT9CPHY4dIwF2OjhjhTwwhRhZGgX5erf4dz9
	xYOLsOpB3QBnobqHPtY52xmgg5UXdIdvY1pfJYMe3hheMCnscVPkcSTgbHUDyMEOyZrPr8LJ/ut
	FvOVHSXxUGS5bR7Sl
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr1448760885a.51.1793099746118;
        Tue, 27 Oct 2026 04:15:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr1448739085a.51.1793099743381;
        Tue, 27 Oct 2026 04:15:43 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm262014585e9.14.2026.10.27.04.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:15:42 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:15:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register
 XCFGI_159_152 for SE0 recovery
Message-ID: <2e2t6xf3mnvauzi7qyh4gu4ngzrgaijryggj5kpyhrizimvnvt@vth2h3bd2g4m>
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
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
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX7lS2PEyBsW/k
 cqL4HOcpBnC9buvFbMuD9bhFPlpNtiIijPkj6NA/cycLO9JDHYEawErKzfcpWMrXaYeqg+xsdkt
 HZVDFYiaEWnqoniYCJT+/Kz56J2/Jeg=
X-Proofpoint-GUID: X6NZHc1sQ3thKGTA1Q8oUFIOwJW94dD-
X-Proofpoint-ORIG-GUID: X6NZHc1sQ3thKGTA1Q8oUFIOwJW94dD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXxdmN0J/1Bli8
 M8oXQLQylktq7gABECC6mCmn6y9DOD6FPWfrC7bD6mMMLH86aNO7bDdYz4poHA009pClQuvtdHZ
 LnN9+rcV4AFVH/P73b5vECEwzJVZeTVq/K5md27SDEGy19w4cGv/V3SuZ+xB973b0cT6iKWbsbg
 KvmcLT9DUBEF3nwn30LzB47bsNZgRyxzCnzRS8EKPaeLmvNZb1OMYRgnC9oexgnCCVBqb+3icke
 EsBKpxxduiWpHxV4/wsBeMn8V1qqP4oTLfo4vRK6OYyyE9nAizMzsyZuil2xOkqvbB9xMA9uieC
 jvz88T5PIKqLjhCa6jOHot/tRvBSCw4SxQuE5Wi4oBGxG2XZZ9GZ1czgp+4VGwLqxh2thk9iKGC
 9RBf0VW8p0ree9i2CAHXRWCvVDUUSLMJa+R00vHxeGYh5Fge8234PUxXaASR5Z9AOKWMgcwNzMi
 f5DePJWCm0QZryLa3Iw==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae087e3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fd6TEVAS4L3J52g8tvEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On 26-10-26 18:55:45, Peter Chen wrote:
> From: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> This patch introduces support for the XCFGI_159_152 register to enable a
> hardware-based SE0 recovery mechanism in the M31 PHY when operating in
> host mode.
> 
> During PHY initialization, spurious pulses from external devices can
> interfere with speed negotiation, potentially leading to abnormal
> behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
> controlled by bit 159 of the XCFGI register.
> 
> When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
> activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
> before entering L0 mode, the PHY interprets this as bus inactivity and
> resets the state machine to its default state. After transitioning to
> L0, the PHY resumes normal operation in accordance with the eUSB
> specification.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
