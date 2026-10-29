Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280562;
	b=QCzegHhxxw7jp+De7WU0XmChMmtGqqwF/eyh8sAsmgVuL49C0ZNEycJrw85fau/1x6Pa
	 jYmsN0+uLjyhB+/bSNuF/FiU94bIxTQZIgf1DEfNiQVg8cDKVz1yNwzFPb4DmRHH8RTaW
	 D6zIWuEs/LOwA4FGX5+qtkK+KwJw62g4R7wyPDHoTrt31dR/Y5PbhY345EJ2EwlgETjtm
	 QuOwvm6oc9fbg3CmnkyAFJl+ZYgqcfW/+K69H4vqbhZLFnRjG6Lqcvhhyt6i9YTnh2mk+
	 JMAtVoPvsV13nNar5BuI1Iw017vj9YWUu3f7XApYqyPldhAzIpZ7dFN4bsh2poHs8Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
	b=N6xceB6FFWxtkgFDdmZPAOchaqg9RqQ5lTkZ3wxr3g/Qaa5gRrtTD+F58twvrEUOOlnJ
	 rn0TK811zxjpGLvWGuyw99mQ33XiufLdpqdWILytu+tMD4zG+jikk+In6pJ1NLQsxT2f+
	 UKEjoZVbBioDdhIstlAjvwW8aIlsDDD0GBwQbtc0MzaHmWLDIqv1gas0KVgFgNkQKHYmQ
	 Xf2j6+YpnprsilKxn/bwjeuGQW8+7pzvUM4yscNZRQoczICAV9kBbXzLiN7ZmDoc/JnwY
	 WzQe7zkIRyg5bCv9J97dDAmeqfxdUYNCxs6vAbsWW+cIwcmBnaM70N/DLgOhhHc0LMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRuQK3BQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N4SQHm+V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1CB606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C1CB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRuQK3BQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N4SQHm+V
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe2943768233
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdNAv1DWvXXl8AhO5BI1RSsK
	l6nrZ5HKBAmEionbXos=; b=oRuQK3BQXyzkGuOzxHBHr2ppzqgCEJD9XPLxut42
	jjOCo6h0q2c2DFNDa4hevb6u7QefiUicMYsGvkBXfyyTjOxGABnJrrJ891jpvkM1
	rojqN5G8A3YjgKjV5fkK729I9ZD7ef+MYbUf0w9K6ctPZ6SVDGkpESGaoBs9rYIp
	ZkpINwDT3vaFzak0hLqAOUwc5v5cOd3Ca6qcG/2gUO6MnpjEUmId4YYINe4AzQXI
	pHCt+jOWsAMALyr4RqPIxiUwK7heHmRM63xmhSnRZqLptZWeboFoSCcM74wO+Msu
	hHqFhtghPFFPkoGlH4A8a5/8ie+noqbAaq42ZeVcEZx6/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nb5sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:29:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so33655145ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280560; x=1793885360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
        b=N4SQHm+VXzeW4REvj+4AtK1iawDIxgPHVm8sDOafNEVDEyf0byi4UmWMztzXCXzhzh
         82gGwT1B1wsFVstr2rv49/Re73NO5c0cmK1cDpmTviuI2YJb/A3V2uldAl68MbAHYFBX
         9atKPq7+TrCiIcY8wjm5JTZCSdH4g+q/dF0PRvhjHVVtgVWscX35nWHTbwJP20Xzw/C1
         Mes5B4rHFPnSDoEafbb+askF7Jq2pjVhW3N0MzO5fO+gVa9A+Zv9xwdcGfsfzhciTXoD
         j22TYuLUu082Qtgm4pLQb4jpibrTVqjLq/jD7ys5wwV5Ka1w75AOfKkohOwBTvOOS3W+
         +oKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280560; x=1793885360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
        b=cH1updQr//BxqYw5exB80ByDVMmMzd1dF9eSSpQAxo8iGRh7E1MAmkSwfk/TAANIxX
         00q0fTxxWfOKGakEX+ReXBVQ3bFnqNy5S7EIIzSqkIG9jJjegSkKT8zbdeg1Mqq4gthZ
         65yPaTzo8GjYFj5sJwKHgv1zcdkkWhMdP7vXB1eaabtd+fGKDfQrQ6r+YaZv5BJdncnr
         bjtT9oTgmoE2Ld8YyHonNcTFO99ZMVEC9w/bnz3e7KRXlgiTE8yxyGYr+SWNRvh4GiTs
         ErJis0IA43Lo+nqA36h8vVj9Py0C4IBJmmeA0i1E5lJ7b4EtHLqAepR1zADCJttOGZrD
         feSA==
