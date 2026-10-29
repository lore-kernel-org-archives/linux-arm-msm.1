Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298859;
	b=V+sm08PnF7GTyuKNaR9RP7XITpRnBg5KCTHmHDY+U2UepCAVWImjHUyn+MMguzfynfOh
	 9TglAyj/EDXT71Di8J3xyh3eVW8whiLgBEnaOco75FpB2q8d5IAn8qxuCIxk7/GwI5FoP
	 /st0H7tM+WkJjy+Gj+XpEH0RXneeR0pOiQicCuZK8lQj/HiN73rChGJqFciKlRYgItgDw
	 bM7ODuzZA+bxqHaDQQrLQa9FTSZaSkJppSVv2s3F0CT7oehCVsrXEBCApIrZN0qgDne7T
	 1S9TqgdQ5+kD4nhDpSyNAr1XhWA+JrzKOyjLT5azhYsF4y1QzX71wwDjQHHI+faRwAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
	b=b9MjWdilAA7moPd9TFMfsLUfaPltwLucRT1HbClYbYV1giBueJXL9SRDGeneCgaAFLom
	 ENPUkV7DEJ1JBHjDdQrvJzOqDZ6J3LqvtlyX6YFq+xyr61uZe1v+OpsjDfRYaqdDHyMre
	 rtrREZ0q4KS8+py6H4k27WVuR65u79Zt3ZNcDFMosnA3B/rOOcg0A6Gn1crGymhK2eGLU
	 vL0eq/r6IGEHX3UkyK3hdgRBJMd5tr/mgKvz52YVCYAhr96Egk6y110j6LcpXG8Idp7AR
	 2zhwDETupbaPxgibobzoYrdqCPZkLsVWz1lS0p/5VnPEb14+5n5CBWhTg1PfQVRRYOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMqT1kSg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/L3/0ul";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE6606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AE6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMqT1kSg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/L3/0ul
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxb71619547
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=; b=XMqT1kSg6empzHnV
	wf/ioey4N6yT8NoWHDxlKCSriNgmHFmZ6iwjrb+45ERs1GkOHcp8fu6Q9hNzJhcr
	YqCQHiofDc2a/u0IDl5pSarwNseXWp9M5pbrygexrdqtRWrwiW4ic7ZDpW1CscB9
	ek2Wam/QP8ia948TV/FUUVJP8itxIXzRzA5eu5VMwVa3hqn/QzKBGrOKAdjCvJRY
	o9kG86TRcLg3z6qiuLHbXY1BECEh9c9+AS4Xixe/4SSBGbwit8e+JpxlUonnUDLW
	sxSaKoS/mMIzGba/cILNt5bv3EkPwcmR6eRasmGjjbDQgKwsa/2O4eMHBPwJdGGT
	3+CZAA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44qa6ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4976229eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298858; x=1793903658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
        b=R/L3/0ulLq56Uy5iZ6rZPyOYAqnTXEy7mgoBmZRoakIxTXU/I4CnQJig405rK27AVE
         SbAWw/XVhI2ZjE/3zzwoWhxTxzhw+N3fR+wp9RqWfwNNCOuvL/1v6XL2YP5G3bJnwGW1
         Jm/PkyXB5j0/qYgrV3OHzmQRTl2zjZYQJN72MrYgG1cj5uxGJKQu17VEuNyCKz5nzdFm
         VzGOXVBqYtt9KPX7V7wlQZspz5abx0/aPzZpWzakjs8maA0rA+GcxHK9tNkZTF3B2/5M
         s7ihtl9xIqA8wdF7nupsLfZnJwggwchbrn3VmlzMFXK77C8UnRjgR9IVFHqtiJaqB6zg
         Bw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298858; x=1793903658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
        b=PNSIBSF3Hc2nR9/dFAESfZnCCKsxbhjwKVzDCbvvKqVkF/3el9bRJcC+0xdCIbylnU
         csORNM1YGQOK4GyGmxc0iljZRbSpIRCy+L8gQWD4kOw/gEtn++oVl4VwHfvhXzJyQxTL
         yRm8PTBndkw6alT6FCrRRMo987NCF43Loz599EZI88r3X3x5Q07UX5AZGr0rJbHPFuct
         1IJa8B/IzzeOzpp22nM7HudvU1CMkAOtI8unM2aT03BFZF1vQtnZi6dVn5pyaE6guQY7
         y+RjJV71iFtL4K4x75EgoCr+Qm4bxpfM2qbJeZ3zMyOIwKEu7JA+OG2pN3HaHksbha6W
         UWuw==
