Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264559;
	b=SCkG1K4iA7+6Bx09RQoI2gYYuP07BiBqGUwqmHrVU4smkKFtvcBU+W50EEd/FwRlngNm
	 iiFBSbjIBjv+xJXX8rJ76bOi1N35mb7d1R8m/ba5JV1+sKA0OLxmh/8puq+zAX/CnhH99
	 2bUJNfWwIRostXw+XPF2K6WdC5euJrQI/lSnOGB2nrxKD13fwfutdWEpSQNZoqxS3TsIG
	 Yv18C6U8C1BJ6AcH7mDAL7AHBiyYKTcGybzkJGr5HVJjJxO3j8EgvVXTy2x6m2KXlxlrc
	 I8VGfj/1/QNkLI5fph7hg7GhLlhgC5EAPFLczUg11PChSNYt9tUjA91tqA+IBOVvj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
	b=XGbAGMyxjNNYtXd+0d7icuw3KqNH5shf9QDznsrkT9dK++/8Xakh1zG1u2bPbOPSLHeO
	 fnFEjGEznBXeI5PiDWLWxFMdBnGR1JioQ7fJan/20TwDORyq+vtgIQ9vLkH5SL/I6Kwpk
	 PmjVdNWZwRsSRBNJAXoyJswgYh1NEv6h1inoUAtq7kSxyjqEhYa1r5r94PwDrL2AdMGoK
	 6fBXYm0ADfYKnDyOESY4zTAZHFisLuN9bGTEa7HjAJbsWaSOZ+KhiNQ1+EoDHqibtmDMT
	 eKRsV8vVqSQ3nzMzl3Eh+6Bw3L1CqZCIE9A7A1p8KnLA3gdgNs/NTAijAvLm79F3FgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ic7hLohu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77560A3809
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F77560A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ic7hLohu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vUSF179449
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=; b=NKqGF1VvtwIDpwwr
	inzRuKWlzCHrLd3cZGadTm7aUbKkNOGuRoldTpmGOi7tTNYVDgUzDiXw5sSEv6ou
	RqJiH86IVenMFITE6Igdbzdgx4bZA2VSxNvgkfgm3xIt1f0IgKOVmZr53X8WI+4i
	zyVhx/RLgBhy8BL1zgiVPdpkuhAhYY29GMpWfmBZ9+vP+Dj06wg8FLlZ4MoumLBF
	XpVpWBzDJHSV/Zw2Dfo4GdYXouNxrTnlygj4YY4OETu7sh+lRlxsN0Cz5xhWWfKj
	JXmFhftlshy7o0dGiUODO3ycB32Qzj101OVfBAZ7XokoynyrQ4qkE8i7lyrqdmtL
	mHRQkg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2rrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1088149a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264556; x=1793869356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=ic7hLohu00gy4YEutOZjDefzc+eP37xTvgZCA+HRnRJ0l1boTcPZ49wCed863Ci3pq
         htuqpDS1n435NX3W3bfvuwJwtE8mB0XEoOgNRXsOx1FXe7dyilcNS7bQHo37IMAnGlx4
         ZRFuli5Xy4GiyUYbOQdD11T0cNNDe/7cxMeSZAFtNHjo/EPAFVTAymPeJe/70mYzru+s
         vhIkqRy+ex/nZLPJKUokqLjhLPYFKoyT5EV+Mif5AVdSg3/8z67eq/K6QynDbyrFgW42
         bsEcvrUGDTvsNBPKH06sMRKO94JuxsSJKuJnolqPCpdlY/Ptz1dpsTjwnhWlrGcCww5p
         JqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264556; x=1793869356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=FXBPzmmUNMyHFmWe1ONYjkBHwZJVGOv/In+gmjLMG5izmG67+2Wg4jwk6fSECdyAmi
         qtAfV50yDPB1vb59wf9TbnOKA2vfN5RbBCXQ5Q7u4ubb3uLsfZwISkZ1KBGNA01f5OSj
         SQ41jJxEWTdbGPS5rt+cD7qV1LbOo2sQY/ROHUggvtVvSvNYy0Bg4UJBwPzh+e9+G9Ep
         2OGV0tzVPgBzVYkC5hh5Q/JvtJPUHNlgYf+loVSfubyQ8hCsoV2i5HGSn9YjcNKsLrDa
         hDssiKE83FQCe9FeO8IvkcaNbfHf1vwSlwxMM1uAVWJSlQVn0GiNyjNiUOu5CwECxUWE
         EAPA==
