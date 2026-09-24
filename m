Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B23AF676
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249199; cv=none; b=USVU/OZHU6dZOQnCt/f2unliur964jpNUccJaK9x7Rci96h8WntN2nK8cpzjVOHybtfgGn5TeNmHORNSuC2xk2eZSHcLAG2ZhSsaH3t5ebfppAMu3qpzKDAj+/VEKBU5B9PTYkj3Xpaxrq4JVfHOHWuzewawvBpVbCWWQtQ7g0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249199; c=relaxed/simple;
	bh=/Z4vt1sZisFgwjFGYsD9AMj45o0OCyK5HsXd0f02nLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpKBCYhUgL0acMQoPTmMEC1XJZAJqjCR6pSvZ6eP4puLbs3j0KtAePStOBVwhbe+sXlm7OgpAsPPIXT1jyjGmNtQVr9t07lXyRP3TI//D9+PswjjOnB8R3Htpmfa8vCg/OMMDpOHvnwXrKqOw0OK1GKRLBWzVex3z8Thwif1Z/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkBIMPC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HG2UBLX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkBIMPC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HG2UBLX3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3VtZ538576
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FluhcHGj0zIp1x+edRPk4zsy
	7sg7V/Dwe/xU2mNaGds=; b=AkBIMPC+1zH+THqOWrcUCGvrePQlvAlO4pQNpOXw
	tkfe+wZRkODxGtd8j6PUorWR9Y1Q2sAhhEsSMGZlys5cW/2Ge8Grs/qZ3Wsh/8li
	Xe2bTXAR64ddOMXEQvRKXTqIu/AVs1On1Ug/2hloN3MgeB4tgmWxLop8dK54UpRv
	KPwxnC5jihh9eVK2vzorg4MFHeaf7O/qFV0v/EM/PAZ85GHtt8FY+XVJIVG8NayA
	Hl84iiZz7t43RK6D3vfczzEma/CALHnAKk5gz27yC223Lt9e+y48tF/VttYDJeAC
	oCXzr3b/TaTxXCDRKMuk9irJsE+3XkyHKZqjvLy0og8zTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8a59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:26:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so238248785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249196; x=1790853996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FluhcHGj0zIp1x+edRPk4zsy7sg7V/Dwe/xU2mNaGds=;
        b=HG2UBLX34rg0fm1cCC2xEMOWPF2aMU9T1LG3VPORV9+z8wg2in/L2xK57dfOIjuYED
         jKX37UQLuh/xjSCrgq4zU8e+dMprGJzIJUddmhfawIutSICxB4Hecz5CuFAKxvt8Crx0
         e1ncXLwLFpAybjStOOBkU3GNtSBzm9kSXsOedgrxrn51NrFGYSPlgF3nk6KuZ+V1In5V
         oEbq5b+txsPcTF0MIVfQgiegbHvDp6rx0kl2zpEJL2vMDFbSZyq2YRDNLRLIrr3/AoOf
         pV9Bv7U2b3WVpFBOMiF7P89wTdGd6/s22sQ7mHv2xlLl/SDkLg1JU4xWfo7Gs2d1mAxa
         2GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249196; x=1790853996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FluhcHGj0zIp1x+edRPk4zsy7sg7V/Dwe/xU2mNaGds=;
        b=Gn4OoCPEKqWq5C28VDdDSou5GJWc/dhbXVskkjGfK7jsMcSGhPj46XHCkWeeEjRxVt
         QsP+y85tWu/knzN7QF0CToVFknTHBwGGbceH7kOuPIZdabIWOne3UcUFlJfaF3VVDlSm
         Tk6HNCdQGnsVf26LRQW7nnLuK1OjC8/2b97W7tbTWcyHunTSoxx4Bni06PsYRhhTugCl
         z883HOfZTvmedoDi+VDvBJ3EVg4N6Lmk80fHH5faRjqxZj6I7b6woSnhlQO4JCW6ziKU
         2k0rc0g+18o1kmnbtM2/dW5rFMAlcOjE27PLbGTPzXw9IOMCDzBLyqci3km1FkrTN+pZ
         XkZA==
