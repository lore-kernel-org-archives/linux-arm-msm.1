Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F85381B1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611311; cv=none; b=SbwSDJGs83la7XtMk3DqZ/FcKPpa2a6qNxHiTUqL21K/mxR26UfZC/RSiafdjsbVdYK6j1ckbo0/F21qRl6k8phBr0Ph2q5kW6XwWz+/KSSFnYkCPy9E29gy/QvRFkMU2M6D3LaARxfYYu67M3TJ6Ky4REmszEO42iHlnU6s5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611311; c=relaxed/simple;
	bh=m0lF0mWr0k8EZhKMpDz0CMkc8BxDMfGtvrJsWJiJ9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBAMNDUWmBT998BY2Ewd2cbhSEYpw1RvDP6q0pobJosepwPFfHZBYDu2NX3UDEuU9jKkbDPomgBUISv+G1MsX4/tsrKUe9YfDCZMdiZ1clud/WzDDEy0LoEVcl5GKsac+JLib8fHSOHyhf3cynvLsWLXaPli+0HHa3ufSahFGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNt7axBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx3six3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNt7axBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx3six3o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GN9Em33597307
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0nkxLnWGJPKpLZVwfcJxb6ow
	WJd+MOMDPY4c/u0ORDU=; b=oNt7axBKVncjEHFcBh7gJPyYy0nDVJrzEWF2NHRO
	//10oKhbUh+MxVooNlTmJTI4FXkKAAZr94XsRInA0sks0QOa5kCSXEZGPLN6Cjr3
	F1w7lFS9dAABj1wPoRKUil2E6LDvFoUVh/6Co/rlRsLjiDlsOKkH7mXLbN9Xhk2h
	/CTjVTAH7cCjiVui2nSSLKEu4tIWFOwdrxuwtum7aOKdA57uBlUpnFS+yz4R4ib/
	hX1XgKVoxAhqmvVAZ5jwrDH483+tKTu9iPWcHQKygMHp3N5nDjUeHJow5/Rv2k7q
	nsbplCiHZLXTWaG2sFGnVy5H7/JoLGJgNS9gLu9LqrnqhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxaya7fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:15:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so618515a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 19:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611307; x=1790216107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nkxLnWGJPKpLZVwfcJxb6owWJd+MOMDPY4c/u0ORDU=;
        b=Dx3six3oc7C2fRBU8ceHPN6qEuVzQhv9UWzJh2pXMiTNgugTw9g2jAzFx3Jcjz/ukw
         YDcbK5ICCXYIGfCCGoQ0EcLUZTXP+d9nEb3eQzDYWAeG2HrREbmRMltKw6p/FuUuvr80
         0xk9h6T7iD12ojQRGcLBEXlbPuxfCvLkGXSdPRac+/MF6H3eTgu8oM+A+jrxKp32iMor
         YYodHLmo0ZDSX/eYhDSp0EQlilfWuxwn+3bcJoJS4TaksV3tor8fIIhpU47k5G3XiK5l
         2l/XZOASj5LUclRw9HADiwamVnV2pYao0FXoxEDcfZjWrGheWsUnwqSM5bsEHIhfk9Ff
         Wa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611307; x=1790216107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nkxLnWGJPKpLZVwfcJxb6owWJd+MOMDPY4c/u0ORDU=;
        b=roshn5bxK1+PK3TEPMmNYCC82Aap7ZCD10iU8v/Ysur14E0++0gV+hw/tps7+i2YOM
         p6D2MMqTtb55Xoh8/lcTmpslajxmxj+YqBBIWIgWwrloawABSELk7ptta8SLHQSqhffv
         UB4oEIwCwV/vJsMeBj/MyHNdZ+1paFUi4nnDsxrV9jZR03a4GoIKK+SScua4xXB96GLf
         ToaXvalwdmxF4q8BSAMsTCNTiQS14meWeUzdQTEy79+fxs6t3m6uX+FwfWu62dyV+WkK
         MVXxneZ4vrZhuQw/1+EXHf+uBNZPIPgs3NlHnGTFAnGc1FBGE2ROfSjDz2K3ZFxLUOJL
         p/Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzgHsFwnpJUGQy0Z5wSti/LjrWZx2XgNiXwnPl8zFoqvoYTyK4+XoJYncMSMraXpYEVPEjGQGau9YOQVstE@vger.kernel.org
