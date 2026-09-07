Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8855946DFF7
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778442; cv=none; b=TYMDkUHZvEZbH6vD1K/Xl8MTJ5GuqTaU14S8uNy1jAhRGPoU4ZSjNa8rI0nmogMP8mTk0QnDXz0asNAdZYksFvW3amFds2UPStz6tVkA8x9yR2chdvJfrjMQCpoPW4Le9haa7N7ffnWunQ6o2rfzpoMX/VbxvZHUGBRKmsSaJBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778442; c=relaxed/simple;
	bh=+1Wc7z4bEfBSvdZ02UCtOfaoTFuy+lcRNDmcKFVT0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTwKsK01l0t4K+hHzQ8nZmBSLhYp5/lpAvwk4LHckcLhzMjQHGoVCjFYcgp03u211PQQO0Grdgn8G7VlxzhwyZnayyNlDYdSVCo4Py0Ay5JDoPD4u/2QprbjtYqZxQbqrgFimd6W6/mQRC6qMydzliwAwg3qGpf1kHqBCctPMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bySE4H+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyBtPgwX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bySE4H+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyBtPgwX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnQl0217657
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uprfvc4EghlP0ig/btU4Xfry
	/KEVlHsYbosyb9n5+DE=; b=bySE4H+DLt+MlBLupZyAJDyTGnm3wlgUvN6Mw0CO
	n1aRqPCaLv0AjmapKyYgdV1YTA/VXlhbanBbEmXDlcQ5eR4T4MEOwuyKkGGmLoT7
	8mkizoq6MgzB4uG7NL9zWMLqVOe8zenD1FRBwT5l4lFyODHNEmaDLzcUHVE656Ay
	X4fHb/D026mVmfo01yQKNEZgDRI5kw4fgQmmcxmB7VXgIkjFqkkL61bUVcCUootO
	jNkHRCOL/BKIwPKG2rcaC8PGb9sIHGRaD4FzLQZILJi1dpNlo/UOen/hE/rA8cKW
	/Dwra2D1M+ccmad/f4uZR3dmioIinuRzZiW7b8NrJDOrMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgewg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:53:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so640659985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778438; x=1789383238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uprfvc4EghlP0ig/btU4Xfry/KEVlHsYbosyb9n5+DE=;
        b=iyBtPgwXxPZm55Zx1iEc9ufeiwLxy37pVByoHjIMQXOPXm1jQKrf+qE9Pe/uLn/Qbq
         o6mBK1U4IA51xTSYckItWuD/strB64egton2zjMg1YjMzD97GT0kW2UBFuednKiCdN0o
         kzkdT01jwUlM5c4p0BLQLrc6bW0Xm3pOvIHBsYNgkpRanov+wJAW2UADA0gMSVX/VWPq
         KbwaoCd9V32c9lhGbDf8oecpmIkm/bZA5PxTH3Da4d/pcH6hx/aHOm82CIZBnk28Ug23
         9MkQ3nHJFiRFIL8rCBGuRjbHg9is+HXK1K//Lg2ht0FHexv2EQBhsgNbv4j/iV1nz7Ht
         vP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778438; x=1789383238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uprfvc4EghlP0ig/btU4Xfry/KEVlHsYbosyb9n5+DE=;
        b=EGMUNOeSOWtWDaVvttHVL23c8s7Re5M+jVv2qUJJYY9vAF5ee5FXnaSmaJ563WxITI
         k7uf0jn8llfyb1kB+5cvRpwB38ZuuK6D/S3zhhSTWq/ep7a8r4a/4OS6u0zhrfSW129M
         lK9Oley+GwTHkssk2qaxMfuxfrqi8Z5qU3UdG/ZfBt0bbSZ5V20/vtaQ+sLaJkTEfg+4
         UEmHpxW6ui1cmyBb1SS1UxCK/4X1EOmD6gifiWJWyvbUArtJNAiUHfGV4j2kkvZ5XFBp
         BisQph68b+E6OmYb5sVoqlF9ptGVkDMjt4pt/vGWPJuJSqMxYzjA7VTPqRKAPZ3WpSn+
         aeag==
