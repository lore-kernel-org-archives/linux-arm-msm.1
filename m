Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE346EF76
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809563; cv=none; b=GK9VaD2vEsJWLNRS8jmFwJuPFjvtm3oyWb1I7Xdu/A0PkOVX/u/dwb5/d3fpZXoTMTOwiIETygV31vttvM35PbpoS6tNqmQSkv07n0Fohz8S1kxN0g+0TcCQwnskW7HZdMsPAMY9h/9crSkP70WnF3+Xxpoqd0tjB81Tx3I60sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809563; c=relaxed/simple;
	bh=TNrAIXUuc4YXMvVsgFD4VJ92/fGFEn8rwLM/jlWfNKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m33NvRE79ihih/Rpo+bC572NDDjF95JxxpZ2AI38v3/lZiwMtiGiLBzzv60q3ax1fIqvSYKQIfW3JrA8c4eZHaKyD8wobVtA2TqAy4BOx3m6glb6l2yNQpQE1b9q9lZptUH4HdjCCs6DOrmMKg8Mof5o/ZyWh0Z0yCA06K2lzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcwMnYMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H225mOux; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcwMnYMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H225mOux"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbuK3668067
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ROn9+8ZkHxWuXe0MXT1wSr
	PfX1k81ekk5p5iywWFemY=; b=UcwMnYMAZFpVMwQrODs+xwJy6YDp5S4GiLsuC4
	V3kmVSGx9puwNHaMXkCsFk3eJ44n/IFEURr46BCLqhlSK1Ybxq9d1X1FIlnJQ4ir
	1mkttF2sYWjMtkx/jWbtB9PMlWPlPGYv6QIYpvd5+vcAOLMfhp2A/xnWSDK412QZ
	VUM+lFr4tWHfSSi8XeIIiLC5c0SXsuqJiFRFAV+l5isTO97454oOYhtyFrY5/Qqd
	INzL43M15bNojq6Bxf7zRONUznzPRgL0Sy5TbgEblkDpkbpQOElm+EW0pan9zS0C
	Lfo4s1oQhMrXI9NYAHtWu/puyejTza8ZPgzAMIal+soX5ZRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3659-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:26:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c075c1e25so9395291cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809560; x=1785414360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROn9+8ZkHxWuXe0MXT1wSrPfX1k81ekk5p5iywWFemY=;
        b=H225mOuxRdOC9YaRVSt24Z8EaEqyloK2SasV5tIdaAeSi/+X0V+EOrn2z4GdXaTiY4
         a+TZi8ZVGSchwVGwq0uAhAL0z0Rz6+WwZcJDikC97DCQMYahEMv0J8KfBP/qzBCOtn5h
         hO8NAgc+gVvqbCbZSJwFr9L3BebME1sROxCgs4Co/H5Wbe9+dv1+uXU6AKxbHbBDRZ+Q
         dTa4473BxOxWwTZqMJoyD+ijjmnVtdKxRqC3KVc4GBKA2qRYMCeTYHY0j/cRtD6ej1la
         anatkbFRfLt9+P7rMsA/QVMSJw5ufNysp+kYeoTe7EllUxFQXF4HJJNtD/i+wEJNBZUI
         NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809560; x=1785414360;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ROn9+8ZkHxWuXe0MXT1wSrPfX1k81ekk5p5iywWFemY=;
        b=gcPbU9cZ3tbeHqpcnZOj06iAX1idhCMHgwihkHVxBwbHgP3ZLL+TkCsn0vUD2AnFjj
         OG4XG8djzjAw/U7IZq55BrXVxyEAw5H3Xe8JR59uom5ra0H5dUrGK6dQYfAxeQrBbM/S
         z+Y9tngCdbHUNWpUZ0OfG+A5rZbLF3aG6kyG7LAl56PbGTkUXHxK6LNpF0lkQSXMSIon
         p+AtsFOoNouoosnq7zu3IJLx4drh1ANnTPnKuu6IJbCHlnP2bsm5BJxfpcyw1D1Ou1CG
         snJ+j23hYO6qyTh7T3A6KZCM9kNHMQOPK55m0+gpNLJAUqpqB0z8AXyBtsJziMqLZpRc
         WdKg==
X-Forwarded-Encrypted: i=1; AHgh+RpyKjM3qBYe9gmgXnBERRAfy1pcTZlpPccAxhwreLR04GcdK9IUKTAi37OmLI6Tjz3iJDeBOD4rVJ1mI4fK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5HUZqurLQs1Uz2NIYTr70mrfyu2+VEb7m31lIvK/vLbBVrrBA
	KhzSGMiDC3VtDE9Y90HJR2atQp7SM2YNfuFGSHWPAM3ZC2n+MpUCptGciMWGZxU5QxwI74fNS6/
	bYq0MXUW+/H2/ityGZ4mr2m+XQjoU6pqdC45XP3XWvHpXy6i2d2B5NprZv7pF8aP3K5R+
X-Gm-Gg: AR+sD10SnIz3tC945RmHkBbJyxC+GVcuwYjW3An5eo3wuOU/hlSX7LWYmhGKv3okbqU
	9tozJIsoBq1pCQ+4PiEYYM3lyJab7lPWVN3O+2gjzM9lF8pIGOiU/w/S+BZsRueEOryt/T0RsHh
	vhi3+ADa2yGOcMpShY7pSOiRljP4xdEBa7tT9NzIedRT3KmtMPjhE1vmzvo1RG2foTSCR3S2nm5
	460eLowJlg2r2ypylsqPG6kxoBoDT4SSP8luB3t4/1iE/9ucPTt9gHCQ2HjsWqP+Qqtwe805X0f
	SxwxvlvxdNCBwrRB3x4ixzBPEJYGMyQRtrMp7hrJxXSzjmMlxPMCDgSnfQ4e6QcGk9AP3gxnHgm
	cUDIxXQn4
