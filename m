Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171720;
	b=su8rS2D3/RdPTfoSZC88+/ULe3aJ+LwZswXJZn7mi6sXaOELfGFU0Sv9jnsJOX/uneXc
	 J/UU3kX424FFneOwADkV24xiB/Kt/p9Ef1ev4Z8XG5sLpbPXVVhjTU002HpzhPQ611Uzo
	 bG9FXtxgvoi0uDQjNyqxfzSxQmK0pBvDao8dnThywSnfgSNnGtRr6oTo/i0H2V3os9lLz
	 pnjTTr8NVUJvygqtpWMFNjQY+0gv3VNrc5T27HzDzE/nJg0K7znt8fN3Px7zSOYwiL6Bm
	 cGoNdJOEZO06Lmv6KZv8B9p9aOompXfownzKnjadDLzJDsMPT7by0vjc3CKDmqU4b0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bxBe43Sx3SXo9QGPZLeDa4dlqEQO6+5n2TVQ0QXfiGc=;
	b=nj0GRuNSi471HEYhrqETtxSOjx529ogTVknaCRyHBtqDXX3/d3o4mVnx/7/0KGFs1ZA1
	 OeHjszJuNzlDoCYO1MToP8NWRZnNzz9urs6ePeS9pOEmP/BPP/MPqbkSTMBfP/RrOJHHs
	 bG8X/eseRipuIJFoFbAdpzC/datU4Do7cSGqi2Kp72/dzolB8rE0dnjRT9BejOvq4VkKr
	 dcE7kC2vEa1l/+LcSI/AqXshkzIWcXjCvQbFHmsWj0UxqGae/vq85i0Yad6+faftqE3RW
	 iUjLYKHVd5IFujgUq/uaRoK1DSSbxfdpVzF8Vzs/Tplsq1mp6z9Gw1ZG5elnxj/03iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J9r1PShr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKGdSwoO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB10606A321
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 21:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB10606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J9r1PShr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKGdSwoO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ke4Z22453178
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 21:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bxBe43Sx3SXo9QGPZLeDa4
	dlqEQO6+5n2TVQ0QXfiGc=; b=J9r1PShrjJz5zT80BxEX6N6rwRzHMrCWU3Au59
	Xow3E2LOU2UadJhRB7vjlgh5IApgO70B2OBoDnZLGG7Lnhg907evr1uHsdgQYD+Y
	HlZuZQo6rCFH8H0RdOnH1loivPN4jAbUW3sSQpdlXEZJ9crKn54M5HD/Tdk2uKv/
	AtPZVNfSP58Lu4lQuLvpV4cPkcJ3ZIr2QjLX5gc9zXpe2vkJeA7Sn+VZm44nYfVR
	P3NMRfKEhFeDQYUvRy90NbsSQA8NnFF/+rh6c179SEHez4nbxjfxyJ3EEGtBOajr
	QXbIAqeFbrgTaTipWLQDH/GG/drYw/0t2qSbU+6oHxk6eOlg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2ubp4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 21:01:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so321230e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794171718; x=1794776518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxBe43Sx3SXo9QGPZLeDa4dlqEQO6+5n2TVQ0QXfiGc=;
        b=TKGdSwoOdHlRJxBcQKL/LZKYH3fMbwqcsmyZ/MQcxa5ClNM/2mQ5Xwre68DeZ6XhcE
         5YE3IEl0YoDP111CKRukJrn1U7A0P0PiwBEjjP6HEvDWNqtIxqqn1GlVPu3mPoNP/vZ1
         vxe1zTRRyFmdOoYqKybDIn9aC/V7GD9E0w+ivMag7IOs+xX6a4Hqi02Bd23Irio2xyVq
         Y7+OxUCx7sizayX+PtuC9WjTZLaCazFr9L8HUp9XwYsoiA4hr/UT/r91bLZiU7ZGycMN
         4PzEZQCHOQhUyyT/m2qbKOU4SSYJhLmZVT8ZtNECpQlWMbQjVgLSsx+QfgzRn9Zo97xD
         ki6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171718; x=1794776518;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bxBe43Sx3SXo9QGPZLeDa4dlqEQO6+5n2TVQ0QXfiGc=;
        b=RWZN2ddvjjTqKjH6zTMRZoW9rX7q0gP1kWZinAXkv8wgviZhbSguH0b/qBzBZ+fVe4
         qang3EVfW9rpGEtmB0lYwllaG8QUZZsJeYLe+Gip6VbK1ER+SysyAIHT5et/PTgsOnFg
         /j2/+Ds0PWrBua6P+7OO2ljnsysfvoP6oyJg+7euEUqvvgc7eZ0R4VoJ6qlfAViubjm4
         wXzPgRAmgnIv/SpIQOAKlHVHpNorDPiVuw52l7Zy22wonwYGNny7B58rwk6eJQk09cxV
         aFDX7d8eBKQ/uBVesRj2Y9iyzVTsSW6WwZINVMr3w0lOv/269DPLTfaUXiKYtkBr+lf9
         t0gg==
