Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215208;
	b=WNW8cWVSpAI1qNmswACWugKid2x/mxvPLjggoP6cZk9a0iLvGvwm9pTnL4AjjZZ37ThU
	 GbikEOq2BL0xS80u80/7bNZJPD8gqKxHWWmlS5htvWR3ppVzKP+pAWpeNYAVaxT+9Km+B
	 IfL+J1d93/Gl+tW94If6DB2yPH/i6IT9Ek5HnLsdrL4RgoY+kO0x/eRachM8mGmwtXBIX
	 97sK/A7HUi7QAOx5wJxW9c26ZOALrOy6XOm0uK3uKM4LbORP5rFRCYKY4mKL1wLZymo4p
	 NJAnWuzDrdRyxbgOVs1LzUdNvmYy1yDg9UHmkK6Gv8v8QvaANxFs6tRGbZJn8EoMl3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dqiVtPs0Q2ghJGFEHuydmBelmea99GR2RR7CgW2HfWI=;
	b=zX9C9/mvc63nYTdgWq2uMyru2ntw2fiaC8ueZv3WGrKtGsFHaXz/E4zObj4RVj8T2R4K
	 WY6bmFNNlNPIvZiGXluWQeG4xFQ1MZvrok75tdJ3ZZkXN2DuJZqWw76qgC9ELK8CI5nWb
	 fGqJOTqNBut72B4zMz+YaWM9zYvuk3l9PbI0V5TIKT1P9R7WYIjJOqigb7ntaJ0M/02Z/
	 vzraYkGxrmX6F+oJ8m49236Te8Xhk8DiKLNCAk16T+Z3Ey9DSdnpeQZ5xiPnlAI8qpelw
	 6w5sofoUq+YGF2HQoTaAqsaIzsLCQw1SwttAlODSwXkUW451XjoHcG0IT1VVuv0zoMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXP4S+z6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eaG/LPy1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AE606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXP4S+z6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaG/LPy1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97ox6k3324879
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dqiVtPs0Q2ghJGFEHuydmB
	elmea99GR2RR7CgW2HfWI=; b=bXP4S+z6ftSH0JGGUOX/+zT0Lu0H6DfvnGbmfl
	wd3Dx6RoPhrjfZdv4ltUsqoWnvUMc4nA4tqUF1w+5wQI17bgneCVM1DT9UgxXrDP
	YyCtfIG98nbFgtNFI5AHgKvyuxhDRGUg8WNkpAU6sx5cm7S9wiUh30LDxhYjpcOz
	WIml6qdaUg+6mfCrIdnXs7N1OucJgDA5InmXelHsEXYfAx+ySbLJucWlIvbirRUd
	eGWnTE/cRrK272440cuSOiVsQb9dGm27Rd+4TSrJzH0quCNjAUw14nqhaAXZtVjv
	FmXqy3mhJoQfpCcdSiv4jSgf/LTqXwlDZvMTdniJIf/oa8cA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588891-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:06:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d7d7608dso550760137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215206; x=1794820006; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dqiVtPs0Q2ghJGFEHuydmBelmea99GR2RR7CgW2HfWI=;
        b=eaG/LPy11sDW1EHzO5ItbIIo0T/G7PK0mGPLR/BV9o3Wii4LdvndpZkVCKOcfoG/Il
         zQZYWz8OeO8jBjGd5xnoJc/wh239qQ6HH6pmARO6IX14LM2ZkeopY6hG7VfDRt8RsHtC
         lOM32jGywUp55r68UOp/K16fSsZXYfibqeCcAl09Rtch20dEXnr6uBCJ4ym06WGlTp9t
         wiBGWJw7hg4QHbP0R4T7BiVnl6dgNqgfT1MbyqmpMoizB9q+SylJNxQcacQiXHHfCgVZ
         D18p8Q+c+LCqe1S8Xjz05HKSWyecExJzILIvoKrmvOya3bBHlz5KstBFl7mTDX6b+r3C
         1mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215206; x=1794820006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dqiVtPs0Q2ghJGFEHuydmBelmea99GR2RR7CgW2HfWI=;
        b=X4Wu+579Z+wdiPVZOc6PEg20IBNKCknU8PINGYR5pZd8Ra/hGF3xXuEPMkBlvHO7e4
         PvpB+wQgJ+GRX/CJsDunat2KLg+wXbjDVLYUcyRdgfwEqkHgPqvjVIDKr0q1+nugXmBD
         ysvCyS27OeI55eONeJEWMqhJ5zftFtyrCsKPs9jmniEKXbBQcSNIbYqnVAXwFtm4DrA9
         vBy7o/UuCn0k9Yue3RyYuvIfPKtGzvmBFVHuVOoxJkj4RDsFOMST/4nO3jfzduMPIl41
         EJZn18/DHdiH+O1fieADhNC7QqlfTOZ29uBKTglfLwys5/cxhSigtgY74362c5VepWyY
         8Ngw==
