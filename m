Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462858;
	b=Y2MhUq0HruPSf8RdfRPPNCjBR+D543Um/53mpTE6mkEakSes3OpLERRDRebUDVX+cjfF
	 e2GgpxJ8PCxJNQ8m6bUhkVHnqnYr/2R+OpRiDpxIOkV8lZRL3B7r4q4B/DtO27/HvCeN6
	 ctrgxuPsuRwStdTjdmlG7UoG6IIVJdbdwgZloz3PFh32sC5O9G6W9sBJQSMdjj+KWoUhJ
	 Tq0mYtO72flqTjD+Oa3pntuNyWlg7mivxXtEtHFaM+f+fx3Oe0elrJuTqmMySFt7F6kCA
	 z9pX7QnmeirEG0v7ZpYUaYdiZa3E8I3JFE/MUDZJ0k+nYbJx0nP8nM3bk0IiCSwKEog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
	b=eDZDgvIX/UQukYWR1mUUixjstLQE+o3vvvqynPNDBy8Py58z/k3FHoWsmtVnTMkqahrI
	 uTpWr5x55bfQrIXuB4T7hzRrOUoEQKwpa0lSXozSSHSzqQhFokLeWV1kdMknx1KcZQ+Au
	 f6//UDX2eYsicPatVP8rK84+DBUSnNUcbq1OAP3NaLjrT07xf8WYda92RrOcGMl3LWtrJ
	 pHVVlrXVULxekvaxDoLQGvGPVQ6X1tHullzee1wP/iHz9w78rfmaBpCO+LTDtOjQTNFZA
	 cOlg6jDVSd1p2AQwxcIrrstPfHl+A+U/KgT67QySoQEBOxvE9wPvEiPNHR81EU+1ScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bn/+2yNK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXw7mk5P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4C606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bn/+2yNK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXw7mk5P
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGrno3730267
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=shYVcCkI7WsAel14qoPcI2k2
	hO7EaXLkaVqcGNDiH2M=; b=Bn/+2yNKAWCbEFLfimFQervj6gTXuixll8020nAT
	iotFPwlivvF47lcIPwxH/WlQ+Z08mMI/Z6+PoUKgv/dh6U+T/Ee+dd9bYCPmCfR7
	kKfncRVAAaMkzYYe5xUW5UkbJ3fyuvZj8QsyEzZPW9lG7yOvhFq5tP69wgj5UvYw
	wpMhAiscc2j8PSZXoIVLpjE402kbi2lpAjYUHHvRaeO0bMWGH6bfCD1/X3G/dD9R
	r5NuxTqh+KH2xuY9jyWJvh1Clh9FQGtf4OEKaSLi6v4JEQ04uxTPX8h0YxxlVe+V
	oPCtpFZHnBp0AR69T1p7QzlVSavOI1V39/uqhLuWxHUQrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd369j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so695909485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462856; x=1796067656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
        b=IXw7mk5PRNQHqwCrFvHpfFhu8QaVoR2iAfajyoFAG16wZBjFfilZq/fTseNxaeRuv7
         EVVp6bctaasp0UOBCYfj+NmwwPvofiFeS3lCbDtAuU0TTMzS6t1yHgbWaE4HybiKKTC9
         os4E1w7amL0RL8sQP8Fu6bv007yM34WuOsyYhfQ5vu/O9ON1LL/TCDJJVKnCizTh8sK+
         kaZ/iqdY5PLEVT2uo8F5Hzq+3+U/LrlfjYGUrZqTptxRtDlKBwtUsgywnN7zvbBAHsh4
         KZrMqjrHyBDsTQINQtWwXjvbYK7wc0hDwBRHP3s95l0VZYuUBnwWJGnsme2gr7eNuZr0
         SGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462856; x=1796067656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
        b=IPnbW/1E7lXb90pYK0D902WhuptcoLM2bs7//iEXAxsMl9nx5V6s75yL2W1mrfVJIr
         0I3hjqWY5b9MEb2Bb7Xlhlo1wo4JOA8AnNy0UoeLFPxDU6nmhha6inbI/2ZwqNJHWSz3
         Wlu3YNQd2ua60vo9cn22G2T3SWwNtG38pO+iE/GmuN2yETPtEW3NHZJJF+uGqEBxr739
         Dt245yXjwN2arLryWPrCiSYxVKYcdPG2KzUmApSiOTUKImAPRnTBDGtbHF3HTHFGmqjb
         VYfoscBGL08H4f4gWn57z7uho4fCCcJfHLuKLuTz047iiLJXSkPvkU6kD4/PKhnNHHiy
         nfeg==
