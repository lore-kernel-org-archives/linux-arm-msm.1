Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462909;
	b=xhVuosfEknKjQxCDdtVvLCDM9BJND0PLHe6jac89a9LumsKGBQIBAGpjHyZIeFkbT2Cm
	 YUn/8T3wokyrN39GaGACnaMU5RQKkfdbm0qe1J5T8m7Y37RmLXrcthOga3VeIMZlVpiFr
	 HVpo21DMHqRSpF2cgEkn4hU0uBH4ZpJN/UolAgJQdAe/d4GJwyA9fSYR+bskvoCre4GTy
	 JTdt4AamMANjwhfRgSArOAEfAEVj1OYg7tL7ra7AgGfPotyDpoeQKjJV3tgQC65+uvZKh
	 G+XeHFXBdA3djZBvLmSP68Zo8bEZkvHZ6qIK8x8jsDmeNaTElJzLl3ZvRK4Ve94mGRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
	b=0tlZZUrDgGYx6uKXk5Xcd/LpXZQJqbENbzQylc5BtYwsgkyfXMgYJjJvGDtG7vzIdVgz
	 MhF7IKYUM23nBp52k/r/5h7icO0RMQqws1Upf+pNiqy6OddelSPg/SqLkg3gQBJYMZTZV
	 x+46oQOeYLir+KED7xWPiTEwLovYUfDDXuYgTjg2lL35xfroujCxmV8Ge3FDnfw38zt81
	 Rz6SIKG7eCo5aoSJSDDH0s8jUhXMh71z537YYaQ8BujHoA2j3BhsR2nnrDlMqngtzldHF
	 vq7xHuv94wi7HuO4BL35v2I5LODMpfraY2bTgO1BlOYOiyVmNqr439oCOSPk4rKFs9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KS/fv4TS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E561606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E561606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KS/fv4TS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1nto3211957
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fhajorqknMVWTu/OeYgSDpH4
	HYLQIjY1Z2rYoHbqGco=; b=a1IV8A8daf95qZ2Odpglrdwrbg8g+pmFIBoDfUk1
	Q0hFEqYN75XFdqNfo6dwlXNLnzXuupGJiWHsupkEx++C6a609ZowOUiGrbl0OMw+
	+prfpJWpQqZOjBBYexySVC9ukblS8varamMvEPEeiLra1Bc6qe4McaS/VoBMJr6R
	a227v4puWMSArvQL7YtxaqByK60q22kvzZePpGbI0wRB0Y+9hCH6vmhL5r8Vxc8w
	QAVi+U6rMANRi3mpcjSXrcg6gUfgGfjaZL2WHPia4wVEI6qDoz8NoVMASTBNyd/C
	FAB6qw4wqzzbccvlfLftF8PZQNn90/71gkTIJ3qNNB43Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr5jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fcso656775585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462908; x=1796067708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=KS/fv4TSwsZZYV3TrdJVO02d8FRjg3rHLxxFtd+kRJo0rJW1kZUUJVo7+Q8L8CRNdq
         zMv35/8LGT75VOeDMfMeALfuNd690Wjtt6XamktZiFT6MPh6InnwoKeuXeKzsC64+17A
         4uZl77ymooMe6+7m1nDWuiSGBWcob+sS+K6CpzqKQxr1/43oZaCId3bjqr2YTSV9ZkZL
         ac3yumDqWSOsz3In3JcpRkTjJzqY47ylVLre0HvH2TWTTb9jFc/7EDSRFWwRrhdivBqV
         RS301le0s3QO0bk6tpW7xH4LtdTm0uvfiSiCyCO6049mXsLhINAwzHMIPNNO4S3PeF6b
         lGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462908; x=1796067708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=YYBQskqRxE8vt0pyh9aX8gBnmYtx8tKPlkCOxjJpd+lKcqvSCkmz0Oc8VqEyVHALxo
         tBcy+RjBNQINZZlFn0yR5QHTwgNS/DwJ0hn/9nGu4VLyl5a5papPT1fhYTJbtbv4n2EW
         DG/iqp4v3hCX9iDEbE3KPaupVckHkVhKyI+MQLF6ERG4Jg0gK7GZykwQ/qL5xNfMO9nS
         CFZM+rXvSyeSWjEurUfB/a2PFAvsdC2Xc8+Pe4NqsmrxcFJfirw4wFpETWbHRRDskcke
         60tv+1hPlCA/39EkWWoLJ+oXbigxmfs9YUKtUG2L7MTt37wooUQyhCeSsWTkNaquL7yK
         +rMw==
