Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562740;
	b=GpHbUIw/YR6yUFdXVPoxUaNtj5/6GrCjbzgpFBdZHSAapsrHr3bd2kMl5T5hKfYpyHj2
	 LV81QwsfdrR9ZgOC+72mj0N7jS/OMXfCkKwGUNuhPDrkOYz9cCNoHThJerFM/Mfnlyt8s
	 6OppLI429a1YuYjXgevF3y5qdGl9TQvmUK/8ltaIrBlhPwNgIHhEEI4u6m2W54iQenOZ3
	 KgpbxwTzABLZH3oA9RUmUD9tp0w8CuZnDA5RStVOGSbkcVeGs0J++aLy3rcTO9wgiblpj
	 jh2gZlACK5jyN5WdXWLmd+Tmxi9wxrjPdDdRajOLDnnHNd+MwkUQCQ8glcicOd6PvgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=;
	b=2IBdc3Kzctyz/yvhuLTAsMqcbsty14G3gvTqJ2i4bZQoyaJpDMMNQ8XAPLGycIvUNxPD
	 lsKUCEfaGXhW1t2ViEnTU1Ii08kQbl0SpqjR38nIt8LrTZTIOsT9PghlYIWKXBH4fLWcg
	 nnzLkCH3yCSdTo3foqQTPBqtiveVMjYshCemzg/qy548x17R3KvT3ZpRsopzpCyiYAYa0
	 dnFyJ90HEDb8i8zMX7Yx1YoEImRBsgEG7/5VB5s87/P0KQV7JOS9SCIlQEYSZhlYNPt7s
	 VM0b9YdeTdcxUsdO+2PNXjpUNF0LFLiLbSSacm0dPB8lFgRPANp7XaCMh2OhN0LhsOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aax7Kmb/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hu4tRZgs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14F60A2600
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F14F60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aax7Kmb/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hu4tRZgs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uv0M3164540
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=; b=aax7Kmb/MSfhJccA
	8PGDzmcGCa1jw3YGW+Ev1qQh8nZugxsqR6zOeEQBzE6bWEbCvGazUsla9ln8AE34
	dbyvSeZ2+p9UMQ4ARho3q12MtacbtoUVqX73j1RTieg74Zwu/0eHQOG5IIgwHVio
	zRVAbsBp7+ivRgj4urDKES/6ZCegI0uOzY4vZgBwcWmF0xn4bFrPr/dgSVzfO1uH
	Xs2byUCQrcO8oYCaCYMgMPWTknQvwSpcjr3TBcnR6gxWctYWzZ5jQhgFV+4X9K18
	ynNXEkubUaIdH6JZdk/ye0UQaMB9Dz+hUhUw6mKLz6sXsRafGoNOh4Q3bjOjZytt
	C4XoCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms5dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:38:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94958b50eadso17981785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562738; x=1795167538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=;
        b=hu4tRZgsk3hpt6KBZv4EhgKWo1vqvz/KNQmC6qlKE2mbcvcf2HhDz2TYn2+stAwl/P
         t9snqDOxRJPtUvK192W2IGsmey+ZShIbjWxxAVhMpTg9aTXLh9TLIVBCRsSU7ep+fyUg
         dY4PtSSZmZ4TSDNMBZ1clLwaZsLaIHtLJGnjub8pkYvnCDgQJn1AhTT6FTpljh9zBdvq
         14feMH4afGVQC9MTuDitF497UZzNbeeSxyB2pY5hicZpYWpbvTwzCXSyCYwZFWzA3S+n
         s/MdNB9bQOlwDSLcwrtOgFRw2/U2yZ7UoFYFEtrvhZP8m4YK0YGbES7adNFVOgPfGOkR
         c7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562738; x=1795167538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=;
        b=utfAr/Z1nj5R25zdOFuuOLAdKE986Sg85mvo8DdS8ICt1ngi97gYaMadK/Se+7SCjK
         xNDAEPnk1OxdG8j6OS+b/MFgcuf3m5MsSzUUHTV/RUuJu2MwwaL02/ONJAJsSK27vXbc
         LhmeIAqw4SWwhG0emAqF6gc5XBheZ/ZSKQawn1gnVvw4YiwT8YsR29EYVo6c/NfUuvzz
         dm9Z7zJgUwqeA+VzT2fLv/o73mco4xF3NfV6BAC1XUq+OxlvaG19oYJyahFXoaYRr2Uq
         L8bpDgomZevy+0R7Hh1MUGk34SPPgGmpwyKi1qwLn6H4x1G8I17KogBwokWK7A0QXgLh
         TnlQ==