X-Forwarded-Encrypted: i=1; AKwUvBwSrEj+7iEM7bBk4zvCc6uO+MBuHJbXd8mq25sGRqRKMUB4M6234hmqKQxJ9EFWCrcEDjHthdbpA9z7yqbu@vger.kernel.org
X-Gm-Message-State: AFuF++n8WL1IVQAOuVPG1PtKRheWYeNvFPvkawSRc6jqZb3q3NJAwlH8
	DQ8lVcwUfuskRqzkEaDUOAOnLf5hPBeIlFIQK/5MgU3v24cWa9cmL9u8cdFRrjAmF0/PqZbFNmS
	tsVt73ENGhFjvOQIrazfleyVtxloNf+BUCahg98TtCf2conzUBgjvyE9BqO3wW6H48vS+
X-Gm-Gg: AYBFou3Te+par/iQtMmnVvxXm4+iWXJCHv77VXlX2DOV1r5JkJgvYV8KHLE1djFsD9D
	ylMvlc3rD+LeJOlCAYIbthOhwOdggI3wkZjnaIZYof9X73pOvNpj5/kaD5bxhMoegbuiDQz/Ik0
	cjsobJiBzoHh0F9VAwif5g5DL1uL7hqc5GFhuV5+M9Z1eOeiHcBP4tgJzHaNg7wsL7qk6od5lob
	VjmxDswjJqXH+iR7UL9ry1XQwmnTlEtlCFUFBXtPqtbnmvK4hz00HtobQKl8mSN5pMzLQZrpkj+
	DhglgOKczgNTqk8shDrkazN/CBdC9hSDxlRKUhkUD565hqRKZmFBkxZVsQrDHyxvEP3rzfsUGrT
	UKsQyDJ62bx2aZ+U=
X-Received: by 2002:a05:620a:2b47:b0:93b:d79a:c45e with SMTP id af79cd13be357-93c364444a3mr217393485a.54.1790249196009;
        Thu, 24 Sep 2026 04:26:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93b:d79a:c45e with SMTP id af79cd13be357-93c364444a3mr217389385a.54.1790249195463;
        Thu, 24 Sep 2026 04:26:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cbd134sm62001975e9.9.2026.09.24.04.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:26:34 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:26:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <4klth6c664hafslo567luio5cx3t47moupzsowsqpcoskmqrob@35jaicyn3kbs>
References: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: A000aCdOqEEZ2TiOz-2h6Yl5eqR8FB1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX+J547VdisbK6
 iMD91tBw+msI67dtkURgB7HvcmWxUgQFwKRo0+noIK0e+DqIrzyVGAbVE002VTTbzox1aazILrz
 CmyP/mf6TApehcK0/Hod/PdbLE1EENH6KSQvwS2tc2zBVY+9LKFSLwA4XmpFk5ioyxdrqlUTxtO
 US+XHmWiMjsD0mc1cUi/Iy/ZI08dYwzsBwuhynr7l5anxqWhbDrxkrlDwjcQ6r4++d2fv5pfeMN
 H4ptRi9KfxuVtG7CBUo77YjgWqfispALacFmzG6t3Dq3KzxRPUpdzU3U3wnD/h/1SuHj5CnwWYl
 Liuoj7Y9rON21vlk256R00qWmMqlGcigfD/GYTzqY5Z25VTLb5JvS/8DJD2f412bizkPt1lgj04
 pIgQW24011naIapxifY0sSAFbqi+/V0K6jvC3bPrAGTE0YUlUCYlM7odpG/l+0/5PIiWjM8nVxb
 CMQQjkq6WnLf1N+hXvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX7gj1RdLqbq2S
 AlC/DTJ5+pWTo4wA+uT7gAIRJr9mJuB+K4X37LMc+pYg6OkLZtzjp6EBOr6kUBy9vPdWTz9oRqs
 WlF3HtDKZFdnTCknRO0n9Q3mcdbvAVU=
X-Proofpoint-ORIG-GUID: A000aCdOqEEZ2TiOz-2h6Yl5eqR8FB1m
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab508ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NnZct687kdiKRUGfDC8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240047

On 26-09-24 17:44:48, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
