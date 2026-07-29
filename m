Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA76A456E0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318660; cv=none; b=ru2A2IKIFjHu3GoVG1oZIi9OChMQyF5r7aXGsFY4FDyT8LOZY2GBdYpzTkbDWiMgFrdwVpgzZPG1XV+M+n0ZqxWvBbI4kdzdMSrfk9reC+BV1dOlZQuXgnN/QNVV9sxTM+vWHWuXfT5GOn7Q/wsjf1do0humxqVrCyhwUvlMvSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318660; c=relaxed/simple;
	bh=0PRAwL94Zg/K83iADkQUEyQBMjpcSePQXE2NWzs6w+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8lUINYtkH1V9xk9yRc78yeyQzNWwSbl606wBioXmzFBlx+zG+rk6Ac0ehgbXsDLEc970jyILmB0y1bcRGdI/e/1xF6kcn4b2jTd7ORUF2ZveRtpek+ko5IkfhvoKioBtDjSlIsHrlx3mr/t0OAk2kA8yNaFm7cYPimskHtTfaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwJF9uFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqt9eb60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwJF9uFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqt9eb60"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fJ241182043
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dY/kYFuWXoOZQdsHmp4MpeQe
	J9QhTJRZK/WeF4pyjQ8=; b=BwJF9uFEeYb9Tu/qIo4IpK6zN5hTYQeKZKbNrzj6
	rwA+dikxzgC5G3++g9aU50K/nnLHju82AjetKWSvHHj98zEzZzSUTx7V5Qm0lAnw
	Te6xEYcgZ3p7mL2TsTq3Kyg6tvBgx6xHRDIs4V5/AXsDfuphmboKezkArrgmAivn
	QQ4BX+aFjCHiMMR9p0wD2ihRWYa+jHkJ6VVVHosBfPva0rukdSy5aLE9S+hP45nl
	VmzlxRInEoc2YIfNlt35nBo2WcVcbcrmbQ3duV2qcQf9UVTBQuVzyXEBTwtYxVXt
	/xvjKN9KOo5wBtUFgOpWbWnxLpY70cnlOmj4w2042jcdGw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmcs11r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:50:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1505423a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785318657; x=1785923457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dY/kYFuWXoOZQdsHmp4MpeQeJ9QhTJRZK/WeF4pyjQ8=;
        b=dqt9eb60UBgsIMOSrWqzlCvBTSUs52xxMi4F1sZ91fEw4SQ+A0iPc3jQeDca8fiBuo
         nxxVBtaGGfcpQMAEF5KYGO7i5HNf1bKskDPVtNtPhg8qDWRI0Oodai2a5QpxThYr3e9s
         1xjjwvnEVqZIbPlvuv3RlpeYdWpS5T9QdEOZG8Azo1lzrOKoX1UmW76Ed+DjKPBTGG/f
         ZScy0APWprYagiLUNI8CgRT84SOC/SLZdWClkIbNo5yO0iEEv/9BTDnzmVbC7woMZ07M
         V11rPcWOuQNjWc0gAcCs7jXKShWWVmeDSWzQEvdbuMQ5kRWG9mCmSTA26j3pwRpEHfqg
         +X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785318657; x=1785923457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY/kYFuWXoOZQdsHmp4MpeQeJ9QhTJRZK/WeF4pyjQ8=;
        b=aneuayMZKlOwqR+bdsTTk2lIRySxYbT7Q2/reWNrOBSHk3J0Xw7GvrGfyWnDXos+8E
         x805iwdpgbwMDcJi7L6XKDf3hoRsYFB5PXO1SkFIKShhX4KuiJG/09RrjBQwv9ryqOzH
         vstBIzpDKcNv6PnSnMRvBNkOhmE9mDLkPiX9J/eLA9mrR3QCWZfS00irqq4+xerrzLlo
         XEZJei9wrQYCaQTp9hGw513IlgOk2FvHoKMMjDMbikxkv17xQzT2q1hrHWWfTqhsknSI
         lFGoFVrdztYXHvDBuoyGkcRCMuFr4AFolX+sCMV95dycsbgwLOn1UJTpWmIrlgcQIJtR
         t5OQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdZPwHior1xT/d665jEDF3T371F1RHZ/qs6ruJwP0EWq7hjjqngsB28EOutlyX5JC3HItDUuc0ofz9aH+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywta0e1D82pS5O0ICUDbgfgfjEjO7tViE5Piw8F3JgMyAWzUSDM
	S7LnbTPKtFpKP5zCi4gxj+AZJ0f2x/ghNVbKOaHolcFO8fvzm3Ixz4gLTcBTbdKz6E9B4L84qHr
	6XnqFZe6Vm4sudlGGby+0uN+a+6fXjneZmJGaXuF2nZCAQ6mVU7BhEyyQ4XHhYxETR+vs
