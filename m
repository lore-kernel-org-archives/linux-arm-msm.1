Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0451B4266AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412850; cv=none; b=MMi4v8ZsIxi3gXrkCRzbwrtmdSb7o9dnJgnonrWwX1WDfE452wqdCyyjZkdKZ+MkkEf0j/e0lbNfNt1oU3PO6Ksa+qiWJeGaTO1SGIucypyHfeGUwTHgy7a1kvRSvogAuNxwULj41OU9lyfM8zCSNBzO0JS5gemkr2fVvJDX1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412850; c=relaxed/simple;
	bh=9UxZt9xMHSYHTHGJxL65aZwn4DZTQspmhit1ukiKFHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FSFpPA62Y1SAJRHK2R7kIOteDl0ODBfclzUbMVK1UsKozPhWsrIivo2PFlTPvuTG+hzLWXGwfPo5c5TSayLnTXFsaZdukfOHMT1M0r6t2R6u9EovRItjWe8HRls2jSwKVY6SDjTgt7ml1TYk9RJOyRroR+uvxPaTsS2Hp56azT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEyOaFt2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlKLGjvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEyOaFt2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlKLGjvl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB8Dcl563518
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zGBMMPYWL5uZDW9KeNl7ez
	DQLOJYmti5W6EhFehsQVI=; b=iEyOaFt2h4PQ9aEueorlqbAyQhfZJf/zuODWiT
	oSmKoX13zr+yi38JB0NWzs0MYV0u2lPH/MESydjtm25e/+WhbwqW8aWt00NX/o/R
	1/EViVPIwv1EtNAjRvdTWu7aDwfNtfX+8uL347xDf8su/oZORay/d/g+sYk7jkCc
	Y/rPzd6KkSxCusIi1AB5JATLz/E6pWy/4XPOmixw2DntGvhp+nqisX8gs8+HjPHl
	CH8oXyF7KNJXOLYTOPANPWVg+fx957lzCc53UtzFnSTF4+t0AE5ptIOIA1VfMeEn
	LKj876lrVhEawPU+Xt0URhQPqD3ujzNHG0DRewmYxZ34efnA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5fjg5rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2949806a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412847; x=1786017647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zGBMMPYWL5uZDW9KeNl7ezDQLOJYmti5W6EhFehsQVI=;
        b=VlKLGjvlO+Ulp7S8ZpbqcBjFswPybWfYb5eQzmDmcl7Cma87+hSfPEyNCBeugyZ4QM
         1HM+toPNNwM4YYXR3dFc/hG1bz1PHfkFixUJBhRydBb3bumb6xoCvw9vjnY6wwso6swu
         KsmRlQmn31odtP6ci0vOJrVifmvCh9dwvwtgOCwUfiJDlpdC7m3sW/I4dvqaGVV3v2uo
         1W8MnLvST8QALr4uAYSHGx4U2/84Ut2ILtPnCPhSAPvrOZdRhGlhn3HSx5K67xcy+tsi
         CbE9d+nfIUElzEBRc4gWobeWwm6F0PhkX9D6S2wJz9Vwv5QdrotdJ1z4EUZfbsnyaXBu
         6bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412847; x=1786017647;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zGBMMPYWL5uZDW9KeNl7ezDQLOJYmti5W6EhFehsQVI=;
        b=Db8sLipL9uPQYTfukYeJjpq0k0mXS/hO8f+H1qJXvVY+XI40ARMsUIgtrutHq0LYJf
         4eob0Xh7+LNPc7yguFwi0p2O89ZPMy84TClUYYUUyapA7cuSdazfCggnHI/BuBx5Kep8
         8Zz2VLsRiF83ND6IsBJxvNroJzVQykSxRn8E9nA43Fvw/Fc43xQJ9Yjuxrik5uGvctBQ
         4O4ZdWc8GdhMIJcT2Jv5XAwrPgQQailAHeCwbEL+/NUPSVR09WZM6fCyarm3BwmeIvXQ
         BFyCqvu8dwbsAlhjxdI6x3yRfhQsUJVQb8B2QlNYvh0AJ/oJZPNo9FCGW2b9Q5uhe7Vq
         42dg==
