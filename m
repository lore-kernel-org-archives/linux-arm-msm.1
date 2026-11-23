Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467346;
	b=GKJCo+zHRjfWUfsqMFiKEfiXu0Rwe8ITQQkhVsK3SWUlIp8mBGqbvhcNa6UoxG/yKrwi
	 y0HxhdNbn2v2V9Ca4RcmrDSoQByMHX3PMNvOenzrLtOd14CRfoOUbX4QgzHq1vZJ1CZcL
	 MgiT+jz/AiEE+tbCn6yMhICp+A9qXuu9AVv1ww46ZKkQoXSbnqbDeakzzJ5foVmEc6u/2
	 oWx/xXKfnfCvFWFaNOWnKYG9uTJRARR3Ukxx7B8Bdmty5qjLl/cg/gbLcS25uVXYJpZ6V
	 JC1NXUBgEe0hDn+JYPEex1BwHZpUQZDSgUwCyVRGj8KZqwIOjfq+Tactaiw04svAHvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
	b=L6TxVERJqafVBC6Tx3y8C6kbSKE1DRpZoZuVd+jTeWH6wJqH14nda6+dTRnAwEHfoWiG
	 mWU6E8CVb+5A5hOdHtLQ8k1OOajv5pdvfkydTTQRvbQaQvBqEbFl/+EQ7KIsWiUbCavEl
	 aMkn+HMtVFrPCjiotRn+lyM/5bPrAyNXLAIGgazPXCwBNTNuN4K4gqGvj+tigTclPJe8f
	 ejoYm84MPpuGsMcjhFzauhatRlAXYh4zBNMx7L8lu9XSqKs7DCXx0WaBgBAs/5Te/vfMx
	 Eu2FEDZMq6b8SVGcQ5p++qW6JfsX5CQVGjjib3L9bAhcEBXgfWstJcDO9T6rTGEREXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF113606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF113606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJunHa1580334
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=; b=TfhYu3p4HLmEAiBW
	Ys7hkLgYGRWjH2zZ2JTzF/Hy+/oTcf0+qFKPXf+uRkCIdFMimev2n4D8JQvok3J6
	Kh6ZNpFq8m26tpUe/caZfgwnDGhD0vzsoH6Mk6oHJVNfV/6Si9txQhQ0veRvGgzS
	omeA+pcT6ia9XcwcDo81OK+CBnVPr0QXKy+eMtoJIi9bLdTXuienzgQkTjwsomFx
	cpuCZTDG36vYNs+xyjemhHRDbT8E7DrFh+SaOGC7Ei6HpULF8ykRc/3TqA9AQjgZ
	G8Pbu4uTDRZTdZC4pgMKclogz9Y9mkcLm0QOeOrOBoaqz/6JXisJ662s0C+hyK87
	toh/1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tbqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so2355275eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467344; x=1796072144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=UHZhb3Vq2Giew2FK0Aqmns/RaGLj05VTLHFhNJJQagLICQPuIZMYg+FGZmijYMVgZf
         8xEaEta6924Lh18aY9gBYChrLLAA6LKTSi/ipdYWP1nZNsfbJ1Yei0dmK1MvqoHU+NZW
         X2AkXx3B10nem4zaEzcRYP7ZrbWECn5oQgw1hf3YUXQiRsOFTKnQb9oB+lEzHsFUiZgx
         sEiR0ByL9YCbipF4uTQ1Pv5PEUWv9DtCTkZr2OobNFfrGZsWmSGU7K0MQ3D9CiGhZwS8
         n69nH/ERdpRFG2IJr/A/SXnCNqd+unAFaH8vzdSCadCJVPPK/Uu6nUg+VeF/qUSVzFzH
         DptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467344; x=1796072144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=cVOejdoJhUdBD2W4lBL1x0unwCZpNxfzMaTGfLFWw4JWaKaD3NdiaFobNUgOOkgobf
         IYcvEFqEVMHvsi5B+L+3ZFPZQAQPwIQ/0TBTrmJOGS5fO960h/4U3TZpH9Hveyj5qtqb
         m84GVx6emmUabQs9OnzkTJIFSkIOERqGg3XwlRhhDH0vpytJqroQwYQl/m8AZ2ljqetU
         o5XBrZ/RBj+FNroG8hFYSK8XrS1GZglSMvFWOLFBNRm2sb7ne92KhH0xb48Xi0ASXKoY
         /GniBQKlmw/Ofpl5sQM5hELjpOQE8lZtKGGaMAJxHCpMbGIweV6eWN5skHa/m+iRkyW5
         /CVw==
