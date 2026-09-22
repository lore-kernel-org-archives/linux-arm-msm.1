Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C93E49F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068721; cv=none; b=MckCmTEZTdIq3dIiyInUA1sQQcaJ5LuZKxl7J+WK+VVFx7c+ONQKaVGL2nlXxorzPNijoLTqHcmCX6X0N85CJhKHyfKb5yRb5tMLquQwS7uaCw4bNC8/X75eGkgiZ0mLz0cLFAAeUtbRbStOhvzS78mAZ5xFzxVl8eumLy2etqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068721; c=relaxed/simple;
	bh=mcUzmsbUZQq4E2knB8VSH8G45CFD6tZ2tH8mnwbjETQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXRQEnKnneuUpP3j0TyjqpqdRL+vZyTt03nwtF55Ma5dEcxKzIiDnSAkAf1dte2hSBeiYN2IXSXUFcxHFQKVCUsjw7ufnH4WR0GAtXBL0XyY/BTP7rscbPN2o6VmOu0K5qjtRbcutwSR6VVQvVDv/GllEG4T1KASlsWHY/ZWl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O19lbRdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDcljAxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O19lbRdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDcljAxb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4Muea3383563
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XKotZtMS7ewKcsV6iJ09kjS/
	F3R0guDpSO4Eq1SOvq4=; b=O19lbRdH/itxZvGtSA8IL73kRkl2nvs+YbsiRnuy
	EGRjefwsJ2ML/300gL+cpQxQX3O1bNw+7gho1CvCGEbu5L/z/vjeVEGGMiPY5Xts
	EeVw9CyPcDkUUIFNNYd0smVh0kO0kCVT2rVYQZRKkmJdfBpFBBGUBHcEe5C2/D9i
	qJqE57fr6MsBrDYsjZVnkLgMMN4JCW9rRREuvl4Elf2pM2AAiEPbj93zapYYpXpq
	dvYNMZbxa4MUtZ+3HPNlFJdygIn3oz6vn5aEHywqk8xK0qwPlACv720ZzSBODi40
	fyRPhYC4afTzukbvXhoViXgPpWVGqCCaQAlM0cpo37oaHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj94cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:18:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso740484a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068718; x=1790673518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XKotZtMS7ewKcsV6iJ09kjS/F3R0guDpSO4Eq1SOvq4=;
        b=PDcljAxbsD05EF76VTutfKYl3LdREPRgPg6xk30ZriOm8KDz3PmsFC3jARzt3WjfNk
         ucoEVVCgUMm3bGLC2cfCMV3BaXbLnaNV4+Kc8JdwL28xZeOI1qR2P4aBrY6Y2k1oqABs
         MrXgKsVjcuP5aikXhsnNN1tA/WoJMP+mG8sBTk5kkz2DkhWE6+TK9N0aI4GJTucPqlvJ
         PoDHDe29ggohgBExuoe0Ta7/MREHWS4DUwqNV7NP37fU8jP1MQHRBpTV90a6tYx4WLlS
         SxSJJ7bMLoEQftfgNxNg+gLZMlbWOEjZdn7cRcy7pLs8Akheg8YYA1JUj860nZUEBHsV
         oOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068718; x=1790673518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKotZtMS7ewKcsV6iJ09kjS/F3R0guDpSO4Eq1SOvq4=;
        b=YHNp12RyEEDI7+jjLHaqS1P9cZt8cjR8MH0ajoT6Tb+vaZitlxCaxWB+1hGmn7ZiJ8
         CbvvH7rGVw0PR7NYkHP1T+uaTsWIcjreJSTVZ8CSW4UB3TZdevGQvyPNZyMnJjQMB82f
         goQYSKDw+Y+pX50tA9TdV8ipqVSZI7vwJlPU18HJZ2oBcl8wfPEt2+3A95AoYgOQkTTq
         Fl7HE/aRWhdqDELxnk8jCT6CafKOMPg8Z2UdBewB4bLXLwFlfAzVrmzXYeTZHh3YQgCP
         1U675cM30O1JjkRliTMr8KfkuHE2WthXJOLXWODaJigZTMI8a6vziNMz9DJcoWvF5Stq
         BdJg==
X-Forwarded-Encrypted: i=1; AKwUvBwtATXWGnGUe3dhdklK3XTRWsgfNhlyWHCOxdGzfCGStAmJIXnXtzOLvCMJnxHodv8kLPVu2JCzwuQmcJrt@vger.kernel.org
X-Gm-Message-State: AFuF++k8rr67iXegXY0Orf83CJrrRP7Kv8dbalJkgy23Do36t4XPrTUH
	Q0yUaGt7wytAL3rloAzvApZttBsxHRu6mpd0OeuS3Pr/qq2BWuKX1b+mCb6uddJgCUTSz6GD6Je
	dMwIg1eQXjqGpe7cGvWpsIU4gtu+YeDm/dbo9FIv3IiM4mzmClE4TXgqoWIhzBQV9VeLR