X-Forwarded-Encrypted: i=1; AL+hErEknaFimZR3J+pMM8auiRioZmrWHI5MoOI713RxaKaprMfq7o4TORl3j1UZMcWHFAb8g1xhNVGWOgyiw5QI@vger.kernel.org
X-Gm-Message-State: APuU4Z89rz7zx4zucNGwvQ3NAqaaPCujdYOq7rpCysrVRDcgKAGp1JgI
	VbGOKnjRhASt+WJxbuzRK1MMVDPxSgPTWDC4rJugpGfIhrUk3MaTbZStD98U3n67tkVKUo+Hkf1
	FsFbvD1Fcvki3ttt7B3W1jOcRZyZH/Fy0GGH+Z92KZUi/iXD7Tq9lPaQkopuIMWKCzQMd
X-Gm-Gg: AZFdTZcXgIRZpIib23W50AzPXnC1qq6g/0q7ri44AElEvjdXY3iGZ9WX+7TEsDWq1JG
	9ec2YVtQjQWvUUJhBbjgHlCeZ5SbFC9iCpzWTyYncq3hod8pz6NwWZ3IafpL1B8xnh8TSBkkKJ0
	azvePUqfbcrsoHck7R9PNj8Hily25XrOo/lL2dmd8VHuw7zXhiwa6PqolKmRljByaf1YVB6EUWo
	yA7YygDy8EOsxX54PMO9u2i9E4VnTYBbAIdUfrxe+FaOyNHrEEFoQiboJNldLTQfxU5axE7iEdM
	MFGno/DGmb1DOqRCnTo52PdyzA9YjhbUEpbpl4sfyybVaACDa6gqJqKhZY8+BTcBLFanG1dIBhW
	qMN3bQWsOfZJntLp5x7Qby69QRZifIZ4a0qBwHOTEeRXQ2N40fB6abEFWf7HoTodS
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr2179923485a.54.1795462856138;
        Mon, 23 Nov 2026 11:40:56 -0800 (PST)
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr2179917785a.54.1795462855516;
        Mon, 23 Nov 2026 11:40:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm511746015e9.13.2026.11.23.11.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:54 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:53 +0200
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
Subject: Re: [PATCH RESEND v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <cdf3mpbifvj56nbr54w3yc4ddshsgbbecfox2vp7vsp3bv2v6v@kjedaxblfiou>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JA9s8knEVbh4ytD5NutcvomczXdlwz3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwMtGCzJl2BDU
 A6MBLMemWh7TGGRnL+XW6u0RGkS4dqBrZBANuPE5IGgppUHVifnjli2UO6g1cnLa1yC5zpCnSFB
 xxzqSxH/VX8J8U4x/5UGEDV1x1AHuDtXKBKG0E9aWhYJYwZabcs1j89DzxKBXvzeLqrNsRfbx5Z
 Xp+wO53prEMgmrM9YY5UnqHqhAPtc7ZELTlVdEqaxP1KHJ3Anrp9+asc7ECaB0BEM/LSPhALVXl
 sVYYTRQmcIfgEcFSLCSSsFcwTeFEj5vWD7zaYMMF/PA+QBcp2jDlESN6HOkhudz5q/Qeuq15/c4
 4dqFOO2sYEseAGRD67uYylSJ1+ZdpDU12Ycw5U5fVTITIFU5APrNTcfQJyFxgx1Jay5RGHg6b1v
 aml4lkyiSD9NfYIwjIn9Q+UJmhRTkdEkTTwtkuccTVz/YD2RwOymCillhvt4ElHzot8anGdnLiP
 2ojMqWkStvf0fWqfPbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1RmdxYYzqta9
 gSBgICvwrBbKJzzzCSIlnWVvp2vufVF8JfFx1E2Z8EP2Na13EsBi1dEuEYnR7mTn++pWdCrAfsp
 ikW1fQuk2G4xjmNdT40pXX3K/uz4Oec=
X-Proofpoint-GUID: JA9s8knEVbh4ytD5NutcvomczXdlwz3D
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0496c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:42, Bibek Kumar Patro wrote:
> On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
