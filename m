Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488946E00B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249358; cv=none; b=fTNyKoKkvQrpO8WNYB1TXd5EQiNZHU+6cUEq1F34PlZa25dAdkIfWI8Wsh7qbBDd7V28ZredAiVuQPB1J9aNR9qGbApN1Gt+4ztPvkqqBwKVEzQABdi4ux//wdyoIG/KC2vmD6Dmkk28kTOm9NPFrOjgjOzKhX/mVCy1qnJccUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249358; c=relaxed/simple;
	bh=dTacV0jA6H6RnUGtB9UKHipEQO2CAl8UfOdLnBbuO/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9NgLawZ/Zv0R/0/d3TTdAH/IHOAGS5+CIMAE0L25UgjFUze7prJiQljHN9a6sMCbocbkNIkmfmue8dgfjjA82n/fgDGBqWJt85EDE0tvW2hI5MsDWGMfm44Q3AitEN5AuTFTAgJQKWqobnwe5Zr8p8WtojH68918iSRASDmuNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+ZCcJ3U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjxzPmKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+ZCcJ3U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjxzPmKW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Raf2322005
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0Bypr7RZInP7mr0MIMi3o2WciZ8bnllODnO
	mLVqQTxQ=; b=U+ZCcJ3UoGYoZTtiX5emjZgfpHKQeNXNPTLQ7FEVdHKLcj4lwfh
	4086++1wVInnWH8O3rQau0tKWZ/SE1q9ExIAHwt45n149kT+kC4IAI7j8NeLrRtH
	QTw5lYkmMwO2RbktaPKjw4MraN6n5XLwozTOebc1HY4XRCr9RG2HFZcfSOFCDEy2
	7hurqxeVpU/4RpHBhWJW4cJBed1aSAovvptw8TUe/Mpjwj3iWfg8pHcJ0hL37l/O
	PiRJo2MckuoE1Xy6mo/u7/oFry7AFIp12Qg9V3kaP5U2nUs/EHQlDLGn8zK1AjiW
	IIg3IhHc1PyT8P+dq93460sRST049ZwBqsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchasgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:55:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so6379740a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249355; x=1788854155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Bypr7RZInP7mr0MIMi3o2WciZ8bnllODnOmLVqQTxQ=;
        b=PjxzPmKWdRubfH1Z+39PEy5vwKvUtOpt1CdZC1ezNvc8BaPEugq2hibFcB2abTvEAv
         8Ny+V2XrlvKH9KTFh222rHukKmOwX/05oiDCNzgp0QvQ/ssndBm3bcHkR4QrVxEFErMl
         HJ4QXqXbauAurz2QuvJ5t/W+N99BwON+hCTw7xufFIha/aLie0sIJZ6Z5idmAChw0mm4
         3qDZbNW+chfdRkrqT/ja/vW1TpYacC4pAE//qm2XzSplw/Na5tA0W2nyvUdQoEXwfUtD
         RDNn1OozjDeKocEA4xroFFiNS6ecLK2yQvjt4er3sfdwl9I7qs254JHnfI0eXLvlygVP
         zWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249355; x=1788854155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bypr7RZInP7mr0MIMi3o2WciZ8bnllODnOmLVqQTxQ=;
        b=Dk5IVYQ7eWZ6sBcy6iY2i309a6eoq+JdcNeBhvnrD8AScgeageWAzJE8OCfhHU9NVX
         cIbZOd7gy8MkcezQyDt8a2JgwDx8whZmgSNvCzG+PIoOSaII873K0sYtUdR1ab+fKo2L
         LCkfqR9Ih8h2iI8SA4ED98Q8o3onlv71a3XlMMSDunXkbFIhoJ7bgxRoa1xCyRSITw6z
         hMTouETrX1w19crJadbUAiZmO0KleA29zjHRzSlNHwtfPdNBnbFcsiDb4EXKfCspwsYs
         QZdT0QgjvEMj0MavLgKpfcgAG/IzXaEvGx9rSrCNTkMN/t8t8LUZ+jezeB9QYIc+tx81
         ZD6w==
X-Gm-Message-State: AFuF++nMHJhK+yzAWUNv/mWtooWCV84/z9/mzXt/o27uqvguVb3mc4S/
	KXzL3EKEN6JG0MBK1vsMv3CDcMITU5ht+nrSBr9JXk9nYGh5AJfwOGjDHjZaQhLgV1diqCE9pZZ
	kaueZLyD/apGZ16algo6N8HtmKA+pdULRMiJdZg3Z9O/gYtENqbo+pMgQi6EUQ30IiifM
