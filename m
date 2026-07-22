Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1802A34CFC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728525; cv=none; b=iSrB0JhDgLnORI0SwpcwIzkJ97eD4i2L7IoHgLjesiYQSqZv0p4CFGppB0DJe4PQMf7diujmzyyIssINMEw6Cn+0P6VO6t07A/rk69ZVGX0Kwg/Bz0T4TV1QbnayMLgAdCkGjE9ns24T8q0yq/z9G8BVi+SVzqf0xNYW7zRmT8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728525; c=relaxed/simple;
	bh=apMF4onMMKGeoyRXbjdc24RW9Ik+vI+CDP3tUozGxyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ls79GZ5Q+cEzff4QQ5OXHjvKrht/lReMzipEgyizitXwDmyPzmVAs0LqP9xmieDZRZDhVU4S7nfg67/n253SgER/xU9y5EhyuKCHa/Fs+2q1pJC2rHeSzA6B1XLJwCWjueiBf9ssouyAJbrrsQ3kqKLvfyZUydoZPcb9//22DUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuR+YL+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUhr5mL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuR+YL+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUhr5mL9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWdK4891678
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ovmlg0nl0GlPWIERCFc1imTf
	ytD2OgF+m1sgbG310T8=; b=OuR+YL+jAZzRfD8ZaJNbpC1ocuIzXYzCB/vDxXny
	LRQ5KtNaDXOTvRg/OFfGJHpGr9d2L4wGah/dWgIJeOmlGxpUGrIQ9bINFGS0ntoY
	N9PC2KtDw9WeV6bwOCLD0c8BPDso4VAtVJa2PXomcEnrQ7DrQmpU66H/ApbC4FCU
	xygG4fsU0NKlvDirM4vcd8hYYoN2IEl9fYx6nsAyr5A6muuI1hF7uTvIaCEsErsK
	HwzgCPF2Cn1ju6Xh51FfUwTmPI1Qdq3LrfkmYT4snMbC7Cqs4NH7SzmoFzhLqOgA
	kVVozlx1EbsHG9NNIuD2du99imRLxmi0LPwzTq22gcLa0Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm105mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:55:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90410c668adso257745326d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728522; x=1785333322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovmlg0nl0GlPWIERCFc1imTfytD2OgF+m1sgbG310T8=;
        b=MUhr5mL9A4y+nvp2el3mbeCOHm+eSdEdeKtJBacNShVomU1De2wG4nbW1eewO3rP7S
         NnxNJT6tFATe1oJfHXNrfm+Uy4pVh6tp45iknLmA9sF61z79z3UNXBQWGAWyGr5YaPWs
         8EUvxJMPUMbptpmtBeGIXHu3PSXRoLdBr2goGNsPx7Zqb2uZz5otqc1AvC2wjQZONDBK
         dd9CyaG4kWsZjFY2kU1k5OUNkWRcrB7NxUkQ4bPbTYy0ioZG9nURgbMRawQVTuc7a21W
         TpJeV7UeGxExOn7iaXERfA7WgQ81hYo7eOFP6JDaFKvOkZo9NShoMAb2hATtggqEpFen
         oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728522; x=1785333322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovmlg0nl0GlPWIERCFc1imTfytD2OgF+m1sgbG310T8=;
        b=fzijR5uyUXvmXuvEz/+MJADvBo7vauq+lqPefVRYN+JtaoFTjdroSHR131TiDLl1fz
         2hh3h/oyktbyVk0GzLCwj8BLEoufPMP+HHyn2piU8RKAuKzU/WDnymRJ6OkHOqjo+TOP
         B3PFIhhKidQ8/iOkSOnkVxGkiDT1wn0bFdQQy/lU5MaXLN63yWdxaoXZ7oVbPZFi4fNO
         Cf2deCkpQz/i8W4wywvvBjDKGkfJBe2jGSM3nBstypnnRdpS+Wj6hYugVQHJEJNBBYw8
         p1Neir7AhE/MfrIrCV07nch5mwWZUdAtrXGePqrdGGUrNg0PzdHkiXSXefEcvVOP1KDn
         O4wg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3tzRIAWZUydVCnzamN15TQJA3bc4elcZMOHgZT+YDw79N1v2wM58OkqsknQOpTemtVe9kPZ3RxCHGPzO1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Ou0DsR5GDJImOWGMgmdr/YRqDXNxCp11l0nzsEhrztGrkcUy
	kSP6LkWfl/k4YIQYxd9YTNJWDeVbdVOuD+7NIgqZYUvL9ldhPHV/eH4khHeQOwGPhjvFVkXNO9B
	z2zXqoWPw9mwiwkVwTd2TMCYf2SbKJajGh9nbpz9xW1wA4EFfxqCGhOLs5fZxO0xvFEHV
