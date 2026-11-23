Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467353;
	b=O8wgOpeMQP/sE38ZW7ENepMOlOA29heZSYzPcC9pMTDf2+ulta4sPjiNQKnxQAtL2NIQ
	 Q+zPmbUd5QVe0sW+bkb69+uS17Ixa3MrUQnIc8YJ3leGQtHQXa0OYnnJWzo9+wSA/UTEv
	 GbehqA+F3junZNpWAQzUZWUrGWYcO3dz1ZdJpfM39y790fnWrcNd2dqasQhCBNg4todeT
	 dZH4xZkqBqTFkWFysy8tCCawbLwdUdZ3EweJMRCSEgxYHTLDF2EgQ2jXdKea1h0tzV6xy
	 E+d5/8bz4oUpeECtPcY/bSIr0TWx+s/n5g/qPdpnR2/BcFdsmaBM6JnEE1UjMLvuKgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
	b=o9c/RT9o9xuQJ8fnzK0xBD7Z83Zt+UkBtrZbhwCJ8Nr4I1pqFwR31kCfHNkD5DDkHJ/n
	 w0tinDGTCfdZFRT9aVVdNq4zFATLVapbaE3paehVb6OKm1cCS/8kh3gGWo8q0eZp/Tt+4
	 OvNy+j+qR+EMk5578/LvADW+TGn0MMCq3ecbj8WSx6RyPmAmYNxVlbceQuF1kFqzGuUl0
	 dE40U4xYLlD4Kot5ls/MQ9zjhzhvDX6Aj1rOLyu/GJc6jqEtPKj0lrt36/u1vBlV68Dct
	 4sQ/MZYP8lJbpmIEIij7TURl3zx2lgANzYQCGHHT46RhfEE9dKd7Axzx95vZZrdC80g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727B606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1727B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuPvi2350002
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=; b=APu6pruJKuRJdjIk
	YeJmkmvT43n9u64h/gmBKxcfibSMm4ZFWJ8ET9J3EmS1HcIHgEL+CPHry1D7KyK+
	/Wq7SrlmJhbrrnwrHsH+yAYsHHnAUo//U6orKs8xkVro0/nbKK7qwrBAPyytH/Q1
	rwXx0O7nEH/PuCcZXastnf5jwxYlhLo8VuwB+TD6rtwzfx8oINGwQpPi7goZTR/p
	5588ryxci1NWoZz6D0C1/nQ/eAeJ0YkuCWySf6ogCe4brNMNucKafcmQ6ancKnwd
	O+tTfpt94MvFNq2G/C0DAYz8Qv7mne4Tx1xmICX+H3ikd7FCJigAfAu3G8CE2odU
	v1PkNw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a7af8b94so1775815eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467351; x=1796072151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=FiXuGchydlJAO9RDU/V+fOHAIHc61fvyDp36lEe5htwztFldq1hDKyr0XOp48QriA2
         R5se3nz5xTU9DcR1yRAHvB/QZhEtwez2wS6AsWV7crZBLTvN2NZ8UBDqugKLaPkfV29n
         tVKvo3dMKafCw0cOPtYoiYiYX1oE4CxXQoM4dT9KJLz3WF9dcRne7fRykTQ2zRmiyqGG
         u0jxMJarsli2pkc4i/MUOGEDuyv3YXJNfNROFZqDH8RU7tBmAlWFxHQw3QCc6/Mmajvl
         pTe2t/+DJTg8vOMkXdzQDsp8I2CJSC3A9kGCyd6LpZXECmAVNkZodxAOYUbPJcJK76pZ
         0NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467351; x=1796072151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=QQP2xe5WRr4MOObnY68peTYJPnipFG/afhWiRa8AgcPFtPI3fn2O2boqVXdqP+hL4H
         JZoIgTidp3fAeLpoOETBwyLZ2dmLbJa/5nC+CpsNchZcAgRcC/MujVOJo0YvHwJeBrE3
         jG2+/wmsKOnnt/KuVFeS9wgOnd9e+d+pisbr2B9oiR3F7HZ+ZjV7WBVAXL5NK0Gjm+Hy
         jQw3z4IWCIED7vuKz9Sdv4JgUfIjqLWhzpHdrKjGXtzAhAatEu4l9Om60gDHsmbCdakg
         gBwpNLNN80b117h8yya8f3wrmJvCA1Pg99FDyO2l4xUexuhAljGbMWeXgXFQkBHai/s2
         1EYA==
