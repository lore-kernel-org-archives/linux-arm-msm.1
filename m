Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343959;
	b=ZDtOUUsdSpS865GHZaBOSaXHQMRHo0ccva6rK3T5ilGTQsDJk6qQSkE16+QXmGnlykX2
	 G4UpA6dVzsjkenXU17NNXxNnW0jB3pbe0lc0c8cvQiwmP3zpmv5jde/6IdXz22bsrXLXj
	 skd6zZPyMtd5q2ncFQwgnpM6tnN3ioOv4fa/aUoIQkMy1/J1mmUeTKuiiKxqXFrGceM+1
	 frs8dNddWftSPdBfLuSztkM9OPe9XhhZzFplXeej7LYUw53ESWpLJx28dI78gL7Z6m5sL
	 uU0daQ/wwnSO8E2XP7F2t8oPJymqLvzr0p6O1zbVG2mi0xXaWIHVAFIA0c0k2XOmu+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Y0I/Z0FYtfJejArmOFuR4K5qS1v1bocoIRPDZeW1YI=;
	b=pxOpMIpZAMz5r69W05ednO3RETIxLMdrjjwwPKBYmmPKuv1MxyB9ct2TVm9RmEEAzOtl
	 qkMs2eCeIlknt6T4983YF0PAMfBUsnYs6GwfSQXPSWU04g2TMXeHOjZtYfz8+kMTjKSpx
	 apjHcLzpIe9rgcd7N/KrCv7ta42EYkfr8e2NCgrTyyyYgp9aPyb0/aPRSc4nroVFGK9Ga
	 iVqynlogWFZj1pfffIgFgIXmGSw81scOpPg3yQ3p49AKJnk8rhmZYaDrRpbZlDF4LZUdc
	 8kdVZ+1ZV0sc3OBAXPJqbKKWoINleB24AvxwaPsasbjqH2cuiJFuoNZ7jMjE4QK0RjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kqwTavLQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MieygaAw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70E606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C70E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kqwTavLQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MieygaAw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FJFZ3343515
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Y0I/Z0FYtfJejArmOFuR4K5qS1v1bocoIRPDZeW1YI=; b=kqwTavLQz1Gd/YEN
	69q1IY2GBEf83bu/DSQ4ykZCFfgUVyqVfDyAU37jmJZwtw/tDhfsoRsr6H0chOHS
	I1V9D5Kmlv1LQW+X9MMztZT/B9lhNLc5p9oTHBc7fSHye7tYHISBvfyrBxdV9uWN
	ZwTtp/3W3uh7BdJObhJg6Q8e3lqdpeTez5Cx/0krT9f8BMGDvCMN5KLBNsXU5hMM
	AREiEkS+xlEpJ4lqb6KTQHDCMjKhZjIeR1CVbUx4exoiwGLpfGiQOdJKb2rj5mwN
	AulFwtU9w4QLNSn6GYijJRZabt1+BWt8Lye+80iULmeDeGuku2N9kcVHqNHSejuk
	ZZ4nUQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751muv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:05:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so628457a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793343957; x=1793948757; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Y0I/Z0FYtfJejArmOFuR4K5qS1v1bocoIRPDZeW1YI=;
        b=MieygaAw7+L0qkNtaxEmsV36qUEowkjDUpNwoDFDGKsPeDWfOMGTVuCQfW3/BK6gH3
         mnExxqcqmUWPbT+XCAu0S4OUF+xwFwJgpSoOsX51SHH4TsmHtfu5uaAasO72kxl1xIVz
         L/fBK0W5wMiU1qYY65PJRJq1fWFZwScqY8HQHzyHALHjGPlf+ZmAktTxk4jmw2br3CfV
         6iav31uUfgT2ZA0ATUihUk9jfMb+O2Ecq2if8JL58nZVd1rsDqBO0LTHZFJTqcne6mmS
         zGkhxKLkoyo9HLJJ4T7JhxDc2tuCmpYa3q5Kq2U3Og1rRBsuiiOSb80Ntu9WG3Qz72Rv
         Vlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793343957; x=1793948757;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Y0I/Z0FYtfJejArmOFuR4K5qS1v1bocoIRPDZeW1YI=;
        b=xEfkCV5EUtWDUKsXxtMQQUC4Hr/BqYlVERZj4wCqdSSCud3ynEMYFDqgkiDbp16E39
         eAF1Pbj+iMyZWsvfLpxXPe0Yw2pKXXGeWYopwpKAeOfht3ts12pqXSSlIfChWkx/gBgg
         DZTOB4v46r4J3fRlNNdQopkGHM5gNNp/oipqQFYs0rOScmK+CQP+f/U42JH8EljZFCrl
         ZJ/5vNkM0DuF5mdbRBUzLBIzO7KJelWp7cR9pxsdi27+VudcmZIiKOO8ozDEU5ZntzDt
         flsfBpFrWDdTWkiLqN/4+HM7n1nvp4k0/v7FhG1SHf0hCdSzQeVH+JLprGQm7gktw8op
         iGxg==
