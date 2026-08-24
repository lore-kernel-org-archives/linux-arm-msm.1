Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E7442E405
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579161; cv=none; b=ayyGUycChKvJP8GwDdiZZVbZrLAqHstF+QN1CFyRx3hXjD6HK88Ko0Fjj4V9w8DfO6TFJKfL6nI6ca6Pt14OhTElF8lUKCR5jekrtSWTOJx774bIybI/AWpIcx3nyHOEtKxINM3PdzDcha9qHrYxq/MOPPomd+qkTQmI0eVuUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579161; c=relaxed/simple;
	bh=WjnSN4eYaeg/OokN8ysVpLuHSHoJDnLkSXeZA64rmpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k7O0IdcqzGu+bCHqHG3f99woYX7zofpyJ93aFwAhH88X7fGs35FJfFQoD4woHNehhYAeEtHdWxCiLgFwuHFQ86JyJ2xVtaSf0B4KKVUmX+/xBV578gc9pdcc8lmn0r/vZVqrqgkDGxBMhlAYcAUxhvejF2X+lkUlgSoa8RmQFFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtMxVnqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkG7WTTt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UtMxVnqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkG7WTTt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuxuu1880531
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=leD+oBD2kWRHNLHy6HyxCF
	piVXnCr/N1oZ1iX2pqVxM=; b=UtMxVnqUGl/2+nUa/ORIVRp6rF/pIOnhAY1gCN
	h5tsWnGB5ybE2oBlR3lGa67RDqbMyPuF4aqKf0ikckgScbPiMTgR1bFfvEi6j1Yv
	gBQKdY/TO/dywBGkODlrDLrXBq1PcVHa43k9+FiunK0tH8SRPgtoVkH8GNh8CiHV
	k+5kspbI/GwfRmaIsx8bCKq74MopiZinNZBh7/DgZX3q+V4mHGsDGKsFu/JSOhe6
	j9MFtHYkA4YG67OK/pLQZMA764m/SldXwNiOFM9LAdtNszk9u8Ca4W49nO6BdVOv
	nk6qVs927uH0TiVXzhyWgnoZFtFtCB52nc6tUo9t5Dhvrz1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf1gc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:45:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so53259281cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579155; x=1788183955; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=leD+oBD2kWRHNLHy6HyxCFpiVXnCr/N1oZ1iX2pqVxM=;
        b=JkG7WTTtOIppDyL8ONbNa0XyL2yITiUVFIQSc0egx7a1qROlI7odrelATyKxRruCHX
         bhqKRsJ2itrGe0vsj5ZKUxTdaym1TVm3edcli94Ar2JCcCMhQC0oYrzuWklehE3gnAkr
         Izdlc3JNPK9KOkFe2i7OaHlEZIZZ4ARU/5sGSvvrLM+D8rt9jRAvMG0gzMFCYdADHrpa
         /NbcJpOBC5En8+hbUYoRCsUAu+AzY/6dRZvDvriXgaUhN8BZAOrvqLE5K7+j719Il4pR
         hDRkFgGuxJ56Z7zWWljCdNPYfrGACfQLLmuk3q0tGmR6q/JNz8M3YCbIBH+CkqreHdba
         OUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579155; x=1788183955;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=leD+oBD2kWRHNLHy6HyxCFpiVXnCr/N1oZ1iX2pqVxM=;
        b=bTiTHrsiuGDO5JQWP8rZUnFKZuLgu/W37lv5KpXDYioVf1+suGmWI6oXU7kTUCUi2S
         elaka+c3y98NH5xOxInJ2BkaRoAglIvhscLPvHpDwiT4AHtXMJ6YCQhz2bj8J5aQb+2g
         U/d1iSEFlzEzl5y3xZtM7Kj6tJW9DEmFK2INqf52nkz2ify9QkTRDZQLW7cTzAlXS6F2
         XYEA+pTn8cPFl8J8PlkMP7sOO/PdgMKzOSYLUlD2TET2Trx7k8YKRd7JVA5GBcNzBHl+
         pE0E6fBYLzp77fUgMsPbHubhGVN7sXFhuWxHhdFKWsd075FKElQXctvsPxoK3ygEVWho
         A5xw==
X-Gm-Message-State: AFuF++kTcL0IKxcxJPoyPR2P1XGbTRbHq41KBMyz5zLZrdCvF7EipW1/
	S+dlGUiVx/WBTs5vFO5iz37F6oS7OGktteIbBMl0dvx/SWZsY04w6cXn4d5q+Nys23kqi5ogYyS
	GfJ8kgciIEJyaVpTlYgKQK3K5UfNNKOaDw8V19S98232f8q+3VyOoHZRaisGVORzGfrtg
X-Gm-Gg: AR+sD12Nj07tzLNeqTY2vGcoESojHtlsNvdUbQCo58TYEYFug0Y9xYpSE2iuWCQAvMy
	2KAhInFbdgmN3N8vkSicdC5Yb2S2yxZF9ctowwJg5DqHBYz6P3P6SFS9vinuAsPNsoUcVxbKjxp
	mYC1fDYw57TZ+J7H+c0+U5Pbm3k/3B6j9X6EIIHCif0bGL7reQOw4giPESvksGmyr4hldYcbJff
	PrjWLHfgLEMGV8a/7njpzQhBHTiHDdcAWUt/U9xA4t1culNEJIkQwIgfhp4dl3zsdJrMXSuJ+WO
	+BjJcC4521IKFpF3149gTa2QEB/LG3Ak33hgkpBtdpGtx5jaYLGVBGFp04upwVcEdBwGXRAp2m5
	MHcs5gO5X
