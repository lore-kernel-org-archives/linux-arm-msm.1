Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02E3EC6A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561707; cv=none; b=ji7zu4GqE/i902hCi6tp+rFP+YQvLz4tTZsf4xGfETHZ3BPyqxsxJ5EzH8emaqFE6aOtF76XZvYA3LaLr0Jb6AWRcmGde84QJqN2U+mY/BB8iCMDY5rRUbp5/w1OVrZaJgwF9SchlnJZwTywib+yCz4rLuUgobmwnKJi9uYmcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561707; c=relaxed/simple;
	bh=L3zszI9VmVYHO2R1KbnqHE02xA967q25Wya8Ag0G9dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcAdTlrmkO73+X0l7uDYXbdxsX4FM0wmbZ0w+rPSC5Lu0oNo7fnEd+zH/6Q/LVPVKLbo7owc+015VnNUxDSDPId35IQBzl6vDtljgBEZrw9VJztikySKbHdHJFb7MwqM8vBgVcjYkf61fAXu8/y1VRQzPDSK88RloJFk7GyCet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8M47/MH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDBoaYj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8M47/MH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDBoaYj3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RG4C1008293
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p6Fi7lyn/uGeuBie5GBvgAa3
	Gi1YW/kpjLBg0PGKlFE=; b=D8M47/MHIS0rHm38R6kP7BF4AXFctqEIu/lmra0R
	sIPso1t3e7jLgkRCRzgY7U5DREyOzw8H5HQTcfWVn55+4XWusJwkFRMEvdPlfAAT
	sDH99YEXnyi/OzSEpKD0+fDR73su2SWAatxNLWzvX5ZJEOMt6iVvihevRgpSDo23
	p29qOKGRjGmarcwcn3GJrj/27ZObI8oHpT9HP64AKg4PD2/T6GbAwz9RtCwl+u8X
	ORoGxJX/d++GlQtt4RrstmFRX0HM1I7ZJYZdpnm+yUV561+uzUHUGYbXY1FkznaY
	ESg0gfRJcv0J4Aj4HAyRUXp5vnAoUxKOG3pmqbVoY4YRWg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe2yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:55:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73760a7cd83so3169392137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561704; x=1788166504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6Fi7lyn/uGeuBie5GBvgAa3Gi1YW/kpjLBg0PGKlFE=;
        b=MDBoaYj3NStogoaMPX4uGN7zMhhaPnN470j6rSJyZTOM2+VraePACbFYSf3Q53TEBR
         ich85KCs7HkzEpMIg3SNaMxlYCWzmg8x3R0D85nrQxvXdzoOb7ZUiq+dP9tPw7zZkDM3
         Y7Ue2rU/q96Cx+h7MdLErqPIAtHwCZGNhOpSM24yrRyFLlyQbWO5YHm4QHr6njLNqO7K
         jMJ8Y2zCCy57gO0FRk1y+0Hg1MrIYKLvXDUwyHU7XnQtDH9m03ngk3ers7DbIdDhgGkc
         3d/zhvD5PCdp2HrHp+YuxSAcYrsJcjtuPHrwkuzP7Luh/pA7VwcY3T5ebWt78Wf7ahDm
         7ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561704; x=1788166504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6Fi7lyn/uGeuBie5GBvgAa3Gi1YW/kpjLBg0PGKlFE=;
        b=NhhW0810oSr1B36P/gF4Es/VeOd+39c2mVW15lubZ1JBTPuIahiadLzC+Bh2q2UVSp
         O7JxmzV6ncHARlTdf6EVFAuGUKFkhZ+SM9kO1WBV0DW02GfIOumQu8QVpSKR/nG4gFgL
         vpv3l6PC3J2qfsglMumcjgW/BrKCZNc70ux47xwGvjbvVNi8vCmSaXFEWt0wfcvtbbF0
         zWyfMLzjdkv0Mc9BSZaINvHO84J+eiKGkxDpHywoOvJXvdBoHTassSXLPZNMySuDq9r5
         0+5AFnAH07VNWu9F0fNQKJWQixwAlE6aDyAMxU1J13xQhrN+Ws7BwvBIEcoaexS0AlUc
         cMsw==
X-Forwarded-Encrypted: i=1; AHgh+RqVN7y402Goa9s0jS3U/VyRuWCf+Toh4BNPrDtKvo/RP5+g+WU67//pBOh1+fldqpGjxagz2zJp4xZdtmCz@vger.kernel.org
X-Gm-Message-State: AFuF++nFIITyk3VspISQlBFKHQwmsMpu4fnkaZGt+2i0AcXArwqWcbTv
	cpZfnzAnpORO0lhwcduOXMLrOMRj/4y26DQ+z0hhTouxvHwD5Aass1eKs8rffnQu84I0WaW5vxU
	YdezjomW7Ak8Kag27uhxPYczxoEcD+0o9dKW00wbDIpK/4WhYHLvADQg7A/xxiq7lTBPp96UNQU
	QT
