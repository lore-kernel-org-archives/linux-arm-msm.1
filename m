Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6F93264D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061598; cv=none; b=lZYg+8z0G3Ju01SGHp6lpS0oyDjeHJqM3cBM9Aep7FAuVVBMza0BB847hkwEllgDqbSDOgZ8ch33ItuUqWa1EUV4y8NiThdqEJw2fkAhbyvzNR3hirEwkYaEIbdfvhfdeHEc4e1TZimgdk6Z4I3Q4DqwOiScQ78c+E5ZX0kYuxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061598; c=relaxed/simple;
	bh=UIeF/uFE/u6rU0favTCVtO6maO6d9vtYbeitGGcwU7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKsMZGY7gL1raLS2tzAgpyM3bRX1eRIdH2GUFyltttcNEqCW4aAvF1C0fVqumRFUPVOLWGvFeEkR/um7VIhjv4UjTVgcV+AOSDTGm9CoRWdD2+6Wh7M9/yZaiIpfAank7EebVNluuyZuNdYVT5OO6sk3K+eMA7J/GP97isgyXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rgmv0+bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsIGr7+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rgmv0+bS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsIGr7+s"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHgf2999213
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=; b=Rgmv0+bSgUP/CxCG
	hEsYbUb38u9dIXuwC9lRveX69BMA2+y7fY47+wrw61b0RsQkaCqpUWWkgvtPGl5h
	8H0DCX/fSAyWiVg4WI2DDM4u/JNk0lEZoiGezrkGKdr5G5OI0IV4Xht5jXFLw3PJ
	7ChjMvq+gM0mtfUJXci41wtQ+KtURMGB6EGI4hHk+du0nSYcEM3Ph1y4gtknPDyJ
	xNA5ivkAnXPpEqn/CrA+QEn3aPCItBeIu6T19LkFRc1hhPiiQHv99K2thRj/19TB
	WeMf8RXyNWhF80dNE+6PT9mZfFQyPqAtPopRbNXnsM3IFS/pU9A+zZqZhCneMFzO
	VS3dgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0hhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:53:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso59939685ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061590; x=1792666390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=;
        b=QsIGr7+sWGKTagOumsOB65U8ypOEDT+I0xhMfmuYGckIPuLbwCBY1zQewuBvZAAygH
         /kuwboZ3iY38ELE8jVbyNTV1uL717Ec7BCGebwNu/txjC7Ay9JL4xPMtaPxfzT7HP1oT
         2Pxu/gLpS7JuiJNNSrE4W2d82AbBRm5s0Oo5HzqBrhYEfdNwPLWE89EwSkXe6i55+F4/
         xvxDYdYFcNndcE+8XqEZCS+Snxu1G8caYXRmwI+w4blTdW+lOaEjbJ8CwjEiqRHjQqFv
         dtDkatLkEk7pVNvCfNV/t4xuwPYuMNOiXtB51nLpLIwlVY1tyzv9RG4urDd7fIQ1z+Ma
         9FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061590; x=1792666390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=;
        b=oSzUZvQFegn0UlJKmyHuHsOr923CTixI1ToVSkbFk23eCJC5iIOepM4qEBgvn7fHFv
         DKzcFE1KkPXG/z8V8kp0T9nyKPg9UAdx/NNG91dRoWgDeG1wYt+7x9yr4QU96eVvp0p+
         e90S2tci9lUQeDDw5iCXcaSyN5D+sK1xmYPEvAe7kPHaVwrvI5X4ibw5zG6H6Jn2V/u6
         NOffg94j2ekuu8/iGydk1+Btey4qWAEJO6GHLOVyq+nt1w6ZZeRnzLVUXzo5fKKJSq9w
         Vk+D3GwVyrIBRIAjUdecuOVoo4IfhLgQcFHNayt2L2ur3LBTFEqAL3XES9WYLzSlJiXX
         k/6w==