X-Forwarded-Encrypted: i=1; AL+hErG8QmR/KJlLZ5SHgLwKtZYwIdphDbum9uTK7kjC07DqRg+F8vVybtahX9sF0H4MuKrqsGYCVzCkgiqt9AYl@vger.kernel.org
X-Gm-Message-State: APuU4Z/57RDrirVCQUD1vqHDM8Cka2RVxgIIvWIpF7YUy8v8YQNrzfMc
	d4NNt9SGms9+Hkaw0PZKVhkQ/5Yebu/6g8rwX7eBd6VyL0tqcLV/gdfUO/bCVxBA+6oqiqpjkyF
	Xt+Z8RE9x0stIC6SMi1XYKIHS49uSsPeGaALeKzV2Bq6zuw/PLkrM2YRZN6DYIbPm93ct
X-Gm-Gg: AYBFou0PGAwliAptspjJwwjBtR+kJPAaROhiZLP3yvLaXoPl4rt8UtAiNRgCM31Pd9i
	JHO2vxcN0zJSfF09u/CxKsHJybc1r7Z9+eDvM1x8AFXKnySjEXE9tucM9fVHBku9dI4x060JF2E
	TfOQ69hFKvdjnawwB+OCxXOU+z6u6V3T4VDt0WxL+4aIwYYSVbWeWvHS75byNspfVjcX+mBVa2B
	KG9o1IclGPdv1I4jfDcvHbXapNsntddg1bYAlrgiOZf2JEqU7ndhVmYSy3rxv5MQ6lzmtWobzhv
	iSAyFudzsCAZY452hXlvJf4A0MBGrmkVPtvSVVjxR/xZGyPzS6OdffXlCFJdNh76XQAiKK/q7E8
	z39ijFMFU65WJvbdTaABpOwFPD42q/auDUbpmLrHCAuU6h66xddzIlfNr7w==
X-Received: by 2002:a05:6102:6e86:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d2db2f24d2mr571651137.36.1794171717598;
        Sun, 08 Nov 2026 13:01:57 -0800 (PST)
X-Received: by 2002:a05:6102:6e86:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d2db2f24d2mr571638137.36.1794171716858;
        Sun, 08 Nov 2026 13:01:56 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495b90701c7sm7148396f8f.10.2026.11.08.13.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:01:56 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 23:01:52 +0200
Subject: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Fix LDO
 voltages
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
Message-Id: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD/j8GoC/yXMQQ6CMBBA0auQWTsJxZaqVzEugA5lDGlNpxISw
 t2tsHyL/zcQSkwCj2qDRAsLx1CgLhUMUxc8IbtiaOqmVaq+YVZa0FOwOLuIS5xz50nQGavNdbw
 7azSU+JNo5PUYP1+n5du/acj/G+z7D9d3Wxh6AAAA