X-Gm-Message-State: APuU4Z+OhHus+/Tw+gMOQir/vMSCVVx38lMMWPmcc+mxQX5NWIPa0PBZ
	jcsLL6eEWYBT02L+Id6MURVzHXXvZxNh1OY8Rh7VFgl2xd2uyHFBD23eIM15nw/kAsaIdAo4Nqk
	MriDXlPDCqsGb8cYSM9AsCwoGO1HnTAMxzM8OsSwa3yKfyUe8TGsaWje+S1KqV3Z5NAPW
X-Gm-Gg: AYBFou3iAe7UTPEw0X+Zh9ZmQHwxafoZej162ENRw4Y4r0LVU5V93DNLQtzYPOGOGMV
	Oc7qRn2WvIyvFIwLIYPQszjox0iqDg8HTq/7KeGqSUkqkjibQysBHIZvD1mTOHURO5Sn2a67Z/y
	wy+kDYMHFAUFQvKnBIk86614LAz7rnjEmjdzPn6X4tGt95ugzJecMjZBjKoXMlBtDPmQj1kIOxJ
	mbCg5e3fk6+UR81RD/RrI+66oqkqEbYNmRBF9Y3ApQhwO0kU4wXABbc4PwXNQ7RzhpSA1yufedi
	7TQBg4DOq/gMtWCAGgphBDyij8qu1GjqX+DogFW++bT+89UgHC+SDVIB/u0aADOU8f5WQpEpuhM
	vay7vaPt1uZvtM/Xc+7hj/8GbspoRUXBlGCYk+x+93R7R+pZNil8aSrd2seDK5IcKJWsCP3jClW
	+8PdK4JLXPnu4Kaie311WA++z70CI7haN8YhcsHqGd3ix0A3p56gGs1Sni4FhCJGg=
