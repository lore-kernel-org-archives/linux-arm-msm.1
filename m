Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE73B7767
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733368; cv=none; b=pHHZttWyvz0jeGMenwUPPKY41h1fe/m8zr7XJtJq0LOnZG0gEusgvt06rMg7u3QNOuluHJ/eIaJBj1PnQie5vrRneFx4vocNdiNLpBtD2PayTuh8rZuA/HgqypDl1ti9lJ0mNyRBr2KTOENmtwR7xDSELsfrIjyvLgUPXJKbdjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733368; c=relaxed/simple;
	bh=7g3Dvd7qk+tijKFffQKIIVlqQ47HbzV8Z5+cTp2uYQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tDHhthFhzUg3rSCGJE/sTpP1JvMO8/xRUul8h5kZkc/J6SfAOfE++bWnOG91NF88nPnBR9YDZLIAWNIJsFmuESu4gAEV/DAB/2K0qJAin5MBRPbpXXIkMl8aNZK9ZaK6WsWkaixIZ6f9IzVZFVQhvPN3xK5ivclrGgiwc+PLauU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNb8KyoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dudlBmPk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNb8KyoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dudlBmPk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S8E74097253
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZYyqcIYds8BcLkqY2VI1W0
	ZbXH39qOA7gUCVWcwc9Bo=; b=pNb8KyoX/dAqwF5enJkstetDdeVWiFWyvwzkF5
	bGyFiS0qntfRfNX0sJ4q/sceyYH7NzWg4K2SYIWucH6yUkIPetlC+9xTUpXNO+FK
	61UG+xyOLNTr0bzHWNlHhw4L8OMDw2VkYTWF7FzpSSy1rJuA9kS9uQWwhEnVmpgx
	V/zFZEObelm8pOsmgpl4Guu2kTasdaD+COUpcMPhKgzeHeqoDkkqBdVc13mPTxsD
	eeSgjH1eGJHoYm+gTkijs7N8w9o4C2hYWSq0Ya6dbFOlo3dFQ+YCO6bYN5hOoKC5
	gluVAFprgUc+6UN6NVcTPWPVcDIBu8exTEMYX9MiVpThFReQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcetyn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:36:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9077b4c35c5so13084716d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733365; x=1788338165; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZYyqcIYds8BcLkqY2VI1W0ZbXH39qOA7gUCVWcwc9Bo=;
        b=dudlBmPk5PkOCQYTfQTot4xOpJG2e2dc0xITluAFIeVBYGGoGHczjj/pBebHfI5Dzx
         vAwRTOFMakOJ5rk9MfE6I5hiysDOrLRcwdy8DOkBVNiDLQbHG5NErcpZ79PPj/YHaPTx
         TO6vc41g4qg8/80YYUY30sTd3Hq3EewYmC1m4Io3hkAGf4iK138CRYDM/0M799ybR7qk
         pNyqBeqHASH9cWeKKC+aZp7eNwKVPzp57ZP+673Fho4X9QeHBDW8vNDWWsWdLemcp4jo
         xMdjcbwp+kozfkfixoUfTiv1MBOV+iUSyHEBYERYkV/ij2UvXMpdl/6+6DuvJajAtYHp
         ZsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733365; x=1788338165;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZYyqcIYds8BcLkqY2VI1W0ZbXH39qOA7gUCVWcwc9Bo=;
        b=XsrHiADM6KeUWOKcIyzP4OCiRcQMVg1GHQBog2VSt9ZJedmvH47cGfVFQJbQqNpOwP
         O/Hxxqhww6rRGopa/BZqCYW7HfzAVkORGe3scDLiO1Pl6DR4sdGikt6wOcewfb4UwLCZ
         RcjcMSENFtFhZp8+nffxQz2LNwI6KqYH1AWe3db/CfY4rBCApn5S04hhnHyK1dvrGZuH
         SKyTe7AB/MfIiOk5M33ej5zglw85XVphGcVNBTBnDy4crg9Oml5rOTi5znPybuGkb3PG
         bnT1ZWmK7cwp+Qp/Im4mJ5Ng+nTHv0rN0ZbOTUKJSs+O3LfdiTlzw0oe1sLdKwBi1idu
         uoyA==
X-Forwarded-Encrypted: i=1; AHgh+RomhEmjeCfwZhwIsoEh58Xv7dhWmNZLe64DDu341ck8SCzjbYXms36zUNAA3q6fMHb6GeN3Dp/zz66z804a@vger.kernel.org
X-Gm-Message-State: AFuF++lVcEsFDmASxVsq3/Rg6Q5pl/pFUVFTmS7WLhr/NU+yFdiRzqA8
	/MQ18U2ElIbd1KGJlL10ItydpNMmHJqH2YCbyV6QbQ4vzVnElRIEQX6lSTAYIOIoAWKYjpmWO+f
	B33k9veDIF4rKkCsDfWiF3315AAQUsKM9+bSQieZ41ZuHOHhe1lKLvfWe+9ee9SzbWewk
X-Gm-Gg: AR+sD10bnCoRNR/hssGY7xrnj0r3GTpaahsiM8Injmlz1JNcscxV8QgGpLwBBhxX68G
	S/lO5Pa0NsXz7F7YRUd8h1joiLGRStigTODlv7MVRZC4BitrfTjtImPMb9PLuPS8D/rZUR1yfFS
	tFI71ZgmG5IBPDPqliLkij6wbWZRfpTMMq2IHqD/CWEYCNY6hRw2Go2JHe+8l0He8Z3D/8tg5ST
	MJv06qorm0uwHwio2h+0wyEVtUk/oAxApZoGeEo0XZNz7d6k7yjen+VQzSJFCuDByHoKIXWsFfP
	mikG9/McJgrV8SHeM7DdfYMPLd/qAi4G9h40v1RKOAutNLHuzLOs7S/eCTA613DppLpqOikOlf6
	8zq8Lt2M=
