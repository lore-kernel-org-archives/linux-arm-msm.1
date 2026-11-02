Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612886;
	b=qRGPPNm+saCdW9IUxxzdC/QnG+DCI+VE3Y5E5s2RyQSMP8P+0PAXJzcot7lqRkfTd1eX
	 uLdmTWMxN10rvm9JgoxopD4P+6/LgmFBUIskCvhATt38Lu+BQY9Y7jM5cQ69+IIVkjyKp
	 1Zi9GgqvMQ4o8rpMVRzBLzhD+B2N9EV5SIyVWNGBJ4IHdTO1GY/OoXzjsE/qXq2+NN1Yu
	 NXn47PXR4tmZvM6aOagLnaocp2hg4OyAuO/qp2CoazITPmVDZIx+O+ElVFsQeKNy1kwTX
	 i16dJ0cXZx776pyFWMQOqykRPrNJC0xUdL+RvtWvoNaqngSKO61JNA5UjPWXaec8+yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=hgMNMrshFLw22kxTxE9/xZvyTKsYXEdQEYq/yCHkR8/sqV6BBd9S3SBCwk/q+C2igaaN
	 kfbpIwArhDMg67Tr1Due0grc3NiEN0Dqw8InPmWZJggMuBlo7sojpQ8ruQ+CQEPLM16PA
	 OSiynvgJvV3VU7BkpipbW9KjaLRI58kzugujixPKP/pZS+2Mjs3gErLn4+YrC5g3//BO8
	 Ye1q2Lt4d+Ajh3DBnRWIBFDd3iKJR6ocKSZ7tPSdJBEM78573lYMKfXbusZ2E2LXkZig7
	 mgNsqfPhOX7eanFDONGSoFIMCdAdTG1Tx+ApinowaEMHZN99YRRj1PCpxNu48cHsN0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHgVmN9+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A8460A2604
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A8460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHgVmN9+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQsV3440395
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=EGRk0PUwlYLATkc6
	inuDWGTCv+5a7aJVbA4ChuyMdjE/YZYmbLyR6AE5kDMoE9BOj/Bw8UzdIpfR88EK
	iH1A4N5ZRWPTO1lgS559yHa/F40mAQiI/mJV0wTVQZRSVT/EgQ0XCepjm2pVC4PH
	gUhiN3hw9SDr3udADTbD2yqtc3jilFY0K0EW4rjPyPwzvXTpZnuUsGxCfZd8sgBd
	f9u4/yoNRwvmxnkn81tqokqBrtjtDdT1djJHIo3faDQle598G1apcTxHfaYCURUQ
	9PVk2szIsp1sJVkDkbMPS88R6oSfplZhAaibVnp6uBFM6Xvk3LTZCCLuNMLXPoTD
	DGoUYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201r01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:48:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2937560a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612884; x=1794217684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=AHgVmN9+Q4WjWhDE1vNCwLFIDJabGLqJp+/MiQlPQDnM3SlffQDI8Tm/NXURBFCwHh
         vgoSR8h5bmHkJxKnhQlgyCEr2NAvmeUgzZHIJWJhj6U1W8Agh55bW2cUyq1cL+7lRgUh
         5lEdRI9/AZF4Tzu4+aZTuRAAq6pmm5R+UhrS8hwJDHSltmvc5UgjrekgHrTvgMxIwaFa
         35kTPF9ggK9lxLXLmbmQWpqRD9A9/CLwNY4XhNGv92pbklTZbhu4xpqG0WGG/dU4VJq9
         1j9YpeNaEnnqlt1MQDSVwhQiMt32fcBu0LJbT0j+QyJ3I95jFqJgeCa2ASxSE0yuARzs
         pu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612884; x=1794217684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=HBuDV0wPb65dqa/1MWdkLO6uuIIm3phk59g7D97whLmzPJL58IfVkvHjS2khqY9TZ5
         MoPmnfTd8MBw0R3mhWldvBSkHZiTcEUIGStQuNQypOaCzD92SomwoqWmF/HquH9xW8mc
         KZIQK5KSKtuM6QDQiizyZQO8eaJWhGsOPhPZCw5rOMBj9iD+y3huf+ZjS+AISaZK9sxK
         01x0/6ySDi683dralr8/qy8wIYBO0uPrzEae2O+HoAvxUh2JJtAzy6qEgWvbvAt9PIHd
         MFl9htj/Xrj4bqo7mo5OYSE9bSSij0RQkH1ncgDaa1+xb90qV5KNUrJFdP2E/+eW5CEQ
         kKrg==
