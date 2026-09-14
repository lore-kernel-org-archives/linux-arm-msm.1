Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E44749CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394080; cv=none; b=K83Qa//qrH0xNfsX2AcF7q0ypBXsftP1Ft+kSwEtAF/7e/N7sQy7yiCXoRnJPVtqk3ionokdytW7c2wNBrXThENeRWF58e2QfjvYsclfrLpKnWYjBYbeiZ+zHJmTvoLhkWOuXUUhCpYtSal8VWFnEn3BGJAT6WvivNwAjAedHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394080; c=relaxed/simple;
	bh=FO6B7ZAaXGZLfF5gxpyIHscYj6HA8lcMSG3+bwdUkO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGSiCWijRLKYLaizNXD8LzAisAbJus1VaUr3hkYM1UVZBC2tqqzzQCFkVuJQgbY0FU86Y+sZZd83//Uc9JMm8ffLYUTjOGbOzuKfhKlxkomXAdEjtZL8MH9xHttLR5vjABGjqddLjUBW7ForMcVmYU07QIPql5n7XRnm1/1eKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOZhbNET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkxZ3Mxh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOZhbNET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkxZ3Mxh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0JAR1514313
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tof0ENhBw4ELkanr9NwB/h2C
	JnA1o7lWbEmswvGyBHU=; b=YOZhbNET4jdplSRTsO5/v2ZvDkRcb6X+TmtY55TO
	vq2F1u16kAiron6NM+K47sZWVHFcM6ik4OiZpw11bph8Hpubk80KCw1rpVzM6X/t
	3ePdOIW+YthBMQo+fWg1QxgnzkLHvUlCFOYifY2/rF/jnBaHXuWwOB97pWBTjDsA
	2SrTN/OjIaJ/1rS7UOfTlPKujGDvFLIECn7KbxdaX+vXbLw1aSAus3IUK4crgMhV
	d1TTg0xOy1kR7KJ+7JbD9s+RLLcr1XyNd4bjbpmcq1CEyForAjhF7NGEXY315bHp
	NMHNRhLlp9g6w4yjBa6iX7NiYM0HfTUnm9QNfvPqcWiFEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0athp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so70598946d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394076; x=1789998876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tof0ENhBw4ELkanr9NwB/h2CJnA1o7lWbEmswvGyBHU=;
        b=CkxZ3Mxh3o53L94NYdcawb2aLB4U/X9Vv0+lTgfhntsRRviA7e4DhgqtqHH/rhTiQ4
         l6JXQLf7M9SjGnkksFg7qGyBa5B07AIs1Yd+/YnlNE+mATKfX8zyPBm323ao3q3h0v7R
         MMXj3ow3dy45mrhG5+Y/IAT3nYEyYvcGHw3F68Cuofn4PoVIIStE76EnvuS9uB1QC+i8
         lkfqRbvWs1TYwFt2AWQhgyHxhpy/fS1eSOExji/B4t00nu+ei2oF2PYByPKZhJFy4YPG
         Cq8deZF1NbVzsRe9NL4yOwmJUr0EuQKGx7eM5drd4b8qpbfdUk6mB1sw9npWKNnWvv03
         FM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394076; x=1789998876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tof0ENhBw4ELkanr9NwB/h2CJnA1o7lWbEmswvGyBHU=;
        b=QeSArwpkYFJczPBi9ge+QIhoGz/9nrXcQ1NJZYce1PdQPfhJwSlWMxO9cTr/oNy4LA
         XSRQWMMryNvmeEw0k6KNtorGSSzaE7n9hOx8raAXW2ULsIdC6zkvK209VlMXvsptHCwB
         nj+uYFb19ViAa7ISRVY0jKWwqkuVrRbRjnC9CzrFV6hFFc+vYvf9k4JWm4iJHhUFjfrc
         kShyc4FC4155z8OFs6nSvX+Ow4V9D0sRomTeiIn8n3N8xP5pVFIhtbFLhrWELyHLXowt
         8w5LVf0rge1Q6m9Ytu5dcMri8c83+RTyzUlpykWgggi5YQJkFsq5IkHWIxZcjoX2enjp
         9eKg==
X-Forwarded-Encrypted: i=1; AKwUvBzU29Bc4ER5chn8c89iu1M4sTqcHQ6mubEn3BphXe9/Xa/Cc0T67XmOE+vHkeUO3+zNom9Ulq5raJpEPINl@vger.kernel.org
X-Gm-Message-State: AFuF++lXxz2qJEM4rSrp5eLhxQwzHbVrm5N1zB82olXzvf2fM7cmvBoy
	axkTRoYFWeL6Gp8JmUq/b9bgOEZqEnHfZwvoMo9ms+sYtHGqfHEL7/K1AsW0J5tzNsm9iUTAwHG
	ENam4dSSeZ7lnTX57GgLMXBT8/avSMdrdT1iYFJLXkDtIINDWGfz3BEM7ZSMtpaBYFLNE
