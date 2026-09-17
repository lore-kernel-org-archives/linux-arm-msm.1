Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006034B7A28
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658006; cv=none; b=pDdU6iHvz9/E/sLili5i2IQbkWx0DcmfVI1XyUqL4JdlIZKaz7ruSviIFcOTMC7ZjMaF000yPrI/+5PUmm8a4B2Gmk6nPv7u+0J0mpGTLMIpt/SCClDC+Jm/bVD4P/vtdZomjxtVvDsKVOz+a0XGbmnXWpgaFSosqvM9DiEESZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658006; c=relaxed/simple;
	bh=paqpoG8A4JciWm0Yi0xCGT0zRCzEjM5jx7MzwRpqNmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKg+zB9Zl/Rso/mHWifT5HJId2RLX66tdEEXooPezcUbhhawJwr58oPIBZK5UlGZ91NT8Mks/2+zRQG+c+6eLkVi520vmS97AhLrAdWDDl5p4D4GGhKRhVEUVnAsqEHrxLMVVeOWJXEgSfS5CodX0hAaRS0/wt4V+nZEOaZMwTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkRcriYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCbzL0HA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkRcriYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCbzL0HA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HF9oaZ2024586
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfrc8qw901WP9UYLMClq/rIp
	EzRNbwSdAodDRf5Hpf8=; b=EkRcriYzqIU8TIJZEBKGji2mIDGxuNhVG1o6u1pC
	3FP0pkVbN24cP2mpPIsAZNL9/PwAnxu82TIZ+9fEB+7Zrz0edMKJ1jyreiEfZMLd
	YEaslotYosKisXIARixuLvQ73Akp9Db8R65/dkyr0qHkYy1lqdmn1OQbt161d4w7
	cMAtlS3j2tlyS67GlDnpDVuORK7UQkCtMyWhD8cBDemmdpkZhtiIPH6jZ+yhyWn0
	m1cLMYWVEzrGGKM4AioaALvY1sEJNwAle2/INKCIu0D8cdmPOa9x83mxj2IV2hvA
	OhpJxWrLphAt3b1/8MEjLl1AVIjrdsOJqMmJjtWJvYR2Bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt00kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:13:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so342736085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657998; x=1790262798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfrc8qw901WP9UYLMClq/rIpEzRNbwSdAodDRf5Hpf8=;
        b=OCbzL0HAbwtCpESRyzAQODZI1oHmR+zV6z5vWUCh0W+Zgw1sTl41eUSpnkf2pe+DhS
         HxwYVv5VMxgLe7DVWEpLfpAFDanaJFxQlHyw3dERo4x10azPey0+2/D5Il39BnIPOF7M
         zqAxs4+MgftIka/om8QrevDYOpPpEpBr9tp7gHr52E3SQrq4x3fHPPwgMEoRAD/C64b/
         PhfhiHRidtRB58op5e7fZbDBRcfPMko3ArSorFB39F9bGx5UJh5VnQ7Yx/2rXOyXmJBn
         hCxfAevVnResRlgCplgcH7+9rE4GPcLiryKi4akxV7n+AB0Ot6mKru5f0pnZsP10Kqks
         1K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657998; x=1790262798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfrc8qw901WP9UYLMClq/rIpEzRNbwSdAodDRf5Hpf8=;
        b=IzEjp7HiTecnhxQVaA6zvm2GqbcuznHAPdFsFyismuSPjsaJtrfhOBvoxtj2EoGV0+
         UbWk4qytjZQ6JW2HZ42EqdF/jm2Injas9BF/mZoQo1++OKLK1/BOtIErVHAYFr+OwXgG
         f/UMBOVCPgoIzl9vs1+4f3E3+AND6eGJ3dFinvZeB8frGm+890B3BNN9RA+P49Ix7VDB
         uVfNXLSyztlvAKLtK5Oxb5lAEr9wiaP0SR/RrWETAaSNAsjS4zq0UkVRJ2qZNwT1h8xv
         sk/MOB+jW0UOxQguKRJPdw0tsdx5rTgDbfetLqLoLxSyymGs9p8dh/n9h0Yr6RgWLtxt
         TQiA==