X-Forwarded-Encrypted: i=1; AL+hErGGwSI9Cft7y+qplMZD0tLO1xLHyCvyWrWyTCHESYbNm6V+czHlq9AYGU3a7vTYX+bJjYES744urxUHPyTs@vger.kernel.org
X-Gm-Message-State: APuU4Z/vIYNN7aPKV1OfZaRmBNsHNQY5v6JmT6L7GxAy6cgAceo4cvDs
	fwCnjxH3Y6wjToGQWRApr6iEQ/ngODeofh2YLyq/rduxrh5pqTmpb7bBYUjd3jPqaSdx3UWw39H
	KhsuQA5awAqBL0+lqGz7xygVjKouSQEkjuwYDI+NQMyLjjY5uishnDMhMa8KKWHg+7Jw7
X-Gm-Gg: AZFdTZetwACWUa/OCXJ/Q1ywUM1Y4myDcH1wTA17hF06/NdBRzzZY47vAvBZUjh65VG
	uXK99DcA6WAxNbzEYO81w27O5IPi27HJCHf+UqEUO8c5pFBmk1cWzFUY32byyNWaudz2M0ggTlF
	Aigt4dASlYjVdTwtpRWjQghtjlFQEHb31WU084qYemHVt4OV4XtELxIbREcSb3MejIpID6aD+m1
	/n+z4E0RutxRq1kv9VicMVv7s5KXRlEaokEhE0oC5BC+AciQgM1ktwR9jJdwYpQWQF6INEMTg4+
	F5ihxI4RmvKYF5crsnRQBqr4y7vGeTeu3EeoYt2zRWjcFAkEJAN9q2dpNiH0MKVCykXpG0MyX22
	V4e/MHC8gu+rEJqqxakZ+GLAqNrM/axGcWzRrF/MfDSBkbcfDNt3XhGb8x5cIuYm6Jk99rqFvEa
	P5J+HBKwyO
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555345eec.2.1795467350695;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555309eec.2.1795467350116;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:49 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:47 +0530
Subject: [PATCH v5 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-7-747d5383d538@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1207;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4gGZ4kBU9Ca0wJlDsLv1nEPxLz+5jyLqksSuJ+sGbGc=;
 b=RBVFLuG5HbWKUBG5b/9FUOJu/oqCo1UJjR508Mn6KfkxgGlMz8FiV3zsD0z5Rvk+e+mKhHNt+
 WlwErK0s24kCiiizyVJ3IlLxn8qznWUq+p/iymZiRvTfsMAQRtch8uZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX1h2kjs14BHmr
 nmfqhYtm8liWkRGqF/eksu16YCza4rN3L/NXi5qfxfqLmn2a50QYADrXAZOHIUjelfJGhV5WMro
 5R++DRTKYw/kfCZ81WxAcD7CEJQYXIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4rLKjZwrUoqP
 MDkkrHzyoe3ZIJ2aw1Gc08YqUztJLxNzo4pCYbxnRg3ka8UoUrjWEqI0Z0rum6nTIz4c/sk1iqw
 oDudv1Ih9y1UKCpStaxY1zeHDZc4y07IG3QEe+qVP18xNow3HxsfZV3KixKY60QO0wMuInfyxOF
 5pRjNu/80KLBaW1YhyM1JcHXwyKLlpBbwxh3IHV8Sh3mmQBe3i6nLPPuV9cvWKdMF8+258UOSf1
 2pCQ88AjFOP9C843XszqlSKZexq/dNDKn8Wm36TCsSl7trhTsafh42gmea1VN5uq7aequFnNnEX
 DTbWoDorDVfi/QUOnt2wyY89yZ/bDMLlJnnDClIlKS0ZtmWVFdzy9AzaLMKzjv8esE1rDGTt5MK
 U8ZACxXNTc2aQ6y5ZV3oaL+UkMUFiOfExUaf1cxEw0tZFeS0Z4LshPR0rlfdeWMaB3RU70l5uce
 kY7OXGNPhYS5nmjjdIA==
X-Proofpoint-ORIG-GUID: q81K_IQnpXRxr4Cd8KwD1j71ZXCnfTFU
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a857 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: q81K_IQnpXRxr4Cd8KwD1j71ZXCnfTFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..d9e3a1069d78 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

