Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A63559F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209953; cv=none; b=r/xzlTZO9ittXZ+FZr4NL5/VIOCXKA+p6Fhc/7je83TJNu/LIxFaAfCcoThU5AyxvFLKw9slYUH4BDuYizNvB5VnKtikRIV/q3NY6ZhN3N8QeVCeXExHp2GCj9s+2Jd+XCqujyFAyul3Fe0FjwL5jvrmboOJMy7bmY2YWQIz8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209953; c=relaxed/simple;
	bh=bCXGjWi5LlOngO80iwagJ8zX+TSFi9S8VmyazHbhnKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hK6ngLRC8agNtUiZNaA1gHTZl3PpUPAVRJ9gedVKnwdSrsJJnQbTtpio7qiDGsAag5ja12u80+/Kg/ZyNkIZG/YuQqGEVmCuyktkKFcIsrImsiNy6gy9ozq7ksDh+JYpQ7I/T1dZWcNTFiu9o9PRrwafazC4zC89RTlqbZXjDz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx0sAT1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ih5qwNgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx0sAT1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ih5qwNgQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3adsc1527550
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VY/3sYKxiON
	Ek9GFgTcEt+X7e4JTM8jLCswGmQC8o7Q=; b=Hx0sAT1LdLFwTviAm1onAf1EJQL
	HJRtSkflnyU+0BszRHbbEWzb8MfzArKpgDgAUCTKS26MeCjQXfrAlWOqe4HNtZN9
	U8NQVI27GOb7aE6wwKwIqb+VvUafouPAaz70ybkqHcMbq2zk5TKDQv5/nPWOn2fN
	brSulzy/afvavdIo0YFfE7owF1kAFfTucJxWpwlHpLycxghMVbrOKC5ISLwQ0LBS
	14FI/QC4hzdx0MRiBt6VU4qLNPGGyTvTs8pOrxwETo1vKHOtS5KTia7aLm3QDHyl
	gzdIjavFWWnntisNx81VgqdBQHxzc2wEt85U2tMNOe8NP3qCBoDWMtGrVbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8a6c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:39:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so92158a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785209950; x=1785814750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VY/3sYKxiONEk9GFgTcEt+X7e4JTM8jLCswGmQC8o7Q=;
        b=ih5qwNgQb8jAh/QJaY7Y4w3aWzEoNmL4fHBsCLO9HopRyVwkZCih1sExVrzIpKp2zu
         pumhMKE+eqNaP7VhkNl3DVvK+LjYYJ9nRnmPLF4of4SoynplMi0xUeiFfvc5EbMV3v7Y
         hJAeix9mRMpqKn3wc0PnCVYPLk+5o8ND9SxQMDxP1wdiSnDcfIVTknb+DJ8e4FjSPl6L
         fHiaf0btOtIovJutT7ZCw7Yqa6mt0ndsktHqCAFpvpwUPMv1ruGXA8sh1y9/QP1A1ZhI
         y5LcWE+05f0OysAvrtDIfsNkT+dduCDMHnWEtTPp8jwg1A1gxjN0FUNoRQUfblEeX/aI
         gxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785209950; x=1785814750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VY/3sYKxiONEk9GFgTcEt+X7e4JTM8jLCswGmQC8o7Q=;
        b=eGfQPwl0hEA9LWfuP88DrGZoz4YutgxkgczVmkcSEquyFzZxJVR3+J9Og/TDbsVDeK
         7PhjPXDC9V5B8ItWHDCsIVotPV8pavKQNS8GgIR85Ph9V441uOF2xy716pTxyfn6MLa8
         59yo8wQQfmGAxRV0puRSDOfX1sYSdFezYBZLsf2ANqH4G0Yw79f+n7wiUrkKR/APtVrY
         WkbahaJgxC8y2RYQUjbuS5xLPTrOmwvG5Pnz2uZGWszV3zwzrGzKYNHQ+ATRWZ1wv8Px
         0+xGJzq3q94mWphHXIf+oJYaoR2V6b3sluhtTO1eoDes0dFFnPLOKJsExwWdQKcLgFIr
         ckxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtSsEvYpb/Gay5kYAbV1dvGPwQ1Z+jvW3gX1ouMRWmo7IDcPajePhSJaAntgkQmdtWy2EHPY6VHn3ESpz9@vger.kernel.org
X-Gm-Message-State: AOJu0YwFD1qPPj0SifhJmkjWLGN2H2iMZ/zJZfNe0OLrJiPTgw4J8wQI
	KFT9M8KnC6AeUh7ZEhTn+U7/MdK/9U/V7g6WFiCO7qbDb8DvZeZdQcKzjU2mhRwgIexqb4F3i32
	vg9K3WAT+3v8/T7yWO8WQZDNAweEjNWG0fAC9FJG5b3s+JaSKznd/w4MJh3HZ3NGvVj2S
