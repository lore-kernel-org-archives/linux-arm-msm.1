Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670241;
	b=TItE1sOl62BjpIkG+scrxKKqKhTzlA2tpOB9D9P5QWp0kcpGhQAk7lMCnUYYaZsOCsbc
	 GAmbg+zVDXw5LxDccQdBoJgV8Ys1XFp5Rm2nTIarnypbSj2dnWm8wGbPXLbTgH2QF2FPX
	 yN6Ksd5uTnIDF3EfNAQuTH3tLCry9YjlihXh3jaxAjzTLCvdGqZ+wAVvxJ3benhXbvx7U
	 ybv4FFH2E5CWg8pqorT71bFxUxaJATmeFZ80CzVadQtS4GhM/hKMv4H7Ryh32Dl7Z8i3T
	 8ipVb2DBxrHFTDHymvauGGvvAmLE/ZwbAp0/cO39XF4T4y4BMTvmqgKIM1zqZphudZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
	b=hDSDMtnZmZx43z/3Ul0Wm/14UHY6239BtNaVMUXusdTi3IlLivFBzPxFJA5r73xawRJO
	 r+J91sogZTxDB11yQIJJJPr5FR8/u/XK3ooWYVnaCh8l8CZJX5k8DYn9DHr2wZl+cWrid
	 NqLfSnHDBEUgNtTxuypdUI6SoRE0mjqx7NqXZcFiIpebJ+0zSkkgrT47tYjow/tVWAoi/
	 R0c0cbQ4xvxra450csqUozSazcvwy6lJdIyc5NHuoUjc1alQwDidKWFE0ViqRbV6ilf6c
	 aMBF8/EJXMp8q5GdxagHbMm0FRoaFr4eS6TEjahdPq1+09vsNyxXGxNuXNdYcfu9qfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VH2k41if;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmJHPapv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A40606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A40606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VH2k41if;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmJHPapv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0eSC3923338
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=; b=VH2k41ifOq4avR/q
	sFmsrOjEkuf2/RUj1yenFT4TiXUN0tmSIWrPyf2vRS24vK7AFNVRpw7vfGXtaTY2
	dIQTx12zp/ZMS2+WuJjxXNDHAGtKG3STm+YV5q0WnfqpHgSBNcionEI1/b379dSw
	iqrnyh4iAhP5ClnYGOX3XMShFOcdiCV8sCEgrmr6dABSKnkem8utwSWr0DciiVCp
	gDbWPPEKmzk7kzM2YaAYWltH3bm+sOBiNRQZXTqj106MR62V2MO4qvzSP3eqYySP
	HMN+5FBdXHyNsFCPVfeCOb47qeZZwdBnrE0ZnqGynZr/i0uBsVtpGluhzUgIXi/y
	zowj2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bjx5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so2265916c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670239; x=1793275039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
        b=gmJHPapvJ5KW4orLtMgP6pp8slzIo+1uLqzPogJRMtDaUOEmUcv/K7QPJ5+D+8mlqI
         VwOoppg4xvF9OtjsOx/XC+1se96SkoPclcruwt9YB/9j/voh7mek15haypn6ORqHE1xn
         vVftM0c/Yl8KGb3XOsz/EvTttsoGJ05qdIyTNmYqf8eO7L8xOpKZyUqDDKhAJ9NcWHak
         ZG56mjx7/hNZhWT6oFa8pQGVrdFI/OuGPQo1gonJRFvNf9btfZh4k4d4hiG4a05Vqk+o
         3LY67Rh7DjLzmkyzMyGyNjqrDLFIrHImx87e3bX92jv1IOpb8RUSKuIiNE5dsrH25vR/
         gBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670239; x=1793275039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
        b=ILOkYxEX1ESP6p3gespFxKz6XI1YOjOZufOGc9rmA/8BCailQibO/MpsA0vtTeoFpg
         SbN5opL7LQvgbnQAXJNR26Ed77OCBtjowl8Vtgl7WE9jn1qpUrrNRNrPKLA+jqPG9RQK
         Hprp5fV9HFJXsTCYVeIskxzBbDsYkSOyJbBmjVBKiKJcG+b/X0MBBLdTzGx+Y/tB4ta9
         RC3RZU3MQRY+fiZdgdVZw67KcMFfNeNSIgEE1dTGElZ9ODY+yPzv8Tz9oi0kRyLBU/pQ
         3j9uFm4Ag1utWrmbaHhljFZ16MH6PveXKMVPxrZJ2qjmuVi6lHxV4ziUo9Aas/vfUKr/
         Ztpg==