X-Gm-Message-State: APuU4Z9/YELjuw+/wyIXmYkQAYREFcD/C1cZ0Z1DrVlqaQUdBf6pJ3Tx
	1pfHb7/u6UsdyrUFR7pNq88tHsNwKuFKqvQLgSZegTANDc5jG6Hg5esCZpQbXErelOrkeNHOPE9
	PoUUEzDXLP8uElJqtECmc6aNn5DoSsdCSb4H7kInlxXNjnpFjo8B4EMfDoWvCrLcb4X+Nub142C
	QP
X-Gm-Gg: AYBFou3M5ZNm4G5Md/vw/nCO2GBhaay5BFW7BoFuUHR6zvc+/vMKup4NEvU/Bdy9vrE
	QhiPgyGSyM2LR34ojLqEsClwFVws4wOJytndB3mTwg1bWEFBs7g/wHNqHj00ganopYwJ5H89xQQ
	I90J5peEOKEDF6WsJksXLc/f/REfNLt5KNSWUYExpixnvToveQ7y2wu/1wBvQHKPHEsCGW5Cqmp
	S/v+ADd0F2void64Tg3LP9tOYZfmaAzuyiHCAD2B7x8gdAgFTeQp9CafHTv1yXbL6uxz0P177Y3
	u+o0gwB2Jq5FNYR2eZpuvzIqX7pkaiF0rcSdhlHrowlDRutr09Jf9Iiirp96i7exkl2JWN85VPO
	kv49KBrbkKuNdzkZFju2JlZNkUEIeuxOta9ql2cp/bTf122KlcH6Xs8zVgg==
X-Received: by 2002:a05:6102:54a5:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7d2db0d23f3mr975217137.14.1794215205622;
        Mon, 09 Nov 2026 01:06:45 -0800 (PST)
X-Received: by 2002:a05:6102:54a5:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7d2db0d23f3mr975205137.14.1794215204956;
        Mon, 09 Nov 2026 01:06:44 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f36besm8031854f8f.14.2026.11.09.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:06:44 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:06:39 +0200
Subject: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
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
Message-Id: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB6N8WoC/02OwQ6CMBBEf4Xs2SUUrSgnExM/wKvxUNpVa4Bit
 xASw79blIOXTWbydmbewOQtMZTJGzwNlq1roxCrBPRDtXdCa6KGPMu3QmR7DGLDeKe2wIdpLHb
 OB1xLEtrI/VpIDfGz83Sz4zf1AufTEa4/k/vqSTrMeQvm6dXHzrCwlWJC7ZrGhjJpaQy49MqZb
 4hZfReVyeLv/vbUxuHg6hARxkGgQMqUyYzMd8W2ODjm9NWreo5P44HrNH0A5XO3b/8AAAA=
