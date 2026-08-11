Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CC443D4F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445957; cv=none; b=bNljoeHdx9lCW2rLUzXoeQcIHndLYq5oSv/wQeIZsCnvC0WISDpOYH5t4Ou3ClCGzuHp6rk7HytZ/rMRqJTcjWN90Pqos3eX8Zi9xUmMvjfJRRgrYslWk1BA1+pL3vRX2mKh7XcKGT+zxY65dG907FkvFkeVAoC9xSiu8UOOU34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445957; c=relaxed/simple;
	bh=DWzCfeez1fUfPlZJGLKLcByycNs4DBvffFnJkEmwyvA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G9h+jniJ2XCKHKDi5ryvN3VaspSZrfbI4OXhRfIjQt7/mvL19igPQWwhbFSX6bO9NDhP49thQpsWqLQjWYlrVAqWZJuJPSiqGHp25SYX2hL22nJ3O3C+xcMb/Y36j/shMUGhYxRLHVVEBdshQM3pQAe/jaj5nnPP4IWUDmaPYek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J12IOfy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBam7xJD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J12IOfy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBam7xJD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAMj0q3781049
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+gDmkLnIGDiTgLxR5N5KJf
	8I80upPO22KQIx5QqtaeA=; b=J12IOfy5fOcRz4B9OHdoBfEg1EX8gz/e15ZFs8
	/NqO5fogxoMd2howYorZAUvq/sDBrSvoDlhffXkESOKqiIM+2zj2zR+71Tju3jYl
	MeOOO45GFD5m2pW/BwCPLUCY4T1qI8oMukJl6xbz8F+gKPcuW7bANKBteK7KxMx/
	yIG2YsS0c7Df2VyWS0qAfrI4OscgP3Yvn5v89RL151XYd8/mHxnSP2nqVYpMh761
	8giYrkD0k30LxK8Io6bnPjL3dhikrytSp3/kIiUd0lFIr8DdhVB3G/HRVmXLxfiY
	cBstgUjyiOD5pcnU+jUZ9Jcnd02Gbw73Bd9hh48WZK4eD3Wg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7bsek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:59:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e048a801dso4196660b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786445954; x=1787050754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+gDmkLnIGDiTgLxR5N5KJf8I80upPO22KQIx5QqtaeA=;
        b=MBam7xJD3osnw/w2IQa7v+p+1F/MSm502YAEsN9sUGxWpCIY932McAtCMu3zY5T6/l
         8KNsG7cN49KuucO+6F7N411LOFVfSxY+zpFPDPBDopExzgQu7czWu99W2yiHleXku2TV
         tUKPypjQnoInhW+j8m76riIXMZ9zz6hTSP2C+UieGI0kqwrOdtk+exuQ2Cxb2uPTK0J+
         J90LkNEJv9StqddayQwv/2SSiSdE23bffQSnNXPPEPCPjm0kR9KRopZh/WurSwMRg/Uz
         zSeMzB9OkJG1KJheFXCdN33kR2mm2K5YwvbaiXOaGrl+p5xfnCPr0t1bHbcpn9jSfGxx
         bLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786445954; x=1787050754;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+gDmkLnIGDiTgLxR5N5KJf8I80upPO22KQIx5QqtaeA=;
        b=hkB1lEynx2a8xq+bOc8D85AsXzk6ps6c3hJ/A0YhDfjbLtCjqsij7Wa2ussuyW6wxP
         l64GU7DVfObyMQEMfIeGyJf8KyFRPIwltoSZojHDn3P331GwL122XjprSP0AuMzOazIr
         vGk08WNBvI8cNqS+vi2VcBNu+o5BOjOxeE4lsBRyqQ++Qj0ABmFR5cAWe4aFFSALfXC4
         dZsQicEEMpomRGOHgx8yT7BDqPYAUovswuX3okLs1iOXDZD914VN66BedKZC21K6bt0w
         5FF7uSfH7WTH8DCidRBP2vaPlkobdePY+6EWXvtYRcvI7mMFZvrcKYiyEWKyvGTrVNTh
         mjiQ==
X-Gm-Message-State: AOJu0YwSRtqbc8hlQusFoCH0Jxy5XZjOdyeNST5oQISk7cu1xjBijmkl
	joSSFikNkla6uRWHstP0qxCfoG4maO4niE6z8O5677f/V+Fv1hAK2/H/waLZy75rqHHq64qhpbu
	s54aeueQSy9GcskV79MVDW5j4F2JW9uavytiLuIvGt50MYXS3Ck4N7BYX1spqIGyI3O70
