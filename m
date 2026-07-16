Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924202E6CC0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191899; cv=none; b=RcmapW0jfZstcnZTr1bVEQ9gyMIaf7KEl0l61AeJ+QIsLu9i5KEpoFZBmWiMd2rjvSDhYelMfb+f4va+ZV4dQzCsdHFu+ibF5g0PE4ZBSmvrROlhTSfVS9Nbb5nBM9V94ZsNvmV8+rSXY8/sLdp5ydxOAaSAiWIrnn0YeXhAcbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191899; c=relaxed/simple;
	bh=CKL7bop5MplYntpIlnBdWPEndjaKm1NNl8MiHAUr8BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qLVn4HO25FbG9KD5hOJuHvhj3OLBen75ZzOlx9tC78U6MF1p9mheC4bcWm+AMAFy8wfQsXPkjRNMc3qbZbtI2KIEszaJjxd0jOIdTeYsq1xYc8VITQqFfrCekPNw/f+8BOCVYwROy1cL/5J85lxgi39grLrR9A5t2wl0NdFAfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6cYfYHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vinydxtq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6cYfYHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vinydxtq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DxQ92049154
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/U0jnkrgqCg3qrLMjPGRj5
	2qmyks8bXXJa5C85L6omU=; b=J6cYfYHx1AjuHsu2jDNKf7FKaiqdNGkEXPaMdK
	/pRmZEeTlMssmgdekvrGLAbcogRr2i2oazL3HwDy8BgAXfe7B5dOWZUBFCQB8xfa
	8bq8rlRrsd9rtYEbPG/KW8RGZgOoflt1BKtImqE6Fdk1Y6MqC7bYgOnLmzJq9q6T
	ZptMiMrAV2UXPJaU61/Z9TDb/aWcqgodOw/4EGjpKuaaKcsmfQcAqJnJmOSWXhgI
	Docn958CEsEwzD+jPYkfwZ3++Dssl/2lsr7040LNXx3T/Yp4d7LM3TwsVW0n9KVE
	gua1haWWZQz2WeTJDIVCKwkbK7FrUa2ZFc+5Eb0bDSas2teQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfm2uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:51:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8c689b5fso107100741cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784191890; x=1784796690; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/U0jnkrgqCg3qrLMjPGRj52qmyks8bXXJa5C85L6omU=;
        b=VinydxtqHRJfPdw2cRzjx5JdpLiYmV64xFqmbtGb1oQz4KaZAiWgiJnHNC5Oflalt6
         JXCiHlBfk7OqFVp490GvOnj8eKFHh9gvY95bjttLnHrKbfM1LUiWZXo03aIE9ubcy8yV
         NEWXygOCOY7xsBhwy2auOxxt5OLXzUj0MOzpKe5AuR4ZNob98fUjK/9U723Gif5IGHBh
         khTjW1xDrOaa2BDBPcY/e4R8L7jJ14iLp0gly1VG6huPwdqVZ73kG/8f0Cx4ppo6uVoz
         YpbZsCSjWi4AZm4eSXOtE7QPQp/VXqZO+ehf0imVlokFBjMIsEHVjbg8uVzdgyh6N0bO
         KNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191890; x=1784796690;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/U0jnkrgqCg3qrLMjPGRj52qmyks8bXXJa5C85L6omU=;
        b=L5t3zAo6TKpQ4H/y8yeF28AEfdxi4zdt1BtyolRdlrw+5LmJrWJu04hkFq3caovsx7
         PE8OzyDJCj6z/CCy8aLzir1aQPrr56GUmuYoMlg6VNrm9GEnhBcPu3zul3/1AC8jM98d
         +cAaJRiooICaBCnCow1nqhZezJbqp4VNOONg3zwYG3PwLeaRqMp+OQ68cv9jhYRXxv0V
         4jblYviPub8ujm6j5AvHI8a5v6CAJuuci1OHi3tQEHfhTED3vLGFyIdID7ewITRWknjV
         1oPPd4zi1bsZSgofa8o8W0dREeC1PcihS8edUO3zzNuwTKZxy/iYWtH9oXYAcYAZcrCi
         wybQ==
X-Gm-Message-State: AOJu0Yx1Un1vNS0Pw83bbOtE9zdyf51GLz0cDpCbnDMVtj0iGCzV2hER
	ra+rOp4XlXcqbTsC01BYIrDbDfYq/bGEc1d93Qcly8i18fCXx6qxhEILtM/4OoHPxpWrv58/JtQ
	k3Ros7h7T7ImpDUgaWWuxBpRQVBHCI6Wh0eDJXsxbUD0fr8vVJLBPq4QINCWmnNgisfKi
X-Gm-Gg: AfdE7ckhb1ND58c0rcn8cHe4WQW1V2J31ILGklgNDON15YszQQNrrsaWw626v28hCkM
	YZjXzn3K3U8SflIOpbo9sv/MKFdreheHoJyDQrNV3iO68VD4bX94MiZwDziQTTPTTpldM4SNtdo
	xh86EKTdp+E0dvlnYog31mSmn1JtwRjZu1TZb+OiXZL7PXw5WPfwp0J5aNod9udpAlpqzuOvOsl
	2TEgNGWgFiD5DnCqoS3xqsuI/roFdAotQdtxGsDNwfGkdSIFkToZdGIE8XXOjB6aZlT48O8YKSg
	ff+KkKacV7NxTxgfU0mZN2caY7Hyte4ZecA5iiocxNu6BfhHRz6+slTWmIxpqk9UDo5Uzj2Gl5p
	ETYIz
