Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3C364949
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726949; cv=none; b=SqsohAilzSqdfV9iRpbzBDjnq27ar6wiFdwGetdnEZj05NqFUa3MGvgnH2DI0txiKOv5S+8Dw16YvyvTvs5FjqJGvHUhM7kW/EQY4Fb0H/3h9mn2UAgjGvmzOI1MdzmveBY0afzK71o0PYYu+x9hYV/X73+aFczxeJd0txr22yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726949; c=relaxed/simple;
	bh=XZLciamH/wbfMlCyMbSXczWHwkmWjTG5jgkd1xDkSi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QTKjITEQUcP1siQo5zpwnk8X0G5IMN+ITaEr3R6kNaQJNxSR67C/mhziSi39K16huxJ4D0sIRvB5oYt7y8qLy59nqJzksFIrgrS+elO95elgVtMhVvE+RMxmUELcuPIyigks9WNLapL032WjQ9HwwqTkrJJ2++7fXUINx8eBqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqEcxq8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoPlBDgU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqEcxq8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoPlBDgU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672NQcvq3531581
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gexg2OCd5HT
	5LbNBVBev2qK2kO8LY++t9yEzWXMAh38=; b=iqEcxq8y26eonL304FCX5HJOVgB
	lUZcyAwMU3vQzeVHvV3s6vs4rR11E6YvIaCOVrXzMUgR02oUwKUUn8gyoVg4Kkma
	rTe5VWLRX7J04iYSb2h/bb+oPZqrQAj1vlhYlRdnYasE2L5BWTnjQ1dEY8cUuPSJ
	toqqbdE6gK9SvwhjVkFCywtAEIJj+zJut7GgR/G7KwtNvl9ITgav1C2StZ7J6t3u
	KngARDcsX1DxtwcGiLHMWpVuIi2J8Th5fhfv1JgF7sNoXdWfp3DoyRVOfab/20ou
	4WKDYRGFgJMECERcGhF2kUrZvlyMhLQ6GVl9sYVxlllG/u/5pwjneqhv88g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpv8vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e667368f0so5405782a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726945; x=1786331745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gexg2OCd5HT5LbNBVBev2qK2kO8LY++t9yEzWXMAh38=;
        b=JoPlBDgUbSSIUWcsc4fiegYI7iMXkMqvgjv7rXOPnBCoaBpd+ve6S1s+yoBjWBzJp3
         Nt/Yq6jvvQ5wojw1llsTkrQgrEDk6rofyOiknK8PJ6hU63vwEBJ18wdUEZd/qNKcZ01/
         8GYEZDQkHToptbRUP3+y/4p2rXA3wwMRMm98G1mHAH62HPRbgnMYUA8ZVgvNOB8+ZjSR
         FEuEkU3APsMRvuz1SSdZDgN+hUoqQQUV8xNYPkU7eEvzRGbn4se1Nvpz0AgTjP2etyLN
         SRUubGpbW31Ikof8ESXd/4+We07PFG5HrCMyyAg2IOKMUcKNN8lzpaqxL5xWsZGKH3uD
         JpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726945; x=1786331745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gexg2OCd5HT5LbNBVBev2qK2kO8LY++t9yEzWXMAh38=;
        b=dlQvpmR7gqBoKHlO7ZinCgREGG7dEr6JCZtGpZ6/Of8iPtAjzGIvsFYyeyZLDhfSHK
         moj/GiORPNnAre5O99DalrnNdsqf83go/f4j/0TS4UsqLQ2wCobJVpltqcUYDh54xmAF
         Brc4bgIz15eTVJtkyE/wslQPsJPL5ifrDyl3V0exDNmytsZ5J+x3uJuRR3I4rcPbQsXW
         4UNRE/qgLyj/hXoidvXdITACMcGqj2mu3Pr/fIKI5L2es9jfRti5duCD0tpBpJDj36D2
         OsPC+l3hUnA2T0DHSkQxahJxwzSYUt+HWtl8ZpJGnZhRjVaNMh5rem0zlHv1JH2avoPs
         23tQ==