X-Received: by 2002:a05:622a:17cb:b0:51c:404:af7a with SMTP id d75a77b69052e-52e423648edmr55544091cf.31.1787733365138;
        Wed, 26 Aug 2026 01:36:05 -0700 (PDT)
X-Received: by 2002:a05:622a:17cb:b0:51c:404:af7a with SMTP id d75a77b69052e-52e423648edmr55543411cf.31.1787733364479;
        Wed, 26 Aug 2026 01:36:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88af72sm447146666b.36.2026.08.26.01.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:36:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:35:56 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuljmoC/6WOQQ6CMBREr0K69hMoEagr72FYlLbAV6DQD0Qk3
 N2CR3AzyUsm82ZjZBwaYrdgY84sSGh7D/wSMNXIvjaA2jPjEU+jnF9BTwSjsh2YFj8SpNbQIRH
 2NcxUgh5gaFZQ7QsmC7VSINKIy0zoMhEp87ODMxW+T+Wj+DHN5dOo6fAcjQZpsm49Py3x0ftDv
 8QQQxXpJItFlYlc3S1ROM6y9Std6IMV+75/AR6QMTkJAQAA
X-Change-ID: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7g3Dvd7qk+tijKFffQKIIVlqQ47HbzV8Z5+cTp2uYQs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjqVtufc4pG4nCrR1pbTEwI6KJ4qFWy1K561Y7
 cfCkHvGqaqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCao6lbQAKCRAbX0TJAJUV
 VkrQD/9tPwAoum+IVkpRhkKRk1rz0y3Ssq5t6+vTT3GL7tZ/5zSmf2sI3Sn/zyQ8sF9cmr9e5CP
 ejM+4CQ9t+7qN4JUZALrPoS+i7sq+eCU4R+gy4sf8ns3y10AruFVEP6QVUf7YGHBwuQIs+wHLs5
 L+hC8Kk3wboHTlgNxT6WnvUV9Q9iqQ1M0bvvzp30oqFhDfRqu5O1P168kLPOe5z8BpgthCTmVkr
 ySawH1vSgIBtOJyqXJijnCxhAufx+19adffAond0D/PdTDWmD6X9O5pQj5Gp0qBqd6YD2dl6FWe
 U+rMDDkScFhvUwspJrOA9wHklO+J/rJZXOadDfug4gFcEzqR4lsTIuL+E0lRa68zdNnvKQ96wT6
 QsSGz0mXWpOrwEeep77EOVD+Z54KmTjnZIVku0691XEwPVFxwUhzR4M2Kjkb31ni8OOKy9EiXmr
 HXbtp0lqnAyIIFXxoOgiQwr7Vb876Tq0nVWyxdAVLZidj24HWt+GrAj3YBUpFkyEUNA4ti2aHob
 LPAa4C7xZBUKqOmtD8h0vNXdQ//mtA7uIILNnhA/L5BhCWCOJ25+Nddq7LM91alCIEeg+3H+lNt
 MH/9TKzAVo6jXKsDjyP00H4xyrwy7RczpgQi3efpn6zLKuKvEZ+Vw3JdHl2z5ng40kpJfpuE1NO
 hizqq158hcfuvfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ea575 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rd9FvqLlLlobQhMCTiEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX1+a36zzElbiW
 P6j7Pzc59LWGMaTFrmfBJKABNWLOoqDYLujaYrX6p9dsZq8R1/AmsenklsPHjeOQpof+V7Blt/k
 nArrEM5T+b4qxaUU+IBxWZoDvhsPL3w=
X-Proofpoint-ORIG-GUID: WqvbLtzjy9lD1n-IdrZy0qhKAV2GSymA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX01/KnFkryXCY
 P0ZIkFHfEX++pSRRxo+Q/nM1WYvK9ZMXto4xMLQLdFUo3aBQL8UpuCkMLHRk3u1KiXylk4IDvz+
 BAhupLRjwWnY+wmIdd/WunDezrDTU0n6hnO9llmC4zKR27n6jdYchk7HTqUfU/SEyqrb7Br0CX0
 VqsUF9iMq5Qvt7zqvedrCnj4QENQRm6Tyq73edZvhKxufl4OZ2Rd0zJWueUMlfBG6gEd2s5tw44
 SSV0AtimSXtdvYNL9FGTHW+YYr+rECiHFrDOZDi9Pdmw45T2B+AbWODwQ+wC2svgWoYb23RRtts
 /nEalNModnoFWtWAnU+zPhPfVmggEKPZx8kcnZC8m8J9msi+bg48hD6G4sK6HeTCShSdMkDuqBY
 c/S1dEPHg7ttqxmDT95nY6w/CkMLneeipz+96X0fHr5EPGFi3S/4aVjha36A4CMb9XkrZdMuPBE
 ypwDopwob6kJZOFCsUg==
X-Proofpoint-GUID: WqvbLtzjy9lD1n-IdrZy0qhKAV2GSymA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260070

The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
the USB/DP QMP PHY. The corresponding GCC clock input was left as an
empty clock specifier when the USB nodes were added.

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Fixed the usage of wrong index. Was using the phy index instead of
  clock one.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..45853c11a03c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
-				 <0>;
+				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;
 

---
base-commit: 4b18edbd8e70f7e6860d56370f13244896d0f95c
change-id: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