X-Gm-Message-State: AFq9FYIZqxFZY2D/zyZQn1a7J6Zm8IV13EuWXgYooOSEAL8gdvjo/NhV
	bEj4wpn6zvt+QP/3mW212qax8COo89jQxpz55p0BXu40VBQPKqFdeJ7pEeh8Wtr31aBG0qnOWlY
	i2HDi8MCm45+Whk18DVxHxQL2nlkoQBO+U1HowPGFXNzcB9DK5j0LtS34XpGpO4Ai2Hh7qquQlP
	E1doI=
X-Gm-Gg: AYBFou3McUSDdiBjYlT1a0L65Aj//Xq27HKJD/y+l5oAZvbTsxiJBkGq2i4Yh25kwAs
	uAOrrbzSm/h08JD1NT9FWMqdCjRb5iPC+SlxanTbU72MPaO0Ylc7bBa96vejD7DAAiV8SdoHdtZ
	YIqoWmc/O0d4WEaY4E3lD29gtQpq3DT4cZRN9oyVraCELZgrOMLOzrsQF5ST7VRTZjSf73GSjnP
	s2Q1ahgdyaId81sgiQwRLPazQ194IFqw+8MHYUiTd/HHfwjnIEld7tdeX4QhJxj6sK1St+nCh0j
	l8PVCE52as/Zxsv6N0BZ7dKGX7r5UbmspJdQs5OEgUlP3lAOlteV7RsEyNJ3V8G4B0Il1DdEncO
	PCCZIK20BxPsuao33K8kPlgD43Mh4nfIbBpg=
X-Received: by 2002:a05:701b:454e:10b0:171:a066:938e with SMTP id a92af1059eb24-190a7756cc9mr5990641c88.21.1792670238327;
        Thu, 22 Oct 2026 04:57:18 -0700 (PDT)
X-Received: by 2002:a05:701b:454e:10b0:171:a066:938e with SMTP id a92af1059eb24-190a7756cc9mr5990608c88.21.1792670237767;
        Thu, 22 Oct 2026 04:57:17 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:17 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:02 +0530
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
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
Message-Id: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
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
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX+ZqXPKte164S
 cLUpV0vu906T9fYYesmFe2l9vjnpldXs2eaHvimyJHW7Im2b85cEbfW9McC9/ri+f1CRsq0u489
 2wnox2Dc6pKmL7GxqVQ5DJ2+jX+DmEX0DjsKCqAfNN0pdj4fx/1ZuzYuc007ik1vmphxPuJ2Yi9
 +9THnU5mdt7GMoqyNwD3i3fuWqtJAopLeGTzvXubC9MuZljfV/JAhThwfdwe9fqsp+u4IPIPURn
 wFK+hPcfalGpxFoqnFVgEsa2zWYR2vMZOrHmtp+k8qlj8qUx/JeSk4dVWRLyKGTJuK1hfVLfGhZ
 U/v04X73V6TsE4Jc63CWUrfbApmYa4NROo9SkBPqbBGPQ8vyGjecM3JbgJjj1EDfymsbBPNXKQJ
 z5BSnDQg4U9Vp3LoQv0l8bAjChLJKqnnWF0ZavrWOTD/eqv2xKrfEO3POE4YU1BSn98xcZzVXjc
 D5EZkWiDAUnnCYslMbQ==
X-Proofpoint-GUID: spZKSmi6Hvfip79WZLHImiBhPtweEprH
X-Proofpoint-ORIG-GUID: spZKSmi6Hvfip79WZLHImiBhPtweEprH
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9fa1f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qVuS7nBUJV19qhEaXjMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX9g4noxqjtxB1
 1rvGgyItiDJ5X+oNRnn+ipohnFVi3pVcOlR3SsbxCKOJdH2Ux7kX8oy3KzhwZpkBe0yxv11ZMEM
 aMz1TOa8N4G5MMncnWizQ2oitu/LGpI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..6bed47b8c913 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -430,6 +430,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &spi16 {
 	status = "okay";
 };

-- 
2.43.0

