Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB61429CC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382719; cv=none; b=c73caKzGdHa7MwdnKrmcMKLMNfAMEWHBysuNyagKIoXK7MdX2en01cmdshEYqclgkV1dsXf0gXSw0VvcIU+aOtuOa0GNNCuCQI5fkXQksUBxuD499oeBgA7g+HYRw84PyLBi2xlTZCVkfap194h8HXeTreG+RcvMqpmpSGZmBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382719; c=relaxed/simple;
	bh=H8qj6Qv+bnXPrhPCj5pyVAPUDk3e9rvb1GKUg5xaUxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LiGFvdMYzbjNu7R82Rzi8Mlfi6u0nyF4uwXzodF0UUJLrDTxDlVj6vNi+kXliTKqqwtaotAlTSklC/BhaJe262DQ0IY/j42uMnyPQhMt3e5ft+Shq35Jd+NNmH6kAEpPeViSqQKAS2EB35kc42MNKPtJGYKCg4N516d4vVm98FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwZ5bDrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJVyLF7Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwZ5bDrO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJVyLF7Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nnPN085551
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq3yWQYcCqBeEbzhBi/xTHGVgJq3hkEV9rUYj7g4tnI=; b=HwZ5bDrOx3Wa7EJR
	dvFSIoudbYU4rwA2LWOoszEGMTac7aYSIDBrS0bcd2gsWcdAsQGzinKwmMt6Bbr6
	EVFKXIxeKzQXW6c0qy/CWgDQqsc7uZyyCfB08Fnjoxq22ibBzTThRAVkl6eOUTH0
	PLueLyggmcBNXCSvrjkhe/RmPWzFsUUbjv7Jt/x3hoJRx6GJ0qUS+QLi//M5s+sb
	NHJuwLaIshoBHs8LW2Iznj58h+bVBk7vYhvR4EHxkP410j9DWT+ShmYsKKPs7Bma
	7dgJpPt8wLCpaNQxzVmH9E35p8uCWmq2CvYqx9cODvm4zW5McN+eVBErc0Ai6Veu
	YwACJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9de6ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so281889285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382712; x=1789987512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aq3yWQYcCqBeEbzhBi/xTHGVgJq3hkEV9rUYj7g4tnI=;
        b=IJVyLF7Q1F675w6ju96/DCJq6U1nqUUmbjDTTYQnJE6TRjMwL4wLG2K2CVfaxKaFWF
         +xf4BmW5+/8fgPT3GZPe8y4fFk3WCM/RD+xZ9GMcNAmVx6F5SKyRgEDMSKXzBHT4T3lb
         Hj23dYsPbSDEwvvACv1tEsDY+R4w6IrDdsY29oTJf2Li0mKVascXkhfVU+it/WadcZy1
         cLNxhVbWBgMr2F5ml2UupdP8aHhadzQXS5LSJ/wVFffuStDNc68/iylSMjeZfnMlpYcx
         a4dyQlAjIgCiEL+gz0bUx6NQJ1/yIDfeXN+dPvabZ1VlgnXycVgZaUYclXu/dOwfpbUq
         EEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382712; x=1789987512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq3yWQYcCqBeEbzhBi/xTHGVgJq3hkEV9rUYj7g4tnI=;
        b=oukv7hC8ojAzDrPdrP6UBIUqZ+G4FISemmMDQH48STHOAF0Yc5HXAWD/MC1H9xVg8Q
         RL5dfKyupKkC+wwaus45Y5lZ19V800eeZDXTqbwO5D4h/+Nit2kKmBBQDuRZWeINVU/J
         xqYM6/IOWKgswJ89jRDc11BLNClIyaK9EY3PI1jqKgyzbK/Ge5MaZQhR35Xt0Uu2L1xy
         6jwbRNPqUexTcGaKlJEjsX7ITh5ujoxrU2jtM9x9jDDlkKlIyaqKm1UKFpJLNaLPj9/o
         e5CjIt2Ch29kf3T1ENGqyD1Yg7gSXcB3k+cIvwTK3oLKPU42051BO4xUnI8kx/CgAhUa
         tCWg==
X-Gm-Message-State: AFuF++lMTyllkzE6Il5nkL/PvTEoPUKJ8SE3jAhiCtpCBtpYAK+qmK5n
	OVjHbya734ozAY7fEi6qQ2YAxayFnk+YddeD+ntBB8TnHlx1ZZAzgaVMvu6QNBOaOqe3lX44bqJ
	Fj2TxC2rGYa62hRiwo0ZEhDB6ZW5KgyiuNtJ/SIrEMac9CoiGZ/ioOmVKaNhL/9QGzG0d
X-Gm-Gg: AYBFou2d1MOqJc/JGztapP00YDUOmz5bmuH/0u2Cv5F3XK13wgnpHAOk7fqS02hNOtL
	b8JvAdtaj4W3FvVNFreBR5/6GGTECERGfEAeivBhBDHiT2aUOpWGuD17njt0CQY2PT+yONYYIUk
	2onJPHCuGTefQGFv9unhxaUj4hK/tPF6zrO4YzlRhFXRffhWz5zQMWgAuDTTd/gIRlC/ZjatlCv
	NnAbE49dGvhxAJPo5tX2nhQ6IfMbnKTioH7HKSUCF1uB2qf4TUvDC7iev8j9NsrRwuGEvtJUg5x
	PIWhUdVWF2WzXc0UAoEtuTo5+2Se74juWISaHcv27wN9bXaJsccWaRVRTB17/pIEeDQYEdQtbKj
	DZdbGBH6r