X-Received: by 2002:a05:622a:1353:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-5283ded4093mr25973311cf.42.1784809560363;
        Thu, 23 Jul 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-5283ded4093mr25972761cf.42.1784809559571;
        Thu, 23 Jul 2026 05:25:59 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15236106f8f.35.2026.07.23.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:25:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Thu, 23 Jul 2026 15:25:49 +0300
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0IYmoC/4WNzQ6CMBAGX4X07JJ2EUFPvofxUNpFapC/BaIS3
 t2CFw8aL5tM8u3MJJg6RywOwSQ6Gh27uvIQbQJhCl1dCJz1LFDiTiZqC7ZnaE19AyrdU4O2Foz
 lBiSmaW6TvUkNCv/ddJS7+2o+nd/MQ3Yl0y+6ZVE47uvusaZHtez+V0YFEmKMKYkTjVEmjzVz2
 A669ONb6I9YYiN+6FD91qHXkaIYszyLjMIvunmeXzQEbt4mAQAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TNrAIXUuc4YXMvVsgFD4VJ92/fGFEn8rwLM/jlWfNKM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYghRySsmDr/RjBX4e9lAYsVYbFQeLFSXxmDGm
 tUcgkbXo9OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamIIUQAKCRAbX0TJAJUV
 VoY0D/0S5l6+ohb7sYLxZKLBEwKHchdUrsyQjtl8Pysggcw0IhSD/jCsDHsr0uhaMOSHtstfAw4
 Fb4uZfMOJRmLUEP41cDb3Uaw/K7o0NgKPGNs0oEy1zKrwNOdYa+dSRy7lLTNaJaLd87WQARUAPA
 Ehzhd6habwIhrq2BgX8c3LuE0ee6iCn3cER+7BY6efLq8mpJIKBhqU4zW6FOmtfqUqrdXTHMz+z
 VtXZCWctJKwoFOnjzzXEJgWBQMGbray7L4/o9LwCqNb3h/1OqJOXx0/lq129quotVa4H+1if6Th
 KBnmDSX3k9lD6wDOg9Sq0X8dHshE6nWEyRyxUZDcb8gJaB8afcnCUUSL0dXM10xHxSJTh8QZtbv
 3zCl+X5fSDupAnCivu6PVAb81jFPfzKO4V2ONvgupypB1ZSddsyrrktTYY3xw/7z9sJaaMg/ZGL
 1wIWPfTJBSRt0kVckxUg3GYidfgrqH9pkwotxOVkbdsZptmb7OseS8oUb6H+g12hVjgF2vUcqmc
 JNUfXoY+CYZF9u23WUZKxK2kQ2eiyu6cgpV9s/+c9gEPr9YuPvV5pAGNIDltGKAticB8aCuyUfx
 i3hh6JBDtu4zOuKjG7KKnOL9VbKIu/rPvOHNu+WQjXa6NA1znbs10A579EQrmfqJbokyJDygu87
 OvJgiCFWY3ZB+ow==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: zlGsdPQdGeTo3FsiZbK4T9Onzeo1HYZU
X-Proofpoint-GUID: zlGsdPQdGeTo3FsiZbK4T9Onzeo1HYZU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX5jGLzQzZ7Qqb
 DBGbW7/D18dNWBMw/QEjKd2qnw7dsVvQ/9JSm7jMsttsAQC2z2+SC9FKY+pPV+i0hCW90MqEE/m
 Ib+fUG9OrMATw+DeJe2JvK++F7mETAg=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a620859 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=l8yhyBgH5Rc5wHxOoCYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX8NpFx/ykNbpn
 y/NoUCD54st+GoBT+GHZVPhcdf/SKPRqSCeoGTJqoXFqKf+egevBx7kYuIj1BGH5k9HNWpHzJzm
 1EY/fETskhBJtS0d2GBfSKZ/irTyxeq0iKHHOk8yZKpq7LGiwfWpGI3kALqkEw3QS7ApV+1AFbO
 PL9Mu1QITL3lYRSKLtFbOg3rFO6BP2YmCDAT4FTRq4MXVZaIx67KBDJLQhrqCWNQ7MYuCumqppe
 82szDzKHP2e10qluv4r/br7HxrtEjSiHHt/neUMJh0yuj0FARjJYu547uY9B1mA4cekLkTS/ch0
 QduO8ahBg8+SrRDnOkRyGWhU11KmcI/d3WHQM8r3qP3vPM3NGJ5CIxy7anwfHqHBDocZP9rlZwQ
 XSqpWC5DE0mb1RWNFWKZ/bI9r9fJgvhEuZNroMV+zDtdwKUtCSuTm7N0mTKrtcNZK/E5y7+Uz9I
 4XFNFuM2R07eMciOIVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230122

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260722.
- Picked up Dmitry's R-b tags for MTP and CQS SoM patches.
- Reworded DTSI commit message to suggest that FastRPC will be
  sent separately, as suggested by Dmitry.
- Added the GLINK edge node.
- Link to v2: https://patch.msgid.link/20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 75 +++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