X-Forwarded-Encrypted: i=1; AL+hErHpP1LSXIJndC44VzTwQ9tkZkcQwrgLm+RkYk4sDx6jwQRq6sRNgA23n4TA7VgwDaydjoNeRB5Ig6yKaume@vger.kernel.org
X-Gm-Message-State: APuU4Z91hVcAAu3kRDk0WB552VK9cerK7oVXHSowysFpRTxPQ8jAcX5A
	DwtAdFGAMP9/EeYCUhSvnciyha4xxenARkNWRuXDCC2SfDot8vEthC4v5SXU0LcCVnD2I/9kOUE
	YJIpxAMlTXTYH/bdbaa7m+8a6OqVuSM+q/DP/fsslLhHSfveyI873TJMnkATzHKlaNW8k
X-Gm-Gg: AZFdTZdhiLCv2MmIHR6Z9xm4Dj/LAU0Sb+dGkf7BF/1xPKINYnEXSe+w3sWOGG274Ho
	eJ4oUVnXySS6MveRPdJJXUGLYiov+49O05PG6vRnQB4z/Ils/gyFyvaEpwFbpUltq3jYzGDfmt7
	P/dJV1Oh8lHI145swvF35RcHXEB2FZpu8p8JwDezG5Y98gDGuNSgXWpaxUqXVrUJ3MLDKXEXWd5
	qgEd1551LxbaVpSF7oqiOxwKufeCd8z91Z+jHV7l8nhMAJNWyd3Dpcjhr0FF7vtE79ZS7DYGYqL
	T4CUxdr0OfQnsh0L8bxOZnLgbvEBkbqdMoq+5DlfyH/vIwkfiR5TGo2a6ZrKVSUG6sthIpj9voD
	rg6Nk24Ll6y7ygC9nKbZ1e7I/IIoIEH0BPx50Iw7Gde/otf0S1ORWDx0vWpyFr2ZfWuTX0RbAxy
	b0lOPpxl5e
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202064eec.31.1795467344423;
        Mon, 23 Nov 2026 12:55:44 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202032eec.31.1795467343843;
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:46 +0530
Subject: [PATCH v5 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-6-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1301;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ULRBXyIFz867Nh5qIBr+xcji/05W1S7N0crGceoW2e0=;
 b=XGzMJ068AmLrwGRQFHZFLFtWzDcU2FDiEN2mnxyhJfAeDvIbvp5Ol0ciu4Eu3D4VdRnPuwSnH
 20QpK2bPny5AjjLfjdfTcw0eenprUoAhNjIvJZ2etIKzHw0OSylz7HL
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 85N4wSo3wcWGDVvseVKlgfRoOkmD4-oV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX0WMabmvYztOx
 ejYZrPCT5kulp4P2aKMHFk9I1kMD6r+ZwNILV0pGDdbWb+JcVFdLhLklYVWUmvebOGYU/Vs8vni
 eXp3HZcXEPVkfMnCxhdd1q+EIzW3pd0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/sUrIeLklbrC
 aesSlfbksIJ/1Dl/b79tRawqH7rCQ6iZAXN4A2gHOeoJFLs0my5YZG14j3AdqBWnwHB3ayGIe5j
 xVB81i0p1EoWi3MopyF7ZbF+FbZcau0LtO0SduXfESVaqZeFdKDGHUaaLobmjcY+BsZ6apKuqKt
 1dVs/Qqkw775AOtu8x9SXtGl1QopJxWhCErYtwOoSso2tz2P7d8Par8/McWEF1KI5wUbyucH4DV
 t92huyGCZpQxNgUxheNRWhSyY9TiiTHj+7U3mrdhmHTeiR1EOfEPlMwKDEPQJtiiBYxTthBlU2m
 HMX1wp8UdVJw3VGOXPkhcc/mWpDdxfPsjeKNjuJyIPryHJZN67h8IVrTyIsseH0fkFZkwMm9nWz
 /vTWg7i/iDl9FjorbN6pxNlcxCK6//cTLLPXu4h9q/zYcWHNMi8X9CUdk8giD2RNYxsDoirpzxu
 NA/svQY8KXfrSeW7dJw==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04a851 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 85N4wSo3wcWGDVvseVKlgfRoOkmD4-oV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