X-Change-ID: 20261108-t14s-gen7-ldo-voltages-d57453f9d754
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8458;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=afW58oeMQ6NuADX1ToViBnA63jAR2ct2DeEycMfIov4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq8ONBfccHr1owjFwwh48S2RgWsT4LR5LOLpuy3
 cp0cxfQ7ZCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCavDjQQAKCRAbX0TJAJUV
 VmEAD/9Q/BjNQ17GiEV3v6S9at87N9crhtWjJk1jx7xRiXPOH14mcNrs68S3JOHqbQZucNbMY66
 8jdUcrcrsU8eCHBlljEb+C6o/M3NFrvwTh9FdOTHOfFmhF9XaYx9Etlz0fI9K6NI7nTFUFFpknV
 /i65ARKnKJxanm3ylLmbI9Y+hTgSu2vTTLZn8Q1ORS0VYgOR573HUeVu/PGJF/yR1XNfUwth/h7
 Q72Uv8XWvo/E8f/RO2hOVtxt5RTKzB9VYqHZEZzXns87VYkYbSw8X42fQ0/5VOsl+SkAiM5UzPf
 NNk3zQ8gnspRpqODDYR9UwJw3hA6klTbxjsoEtExET/C2zwkTKK2VV52hVXtaodTtOxS/oFxSzL
 IGOLiCB+R2NVaicKB7wq4cJsKpm41nR3rvbY+EI8qVO2fR0Droqe2g/+vSwRr8hcotbeXGVaQTj
 IfM0/N3ElFyhJlgpglNOzFBfGd6ePMiG7+gzI1ML13K3Aq4hiaG0iO6IaqpRYnI++NJvvE4Cc19
 VO0wS93B5i/c4hrblOusQ8uHSyTURxcMWKuDpQO09Gc+oTw11MLSe0xWRCCTQNN5EAtDQYWbEYs
 QfEIjiEo4kT/3/VYwZKMkU3Zrv3tovkdF3QGl2QziESYU2KlppPB8FcPTe85l+CngpYM9DJg3oa
 0BBwr3G4Z1KO5lw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WklLFO3YQ7xr72HHn9GV6dcCXduKpUOA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA4MyBTYWx0ZWRfX6wWJ1SwvR/2D
 OvtepWsuBGoghNryAGBqzypKuBoLAv2naB7qYkAuWBkvjcnxjDHSbC0sOXIiOXZrBD0aMJ+Cm+z
 a1Q+qgknYLCDZ5TunV9677rKWB4ToOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA4MyBTYWx0ZWRfX7VjLnHuOSP2q
 2mDhr4PReJ0GSzSjI2vQNqu2WjHfEnPjoKiCyI63g42Hvf2GE63bf10zFQCWwbm7KMpfSGS69Sy
 FpDgm84R+Wyu9X/OHYNignaBuTJs035OaGwMGZYzcSxk5TxBf8D1lCVqCxAtPLB6uWoQXVqMCBw
 QlDuikKoIDRaDyG9YDBdgp2TYfhEk7uHPrGV8UkI64ZOreM5lin3U2LOMkEzDAR8R4pCdWoqQbU
 ypoXsH+7e9l9zlHT64qBnKRHO4x6uI5NFjMNPYiurLgQ+u5cn2cHEjggdKSkeIa9IueMdhMTwGb
 MhzV/NICsS1gNy3sIN5DDzra9bejs4WeCkEDHK8pps5HIUBDQm7pGGB4lIlMkdfuTd8yC6Z/qyL
 GjFK6kE36ChqaAe0l3uovkugstBLfpr4yPU+qfwH1S/qcluR3pCtKbVRwpveoeEyNLveDJZn7W1
 jc9tO/Cpgfn2KIOU7ew==
X-Proofpoint-GUID: WklLFO3YQ7xr72HHn9GV6dcCXduKpUOA
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af0e346 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1Ba401mBTHjyI2ZTzwAA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080083

Several LDO voltages do not match what the firmware votes for the
consumers of these rails (the PMICVREGVOTE entries in the ACPI tables)
nor the schematics:

  L1C E1: 0.832V -> 0.912V (PCIe4/PCIe6 PHYs)
  L2C E1: 1.144V -> 1.2V
  L4C E1: 0.72V  -> 0.912V (eUSB2 PHY of the third USB controller)
  L1F E1: 0.88V  -> 0.904V
  L2F E1: 0.904V -> 0.88V  (the L1F and L2F E1 values were swapped)
  L2H E0: 0.832V -> 0.88V  (HS and multiport USB PHYs)
  L7B E0: 2.79V  -> 3.072V (eUSB2 repeaters)