X-Forwarded-Encrypted: i=1; AL+hErHg4t3rynxZUE3mJrGJf0/pT7h8ZuOCLfImrMaXMSgxqhvSdy2q5FIq3VYCPa8ltlvC6GZjugm1SnovXJJ3@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wdx07BHXQN0BHfRQ65FUniEANXjj9SVS459Q0BHr3e0R/eH4P
	AOXKi3Zlp8wCzmrVoxAyChZXYiL/63SpF6MEa2kKBGMBrJ6mBcl4Oi2e9Vsvc08tCI5EutP75JY
	x2SuJuTog136k69k9DLoWhcOQ6A5KM54G19UABhhK2m3QigPj6zxtODEtE/X4FFQvAG0M
X-Gm-Gg: AZFdTZdPg3Ob5Zq+vRBTaTdQY73YkZTeiLNXfWtlPNa7mVfz+4Y4BpbwPFcVkRmhBBw
	Ij3UfMGXBfVvZjTy8G6kZK2hwWEH4QTzKJXJdRWPO6V0KOASRQ55luNqIFdkAE2WzEY8LFxrnd/
	2g9H8xfMpkU0Rmgj7+jjpc12BzzU7fs7P/vwWAHC4NOZv0yyGnNsK/47JjYMvXyOyqv4A7SghmG
	cEcwjl6HjgchXR8LehlXndI7iUwmU39kE05csQQ3xzIWAIJQKB6Qbec5RvkuGpDsHTO1AMk8UDE
	+6k77QaqI+LJ2pJqLI2mYsCyalEgJhQDSbOnAhQwjU2tZy5RVX03oWlehZTyrv9DuIXWcELdbQ7
	j6MSjG/FPWgWxyh8lfptsIHha+nx3cyHj14cw4u/B3uCo+BG/a3A6rEnPvBrCnN1B
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222150985a.51.1795462907710;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222144485a.51.1795462907102;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm535153725e9.11.2026.11.23.11.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <q6s4lgilunj3pikw44icbwuwq3cdlk47uw4lg7iyww6eaolzie@vaux3olznlsr>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1UrTooqjijIt
 8lX1gfRCxJiZ4JXbacRp05kjXI+OBgJk3jhhldS9ANnOLFAUYswjDIkp+nz4mxNzzMzrGHMINYu
 3APjrB/AA9vsHFgRqk5147RLzbqrKRtDKOtNecc429jv8ssAxwNq8ow88gxNjVKmIIAHsN0E6CL
 54SmIVJnTGm8q1QboRbbkaJdLfX14gCtZtBMB4x6IQSIYQJvYmysY7ZqAokcfgkwB3R0U1BKzs9
 cvpcXY7NId8UEzP81/9JPSsDW2yRvFicGFgOp62Bw9P+b3vVuJmGx8loTgU3/Bs6eZNkf98oB6S
 EcjREoKdFarXo8GkTytvqdMoH11JJCJjNn7XCp0UqLKGOpFuNfbm3IFisDpXVGTGW72juhOXGcW
 wOsIGHDyEf0kbytSm64Yd1avb3+ATvXCNQ1bdmMSwOJq6cmmdTDk0JE8Ky5sFlCYeVJ7kGeh2tx
 NN5VMNT2ao3mSRSPMpQ==
X-Proofpoint-GUID: Q6S-yuOQKVHo13vuOvk8azhADr3tw5bM
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b0496fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GtCB4xAyANLfO_zL0oUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Q6S-yuOQKVHo13vuOvk8azhADr3tw5bM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9AkaX5XIEC80
 F1bCOjoYiFnJaKEqmauDVmeZ4JlVI4lMOddL8j4n/Cg0YEMCfPeZM7uOEYp4AC2IiFu8YmmD9za
 ruXyAMkkEDQAXxui5Aue1n5bUEisX90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:46, Bibek Kumar Patro wrote:
> On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