X-Forwarded-Encrypted: i=1; AKwUvBydcN34Q598FUu1/xFU05uaMRqsmCUV29BLsSAFj0HlW+2fcmGUN7dF+QhdwRBCAXG7bRO8mDHfJaEtaAfD@vger.kernel.org
X-Gm-Message-State: AFq9FYJnVy7TB0pfM4SyJIkCwHyHq4ua5/8FDVHtThUj/VY0vj/nXOaV
	vK891lXAG0c4eEVYs98CL+BYB4BuvX4yOF4tJBpH9CWda6RcHkzs/u+qFNDuRrur4N4sg4K5nBn
	ViS7yerQez2v94rZtLahO2OIQiZZmOrNqdU2v8X3W3bG3KPJP6miqsUkBEOMvcPU6Yhq4
X-Gm-Gg: AYBFou1dP5E7s3MB/wOKn+9e8HtaLYdVQRNbG5gM5QBDzuDTM9DpM2rerptZtDrCxNU
	QNGUzffMQPn2qdXh2XCv8BaATE3x4bFfVUJzGtVgS37R2a0VWH+FcWxKwgooV04Cw4BtA9H6PY8
	gnMJNcauYVcRCIIz10mUHJ97lzHj5eo5sHgaD0JTP9qP3uYjTCbkiTjpdvoYFehQLHzV6ISJiNP
	1DVBv8e/E3jnNOU5e8vboa3dSETSjc05Kr2+cUvYYTxqUNvhYiyTchJM5c4x/43ZATAn9OBReV1
	tW3UzBrsAL7TgijgbaIw1IdmJoJiGOV5cGShvWRsqx+TYkBfhYtqUKWm6+xsSKN9yRF6Xh2vzCi
	RvvZSifqvw448zC6ixpKy1wBZyZnZGf0IuVvbXToplZPFIzgBBi+CC7CMaSbGeqpbAaolECinMd
	UpRxT8lKKQQgaO/D0=
X-Received: by 2002:a17:902:e886:b0:2eb:1ef1:f055 with SMTP id d9443c01a7336-2eb1ef1fca0mr22399115ad.46.1793280559741;
        Thu, 29 Oct 2026 06:29:19 -0700 (PDT)
X-Received: by 2002:a17:902:e886:b0:2eb:1ef1:f055 with SMTP id d9443c01a7336-2eb1ef1fca0mr22398775ad.46.1793280559240;
        Thu, 29 Oct 2026 06:29:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6453e90sm34035495ad.1.2026.10.29.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:29:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:29:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <auNKJ88kK1_QTPTi@QCOM-aGQu4IUr3Y>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026102919-confound-remnant-f133@gregkh>
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
In-Reply-To: <2026102919-confound-remnant-f133@gregkh>
X-Proofpoint-ORIG-GUID: oYEK6MSTCr4ocyIptu3dKJRut8IMzNXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX/YwY1BPmdrY1
 lQ1F53AKfiZ7C8RViESlU/FW4r+iLFLBBj5m25MUI3D4C+SbfG6K5rKFAjn9a6ypiJ6pEjUK5oh
 AikCZSuT/CWeJTjJlBDTwcZrNHcgI90bMG2kWqseUADLepoFdpbcRjCojvK49CI4G2WVPj/iBcI
 +HJNBofZrT2wP8vHVwzRKQ8xYcebj7Z7FQ4WljXif6t2Z3dNBi9F3ltoJyVys+uxRNVG3g74py7
 /r/Oi7dTfmM3C/2HbKWsalcmtAyOU94LnmWeSDBUOeje6qfQ5sbw3zPaZgms8tKZf4ab5l48j4j
 w0H25zMt2BK4/T4jKcw8m85lOEsCBnNLkFOabH7Pa7eJQIqrkip/bTzCL/vkp2rrAnbBjNXQMG2
 TN82DWrUIg74ooWyw2qveXWZyR13YA4e5pKWiX0XXQUoNdfrfo01+SEWaE2mQ3kd13c0/cpcODl
 nByy3vu8vYUnczXhzWQ==
X-Proofpoint-GUID: oYEK6MSTCr4ocyIptu3dKJRut8IMzNXH
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae34a30 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MGbNdRo_2CZBHlq_cxEA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX976lGagygsqg
 8rrgCviAeLClijxiUwpe5qyg/LwtxmtqQNvHQ3UIzqUo1uACYClj2t6E9te2piC74DY/4I9e4r9
 tplwDVIk6xtR60kGxlwxhrSeBhgErT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290052

On Thu, Oct 29, 2026 at 11:14:27AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 29, 2026 at 05:55:41PM +0800, Shawn Guo wrote:
> > From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
> > 
> > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> 
> Huh?

Hi Greg,

These two commits landed on upstream as a series [1], which doesn't
apply to 7.3.y, due to missing prerequisite changes below.

  wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
  wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
  wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
  wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
  wifi: ath12k: move dp_profile_params to dp.h

So I adapted them into one backporting commit. I'm open to suggestions
how this should be handled.

Shawn

[1] https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/
