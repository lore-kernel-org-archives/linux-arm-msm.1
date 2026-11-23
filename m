Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414762;
	b=HVwJh93tzMlokyQYaMooMjnQgmNnXKmui288pYAUTJiGuLleM4s6a+5QZT73E2T4h3Kv
	 0YsJbtG5xuKPjux5m3PECdsjDlWMcRufNRioY0kA+Sx4Fjr92MCWsSpQPVryFqcaEYwTR
	 n8s9VN7OChvejNeXM9Xogx65vVg7gdSXAo1jb13yM9QNe7iOsKfGjriBrqOU/kfYynC0T
	 u0+eTQDRWnKl+lf/KRS/qd681TnhZzFpn9+EcwcDAYnoxU759PmARwoKeO1POJI0yKHAc
	 kVk9bhW6AjtKZTIJbs/TQplJo9hEtNNCH3Do4iaXLDEcvhE5x0mTPbuoFsPWk4ZhZ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
	b=o0GEbAmYBwjudu378OkfVpK7Rzpi+uOrm00bQDl/UzLR5xlakPlVdV1UVx4xbUm3UKqX
	 oqPWNfjel8H0UEUtxBl3860P/rK/t8liTwXSYcpfTAQ/LAIpFxjE5O7zStn0i0aCyei9N
	 C0vqNUxJXMX9K9leWVGvGSTRhBqnrcG/NHoavIlC3rP2SDwmTl33fKqqW6jleoezmKroz
	 RJ4bR07P8wYDVT0q8T4wuVB3LsmkrAFWro5X97zhs2mLwcRb5mraEB7kxxzTXudZJFVsz
	 EgX7dHxVQJ+zqb4nvnucrgljVTtUaWcYg4gG8HpeLUWLnpEjYyy5pbF5VHkR+HHmLuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZM5WtfL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew+NZLpr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAC8606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZM5WtfL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew+NZLpr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN69BMu1011310
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=; b=IZM5WtfLDs16Xb1d
	OxE+40nA2QskcQ4WGzwO5J/mOY6BJuP1s41V0cwcbs1a0f4gWh/iTZANrAu34GKn
	/JX8FDlx7H7XSZQWLA13s1Ctesj5MRSmKFp7+lW52J2inB+qiQ22ukwGz+WIPele
	55Vk1UCKLrJEnBb+rzpc3YD9w2iYIHy0OvEAxsHRMJ9RZa6vNoNLNc6g5ziitA9D
	yFA404bRGnm2nqXQ2+3OKLL/CQR0YQpO9XQH4D0W8966bc9xLZ86wlyJj8ZQ86dZ
	Jo38/4EEGKhov/YCB+3SqsGfjEHbvdr9Cb5U0q3zvD3AUInALKB9F4RWln6loOUJ
	5eUgZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh010h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso2153119b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 22:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414759; x=1796019559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
        b=ew+NZLprX0gYNpImVkaKyRc/kNQk/w/RrlxdjCnxxE+5xAGbL2q7aXzcAuTtKAKukL
         Vq13s7QC5DM1GfTCM9Zd1owd49UpGOYCc8aGQvGlTcjezYRyLqNPwcaEOJUN7l9k1vqk
         3859sgS1SISIS8tOg56E7uVa/w3XcuwZF9fKV3tbitBr0eC82c2gR12eD5QB3mlEcQro
         s59Zlhu231Ifa1QrF9v8Bfa0zpuJ7sseWIKGGoX8vYiK83PCt7HwiRe5JVhnONqz04RW
         5lt3W+khFHcWUe4f59oyYfvcH8Zo6w/3yH9ZQiDm60imreDpzaGTHc8PL2U6YjozOkhD
         K+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414759; x=1796019559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
        b=QECzWgJf9Nq9Frix4kW5ZS7S+P8mLdYBmXSkJQOrB1nFgmjT0m25XM2azakcWbMF8u
         2g0EhUaET32KgrAsRa6mQKEl14HobCIohDqtk01r4JTY8w5xPlx4yNmWsBD/IAjE1EiU
         3WDxjw8A9rT+B10k+R0gwkXGp+jjQEeqcHKEQYGvjNqGeNdm6L+mahILyf9lQ9qwnlpD
         kuqp9ILpJXlyGRCEos/qeKIV6XLFDpIffEeN9PF9YtELVeBTDTNWWSY/Vu4ST7hd35tf
         tEunIQk84gb/3QP/Gh3OWXxKMTsQy9iljx+Z+Q/cEP5PIDvDuezFuFZVwwfOyjVX3ZHM
         NPqg==