X-Received: by 2002:a05:620a:199c:b0:947:6585:aedd with SMTP id af79cd13be357-9494b9c7ee4mr343348785a.6.1794562737848;
        Fri, 13 Nov 2026 01:38:57 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:947:6585:aedd with SMTP id af79cd13be357-9494b9c7ee4mr343347185a.6.1794562737443;
        Fri, 13 Nov 2026 01:38:57 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm46458455e9.13.2026.11.13.01.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:38:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:38:49 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
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
Message-Id: <20261113-nord-gpi-dts-v4-2-e4a1510687c0@oss.qualcomm.com>
References: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
In-Reply-To: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10298;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cAFCNjNiOqULQgAoBZ5vMAFaF79vP+0nTT2bGTSsVc4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9tqrVNEROJllRbx11XQNn5t60E3TB3iHgvMkp
 g2DRQoyGEeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavbaqwAKCRAFnS7L/zaE
 wyEHD/42/rlmfcsVAbClFSi/W/hXqLHh7eQVzcxaqXE9e5hs/fYht1Jc134/0b+S5zx+CrzHvct
 YjMK9KFS9dXA5tePAVQhwQ6/DbAV1ZoLWBaNve/70qCdN5Wg8klBS6CCftOb5UkEyhpYQrpWHcH
 i0jPXVxoovWV1zrdPDmv1FO4Hiv6HDySNQqnqkx/QSDtDdoZnQWkcnck28wFbZKVgmunpIzflZZ
 pY1UCEF5MUZMrSO1Z/fM4JK+sWLI/+WqxUTB2f05/soIXB+5ucR8T8RNfk3ha5pqQ6rweJYpOnp
 L0pHkOti3f+rglQIXb3xbp2r317wk8ptACtfsAA+sXPHpOfbjeFGv/WVqcEoOhuTkd7MTcEJ/mw
 CNXbAhJ2H1CoDKJguJCH64mkeG3TgnViIbW0KCyNAKxD09ya1FZdi8kIucgOGWXs3eSayVNkHw9
 nVlJRJmmesfphTUpw/KyWA3FvTaAaahiD+dDJW/L33eg29VWghHUlstPLZC+G6FqkduNcPKChFP
 mqmPn3wo5pAF5slCIR9LiimDBfHz/AuLRaX5c3VG88Van0XueundTFDZaoAatlJrtC4QvYeXmhP
 cRKYPnXYkaJ2SfDLW+hVYeBqbQQctjZaAxGGQBBqvNbAcnND5WcrA4VxXgT6jFqk0+rKo5IX/Ui
 QMnqzu1X63eGb/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: jqH-HIEYmf2EwZBwc-ut6NEDMgCVt6r1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX3E7kE5IUiAIi
 S4DmtoMaYcrJd6OjLgB/AtBDYZ1dz+YxO3KEF8S3kq7Sv/mwUuUBr52cMIvWdxRku9iPUDc2+NA
 IX+f8kC33vboT6j2vc0Ba2MZ0KFaz2dXyp/5571Oz0/tNa/ty3HwcpqnQ5bU8nQn9VFX0wGMD7e
 431tu7Fi51n8wsQGCfnbPAMQWOB+JLBqXyHRGdAo4PxOSwv5lePnSS7XfzMoIhLgCj0V9O+l7I3
 cRfMo9F5mPNKD3YEreJYRVbOwz8KfvVWU/CYlFdgVWzPv+RQuYCALy2Uj9Qm25htGiQpUhjMFhg
 RVq18cWtu2B5PRVHBlpJcEogDhvdepk9HNUKVNW5+ASuUgod/AMvB4Kr5+VLGdVDUpIbZYTsgJ3
 nTmtNOkwOywVu9zN9Y0Ohx9qs4yxzel7MHf08zXIy3j5LuA98DluqE1s5j7JCi42zCrHRK2sIGm
 FFzVc8n6hlnV9W0ia4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX/bqaHUiKEjmM
 51e+8WsyITFdGB3SfMCNJws2c00AjzFtcGUt9v9fGxruHiThPookoIEf3rZ4/ox6U8k2VcNJKUI
 QFHzTRw+W6fvvZGGIOfjLyCc0ezhU8Q=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6dab3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZrG3xX64ESdAxBh5B44A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jqH-HIEYmf2EwZBwc-ut6NEDMgCVt6r1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 68787db708f613d61c4b88762bc31259304e7f71..818f6054bcec8b020f25b25a774191942e98edbe 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1071,6 +1071,10 @@ i2c14: i2c@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1098,6 +1102,10 @@ i2c15: i2c@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1125,6 +1133,10 @@ i2c16: i2c@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1152,6 +1164,10 @@ i2c17: i2c@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1179,6 +1195,10 @@ i2c18: i2c@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1206,6 +1226,10 @@ i2c19: i2c@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1233,6 +1257,10 @@ i2c20: i2c@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1244,6 +1272,10 @@ spi20: spi@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1290,6 +1322,10 @@ i2c0: i2c@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1309,6 +1345,10 @@ uart0: serial@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1317,6 +1357,10 @@ i2c1: i2c@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1336,6 +1380,10 @@ uart1: serial@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1344,6 +1392,10 @@ i2c2: i2c@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1363,6 +1415,10 @@ uart2: serial@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1371,6 +1427,10 @@ i2c3: i2c@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1390,6 +1450,10 @@ uart3: serial@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1398,6 +1462,10 @@ i2c4: i2c@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1425,6 +1493,10 @@ i2c5: i2c@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1436,6 +1508,10 @@ spi5: spi@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1482,6 +1558,10 @@ i2c7: i2c@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1501,6 +1581,10 @@ uart7: serial@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1509,6 +1593,10 @@ i2c8: i2c@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1528,6 +1616,10 @@ uart8: serial@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1536,6 +1628,10 @@ i2c9: i2c@a88000 {
 				reg = <0x0 0x00a88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1555,6 +1651,10 @@ i2c10: i2c@a8c000 {
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1574,6 +1674,10 @@ i2c11: i2c@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1593,6 +1697,10 @@ uart11: serial@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1601,6 +1709,10 @@ i2c12: i2c@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1620,6 +1732,10 @@ uart12: serial@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1628,6 +1744,10 @@ i2c13: i2c@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1639,6 +1759,10 @@ spi13: spi@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 

-- 
2.47.3