X-Gm-Message-State: AFq9FYIShqz1JEPqxa2hJZeZ+bhqezwzo7HNu47pTYoOLv4jm91wBZj6
	ZN/UgPkuSPTIHmsC3YYeJ55Wkxmjc9BLgCEIToVM+o1hmbP7IxemiWTrxUz0R58OtznCh9l0h1m
	4Tui/9UC7LgXu4Ik4+wuzmkqCsOuz0rJ7ri4sqOecWBwhFbyRNPfFT5axb/pIG3qCVNRaiF39vO
	Fk
X-Gm-Gg: AYBFou1XxyyicMJk2kpWv3n5+2R/Lx0QR2vEBlje4gqkC8AXgNZipsgY+vo0VfAzrtX
	Yb2vEgC7QQ3mxutgsAkbHA6FT+Yx8sOFaUdYh8M4RTaH1FV17SmmJqIA/O5lzSI5HKlWWh7hyRk
	/Ls+bZBGQa3c00eihSJ5R5hzzM8TSaX/O+YDbjgubgRAevvvfSyL29nsmKOQuVdct5qz42rJzd0
	GFw0ae3AOUwUmvgz3eQz6aXwHx+AWt/WJEVnl+8ug+sP7YaAUhO/ybxDVY3W4DZNl0cLTntMq4R
	++f6WLZCMycaHR0izxFS75CiVNDM3XEp1sQEhCcj3K2PGVDPKwEBfdPfVc7hVDD4NzRvJ2jSrDe
	BYAehxP2k0l65W5DdP1Z0SbzaVeS/92L59MoU++311pbN79lI7Aa3W9brqKhXHjEPrw2mSEgBjN
	P6ZUVjhqlo25HUOF6PMBFZ/wh0Xc5BA2ZvWBkMSshnQA==
X-Received: by 2002:a05:7300:ec97:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a4240193fmr263443eec.12.1793298857374;
        Thu, 29 Oct 2026 11:34:17 -0700 (PDT)
X-Received: by 2002:a05:7300:ec97:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a4240193fmr263391eec.12.1793298856670;
        Thu, 29 Oct 2026 11:34:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:43 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=938;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=q6qHNfYBzgQKg615pfscwOCc6p9bX6lOaiAEZbMgff8=;
 b=3UzHcLpW5lvtt/3IVhmh7IyyhimC6iVExWR7sijLVfm1qZTkgC9jeduXsTg28qAuHkir3cbjB
 Hg5NYAgSC/0BZzWF77wLNK/lalkDWie+930a50ho1YCh/oYq9hwqCVq
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX7MN9KspBQtSG
 ypW+B6E/VMEsD2LmMfR57D2lXe1agrUz1A1mDb4KVMr2M8OQRCl+XZzRsFD0mfAjoyNumD13Epp
 lI2AK3Y0ipFjjmpZQenbgHe0i498ojQ=
X-Proofpoint-ORIG-GUID: oLv0Bld_Ip-8Avkh2fxRgBuBCMHlN0Xm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXz5k0nqAL1VA3
 4P/XQJk+N78KXXgG0kfBHrugwyPEvUbVPEkZv/Rb3siqMK0uwp2IR1JIWwl3oIeQ46KutK8xMr5
 Wzg6Dop83EY1/jTvjoyGTPtu8zrocFLhyDW42sLiUU44N4UzbqFCMMSLQaldc4W3eX+aDjGbPxc
 ZuN6dsqCWD1wyFEysbFNwinOUY3a2jD/yQ41p6Z67GUQWBvo8NFPraQjqlOdsoWwh2lZV/xDgyN
 BkROcmO+CAgQs93WtZCdP1Yxi4bgKeeXrXFv4wDkLEh3dv/RLh+oB+h/aF/os6zsEYs36rOg531
 Vkzrahydm3LafzLympOJSHZDxxShAm0QWJILrL4k+tPxYrgXTFwt4QZsi6YhaMTKbKI1ru9GUUQ
 /2EbmXPkUcSM3Uq053FakezdXztVsmmwGVtrne+Xjn/ZCqxnpQspAT6ki4zPVnRAOtiUfs4MlGM
 GXiQxdSYKFEFOUf1vIA==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae391aa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7BzVpCbw7KuSwccWv-wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: oLv0Bld_Ip-8Avkh2fxRgBuBCMHlN0Xm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

Both USB controllers on SM8350 are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050ce9c..863874da94a8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2669,6 +2669,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;
@@ -2748,6 +2749,7 @@ usb_2_dwc3: usb@a800000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				dma-coherent;
 			};
 		};
 

-- 
2.34.1

