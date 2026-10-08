Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5887346A600
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453718; cv=none; b=DLri6TXN9BACkJLP8nNEEkajH3HOMazHRvfTxEqG9S10oTSsuvIJmEpiyei09CXw6evJH/mjhmmKaBzl+vYTBWF+edOmkSx/1ySwOJD3Myy0JOIgVtg4Q0qjrGbmPtriW0yjNMbpQwpJQklVzEPqihxMuYqiTkvuyAGQ/PjBtYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453718; c=relaxed/simple;
	bh=qFCsdSQW397R9Ktz9vdlbi1oo/pS+Wpq4m2m9dcs11U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE3c/zov0bZTrGf2IEXrMSHsRdep6WX4kSZmgy/cC/ISgbnrNsJhvWfxo+89ZD1E7w1l1vLCpdL1p0rA9ACGYTsIcvEuBcUOM00cmPY5pMjt0Da4NFSLTnZiQX+zdPbqQQP5QTf98f+ZQk70ZI52xSi3B832JFYGGzebCYj112w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsOkRHdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6F+GbmK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsOkRHdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6F+GbmK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KL792166952
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 10:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=; b=QsOkRHdDPkA+Y5nS
	siVFpuFDnoXKuViRwbpRTcGfcmiX3oAcjLCz6WOhUbH5vhAo20a6EShgJWIk+XZL
	3xIFt7LtCeDosJOpXH1Rv0l/2H+06m4A6t8nc0DCKHm3zE0tbe0SKS6qhpUUqyGm
	8TC5EEo58Oj6QkEKO+s5a/OEgBarEhEpkd62B0elOvS+FtzUGqYhwTlpEL5yteq3
	r6f40tq7wIouESC4PRyWDTz/VOr9MOu+7HWVskTAnaQDPGf4OORJRTRu7q/rTOoa
	yjkU3RQpyxqaJoxcgEwU9mkgmvZ2VJEpqWLFsiBA3GLh8fD/VXplFBndJxSdIgvz
	6qrmuQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tf10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:01:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0869f3578so1534267a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453715; x=1792058515; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=;
        b=H6F+GbmKIBaeYi4uh5DJxgH2MRfRZxOpmn/w3+0nqh3uII1lh9piISkPDEBjewkEt6
         kW3nuE4XcoCXaFHlfzrqkEpPhBmw3IXyOjym1mCtVOIPhHgTgZMvAS0QTykp/qyMAGew
         sxW05z58WdOkXpQUbgZKutKYGG1vyMpFr1d7pqNScdlkIS0NEwTsAXjOOaA0K6aTj8au
         qJEXZH34Gy2UcaQ7lPMaFbkW2o9nf4NTojicOcdeKvm/Zdl8eYmeQsHSJ1nIwYQw0ErS
         6hE8hW7m9DrYCb5Xfr5cHar78ihU2uYHE6kYutQtBfUWkNEWILiZeh7jQ8HCL/EIEFy8
         0W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453715; x=1792058515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=;
        b=tt6/V7rKMBRo9DU6UneJcGi3Tq1VU7A6aPT2xVnZJp5VJq/Bk/XKrN/ynGkvZ4MEYs
         Xl5a4ZLU7+56uytiEAy9Rj6kBUiolbaPci3XzjauOh8HNyNx5pZOFu+F+gQwEijoMUv1
         bYhsg2pHmHD7FMaL/bmfUL5r+UkDKJuYdMnccUzsaaZ7/kON8aPj4UJyoHpKPU63fncs
         xgz7ctlQzv5hziP1moEWzqXo6KryxqKrDsitxdP78kPiXIJLdG/YtPcbI+fIAAYfXCTK
         rNkfdBEOQyyhyUZi4cViYNVf3eje3RwF/j6njMArIbOAMbELdkNkSPlBKwskC4Ckvb0U
         IUvw==
X-Forwarded-Encrypted: i=1; AKwUvBy7yI7ZYPZa9t1aco/Y0+TO65iqOJCJ3vXJzAmV/COozCf7FVjcwQU4P8hZZ34YTy0Yyi1y3fkTOBPtyKx0@vger.kernel.org
X-Gm-Message-State: AFuF++kWaafKgKN78dAeNUw6UzOLYkjIUHYQBsjqNE9XNbtz7M+oo7NE
	czC2vjBQ2GINRnmRNfjx3KuWz2DzCu2a4mN8eBaU9CL6hfnlEVqGD+uTRwsRDEAb8VngTyHy0+1
	0u7+0VwovQCZX0Ric7n69N37Ykm3mwrEUpDCqiDHinxQvjVtXEebABG6oIGTeQhS4sbmq7PBEyT
	eI