X-Forwarded-Encrypted: i=1; AKwUvBxUWMy927wgfegogMcRLB+jhKKM8hBLdjY64VdUlz6b2F/+2Qv7Z+s0gFJJ+PCJuGaS9HkmaP5WDjR0P0iQ@vger.kernel.org
X-Gm-Message-State: AFuF++m2x0AAY5eUOU3uM+2kYopzuNCaMO7utlcWywNwT5cu/VBGSoQT
	MJSeFasOiZNbUuGZw7ueGpftwGJdVi6UXIZ2JfbEae/v6MzxAD37lAqSsnks9sm7gHi1t8V0llm
	Lv+yD203x1en6RYRs1klflCZzqBbm5AM95fJcZNfLaovEzf+qnQL/RGhEs+l/lXWgW6Xs
X-Gm-Gg: AYBFou2nwQbVrQflP+KF7Z/p8AXbTPqg1I/z/G/NKRjoDWBOOkPBFF+lMV8Vi6ed94T
	sM6t5wVKKb5Fb6R+bgleJA03YXigpUtuFLT+jfo2S+l/RCN6N///gh/7y+IgUzEoVhL9RBk367v
	E8iMOWbBoQOwUy62KuNLvHtdyTvGq9GyAr2kstxB7JtmyMEPUQgFjtfiPgUF1B0jxj+d3qEoBrc
	bWOWCciK8Ki3i7fzphKy48E6WitBL1YDhFZ7z+ljQ2BgqJWk5fuVc6yJJIcGb4PMqTUdyU1jw4f
	9q/tptMjQ4vxkwjkMC4NoN6hSBpMVYDcLdk2bAR2LIKmMpISP2ritTu4fZmfExtpe+4aI+ZL3oe
	VBdFWW2b0/GcT
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2113099885a.38.1788778437612;
        Mon, 07 Sep 2026 03:53:57 -0700 (PDT)
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2113096985a.38.1788778437055;
        Mon, 07 Sep 2026 03:53:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm28323928f8f.21.2026.09.07.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:53:54 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:53:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Drop marketing name-prefixed duplicate
 defines
Message-ID: <yz3tbk24afsqjlggktuollh2bgvdtaac72b6rmmchfx7k2r6ks@vvcotimb7zpj>
References: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXxSNlX0hgRluc
 GAAGL2j4d3C2gNA2ww9rUlhu7s6JMnrC+DqUlFCiHu5CypHx0wXrSFL/NVXB5kAwPUUs+hhjjCY
 8apoPnFl1bRUSKHIWPHTnaIaMte7TTfQASHbiB1jPw1C3gmKmqjQsiNJ2/r5NrUhQ5IQj9BvlNk
 9kcg6A5YI7pj/wpvOKxgoX7tR6mGowbf5117K3rBNy3YGbFe2qT4E+AmDqqss2ok3b1MV5ghhmM
 qBfpINmHma80q7fIjiytIogRHERuQ28bmW5CFgjofz4wxuQf0wfYe1n7Ot+eOhE8+c9U13sA9BA
 hO1H+DRPOfATZMndJrGns73xfXE8fsQc789LdwtPktsidmPlRtzq4s2ngV4qxZ0B9XWIN2i4scC
 JZo5S8b83D2TYwbDg7lBsdX+U+F03jJzr9p0QSujHVLFq8mmV9L/uF+HShv//QrGS0iB0RP/WvC
 1EYKG3CMB8cXCCojADg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX9EJdMVi5OVjQ
 U4zczJim1BfWbRzdx7SyTg6Q68GgEkYbEEjsekUcliMNpLjKB4igYIXzZOBydhAanLVgxHwQLOh
 /SdojwDoCeqve16bUAzIw2b8H+EZlC0=
X-Proofpoint-ORIG-GUID: 1qG_JJNWeOOR4J-24WBdV8t-YK1QCeo8
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e97c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pFkGdBQqtmt80OZv5sgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1qG_JJNWeOOR4J-24WBdV8t-YK1QCeo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070118

On 26-09-07 10:11:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> They are identical and of no use. Drop them and use the common MSM
> prefix.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
