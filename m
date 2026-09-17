Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F926158B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657920; cv=none; b=iSWRB/s6ZFmVlo8EyfYgtVeekRZTBDdLX8GLGs4wiSf8zwjRrQhkKohNGHbBNWNQQTyY/2LDSSuSarbteSiiDHo7Y1YWh+wBSKePRpPfq+Ngz655olrQm3s2VwzjRk/x1bC1oL6+fzgt+ow1mz5dSlAE5yjQBbh7P2lAqUslgKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657920; c=relaxed/simple;
	bh=0gsclMCHcuOmrwzDH/JSLwc8gzWae+HvKvf4zt/xVeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtVvf+ssxAsGYE1ekv/oJjpfw9/zdd7KH6GW8kJrzGCkWvtuKR41Z12fiz8lw4jC3MLVsUzFXLyYmhWVPgZeZUbb0XS00leuinRKeQOCSboSfdEAXDvufnzQzH+UbiegpFl2Lwy6+KLN/vvxRE31AegSkqkQQE1bPCd9vTostBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4UxmfcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3YGi/Fp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4UxmfcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3YGi/Fp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj39b2777138
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HH/QhDPO8yKfe0CEjILireN9
	JNd79C76sE8RnbUnsVo=; b=Q4UxmfcSDfFGvNpxA9Qxn0hKBZwtAkenBc8jV8i5
	q4ZgKiOyNOyJSwV+Zt1NsnsUthCoijEO5swCsTsYhHnF/1H4nORiHQMdWAXvqtjq
	RJHHPXOZYSWl/xsPQgQ0NrfZu9rs2CBWWWstzCuRQseuBx3fNW+/JQjvC/1tOrzs
	EQtngha7Fy2Sf0rDkibuagviuaKR+8pO/dd0JeaP3Gq5+51EFeDN8XRXDY+8Hkd+
	A2w4LGLb+zeiyUOzelaVKE8BSAnD/uDMywf3n7HM36c5NZEw3UByc1SO4P6F+QaL
	2jdlpMCaBAzAJji+mqBWrH0Z0y5KZBsECs8wa2YXC/kC1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m3619-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so180587185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657907; x=1790262707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HH/QhDPO8yKfe0CEjILireN9JNd79C76sE8RnbUnsVo=;
        b=S3YGi/FpgdL0ug1ghSAC5kQmeER3Yr2KSreOw/gddkJdufLql63Brj1U+o/Is5DQUV
         vrO4c4rt4UWOzOB63a/9sCsGMGPHOxcGrDgyGVwPeq8Xl6asl8fxxsOfpcgfiXKLj0Sl
         LWjk1IGaOcXSS1vjZoDH9rKbzRiHopKC9trD8r63MDbDHOWNd1ODEIODiI4gXEDsPy/O
         AlG0okhruKw6U+r2otGdbl7dNasi2B3E1eE2UepARN6GnAfaR5TQbWP6Ps7pmgeiL7Ii
         D4gh1FqVhxd5acholus2SbYVLtHTHynLUjWkWc8Xb5Ng7cJA1FBU53dzLytm9quFfU6A
         54GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657907; x=1790262707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH/QhDPO8yKfe0CEjILireN9JNd79C76sE8RnbUnsVo=;
        b=nktGvwZi1Q2dka3GkWJ2+n6C/Gp0LxDk+a/Z9pyT+OaxY0MHDhMnriDWUEoeMU3wfm
         W+L7kAQe/rQUCBU2MWqdCKWR2BMnPcALbLb8uuSbL7kWsbLYWf9TfuWd66c9diDz5IvR
         4t0KCNCN8ZXzYRSD7ZgLdSEWshRrQ23xlPKs47adWOOOWAtCdA3Lsvoonoz7ssXvA27N
         zuqSXgtnJY9ceqwiFJBDydOzZX4cnG/dKfP6L8DijTy60e1wwMqDFhJAtIisJClgOHWi
         iY6qUh3wDx9dlPKa7ObmR6bBBArEPngYEp0BB138ZukdcmrVgbDDYfJbjAOVdgLro7yp
         fgfg==