X-Forwarded-Encrypted: i=1; AKwUvBxAtSR5vp9qqTvpfF9CWIkA/Vlp1XM8ccE20dN/Y5aV7QyQPDRFYRL4wO63ZA9vK9MZhoNaQIDE1ss5lQIO@vger.kernel.org
X-Gm-Message-State: AFq9FYJKaw9cB3p2wByvwrJobQ3XwTDb8T+xgRkYGr/hOEtBDfbsEzbO
	gjFjMrvXlOj8G//NWA19JqRAbfGOYrVYH/z2qa56scLVkT2R9757QQJG2KvR/6SP3U/qP2SxbS/
	Wiev2TvCK13iB78hWI5U50o/8XdtcY7NTxMuYh5IyEkBkx2tJA3vKK4WZcee0xVKuCEkt
X-Gm-Gg: AYBFou151+9FuhodCrdSUlzSlBUfd6cLSM7LqsbssCSkjZ8sxySa6U0+f53D21m5RaD
	wmSa+/4kbpg3H35XkEoCHzePF3Zys9M6l4B7wbpftu8rXTPbyrViFSDASRPg6aJrhlw0aH40F9t
	pxKcNVPoEJrQjBluNtG0jGQUtvB1zQRZpPFbvvGWt6NrsVNPBc5Fifv84N+5sKxC9iQ/den3qYJ
	Bk49xBv9YtOEmDyzYH2tk13tZ3ApqUd/FXJQCl1XgQyMiLfo1W7G0W2hNj+H3F+429Hvp1YoScM
	od1CjKu0eI23ikfgB4L8TI/2wTauy2TUmd0okQRtwGjgZw31fenpI+/+btEIEFriHMlEneu6KI5
	Pruk0nFnvHuIfqXkwMFB38l1QV62zSTPQjs9LjgapWIoAWpx8Rl+QLohG5HAncbPrbt9GnH058M
	wMqQJ16TJA
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666996a91.10.1793264556407;
        Thu, 29 Oct 2026 02:02:36 -0700 (PDT)
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666958a91.10.1793264555885;
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:02 +0530
Subject: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gUHmNfAuWSYEWCrqca1lth83sZOdzcZT7fFtab0nqZg=;
 b=tZ6kTFHVewvVVG6bopBgc2U27Y/TWood54vwPyEmvAH/mC5OZWsNPa1HWUamZvs/3iiJ8lujn
 d84JnSP8NaKAUic89Xwjwa9PH4byCgb0SIYM6OYeBNad6fJoaTHUdow
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30bad cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: AhK2J1uSpLzAfKsLohsyg217JLfr33Vt
X-Proofpoint-ORIG-GUID: AhK2J1uSpLzAfKsLohsyg217JLfr33Vt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX3jDdGiBg96jg
 y8d1BxGnOkQzBIbQ2vsrD7OlKzgJHP1RENkNuc1XL2CBSwDrXOHvOKkNNPhRANd6UVeWjfS1B6B
 J3nGExtES+cRWxukomvNcW1dNmrssVEGA+wdCpuSmnxo/eTg89QTGJ0S7hLAZ6EZPNC1UcJ3eZU
 C+ZK3A25DqI8evGnIDcKECsOfaFut/ch3xWtIr7MMgdetWWe6yLuLi0L4oVIygpXZkyQbjRYaIU
 mlJ5hjS2YlKZQtxNj0XaXczvkuZJ8H4uiVrv1oUTNm3vZBtCOZZccmfauwd296BHEdIgtrKlZWy
 wq6ObtfsZSI41LjApurni9zy80jXN6WW1Zx016hGi0ymM0laCQIo3HNTvLOxgNhjU2X37sgqeG8
 9fq3Lu5xkmQ5CQHYoE3hv8B4r3ZjMFWqC4tGrlCr2Kd/GFXGx55MVXkEb+ftRWjL2sE/kCiODHG
 26iNSrREPMhtJISsQFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9LkHmqoxuhoX
 dYODsSt75l/USdx+p1EvZzJQnHevOp2q6S/zjL5Yw9tAwkybIk0njCuEZ904Me36W16UgSjW+89
 EmUrg6+c4bJsF2UxRjK7Mz7pf5rVYzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..4d5fa2ee1f88 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -912,6 +912,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 22f764b8d721..a530a363a9bf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..6564eec6bbed 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

