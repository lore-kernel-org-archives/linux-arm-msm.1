Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115418;
	b=eLE4sjQpF9YrptSHiWlXIVb8WDOf9MdH9BpfJivZ8/awev3CB2mpWPZMKf/Xviyiyjxu
	 g95YI6E2Anq4tp4jtATexHa8bckeiGWXgmFSrMkG5wlcqRAu6hKMLPqS1bRZwiPba0eAP
	 2F8RWWiJHu14POkzpsFA01P3dMRgv2AHglB9oztHQx10LBWJOLU/pEtyvfYUBPNM8De9L
	 yZ3Qwx1KT6rQgSsCAGnV5ayFMf6CBm6ThbWm19961SPS+IG2C7lAQXa6owER6d0kG3laF
	 Zn5KWIPGEVMqUDJM+C5Cd28Su+oQY5L5Jx0gbhsBaapgmLweNRcyGnthPDOYXJLXzeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
	b=uAb8JL37b2sD86MRnS2CGmNFpT45ps82V5fTuKib2QAdDDDG+kE0EkHrvApVfUt6Plga
	 sMPvg5sx3YdL8D0qydZyy//cGz98yLIfcPGL0Llro503UDBN7VanPfX4yIuSFl6XFN/vK
	 9rfzK1R1MdDkzfzwWhtgpPAMc6lGnaxuwHI4+6YznA7HKGkMD/xoW8Q11lWbhUHFoNZlZ
	 d/aK4u6icjzJ0IzOHj8mw92ciX0Voc9Zfe5bxbRO5s5xuqivX0mvPn5Egxz9PjVrU3/ME
	 QeEXLRmjONdMSnMRfgPsTh17yES7B8HgHs0JEocM4Zz6yOR3z5WnlkMiZjsT+B9l7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0MuHBy0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3zoIteI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637A0606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0MuHBy0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3zoIteI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL5E12242277
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOtOrmbXs4tZg1IaJhGs/3w8
	x1kRlFAdZAd0OV7YngI=; b=c0MuHBy0hpXe5W8PfLtmGmefH0M5DFXzxb0IGTRL
	Y5xNnlPri6OpN0wIpPmzqFVo5+zm3TyrgSVDqb98RnzD41ruqb4ydf+S5BObqqqT
	TKn3a7paA9lVJ7lN54zPvd8L0zdR+rbLj8KaO4Ku41TQLRZWZt86NJSRWmAtjrtE
	BpYra0wNN7oMBjsxKKC4So3Jq0DqtuCAu8C1qI4MpFAD++MCuLwWCvDJRCSAcSco
	uYrlIKNt5i19KJ9Sq0/oYBdyI6Hp/zRUp98/zYoCcdHehDYf072nJBsCnS19smRm
	mjFi0WI9KToK9GKz5hh5A8lqkEHLI/ScJANbRgMOeRpUMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5t0ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so879298485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115417; x=1793720217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
        b=D3zoIteI8Zxp2hhZkJybjSaegnYJ0VkmQB2s5K1nTl+dCLhjQOL6cuX3swzB6RdHQg
         qrn4OV+yaK0bfulKGPtXEqMox2Za9TqeWbvi3NEEY9LIUPcwnsp/0Byz7XDblpyBeQVH
         QpzPv2A/HvVCLcPXoHYvmWf6X//ZAiRDlhCAbC1BGS1sJIoYatLXVuT07dEuhOUVypR3
         HuS+8H7suM/YEnZbXj87Ca/eKnWJ4cBAPzyZ0NB+Uv1pF26Dga27VxwN45TVxzPrddXF
         ayYtCMTrk0vpDggdRgqMybNBt/rE7UvtuWBywMAblJTC7hr6UU5SNu4Q7Tal5ZyOIxxs
         y4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115417; x=1793720217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
        b=QjgtD9bpgMc76U+cgupw6jl3KlKypqA/Ikc6+gagpeE77v9DJxtVx977hEU1dnF9Pk
         AjyJ24FcVPAq4/sVi/kBUh4+kxmcbNp2fYrm5v+ytscEnRcKccefQ/N9hiPPnVn8hkvC
         3Fv005eN7544CPGYu6ywQkX8fvdBKyKuQQ2NSX4LdL/cJK585VnTA6lGs6W9sNdPbv+E
         NnhWjfT4btVNTMf/NmS92/TmoEHgDfZJ30sw8r9CXPh/ypek7VdzXjekC6giY5/C7iJV
         hjozSPqlLTAumciSgseJebkHJhP4qzGdBDvEMlup0wfeNeoByek9jQx3RCLuqqmmocWS
         fMdA==