Fix them and rename the labels to match.

Fixes: 300f5c59beb2 ("arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 106 ++++++++++-----------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..a9204e99b0fb 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -421,10 +421,10 @@ vreg_l2b_e0_2p9: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
+		vreg_l7b_e0_3p07: ldo7 {
+			regulator-name = "vreg_l7b_e0_3p07";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -491,17 +491,17 @@ regulators-1 {
 		compatible = "qcom,pmcx0102-rpmh-regulators";
 		qcom,pmic-id = "C_E1";
 
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
+		vreg_l1c_e1_0p91: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
+		vreg_l2c_e1_1p2: ldo2 {
+			regulator-name = "vreg_l2c_e1_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -512,10 +512,10 @@ vreg_l3c_e1_0p89: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
+		vreg_l4c_e1_0p91: ldo4 {
+			regulator-name = "vreg_l4c_e1_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -578,20 +578,20 @@ vreg_s7f_e1_0p3: smps7 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l1f_e1_0p88: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p88";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e1_0p9: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p9";
+		vreg_l1f_e1_0p9: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p9";
 			regulator-min-microvolt = <904000>;
 			regulator-max-microvolt = <904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l2f_e1_0p88: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l4f_e1_1p2: ldo4 {
 			regulator-name = "vreg_l4f_e1_1p2";
 			regulator-min-microvolt = <1200000>;
@@ -611,10 +611,10 @@ vreg_l1h_e0_0p94: ldo1 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
+		vreg_l2h_e0_0p88: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -796,7 +796,7 @@ &mdss_dp3_out {
 };
 
 &mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p9>;
+	vdda-phy-supply = <&vreg_l2f_e1_0p88>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
@@ -811,7 +811,7 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
@@ -870,7 +870,7 @@ &pcie6 {
 };
 
 &pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
@@ -950,33 +950,33 @@ right_spkr: speaker@0,1 {
 
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
+	vdd3-supply = <&vreg_l7b_e0_3p07>;
 };
 
 &smb2370_k_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
+	vdd3-supply = <&vreg_l7b_e0_3p07>;
 };
 
 &tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p9>;
-	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p88>;
 	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
 	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
 	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p88>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p9>;
 	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
 	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p88>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p9>;
 	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
 };
 
@@ -1203,7 +1203,7 @@ &usb_mp {
 };
 
 &usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdd-supply = <&vreg_l2h_e0_0p88>;
 	vdda12-supply = <&vreg_l4h_e0_1p2>;
 
 	phys = <&ptn3222_0>;
@@ -1212,7 +1212,7 @@ &usb_mp_hsphy0 {
 };
 
 &usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdd-supply = <&vreg_l2h_e0_0p88>;
 	vdda12-supply = <&vreg_l4h_e0_1p2>;
 
 	phys = <&ptn3222_1>;
@@ -1221,7 +1221,7 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
+	vdda-phy-supply = <&vreg_l2h_e0_0p88>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
 	refgen-supply = <&vreg_l4f_e1_1p2>;
 
@@ -1229,7 +1229,7 @@ &usb_mp_qmpphy0 {
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
+	vdda-phy-supply = <&vreg_l2h_e0_0p88>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
 	refgen-supply = <&vreg_l4f_e1_1p2>;
 
@@ -1243,7 +1243,7 @@ &usb_hs {
 };
 
 &usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdd-supply = <&vreg_l2h_e0_0p88>;
 	vdda12-supply = <&vreg_l4h_e0_1p2>;
 
 	phys = <&ptn3222_cam>;
@@ -1263,7 +1263,7 @@ &usb_2 {
 };
 
 &usb_2_hsphy {
-	vdd-supply = <&vreg_l4c_e1_0p72>;
+	vdd-supply = <&vreg_l4c_e1_0p91>;
 	vdda12-supply = <&vreg_l4f_e1_1p2>;
 
 	phys = <&ptn3222_fpr>;

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-t14s-gen7-ldo-voltages-d57453f9d754

Best regards,
--  

Abel

