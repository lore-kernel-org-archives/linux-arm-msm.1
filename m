Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303857;
	b=ykHgyQnE/y7N6fcmx+lFmrFktetjxTe4tC6PYefHI8SENyNGLhBaX2blrsRFz4105v3r
	 6mwx5xGbD5QUCR1jiccjNxx7D6kv8zN+qufR3Tg+O3CZDvkZiHkcc95J5Yt9bVkLKuKyk
	 +eru27SkmdRzVSFRV74IVIHD5P1M5bbrc+pCci1XPAKiPQGYQc5GvjvrFVeHN+IlviGjD
	 Wy9ox7xepvNY8SpydUYWim7gytH7WB11/QdWsIP+MunIhCHWcQ4lns8ymerj39TuJYFyg
	 DLM4ZI4Z3ylycJ64xJ8hQeXt8uqRJVFa44EkukQL6EbfT4riIwKzpKT2NSpJY55avvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
	b=iPfxdq30ZcogvQ3dG0+rPFCz3uo+jTHXwWefMDKMGuPWdKNc+WrXj+uaMxbPqqzgYq0T
	 bc8djaDRfekPTApCK0neWxpluyRUBC8KTy1rLSGJ7qtN+1XqX0snFc9Hq1XAM/7KkWcKD
	 UG4mBpJCwNkNTBl9MrqHnwxbykhhrTInWAahZnTGFCSo9Q2cNOSKW7E29JyesKFseILMV
	 3ddDITZNxqoMyTTd8GFFLgDnRChRBNxXHD5hLPTtAMkhfnYpXxFTVTqdEqW3BdVbJHl3p
	 x9OLbgJ6QJVoQxnGn7W2X2i9IqCt/5I1gObIlcFDm7duiOC19yC8KNqRKenEhr+4ZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjd+j2qw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ExnC+ub0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B560A3809
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32B560A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjd+j2qw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ExnC+ub0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lARn3392466
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vdE+aUoRB/9Y/tI/sh5Vrl8D
	Hxfhl/imM7gAR4Jqcas=; b=pjd+j2qwJdJcrbj9o5ABpubS50+2iHpAbx3QsZq8
	1d2q2RlRBJEalsu7/HxcengRpag67otltjJSK22LY8SMKYNSUjyauL2DwFqfQ/VR
	JHUD1XggUxctF9Ue66MR5KmKJZYek+E0FT8E2mzeo6hymyiVb2vgWrkxfVN9dwOD
	kfSoj68eSxlq4q03h8UC435RyP5nL9F3Z5mZ2f+KBIszvhuqd+rF+Ngn7ifcZwie
	b5HiGZIsiHW/K055LFDaYdYJx3D7MgG2T39wyMvnhas2Y/hIZi3HXEdbwG8t26Xh
	VNqKEGK2deI+3jDHFAFXGVGYdja/mEvAbbSmH++F2jnwPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg2v1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:44:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so347529085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303855; x=1794908655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
        b=ExnC+ub0gDBNjFNvvuucx/wqJORHedq/2U0LIedg0lOUny7obvlfT1SMJLLE+a/XmA
         TIqO6YvVTWpKuxM26rqihYpQV3cB//9wz1izwIESSowsIFFXC+6Pfq4ug1YzDy6WIY6F
         f8qkLHp+0qsAUkPfEH6z+NZW+nn1G/+nw/qKXLeanEosZtw3nXnjdHiP+WxdJcjdjMdm
         3AOMBVhAXsm6FpYzpBJ8Cm4p8rfNtFe+o/bsCpkhR9EHGYt0temCodg5swwlZLguAEkL
         Z+e/vP6T6nxFeESAbIth0fAZRz8aGjsXG5OMvDH9gu02YG54T2ceDGtjY4SLNyk1qGF7
         YtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303855; x=1794908655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
        b=eO3Ri88Do9mN3iIQtGxcttKgMWbuUwWndIrb72cVTmz6M/2p7nw7cXHllK16q+SvMQ
         ibPqN17qb47CBZkR7uxjaqSgeX7eSK2XM2AOr8xQqhN9bH3wzeXn0ko57R1nDVY5pzqU
         QOq9K/B59D+BpPPwyRX5uNQ9SuRHh9YCHrl2It2QSIkdDJu98xAcmiXqQOUhRPNXL13A
         T4GnPoz5NlCRH7vv0QqCVCly5Rsvoq2AvYtiBU6Z2olz2CkINA2/8SqqVcqN1QZlHpEe
         P6BNpA6fVYsO2LrxuV+H9m3sME91Rh+SIxeG+RcDuFetlo9619g8oi+ii0eF3FdiIaTD
         aSrg==
