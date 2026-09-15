Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BF3B42C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466847; cv=none; b=cnv7d+QtOCuN0KyXBACqeh4Xi8xgBWCt7Uhr1qwjHbqhjfbRhWv0gYfkHymFOEb/z97TDHRS3GJFsT2kJ/Z5M5wIS8MWpeQiH6cdcoA93P7ZhtaFT9iBD3f4cVUXOiFgWl3jl7Jry7DnUrd21nFsj2gDmYUnF332mZJv9kREEO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466847; c=relaxed/simple;
	bh=4NnZjRUVu99jrye7JSnlXRWibjbFKRH+qPd28f/19NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyMA65yrXx4WfNQgq4tRtfbWOt+55IVTikSLXRC4YDYv2X+XVDm+BVLCGUalBoEnmc+t78lfBE9otuEOsrzU1Pl8lAxgduMxfNbCdTjjvY+v/fNFKNPu3/PY1IAQdHNAgWVDrrP2QVmR+zk8g7qPiS387xq82Ow0s6WiVGH1cB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lE/29OMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTumisXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lE/29OMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTumisXo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h2uW2086716
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3EbqVKyJgeeUxy7u+OCjzBW8
	J7ZxQ/YgQrTIGyxwn48=; b=lE/29OMhEPt3agAAaN8lLVkbwNf01c+u0lthDPyM
	AqgGh3wVAtqo7cZLNpikX2kl6WKRSnSdxyWrFxoEfSH4T03FebAp5QMMVAjitqv6
	9Sj43gD97f7HSkf2Wu1IZazRNPp6cMjhv1/4mHPwSS3bLrxvqa5j/PtFbng6QjBX
	WFBFUPcEmhIa9mJpSgURN2fNfkLNlDXXYO7Zz/tzXGtiV9giXjYlRJxr39O8pVPg
	y31MNYFsQGPQkaDchmw0LSc6kSZgXLl4b+a16VEzqbpZ+7OAHmO3pHXHDlkG0dg/
	r3UoEL3N0IBDhewa/BIPfwcVNiRSEm8Br7CKdu+rji7ifA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8rpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:07:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f248907fso335778085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466844; x=1790071644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EbqVKyJgeeUxy7u+OCjzBW8J7ZxQ/YgQrTIGyxwn48=;
        b=jTumisXoUtQWR91YaPP9tMVXEnR52ha4fCcMlbGPIzkRBbd+iiXhbVvDXO/xIvGkfl
         eDQhLKUdpCo5SwOEyn9RmAxEnZ91xCp3RfRHYcNvpAY+cUC2yDJLyYalfr0foIJCRPZ4
         EEE6V+/gl+JJohTKMrJOiN3SBc1B8oUVIyE88SCoXes49gGsiFQofcX7Xq4ftM0LGP21
         2ic3Bjwj280N4dNWwgMc4FTkrhRUt3rYNIi5ZKMKhbIAl9nD8C9Cy1TvPlSqVSss1WcA
         GKsY1mUXNnx72bX9Uh+PH5gCFIHWzvnmFPttZsbfuc0n9TSgRK8pcIKFq5nCtdKdlfO4
         h66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466844; x=1790071644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EbqVKyJgeeUxy7u+OCjzBW8J7ZxQ/YgQrTIGyxwn48=;
        b=s3Cf+bykz0WwXWnPnPnxry+wqy/HcTZURTuflqIkRkMlOPjqlWFj2pF6VHRYFKF4lq
         YDmoDZhMYQGc6z86O+3N9KyGasj2FHotk8+kQYTUUN+OXgT07SytgjkGbZFyJuuaG7hr
         r4/5wZhZzLNkTI2iIQT2BeYchknp3e56SonINDAX73o+4MxCHKKN9Yjw3B+cOnY9EWNU
         HbY4wsNwEAqsB31Pu4qJAWwbOthqSi32nhNEBoFuQK3VeGmpEcT6XOyudfyJ1v0okHfG
         MSgaoWKX0alS/9FOG3vSwAXhaI0pE9bybAWoWkXV22CwOpqxpS64u01sTUovHP4ODZZi
         IpLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9gw0+XU3a1DoxuPPjAPNZm6OF78Bg7jBJX/aOunhtqF+d2p0QcLTVSOW84XsVuYv2EE9eMYHgso7a8rd3@vger.kernel.org