X-Received: by 2002:a05:622a:306:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-51e424de113mr99656801cf.70.1784191889916;
        Thu, 16 Jul 2026 01:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:306:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-51e424de113mr99656651cf.70.1784191889412;
        Thu, 16 Jul 2026 01:51:29 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c59c9a2sm87179285e9.0.2026.07.16.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:51:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:51:23 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza: Describe the ADSP GPR node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-dts-qcom-eliza-add-gpr-v2-1-9646c57fa513@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIqbWGoC/4WNQQqDMBREryJZ94uJoqSr3qO4SJOvpqjRfA1tx
 bs32gN0M/DgzczGCL1FYtdkYx6DJevGCOKSMN2psUWwJjITmSizKuNgFoJZuwGwtx8FyhhoJw9
 NVfHC5FJinrNYnjw29nUO3+sf0/p4ol6OtcPoLC3Ov8/nwA/v70ngwEFqjbwUXBpd3BxROq+qj
 +6QxmD1vu9fXQzlgNUAAAA=
X-Change-ID: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CKL7bop5MplYntpIlnBdWPEndjaKm1NNl8MiHAUr8BU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqWJuOJ30Qf9GLE69p7zSwB04BTm+/bGh2Vheet
 ZY3GgfeS0KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalibjgAKCRAbX0TJAJUV
 VrIqEACNuseMnLeo5HWaYH29rV3m3OQl4aqE66z6Mz0HCxzlwcMnO3fFQb0MO5dNLRWD9cW11+o
 7H14OMsXrJ+w5JiDeQ0vq9i5Wz0E/0FB7vhEzC271Mc+zVayos41k2Y2vA3VJ354DbuTFuY2gBT
 q+G110pym6sMDTVvMHRWJR/hsUdjfvC5IEJKhKmVjQtJqzHMbIoENZzmXfB5f2xtmY8BJrDC5T1
 nWyhZn3mKdsrTY2SDFjemD2/vlzWbE41ESs+4c7+KNk4vMxTsRVAjQq4joaaTJR1Pwb/nmlASJu
 pYtGCTKJnALsEeC/jeZq//Eo/hirRSwuLztvNLIAy4okS0fxo3sZrAT1RidWqIBfMLSXlpmCJuL
 xZk4b+mZaMIG1VsroiDn0iEciM0JA9o7HKjkNQj0eL2I5OJC3Bgvpmna1EbSGPPS3mTMzEetxai
 ycjxaA5UST/sI0KU9NXf9W6WwLS+lnOr9Vwo8imqWwOZyQaStzOvN/i0SYERUFYdAcq3VLtlCXg
 vLyluQdhzdTd/bcCV5OvpPTBqf3MDBeaRaP8kah5FElOJLqISHrNnq9hQm1RQY5bx0Bb+flwNhP
 NUSC0BIoDRerQ8vqfgB25nkOhFbCE4INuAJZ/jNKgQcYktCST49yLdV6kN8Zi20//9UsSDMCDWI
 vlgG28hRDxxHH2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: veSkkSDpzVeCgkErUMV7d2Z5V0JsnojM
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a589b92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_mnWyosmxP3KJ6nlELcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX77w6Uc5PTZoo
 w/CS6bSFI5RBUQNra0ghZvqS8yeQ8epco8lGi7Ide0VkFyRuaFNDG/2T7bB8kdxN6DAEsxxLj4J
 h2Ih/oA94JwvS6C/Av7Xaym6YpwsmpJJHB2f4gM4Vi4M0SStneGJ6zgcC2lEjnG/8wQ+dDDTmNS
 2hI8TMlBT1s6TQJ9J+ygDiq1dBDKgxEMTnl5EO96b3bmwptVuygze7k1o4FaRLtZw7Q03b8I/nS
 2+QS+8h8qVxm5RZFR8lxk0scBR/5aGvVo7h+X82kVMe5SxE0tTpD3qpGUrz+1LBIZlndlp9OQIt
 Mq2gFn+paasYL0jkF8jQRKp0z8aQUIIXtDSlFkHtEDeqErKrEJRbVeDiPdF7LajaSfWhSeG/Z2d
 yokw3TVRVx8//XDXjZF5U9/bzIIeiT54pL9nLwwjFcP9MtX9Xcav+IGByh+kqscbroHNdWMB9R4
 G5kkoEO52ns9FjNXrYw==
X-Proofpoint-ORIG-GUID: veSkkSDpzVeCgkErUMV7d2Z5V0JsnojM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfXxumE7+FdypRs
 G72Px+p6RxT5Pc+e+G5OOI1C/ihkRgST1B3q2CDeI5lxFr2MNTQAia1ox2btr9gjsEJ2SoZNvxx
 4APa+mDvNsg4bjrVfD0h+MD2w6T40/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160090

Describe the ADSP Generic Packet Router (GPR) devicetree node as
part of audio subsystem on Qualcomm Eliza SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260715.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..fa6a22f2da6a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -2012,6 +2013,46 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