X-Gm-Message-State: AFq9FYIJwnkSvD6dXXdYsf6NJqmR/wLx6EaRd23RFmNwGFB0ha5T8RDh
	TXIIiD+t+VGkbujuyJshRnNtl2x+cNNNZiDtkKHXrKudhZSogOZWAGQWdcWdJaRqK4F59V/l33h
	UCsUXhzTZLFpCV2zJDkgIOIe0hCwwCxgIzWNZ61MvtCi2MROhJwC68Ha4M7k6fLO0+nV1+NdANa
	Jl
X-Gm-Gg: AYBFou0/7VGRGjNNAI6PcZixLD9VQko3gDO/rJNrJOEc+6NOXuWWY8fEZyd648YGnOs
	YjNeGW33ROHUSvEAveBzJj1ZGAtLBUwn4hA85PRZbkDJCR/tQN3hZvT0yo8qlTeQsG+130qm7w5
	UwqdHCMG9C5Lh+4B/CTTgRV2RlLUGrGz6prozgziyMllwQGdYDNnuXvXF4ai/4jnRryB359SgTk
	9PZ/ge0XhAeiAJKIw5IrNQfYAKzL5h/VQlrpsmU5IbS8Brnxj3zm/C0tlvO1k8JXHULKloDkkYY
	Bh9mYkfsnwSWsGpizSivgQmKoKepvjXw6s/ILVy4G2kbG3uDNbLsko6NpKyfeGrqyf6zAUqDEO0
	mNz/vvZu/YXVFKGaQRTKaLTTPDeqTDhaOeZG7S40h33PdXtjk132o2UkX6wCE2IeC0k7M8XhcpK
	36UyfpkdUL9bh1PPOVCxxuKShFcoM/RdFTi7tsN88T2ontvwFL2j8rYfnVtGRslbsuaMxVd8U=
