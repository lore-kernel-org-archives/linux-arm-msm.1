Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670245;
	b=ZD8Dy/Yu7Oc3+wIeTX2GSL+URGj2pa+xVqiSbYXfrlWDl6j38XpvuxOfREtl7Mj2pcDF
	 KrmxW56ha9KGKHo1PFzd/APqe04wRM0JqIL/T0l4E+YylOPpg/DORZc+68D1ntGHNk7GO
	 BoM6SZns6/OWJmXpbJ1vxfaTPlugQf/0fdJIhjUPxErN3gX3+wqftdAHmWjMlSHaBkKaK
	 AGGyVWmpqyLRI2MW7UHzXME4CTPkikmFm7LiYfemZM8PFriH9H7OBN0GbtIwOCGFJanMq
	 8VyQ/RvNA8piV/rKlDGyk45GLi2nTrIoWARe8pP4adqL7Yg337VSjt1XSk7Dx1Fs//Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
	b=tq7IFfub1ifZpLeKvyf5KtEODqsaKriovNhw+ecendOmcOK2qWqsIO3q8PlEDM5poKj/
	 5CnBOkvnwhl1XOEYkq9uTa5uqXCZIGeS9WBtB3GExZ68yG32L9uKePu9ONXsawgd5MMlT
	 Ql1aJEJU43Mx/zErnn9JK9mrN4NmyfKyZsF4Yj+lVrjGPtk8M8jxQOnNQ6OCPa8CZDjUJ
	 h8i5XMsiPsImX6Z7dk0NL8jEewb+nikOHTiv9Q3WtOytR7xFuWI2ZMocFpIPDEjjRewSP
	 qOMShqFnVTgWX6pqd5k8unczcf7l6hmMKHftyiOi047fBjgj8gt0myFqzTyW1pS+emg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr6jpaM3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0PTY4IU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A72606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A72606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr6jpaM3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0PTY4IU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0Ah62918725
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=; b=Lr6jpaM3v/D0WZ+n
	GH4ab8fEPnv2/XRAiQ7CFPe0QDovjK30MxPpKPfj+JHV4jY8CWn4n0w4uVKu9y5b
	d2IFTswbtm9BGlSbcW6Hfjz7NVAEDbIkSwhK9hHsJclg/CBK8FM/6QgYDTTshRXE
	ZqRTbzqrc32LIX4CkRFtH5r+kNp6kGoAfKq2tYyxfHXPG+UdjdWC+l35bBeHq1UP
	R6oyKZv+CZ/hbn4meTEJTc3Vnb7HVpZ6zlUJd9jx5tnZykPF2fFwFXpxaHFILxQP
	e3GBwbUOmbUTrjrGOCviEHv30MEa+fJ24NhNl3gRbaMnL9hXqm1/VzlUHfUlIK6O
	Q0RwcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aaxtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so4489448eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670243; x=1793275043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=K0PTY4IUT60wi5CH6Jak4D2PX4/Kyh8fV8zR8voiu2zfLf2/ccMEdMiKoxy+Uz3R1G
         16FXA+qYXscY1Kz9f7vdKqkxznRDOTd/V6pZclAwzYYPy4AXcaCObz9qhsuwr9ytsBn1
         9zmhBaHRMD2ItyAYRHCPjKUY6H1qH73g7aiDS9JqgE8uDgFiQDXDRySGYSONnI46skaU
         jubNWXLYU+yJ+nPt203g+cB8LgJl3b1JEXuteX3wEzj5JRZlprh1Dra3Phvc0FZ9Vu4G
         2fpxHIsjJIev4UxTX2SLfyrQYDFeKVkAa+OvPCWPeX/TYovq1dcuKPYF5RVTUwWYFntN
         BCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670243; x=1793275043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=yDvVzc0/Gvy4Sicolak774jAVVglBPU//DmhS9ek2MOmYtDXWh2R6AYuzFmmbNZEGE
         sVK5mP1zhymxYej1Ew2ILOWUUtwBrmKDTmU5rZnHm3r6TogAW1VRdcwOPC9NpICYpAjL
         +rPDUt8OMsNnrLUGH6lvQSAsP+ZjxJPUDNVCtqiVU8ZMAWS3tzUwdS3OxODWB5ttqHQs
         oYOHyIvw/iFaMkd7yAY8VXPqBEV0CqmS9RDum4Zrr8yKOYzB1c+afla+BkVDF2QlVGqm
         qWAIfXw8/9qLwuYyH7bC2QcJ5ZEJ8jY2QckN4DRpKGpqtX/lNfGTtZWs6JXswpstL+ZH
         bRWw==
