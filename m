Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264579;
	b=sijj9ryPFXBftNgGhOF1J+2vQEnu0ktpMLjU/oRaW0hyokivPnGW2Z94C/Md79uTh2mu
	 59R/tDdweL+EvS0j/lg1BiJz1M5RRQ6GKApFc+WyAuDhaQBAqW2SOLm9/BBc8twcWtfEn
	 2d2agzZsBVFYplT/YGaIFlY6cINvzg3bNMmyl80UJ+41ZgLyGiUcfb1dpzgFFEa1jiEjA
	 AVy7ncj0Y9uhWTVNzn+S9K85hMfXbtSdHhV43bzFyUnEAHSGMOXQaAMB4RSuy1uYh9zZ4
	 Dx+M6QjAIK1TQ+/Pk5cCvdv6gJwRJ1RbAUR/DnBlzd7uWI/3vngPys9hviXTpTbQ1Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
	b=BUR8jZU+L/ILd0f71f2yG/TIoGthfuPHgkzSDwPmI5OofsCnAEfxLFrBOlpLtaz/t4FM
	 HtB+sFwu0PnZXhtAJ2oFNKaUY1Y2c54mQ6qm8jSwPDJHARJM8SIwDRaZdbB8ACzUAJpZh
	 e2c4YkkwuTojg+j/1MYC9iDiD/3mvUvljIlxvL2Q2+o5h9mnUt2GpHNABumPpV6v2YygJ
	 wcmczlFfxCDlTKMDHXlXsAXENhlri4/NQO0BSKOnP4fP2pw627K2T8l8SCwothdfc5lvC
	 CN6JWGd4EK+NpOhLM4iOQ4KxgJoaf+gVKImfUHQ5/WniTuiKZbFjgo5NhusgbhtGX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UGzuI/fB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxBYIiiW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA40606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA40606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGzuI/fB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxBYIiiW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vAC02273159
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=; b=UGzuI/fBbzLudgIS
	gXr14iwDFjdzVTsZFGYigdgyuhuNl4dIWN4tkZxbHkqFlOdGYV5FD/wfbGCsLe8m
	5LbnXlm+FB9lTB4HzzK+MWPVUnvRybey86pXLOvGcM0Nu1RY5Rz11JBe7zUaGgOH
	FdX36c48cKPgTzqhwC3NR+TlESLZ/CNMZxHKc39P3KzUF9LE4wLBq7o5l4/NE2sU
	qF1luJhDxxIIZzKWk8s/DKfK6sbDO0PhVT6l0fy72a5J30ErkNG3/vlguxL7Axse
	m7PifjR8kQ2+P73kPBopA+kO5+x7eYyJG5dz0YrGkL6PpfVSBsNu5RD5wFRKLlAw
	fgWg/A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b01ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso343010a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264578; x=1793869378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
        b=AxBYIiiWtexYPCSJmTsUVTiKGpCgiY3fVJI/dI/nAQPXqm1ZRymFmF05oKATeW9867
         v0iN3y9tBEhW2WwAHaSJfxl6GXnrm6Qk79QlPQUD+CVIcgIMsSntlF5MjgYZmI9zQftr
         tC5qVJzqvQAFctsmjqKBcGCDCY31vKYhV4pHviyx3mTvqQBJXPp8qyLiScnb+Ea6Lst/
         K4FEh0pnmJihrTBgO1JZRZocwmdTqUCJp4pjn3QNVAUwBvGhhclp676+hvVWoJ1fT294
         6U5NEpvGEzGAlOdqupyetu30uJhhUvWudFzVTCbXuKK95IPPJ9G2suI7cA7E2ZnaoBLA
         KeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264578; x=1793869378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
        b=WuMRwaxCVEj+v5MPHBVwP8T6AHcsG4RGAceM8oioOar2yCoOr1+tXzIpIqH6cWi1H2
         bFsiH6lkQGexa6Zrk4LHUVnN4cahgxpJQDLfT4UHiIdVpfyaU0nMnJGFoKt58utBALP6
         SrC7F4LNWnXEt8I3GkX9JNI+fFXPI7TXbDSt2s6Cxh/cIEn+3nULHLO0ekYCvEeC/CsQ
         5ArbA9D38MfrQzcNNKKqEE4B4XnATEL8pFSXxr5HsInRfBBre8veagOJSKZxpyLLuM+H
         D6K0iYm8XSpz4yafv1TxZhB4rxa+dPH6w/SpUWK+7bP0i062WwDeay/uhnM+7gyHrVK9
         9W+w==