X-Received: by 2002:a05:622a:2483:b0:517:5bc1:e1f0 with SMTP id d75a77b69052e-52e09a9bf2dmr183224611cf.0.1787579155054;
        Mon, 24 Aug 2026 06:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2483:b0:517:5bc1:e1f0 with SMTP id d75a77b69052e-52e09a9bf2dmr183222771cf.0.1787579153964;
        Mon, 24 Aug 2026 06:45:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968abf18sm1376918066b.61.2026.08.24.06.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:45:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:45:49 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA1LjGoC/yXNQQ7CIBBA0as0s3YSigrGqxgXCKOOtqVlCjE2v
 buoy7f5fwGhxCRwbBZIVFg4DhXtpgF/d8ONkEM1aKWNOugdhllw8rFH6vjtkMoTXQhYYpd7wjy
 is1tv9rZVxliomTHRlV+/xen8t+TLg/z87cK6fgDZYS4DhAAAAA==
X-Change-ID: 20260824-dts-qcom-eliza-evk-add-volume-up-a73c65710667
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WjnSN4eYaeg/OokN8ysVpLuHSHoJDnLkSXeZA64rmpI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjEsOUzHm/81OPvy6QElZfaW7M1BgEK6wZitTF
 6U5wcZCU9uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoxLDgAKCRAbX0TJAJUV
 VriiEACT1hsS69TJhLIj6Ysrzxo0in8P+m4tr6kpG3pt14MarSM/awphJDMw5lyLQtVpyVEza2s
 VmXcBrcv7cGHNam7WH3wutJ57o7pMiiT/b8IY9w61zrQvjt61/SAt4rPsJuWvDn5h87JqAI2dyc
 UOy1vehTCEDCG2u9x1Hopu93nFAefqG/1EYjD3Bf8CyWqW2FBTWONPI8NUE62Bc64jdyrWNClf6
 CN3Tr/4Ht+UoD/F1d0zcL2Krgx0qs/APrlGVEmoqjJh4efjCZ43KOUj0Sh85azQCd1uDdRHeAwr
 C78pgJd5c5uB5cBz10evVKoqrBLk86tHWl5w+82+BluYJ1XKW1BIjBmOMtZz5Dp8J+8Ol3DRcTp
 jvWg7TQ/KnWnUnNNlsxjGi3cdU1rLuskC3wuLWAsLrT4MmFLaVZomLlffjLx6bMi/EfFWPRRwCM
 HWTjKfqPUZ/ju57bEJK1EOhNMXggjcyAcch2H9Y8cOft0XJcXsFYY5RmDdoxWp4D5eR2WM/Mpru
 DU/KUvOVX0ZLYt8mTJxrRkx2AeDXJUl8GEBOdc6al73O7WCN3hdCj1Kbj/AQsCmLS1CFxZnSWp4
 cyMVG3aQPoRAbIz9/ZM5aLB+42Zi3tJsBey6uv1B8e1T7ZmTdMVCwk7k1kTP8uA316PCyjGJR82
 uH/aGQDWwP3xXUw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX9VLO3csuXgaK
 EDdonGxPUKZsBtrb3AKNe0zYKewMc+b9rxbAMd3fHXwKHUhNi+ZWN2cnk2F44xOAp9y8t0jVJnJ
 0L4EYn0e+PLvVdXDtDDADXKwg536+JA=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c4b13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UdZeibhIgzgOJuiBJ7UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2FsNE0mcV0vOhYqpGHOzK2ep5xkY4Dx8
X-Proofpoint-GUID: 2FsNE0mcV0vOhYqpGHOzK2ep5xkY4Dx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXw9PTXs944rTe
 TgRpptzF3C3vcfJ2x7m1luyoFy92P8Naf386bp9lOSPU1cVV87V3crLI2hRzj3wj9e44UjmFejp
 80LGSNNlKYdXjG+8jUAyl3Jt1j2eJBaHBK594wl+0QLWk5dM7RMRxqNbbILF/ew54Cw0sevvdIn
 D8ZH8cNGKvH9gff+ICStMsLH4kAXqNZ2gQ7pLn1oA7/nZ0TLiY0rJJFdN9tKYz9d4U6QOBVsn4+
 EJx56M7hXe7OplXCfr5gS5VwG9gjGLZH7sm4OnQ6r2wHKoV+W949uKNxjv0YBKt6q2rG09/AEbR
 SDXrygMDfb6cHtYzHFSZpZ1H6Q5Qk3fCBbqpJS85Q85bGtuMrCOKKcU+7kbqV2KLS0ctxPsjSTv
 LYcuZYLL9MkA9Y4+4VNPZbkJVNGlNtgbc80salvWkNuxesOPB8iMC663WipUafHuXUkLH9Acgmz
 0IVs+Bx238LHNqyRdIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240115

The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
and Volume Up.

Enable the existing PMK8550 PON power and resin keys for SYS_ON and
Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 5e4175291f05..2e7dd8dbaa22 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -14,6 +14,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	sound {
 		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
 		model = "eliza-cqs-evk";
@@ -83,6 +96,15 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &swr0 {
 	pinctrl-0 = <&wsa_swr_active>;
 	pinctrl-names = "default";

---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260824-dts-qcom-eliza-evk-add-volume-up-a73c65710667

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