X-Gm-Message-State: AFuF++m+rbHw+nDJeUK9dZI4XT7zn+QMHXfwgNpyh7fDulhXReA+Qwu0
	oepzu3Ky0ypfd7PKQrS/VaZzhhfnBuuqsM9OVZV+8hGfBbi+HNkXxpAx79JA7R9VjDU29MXxA7l
	+iDp7Aj9tO3DCOjFbBVR4eI0ajvxF2qB0Y4H7ro9zd2v9AlW2udFkD8HY2BfffCYtAulb
X-Gm-Gg: AYBFou38IpufDn2RkSMadSbzE0PbLpv7f7nH87nyEKE6wbkdimmj6y1mPQRuDGY8yYy
	fsjHqrDcGBvNZjOoea73jXPpI2dsg6O77Ucpkeotrqu5UxHws1tCDbGaeXq1kpgstRSEe9NClkh
	P1z1HHkHfQqwvwW2PCSEprnkhafTBqJNG03tZFWzkL2ybGTGITdD1Yui/+EzoFQdbdH+bV3Tf7z
	/jZB4eMQgjGCIWdrZKVhWleeFWXjZOMqEMNRCrJ4oZkG9tieaExzFUSvdUFRFAuVAz/bYyQ6yR0
	MmHPlSkizT1Cos4eUN5NmYQ9lOwSA8yUSy66bEvspQCZXaiX9tjN7cuKPjZb8TNpfH8/ecCgZFs
	WJrbwISlfiLqJ9w==
X-Received: by 2002:a05:620a:2590:b0:939:6b87:9a62 with SMTP id af79cd13be357-93a408436e8mr8789385a.38.1789466843780;
        Tue, 15 Sep 2026 03:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:939:6b87:9a62 with SMTP id af79cd13be357-93a408436e8mr8783885a.38.1789466843115;
        Tue, 15 Sep 2026 03:07:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm34316561f8f.5.2026.09.15.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:07:22 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:07:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangtian.zhu@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
Message-ID: <bmv3w3mp7mmi677dtdhi4rec4w4gjelv2pnkj54alsonjnfety@osd3cydvceee>
References: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfXx79G/ZZYuldj
 UL72qesKatkF2zvXdKg4mjQkzcbWIf6BqS45X2HKZNRg2TBcomiGlrfhWiJg3Sw+cqN6LCxiISi
 YzNAHVEV/y6pPFl18eKCQMmL0y8j+R0=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa918dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RqneG4JXFb1X426U38MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PowNCZiDt7zzhO8wVDD3Hm3X1SphQFtl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX91oFQitg8bIG
 BspWRh0SdOhvGyx94DmZvFd/K5pAkvFb+LWTIx5S3fxM4i3rlGockwRfGA2tTvkZVKI4TTVPqqh
 x2spuVkLm28TK14DE63sloBrKpuU/oudzBhq8LGF0EWbJxncVCBCBuNkuc8DE7zKv//A/Si1SFn
 CqRyKQ8vnR9GNdtJzx/0Xriup5UFD13057SxosRZ/zqeI2kzNFp6whKoQAqr9WB/AkGZTtrgJ/t
 g1HspPwBF4q5mx/sfRpQYqgvK3sg1Nsl8BYgWutG/kqxVpPumCfhuw5Gv23MBrooDkoOHjDYKzc
 hguuu0NrvS4rwmBU2QoMaOtnIBn1kVCChTs14hqmkMxejGt9fGQOHBEQVOAb1t/MepBYI1cgO1j
 MccArEBJsD6t0sLomjcEkIFI54pQiLR4RRR4CSIk8tj0BKvGMQk2tPey316J4ndfs3Qdo8SbLqA
 NdTcD/kQxgMClbxprQg==
X-Proofpoint-GUID: PowNCZiDt7zzhO8wVDD3Hm3X1SphQFtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150145

On 26-09-15 06:50:20, Hongcheng Zhang wrote:
> The QCS6490-based RB3 Gen 2 Industrial Kit cannot wake from suspend via
> PCIe Wake-on-WLAN.
> 
> Add the wake-gpios property to the PCIe port so the WLAN wake signal is
> propagated as a system wakeup source.
> 
> Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