X-Gm-Gg: AYBFou1rf0YY9nhbYF0iOh/TO/9cQ67IZBQA0e043mhaCifC8HZKsExVCiHHuVDgWDg
	0SDTnoGdlxPzCA/DZbXlfXmcZMtBQ3E96xSFyTo7A2BuRzqmON71dIwX0LLByCmYHO3xrH9Fgot
	zHjLJuok+JwoqGcBaoDSf2vEAt4DNPcZFPeqhfA6KegiSt1DQck828eXc6z9cnLYAXQ7TqMy0Co
	gfpIcYByDemsm24Foo8VWAItM0RgxMYQ8q/AA4dt+uXXFOmHIdEqshgPb9H29wf+M6lO/FM9aqL
	LNMUlDxJhv1+MLog0dEaYk2R0Xfj7jt1BD7lMATj2OWu7fkK/2rUeHuSVdfV2e6RuEMn2xEwtpL
	JUVG1Pv7gX2IWTYIo0ZmBadtwvShDai7xmLrPXasM8dWYdQw=
X-Received: by 2002:a17:90b:554b:b0:3a0:5c17:642d with SMTP id 98e67ed59e1d1-3a07326e7acmr483699a91.52.1790068718164;
        Tue, 22 Sep 2026 02:18:38 -0700 (PDT)
X-Received: by 2002:a17:90b:554b:b0:3a0:5c17:642d with SMTP id 98e67ed59e1d1-3a07326e7acmr483681a91.52.1790068717620;
        Tue, 22 Sep 2026 02:18:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm4762429eec.1.2026.09.22.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:18:37 -0700 (PDT)
Date: Tue, 22 Sep 2026 02:18:35 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Message-ID: <arJH64UqwPYfg5c+@hu-qianyu-lv.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
 <dfad8320-5a92-4398-83bd-3e796faa24a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfad8320-5a92-4398-83bd-3e796faa24a1@oss.qualcomm.com>
X-Proofpoint-GUID: prlekWQtUQkijxfVUPTzd50yAEfIa-UM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX9bPyvSt0Ajxo
 Hfk7tIT1Ac5CGeqfRtkUxU4UfM0xh0oJ+0VE+8NlagmkpfbeYgV4tmWrIVaCw7BOJlIs4BWRdve
 3fvnsh+3mwZe1Ok23cFt7WlDojXFpj7cIQ72E63fy6Xa96c8s2WiBljeqNEYPZ0cUGvU0kyuepK
 0qpvH9ajftWEZV0JFEQMAVbxdEwKiFHesJhTJBbHTjhvXup6A4THIVUgx17LklButm1+kbBCBTh
 BgNYNDorKCT41lIC6olrfco+hx44eUsdczHj0h9rockKARAg3jItoXchk13p0B/IhhpRtXaQe3T
 ZOGIc9epn5hH8N2mIdZipvX4mrLW835WsT9TNcP1vY+nVmT9qmOYDv2vkR5pPbSUvhVwDYZKmpf
 g9xgc9ROI7pUlGBWdg9DMuz0bO1JprOpgVgcWfSxMTCzv5vXE5qk5dw7p//5pgU6D17HNDMBsBo
 /wn0hz63wVmaPXKpI6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX7hzF0vObpi5k
 mt61EqEKlD/ikRy3R/WS2a11XGqt3RRxrLB45iKALfTSwcQIq0Ma1tzjixZ/aPSvIQBmUggoq1P
 R5Yu3zrH0RoGgG1pKVWF3vNQxGyd8is=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab247ee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LSDu2nEps--MNvHFjqkA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: prlekWQtUQkijxfVUPTzd50yAEfIa-UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220133

On Mon, Sep 21, 2026 at 09:37:10AM +0200, Konrad Dybcio wrote:
> On 9/21/26 8:30 AM, Qiang Yu wrote:
> > On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
> >> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
> >>
> >> Nord has a single Gen5-capable QMP PCIe PHY block split into four
> >> independently-clocked and independently-resettable ports (A/B/C/D).
> >> Firmware selects the active lane topology at boot via a TCSR
> >> configuration register, and the same PHY block can appear as a single
> >> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
> >> is similar in spirit to the Glymur multi-PHY support already posted,
> >> except Nord's PHY registers are programmed by Linux rather than by
> >> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
> >> tables along with the power-up/power-down/soft-reset sequencing needed
> >> to bring each port up.
> >>
> >> The series also documents and wires up the qcom,nord-pcie compatible
> >> (reusing the existing SA8775P PCIe controller binding), and adds a
> >> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
> >> convergence issue in the PCIe power domain.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > Tested on Glymur CRD and Glymur QCB, devices can be enumerated.
> 
> A test of "this didn't break my completely different board" is
> welcome, but looks a little confusing without you saying that
> was the intent specifically - unless maybe it wasn't?
>

Yes, I only confirmed that there is no regression on Glymur.

- Qiang Yu