X-Forwarded-Encrypted: i=1; AKwUvBwVscUDA9SpY45HY3IUd7mnGPibtFzlzPj//3mTR80R2O7KPqMT66yybyGigrKFTMLGAZlRwskvokmtZJ31@vger.kernel.org
X-Gm-Message-State: AFq9FYKK5ugQVNYQ0VNUPXMFiHLTJdlVrU0zKGJsDxQqeLDPqoRr6gOS
	qZWYDoKBsaAvsa+jRQBoFZLY23iyTSTVOiXqvKrraexXBZG8yYYwqr9bzt3/wqHN1g6TCSjjInF
	Ci9syrRaoS+EiR8q2TGSyY1f0znfVkQjvoO8pRZvBdmkS3a/YrxOaDqu2F6Vz5s7xgwI2
X-Gm-Gg: AYBFou0EeTT/lPdbiGpvqMYKqXB74aEOgio6GVJ/b6nH1yL39GimVZxEK7OchV8JSkA
	jy7FYI2wUmO1+D9mEGFMZ4uYvetZMf7quwVXbQ0ycqgyxrg6fwW82KHBSsBIn5Y2uhVXlBJ/W24
	DWJUeMTUnHIT/gwiCWjw7I2gP+mOcHQS952QYR8LpkWFgOAu2pj+o6J9sVzYrpcB2W2khZfqb/c
	nFqPkOO6T4Co+arY/FmEF9pAHTmqnzTdwACcYS7x95KwpSshQan4oyfsUto6KNKpFtkppYvE7AC
	V+sjJ7g5FvH71EI39u3nx+wYMxsP/Qtj3y9VPhhhXTi+5zpduyWR/ZvGP0kYnL8dqa1ZoIm5JU/
	uW3D6iNtGjIM0yvmfyUPFtsKlPiZq9b/yHww5s4I/OWKo5j+cGe7aeU+GsONL+/b0PupkywvH93
	htLE0BhQU0
X-Received: by 2002:a17:90b:46:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ae5823c672mr3892942a91.56.1793264578105;
        Thu, 29 Oct 2026 02:02:58 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ae5823c672mr3892899a91.56.1793264577591;
        Thu, 29 Oct 2026 02:02:57 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:57 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:04 +0530
Subject: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WI51nMUK6qgMXe/JMYvx21HtG2tpC5q/6iKj1pJYETw=;
 b=gGvS3BpXvoO4+rAnmMB8gWe5F/jUrTtj0OtL+qKpMHz1TeSAYRy3TL5xGqfr7v91arFxZBUnY
 IUqkMdrzwNlAtyHZYqier3l3JTqGKtZc+5XnqRKZZeif4m/l9NQFXFW
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX/oaSwSOBNKqO
 Rcno8zP47uFGYQJ6VfzHu87KsjidyUrRopnnGyWrDDPPfquRyulQLo7YjVjIME9sv4IImiP+2n0
 EpuUmxAP9PncLSVdLoEy00oNuRJyDy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX2H23Kr0zW0AP
 ifB87W1+S3QAwS/n4lvUIA7e74vmDl9b+YW4kIF1+jQWOGkGgmbJO1mFEi8Q9ecBrrpaSiNplDj
 T6nRFCt0HE30Voh/Ju1ObeC6ZrAdq+QsGaNynDYkY8n7TzORrdf9/NG0rgI1LwRMj7m5s//CfvR
 RCcA2Ar9EZyaOtAXPTPfZeTbgn68D66oPMjFk9QOKsM+CQMCh4x7rukPNyEIsZjh0EwP/HZ4lYR
 m281HNWsug5OjxxZcjmgTiC/Na4ABhsAWhP+daicu5cnx6TaRAK/NiEqSy+1tZ6B/shE0yjvDzI
 IjdY3T2dk/I4RVWzZCqJDrC2Rp0kSMtRk6EflCaehfX3Ns1iEnHiKLT9VoYkg+uZJFGyH5KGUPg
 yJO56clez3/Sk90MLzG7GfzlNxnSk163zkpsKfTfjmhBPFDZNF5pzK2lPfcZt1W6EwzSsVy72BX
 IqPKkzXIsUQ9tl/cEbQ==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae30bc2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jOS_gLp5hvlds8ZstEqIsbFKG-1CAOg9
X-Proofpoint-ORIG-GUID: jOS_gLp5hvlds8ZstEqIsbFKG-1CAOg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 142dafb04324..30e4cb642473 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -497,6 +497,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..03da6400c5f2 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