X-Forwarded-Encrypted: i=1; AKwUvBzIsjD4NNKJbLVIf6nr63qmkUvKjuMyM9B5in2CNrgvMUl6NJF32oQZ/OIRzQHZkYk5xo0qguqOQk83wSmL@vger.kernel.org
X-Gm-Message-State: AFuF++lsvAVv7loSI9JODNzm8bAonI5A1wKwmexe/P2g/nSXcHDlz9zs
	MtLOK7KiwI1dQmTh0Bj5bxFJ1bbBaCL/G02bjv+UGZc9LKeDlj/3MngsrSwfOrKbahdKH11GPXP
	Yk1WwA5P+ZZ36FQUhy86tuP2a+qi3xS3BP7SThAqogsIaKS0HtJhrDd7p0eolx7YSEbvIsA/uLT
	/L
X-Gm-Gg: AYBFou11MISbJZn9L0zZm9psfyT8EMxq/uHZ5GQVARV2QeQZQ9x0LXER0bZ5pyN0DKP
	J9BnNCCFLIxrW22aKGK+crODgtq3KBbTG13gtdmlCkTcoISLDsHjv5/ju42TzIgmMHuTjH3nSfs
	w2lJeXC08Qax5uQOFO+F9yWvXqnshATK0OXY5AevWsziixuJWXLjQ3iq0qhoq/41DYDGo9Ogg/w
	GtnF1Gfha2er+4HIQZjGA39zf4o9ynDMSBih3coyWP4JxwsJ//4hD4uHrRkcWFRGavTqStHNWtU
	NQyCpI+dJEfy+670ypDHmajH9rYI8WhUceq+ODArGHO84YBBpQcgDoFBanN9km5SwY1xQ3nm/hy
	WXc4qD1GVFhOzyzw=
X-Received: by 2002:a05:620a:f10:b0:939:f49c:1b30 with SMTP id af79cd13be357-93bb770f35fmr1139312485a.13.1789657998385;
        Thu, 17 Sep 2026 08:13:18 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:f49c:1b30 with SMTP id af79cd13be357-93bb770f35fmr1139305585a.13.1789657997720;
        Thu, 17 Sep 2026 08:13:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm51140265e9.0.2026.09.17.08.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:16 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/15] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Message-ID: <ylxhdwgse4nkqqkeybolivgyhqyrcmitno4qm25xpdyicud6as@mtp45cpifc6i>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxMyBTYWx0ZWRfX28SbvoWyAu53
 3lXMUvD8YzOjOdCswMsQ9KKHNG2Im++MbTZ2B4RewkxStl9sl4XlI9JCyItcQo+HoeUcquZdzIy
 9UDiQR/7qOR/qhOV5V5OFMPkccsf+enKu5TtLc4BsFmCfZDSs9klMFvyLo4gCiNVfi9RDCCCiSQ
 SynmtHUV0EbtEUV0hUN7g/R2hB1kNvkfhnTzuwoYYmBlihOdMUdxkW7P7rLxLgjwD9jJFMcOR7U
 xaimtaI3nCkN6K+SUgMv4VACozJk31CESPQhtGYS3vDc4LZ1jht9w8frpkGmhiwE/XDrLhzFhhm
 0jibN0ymhEyNjBJ6tRNVmewPLoitLiXHJVaWX+jc1DJDHza5IQd4UI/xs9ZEaXcd1IyIWyIkLSS
 bjtvhf8T6UXH13yd2U9erISVVl0J9IdWZFRCzBB9RvlmOo6rksRoHcsDvxB0m1w0cPyEvkY71fq
 fvjtuD3xOIi9b/woZPA==
X-Proofpoint-GUID: ipM3nMICqMRO2wnJw1cWpwTv9zdnTv8A
X-Proofpoint-ORIG-GUID: ipM3nMICqMRO2wnJw1cWpwTv9zdnTv8A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxMyBTYWx0ZWRfX/H2zkYsAwPPC
 M8yy70mrDrHmgMDJCG6swugvohG4vfoT1gyYkLJDnzwDtno/8+S4Ftuuf8h8wdri5dgiIIHlsnp
 dZjoBHtsP9Wua1Cd0j4vbpV4oeD4KaU=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac038f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170213

On 26-09-17 17:55:19, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