X-Gm-Message-State: AOJu0Yy4+IOUM+83GMDkRzjAr0hgbDAiYzWWjePaD26YwIWYikLASEwn
	K1ZR2wh/N7Kahs6BKf4r2W3aTJhNsRZaaxsLkpRs28pa3Ar2HwxS3guaskaxAvNiu98FrTqXvYZ
	1I9AAWc70vn6o+exldm8hMPjv6PUU6vwffujnvZaXRcTShqvCWu8OemdObkZ4mJkx2NuX
X-Gm-Gg: AR+sD12bffEwOfkfEz5Cbc+cUeYmnJ3Q53Ha4JCMUPP+gzLPWysxadtUNjr42RiiOkt
	qyE5WH/KfCmDgosRg2/ewxRWrqmhhLbgeeTpYBuMb+AS+AxpBYhVSL+YEwqhOsXAEeEVMsBXTQ3
	YuujOfSOPEWhUuoK5rl17FZIQtq3tB1FjfL5ZWArQdkRZYItAC9Ygx6ONSY6VEKFIxTW4nIZkfl
	jdC2LLUYr0jb4stqTCni8HBxlloc3fDQJluTBhADKVeBUnMcYAkYiHv2mv9CygvqNnxKinPB/Ay
	/P6EgNdIL5zFCNBVqzIqOJu/zhdN2ZTG9tZljQzOX93Nkp70aGbTyUJf7/WOK/S6yeEhHwlKDIo
	UJHCOfdpQK5TXFylry/PTd+GSo+w4QXRiLuYCXe7hP3R0poF7wWifig==
X-Received: by 2002:a05:6a21:338a:b0:3c3:791e:5e12 with SMTP id adf61e73a8af0-3c92a8e2cedmr8565831637.72.1785726945096;
        Sun, 02 Aug 2026 20:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:338a:b0:3c3:791e:5e12 with SMTP id adf61e73a8af0-3c92a8e2cedmr8565806637.72.1785726944641;
        Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
Date: Sun,  2 Aug 2026 20:15:33 -0700
Message-Id: <20260803031534.2942628-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX8bLcZz1anpTy
 /Cq4qGgliR8WsIQ0CXokljS5W2iVRMldHQK42qAdkJfCXj2+zOSPl6/0iHwcdXFk0GlkRpIN3kl
 fcEuFg6/acXoYPhVNBvxkW0+79GIQxbN4Ly4m/XGq3zSyI1a8O2PV9qtGE2/Y99DOeEW0AB4b89
 l6FpX6iAnGHDRzdV5rOu5+5V3XtglXTjuwqzCYS2XhKBrNy3By89C2T/HqsMI+q1HG/X+CMdEAp
 xrq3tEkYEaP7AbfiL0xkq0XDAQwoEv3UiCohA9ZXq0eqCqbRISBWRF7zY1Ell5aWHlJ0BCyYkde
 ou+fxpmuUwU2y/xSTEl53Y3OOcxFdaA429d0yP2V4/zZjRrOS+cKEoxUr0R2DmGishIHGqADNwH
 ccKPPXkHas/8FLE+9j0zwNwWCW5f0hBZEwE4gEgrLruEq1uOpz788+1LVBZ+ElaSUGqVzQZHiDB
 v97HcJoLTYEupj2GSlw==
X-Proofpoint-GUID: 8jONxJsGS-C4EObDi0Wjvymfk-rgyRYA
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a7007e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=-Y8wEhFFMILef-Bpc8oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8jONxJsGS-C4EObDi0Wjvymfk-rgyRYA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX+IuUPSROE006
 lWqG0LbjkbSi7EUaDS+BPW112Z2APJE7rdfXUD08TUnkgWMpLtDxsKQVMLphizEfyF7TaASpGOi
 hx5Yz9fajOb63joR1asD3pf8EI6hqgc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the UTMI path now accurately described, enable the EUD by default.
The connector side of the path is left unspecified, allowing board-level
DTS files to describe the physical connector mapping.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..be9d02760a98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4404,12 +4404,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4736,16 +4730,28 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4972,6 +4978,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
-- 
2.34.1