X-Gm-Gg: AR+sD13VF0mvCT6Hcg4fNoTA3efdDMVUpeBTWGR+k0LG/oa9pcuhO/TmXN9PbsscmbK
	AJ/ibBdTgBdiGt1c/T0nL7IElUlWVeu03O/K7m9J26o6mwy+vgbyYcxUcHeOg1nzxcy8ARlRq9V
	kAgfOB2zy2R/x6R1pswlWYkOVfNi8exMKphDIbkLjML4hR4qAjVEOZakxja2eMvzl1d/mnhkd58
	O12GKLWHO4duTh5cULokYlKJk3gwtHDU3AOrInO25U/yuGjFpzmvbhjRTxtB5rgi1EX+ZirbwfM
	dt4lxJXxf6mQ07dXdAROrI8nwXDeqKQJ5QsFy9+CWFw4HUlfR3JjyG9f2701wDpCYLiG/Qg/5qe
	mUfxUWn6T4+MlWB+p8qR++lRKhyzk6yqUSlG9n802YiQBfdrNPNk4MmgRqOmJwbSYjOVeqw==
X-Received: by 2002:a05:6a00:3d51:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fa8694ccemr2442017b3a.13.1786445953650;
        Tue, 11 Aug 2026 03:59:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d51:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fa8694ccemr2441957b3a.13.1786445953035;
        Tue, 11 Aug 2026 03:59:13 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm529322b3a.30.2026.08.11.03.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:59:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Add DT Support for USB on Shikra
Date: Tue, 11 Aug 2026 16:29:06 +0530
Message-Id: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoAe2oC/yXMQQ5AMBBA0avIrE1SJYiriEW1gyFBOohE3F2xf
 Iv/LxDyTAJVdIGng4WXOaCII7CDmXtCdsGglc5VmSS4S4sy8OQNHgVqZ5VLTWdTl0FoVk8dn9+
 vbn7L3o5kt3cC9/0Au0vvY3EAAAA=
X-Change-ID: 20260811-usb-shikra-v7-2dc0d3afc3d4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786445948; l=2919;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=DWzCfeez1fUfPlZJGLKLcByycNs4DBvffFnJkEmwyvA=;
 b=C+JtfQnylzIUfUMUm8Yj+agPdMFeSpFBVTaJtvcAFovBIa292/kJkOgLMlBYGc04SbW4gkk2s
 +6hVbS8JQnVCo8olnrFbbOjDQesRcWTAYTiZ53XxtOKoiqRzZf8TS83
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7b0082 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=_AVwzdTWJwZJkuAtZNAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 8nTMOYWvJqRFF4pZnlPks6AEjDNssbPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfXw0V7Kko/9D5k
 tiRwuLm2/Blk3NQZc4F3dM0wgsiyhIS9sxa231txCb29Y6nc0I0bS+nstKQETnT8VHM2zhPLJvE
 Fj5yw7JWE7hkE7JM4tMjzuK6QeO+bYFAz/g5QCgmzaNH9zk793mbCcXUxHESesJBy48KqLbepqR
 1QxjR75HBEJ0t3GcZdLCOC7Kd4EZSs9ivY3XyPzAYX20LLkIvCrB7NDPMj7io0s+HVqqr41cv/Y
 ZuUwjP8oMgA7j+P96CleN2WXy0xsNJq1GMezWyn3ujALJVzw0xyf41R3pokLc7A1O5iZhyLI+nu
 eG2VAurHBDj7r9di9UQGZVOwlGDAZ2VwJAWUtmAmuZK3QfDr+YeRMuShT6Q2aUF93EI1jgvdxid
 cnD+V5k4446u+fR43FtM6XJIQvF10biDN4fH/Xiw46TqOzGcjTRN/YmdNBltLK0EQ7Z8a7pyXaH
 Aj1FrcLYAqWH3GrdpqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MSBTYWx0ZWRfX5vQkoQLtfT30
 xK/MjyzPfzsFbWUw4hPOll9mids7cPw9d40gelWeUY82RjTPDwcIley8yvjb40e3UKDHB6lRCyy
 hH/CkxwvKmGVcW/mpi/lYj3Cr/qIf2g=
X-Proofpoint-GUID: 8nTMOYWvJqRFF4pZnlPks6AEjDNssbPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110091

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series.

Changes in v7:
- Rebased on top of latest for-next branch
- Added Mani's tag from cover letter to both the induvidual patches.

Link to v6:
https://lore.kernel.org/all/20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com/

Changes in v6:
- Moved dr_mode property to shikra-evk.dtsi
- Merged platform specific changes into one patch

Link to v5:
https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable USB controllers on Shikra platforms

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    |  12 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  23 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 233 ++++++++++++++++++++++++++++
 5 files changed, 314 insertions(+)
---
base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
change-id: 20260811-usb-shikra-v7-2dc0d3afc3d4

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