X-Gm-Message-State: AOJu0Yws1UZECoL2ZC6FTLvXt7iwaYpKJV4JXiLL9l1Mz0QeHD7Bh60Y
	NJmSxFM8JiDa12KOW0kytCxDdb4csZQ0PTbYAQdIBVBwOJnP2XgdjxwoKfMvaMQTItNJCseIDF6
	afLJbrSQPJ0H8T46Ui5BVMhGsKk39Ph5699sXKqagkMm5AD9pprvayy7qjoMcxDBYHbmn
X-Gm-Gg: AR+sD12vXsqliRbUG2s7bSCgM9xBhuK7hlLuJ2QapnJW9sRtsviO8yWstKSdACi70HR
	WcrzL59I5GriuBuVxW/riRlUrL1IwXJ11EQCSS6FLaxroxCEsMHmRTiuAVYzXac/QCt5EMykmCj
	BUwv6RpWk2VrtynXaObzKRjh3t06wHHtVMKA5gRq/MN5jHYa+qig0LuiOUSy9E4xmqZORPiqIRz
	6pgj8W+EGaMGQRi2rMqeOUQhhx4udBrw/70nX8C3WaoWu1hWWSrRXvm+YrlktOWCfz6snoRGmSp
	fUXZ7SpUQRE+vrOFMqbvj/kCdno3eTZj1F3AiyNswpOS/YSCQUMSVx4OSgUJoCGllw+WxjijxSF
	Mqef686zgSv7g+5T9SZOq35G78ZYhNKb4vBI=
X-Received: by 2002:a05:6a20:918e:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3c9006ecd7bmr2364700637.12.1785412844324;
        Thu, 30 Jul 2026 05:00:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3c9006ecd7bmr2364480637.12.1785412841924;
        Thu, 30 Jul 2026 05:00:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13f9a041e36sm7822776c88.7.2026.07.30.05.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:00:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v7 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1
 with M.2 and TC9563 switch
Date: Thu, 30 Jul 2026 17:30:15 +0530
Message-Id: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANA8a2oC/3XS247TMBAG4Fepco1XMz7GFUK8B0LIhzENbLZtn
 EbAqu/OJEHIK+hNJEee75/M5LWrNA1Uu+PhtZtoGepwfuGDe3fo0im8fCUxZD53EqQFK72g5+F
 X+ELLd2GLAtvbiBZLx/cvE5Xhx2Z9+ryf6y1+ozSvwJ8bE11vHDLv17pLmNOJI44HTwi5RFIWv
 MaUQwIFEEJBq1B7Z4w3svg96W9VoZQI0IEyGEMBSJH6YqMCmTFT0dn7GEt6W+VdyjZF7U3JGT0
 XZHKcrQ0VJUkHq3pKfqsaqdawjeF4eL9PQYHIcxXXdB73cYhxvoh1JCFncRmHVMWCAkXRzEFxq
 e/jx3OtT9dbeOaq8YkfH1Y9hkpifTPMx0NOxpMuFHzuu3WCp6HO5+nntpwFt4FtHfDnNnvgKBD
 OSq01xOxs/idqwxbZAn0LSAY420ttE8WADwDVABJbQDHgZUQA1RdUjzrQLfCmA81A5l26Qoa7o
 AeAaYH2X1wMAxqdh2CC1PkRYBuA19gAdgWAEsmsFKL+D3C/338DQU0VPTADAAA=