X-Gm-Gg: AR+sD111JwNpUtvdpQvIpdw0SI17NMkfUv9xNWbM9PTxUli5ThyNq6qYM5ZAd3rwCVH
	rf8ERHTZaZNyWOnIA3JQJcccmwOOkVSioR0eS8ZDqIeVV/mMKwNK6mRvMkVVb80+SIepl2Si8by
	ucqvkXy65EwE7kcaoItOKRTefOrpPLqCilhJTIR06rr+SYD08apozKM/p9RqS6hMqbjMqS3hIwJ
	hxa00idJxDD3jGoT6f6+pkh71+Bk1OsbNyg0ASaEPMQQeYRBu6P++r+4MG/DPoCSxk/8TA2LjS+
	xn1WwWR5B1LXkGVg0pW0DQfzRIsw2bpQH73pZOFquPdnbVlQ0mN5v5hab9MWigE6Dafqj2Mqx5g
	8uEEL1YOlLW+GQGu5zsiiiJ8qNaJ+21WvktBrOvdsQTxyUaqalvKcunXcH+4D2J8b+mLv0vKLIa
	F6GGjzDRV1jR3R7A==
X-Received: by 2002:a05:622a:1a92:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-5213c7e502fmr225487021cf.27.1784728521766;
        Wed, 22 Jul 2026 06:55:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a92:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-5213c7e502fmr225486681cf.27.1784728521326;
        Wed, 22 Jul 2026 06:55:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8bffesm526617e87.13.2026.07.22.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:55:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:55:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: add CPU OPP table with
 DDR & L3 bandwidths
Message-ID: <xyzhicfaaeq7ktgzqy2re22xbbu5il5cyjkhuroyzkxbyqfmy6@c6kkj33rd45o>
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
 <20260717-milos-cpu-opp-v2-2-428813fafd52@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-milos-cpu-opp-v2-2-428813fafd52@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfXxMcs4/2F8gpm
 gOlch8BgrWRQUmgBYgtsAVbU2Z1lohDioktOp2bojzrs6OC0ayOikJRJA19IPnOCqzFjSSNpa6L
 CIeNWqy3M5KE6cbiCGyhwUAWm1Qsa5g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfXzELWDY7hbSKs
 wHHa0L3IO2fAFWzqiVaqXYnFoIq2zPvjFzCw5BhL72aXeEKPNazTWaC4dCcROKYQ/s8VBZNH1Z4
 QOzJMowECJQNKkgBUroJRKcfP+TLlCWYlBSgpx2zgrmLWz96BjKR0SzUj2I1/lG5Ago+liFOcPk
 k0kSg/VvMFp2+BrN4wqk9bXqr1WaYA9iShwR4gIogLfdjxOYtw9ut4hlTHbkdU2qQh4NLMM90cL
 Wt5vkLdc4B15PG0JjZ5Tz3pLOE5PF7INGzSz+0UdYEgmO83La+7GePICDQQggkFvFg2IrPIJC0I
 l+7j4Ydsuc0yyHWA1wCUCvW1xTQ24O5xev9QtTsGHQv58+rHP0FroiixB81tofaq6/GieNkpuFA
 sypY3/aXLmb3MSB9+XddPLsc6OhDbuFCw/ECmVcEeqR2IZWCQo/q0RXyJe6/EslBr9EfgxXxUyA
 hTAR3O3z33DUjfDP4Sw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60cbca cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=944irSvET47UEAaLM4sA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Xp6iAOwAVC5xRxjbFzYUH8RT2-Sv5K24
X-Proofpoint-ORIG-GUID: Xp6iAOwAVC5xRxjbFzYUH8RT2-Sv5K24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220136

On Fri, Jul 17, 2026 at 03:33:04PM +0200, Luca Weiss wrote:
> Add the OSC L3 Cache controller node, interconnect entry for each CPU,
> with 2 different paths (CPU to DDR, L3 Cache from CPU to DDR interface),
> and add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
> permit scaling the DDR and L3 cache frequency by aggregating bandwidth
> requests of all CPU core with reference to the current OPP they are
> configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & l3 tables
> for each cluster type with the actual EPSS cpufreq LUT tables from
> running devices. Note, that higher frequencies than SM7635 are available
> on QCS6690, those have been added here as far as possible but may not be
> fully complete. Additional OPPs may need to be added for that SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 344 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 344 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