X-Change-ID: 20261109-t14s-gen7-hdmi-port-35e1cd59315c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3584;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1AwIH7e09zv56K7V5T5MB4lw3ukvd7f4T5KE8CtPpds=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq8Y0itaRJtEnquliG2OcaSEyGCvmSQsnIDHXLJ
 J6o0HjdcWeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCavGNIgAKCRAbX0TJAJUV
 Vu6zEADIDDGZlSJrjpCiilllVh2t8k13hyLDLcjGTWvQgCTzlAE18uuDNmiHO2Z1k8JzA7toheb
 dQpdZhotZ2+QaDjYUD0Vjf9Hivb+FxwszKGbOChnZLt9LEQt51IoOYjLWrGnQc1e2ACeRy+dPfC
 qDqTSHiR39UIcxyunHjY1ZtEnyGx03CLBCPl/r01lbBfMMp++YjqXsfT32akXBx6G8N6H8SB+xZ
 QjTA+wPT7/AG2PTPQfcxEt1qTvyrUXCdS/xVVk/S1lotNbEA8IdDuWtUU2seuynLCq7ilIxfbE/
 aygF9njhxfMqzL4aru2bZDa2yIcjbntWee1F1VtXbG/bvfIwwQePG/xumNBGB69neDNF2YmLoVF
 kUF8U9ZU/GamZ/lxZO1lgfjsQlnWuEg2xZYnORK1r6PPTnwhpDrH2KMrzpS3hmvlIEZP2UW+Ycr
 +rIt84seXEgaqOjh0ITmyPXA6i699FshY3v7+MpwgAego/bltrZKYvqyhJ4YV4RDtTp5ps0VOx9
 BX974HK2WLDqzHeIpFdgdwFubtzRPg5QlG/Hj2liK3rXc7tyTXnuoWA+FmLBtFOl9XQo3XOvVQQ
 MLHnRsUhDVVPRj0mENu/rXxRl0yem7VAuCgK2q8IMRYIYNHE/usST9HYYwyZLKi3sm74NTKrse+
 ODdJAwUXuw8EOFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfXzSxL9z60YNQc
 9YSzfDAVe9tX7N+TFJEFLvXHlkF0kiwbKQeDGyWSmb8K0d2jqFvwHtgAwyhxp4DoCJoOYQ7bUfu
 vyvdePhMUvb7l6B7jn3OFn+n10es8wst4gQNDmko5PPfwvPgc5QVz6Ge+CklQReQl8VcEmLuQ20
 A8qIHPlV7u2TVYDVRKOWJrxQlekOFiRHVr7CVD2ItO+Ah/IjdNgBzNToR6T5OPcKMv5+08PCvcL
 nkjxd/20rV3B6KR52FalLFe7fSldUADQv0eMVLvvfMFQhBImXy9zNza7X2lOC+S8qXtg5s/tc7e
 KSn18vkDZk8CSroBKFQSysEmbZRnitxHbWDzVn6StYAXpBM9ySzb479sauwOT/alcmdDlXpIATz
 hoDWiRYEEqMSaehLA3R2Q998Lety2/iynKuBfEN8b8I+a2OIQLG/TtldwsgMmG0ZQCXBHjHv0v8
 uqM8DxA30hsACenqVyg==
X-Proofpoint-ORIG-GUID: nkDlKlJc6E-peRcpadpwKcDQYdrBQyD7
X-Proofpoint-GUID: nkDlKlJc6E-peRcpadpwKcDQYdrBQyD7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX0+6w2e4ZLlTz
 wi0qmUTmJhDw5FoCi6z8E4yL5u7v/1y3mflL4Yz0ZrKoboHHyKCk206uGgXIhkoVR3/SXsKldVC
 /okBTg878dFtyYFUwj01cxamv1aiXBY=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af18d27 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KnVzsQ4Nl2pkZoQV7Y8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090036

The HDMI port is driven by the third DisplayPort controller through the
DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
not connected, the third USB controller only serves the eUSB2 port of
the fingerprint reader.

Describe all of this so the HDMI port works.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
This depends on the LDO voltage fix sent separately, as the combo PHY is
powered from one of the rails it fixes:

https://patch.msgid.link/20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com

Tested on a ThinkPad T14s Gen 7 (LCD) with a 1920x1080 monitor: the DP
link to the bridge trains at HBR2 x4 and the monitor shows the desktop.
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index a9204e99b0fb..da5f603bb4e3 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -73,6 +73,45 @@ switch-lid {
 		};
 	};
 
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,glymur-pmic-glink",
 			     "qcom,pmic-glink";
@@ -762,6 +801,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1020,6 +1067,12 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1270,3 +1323,32 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_2_qmpphy {
+	vdda-phy-supply = <&vreg_l4c_e1_0p91>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	refgen-supply = <&vreg_l1c_e1_0p91>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+
+			/* No USB3 lanes connected */
+		};
+	};
+};

---
base-commit: cae1456a7b596c7d21d86fc17216e6996f26da3d
change-id: 20261109-t14s-gen7-hdmi-port-35e1cd59315c
prerequisite-message-id: 20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com
prerequisite-patch-id: 15e089c6ecf7cd782ff552a16cab0913dbb6197d

Best regards,
--  

Abel