X-Received: by 2002:a17:90b:1c0a:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3ae8984f163mr1141362a91.49.1793343957401;
        Fri, 30 Oct 2026 00:05:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3ae8984f163mr1141348a91.49.1793343956862;
        Fri, 30 Oct 2026 00:05:56 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm7178964a91.15.2026.10.30.00.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:05:56 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] Commonize Glymur regulator settings for fixed
 rails
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
In-Reply-To: <af31338e-cd15-405e-9b68-e63f1f61dcd3@oss.qualcomm.com>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <af31338e-cd15-405e-9b68-e63f1f61dcd3@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:35:54 +0530
Message-Id: <179334395403.1631110.13095672015433830957.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793343955; l=2218;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=RoFRBGEJvxeaJ8SqYZFmhpkkkH3Bnl5Z0HX+FDYTr5o=;
 b=VqbrODJpsLaollQG/HTwUuhRP3yyJHE1bo6JmtJOFkiFfMm695LoqqnPf8CYNj/S7xcMP/CMA
 qST7GPXvudiBoFYKcjLfZXcqCqxekKsNKd6Lr5fTIOq1XTQrQWE6sjC
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-GUID: jAKH4tQmCdO5EpKD_8KGktQkLafSpbwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX2ObYDnfyJTFi
 iUapzJfYyWf/dzzbUfpBuaz0kLkaAqPnXc7uFonej+aPGWREXwQSHEE/HbDohhnMzenyhz8rc41
 Gui9ftdrroVhAGGDTcj5P6EJc35hcUeuNYwOWLY6bYxXs2yqQ/DNXb8ZO0GgJCDeYXiBSk3o9NT
 sysx9ux4IJKjqkNBFHo4BNSVqUnAEkVJ7nbBSLdDYJp3tvpbVTCv4ABisijiDs6E9dYYtJN1ocO
 RWauBC4xc4RLuoi5B7bIjSSPbQNSqowZLGqjoog46M9kTTj4pcVaRGQACZI5rnP4m2IhqQr9+h6
 Sr9yemlmdpNt1b2IDenfKgMRVSfAywF3YthSQKoqUVz/tgIZtI3GGEZrjtQcw6i4k7nDKJ3KDD6
 JHQ/TdtwDdJC/3dcQiTPKdQGVQ5E8iyunqBmdXhfRmGHGEJsemEJt7/20xqqWFZivRrslgOn+wg
 LJ4XzCIsSHuD0sGc5Dg==
X-Proofpoint-ORIG-GUID: jAKH4tQmCdO5EpKD_8KGktQkLafSpbwa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX8CVknwzJLMRa
 mN1iLyk8SdvZpJrNW0V/roPKGBNq3SBhlcb6qdF7EPm1W1crj77c5zGnnGMBfELdyYzx6P0QDyv
 N3aJC8pNoMtTiWp4zqMGtT0sFE8THBk=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae441d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=22ya7O5hmM2viCWIDGkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300028

On 2026-10-29 16:13 +0530, Pankaj Patil wrote:
> On 10/29/2026 1:34 AM, Konrad Dybcio wrote:
> > Certain rails are predefined and will ALWAYS have to be the same for a
> > given PMIC configuration (due to electrical and other requirements).
> > Factor these out to remove a layer of pain when creating DTs and let
> > one have a better way to reason about the settings across the platform.
> > 
> > Glymur-SiP will be the next target after/if this is accepted
> > 
> > Compile-tested only
> > 
> 
> It fails on latest next tag - next-20261028
> PCIe doesn't comeup on Glymur CRD(glymur-crd.dts), seeing multiple
> deferred probe pending: platform: wait for supplier for a lot of rsc
> regulators and other clock controllers.

Facing similar issues on Glymur QCB (glymur-qcb.dts).

> 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Konrad Dybcio (3):
> >       arm64: dts: qcom: Unify Glymur/Mahua regulator handles
> >       arm64: dts: qcom: Consolidate Glymur CoB power grid
> >       arm64: dts: qcom: glymur-crd: Drop L4F0
> > 
> >  .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 235 +-----------
> >  .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 232 ++++++------
> >  arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 310 ++++++++++++++++
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts            |  29 +-
> >  arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 395 +++++---------------
> >  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 224 +----------
> >  .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 333 +++--------------
> >  arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 330 +++--------------
> >  arch/arm64/boot/dts/qcom/mahua-crd.dts             |  29 +-
> >  .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 408 ++++-----------------
> >  arch/arm64/boot/dts/qcom/mahua.dtsi                |   2 +-
> >  11 files changed, 740 insertions(+), 1787 deletions(-)
> > ---
> > base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> > change-id: 20261028-topic-sip_cob-65df3325ed28
> > 
> > Best regards,
> > --  
> > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > 
> 
> 
> 