X-Forwarded-Encrypted: i=1; AKwUvBx7zzICVa2V1YTkkmzrzbw5xXz1EuM5/V7nS3f4c5WYGwiKNnj6iyWN71U1DvmO9E7HTJjCztC5OV80+FuW@vger.kernel.org
X-Gm-Message-State: APuU4Z95Je99B6acqLE3XILqNepdRluFot3HCXjXFJpAEpSVPxqU8VL8
	Ttcfs0l3KPVL8a1dZwkNTjiqdFCqPu0SB4PmYQE3GvUiccqBYOkQ1MDJUL5i92pqJw7mP5LbMLd
	Ac820wRbzf32o93NaERQ4sWGXYHTLeTwItI51pJC7JFJHlSu54CQ4zp3pVqfeHDElEA6HfocxBd
	Vd+sI=
X-Gm-Gg: AYBFou0uKr+SBNOleOu4D6J++g1jaISvrs1UqZmYWQkG8bHcvHa77/bmmyxA+K5zw+U
	ntoN/KqG2VNUE2hj8IaZn2zloXIKzcY0Bs9gwg3gwSBKxXelRiVJKnkma8LrSxuqkV1gzt34vnl
	daABb/X0+8zG+wtU1dBaMPx6pzCE3Cb7Hx0es1iqajvLGc4ElL69O+t3YxHRAN+d5qbKSgaeR82
	KOq+5xHoV+yXMIrYyjbVsVuVEtYqRAt6uQgkDqZIL02K/AkZkn/qBi5E+pp8u/xVUHM8GLjr/Sm
	oS6JrVYVcB8opiaOD83eTe9nW59Lvr3/C4tW8DlnXXsKdPEG5LTNgN4bkjnAFFqc8JpFnq7vBaG
	dbURFp52bAyMbXBq/ozH6pjIXr8r5t985BmUshzkqJAXVnSSHlGVfltCpLhZ7YYpXA9l2l4fFeI
	1FXQue0yCQW3iBjmdsSH5Bzh0RbXygTkVy9Yo=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382314a91.26.1793612884088;
        Mon, 02 Nov 2026 01:48:04 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382305a91.26.1793612883592;
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:36 +0800
Subject: [PATCH v21 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-8-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612831; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=YVXq7+0T5BuSCdV213rRQvJ4+GN2bAvUYub9zWuGive23qGSHFZbkQDtYyZzBpQgtwIIHF/Td
 +35EmNPqL5PApKkGK0WqAbW5yI7cW0wAAWzpo5mZfP4G68dKcWDZtIX
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 2FCq85OZmxLOlYdCQaJtdxiUAqfUM8jD
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85c55 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 2FCq85OZmxLOlYdCQaJtdxiUAqfUM8jD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX9hKmNozKwwHo
 BRfu7cLLzgVsx4euO5SKT+A91fDjajn2vvWPAV13Cpg2TL77uAyn152cEB1CAWnAtwvbbDW97zL
 Y6JaqrRGpzuPCDMZfMYU2I1LEqc+GeGoP50adE97AswabK0zZkqvGeG+bVJ8Ynir2yzSXEcTrKE
 n0wvcNwhsW0u742P5XcrveZ3YlPGUvDg0BGYDUDEhMOLeUC5AD2vOkmmtSl5iqpRDJy9VxR6wTH
 g685JX1aee/TdUgbOb728ScM1PybCiR/5dZAvmmIVMa6k+QPJMi/3w/D921B9GueeE6OjZ4GXza
 3Yn4ue/dsT5jpTiBRqcgwUWpRk5uYkDbszXHMkBQeWv4OVyq3mX4ACZcKuHJEMuHAOKWFHGpsqv
 y2NdJcSDhW3mEM7AZ5FeXVYG5AXY5CrSuDUnQTBV0sIwCPKQik6qDExqxijYHOS46keKdxJee5T
 5sttG36BEm2DD1p2r5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+OgRmDhtfh2n
 gMLuEkouwy818eFchy1K8p5S6E6EoxYYT1jhMDwCwumm1lWzRqWhIZo1geJePlA5Rk9esFdymO6
 rKS2Vprq+zQAnKyqlqzgib02cEnmemE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