X-Gm-Message-State: AFq9FYJufoW/Tga9jiYFHW5GTQxT82P7wmJngUqUr1gVY0UpFG4MJDdC
	M2VsWuqpkl/g7NueXKukYIGAWDDuQAIgogauEsUB8lkvNUSekaDSh5lSz3TuPyw0upaZUCQlsQt
	/r6YnfjCFQyWCYUr7b7phfMdWLcXH4Ndm19rZXPja2sRcCXtfP+t4P2UTAZBJmCGxv2lC
X-Gm-Gg: AYBFou0n+MTbaTtupXSX7KlEpHYN9ka5GSfnN+Of8ny65kL287RZkorAWY+/PrMs4Tn
	C1ow7iBHZ3vVm53pvZe8SzQKVW1aFyd6v7T2oyf5CFS/iSUYTpwSNlWkPuBmuUz5E/1R00pJpVm
	gLGYL6FzDtsXMx8TAn4L1K909mdHK35iTEO1FqKuI1sK5udkagSzLOg5C61RiVhv0CSbULNiMs0
	DFMXIS1NejMbrXWNOcaEkpSYfAfHima196+vcJ4o5zh947YlpmixxTxUsQIdw5iw1jmHqzO9v9J
	e2lfLvgSwezwdn3x/GVYFX3Ln3H48WN9rbd+lI9p0hDA1SB6lBNN4NXd1xegceyIv54sP5OcrBh
	OAIxPeqtvO9XXv6SMlHIn/faxHDYEVw==
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr105055025ad.11.1792061589827;
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr105054855ad.11.1792061589334;
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:31 +0530
Subject: [PATCH v2 6/6] arm64: defconfig: Enable OV08X40 camera sensor
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-6-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=715;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=UIeF/uFE/u6rU0favTCVtO6maO6d9vtYbeitGGcwU7k=;
 b=V5WOWOVNAffWw8BYm3GDswhcihws1NuZbLJrM0BKGBJuOSv+3VfR9SSoMTRk5KdBTcd2VFz4+
 uQL21vt9F9sATBUEz70EkYJT0VJO++HTauBJ0ZsugsMSvrxmw07Iu8A
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: XdX9sqbChOMP1PmhJLoMtquICrdG5hc8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX9/zZCgq5pjj9
 dZyioKZoYnZLAUt7s5CHILfZnb9hJ3boSAc0u5DKTsiaKvjkqzEc23AfldruJfDYeX8crqR8Ga4
 rvnfi3RySpkjbttGC/Wi3brW25oUGG624htPGVkIYrD3KdMJD6AYUg1RJgAfHbrRB02SPsQ40lk
 fFtIvWrZJsH73/6dV7t1wAypSe45GD5VcES2AyMX6kvKCsvEqomnhHtdszDiOCo9yWYEd4h9c9l
 706fyloOFrWww9VzrOqh2SrZYJqCrbQ+1/vwxTEiygYjWVV6SjkGs202dxAqWQhyBTTa9H/hKKp
 Oq3AR3yiM9lghV2R0+mGvqIl6iBU7lnu1LD0fOPrMcVYNtjQx8WaZ6AR6p2apB8prspk3HhAhd2
 2Y5UP7HuftrqMQRjb6iEUtlFGcO+mEOLUD1FILrHDMVSWacjd2cny1wT3uHnNDj1vABkA4kUUJs
 YdBcGxea3x41qPbmsAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8Xwu0Bk/tE10
 EV6KmMPvFSqnciaN33eB0XeVX4u7l9W9ym6Fi4ViFUEG8xV+qIguBpstAoec5N19YRwgLUXIKh9
 6l8o/ZZGwsW8YTawwKwEp/qyUuvOp+U=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0b096 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WSFeanDOTqpEkpu4Xu4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XdX9sqbChOMP1PmhJLoMtquICrdG5hc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Enable the OV08X40 driver, which is used as the camera sensor on the
Qualcomm Glymur CRD.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..7c0926c8ebcb3138ea965f879476000951dac432 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_OV08X40=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m

-- 
2.34.1

