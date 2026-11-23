Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462806;
	b=qARK8bDz6SHG/Jor9JWkpABn9jqjP9N+kNGhqapA2WFkAtB2AJqgz9DajLjOwuDdxwep
	 TRPan5M52jpxRitkmXsqQ9juG5DSQd6tM3Sh4HUlTfUYrRR/gCWApIR2Xc/jznFPAomJX
	 QC+rnIZkxAYpxf0+c48A6VsxwdZIIjzc3epLupPo37oRunPD0HjLllEArc9HSA8fanW2F
	 6AGg+4pRDFaa12RyxMg33lSXPr8RQ9cKngcpdOFF2EAYVUEgsYaB/bb6rkMuHxI/UlDXR
	 5xY3pd7+laPKYwbsx5HA6AM23ePj5pZjzZWGRdyYyeTvN9MfAApu1D+zU0FwsqZvOrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
	b=C4zZ3w1j8iEOkuw2KAH1X/mM4/lJcUDzJW18ElsvBnbvaZB0ohKD4JHuPzr1sqhOdKiG
	 8jEqsSZEHOeZFkOniwvE/BwTXD9A7ient5uFNEYdl0P+D0zKMr3IR+fh5goAR1oIMgTOL
	 MP67kfyRXkqnYQ7aqllMj0OPnzObYpssSKv491FlH4tjZLiajEtHJiWxq8CRjHLwXplpg
	 hUwEzQdtal9oxpf7WIi/kI+/zlfqqt6COrxenOasauBTrRPdzWzO6V/iCpF4WYbmLpKDO
	 n2/jHp18+paXOIvIM5F09OEk9evEbivfldg53v3l/vWCyCQBEdjgWy6X20IjGhwro1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+OAvNQl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80344606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80344606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+OAvNQl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGv3I846669
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbTovhPnqtGY+9gis5cd+giQ
	qlIKSt7958zVNJnBgFo=; b=WSf8nLaxYf+BtiJytkdELMlLjzY4U8uDC4sNk2Ia
	R8UENZ7x3KeRV1NFPsgOMV8/o177s801pff3P9uSxgLjXM1daAGoAl2SNuzvCFJ0
	RcnxYbplrZ1rWcPEBMxbJXUFcBVqi8iBX8FD9VmNJCyB2MLRDTxs3pqT7xIpW7Fj
	CQlbtV1BQLewbM3+DleoXMV7pzKGjMn3BzFJ2HwwMf8kwn0l5RCr+Hvjpo94o406
	Q34fI1SdJg3aYlHiobthbcMgJY4czgF9t9Jc9F9GpJq2K06gVnmveaxGd9dqBgbJ
	H0tzJ9iQxpr0o8MfffMphYr/zL5pRJqQKQ56AhP2ChLhng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74362c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so574697385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462804; x=1796067604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=g+OAvNQl9e4ZriSsBURE4ZaFJUZ8VpQf6q4nDj8dRlp1jeePasFlozK2oFL03fE1Gd
         KU4lr9gL5KNRAbkKbW0OoGST84R+X+c6fjlGti7ccyMaK717ygnEG5CI8j6bkzYIkgcs
         H53iygXWVf2wL+LxUrRYAyU3x8J4J1LYjCln8WjCDYOmw0DfemWmxaeSw5MiPDbTgks+
         T3xR0QsUX0XnWNpXmvV2Iff1R7zYgxQIdo66V1PlUdNm5KBfLxPHdrVyqaqPERaKfN8F
         Svb6bhjSQJDLkH4w0vGmvmEyEVqQYuI3D6CNh6rF6QAakybs/e7YMKzjC0x1Ggr7jt/X
         UL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462804; x=1796067604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=rWIENf9RM+ZNoEkFwfF5w40gWskNBWkzr4PF5YSRKE7iqjV0ueTet34od7rmGii8Ht
         TSWZUZz5azUtYT0Xo/Lj5tnUymMI9o8dzFCjfNXstWzgraaz5MH1UzaN5Nzb30CQghTe
         oFz/At8dPc/+rwLaY/vixBmSKPuSWlXTIbhRNMt0/FBL5dER6ACbroIvJJrfMqt9kExQ
         RCDFfM3Ew68Q4xqnMLtRnbmb57yI7Gv+Bu4hMQkM/J+zxrmvRnJ670/ZByZkg45IBi1C
         o0WhU18BiucecQU82+f3PrO6sZiYjx2O8+hC37UeHIWznGk2GfdzaEDwvEO3UB6pk5SZ
         Q+0A==