X-Forwarded-Encrypted: i=1; AKwUvBwcbMupW2HABBHgaMx+Dz1BpALdL/CB2N48HeSbtrEtjD8kpMSdvmPEifUj8XUs5wmNCIxqM8KstnDUFlkS@vger.kernel.org
X-Gm-Message-State: AFuF++lcI5MrUCINolCsN6P8RdJnO7+Yd9jMGryuLU7uzVmdR0886sPP
	ei2CW4InRspY+LMlgLVR8KELGw28josNd90G5Exgax+ZFIPmq64X7o6yG55e1dDMXBQqoFs8U9W
	7pLRbcuxdLsEymcQNNQk4a5iMsCZsaDPPTPoqaj/DmY67VwBHEvFM6oWHJg+WqIpq0EkQ
X-Gm-Gg: AYBFou2OKtsUy5EwtOq5wTH2CJulMBb32eRlx55jQFf1mkBIjwlDVavvaN/FE5+/qGh
	ViJSwKsBDqls2jxNPhTX2RNjK8V5crOoRGHMGqWtBxpyW7yjFWryDjb3KXrDFYoYjN4rS3KjQKo
	AG+aaDSkG3H9iPZ3Dh53MH9zjfA10hxPGw8w6i5fz5T7Sf5dKX59KhDNAYhPpRIJKrxVGfAfZYl
	fg/XaJnjsFAVzJnRKmxjgj8RjeZTFegafOdjHtYGfrGgR6U6cN8NDBywWvJCYtbE3e77/xMdMb/
	u8Wd2XUogX+E8Hbxvj+KNGRtB5qC2iC4+D3JlBm8lUS4a5gAsqYqhQkb4UzTcl+ut7dKLpl+buw
	glGvXK0toEMIWkA==
X-Received: by 2002:a05:620a:2788:b0:939:46d7:4b4e with SMTP id af79cd13be357-93bb76ba947mr1386315385a.7.1789657907141;
        Thu, 17 Sep 2026 08:11:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:939:46d7:4b4e with SMTP id af79cd13be357-93bb76ba947mr1386305985a.7.1789657906429;
        Thu, 17 Sep 2026 08:11:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm18004156f8f.1.2026.09.17.08.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:45 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 03/15] arm64: dts: qcom: qcs404: Move PCIe phy and
 GPIOs to root port node
Message-ID: <j2ib2y6zr2uagqsyhy5miuma2hpnk2h57yqtkese4rsq4pj7sw@flcypjnbcdpx>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac0334 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8_PYM96I-U3LCp_vJc8K4yq6SheiuDB-
X-Proofpoint-ORIG-GUID: 8_PYM96I-U3LCp_vJc8K4yq6SheiuDB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX8xGy1yRZ4yVj
 NBKaEKU7Yh4qMtXF7PGH+l/g/KeAL+hA/3ICHJPUQbxv1p6eWbN9LNVfCxIccmnAsLXtPxfaRAs
 BnnCoxcvoNDUBZHanQ47u0MUv507EdFZ5b+EyNjdA3d60f5v9lTd2cDrEjJcXgf4CitVuYtmURb
 J2+hgxsPLRn5DlIQmVlYNz0mB6Gh0aVZHJlGXMmjI1Xmbmd2q/n3xbVNvhBGvLuoNw15ueaX8vM
 lz9tWcwXiS6tr+M6h6pM3qNrhRmoPafv6VW2MCbpZeLDhjCM34lEfds2WiEpXx/KxL9me5G93V5
 HXwFEuEjQBj5jDj5NQewSfnWDrF3x1nksIlMRu49EVPYerm2OaCUlDFlSOhmZdYWNNN83cj5MGj
 dt3kICw35xOchvE6KqqKyhZ/sCSvGm8MzauajWA8VFrY94m+ffnVkMRv8f8OgIpgAm/WuJ2eeXq
 K7wwcT9aeBkBpCIe2rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX4OcpBs6HpHsC
 T5H0pJlnRYWIF1Cbs5k6hpWn60cm2hrWrq8B4XhfpL2AErGu0hsm7SPn3vOIZHuoT5twit+7sBP
 mhMMfvONHsVfSZ9Z1PjN3SYPMR16MD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170214

On 26-09-17 17:55:17, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys and phy-names from the controller to pcie0_port0,
> adding a label to this node to allow board-level overrides. Move
> perst-gpios from the &pcie controller override to &pcie0_port0 in
> the board file, renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