X-Received: by 2002:a05:620a:6cc8:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93a2987c980mr264415085a.21.1789382711993;
        Mon, 14 Sep 2026 03:45:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc8:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93a2987c980mr264408285a.21.1789382711360;
        Mon, 14 Sep 2026 03:45:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:50 +0300
Subject: [PATCH 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-3-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=H8qj6Qv+bnXPrhPCj5pyVAPUDk3e9rvb1GKUg5xaUxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9As/2IVZ0emYUoJnnFDrf1rFTZNJU4wBnPxu
 Cxa7r+K7nKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQLAAKCRAbX0TJAJUV
 VorIEAClvqJlRWQ+JdLcqT/nmxvw2izdlqCVcQaHiBS4wUn3+C95LJHQgRqRcL+bsadx5kbJ5a3
 eK9GHR084viRA7rjkzuQd6ZdGIiUvVDWBFoo4QNXhGfoyb94b/JgS8DK2sR0k3ecAw4fTplLYum
 /dIPHpGVfwZ0yx4k0zDeSDEq/zvuOcbVXGA7ikBzvt+DKaSm3BEy/+lSfJCKPXyhfoX1hUPXn4Y
 KpUlA/lclqwrqXSNPY2zHj89Ee4MzPjojSoOa3Ws8r1zEbJd35XjMPHyp3KMoo8QS4G4PZwrmyV
 f+1TefL4IrqDmWbnY7GKjNPrHxaao1GBShY1Xy2j4C8Pffj2uTNUJwKYcxR5snBt+TYzFD5czap
 tNbenkkG9yg8s7CphO9MP+XwgrZxPGufyya2Dw3MPgmS9khqOASvoj/5fjLvUcj+Wz5gwx5ZlED
 XO8sttrJ3saMP6wS/C0DpKBGG/I9LuuYe2d9zPvTTnQDsFGMNdpGSwpR3LBKgl/4oaEUOGGJ9nZ
 lQC9bWHPFxw2fCK6QRz9giNZTQ7Cyd9ACuKmdlwyUIXDYq2B5I2ONhQxqgoKWLj+xN/Z4S8PboX
 gUK7F//gcyPpYdk7wabfY05Q58va4cO7KUgSPRQn5/45V7c/xwhRMeNdZE9sS9tzAXxg4DKYKjQ
 swqR+9yFYn89ieQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX9uIaJsT5Cikj
 dxln6/krgnTK08sEWKijBWOwbINPapv3Ey3mldBltG1nfjHUC9QC5Janq+6J5p7DBp6eZcl59zy
 /okHmbEMiZKut8nO8eASny7xF3X35ft1HzmMirhDUc1wRGOVmJNAljFt+JVb36iUWfZMS8ehj2l
 EKnmEhE5rIkT+5QNjvnK/gnU1O7GG+KbGLLM8+Z63UrFkg1oOKMGdUk4/4DMddS6+l1CTu3748h
 XF8/6rqmwic2gvHwkQDIqhqRxyiOY+Mi4zcpa+PlCHLl5BgjmzgruOWg3+cOcVLb/uN9WqgeY54
 vTJEnVsR6ZHLxBI1CiXUaHX5Iz11tRTpdCl1hZUnjsgmyJvDQcpsPAoU/FSKDOYvJat+maGoxnk
 ydcDFuH5kMhz/PwMkFkrQBNVaC5uRa65FXhozQ674P+6EZIZWOEOqH8TZ6nln+an8DJz9O88muq
 TquiUOr7XIml/ZP07hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX83YDBFltNIPV
 +NPKwp+wR1UjfsHoRaYTQYa3qhgW8d81Zmmyl5Gf3kwWIAEwvz1gMypqqwFja1ipzcqS2WlkxPn
 TLKXr3n87UxK5zdeDFBv6p9PVjYEV0o=
X-Proofpoint-GUID: YVUyNwBKzdBAHgl22q9VInkaZOpXYjmk
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d038 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X0h4bKi3nu2RV8rheDEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YVUyNwBKzdBAHgl22q9VInkaZOpXYjmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

It turns out that there is a variant of the Eliza SoM EVK that comes
with UFS instead of eMMC.

So let's rename the current Eliza SoM EVK to suggest that it supports eMMC,
and then rename the Eliza CQS EVK to suggest it is also eMMC based.

Also update the compatible for the Eliza CQS EVK to include the eMMC
string, in order to differentiate from UFS variant.

Neither the CQS SoM nor the CQS EVK has been made publicly available, so
renaming the DTB will not affect any users.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                      |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts        | 18 ++++++++++++++++++
 .../{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi}    |  0
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf..ccaca98ad4c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
rename to arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi

-- 
2.54.0