X-Gm-Gg: AYBFou1F4gWpDwpJwRA0TXEQoS8Nyfsy+WTrvFJ2DDSq3Ure1i/A9esK2VxgM/LqRL8
	feOn7SrtxI46gPH1BbNC797S1rEMhgE7SFsCT8sLqcZLpGMHsM9OYy2z+QlXEtCfxS3DDokGzMa
	uJ2TtCsrbCy22dsGdklfONJYIuZtbBvkS8+n8sLFJ2eSHuCqFP3LWRlmAWcT7BYOkYnY27DcE+c
	8clf9yDkgf0B5+WAMvfBFaSETB34DShN59fL25Pa/uDU1AYx2yf48GIjpK3jHrJX/wejhIreGxD
	l8LMmUXkNff6vt750pEroJm/6odrPlGrsB/DYbPLSmdrUZDQdQ5pBBDUltpmvF+jWC8ifc18P2u
	dZRo+j7oFve2gjKIpe+4ieOT+rAzW
X-Received: by 2002:a05:6a21:1fc8:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e13402bfddmr4304754637.21.1791453714284;
        Thu, 08 Oct 2026 03:01:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc8:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e13402bfddmr4304723637.21.1791453713795;
        Thu, 08 Oct 2026 03:01:53 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a572b40asm2767231a12.4.2026.10.08.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:01:53 -0700 (PDT)
Date: Thu, 8 Oct 2026 15:31:46 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Add off timing constraints
 for vreg_l8a
Message-ID: <sd5bnurq3dkbljmuqtchnyeh2c2l7yh44yqfzwcdo2zxmzpy77@gst6dma3lzet>
References: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>
 <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76a14 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PunQk5y5dTRi1mTC4k4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: -WJY0rgmls00YfJSU9Qr8J0zt0OZf0Rh
X-Proofpoint-ORIG-GUID: -WJY0rgmls00YfJSU9Qr8J0zt0OZf0Rh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfXxrhLAI7jEPxd
 0w+KlO+14OaMkta/DAo/ihCSsKAcqdd8B8APOy/acWHOpqvU691QXCRq+Nf3PXcM8d8cRus+F2w
 he5zaOh8uOkYaFPSV3XtbYIArhxOavo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX5y7vAASi4OX9
 gHJyOAj8hFsKyPdLEMDmywmGvJQwng4U8sCB6beHv+5LLkk8pEZsctnzPDGnfIiej5TlCjMGf2b
 j5/I8CUHGcffV+Uxo1wg21eRFwxakKbrimYDkq67qvCA/W5U8BUA24P99FuOcOYdyB81XobLt2c
 kPShE+nDhQEVUzZj6KQMAgGll2a9D51c8FzKM4NV31zuVb4VGK5JUWrKfks6J1HAIJjBvr8TrHz
 Tf7WGbHRzAixubh/LDDr0BN0Xw2ZkI/Uj4Y4KM3uISx1+LOLLE5y8Cdl5fJCWy9PiE23FSyrsKY
 BvtWrOuzwA5R4vHo/1T3iSveIge4sRG8br9FSwA8NMId5Oi+cFQv08hFJBDYkW6dohW3dNfKkgS
 p3EKPKmaZfRsegNkZINJ82ycHl3pDqAbBC0WQHucZ969YGwrsSmL2H7W9olMgaFMRMgIYvrG2gV
 RKYA5W1iC9QBDoGGwLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Wed, Oct 07, 2026 at 11:36:00AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Oct 01, 2026 at 06:37:53PM +0530, Jishnu Prakash wrote:
> > UFS on the Monaco EVK can fail to initialize after probe deferral when
> > vreg_l8a is re-enabled before the supply has fully stabilized. This is
> > caused by the increased discharge and recharge time introduced by
> > additional board-level capacitance in the shared power supply design.
> > 
> > Add the hardware-required off-on-delay and enable-ramp-delay for
> > vreg_l8a to ensure proper power sequencing and reliable UFS
> > initialization across re-probe scenarios.
> > 
> > Additionally, set qcom,regulator-off-debounce-delay-us so that quick
> > disable/enable bounces across probe-defer retries don't power-cycle
> > the rail in hardware at all, rather than needing to wait out the full
> > off-on delay on every retry.
> > 
> 
> This last sentence gives me the impression that we only need
> 'qcom,regulator-off-debounce-delay-us' and not the other two delays.

We will need the other two as well, for the case where the reprobe happens just
after the debounce time has expired and regulator framework has applied OFF,
and now if the request for ON comes even before 10ms, it will be applied
immediately.

eg - UFS driver requested regulator off at t=0ms, the OFF request will not be
applied till t=15ms, however, if the re-probe happens at t=16ms, there will be
only 1ms between the application of the OFF (t=15ms) and ON (t=16ms). So we
need all the 3 properties, the `qcom,regulator-off-debounce-delay-us` just
ensures that we avoid frequent off/on.

Regards,
Kamal

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