X-Forwarded-Encrypted: i=1; AL+hErFjIebgPnEVuQVWniUX/BVsb+MkWh6a4WkpSWweGfWAoYoWDi6tI/jWnMAdLzrY+Ma/Wkq2WE13v34BivFI@vger.kernel.org
X-Gm-Message-State: APuU4Z/G/PLCgVhaDCR9MI1cZSn7/ScNWiEtOGo6DC2+N8/E7HNQSNg2
	zdGwenQifrV+j+d4wLp8nvfLqrVLCqHBMsufEJh5GUuhOgnv6YfwclWQWBIJiX6Y33PfI5QBx9v
	cU7bCZTc7jPveYh8mQ8l7fnBgzsaUsSlNKM3F/QyLoeG0NmWGlxsWolLfcSMFdLUaDGwq
X-Gm-Gg: AYBFou2wEBjgojBTyA5cihtTHXN8bUatZwxq8CnrlLcrzPCDajdxswa9/7qg4Gc3Pyn
	wd4R+ZqcylovdH0h7FLUvW9r4h55eKLiLd1UF4XOs5YQ10VDRehkHnM0U9egsL52wptjj8ddgA5
	J+Y9BTS84NZqmjQj4mlQAxTNCraSIPAbgGVv/wg2YDhtbNm0oeAMhS6XdyI6D7SnyWVB4wZGf+H
	Fep4DhtwdImyMba+iTtgKyZbaJLtMO5KLzuRBvUPfVBIFiMeDB3K26U7IL0fcabko7uTbkgIrYB
	WaR9L7CEsLVEleJSg/OhCm/9qCgPNBu94G96bnTS2a8NSSB60jdpgPzB+VrM8PMbwpJvFdGRFPH
	/8tEa6pG/J1uZBGE+CiVwWSKz2ia4VQpu1HO9W4B1NCK5dnJyAPjwzpS35cTGCnt7
X-Received: by 2002:a05:620a:31a9:b0:944:6ad:1b7f with SMTP id af79cd13be357-9479f22a764mr306204985a.32.1794303854733;
        Tue, 10 Nov 2026 01:44:14 -0800 (PST)
X-Received: by 2002:a05:620a:31a9:b0:944:6ad:1b7f with SMTP id af79cd13be357-9479f22a764mr306202385a.32.1794303854177;
        Tue, 10 Nov 2026 01:44:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm60996725e9.6.2026.11.10.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:44:13 -0800 (PST)
Date: Tue, 10 Nov 2026 11:44:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Message-ID: <3drlpt2ox56togk6tf3bkejsmznfujgutkpzd7t7zimhvgiu7v@g7gddlszxciy>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
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
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX2gGpTcta3K7l
 0XIwBZ0Z36+L1gcNsFH8+4JIu3AiTTkUjl7P4EUlnVVeGff7j+G3jhSedsU2/woMNBkkhmkB6fL
 KelxbD88LbdBobAtWnePjaat14xWzdI/ZOZ4Ho8KqB2ZLEFTzsgaptb2O6eiyCavwu+Opc4hPXT
 ZAee7w1nlWKlwAaLqBNPOoBw75zvZe38LcAVzN/qMNs4TnxMJAyz0as7nkdzw7rOT3njaUXT4VD
 D9F1/oLyqU4WoLw01Npz6B7AAdeUNw5DYnRZhSMq8CqrWLlpgpEDupBDpCZRPTQwae+D2QuKTpP
 yek+tTrrT23dSXZ3m5Zb6FUargWoBSS7CB/QfbKwYoTKdynodaxOXb2/UAMTRUmDoqNnOuhtG0h
 O/2Nhn6BkCCSgrWPAHayFRdmINdBNuWT0yT5nO4x8krY4TePODsZk89sA2D493LHozd29A+8e2R
 E/RAP2TGSLqSspfz6kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX+jThPBxXG1gp
 G5VEp+MqNls0NOYD23V1/rK6KAhhk4PngU635Z8OB8Rguh9X2b0O1ALxlCz7EAandwVFHEC0nPM
 ymKMzzlI6X2uwGhOoCe8ang5q1DRpjw=
X-Proofpoint-GUID: -3Dp4nNljmzr8tC9t4Rag-wLxnSKt1BR
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2e76f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p7_fsQVHwOYSS4OMyj8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -3Dp4nNljmzr8tC9t4Rag-wLxnSKt1BR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100038

On 26-11-10 09:21:18, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
> the ATB sources within its subsystem (TPDMs and other ATB masters) and
> forwards the combined stream to the system-level Aggregator TNOC. It
> carries no ATID of its own, because the Aggregator TNOC downstream in the
> path already owns the ATID.
> 
> Switch the node to "qcom,coresight-tnoc" so it is described as the
> Aggregator TNOC it is and is assigned a system trace ID. Rename the node
> to "tn" and use the "apb_pclk" clock name as required by the Aggregator
> TNOC binding.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