X-Gm-Message-State: AFq9FYLYNq6etphOQZDPEebVcvXDbpKnWwRMl5LOAcGx9PXj7408JUsd
	Rwyt1hgOXk1UZYnhs2LeViqxHaezX3hi+ZU5CWjIcWwnu2BnPdNRpFmWNsHqPotjGDJvCs24to5
	RelZjQMurMVzzy7Q/ZHjEvnm2rzOLbtmD13x+zcajPkIao9C9JywCliAj91xzMqPKaX9M
X-Gm-Gg: AYBFou09CRLKMLsSu0fHreEF55pDHRCc0/vwNrLgVLjlrLWlUD4Xqc7NC4xYXK+LXwN
	dQjzz07BsM1VY696KznSGy7nPadIRcYJAmpkP3sgtBOxQh9s2NZugr6a7+lJuaOzO/UIDaHcRhT
	n5bp80Ccg8Ms3qid14EG7qoTD2eCKhFIz3uqKhsoINYNPGc57RhhPjSJ3l7T5SkU4N51gdV3M6L
	3UIpHi13bqAB/hQlMUUger7sYaKqAvH1vcCzD4mYWtocODIm73FhodvlfOsvKE2NlhRuCf/ROZB
	DZ3tbt6U1b2eoo7pIFj8Oj94fYvTMtnRfqBBWLBdrWhoqP1dB0atMijn24GoFiApSIWkghuf/MK
	lEcIRbGJdRiNZ9Ozmob4jXp/iIq9CjKlJlqU=
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8691724c88.7.1792670243181;
        Thu, 22 Oct 2026 04:57:23 -0700 (PDT)
X-Received: by 2002:a05:7022:407:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-190a52e2836mr8691690c88.7.1792670242643;
        Thu, 22 Oct 2026 04:57:22 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:22 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:03 +0530
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
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
Message-Id: <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9fa24 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: tq_VDz0Z2zRI5U5i-Nwc4ZX40Gu4dV9l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX6FjyWFcCeryb
 nRZyIdGrFk2EfntJnswchfkbl9lf8XlZto1czX1dgDMbh9F6c00nVK0VVUSr28c4XG388ZfCw+Z
 xYUG5uGsLraW6RuDVi9s3CdLDksTccc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX5BGeknf3B1fe
 GgLr+ciah4s1cojTGo2+K0Qnx/FILWA3cRgNzavSCSLS9r+BxSiDCpfNEzeLG2COe6pMqyLK5qH
 Z+5m2GSk2Y18Ef/Vm6E6vDOuvvVLBUElb8yDNmz1FdLrv2hiJ1CCSYf5D+fbwTDkAWRVAcyoMhg
 TzW+RGhcWrzLAVPcog7WezI49plPd3lLYaer5U5tOqYLh7zcTnbovFiJboe/KL/em7qycVTh/90
 5Sp8OD9x47NWzwhiILcBvcUjwiX0GhwmtxYRZqGVT3++5xVFVNylghfx9ToJDAKSaDjLV4lHann
 BiCDi7M2N1ib9Znp3lNSVHPGvwjQYe3oRW8Roz4Y/djfatOp83SN4nQ2sM4KekJNUb5e/QBLZzg
 KtpnBtpIIMkN5IyHSE2VlvEH+ZIaURKXnQ3kIBuALELTcP1EQ7VNNzK8An2vW+Tohcn7+cziuJ9
 TarC8AGE1mRqGxUxwhg==
X-Proofpoint-GUID: tq_VDz0Z2zRI5U5i-Nwc4ZX40Gu4dV9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220047

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