X-Gm-Gg: AYBFou0dRMAgA/rD2pVzsBzG1affaY2CWzDZeUqJ2rI/gj+N6lZYHFKI0WVXYqp1JaD
	rukmHjVgfJLEG6eEJ0cmIUh8gTknYI3cpgQGRb/slghzj3JlXqHBvaRC5d4ZobGxQ9+dPXTeV9q
	9eAAkAGaz8Gv5ex1US8H/kxQp6wVpLb7WB+egqCLeE6OPg9KeylhtNQbQg6KL3gk5c+WQgq+0cg
	S2AcSqilnl85TOBzwx4wHFqxkzy/s5+SC5NMhf7fMmpaDvA3xNrXARnQ/lW37OYN3VytPpbDRGV
	+bxS1Fuu4mgs+0ig7a1SIsEMz91uGvq50wRBCJJz/jtm2jd86l6P8SOv9WZi8XNqGE5eAl41vhl
	CW5GA9RK23qRPhiC79XlLbikJtH0zMVfqiHY6l1jeAeGJkA==
X-Received: by 2002:a17:90b:1806:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39907e1214amr8556336a91.22.1788249354809;
        Tue, 01 Sep 2026 00:55:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39907e1214amr8556260a91.22.1788249354202;
        Tue, 01 Sep 2026 00:55:54 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54873262c88.4.2026.09.01.00.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:53 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 0/2] Add psci_sys_reset2 reboot modes for hamoa and purwa boards
Date: Tue,  1 Sep 2026 00:55:44 -0700
Message-ID: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: b-qhufgF3G0ERwTsJQm4QJnX2Q0GYpL_
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96850b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q-Ld2FEWNN66yl05ryMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: b-qhufgF3G0ERwTsJQm4QJnX2Q0GYpL_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX8rvSRlsprw4Q
 M/7ggkaxVfTFOCspoTmk+ckEiq62Xn2n9ExRU2RP866NMmVO221sfS3d5hLksTiJa6d0E+BHX/w
 5hTtG1OHhh5JbMnZd1nUgOzKQz2nCZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX21S4N65WP0Jd
 91+5wjsowODTIM3HYBT60j457xIb8D4mFKw583X9/m4VK5C2AgpX8A/t1RV4Tg/kJqFTnxQ3ZbC
 JVNHTypFACbjn6RDSkm8TPsAbk3GNwtiDGZyi8uQi3aKyawwKeJDmDMuHIHJbPGmEuV5lj/KTXL
 0L1wCu4oNQJzEZ1Fa773SHcrUrGPoouNPC4lRrckgCDmQafRBvTDt0aBMhNRnHFAPKbekYtoAg4
 3K6xXfq0WItnJozLSBmWNsAvmbjZ6hxXFZWBExrnfHwCDltBDG19FrQjyNIujuqHB23Feds5frh
 fC56ZhRcC7hSEmqgkmSWHD5N53XHziM0lA+y4Z0xvI8rpHtTZM+I/60qZqtdfX/UOBEX0XHxhEL
 2lRlyMHgQygEt2ozGHlIAQ62Rs8QpfYlJpz2MD1CgV0Fh6hdDMUhZH8uDHem1FMFXxiLFW4wUc6
 8rRw2ErrmAZMtQAbF6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010069

Adding PSCI SYSTEM_RESET2 reboot-modes for hamoa and purwa based boards.

These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
https://lore.kernel.org/all/20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v3:
- Split into two patches: one for hamoa, one for purwa
- Move reboot-mode from shared hamoa.dtsi to board-specific files
- Add psci label in hamoa.dtsi to allow board files to reference the node
- Link to v2: https://lore.kernel.org/all/20260226054113.4156874-1-xin.liu@oss.qualcomm.com/

Changes in v2:
- Fix mode-bootloader and mode-edl reset_type
- Link to v1: https://lore.kernel.org/all/20260209042700.1186392-1-xin.liu@oss.qualcomm.com/

---
Xin Liu (2):
      arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2 types

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326

Best regards,
--
Xin Liu <xin.liu@oss.qualcomm.com>