X-Change-ID: 20260629-eliza_evk-6f30686b161f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785412836; l=3699;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9UxZt9xMHSYHTHGJxL65aZwn4DZTQspmhit1ukiKFHI=;
 b=Bui2klLzrQRtPneFg+7koP2UUCyuJdToNmjtHYkB8v6ayXa3T1fKig8+wyGnxCetlgZzWH/L2
 QKJ3WkRm7LXDnMSwf5NTn3LMgN28IWJYuHHMiqA5YvU/edBO1moMPer
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: s4W0ynHkMqG4dUmlx1asl7gI1x1_V_gB
X-Authority-Analysis: v=2.4 cv=TKF1jVla c=1 sm=1 tr=0 ts=6a6b3cf0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=7FPx-eIICnbx9kjoaAIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX3cYqRI+/ZK1Q
 PZCmDc2igz8hwUVjvI22X35++w70iVQ22HMPsrHjlpbS1HthrSCz3nM7a9yHVh7deD2k+/JaSdd
 ApRS3ZsDrPpi5drQn/IlxtVXuzLOP8YOhoLBlbkDanma3S/oxtQt74BI3zXkTf2GBHTdPjYmnIa
 HEY+hy188X/gyo18dWcumutRERR4Gg2qspGSJAYBCnyVmw13N0ac2KjKbysS4BQm0NBqX/Q8q0B
 D9LtFUrf1BZtU82fNuYSUTRxV31q12gA8ny4q9+Itxh0L15pT9XkOgtTXEZYnOwoke1Zv9ImB8Z
 JDQ2GUz2ll4VuSecerFw3WaTkQueobG6Y6qHlHHYLfW+wJUPIq/LOJiAobfCI1XXvCQ3ZdFEllv
 UeBSFhUvH38HU+ngIHj6XSO5PFBU5pzCRHNO6xMXIpgy7nIvFhKgkL1D5szKwHWmBlHrQRamZd7
 CwWB9QbHEByVZSqKXKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX5TNJRQEKQken
 8XLfYeADQBJy6RYs1dfmeoj1o/lWDRgzz4kARYaxSnTLPD4ixI/x/mYRtT2kjNWoJfqr0IQZprT
 gU88I3fuZX3jh1Wegggk7sXj7d0VKvc=
X-Proofpoint-ORIG-GUID: s4W0ynHkMqG4dUmlx1asl7gI1x1_V_gB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300090

This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).

The Eliza EVK exposes two PCIe ports:

- PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
  via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
  (connected over PCIe) and a Bluetooth device (connected over UART5),
  modelled with the pcie-m2-e-connector binding.

- PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
  management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
  PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
  the RESX# pin. The iommu-map covers all downstream switch ports
  (SID range 0x1400-0x1408).

The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
entry is added to the M.2 power sequencer so the serdev node for the BT
UART interface is created on PCI enumeration.

This seris Depends-on:
  https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
  https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v7:
- Change the pcie sub nodes under dsp3 from pci to ethernet (Sashiko).
- Update the iommu-map to 2 cells from 1 cell (Mani).
- Link to v6: https://patch.msgid.link/20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com

Changes in v6:
- change 0 to 0x0 & remove num-lanes property (Mani)
- Link to v5: https://patch.msgid.link/20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com

Changes in v5:
- change from pci to pcie for subnode names (konrad)
- Link to v4: https://patch.msgid.link/20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com

Changes in v4:
- Added new line and used pcie port names as pcieN_portM (Konrad).
- Link to v3: https://patch.msgid.link/20260721-eliza_evk-v3-0-92b10038f13d@oss.qualcomm.com

Changes in v3:
- Clubbed pcie nodes to this series (Bjorn A)
  (https://lore.kernel.org/all/20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com/)
- Added comment for PERST (Mani).
- Extended ranges property for pcie1 (Konrad).
- Link to v2: https://patch.msgid.link/20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com

Changes in v2:
- Drop patch 3, as this is already applied
- Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
  and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
  pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
- Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 221 +++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     | 413 +++++++++++++++++++++++++++++++-
 2 files changed, 632 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-eliza_evk-6f30686b161f
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