X-Gm-Gg: AR+sD13CcPT7/ouMn4E2ecx+SfuL9x1bA+UpoX9PP6+cAMvRIu67MY2haOqAm48EfBB
	fcr4IpR1xdZqggvpmatKKpY14nO9zpKQwERnnugQtvWOlOOQjypoJxiTGxNwB4U0lTF9NCjh8rC
	cHpw9fU28bEmllnJbmmCwIguabn8Rz+RW0JOf3e8CO0rH1BX1P+WKE5CM/RLJlBb9n7o4uzcfrl
	1uAFF51JQZiQVarXJdtvOrNYi3ZgRlfUUmMhmjV3vejGda3LKKYCmo8zYXK+UgYma2dLn2udqWl
	HRJsTrLxF1YCgtiEVn2NiMt2rfsWSQaS6e630zL1LOU0ZveJRSyD7mlchUe5TibcDRa4Vhiz20s
	7lyWc+v+YM2idoS3ky9xZC76b57HaP/Tkei9PoSPIjTtSqDQ=
X-Received: by 2002:a17:902:eccc:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d026793097mr17395755ad.27.1785318656516;
        Wed, 29 Jul 2026 02:50:56 -0700 (PDT)
X-Received: by 2002:a17:902:eccc:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d026793097mr17395535ad.27.1785318656074;
        Wed, 29 Jul 2026 02:50:56 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf8880sm8677205ad.66.2026.07.29.02.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:50:55 -0700 (PDT)
Date: Wed, 29 Jul 2026 02:50:53 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <amnM/dVT3tZeR4h7@hu-qianyu-lv.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
 <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
 <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
 <cc185dfa-4271-4c63-89a9-05b8990db242@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc185dfa-4271-4c63-89a9-05b8990db242@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MCBTYWx0ZWRfXyAjZE7jKzaR3
 1CpuTKF5E6dEnbzPeurB8VaGsLgX/xj5miWCurBRO5s+0OpFuoKZZYhwQ7iMHzdrYX/u80NZYA7
 WEazt0i4AAkcBTYHR8VRrOT76g0ku2hCCzuACdqsBg9rLCVP+GHXylpkYA2bmTryXCO7Ya33t5E
 C/skbis5BaMiLMqYxLSOv9KkKW8GTttC6t1LLaY5TVepGrA/ZWUcxtRuwqmC8JMYYMLYu3NJd/o
 yWtnqzWlc68g+QUjKU+RqmhShmAXCxhscDgVRTS1bQCuMiuMPVZ7sZA4qBn0r8PY5bjPtxV0ngf
 nv5F20JANDk0oH7tuELF5QymRap3+/t2Gl6sHQEDLZ5WOUTQBMqU7C9BMqLH9z90w6j/uVL3z35
 0kJ+w95M0WUASr8CNcYAjWp8l1yme20jtEC9gW6+YCTzvJ7uYVl6s9xIeRMPkE8irNJrmyEiJLK
 G5QM2inpz+BpYGiNYAg==
X-Authority-Analysis: v=2.4 cv=HP3z0Itv c=1 sm=1 tr=0 ts=6a69cd01 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6I5spZTCEmWeGOySesgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: n2P93aYmxytTCaxJVO1sVIeKMFJ4P2QC
X-Proofpoint-ORIG-GUID: n2P93aYmxytTCaxJVO1sVIeKMFJ4P2QC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MCBTYWx0ZWRfX3+yFu6HZto9E
 IJFc3gn9JMpVT4r1psjyhD3Zv50TP5d4Fl8md01hPpJC55P3F9P6dWHl+8XQ8DPlfC3aHAv1mP4
 vOiJ8ADELoQ0vKV7/aovLe6fw6/MzaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290080

On Wed, Jul 29, 2026 at 11:22:45AM +0200, Konrad Dybcio wrote:
> On 7/29/26 11:11 AM, Qiang Yu wrote:
> > On Wed, Jul 29, 2026 at 10:30:27AM +0200, Konrad Dybcio wrote:
> >> On 7/29/26 8:45 AM, Qiang Yu wrote:
> >>> On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
> >>>> On 7/24/26 12:01 PM, Qiang Yu wrote:
> >>>>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> >>>>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> >>>>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
> >>>>>  1 file changed, 8 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> index 6125617de82a..0aae613a33ad 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> @@ -28,3 +28,11 @@ &mdss_dp1 {
> >>>>>  &mdss_dp1_out {
> >>>>>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >>>>>  };
> >>>>> +
> >>>>> +&pcie3_phy {
> >>>>> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> >>>>> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> >>>>> +
> >>>>> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> >>>>> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> >>>>
> >>>> I'm guessing you also meant to enable it here
> >>>
> >>> No, we need to keep it as disabled because pcie3b is not enabled by
> >>> default on glymur crd.
> >>>
> >>> See the fake pcie3b_phy be dropped, it is disabled
> >>> https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/
> >>
> >> I think there are SKUs with dual-NVMe that use it
> > 
> > But the pcie3b controller node is also disabled, should I enable it in
> > this series?
> 
> Do we know what happens if UEFI sets this to x8-mode? (is that even

UEFI will not set it two x8 mode on crd.

> a concern on CRDs specifically though?) Will the second controller fail
> to probe and become a sync_state hog?

PCIe3b is not enabled in UEFI by default, if we enable it here, we will
see probe fail.

- Qiang Yu