X-Gm-Gg: AR+sD10+9SgqarWHJiPwD4P2gDobOraFVSCTzl4P7L6YMmafm8TbfYJymyQNhqGFxBN
	4e4y9pZpdl1d/95IcUKhPhBSQvob7ZzrdQ8UYgxir/PzLptzu4+4d09r4efknyG8cefRXH1y7v5
	ymZ+BnicuC5R5za1hWsLgSDUDXzWDYj0qSIsti7IZvvO8oliS18SNnn3G7WdBy+X87EkOtTKLv6
	w/mgBO+qRrOf3tufl7MUVFcrEWai69t/fWHThqSkuradRe2EdRSOZElgyNVwEAhAUhoMCi+2EKu
	eegszYwdxFLx7Rec3+jStKmTamNYtP647y+cDNzv2TVuxETkb+fOjTJbZnJjIqNrIP+M3+rJhgx
	+4/01bV743pDjprM=
X-Received: by 2002:a05:6102:849c:10b0:77b:f3c:2d74 with SMTP id ada2fe7eead31-77b0f3c2defmr4706081137.2.1787561703931;
        Mon, 24 Aug 2026 01:55:03 -0700 (PDT)
X-Received: by 2002:a05:6102:849c:10b0:77b:f3c:2d74 with SMTP id ada2fe7eead31-77b0f3c2defmr4706064137.2.1787561703372;
        Mon, 24 Aug 2026 01:55:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1abfa0sm7568717a12.20.2026.08.24.01.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:55:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:54:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <w2mcg6p7tu6vmv6533eqd6iegyerqmb2llcm7z7vlxinidpa5a@fz6tgbxmv26w>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
 <306b2102-a7bf-4c29-b67c-df6ba5fbb7ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <306b2102-a7bf-4c29-b67c-df6ba5fbb7ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8KOekPq3s_L3OQbCy4L9q9tBt_SB_-Re
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c06e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K8JGY68o3Mja_1WIyfMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX7GFfAlA9TIAy
 4RmZcuqV8MsWZG0lTMuh7cYtS1M1WwYR52DI1WZyC5sjijyzHbTr6FRMw3mIPWLEdppXxXSaTNP
 Zxvy/oEIQV3acKUpXxnOE8lrmmbFAW58ozTq4+1K9LMNqWgqpbYCw2gSpKBpyWvvflS1GmVV/qW
 8ntnSwi8bt0v9S2S9Kvh6AZxG5m8Nn9GhCus/2DIDd9aN6V1eTPs5X768S9rXjaABtnLUukfV+W
 gmEMQEMQAjAb7dXTVDbhVjJcelTkRbhFZ1AOy/jTphbX15dKjBFzvy4G1EEnZMHFgied+GZVCdK
 fg8gVp7fY9f/Uxmc6vlfBCMAuCjbST4l/8RvxVY+gt2BfLxuy/vik+veVTxoas74y4xAu8m7f/7
 akxSl3MvF/ekAYlD1ivwjnQ7XVn0tfPTAsdasu9oE/MvONiPShFA4KyPQLanvauSEyZ6C6Xb1L/
 XD+A4qvAVda3E2yG9oQ==
X-Proofpoint-GUID: 8KOekPq3s_L3OQbCy4L9q9tBt_SB_-Re
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX/OrVq0Y32dMv
 PERBb6mUnA49zZT7NU/gQDPFce+YwLhnux/b0uhAwXdpWj2OuT5NVL2zXdAiEfIzBfG4NZXunbU
 N51KFQn6hwN8VRNhwEhyALV0QoJztQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077

On 26-08-24 11:12:53, Rajendra Nayak wrote:
> 
> 
> On 8/21/2026 4:04 PM, Pankaj Patil wrote:
> > On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
> > > On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > > > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> > > > > The suggestion of having the CX power domain tied up to the GCC
> > > > > controller started here:
> > > > > 
> > > > > https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> > > > > 
> > > > > and then, for Glymur, it has been brought up here as well:
> > > > > 
> > > > > https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> > > > > 
> > > > > These plus a discussion off-list led to this patchset being done.
> > > > > 
> > > > 
> > > > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > > > Reproducible on latest tag next-20260813 as well
> > > 
> > > Yes and the ""fix"" is to disable the GPU nodes because the custom
> > > runtime pm dance done in the gxclkctl driver keeps a vote online
> > > 
> > > That should be fixed instead
> > > 
> > > FWIW ath12k is causing some issues for me in this regard too..
> > > 
> > > Konrad
> > 
> > There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx
> > collapse after disabling crypto, camcc and evacc nodes along with reverting
> > this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
> > Can you share the steps to reproduce? Are you running additional steps before
> > triggering suspend?
> 
> GCC clock driver on Glymur has gcc_disp_hf_axi_clk marked as
> CLK_IS_CRITICAL, doesn't that mean we will always have a vote on CX
> with this patch?

Marking a clock as critical does not imply holding a vote on CX here.

CLK_IS_CRITICAL only prevents CCF from gating the clock through the normal
clock disable path. It does not hold a runtime PM reference on the GCC
device, and therefore does not by itself keep CX on.

Once the consumers have been suspended, GCC itself can be suspended and CX
can collapse. At that point the critical clock may stop ticking as a
consequence of the controller/domain being powered down, without affecting
any active consumers.