X-Gm-Gg: AYBFou2EHaPJr7hEkObYUQlteJMjYce94C+u2pGS6VED68kIVSs7oqeMSPqLAsawzOd
	j3JZlJyWH+YRcexLn1jTNdtRz929+3asYfMqA+qQHo7tntMdNItjSE1nr05uvobCIwnRe8b3X5l
	F9pTo15GqkMMP1mZqOOu5eJf3jjo6oHt3bzBwlx/TQ0j4DFQMwVeewhooAP1TU8SbSxKWML6Mxg
	rNb2GS/ubPhPrTqqxd4CfC0hEczTYMVzFKdt/bJTMBw+sEccHdC46aI8JGiIqE8xreoNGCXwKO6
	XiRx2Tk0gMS7FlNw3mXhlIF9iMwRUvdKOWtCwmSBUUNFHiBdJD9uYYthStBpbwACXgb3fiLpHcj
	LEFRTjXEp1z0tolA=
X-Received: by 2002:a05:620a:2702:b0:93a:abf:8163 with SMTP id af79cd13be357-93a29a05868mr415533585a.36.1789394076129;
        Mon, 14 Sep 2026 06:54:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2702:b0:93a:abf:8163 with SMTP id af79cd13be357-93a29a05868mr415523685a.36.1789394075329;
        Mon, 14 Sep 2026 06:54:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm304604975e9.8.2026.09.14.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:54:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:54:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord: Add PCIe PHY and controller
 nodes
Message-ID: <zpf7ndcqomayydr5axoim7rf6brenhs7nkexw32gkyo5cuamxi@g2hxdgle2h5p>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-2-shengchao.guo@oss.qualcomm.com>
 <aqeigXZC7w4CmMl6@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqeigXZC7w4CmMl6@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX8jShCo25tA0n
 dsW8Cn70O97lueevxdwB0KN+jk790aepX18ag4f3IpJyQqrpV7ODhfabKYVABcQLZZljawJIVQo
 T+NMsH82q4nTbmoj0V97MzrFoJUXgB8=
X-Proofpoint-GUID: Ode09K4Ctq4U9RaVBqVdjkjFWqhk_qkP
X-Proofpoint-ORIG-GUID: Ode09K4Ctq4U9RaVBqVdjkjFWqhk_qkP
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7fc9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UMe-PY-mz3fTUZ27lzsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfXxY/D9HZuEMuE
 2Lr+hX5qvn026bBqF6OSQjxXNLn+12gUkkq8D7k69yYSS2hHSBn5dMMvUy6Z9MrmHCfCCLH+83Q
 JCYXHn1yXUxE7wWgvFn3EzIuPOZTNFYIF4OjQLKkV3+Mq1wbI9TOP8Hm4eEyvakauqr3arsP4vM
 zaR54Em4kK9vVqNWERyAZj+PDBOZXXigcDxOoIb9VmHQbPd0EpVyGdhR4q2+HPPISQZOzfUeWkX
 O9Ma5DBZvU1Pf0aJaW53RztXmZ7catQgkOqoMHI2gWzIVH9wqocwA/XB2Ll6j7P8zrVcouunalf
 vk8ymeghpFSolQj1BD0RfIY11zPXoaVmYZGkvEBgwbMFUPmAVGajds43dTnZTgAiISCu1HVGXQk
 wP9juhscwhl+wIVyqRYxOE9DkR0WzLopgvLtPfYDD8tlaTqePcgqChXdAooKqt7XYS9NaUc37ie
 hRRv2HQVGoDSZtVcgSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140199

On 26-09-14 15:30:09, Shawn Guo wrote:
> On Mon, Sep 14, 2026 at 03:19:40PM +0800, Shawn Guo wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > Nord has four PCIe controllers backed by a single quadfurcated Gen5
> > QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
> > can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
> > topology in effect is selected by firmware through the TCSR link-config
> > mode register, which the PHY driver reads at probe time.  Describe the
> > x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
> > configuration the boards ship with.
> > 
> > Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
> > with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
> > and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
> > also become available now, so hook them up as GCC parents in place of
> > the <0> placeholders.
> > 
> > The controllers and the PHY are left disabled here and enabled per
> > board.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With your own comment addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