X-Gm-Message-State: AFq9FYIX6ncCsqVi3QE6JaFLe2fK5lJVvWsk1jiAWzGZtt8HqIMSHEoZ
	eN59NLtcfC6fqgIUByYq0UeORaKwHkYg+cz2VSZhD/X367FDFosUUdpvgPRVeDwPFkNrWA2aGGs
	RTz2+lz1j6KG1T6IQ2zo1EQajyNrVircz3qDfZ1qPNXv31wSsK7uBfD1iMPL/Kx0NycRI
X-Gm-Gg: AYBFou3lLsZaZ7A93QkKg1LIvFvBtU1eMk+IzbTOvfcXLciv23FMIg0ydMIQ6uYMVnt
	T4IzS2RNkKuFL9tDCYwmS/k/zNfq79U8MOoH1cBXVTXOPveaANDbs71sSIamNPISfANGvR4Qd88
	Rh7ZDHW+vFwSR16deR+wOZm0CIjGMPnH8E2hubtzuC0zAC/ffEg/BDLqNlh0BKVGHNBPKa1/M4z
	rEZPdHzmOSWxobY8H2+mE9czlfr0vClswLAi+MAlQnoRtK+Bw/3k2nVXUHoqUYU/mweyCBkeb32
	B8+2vjjDkICC7ko1O0lC+eFJvTBhzzV8BYCWblAGh6T2GVAAORhSgrLaVkcZ/kNBuu5Pcb+IPxI
	AI4cFpbvxndXurh/Q
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1636863685a.23.1793115416355;
        Tue, 27 Oct 2026 08:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1636856985a.23.1793115415707;
        Tue, 27 Oct 2026 08:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm710704095e9.1.2026.10.27.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:36:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:36:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to
 glymur-qcb.dtsi
Message-ID: <rnpi6fidshkbol62qbvaofx6sg2w2w6bakt556gzxfjhjl56ej@cibls2wr7tzd>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfXz4oNSUEkFWUs
 8jq0HWeF3z+fGcmAkqTeYegfx5OvdXaBYQSu4tu/7BFmuPtj2jloFlork77aZesULUy4YHbrIN0
 GNRJLMAkqJacxiTPr8DE455bhUwYDuc=
X-Proofpoint-ORIG-GUID: ZS144BLqwh4aM2lB4E27cZzGzp-nMfm9
X-Proofpoint-GUID: ZS144BLqwh4aM2lB4E27cZzGzp-nMfm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX/ZRCVhpavphs
 WhlGFxyYOIqqZz0+0KMnwQyeIfjnwjIwWr7l370mh3vRYjPkLf6tBCD+f/fNNcC0etLHctmV8Dt
 dPvuxxp54l25Str4i9tCawjA9BRxWioNnW1GRONG8UaPGmx/GrIO7Qs3F4KvereXpZPJVEwgrQY
 o9I9G+CIhkChTq55BqNn2w0MdUcQXuu7PSwnVvTVcDA4KZzvnlhRtFYrFuho3fekHgIekd9HO5T
 mXLUMTNO9hczRS6U03tMhwLs3SWpOR+ChAWZ+lydBY30ujxDmoLvHqbyNV+eHxBfps/zaDru25L
 DdQoRmJ6ojWaYijZTPCzWSnx2tELR0KxskDtY94eCaEuDx8uLrATO7+3Kw+SBGzKEgnJg7YiUQL
 gpxKbP77nK0S8pr22bbSZWTMVty25JRel1qmyenAnKjRMHUFXRIC2uiZb93kdjyTBh8OmOdx+1D
 GekGAqsDKBVJtkv0pFw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0c519 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SizAbxo_vVgsq06u93wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270062

On 26-10-27 17:19:54, Sivansh Gupta wrote:
> Glymur QCB and Mahua QCB both share common nodes as they use the same
> underlying board.
> Move all common nodes to glymur-qcb.dtsi file to allow for reuse.
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