X-Gm-Gg: AR+sD10ya+JK6K5yFzSS/xS97Qih0oShehT7uq8vsjvARbEoKiKEjqMvvNebU7faoie
	MDGkbdc63KdoAlXQzUZYQoMsDgiLsc50OczNCPWw7fccJkhLwPcCnHYDETC7dUFXFIfjyREG+0o
	QVcO2HkwOJrziADEETyPvtZh2eRpviw7B5zWGMYODw7aJtDXypOE2aFMOx8frgy26pJ2an2fLbE
	d3MtdcJy2md2bDAb1vsMmB486GV8enL8eLQ/tvxeiuo6GwyK4YwqUHxmOhH3YX0Mo80a+U82WW7
	+R1csJRQu4s5yh5lQ/8mCXcJqXm367LLShAVsQdxL7nqDgViQd4G1Ub8JQbYfP4/HS50mMJXb+P
	zeFSYqvcHccrB/wfh+iv3kR+/PutcIX/m7Mho82ycI/Gatr0o9fc=
X-Received: by 2002:a17:90b:4a10:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38f6a394458mr1063401a91.4.1785209949957;
        Mon, 27 Jul 2026 20:39:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38f6a394458mr1063362a91.4.1785209949558;
        Mon, 27 Jul 2026 20:39:09 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm55782385c88.5.2026.07.27.20.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 20:39:09 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: wei.deng@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Tue, 28 Jul 2026 09:09:03 +0530
Message-Id: <20260728033903.2803187-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: 274b0878-3b12-459a-8b0f-350d51347ac0@oss.qualcomm.com
References: 274b0878-3b12-459a-8b0f-350d51347ac0@oss.qualcomm.com
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfXw2QhpvHglCTU
 JiVlGzDF8ri5oCC6qx/dOQoyb7IAUzoL7ivLYohLiHn6Fe6FmbrfhIsWMJXmV0ETn3Z382/wdos
 1ps878prYRFIJKiqHanmWbzTfjipmOu1WHrTOugHk1XI/MehxSPC5YG0BtxqgGOdJMe0SSpEgvi
 LB07ZURvq/KP+3AOmo6b7vzxtqfvjlwdwiLRGgfr7w4dT4Wu7xr3pkWFGw1ZE86P3KWGSfioSvy
 QfyN1FkprWMX3bWAFeLdPQUitG7Fd54Dc/EaQ87cnO4WcOD8K7CGQsxfkPCVcKR5btLnwztd6Te
 2IhABVPDUvhzLJQ+oxY5WE7jl7aot4t0/6T+Zlh1Ek/VFvFUSj1zZbwQk6PltC5ng/IH7Cp13oj
 CaFvC7SQwcymFTFgb8ZfBNDYCChKQMQVdb58jQBpb0uJeMPXUnQyP97utfCS0DoNqsI7cg5lhcj
 GxsAPURK9Bl0inycIlw==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68245e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Jekrlv1qWwMfjMpu9MMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZTnm4Hu3DQGT_oZP6_AXvNcr5uw1vpG4
X-Proofpoint-GUID: ZTnm4Hu3DQGT_oZP6_AXvNcr5uw1vpG4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX6lnl7Qgcm/8Q
 SpPRdRBuIMgVi3mEvYo0o0tE4U+yYngtV9E1hm7H5Z9E5SKbjzTij7d08BgdMGkfAq8IiKmWIwz
 v+NXmQouB6Eyiz+aq6bLrLYuUry1xWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

Hi Konrad,

On Mon, 27 Jul 2026 16:43:50 +0200, Konrad Dybcio wrote:
> On 7/27/26 4:16 PM, Wei Deng wrote:
> > @@ -644,6 +701,12 @@ &pcie1_phy {
> >  &pcieport0 {
> >  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > +
> > +	port {
> > +		pcieport0_ep: endpoint {
> > +			remote-endpoint = <&m2_e_pcie_ep>;
> > +		};
> > +	};
> 
> This should be defined in the SoC DTSI.
> 
> >  };
> >  
> >  &pcieport1 {
> > @@ -923,3 +986,13 @@ &usb_2_hsphy {
> >  
> >  	status = "okay";
> >  };
> > +
> > +&uart2 {
> > +	status = "okay";
> > +
> > +	port {
> > +		uart2_ep: endpoint {
> > +			remote-endpoint = <&m2_e_uart_ep>;
> > +		};
> > +	};
> 
> On a second thought, it would be logical to move this over there
> as well
> 
> Konrad

The concern I have with moving these to monaco.dtsi is that other
boards sharing the same DTSI (e.g. qcs8300-ride.dts) don't have an
M.2 connector. Adding port/endpoint nodes in the SoC DTSI would
create dangling endpoints on those boards.

The lemans-evk series followed the board-level approach (endpoint
defined in lemans-evk.dts) and was accepted by Bjorn. Would you
prefer a different approach for monaco, or is keeping it in the
EVK DTS acceptable here as well?

-- 
Best Regards,
Wei Deng