X-Forwarded-Encrypted: i=1; AL+hErEfjuyj0AMmWB6WHYluQynTddedXBTyfENrIg7w1Y/LsCUxv6/uENvO7d3oMXLk3PoC+sITH6/nQHitnOGg@vger.kernel.org
X-Gm-Message-State: APuU4Z9GkxfqUXUMs2dP8gG+FtUdHKH+PzazZL3SA3iSa5QhKWSY79e+
	wp8XIe7PC4D2zgcHlQReV6FAhfaV0+GmOfeZlGKCYeTs8tRKtqp8+tuQejI5ktN7J+Re01CUYt7
	T93kgq2C81OvGq/cQBUZwruuG3+jIHeGem51SK+oz4hqbS1XTfl0nw7Xismx7uRg6WDwm
X-Gm-Gg: AZFdTZc32D3igxUT2Vfy0r7AENMMmH3l8Vz+c50+lW6FiUWeW81CC1ximFM2PKK5oBs
	dWOd6RRlEgn8n647ZLM9RFywui4TNnGSJ7bZxMWz0907BnS1/A0FLc4JsHhatOOXKCu4R6zZDSq
	yF7C16InCU3bfaCYp2brJJl/BQHpQrObwEPVa49QZSvmw7TQTWzsRWsR7mQH+D7vlHN/v0U17B4
	RAaACBnqGaY36LbZ7LCaANd7gvSlHnRvr+l4pVFJ8O9IasNBB9DH3gWnLrSwkvQiO7lb2TcaX/b
	Nzp38oYitMLA/S5dLqAR5M/VLEK28iV5O+TsJHFVy2ds4c3NWY8F0CpVjzxg6wVGzZ6dgyMIETF
	oxgtW312QJOW4XY0EK3pM57BW5v8R3FXg1qhD7ZxxVj+1qB2UirqwP6QCW87zFA7GDutre9Q8j3
	oIzoawV9m77A==
X-Received: by 2002:a05:6a20:6a03:b0:3eb:acc3:1a4e with SMTP id adf61e73a8af0-4014e25bbf2mr9414073637.82.1795414759170;
        Sun, 22 Nov 2026 22:19:19 -0800 (PST)
X-Received: by 2002:a05:6a20:6a03:b0:3eb:acc3:1a4e with SMTP id adf61e73a8af0-4014e25bbf2mr9414058637.82.1795414758727;
        Sun, 22 Nov 2026 22:19:18 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:18 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:56 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1496;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=q0urUXoPpzalUSHd+qQCncB0vMYbbN9c151Qoe8+FlU=;
 b=B0dtJAPHvUdcfAhfswCOZ5J8atpc0/BXt3WCBPeYhbtWXTn3XLr4tkCgo7fRBXQlTu5uEZvhK
 HkRR8EnuK2RDsQtF5UCgQj3ko5YI15T0nxcGJkGnG/yy07tXH2SA4fE
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b03dae8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mNKF3LC1gVCpUj1y5nwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfXzMgFujP7Ofh1
 xdFimYk+pmenhLq60LP4wL7muxf88/T7CE616bnUqSXQrgHj/A4qYm4P9lUlz2puLd5pZJI/HgT
 lB7TIp4hYEX1AaMF3csZaM3oHTo38Bk=
X-Proofpoint-ORIG-GUID: Fb3fMPCxo8suRNgMxh9I9UYnamWRc43l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX6Kak47yii5di
 nmbsncj9i8rC5yxmPsuoym9+JU0FV/eUQeVjr4XhfAX93XkrOigmqSNxZWt2ppqD7PTL3Niys5V
 vU13TVP10IRzLL+1Cw2CDkVatdMev/uv1BBrbSwe8jF3Bsy8huvQovGzArCfGxoVYiOX83bZ7Rj
 Z66ddGDgDKN4D2aNVdvaazZArWyCbfREEXYPUHZZu9nwr9QRSmf8BNbDazGQvGZkujTm4IDr7CI
 pZ5anPwl5EKqqn9FtqcnEsNyMGzikviECoUMOtdIaf+QIoFL/lffOanG/QUWP4qYLPYmEaOuW0Q
 kTrlRoy6INirC68UiEiMUqd8vU8DZ3nIfoxjhBmVxOa8J18pLoVHQPJ6dAO3NSppX3T96PrnqY4
 4VFcDb1WcSDR1P2ukB7ByjDGINW4qQC6w/y8JLS3sV3toMNHAZFOkVUmvo/JClxjOzz1uYuQSny
 zZ8V6zCB7dUfIc74QiQ==
X-Proofpoint-GUID: Fb3fMPCxo8suRNgMxh9I9UYnamWRc43l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts and results in XPU
violations.

The violations are seen when Linux runs at EL2 (KVM with VHE), where
there is no stage-2 translation and the write-combined mapping takes
effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
as Device memory at stage-2, and the stricter stage-2 memory type
applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
 
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