X-Forwarded-Encrypted: i=1; AL+hErGkppMzUVesvpKCLR2pBCSrsmiH1KlI3P++7FNEuMKk3+HKF4uQEk2/i7MCkiW2YUQRXONy9FzjZXNOkOGp@vger.kernel.org
X-Gm-Message-State: APuU4Z8xYCSpn0D+Wt1qU8x2EvkIWMkzCYsC87B0rCg3oyXmTK6o8ZHD
	GOEuAxKtAbB5cVRybwKjuQVh6QZ1raFScGieclbCoqMki/iPnqUIyaeKZVVX2P1p+ua7aGP0GD8
	mw8etbbqUSry02I3yVuWbUlJmrKqCRMy7CoZ4v2YYt7rIWzjoFxDj1VXYKIMYx5WFJ7Gh
X-Gm-Gg: AZFdTZc76fS1hI93DJI0yrlzgAKxArqBC2aEunyimu1FNvxorM0nr+yhpyNagQqj/t2
	vN2btsoZduxIy2pYePO2EtNZ83HlE7Df5+AF8yxiwmWryVMsRFsQU58o4UViO1qOLT9qERx8rwc
	8oOqeVW1dSlQEq0J82+mKOd8Bc3saC44XQQubl7aqjjqMOmqCatXoPflICNogm84Z73zdFxg28e
	mnpjxtiL6bkHvX34MBRpGHnTJ2YbH8vGfgopuT+8nww+Ho9V2ecm2YftyVS5jdFnuXwUknFnpYD
	BPC3KckEdarW3J9HoxhhAIefJ2Vr5SaZrxcC/cT3sqDXj/rmu2IkeSwOyT6i5HXywUpWnuRIi+E
	v5W5Ssz263STG5dn/q0xMUP39CZaphQo3d21u8AJvCBOhLO8CKUQahnoEdG1F+P+W
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970759585a.23.1795462803366;
        Mon, 23 Nov 2026 11:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970752185a.23.1795462802646;
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm19966670f8f.46.2026.11.23.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:00 +0200
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
Subject: Re: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <rybbgcckx5s2gqnzqya3kc3kbsqvyp5qqwd6ct4cl6dre75fgu@jxlgzjkork3v>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: bnM8SK8UoVchVFB7GiDdt8javOyG9vQR
X-Proofpoint-ORIG-GUID: bnM8SK8UoVchVFB7GiDdt8javOyG9vQR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX7MbKBiM5YbRy
 7OPwbQ73WMb9dzLNjxl3Fwh7ctNesciQINiDE8G0jArAwKuwACSkQozhzMkwoMqpYasvTSFtk+k
 ieL+om31khCd64FqIifMA6xLSLYWFjI=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049694 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1L5Fs8CdhlNCfOXFGWoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/sb5pKlxhS2R
 +zRh8vxvQH10KXAGGZQ5vNpmLqSG5TVv/o8FTx8tmlamhZB3AsEi4VqkTJtEHtxLjZDmgH2gebq
 qF7cKt7+o+eejPwzYvBqxI5jcwD8KIQVbEys1XP1nE7H1vawe9YGiQKwScJpyrfwuYkITs4h13n
 XxroeALdy9lHwqxPAK57DM1fs0h2yqXkkk/ffcDHIGT1WOo1pkSTq/VGc+k27inpbWjHcvKhRbb
 GKnHXfJnU7jRU7jfvLO0YYHz3ANOPFvgpatTJCUyiPAps+WuEtYi1rTJNLhjJ3Ofi9wKf5V+pvZ
 /913nGbm1kugCL8u+QYE11AGMExwRq+EAAI6SslrMDdnMo3T+Kge1YGkfLVrI0mabBYnSId2Y1W
 1bSgiAjeGvagRUSERX0sgs22pquphhwvsUaH4Ontz/YbNYTb7ELuqdEHiE3eFLk4ERfZFarPAhX
 MlDloaTShl8bz4AqSlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:39, Bibek Kumar Patro wrote:
> On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