X-Gm-Message-State: AFuF++kg9RNpMDpeSzvRxSluYp1/54I4l1MIx5DSIZzabz6AHhoKSXSx
	jptB1lYW7+f0LrzcQd+IH6UDs7lWUUmAD8aPAqUpAC+Vh18YHJXJu2VS6/FbnQ8aQymUqD2PPrW
	+KVC5kgTACbQhddMYsT4QHPICMqzD2xJWmgC4HpAYx1MqxePTWBxbJT7iV2MrYfgS3vCW
X-Gm-Gg: AYBFou0ShrReM0ETcd4Dvibo2w+j2QyMojfkmC86I//mtDJLd21bjXsqC4b2lNTYH6R
	vYw3iGLhj4p7lZ9Go2c4S1wpwUN8HfAufn3dpbQIqWMiZ13EppzR/E7jV4/8ee9/QOmAQ10ysNS
	ax4eSXVt5VhHpeu0YGhtTyaUdMAOQ7T8m55qOMCy/sXXRSRgGgybpogF1P6tDf3Ow9n/gIIjXS5
	/FDEgL6LkOVdb6Gb8jlv08b/tP+zgmhcn0Jeo6EXPoz7i4Hulkbmb4A5B3wYN0HgCvfE+SqVAGT
	/tXxSGmwKeTyTcRs0hxDDOpemx/JJlKG6Urbha0ORXL0WC/1iAqhwxj/dGv5ah5Zvf+6P/1XQn4
	V1CoYvNRdhknMdndlsY1i9E1qLBdRf579sPBqPIofDoA=
X-Received: by 2002:a17:90a:f09:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e218cd674mr8456851a91.9.1789611306706;
        Wed, 16 Sep 2026 19:15:06 -0700 (PDT)
X-Received: by 2002:a17:90a:f09:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e218cd674mr8456782a91.9.1789611306226;
        Wed, 16 Sep 2026 19:15:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14368985eec.2.2026.09.16.19.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:15:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:14:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 00/17] Add Qualcomm Nord display and eDP PHY support
Message-ID: <aqtNIFXY2OcL3SPB@QCOM-aGQu4IUr3Y>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX7G4ynY814yF8
 b1ahhE/zKGE7d/gGBS4i22OvMPFXDWgGscrbMssVjUQh1/dYmQGSGYUWVKG6JJ8wHaXJ2qSBayG
 r+1EYLd/S79yRqzBUnzT7Tv7kYDhT8UyGDdKlURtIPdVRu6EtlZ8iNDJKMavYd87qlDd6XFpizV
 t1LBYFSmD87OrF8SfMxvblNlLgCqht+W0ycEYoq1Yjz314lOGVuA8gko6izOPXvsV3VGc4p2Xjf
 ne1p0ja91jBtn8LLzn0xQ8/ohyydTJRHb13DU8Na95zQadBhbpkF7AFdUD/RP2dAGbO6wxAAp5A
 8FnPtPeOrMb2oBTruaNfV0vaNW35fiYruiQrmDxYk5zWY5N6gROugD7ySCfjsVYw5ZUfywFRgZF
 1jRxtnaVMw84DWWz1tIf3rW+JaeYKQNvMtcqENcyZUTLdFZUSKruf04KF0hj1WUCl3Y73FMAYx1
 GQtZzfnn0BPz+pWENJA==
X-Proofpoint-GUID: QCr16bREHr5jpV2rcvpyUPiYLpKhWc9q
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab4d2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NcJHP3AOhwWrRdeD_j4A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: QCr16bREHr5jpV2rcvpyUPiYLpKhWc9q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX9XAH2OZtPSBZ
 EsRlinoyJqe+9N2GaH1F/2+z5V+oLD6tkp6tnX4L9ly4tWklHELq+A9n/8YBy6hC/QEtL/2mE5a
 4j7ny276OGjSIQYEKcqMPXNX3mt+eJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170029

On Fri, Sep 11, 2026 at 09:06:31PM +0530, Nabige Aala wrote:
> Nord is a Qualcomm SoC with a DP-only display subsystem
> (MDSS 12.1 / DPU 1499A) and two independent DP controllers
> backed by eDP PHY.  The PHY uses a different register layout,
> PLL/SSC coefficients and TX signal parameters compared to
> all existing SoCs supported by the qcom-edp driver.
> 
> This series enables the display pipeline on Nord by adding
> DT bindings for the MDSS, DP controller and eDP PHY, DPU
> catalog and driver entries for MDSS and DP, and full eDP
> PHY support.
> 
> Tested on Nord Ride SX board with one DPU. Both MDSS and
> DP controllers probe cleanly and panels render correctly.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Hi Nabige,

May I ask to be copied on Nord related patches? Thanks!

Shawn
